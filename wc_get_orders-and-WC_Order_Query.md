<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Description](#description)
- [Usage](#usage)
- [WC_Order_Query Methods](#wc_order_query-methods)
- [Parameters](#parameters)
  - [General](#general)
  - [Price](#price)
  - [Customer](#customer)
  - [Address and Name](#address-and-name)
  - [Date](#date)
- [Adding Custom Parameter Support](#adding-custom-parameter-support)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

**status**

Accepts a string: one of 'pending', 'processing', 'on-hold', 'completed', 'refunded, 'failed', 'cancelled', or a custom order status.

```
// Get orders on hold.
$args = array(
    'status' => 'on-hold',
);
$orders = wc_get_orders( $args );
```

**type**

Accepts a string: 'shop_order', 'shop_order_refund', or a custom order type.

```
// Get refunds in the last 24 hours.
$args = array(
    'type' => 'shop_order_refund',
    'date_created' => '>' . ( time() - DAY_IN_SECONDS ),
);
$orders = wc_get_orders( $args );
```

**version**

Accepts a string: WooCommerce version number the order was created in.

```
// Get orders created during WooCommerce 2.6.14
$args = array(
    'version' => '2.6.14',
);
$orders = wc_get_orders( $args );
```

**created_via**

Accepts a string: 'checkout', 'rest-api', or a custom creation method slug.

```
// Get orders created through site checkout.
$args = array(
    'created_via' => 'checkout',
);
$orders = wc_get_orders( $args );
```

**parent**

Accepts an integer: post ID of the order parent.

```
// Get orders with post parent ID of 20.
$args = array(
    'parent' => 20,
);
$orders = wc_get_orders( $args );
```

**parent_exclude**

Accepts an array of integers: Excludes orders with parent ids in the array.

```
// Get orders that don't have parent IDs of 20 or 21.
$args = array(
    'parent_exclude' => array( 20, 21 ),
);
$orders = wc_get_orders( $args );
```

**exclude**

Accepts an array of integers: Excludes orders that have the ids.

```
// Get orders that aren't the current order.
$args = array(
    'exclude' => array( $order->get_id() ),
);
$orders = wc_get_orders( $args );
```

**limit**

Accepts an integer: Maximum number of results to retrieve or `-1` for unlimited.

Default: Site 'posts_per_page' setting.

```
// Get latest 3 orders.
$args = array(
    'limit' => 3,
);
$orders = wc_get_orders( $args );
```

**paged**

Accepts an integer: Page of results to retrieve. Does nothing if 'offset' is used.

```
// First 3 orders.
$args = array(
    'limit' => 3,
    'paged' => 1,
);
$page_1_orders = wc_get_orders( $args );

// Second 3 orders.
$args = array(
    'limit' => 3,
    'paged' => 2,
);
$page_2_orders = wc_get_orders( $args );
```

**offset**

Accepts an integer: Amount to offset order results.

```
// Get second to fifth most-recent orders.
$args = array(
    'limit' => 4,
    'offset' => 1
);
$orders = wc_get_orders( $args );
```

**paginate**

Accepts a boolean: True for pagination, or false for not. 

Default: false.

Modifies the return results to give an object with fields:

_orders_: Array of found orders.

_total_: Number of found orders.

_max_num_pages_: The total number of pages.


```
// Get orders with extra info about the results.
$args = array(
    'paginate' => true,
);
$results = wc_get_orders( $args );
echo $results->total . ' orders found\n';
echo 'Page 1 of ' $results->max_num_pages . '\n';
echo 'First order id is: ' . $results->orders[0]->get_id() . '\n';
```

**order**

Accepts a string: 'DESC' or 'ASC'. Use with 'orderby'.

Default: 'DESC'.

```
// Get most recently modified orders.
$args = array(
    'orderby' => 'modified',
    'order' => 'DESC',
);
$orders = wc_get_orders( $args );
```

**orderby**

Accepts a string: 'none', 'ID', 'name', 'type', 'rand', 'date', 'modified'.

Default: 'date'.

```
// Get some random orders.
$args = array(
    'orderby' => 'rand',
);
$orders = wc_get_orders( $args );
```

**return**

Accepts a string: 'ids' or 'objects'. 

Default: 'objects'.

```
// Get order ids.
$args = array(
    'return' => 'ids',
);
$orders = wc_get_orders( $args );
```

### Price
**currency**

Accepts a string: Currency used in order.

```
// Get orders paid in USD.
$args = array(
    'currency' => 'USD',
);
$orders = wc_get_orders( $args );
```

**prices_include_tax**

Accepts a string: 'yes' or 'no'.

```
// Get orders whose prices include tax.
$args = array(
    'prices_include_tax' => 'yes',
);
$orders = wc_get_orders( $args );
```

**payment_method**

Accepts a string: Slug of payment method used.

```
// Get orders payed by check.
$args = array(
    'payment_method' => 'cheque',
);
$orders = wc_get_orders( $args );
```

**payment_method_title**

Accepts a string: Full title of payment method used.

```
// Get orders payed by check.
$args = array(
    'payment_method_title' => 'Check payments',
);
$orders = wc_get_orders( $args );
```

**discount_total, discount_tax, shipping_total, shipping_tax, cart_tax, total**

Accepts a float: Unrounded amount to match on.

```
// Get orders with 20.00 discount total.
$args = array(
    'discount_total' => 20.00
);
$orders = wc_get_orders( $args );
```

### Customer

**customer**

Accepts a string or an integer: The order's billing email or customer id.

```
// Get orders by customer with email 'woocommerce@woocommerce.com'.
$args = array(
    'customer' => 'woocommerce@woocommerce.com',
);
$orders = wc_get_orders( $args );
```

**customer_id**

Accepts an integer: Customer ID.

```
// Get orders by customer with ID 12.
$args = array(
    'customer_id' => 12,
);
$orders = wc_get_orders( $args );
```

### Address and Name

**billing_first_name, billing_last_name, billing_company, billing_address_1, billing_address_2, billing_city, billing_state, billing_postcode, billing_country, billing_email, billing_phone, shipping_first_name, shipping_last_name, shipping_company, shipping_address_1, shipping_address_2, shipping_city, shipping_state, shipping_postcode, shipping_country, customer_ip_address**

Accepts string: Value to match on.

```
// Get orders from America.
$args = array(
    'billing_country' => 'US',
);
$orders = wc_get_orders( $args );
```

```
// Get orders from people named Claudio Sanches.
$args = array(
    'billing_first_name' => 'Claudio',
    'billing_last_name' => 'Sanches',
);
$orders = wc_get_orders( $args );
```

### Date

**date_created, date_modified, date_completed, date_paid**

Accepts a string. Date queries use a standard format:

`YYYY-MM-DD` - Matches on orders during that one day in site timezone.

`>YYYY-MM-DD` - Matches on orders after that one day in site timezone.

`>=YYYY-MM-DD` - Matches on orders during or after that one day in site timezone.

`<YYYY-MM-DD` - Matches on orders before that one day in site timezone.

`<=YYYY-MM-DD` - Matches on orders during or before that one day in site timezone.

`YYYY-MM-DD...YYYY-MM-DD` - Matches on orders during or in between the days in site timezone.

`TIMESTAMP` - Matches on orders during that one second in UTC timezone.

`>TIMESTAMP` - Matches on orders after that one second in UTC timezone.

`>=TIMESTAMP` - Matches on orders during or after that one second in UTC timezone.

`<TIMESTAMP` - Matches on orders before that one second in UTC timezone.

`<=TIMESTAMP` - Matches on orders during or before that one second in UTC timezone.

`TIMESTAMP...TIMESTAMP` - Matches on orders during or in between the seconds in UTC timezone.


```
// Get orders paid February 12, 2016.
$args = array(
    'date_paid' => '2016-02-12',
);
$orders = wc_get_orders( $args );
```

```
// Get orders created before the last hour.
$args = array(
    'date_created' => '<' . ( time() - HOUR_IN_SECONDS ),
);
$orders = wc_get_orders( $args );
```

```
// Get orders completed 16 May 2017 21:46:17 UTC to 17 May 2017 12:46:17 UTC.
$args = array(
    'date_completed' => '1494971177...1494938777',
);
$orders = wc_get_orders( $args );
```

## Adding Custom Parameter Support

It is possible to add support for custom query variables in `wc_get_orders` and `WC_Order_Query`. To do this you need to filter the generated query.
```
/**
 * Handle a custom 'customvar' query var to get orders with the 'customvar' meta.
 * @param array $query - Args for WP_Query.
 * @param array $query_vars - Query vars from WC_Order_Query.
 * @return array modified $query
 */
function handle_custom_query_var( $query, $query_vars ) {
	if ( ! empty( $query_vars['customvar'] ) ) {
		$query['meta_query'][] = array(
			'key' => 'customvar',
			'value' => esc_attr( $query_vars['customvar'] ),
		);
	}

	return $query;
}
add_filter( 'woocommerce_order_data_store_cpt_get_orders_query', 'handle_custom_query_var', 10, 2 );
```
Usage:
```
$orders = wc_get_orders( array( 'customvar' => 'somevalue' ) );
```