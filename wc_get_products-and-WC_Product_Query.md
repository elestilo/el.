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
// Get 10 most recent product IDs in date descending order.
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

Accepts a string or array of strings: one or more of of 'draft', 'pending', 'private', 'publish', or a custom status.

```
// Get draft products.
$args = array(
    'status' => 'draft',
);
$products = wc_get_products( $args );
```

**type**

Accepts a string or array of strings: one or more of 'external', 'grouped', 'simple', 'variable', or a custom type.

```
// Get external products.
$args = array(
    'type' => 'external',
);
$products = wc_get_products( $args );
```

**include**

Accepts an array of integers: Only includes products with IDs in the array.

```
// Get external products limited to ones with specific IDs.
$args = array(
    'type' => 'external',
    'include' => array( 134, 200, 210, 340 ),
);
$products = wc_get_products( $args );
```

**exclude**

Accepts an array of integers: Excludes products with IDs in the array.

```
// Get products that aren't the current product.
$args = array(
    'exclude' => array( $product->get_id() ),
);
$products = wc_get_products( $args );
```

**parent**

Accepts an integer: post ID of the product parent.

```
// Get products with a specific parent.
$args = array(
    'parent' => 20,
);
$products = wc_get_products( $args );
```

**parent_exclude**

Accepts an array of integers: Excludes products with parent ids in the array.

```
// Get products that don't have parent IDs of 20 or 21.
$args = array(
    'parent_exclude' => array( 20, 21 ),
);
$products = wc_get_products( $args );
```

**limit**

Accepts an integer: Maximum number of results to retrieve or `-1` for unlimited.

```
// Get latest 3 products.
$args = array(
    'limit' => 3,
);
$products = wc_get_products( $args );
```

**paged**

Accepts an integer: Page of results to retrieve. Does nothing if 'offset' is used.

```
// First 3 products.
$args = array(
    'limit' => 3,
    'paged' => 1,
);
$page_1_products = wc_get_products( $args );

// Second 3 products.
$args = array(
    'limit' => 3,
    'paged' => 2,
);
$page_2_products = wc_get_products( $args );
```

**paginate**

Accepts a boolean: True for pagination, or false for not.

Default: false.

Modifies the return results to give an object with fields:

_products_: Array of found products.

_total_: Number of found products.

_max_num_pages_: The total number of pages.

```
// Get products with extra info about the results.
$args = array(
    'paginate' => true,
);
$results = wc_get_products( $args );
echo $results->total . ' products found\n';
echo 'Page 1 of ' . $results->max_num_pages . '\n';
echo 'First product id is: ' . $results->products[0]->get_id() . '\n';
```

**offset**

Accepts an integer: Amount to offset product results.

```
// Get second to fifth most-recent products.
$args = array(
    'limit' => 4,
    'offset' => 1
);
$products = wc_get_products( $args );

```

**order**

Accepts a string: 'DESC' or 'ASC'. Use with 'orderby'.

Default: 'DESC'.

```
// Get most recently modified products.
$args = array(
    'orderby' => 'modified',
    'order' => 'DESC',
);
$products = wc_get_products( $args );
```

**orderby**

Accepts a string: 'none', 'ID', 'name', 'type', 'rand', 'date', 'modified'.

Default: 'date'.

```
// Get some random products.
$args = array(
    'orderby' => 'rand',
);
$products = wc_get_products( $args );
```

**return**

Accepts a string: 'ids' or 'objects'.

Default: 'objects'.

```
// Get product ids.
$args = array(
    'return' => 'ids',
);
$products = wc_get_products( $args );
```

### Product 

**slug**

Accepts a string: Product slug to match on.

```
```

**sku**

Accepts a string: Product SKU to match on. Does partial matching on the SKU.

```
```

**tag**

Accepts an array: Limit results to products assigned to specific tags by slug.

```
```

**category**

Accepts an array: Limit result to products assigned to specific categories by slug.

```
```

**weight, length, width, height**

Accepts a float: The dimension measurement to match on.

```
```

**price, regular_price, sale_price**

Accepts a float: The price to match on. 

```
```

**total_sales**

Accepts an int: Gets products with that many sales.

```
```

**virtual, downloadable, featured, sold_individually, backorders, manage_stock, reviews_allowed**

Accepts a boolean: Limit results to products with the specific settings or features.

```
```

**visibility**

TODO

```
```

**stock_quantity**

Accepts an int: The quantity of a product in stock.

```
```

**stock_status**

Accepts a string: 'outofstock' or 'instock'.

```
```

**tax_status**

Accepts a string: 'taxable', 'shipping', or 'none'.

```
```

**tax_class**

Accepts a string: A tax class slug.

```
//: e.g. 'reduced-rate'.
```

**shipping_class**

Accepts a string: A shipping class slug.

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