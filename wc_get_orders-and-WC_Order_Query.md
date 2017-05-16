## Description

wc_get_orders and WC_Order_Query provide a standard way of retrieving orders that is safe to use and will not break due to database changes in future WooCommerce versions. Building custom WP_Queries or database queries is likely to break your code in future versions of WooCommerce as data moves towards custom tables for better performance. This is the best-practices way for plugin and theme developers to retrieve multiple orders. wc_get_orders and WC_Order_Query are similar to WordPress [get_posts and WP_Query](https://codex.wordpress.org/Class_Reference/WP_Query). Just like those, you pass in an array of arguments defining the criteria for the search.

## Usage

Here are a couple examples:

```
$orders = wc_get_orders( array(

) );
```

```
$query = new WC_Order_Query( array(

) )
```

## WC_Order_Query Methods

**get_query_vars()** - Get an array of all of the current query variables set on the query object.

**get( string $query_var, mixed $default = '' )** - Get the value of a query variable or the default if the query variable is not set.

**set( string $query_var, mixed $value )** - Set a query variable to a value.

**get_orders()** - Get all orders matching the current query variables.

## Parameters

### General

### Price

### Customer

### Address

### Date

