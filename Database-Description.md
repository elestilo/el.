Since WooCommerce is a WordPress plugin, it makes use of many of the WordPress tables. Therefore, to understand the structure of WordPress, please see the [WordPress Database Description doc](https://codex.wordpress.org/Database_Description). 

Note that the posts tables are used for Custom Post Types, and we use those for:

- Products
- Coupons
- Orders
- Webhooks

We do however also add some of our own custom tables. These are listed below.

## Table Overview

The following tables are installed with WooCommerce. Please note, each table name will be prefixed with your WP Database Table Prefix e.g. `wp_`.

| Table Name         | Description |
|:-------------------|:------------|
| `woocommerce_sessions` | Stores customer session data, such as carts. |
| `woocommerce_api_keys` | Stores API Keys used for the REST API. |
| `woocommerce_attribute_taxonomies` | Stores global attribute taxonomy names for products. |
| `woocommerce_downloadable_product_permissions` | Stores product access permissions for downloadable products (granted after purchase). |
| `woocommerce_order_items` | Stores line items which are associated with orders. |
| `woocommerce_order_itemmeta` | Stores meta data about order line items. |
| `woocommerce_tax_rates` | Stores tax rates you define in the admin area. |
| `woocommerce_tax_rate_locations` | Stores locations (postcodes and cities) associated with the above tax rates. |
| `woocommerce_shipping_zones` | Stores shipping zones you create in the settings area. |
| `woocommerce_shipping_zone_locations` | Stores locations associated with your shipping zones. |
| `woocommerce_shipping_zone_methods` | Stores shipping methods linked to your shipping zones. |
| `woocommerce_payment_tokens` | Stores customer payment tokens (used by gateways). |
| `woocommerce_payment_tokenmeta` | Stores meta data about payment tokens. |
