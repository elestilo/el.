<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Creating new endpoints](#creating-new-endpoints)
- [Manipulating the menu](#manipulating-the-menu)
  - [Adding a new item on the menu](#adding-a-new-item-on-the-menu)
- [Manipulating the content displayed on endpoints](#manipulating-the-content-displayed-on-endpoints)
  - [Default WooCommerce endpoint hooks](#default-woocommerce-endpoint-hooks)
  - [Adding content to an endpoint](#adding-content-to-an-endpoint)
  - [Changing an endpoint title](#changing-an-endpoint-title)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This guide covers how to manipulate the tabbed "My Account" page endpoints found within WooCommerce 2.6.

## Creating new endpoints

First you need to register a new endpoint in WordPress using the [`add_rewrite_endpoint()`](https://developer.wordpress.org/reference/functions/add_rewrite_endpoint/) function and also register it via the [`query_vars`](https://developer.wordpress.org/reference/hooks/query_vars/) filter.

```php
/**
 * Register new endpoint to use inside My Account page.
 *
 * @see https://developer.wordpress.org/reference/functions/add_rewrite_endpoint/
 */
function my_custom_endpoints() {
	add_rewrite_endpoint( 'my-custom-endpoint', EP_ROOT | EP_PAGES );
}

add_action( 'init', 'my_custom_endpoints' );

/**
 * Add new query var.
 *
 * @param array $vars
 * @return array
 */
function my_custom_query_vars( $vars ) {
	$vars[] = 'my-custom-endpoint';

	return $vars;
}

add_filter( 'query_vars', 'my_custom_query_vars', 0 );
```

It will also be necessary to flush rewrite rules using [`flush_rewrite_rules()`](https://developer.wordpress.org/reference/functions/flush_rewrite_rules/) on plugin or theme activation, or to re-save permalinks via Settings > Permalinks so the new endpoint is active. If you are using `flush_rewrite_rules()` on plugin/theme activation, make sure the endpoint is added beforehand.

Example for plugins:

```php
/**
 * Flush rewrite rules on plugin activation.
 */
function my_custom_flush_rewrite_rules() {
	add_rewrite_endpoint( 'my-custom-endpoint', EP_ROOT | EP_PAGES );
	flush_rewrite_rules();
}

register_activation_hook( __FILE__, 'my_custom_flush_rewrite_rules' );
register_deactivation_hook( __FILE__, 'my_custom_flush_rewrite_rules' );
```

Example for themes:

```php
/**
 * Flush rewrite rules on theme activation.
 */
function my_custom_flush_rewrite_rules() {
	add_rewrite_endpoint( 'my-custom-endpoint', EP_ROOT | EP_PAGES );
	flush_rewrite_rules();
}

add_action( 'after_switch_theme', 'my_custom_flush_rewrite_rules' );
```

## Manipulating the menu

It is possible to manipulate the menu items on the account page using the `woocommerce_account_menu_items` filter.

### Adding a new item on the menu

The following example shows how to add a new item at the end of the menu before the `logout` item:

```php
/**
 * Insert the new endpoint into the My Account menu.
 *
 * @param array $items
 * @return array
 */
function my_custom_my_account_menu_items( $items ) {
	// Remove the logout menu item.
	$logout = $items['customer-logout'];
	unset( $items['customer-logout'] );

	// Insert your custom endpoint.
	$items['my-custom-endpoint'] = __( 'My Custom Endpoint', 'woocommerce' );

	// Insert back the logout item.
	$items['customer-logout'] = $logout;

	return $items;
}

add_filter( 'woocommerce_account_menu_items', 'my_custom_my_account_menu_items' );
```

It's also possible add items in any position, simply working with the array of items:

```php
/**
 * Custom help to add new items into an array after a selected item.
 *
 * @param array $items
 * @param array $new_items
 * @param string $after
 * @return array
 */
function my_custom_insert_after_helper( $items, $new_items, $after ) {
	// Search for the item position and +1 since is after the selected item key.
	$position = array_search( $after, array_keys( $items ) ) + 1;

	// Insert the new item.
	$array = array_slice( $items, 0, $position, true );
	$array += $new_items;
	$array += array_slice( $items, $position, count( $items ) - $position, true );

    return $array;
}

/**
 * Insert the new endpoint into the My Account menu.
 *
 * @param array $items
 * @return array
 */
function my_custom_my_account_menu_items( $items ) {
	$new_items = array();
	$new_items['my-custom-endpoint'] = __( 'My Custom Endpoint', 'woocommerce' );

	// Add the new item after `orders`.
	return my_custom_insert_after_helper( $items, $new_items, 'orders' );
}

add_filter( 'woocommerce_account_menu_items', 'my_custom_my_account_menu_items' );
```

## Manipulating the content displayed on endpoints

WooCommerce creates hooks dynamically for each endpoint, so to manipulate the display of endpoints it is possible to use the `woocommerce_account_{$endpoint}_endpoint` hook.

### Default WooCommerce endpoint hooks

By default WooCommerce has the following hooks for endpoints:

- `woocommerce_account_orders_endpoint`
- `woocommerce_account_view-order_endpoint`
- `woocommerce_account_downloads_endpoint`
- `woocommerce_account_edit-address_endpoint`
- `woocommerce_account_payment-methods_endpoint`
- `woocommerce_account_add-payment-method_endpoint`
- `woocommerce_account_edit-account_endpoint`

### Adding content to an endpoint

```php
/**
 * Endpoint HTML content.
 */
function my_custom_endpoint_content() {
	echo '<p>Hello World!</p>';
}

add_action( 'woocommerce_account_my-custom-endpoint_endpoint', 'my_custom_endpoint_content' );
```

### Changing an endpoint title

To change the page title for the endpoint:

```php
/*
 * Change endpoint title.
 *
 * @param string $title
 * @return string
 */
function my_custom_endpoint_title( $title ) {
	global $wp_query;

	$is_endpoint = isset( $wp_query->query_vars['my-custom-endpoint'] );

	if ( $is_endpoint && ! is_admin() && is_main_query() && in_the_loop() && is_account_page() ) {
		// New page title.
		$title = __( 'My Custom Endpoint', 'woocommerce' );

		remove_filter( 'the_title', 'my_custom_endpoint_title' );
	}

	return $title;
}

add_filter( 'the_title', 'my_custom_endpoint_title' );
```