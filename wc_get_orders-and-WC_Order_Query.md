## Description

`wc_get_orders` and `WC_Order_Query` provide a standard way of retrieving orders that is safe to use and will not break due to database changes in future WooCommerce versions. Building custom WP_Queries or database queries is likely to break your code in future versions of WooCommerce as data moves towards custom tables for better performance. This is the best-practices way for plugin and theme developers to retrieve multiple orders. `wc_get_orders` and `WC_Order_Query` are similar to WordPress [`get_posts` and `WP_Query`](https://codex.wordpress.org/Class_Reference/WP_Query). Just like those, you pass in an array of arguments defining the criteria for the search.

## Usage

Here are a few examples:

```
// Get orders from people named John that were paid in the year 2016.
$orders = wc_get_orders( array(
    'billing_first_name' => 'John',
    'date_paid' => '2016-01-01...2016-12-31`,
) );
```

```
// Get 10 most recent order ids in date descending order.
$query = new WC_Order_Query( array(
    'limit' => 10,
    'orderby' => 'date',
    'order' => 'DESC',
    'return' => 'ids',
) );
$orders = $query->get_orders();
```

```
// Get orders from the customer with email 'woocommerce@woocommerce.com'.
$query = new WC_Order_Query();
$query->set( 'customer', 'woocommerce@woocommerce.com' );
$orders = $query->get_orders();
```

## WC_Order_Query Methods

**get_query_vars()** - Get an array of all of the current query variables set on the query object.

**get( string $query_var, mixed $default = '' )** - Get the value of a query variable or the default if the query variable is not set.

**set( string $query_var, mixed $value )** - Set a query variable to a value.

**get_orders()** - Get all orders matching the current query variables.

## Parameters

### General
**name**

Accepts a string: the order slug.

```
// Get orders (probably at most 1 order) with slug 'order-may-05-2017-0900-pm'.
$args = array(
    'name' => 'order-may-05-2017-0900-pm',
);
$orders = wc_get_orders( $args );
```

**status**

Accepts a string: one of 'wc-pending', 'wc-processing', 'wc-on-hold', 'wc-completed', 'wc-refunded, 'wc-failed', or 'wc-cancelled'.

```
// Get orders on hold.
$args = array(
    'status' => 'wc-on-hold'
);
$orders = wc_get_orders( $args );
```

**type**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**version**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**created_via**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**parent**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**parent_exclude**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**exclude**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**limit**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**page**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**offset**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**paginate**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**order**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**orderby**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**return**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

### Price
**currency**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**prices_include_tax**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**payment_method**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**payment_method_title**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**discount_total, discount_tax, shipping_total, shipping_tax, cart_tax, total**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

### Customer

**customer**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

**customer_id**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

### Address

**billing_first_name, billing_last_name, billing_company, billing_address_1, billing_address_2, billing_city, billing_state, billing_postcode, billing_country, billing_email, billing_phone, shipping_first_name, shipping_last_name, shipping_company, shipping_address_1, shipping_address_2, shipping_city, shipping_state, shipping_postcode, shipping_country**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

### Date

**date_created, date_modified, date_completed, date_paid**

Valid values

```
// All orders
$args = array(

);
$orders = wc_get_orders( $args );
```

## Adding Custom Parameter Support

**TODO**