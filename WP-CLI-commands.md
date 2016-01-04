## Getting Started

The support WP-CLI started in WooCommerce 2.5, allowing you to manage products, coupons, orders, customers and more by a command line interface.

### What is WP-CLI?

For those who have never heard before WP-CLI, here's a brief description extracted from the [official website](http://wp-cli.org/).

> **WP-CLI** is a set of command-line tools for managing WordPress installations. You can update plugins, set up multisite installs and much more, without using a web browser.

### WooCommerce Commands

All WooCommerce related commands are grouped into `wp wc` command, see an example:

```
$ wp wc
usage: wp wc coupon <command>
   or: wp wc customer <command>
   or: wp wc order <command>
   or: wp wc product <command>
   or: wp wc report <command>
   or: wp wc tax <command>
   or: wp wc tool <command>

See 'wp help wc <command>' for more information on a specific command.
```

You can see more details about the commands using `wp help wc`:

```
**NAME**

  wp wc

**DESCRIPTION**

  Manage WooCommerce from CLI.

**SYNOPSIS**

  wp wc <command>

**SUBCOMMANDS**

  customer      Manage Customers.
  order         Manage Orders.
  product       Manage Products.
  report        Show Reports.
  tax           Manage Taxes.
  tool          Tools for WooCommerce.

```

## Managing Coupons

```wp wc coupon <command>```

### Create a Coupon

#### Command:

```wp wc coupon create [--<field>=<value>] [--porcelain]```

#### Options:


- `[--<field>=<value>]`
- `[--porcelain]` - Outputs just the new coupon id.


#### Available fields:


- `code`
- `type`
- `amount`
- `description`
- `expiry_date`
- `individual_use`
- `product_ids`
- `exclude_product_ids`
- `usage_limit`
- `usage_limit_per_user`
- `limit_usage_to_x_items`
- `usage_count`
- `enable_free_shipping`
- `product_category_ids`
- `exclude_product_category_ids`
- `minimum_amount`
- `maximum_amount`
- `customer_emails`


#### Example:

```wp wc coupon create --code=new-coupon --type=percent```

### Delete Coupons

#### Command:

```wp wc coupon delete <id>...```

#### Options:


- `<id>...` - The coupon ID to delete.


#### Example:

```
wp wc coupon delete 123
wp wc coupon delete $(wp wc coupon list --format=ids)
```

### Get a Coupon

#### Command:

```wp wc coupon get <coupon> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `<coupon>` - Coupon ID or code
- `[--field=<field>]` - Instead of returning the whole coupon fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the coupon's fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.


#### Available fields:


- `id`
- `code`
- `type`
- `amount`
- `description`
- `expiry_date`
- `individual_use`
- `product_ids`
- `exclude_product_ids`
- `usage_limit`
- `usage_limit_per_user`
- `limit_usage_to_x_items`
- `usage_count`
- `enable_free_shipping`
- `product_category_ids`
- `exclude_product_category_ids`
- `minimum_amount`
- `maximum_amount`
- `customer_emails`


#### Examples:

```
wp wc coupon get 123 --field=discount_type
wp wc coupon get disc50 --format=json > disc50.json
```

### List Coupons

#### Command:

```wp wc coupon list [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `[--<field>=<value>]` - Filter coupon based on coupon property.
- `[--field=<field>]` - Prints the value of a single field for each coupon.
- `[--fields=<fields>]` - Limit the output to specific coupon fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.


#### Available fields:


- `id`
- `code`
- `type`
- `amount`
- `description`
- `expiry_date`


These fields are optionally available:


- `individual_use`
- `product_ids`
- `exclude_product_ids`
- `usage_limit`
- `usage_limit_per_user`
- `usage_limit_per_user`
- `limit_usage_to_x_items`
- `usage_count`
- `free_shipping`
- `product_category_ids`
- `exclude_product_category_ids`
- `exclude_sale_items`
- `minimum_amount`
- `maximum_amount`
- `customer_emails`


Fields for filtering query result also available:


- `q` - Filter coupons with search query.
- `in` - Specify coupon IDs to retrieve.
- `not_in` - Specify coupon IDs NOT to retrieve.
- `created_at_min` - Filter coupons created after this date.
- `created_at_max` - Filter coupons created before this date.
- `updated_at_min` - Filter coupons updated after this date.
- `updated_at_max` - Filter coupons updated before this date.
- `page` - Page number.
- `offset` - Number of coupon to displace or pass over.
- `order` - Accepted values: `ASC` and `DESC`. Default: `DESC`.
- `orderby` - Sort retrieved coupons by parameter. One or more options can be passed.


#### Examples:

```
wp wc coupon list
wp wc coupon list --field=id
wp wc coupon list --fields=id,code,type --format=json
```

### Get Coupon Types

#### Command:

```wp wc coupon types```

#### Examples:

```
wp wc coupon types
```

### Update Coupons

#### Command:

```wp wc coupon update <coupon> [--<field>=<value>]```

#### Options:


- `<coupon>` - The ID or code of the coupon to update.
- `[--<field>=<value>]` - One or more fields to update


#### Available fields:


- `code`
- `type`
- `amount`
- `description`
- `expiry_date`
- `individual_use`
- `product_ids`
- `exclude_product_ids`
- `usage_limit`
- `usage_limit_per_user`
- `limit_usage_to_x_items`
- `usage_count`
- `enable_free_shipping`
- `product_category_ids`
- `exclude_product_categories`
- `exclude_product_category_ids`
- `minimum_amount`
- `maximum_amount`
- `customer_emails`


#### Examples:

```
wp wc coupon list
wp wc coupon list --field=id
wp wc coupon list --fields=id,code,type --format=json
```

## Managing Customers

```wp wc customer <command>```

### Create a Customer

#### Command:

```wp wc customer create <email> [--<field>=<value>] [--porcelain]```

#### Options:


- `<email>` - The email address of the customer to create.
- `[--<field>=<value>]` - Associative args for the new customer.
- `[--porcelain]` - Outputs just the new customer id.


#### Available fields:


- `username`
- `password`
- `first_name`
- `last_name`
- `billing_address.first_name`
- `billing_address.company`
- `billing_address.address_1`
- `billing_address.address_2`
- `billing_address.city`
- `billing_address.state`
- `billing_address.postcode`
- `billing_address.country`
- `billing_address.email`
- `billing_address.phone`
- `shipping_address.first_name`
- `shipping_address.last_name`
- `shipping_address.company`
- `shipping_address.address_1`
- `shipping_address.address_2`
- `shipping_address.city`
- `shipping_address.state`
- `shipping_address.postcode`
- `shipping_address.country`


#### Example:

```wp wc customer create new-customer@example.com --first_name=Akeda```

### Delete Customers

#### Command:

```wp wc customer delete <customer>...```

#### Options:


- `<customer>...` - The customer ID, email, or username to delete.


#### Example:

```
wp wc customer delete 123
wp wc customer delete $(wp wc customer list --format=ids)
```

### View Customer Downloads

#### Command:

```wp wc customer downloads <customer> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `<customer>` - The customer ID, email or username.
- `[--field=<field>]` - Instead of returning the whole customer fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the customer&#039;s fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.


#### Available fields:


- `download_id`
- `download_name`
- `access_expires`


#### Example:

```wp wc customer downloads 123```

### Get a Customer

#### Command:

```wp wc customer get <customer> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `<customer>` - Customer ID, email, or username.
- `[--field=<field>]` - Instead of returning the whole customer fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the customer&#039;s fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.


#### Available fields:


- `id`
- `email`
- `first_name`
- `last_name`
- `created_at`
- `username`
- `last_order_id`
- `last_order_date`
- `orders_count`
- `total_spent`
- `avatar_url`
- `billing_address.first_name`
- `billing_address.last_name`
- `billing_address.company`
- `billing_address.address_1`
- `billing_address.address_2`
- `billing_address.city`
- `billing_address.state`
- `billing_address.postcode`
- `billing_address.country`
- `billing_address.email`
- `billing_address.phone`
- `shipping_address.first_name`
- `shipping_address.last_name`
- `shipping_address.company`
- `shipping_address.address_1`
- `shipping_address.address_2`
- `shipping_address.city`
- `shipping_address.state`
- `shipping_address.postcode`
- `shipping_address.country`


Fields for filtering query result also available:


- `role` - Filter customers associated with certain role.
- `q` - Filter customers with search query.
- `created_at_min` - Filter customers whose registered after this date.
- `created_at_max` - Filter customers whose registered before this date.
- `limit` - The maximum returned number of results.
- `offset` - Offset the returned results.
- `order` - Accepted values: `ASC` and `DESC`. Default: `DESC`.
- `orderby` - Sort retrieved customers by parameter. One or more options can be passed.


#### Example:

```
wp wc customer get 123 --field=email
wp wc customer get customer-login --format=json
```

### List Customers

#### Command:

```wp wc customer list [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:

- `[--<field>=<value>]` - Filter customer based on customer property.
- `[--field=<field>]` - Prints the value of a single field for each customer.
- `[--fields=<fields>]` - Limit the output to specific customer fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.

#### Available fields:

- `id`
- `email`
- `first_name`
- `last_name`
- `created_at`
- `username`
- `last_order_id`
- `last_order_date`
- `orders_count`
- `total_spent`
- `avatar_url`
- `billing_address.first_name`
- `billing_address.last_name`
- `billing_address.company`
- `billing_address.address_1`
- `billing_address.address_2`
- `billing_address.city`
- `billing_address.state`
- `billing_address.postcode`
- `billing_address.country`
- `billing_address.email`
- `billing_address.phone`
- `shipping_address.first_name`
- `shipping_address.last_name`
- `shipping_address.company`
- `shipping_address.address_1`
- `shipping_address.address_2`
- `shipping_address.city`
- `shipping_address.state`
- `shipping_address.postcode`
- `shipping_address.country`

Fields for filtering query result also available:

- `role` - Filter customers associated with certain role.
- `q` - Filter customers with search query.
- `created_at_min` - Filter customers whose registered after this date.
- `created_at_max` - Filter customers whose registered before this date.
- `limit` - The maximum returned number of results.
- `offset` - Offset the returned results.
- `order` - Accepted values: `ASC` and `DESC`. Default: `DESC`.
- `orderby` - Sort retrieved customers by parameter. One or more options can be passed.


#### Example:

```
wp wc customer list
wp wc customer list --field=id
wp wc customer list --fields=id,email,first_name --format=json
```

### View Customer Orders

#### Command:

```wp wc customer orders <customer> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:

- `<customer>` - The customer ID, email or username.
- `[--field=<field>]` - Instead of returning the whole customer fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the customer&#039;s fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.

#### Available fields:

For more fields, see [List Orders fields](#list-orders).

#### Example:

```wp wc customer orders 123```

### Update Customers

#### Command:

```wp wc customer update <customer> [--<field>=<value>]```

#### Options:


- `<customer>` - Customer ID, email, or username.
- `[--<field>=<value>]` - One or more fields to update.


#### Available fields:


- `email`
- `first_name`
- `last_name`
- `billing_address.first_name`
- `billing_address.last_name`
- `billing_address.company`
- `billing_address.address_1`
- `billing_address.address_2`
- `billing_address.city`
- `billing_address.state`
- `billing_address.postcode`
- `billing_address.country`
- `billing_address.email`
- `billing_address.phone`
- `shipping_address.first_name`
- `shipping_address.last_name`
- `shipping_address.company`
- `shipping_address.address_1`
- `shipping_address.address_2`
- `shipping_address.city`
- `shipping_address.state`
- `shipping_address.postcode`
- `shipping_address.country`


#### Example:

```
wp wc customer update customer-login --first_name=akeda --last_name=bagus
wp wc customer update customer@example.com --password=new-password
wp wc customer update customer@example.com --password=new-password
```

## Managing Orders

```wp wc order <command>```

### Create an Order

#### Command:

```wp wc order create [--<field>=<value>] [--porcelain]```

#### Options:

- `[--<field>=<value>]` - Associative args for the new order.
- `[--porcelain]` - Outputs just the new order id.

#### Available fields:

Required fields:

- `customer_id`

Optional fields:

- `status`
- `note`
- `currency`
- `order_meta`

Payment detail fields:

- `payment_details.method_id`
- `payment_details.method_title`
- `payment_details.paid`

Billing address fields:

- `billing_address.first_name`
- `billing_address.last_name`
- `billing_address.company`
- `billing_address.address_1`
- `billing_address.address_2`
- `billing_address.city`
- `billing_address.state`
- `billing_address.postcode`
- `billing_address.country`
- `billing_address.email`
- `billing_address.phone`


Shipping address fields:


- `shipping_address.first_name`
- `shipping_address.last_name`
- `shipping_address.company`
- `shipping_address.address_1`
- `shipping_address.address_2`
- `shipping_address.city`
- `shipping_address.state`
- `shipping_address.postcode`
- `shipping_address.country`


Line item fields (numeric array, started with index zero):


- `line_items.0.product_id`
- `line_items.0.quantity`
- `line_items.0.variations.pa_color`


For second line item: `line_items.1.product_id` and so on.

Shipping line fields (numeric array, started with index zero):


- `shipping_lines.0.method_id`
- `shipping_lines.0.method_title`
- `shipping_lines.0.total`


For second shipping item: `shipping_lines.1.method_id` and so on.

#### Example:

```
wp wc order create --customer_id=1 --status=pending ...
```

### Delete Orders

#### Command:

```wp wc order delete <id>...```

#### Options:


- `<id>...` - The order ID to delete.


#### Example:

```wp wc order delete 123```

### Get an Order

#### Command:

```wp wc order get <id> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `<id>` - Order ID.
- `[--field=<field>]` - Instead of returning the whole order fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the order&#039;s fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.


#### Available fields:


- `id`
- `order_number`
- `customer_id`
- `total`
- `status`
- `created_at`


For more fields, see [List Orders fields](#list-orders).

#### Example:

```wp wc order get 123 --fields=id,title,sku```

### List Orders

#### Command:

```wp wc order list [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `[--<field>=<value>]` - Filter orders based on order property.
- `[--field=<field>]` - Prints the value of a single field for each order.
- `[--fields=<fields>]` - Limit the output to specific order fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.


#### Available fields:


- `id`
- `order_number`
- `customer_id`
- `total`
- `status`
- `created_at`


These fields are optionally available:


- `updated_at`
- `completed_at`
- `currency`
- `subtotal`
- `total_line_items_quantity`
- `total_tax`
- `total_shipping`
- `cart_tax`
- `shipping_tax`
- `total_discount`
- `shipping_methods`
- `note`
- `customer_ip`
- `customer_user_agent`
- `view_order_url`


Payment detail fields:


- `payment_details.method_id`
- `payment_details.method_title`
- `payment_details.paid`


Billing address fields:


- `billing_address.first_name`
- `billing_address.last_name`
- `billing_address.company`
- `billing_address.address_1`
- `billing_address.address_2`
- `billing_address.city`
- `billing_address.state`
- `billing_address.postcode`
- `billing_address.country`
- `billing_address.email`
- `billing_address.phone`


Shipping address fields:


- `shipping_address.first_name`
- `shipping_address.last_name`
- `shipping_address.company`
- `shipping_address.address_1`
- `shipping_address.address_2`
- `shipping_address.city`
- `shipping_address.state`
- `shipping_address.postcode`
- `shipping_address.country`


Line item fields (numeric array, started with index zero):


- `line_items.0.product_id`
- `line_items.0.quantity`
- `line_items.0.variations.pa_color`


For second line item: `line_items.1.product_id` and so on.

Shipping line fields (numeric array, started with index zero):


- `shipping_lines.0.method_id`
- `shipping_lines.0.method_title`
- `shipping_lines.0.total`


For second shipping item: `shipping_lines.1.method_id` and so on.

#### Example:

```wp wc order list```

### Update an Order

#### Command:

```wp wc order update <id> [--<field>=<value>]```

#### Options:


- `<id>` - Product ID
- `[--<field>=<value>]` - One or more fields to update.


#### Available fields:

For available fields, see [Create an Order fields](#create-an-order).

#### Example:

```wp wc order update 123 --status=completed```

## Managing Products

```wp wc product <command>```

### Create a Product

#### Command:

```wp wc product create [--<field>=<value>] [--porcelain]```

#### Options:

- `[--<field>=<value>]` - Associative args for the new product.
- `[--porcelain]` - Outputs just the new product id.

#### Available fields:

Required fields:

- `title`

These fields are optionally available for create command:

- `type`
- `status`
- `downloadable`
- `virtual`
- `sku`
- `regular_price`
- `sale_price`
- `sale_price_dates_from`
- `sale_price_dates_to`
- `tax_status`
- `tax_class`
- `managing_stock`
- `stock_quantity`
- `in_stock`
- `backorders`
- `sold_individually`
- `featured`
- `shipping_class`
- `description`
- `enable_html_description`
- `short_description`
- `enable_html_short_description`
- `reviews_allowed`
- `upsell_ids`
- `cross_sell_ids`
- `parent_id`
- `categories`
- `tags`

<a name="create-product-dimensions-fields"></a>Dimensions fields:

- `dimensions.length`
- `dimensions.width`
- `dimensions.height`
- `dimensions.unit`

<a name="create-product-images-fields"></a>Images is an array in which element can be set by specifying its index:

- `images`
- `images.size`
- `images.0.id`
- `images.0.created_at`
- `images.0.updated_at`
- `images.0.src`
- `images.0.title`
- `images.0.alt`
- `images.0.position`

<a name="create-product-attributes-fields"></a>Attributes is an array in which element can be set by specifying its index:

- `attributes`
- `attributes.size`
- `attributes.0.name`
- `attributes.0.slug`
- `attributes.0.position`
- `attributes.0.visible`
- `attributes.0.variation`
- `attributes.0.options`

<a name="create-product-downloads-fields"></a>Downloads is an array in which element can be accessed by specifying its index:

- `downloads`
- `downloads.size`
- `downloads.0.id`
- `downloads.0.name`
- `downloads.0.file`

Variations is an array in which element can be accessed by specifying its index:

- `variations`
- `variations.size`
- `variations.0.id`
- `variations.0.created_at`
- `variations.0.updated_at`
- `variations.0.downloadable`
- `variations.0.virtual`
- `variations.0.permalink`
- `variations.0.sku`
- `variations.0.price`
- `variations.0.regular_price`
- `variations.0.sale_price`
- `variations.0.sale_price_dates_from`
- `variations.0.sale_price_dates_to`
- `variations.0.taxable`
- `variations.0.tax_status`
- `variations.0.tax_class`
- `variations.0.managing_stock`
- `variations.0.stock_quantity`
- `variations.0.in_stock`
- `variations.0.backordered`
- `variations.0.purchaseable`
- `variations.0.visible`
- `variations.0.on_sale`
- `variations.0.weight`
- `variations.0.dimensions` - [See dimensions fields](#user-content-create-product-dimensions-fields)
- `variations.0.shipping_class`
- `variations.0.shipping_class_id`
- `variations.0.images` - [See images fields](#user-content-create-product-images-fields)
- `variations.0.attributes` - [See attributes fields](#user-content-create-product-attributes-fields)
- `variations.0.downloads` - [See downloads fields](#user-content-create-product-downloads-fields)
- `variations.0.download_limit`
- `variations.0.download_expiry`

#### Example:

```wp wc product create --title="Product Name"```

### Delete Products

#### Command:

```wp wc product delete <id>...```

#### Options:


- `<id>...` - The product ID to delete.


#### Example:

```
wp wc product delete 123
wp wc product delete $(wp wc product list --format=ids)
```

### Get a Product

#### Command:

```wp wc product get <id> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `<id>` - Product ID.
- `[--field=<field>]` - Instead of returning the whole product fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the product&#039;s fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.


#### Available fields:

For more fields, see [List Products fields](#list-product).

#### Example:

```wp wc product get 123 --fields=id,title,sku```

### List Products

#### Command:

```wp wc product list [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `[--<field>=<value>]` - Filter products based on product property.
- `[--field=<field>]` - Prints the value of a single field for each product.
- `[--fields=<fields>]` - Limit the output to specific product fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.


#### Available fields:

- `id`
- `title`
- `sku`
- `in_stock`
- `price`
- `sale_price`
- `categories`
- `tags`
- `type`
- `created_at`


These fields are optionally available:


- `updated_at`
- `status`
- `downloadable`
- `virtual`
- `permalink`
- `regular_price`
- `sale_price_dates_from`
- `sale_price_dates_to`
- `price_html`
- `taxable`
- `tax_status`
- `tax_class`
- `managing_stock`
- `stock_quantity`
- `backorders_allowed`
- `backordered`
- `backorders`
- `sold_individually`
- `purchaseable`
- `featured`
- `visible`
- `catalog_visibility`
- `on_sale`
- `weight`
- `shipping_required`
- `shipping_taxable`
- `shipping_class`
- `shipping_class_id`
- `description`
- `enable_html_description`
- `short_description`
- `enable_html_short_description`
- `reviews_allowed`
- `average_rating`
- `rating_count`
- `related_ids`
- `upsell_ids`
- `cross_sell_ids`
- `parent_id`
- `featured_src`
- `download_limit`
- `download_expiry`
- `download_type`
- `purchase_note`
- `total_sales`
- `parent`
- `product_url`
- `button_text`

There are some properties that are nested array. In such case, if `array.size` is zero then listing the fields with `array.0.some_field` will results in error that field `array.0.some_field` does not exists.

<a name="list-product-dimensions-fields"></a>Dimensions fields:

- `dimensions.length`
- `dimensions.width`
- `dimensions.height`
- `dimensions.unit`

<a name="list-product-images-fields"></a>Images is an array in which element can be accessed by specifying its index:

- `images`
- `images.size`
- `images.0.id`
- `images.0.created_at`
- `images.0.updated_at`
- `images.0.src`
- `images.0.title`
- `images.0.alt`
- `images.0.position`

<a name="list-product-attributes-fields"></a>Attributes is an array in which element can be accessed by specifying its index:

- `attributes`
- `attributes.size`
- `attributes.0.name`
- `attributes.0.slug`
- `attributes.0.position`
- `attributes.0.visible`
- `attributes.0.variation`
- `attributes.0.options`

<a name="list-product-downloads-fields"></a>Downloads is an array in which element can be accessed by specifying its index:

- `downloads`
- `downloads.size`
- `downloads.0.id`
- `downloads.0.name`
- `downloads.0.file`

Variations is an array in which element can be accessed by specifying its index:

- `variations`
- `variations.size`
- `variations.0.id`
- `variations.0.created_at`
- `variations.0.updated_at`
- `variations.0.downloadable`
- `variations.0.virtual`
- `variations.0.permalink`
- `variations.0.sku`
- `variations.0.price`
- `variations.0.regular_price`
- `variations.0.sale_price`
- `variations.0.sale_price_dates_from`
- `variations.0.sale_price_dates_to`
- `variations.0.taxable`
- `variations.0.tax_status`
- `variations.0.tax_class`
- `variations.0.managing_stock`
- `variations.0.stock_quantity`
- `variations.0.in_stock`
- `variations.0.backordered`
- `variations.0.purchaseable`
- `variations.0.visible`
- `variations.0.on_sale`
- `variations.0.weight`
- `variations.0.dimensions` - [See dimensions fields](#user-content-list-product-dimensions-fields)
- `variations.0.shipping_class`
- `variations.0.shipping_class_id`
- `variations.0.images` - [See images fields](#user-content-list-product-images-fields)
- `variations.0.attributes` - [See attributes fields](#user-content-list-product-attributes-fields)
- `variations.0.downloads` - [See downloads fields](#user-content-list-product-downloads-fields)
- `variations.0.download_limit`
- `variations.0.download_expiry`

Fields for filtering query result also available:

- `q` - Filter products with search query.
- `created_at_min` - Filter products whose created after this date.
- `created_at_max` - Filter products whose created before this date.
- `updated_at_min` - Filter products whose updated after this date.
- `updated_at_max` - Filter products whose updated before this date.
- `limit` - The maximum returned number of results.
- `offset` - Offset the returned results.
- `order` - Accepted values: `ASC` and `DESC`. Default: `DESC`.
- `orderby` - Sort retrieved products by parameter. One or more options can be passed.

#### Example:

```
wp wc product list
wp wc product list --field=id
wp wc product list --fields=id,title,type --format=json
```

### Update Products

#### Command:

```wp wc product update <id> [--<field>=<value>]```

#### Options:

- `<id>` - Product ID.
- `[--<field>=<value>]` - One or more fields to update.

#### Available fields:

For more fields, see [Create a Product fields](#create-a-product).

#### Example:

```wp wc product update 123 --title="New Product Title" --description="New description"```

### List of Product Reviews

#### Command:

```wp wc product reviews <id> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `<id>` - Product ID.
- `[--field=<field>]` - Instead of returning the whole review fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the review&#039;s fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.


#### Available fields:


- `id`
- `rating`
- `reviewer_name`
- `reviewer_email`
- `verified`
- `created_at`


#### Example:

```
wp wc product reviews 123
wp wc product reviews 123 --fields=id,rating,reviewer_email
```

### Get Product Types

#### Command:

```wp wc product types```

#### Example:

```wp wc product types```

### Get Product Category

#### Command:

```wp wc product category get <id> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:

- `<id>` - Product category ID.
- `[--field=<field>]` - Instead of returning the whole product category fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the product category's fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.

#### Available fields:

- `id`
- `name`
- `slug`
- `parent`
- `description`
- `display`
- `image`
- `count`

#### Example:

```wp wc product category get 123```

### List of Product Categories

#### Command:

```wp wc coupon create```

#### Options:

- `[--<field>=<value>]` - Filter products based on product property.
- `[--field=<field>]` - Prints the value of a single field for each product.
- `[--fields=<fields>]` - Limit the output to specific product fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.

#### Available fields:

For more fields, see [Get Product Category fields](#get-product-category).

#### Example:

```
wp wc product category list
wp wc product category list --fields=id,name --format=json
```

## Getting Reports

```wp wc report <command>```

### List Reports

#### Command:

```wp wc report list [--format=<format>]```

#### Options:


- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.


#### Example:

```wp wc report list```

### View Sales Report

#### Command:

```wp wc report sales [--field=<field>] [--fields=<fields>] [--format=<format>] [--period=<period>] [--date_min] [--date_max] [--limit]```

#### Options:


- `[--field=<field>]` - Instead of returning the whole report fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the report's fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.
- `[--period=<period>]` - The supported periods are: week, month, last_month, and year. If invalid period is supplied, week is used. If period is not specified, the current day is used.
- `[--date_min]` - Return sales for a specific start date. The date need to be in the `YYYY-MM-AA` format.
- `[--date_max]` - Return sales for a specific end date. The dates need to be in the `YYYY-MM-AA` format.
- `[--limit]` - Limit report result. Default: `12`.


#### Available fields:


- `total_sales`
- `average_sales`
- `total_orders`
- `total_items`
- `total_tax`
- `total_shipping`
- `total_discount`
- `totals_grouped_by`
- `totals`
- `total_customers`


#### Example:

```
wp wc report sales
wp wc report sales --period=last_month
```

### View Report of Top Sellers

#### Command:

```wp wc report top_sellers [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>] [--period=<period>] [--date_min] [--date_max] [--limit]```

#### Options:


- `[--<field>=<value>]` - Filter report based on report property.
- `[--field=<field>]` - Prints the value of a single field for each seller.
- `[--fields=<fields>]` - Limit the output to specific report fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.
- `[--period=<period>]` - The supported periods are: week, month, last_month, and year. If invalid period is supplied, week is used. If period is not specified, the current day is used.
- `[--date_min]` - Return sales for a specific start date. The date need to be in the `YYYY-MM-AA` format.
- `[--date_max]` - Return sales for a specific end date. The dates need to be in the `YYYY-MM-AA` format.
- `[--limit]` - Limit report result. Default: `12`.


#### Available fields:


- `title`
- `product_id`
- `quantity`


#### Example:

```
wp wc report top_sellers
wp wc report top_sellers --period=last_month
```

## Managing Taxes

```wp wc tax <command>```

### Create a Tax Rate

#### Command:

```wp wc tax create [--<field>=<value>] [--porcelain]```

#### Options:


- `[--<field>=<value>]` - Associative args for the new tax rate.
- `[--porcelain]` - Outputs just the new tax rate id.


#### Available fields:


- `country`
- `state`
- `postcode`
- `city`
- `rate`
- `name`
- `priority`
- `compound`
- `shipping`
- `class`
- `order`


#### Example:

```wp wc tax create --country=US --rate=5 --class=standard --type=percent```

### Create a Tax Class

#### Command:

```wp wc tax create_class [--<field>=<value>] [--porcelain]```

#### Options:


- `[--<field>=<value>]` - Associative args for the new tax class.
- `[--porcelain]` - Outputs just the new tax class slug.


#### Available fields:

- `name`

#### Example:

```wp wc tax create_class --name="Reduced Rate"```

### Delete Tax Rates

#### Command:

```wp wc tax delete <id>...```

#### Options:

- `<id>...` - The tax rate ID to delete.

#### Example:

```
wp wc tax delete 123
wp wc tax delete $(wp wc tax list --format=ids)
```

### Delete Tax Classes

#### Command:

```wp wc tax delete_class <slug>...```

#### Options:

- `<slug>...` - The tax class slug to delete.

#### Example:

```
wp wc tax delete_class reduced-rate
wp wc tax delete_class $(wp wc tax list_class --format=ids)
```

### Get a Tax Rate

#### Command:

```wp wc tax get <id> [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:

- `<id>` - Tax rate ID
- `[--field=<field>]` - Instead of returning the whole tax rate fields, returns the value of a single fields.
- `[--fields=<fields>]` - Get a specific subset of the tax rates fields.
- `[--format=<format>]` - Accepted values: table, json, csv. Default: table.

#### Available fields:

- `id`
- `country`
- `state`
- `postcode`
- `city`
- `rate`
- `name`
- `priority`
- `compound`
- `shipping`
- `order`
- `class`

#### Example:

```
wp wc tax get 123 --field=rate
wp wc tax get 321 --format=json > rate321.json
```

### List Tax Rates

#### Command:

```wp wc tax list [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:

- `[--<field>=<value>]` - Filter tax based on tax property.
- `[--field=<field>]` - Prints the value of a single field for each tax.
- `[--fields=<fields>]` - Limit the output to specific tax fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.

#### Available fields:

- `id`
- `country`
- `state`
- `postcode`
- `city`
- `rate`
- `name`
- `priority`
- `compound`
- `shipping`
- `class`

These fields are optionally available:

- `order`

Fields for filtering query result also available:


- `class` - Sort by tax class.
- `page` - Page number.


#### Example:

```
wp wc tax list
wp wc tax list --field=id
wp wc tax list --fields=id,rate,class --format=json
```

### List Tax Classes

#### Command:

```wp wc tax list_class [--<field>=<value>] [--field=<field>] [--fields=<fields>] [--format=<format>]```

#### Options:


- `[--<field>=<value>]` - Filter tax class based on tax class property.
- `[--field=<field>]` - Prints the value of a single field for each tax class.
- `[--fields=<fields>]` - Limit the output to specific tax class fields.
- `[--format=<format>]` - Acceptec values: table, csv, json, count, ids. Default: table.


#### Available fields:


- `slug`
- `name`


#### Example:

```
wp wc tax list_class
wp wc tax list_class --field=slug
wp wc tax list_class --format=json
```

### Update a Tax Rate

#### Command:

```wp wc tax update <id> [--<field>=<value>]```

#### Options:


- `<id>` - The ID of the tax rate to update.
- `[--<field>=<value>]` - One or more fields to update.


#### Available fields:


- `country`
- `state`
- `postcode`
- `city`
- `rate`
- `name`
- `priority`
- `compound`
- `shipping`
- `class`


#### Example:

```wp wc tax update 123 --rate=5```

## Tools

```wp wc tool <command>```

### Clear Product/Shop Transients

#### Command:

```wp wc tool clear_transients```

#### Example:

```wp wc tool clear_transients```
