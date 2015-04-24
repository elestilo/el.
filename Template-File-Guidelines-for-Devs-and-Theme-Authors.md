[Template files in WooCommerce](https://github.com/woothemes/woocommerce/tree/master/templates) are in place to allow modifications to frontend code without editing core.

Each template file has a header which explains usage, and a version number to track the version of said template:

```php
<?php
/**
 * The Template for displaying all single products.
 *
 * Override this template by copying it to yourtheme/woocommerce/single-product.php
 *
 * @author 	WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */
if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}
```

## What Should be Included in Template files
These items are okay to be included in templates:
* Hooks (actions and filters)
* PHP loops
* Template functions

These items should be avoided whenever possible:
* $wpdb queries
* Any complex data handling code

Data should be passed in when calling the template file. [wc_get_template()](https://github.com/woothemes/woocommerce/search?utf8=%E2%9C%93&q=wc_get_template) can be used to pass in variables. Example:

```php
wc_get_template( 'template-file.php', array( 'variable_name' => $variable_name, 'variable2_name' => $variable2_name ) );
```

## Overriding Templates
This doc shows how to override templates via a theme:

[http://docs.woothemes.com/document/template-structure/]

## Changes to Template Versions
With minor tweaks to template code, this version should be left alone. **Major changes, refactors and fixes should increase the template version to the version of code the template is shipping with.** This is to ensure users are notified when running an old version of the template via an override or theme.

## Bundling Templates in Themes
When including WC template files in your theme, **take only the template files you need to change**. Do not bundle all template files as it increases the likelihood of bundling an outdated file during major updates.