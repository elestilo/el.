<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Replaced shortcode attributes.](#replaced-shortcode-attributes)
- [Products shortcode](#products-shortcode)
  - [Available attributes](#available-attributes)
  - [Examples](#examples)
    - [Products by category](#products-by-category)
    - [Products by attribute](#products-by-attribute)
    - [Products by ID](#products-by-id)
    - [Products by SKU](#products-by-sku)
    - [Recent products](#recent-products)
    - [On sale products](#on-sale-products)
    - [Best selling products](#best-selling-products)
    - [Top rated products](#top-rated-products)
    - [Featured products](#featured-products)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Shortcodes has been improved on WooCommerce 3.2.0, see the changes:

## Replaced shortcode attributes.

Some of the attributes have gained a new names.

- `per_page` now is called `limit`.
- `operator` now is called `cat_operator`.
- `filter` now is called `terms`.

All changes has been made to make the attributes clearer and easier to use.

Note that the old names will still work without generating any warning or deprecated notice.

## Products shortcode

The `[products]` shortcode has been improved on WooCommerce 3.2, allowing fetch products by ids, SKUs, categories, attributes, and more, replacing the need for multiples shortcodes like `[product_category]`, `[featured_products]`, `[sale_products]`, `[best_selling_products]`, `[recent_products]`, `[product_attribute]`, and `[top_rated_products]`.

### Available attributes

- `limit` - Results limit. Defaults to `-1`.
- `columns` - Number of columns. Defaults to `4`.
- `orderby` - Sort retrieved products by parameter. Available options: `menu_order`, `title`, `date`, `rand`, `price`, `popularity`, `rating`, or `id`. Defaults to `title`. One or more options can be passed separated by empty spaces.
- `order` - Designates the order of the `orderby` attribute. Available options: `ASC` and `DESC`. Defaults to `ASC`.
- `ids` - Comma separated list of product IDs.
- `skus` - Comma separated list of product SKUs.
- `category` - Comma separated list of category slugs.
- `cat_operator` - Operator to compare categories. Available options: `AND`, `IN`, and `NOT IN`. Defaults to `IN`.
- `attribute` - Retrieved products based on an attribute slug.
- `terms` - Comma separated list of attribute terms to be used with `attribute`.
- `terms_operator` - Operator to compare attribute terms. Available options: `AND`, `IN`, and `NOT IN`. Defaults to `IN`.
- `visibility` - Retrieve products based on visibility. Available options: `visible` (visible on shop and search results), `catalog` (visible on shop only), `search` (visible on search results only), and `hidden`. Defaults to `visible`.
- `class` - Shortcode wrapper HTML class.
- `on_sale` - Retrieve on sale products. Not to be used in conjunction with `best_selling` or `top_rated`.
- `best_selling` - Retrieve best selling products. Not to be used in conjunction with `on_sale` or `top_rated`.
- `top_rated` - Retrieve top rated products. Not to be used in conjunction with `on_sale` or `best_selling`.

### Examples

Check the follow examples that replaces our old shortcodes.

#### Products by category

```
[products category="clothing" limit="4" orderby="menu_order title" order="ASC"]
```

#### Products by attribute

```
[products attribute="color" terms="black" limit="4" orderby="title" order="ASC"]
```

#### Products by ID

```
[products ids="1,2,3,4,5,6"]
```

#### Products by SKU

```
[products skus="foo,bar,baz"]
```

#### Recent products

```
[products limit="4" orderby="date" order="DESC"]
```

#### On sale products

```
[products on_sale="true" limit="4" orderby="title" order="ASC"]
```

#### Best selling products

```
[products best_selling="true" limit="4"]
```

#### Top rated products

```
[products top_rated="true" limit="4" orderby="title" order="ASC"]
```

#### Featured products

```
[products visibility="featured" limit="4" orderby="date" order="DESC"]
```
