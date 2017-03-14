<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Abstract Product](#abstract-product)
- [External Products](#external-products)
- [Grouped Products](#grouped-products)
- [Product Variations](#product-variations)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

In an effort to unify CLI, API, and WP Admin, new CRUD classes were implemented in `3.0.0` to form a new 'data manipulation API'.

Each CRUD class contains a representation of the data in array format. This document lists properties available for products - each property has a `get_` getter and `set_` setter method for accessing and setting values.

## Abstract Product

Name | Type | Description | Example
---- | ---- | ----------- | -------
`id` | `int` | Product ID | `1`
`name` | `int` | Product name | `My Product`
`slug` | `int` | Product permalink slug | `my-product`
`date_created` | `WC_DateTime|NULL` | WC_DateTime object for when order was created or null if not set |
`date_modified` | `WC_DateTime|NULL` | WC_DateTime object for when order was created or null if not set |
`status` | `string|bool` | Product status, e.g. `publish`. Initial state (no status) is `false`. | `publish`
`featured` | `bool` | Is the product featured? | `true`
`catalog_visibility` | `string` | Where the product is visible in the catalog. Valid values; visible, search, catalog, hidden | `visible`
`description` | `string` | Full product description. | 
`short_description` | `string` | Short product description. | 
`sku` | `string` | Product stock keeping unit. | `SKU-101`
`price` | `string` | Product price the user will pay. | `20.99`
`regular_price` | `string` | Product regular price (main price/price when no on sale) | `20.99`
`sale_price` | `string` | Product sale price. | `10.99`
`date_on_sale_from` | `WC_DateTime|NULL` | WC_DateTime object for when order was created or null if not set |
`date_on_sale_to` | `WC_DateTime|NULL` | WC_DateTime object for when order was created or null if not set |
`total_sales` | `int` | Count of sales for this product. | `2`
`tax_status` | `string` | Tax status of the product. Valid values: taxable, shipping, none. | `taxable`
`tax_class` | `string` | Tax class for the product. Empty string is the standard tax class. | `reduced-rate`
`manage_stock` | `bool` | Is the product managing stock? | `true`
`stock_quantity` | `int` | Stock qty if stock managed. | `1`
`stock_status` | `string` | Product's stock status. instock or outofstock. | `instock`
`backorders` | `string` | Backorder status. Valid values: yes, no, notify. | `yes`
`sold_individually` | `bool` | Must the product be sold separately (no quantities)? | `true`
`weight` | `string ` | Product weight. | `2`
`length` | `string` | Product length. | `3`
`width` | `string ` | Product width. | `2`
`height` | `string ` | Product height. | `2`
`upsell_ids` | `array` | Array of product IDs which are upsold. | `array( 1, 2, 3 )`
`cross_sell_ids` | `array` | Array of product IDs which are cross-sold. | `array( 1, 2, 3 )`
`parent_id` | `int` | Parent post ID | `200`
`reviews_allowed` | `bool` | Are reviews (comments) allowed? | `true`
`purchase_note` | `string` | A note sent to customers who purchase this product. | `Thanks for buying X.`
`attributes ` | `array` | Array of attributes assigned to the product. |
`default_attributes ` | `array` | Array of default attributes assigned to the product. |
`menu_order ` | `int` | Menu order (sort order) for the product. | `1`
`virtual` | `bool` | Is this a virtual product? | `true`
`downloadable` | `bool` | Is this a downloadable product? | `true`
`category_ids ` | `array` | Array of category IDs assigned to the product. | `array( 1, 2, 3 )`
`tag_ids` | `array` | Array of tag IDs assigned to the product. | `array( 1, 2, 3 )`
`shipping_class_id` | `int` | ID of the shipping class assigned to this product, or 0 for none. | `1`
`downloads ` | `array` | Array of downloadable files customers get access to after purchase. | Array of WC_Product_Download objects.
`image_id ` | `int` | ID of the gallery image assigned to this product, or 0 for none. | `1`
`gallery_image_ids ` | `array` | Array of gallery image IDs assigned to this product. | array( 1, 2, 3 )
`download_limit` | `int` | Download limit for files, or -1 for no limit. | `1`
`download_expiry` | `int` | Number of days files are downloadable or -1 for no limit. | `1`
`rating_counts ` | `array` | Array of rating counts for this product. | `array( 1 => 0, 2 => 0, 3 => 0, 4 => 3, 5 => 4 )`
`average_rating` | `float` | Average rating out of 5. | `4.5`
`review_count` | `int` | Total number of ratings. | `19`

## External Products

Name | Type | Description | Example
---- | ---- | ----------- | -------
`product_url` | `string` | Where this external product links to. | `http://myothersite.com/product1`
`button_text` | `string` | Text for the buy button/link. | `Buy on my other site`

## Grouped Products

Name | Type | Description | Example
---- | ---- | ----------- | -------
`children` | `array` | Array of product IDs in this group. | `array( 100, 200, 205 )`

## Product Variations

Variations inherit everything from the abstract, but can also pull in the following data from the parent product in view context:

- title
- sku
- manage_stock
- backorders
- stock_quantity
- weight
- length
- width
- height
- tax_class
- shipping_class_id
- image_id

