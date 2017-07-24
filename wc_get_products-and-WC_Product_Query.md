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

## WC_Product_Query Methods

**get_query_vars()** - Get an array of all of the current query variables set on the query object.

**get( string $query_var, mixed $default = '' )** - Get the value of a query variable or the default if the query variable is not set.

**set( string $query_var, mixed $value )** - Set a query variable to a value.

**get_products()** - Get all products matching the current query variables.

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

### Date

**date_created, date_modified, date_completed, date_paid**

Accepts a string. Date queries use a standard format:

`YYYY-MM-DD` - Matches on products during that one day in site timezone.

`>YYYY-MM-DD` - Matches on products after that one day in site timezone.

`>=YYYY-MM-DD` - Matches on products during or after that one day in site timezone.

`<YYYY-MM-DD` - Matches on products before that one day in site timezone.

`<=YYYY-MM-DD` - Matches on products during or before that one day in site timezone.

`YYYY-MM-DD...YYYY-MM-DD` - Matches on products during or in between the days in site timezone.

`TIMESTAMP` - Matches on products during that one second in UTC timezone.

`>TIMESTAMP` - Matches on products after that one second in UTC timezone.

`>=TIMESTAMP` - Matches on products during or after that one second in UTC timezone.

`<TIMESTAMP` - Matches on products before that one second in UTC timezone.

`<=TIMESTAMP` - Matches on products during or before that one second in UTC timezone.

`TIMESTAMP...TIMESTAMP` - Matches on products during or in between the seconds in UTC timezone.

## Adding Custom Parameter Support

**TODO**