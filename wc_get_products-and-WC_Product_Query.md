## Description

`wc_get_products` and `WC_Product_Query` provide a standard way of retrieving products that is safe to use and will not break due to database changes in future WooCommerce versions. Building custom WP_Queries or database queries is likely to break your code in future versions of WooCommerce as data moves towards custom tables for better performance. This is the best-practices way for plugin and theme developers to retrieve multiple products. `wc_get_products` and `WC_Product_Query` are similar to WordPress [`get_posts` and `WP_Query`](https://codex.wordpress.org/Class_Reference/WP_Query). Just like those, you pass in an array of arguments defining the criteria for the search.

## Usage

Here are a few examples:

```
// Get downloadable products created in the year 2016.
$products = wc_get_products( array(
    'downloadable' => true,
    'date_created' => '2016-01-01...2016-12-31`,
) );
```

```
// Get 10 most recent product ids in date descending order.
$query = new WC_Product_Query( array(
    'limit' => 10,
    'orderby' => 'date',
    'order' => 'DESC',
    'return' => 'ids',
) );
$products = $query->get_products();
```

```
// Get products containing a specific SKU.
// Does partial matching, so this will get products with SKUs "PRDCT-1", "PRDCT-2", etc.
$query = new WC_Product_Query();
$query->set( 'sku', 'PRDCT' );
$products = $query->get_products();
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

**type**

TODO

```
```

**include**

TODO

```
```

**exclude**

TODO

```
```

**parent**

TODO

```
```

**parent_exclude**

TODO

```
```

**limit**

TODO

```
```

**page**

TODO

```
```

**paginate**

TODO

```
```

**offset**

TODO

```
```

**order**

TODO

```
```

**orderby**

TODO

```
```

**return**

TODO

```
```

### Product 

**slug**

TODO

```
```

**sku**

TODO

```
```

**tag**

TODO

```
```

**category**

TODO

```
```

**weight, length, width, height**

TODO

```
```

**price, regular_price, sale_price**

TODO

```
```

**total_sales**

TODO

```
```

**virtual, downloadable, featured, sold_individually, backorders, manage_stock, reviews_allowed**

TODO

```
```

**visibility**

TODO

```
```

**stock_quantity**

TODO

```
```

**stock_status**

TODO

```
```

**tax_status**

TODO

```
```

**tax_class**

TODO

```
```

**shipping_class**

TODO

```
```

**upsell_ids, cross_sell_ids**

TODO

```
```

**attributes**

TODO

```
```

**default_attributes**

TODO

```
```

**menu_order**

TODO

```
```

**download_limit**

TODO

```
```

**download_expiry**

TODO

```
```

**average_rating**

TODO

```
```

**review_count**

TODO

```
```

### Date

**date_created, date_modified, date_on_sale_from, date_on_sale_to**

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