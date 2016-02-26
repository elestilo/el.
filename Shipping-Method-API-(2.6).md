This guide covers how to create shipping methods with WooCommerce 2.6.

In versions prior to 2.6, each shipping method could only be used 'once'. 2.6 introduces 'instances' as well as shipping zones, which can contain many instances of each shipping method if supported.

Shipping methods can also now have 2 levels of settings; global, and instance settings. Instances inherit the global settings, but can then have their own settings which take priority.

## Extending `WC_Shipping_Method`

`WC_Shipping_Method ` extends the `WC_Settings` class, but also has some of it's own settings functions to support instances.

### Properties

| Name         | Type          | Description | Example Value  |
|:------------ |:-------------:|:----------- |:-------------- |
| `id` | string | Unique text based ID for your shipping method. | `flat_rate` |
| `instance_id` | int | Unique instance ID of the method (zones can contain multiple instances of a single shipping method). This ID is stored in the database. | `1` |
| `method_title` | string | Title of your shipping method. Shown in the backend settings screens. | `Flat Rate` |
| `method_description` | string | Description of your shipping method. Shown in the backend settings screens. | `Allows flat rate shipping.` |
| `supports` | array | Array of features your method supports. | `array( 'shipping-zones' )` |
| `enabled` | string | Stores whether or not the instance or method is enabled. | `yes` |
| `title` | string | Stores the title of your method which can be used on the frontend. | `Flat Rate Shipping` |
| `rates ` | array | Stores rates which your shipping method registers. | `array()` |
| `fee ` | string | Can store optional fee amount added to rates. | `20%` |
| `minimum_fee ` | string | Minimum fee (above) added to each rate. | `10.00` |
| `instance_form_fields ` | array | Array of settings fields used at instance level. | See WC Settings API. |
| `instance_settings ` | array | Stores setting keys and values for the above instance form fields. | See WC Settings API. |

### Methods

| Method       | Description   | Accepted Args | Return         |
|:------------ |:------------- |:------------- |:-------------:|
| `supports( 'feature' )` | Check if a feature is supported. | string Feature you're checking support for | bool |
| `calculate_shipping( package )` | Called to calculate shipping for a package. Should use `::add_rate()` to register calculated rates. | array Package of items to ship. | void |
| `is_taxable ` | Returns true if the shipping method is taxable. | | bool |
| `is_enabled ` | Returns true if the shipping method is enabled. | | bool |
| `is_available ` | Returns true if the shipping method is available (enabled). | | bool |
| `has_settings ` | Returns true if the shipping method has settings. If this is an instance, it checks for `instance-settings` support. If not, it checks for `settings` support. | | bool |
| `get_instance_id ` | Returns current instance ID. | | int |
| `get_method_title ` | Returns current method title. | | string |
| `get_method_description ` | Returns current method description. | | string |
| `get_title ` | Returns title to display on frontend. | | string |
| `get_rates_for_package( package )` | If method is valid for the `$package`, calls `calculate_shipping` and returns added rates. | array Package of items to ship. | array |
| `add_rate( args )` | Adds a rate to offer the customer. | array `array( 'id' => 'flat_rate', 'label'     => 'Flat Rate', 'cost'      => '100', 'taxes' => '', 'calc_tax'  => 'per_order', 'meta_data' => array( 'meta_key' => 'meta_value ) ) )` | void |
| `get_taxes_per_item` | Calcs taxes per item. Used by `add_rate`. | array of costs | array of taxes |
| `get_fee ` | Calculates a fee based on total cost. | | float |
| `admin_options ` | Outputs global or instance settings. | | void |
| `get_option( key, empty_value )` | Gets an option from the settings API, using defaults if necessary to prevent undefined notices. Will return instance setting value first if the option key matches an instance setting. | string key, string empty_value | mixed |
| `get_instance_option( key, empty_value )` | As above, but specifically for instance settings. | string key, string empty_value | mixed |
| `get_instance_form_fields ` | Gets the instance settings fields. | | array |
| `init_instance_settings ` | Loads saved settings values for instance settings. | | void |
| `process_admin_options ` | Save instance or global settings based on current instance ID. | | void |

### Example

Here is a basic example demonstrating an instance based shipping method class.

<script src="https://gist.github.com/mikejolley/3b37b9cc19a774665f31.js"></script>

https://gist.github.com/mikejolley/3b37b9cc19a774665f31

## Registering your shipping method

To register your shipping method for use there are filters which you can use to tell WooCommerce about your shipping class.

### `woocommerce_shipping_methods` filter

This filter lets you tell WooCommerce your method's ID and its classname. Use this to register a method for us, like this:

```php
add_filter( 'woocommerce_shipping_methods', 'register_test_method' );

function register_test_method( $methods ) {
	$methods[ 'test_method' ] = 'WC_Shipping_Test_Method';
	return $methods;
}
```

If the method supports instances and zones, users will be able to add an instance of this Shipping Method to their Shipping Zones via the admin UI.

Whilst this supports an ID and classname, you can also pass an already initialised method to the filter e.g.

```php
$methods[ 'test_method' ] = new WC_Shipping_Test_Method();
```

### `woocommerce_load_shipping_methods` filter

In most cases, woocommerce_shipping_methods filter is enough so using this filter is not recommended unless you have an advanced use case. 

If you need access to a shipping `$package` first for any reason, woocommerce_load_shipping_methods gives you the package and you can manually add a method class to `WC_Shipping::shipping_methods`. 