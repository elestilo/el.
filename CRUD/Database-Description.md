<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Table Overview](#table-overview)
- [Table Details](#table-details)
  - [Table: `woocommerce_sessions`](#table-woocommerce_sessions)
  - [Table: `woocommerce_api_keys`](#table-woocommerce_api_keys)
  - [Table: `woocommerce_attribute_taxonomies`](#table-woocommerce_attribute_taxonomies)
  - [Table: `woocommerce_downloadable_product_permissions`](#table-woocommerce_downloadable_product_permissions)
  - [Table: `woocommerce_order_items`](#table-woocommerce_order_items)
  - [Table: `woocommerce_order_itemmeta`](#table-woocommerce_order_itemmeta)
  - [Table: `woocommerce_tax_rates`](#table-woocommerce_tax_rates)
  - [Table: `woocommerce_tax_rate_locations`](#table-woocommerce_tax_rate_locations)
  - [Table: `woocommerce_shipping_zones`](#table-woocommerce_shipping_zones)
  - [Table: `woocommerce_shipping_zone_locations`](#table-woocommerce_shipping_zone_locations)
  - [Table: `woocommerce_shipping_zone_methods`](#table-woocommerce_shipping_zone_methods)
  - [Table: `woocommerce_payment_tokens`](#table-woocommerce_payment_tokens)
  - [Table: `woocommerce_payment_tokenmeta`](#table-woocommerce_payment_tokenmeta)
  - [Table: `woocommerce_log`](#table-woocommerce_log)
  - [Table: `wc_webhooks`](#table-wc_webhooks)
  - [Table: `wc_download_log`](#table-wc_download_log)
- [Source File](#source-file)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Since WooCommerce is a WordPress plugin, it makes use of many of the WordPress tables. Therefore, to understand the structure of WordPress, please see the [WordPress Database Description doc](https://codex.wordpress.org/Database_Description). 

Note that the posts tables is used by Custom Post Types, and WooCommerce uses those for products, coupons, and orders.

WooCommerce also add some of it's own custom tables. These are listed below.

## Table Overview

The following tables are installed with WooCommerce. Please note, each table name will be prefixed with your WP Database Table Prefix e.g. `wp_`.

| Table Name                                     | Description                                                                           |
|------------------------------------------------|---------------------------------------------------------------------------------------|
| `woocommerce_sessions`                         | Stores customer session data, such as carts.                                          |
| `woocommerce_api_keys`                         | Stores API Keys used for the REST API.                                                |
| `woocommerce_attribute_taxonomies`             | Stores global attribute taxonomy names for products.                                  |
| `woocommerce_downloadable_product_permissions` | Stores product access permissions for downloadable products (granted after purchase). |
| `woocommerce_order_items`                      | Stores line items which are associated with orders.                                   |
| `woocommerce_order_itemmeta`                   | Stores meta data about order line items.                                              |
| `woocommerce_tax_rates`                        | Stores tax rates you define in the admin area.                                        |
| `woocommerce_tax_rate_locations`               | Stores locations (postcodes and cities) associated with the above tax rates.          |
| `woocommerce_shipping_zones`                   | Stores shipping zones you create in the settings area.                                |
| `woocommerce_shipping_zone_locations`          | Stores locations associated with your shipping zones.                                 |
| `woocommerce_shipping_zone_methods`            | Stores shipping methods linked to your shipping zones.                                |
| `woocommerce_payment_tokens`                   | Stores customer payment tokens (used by gateways).                                    |
| `woocommerce_payment_tokenmeta`                | Stores meta data about payment tokens.                                                |
| `woocommerce_log`                              | General logging table (alternative to file based logging).                            |
| `wc_webhooks`                                  | Stores any webhooks that have been setup on the store.                                |
| `wc_download_log`                              | Logs user downloads of downloadable products.                                         |
| `wc_product_meta_lookup`                       | Lookup table that indexes order meta data to speed up requests.                       |
| `wc_tax_rate_classes`                          | Stores tax classes data.                                                              |

## Table Details

### Table: `woocommerce_sessions`

| Field            | Type         | Null    | Key | Default        | Extra |
|------------------|--------------|---------|-----|----------------|-------|
| `session_id`     | `bigint(20)` | Unique  |     | auto_increment |       |
| `session_key`    | `char(32)`   | Primary |     |                |       |
| `session_value`  | `longtext`   |         |     |                |       |
| `session_expiry` | `bigint(20)` |         |     |                |       |

### Table: `woocommerce_api_keys`

| Field             | Type          | Null | Key               | Default | Extra          |
|-------------------|---------------|------|-------------------|---------|----------------|
| `key_id`          | `bigint(20)`  |      | Primary           |         | auto_increment |
| `user_id`         | `bigint(20)`  |      |                   |         |                |
| `description`     | `longtext`    | Yes  |                   |         |                |
| `permissions`     | `varchar(10)` |      |                   |         |                |
| `consumer_key`    | `char(64)`    |      | `consumer_key`    |         |                |
| `consumer_secret` | `char(43)`    |      | `consumer_secret` |         |                |
| `nonces`          | `longtext`    | Yes  |                   |         |                |
| `truncated_key`   | `char(7)`     |      |                   |         |                |
| `last_access`     | `datetime`    | Yes  |                   | null    |                |

### Table: `woocommerce_attribute_taxonomies`

| Field               | Type           | Null | Key              | Default | Extra          |
|---------------------|----------------|------|------------------|---------|----------------|
| `attribute_id`      | `bigint(20)`   |      | Primary          |         | auto_increment |
| `attribute_name`    | `varchar(200)` |      | `attribute_name` |         |                |
| `attribute_label`   | `longtext`     | Yes  |                  |         |                |
| `attribute_type`    | `varchar(200)` |      |                  |         |                |
| `attribute_orderby` | `varchar(200)` |      |                  |         |                |
| `attribute_public`  | `int(1)`       |      |                  | `1`     |                |

### Table: `woocommerce_downloadable_product_permissions`

| Field                 | Type           | Null | Key                                                    | Default               | Extra          |
|-----------------------|----------------|------|--------------------------------------------------------|-----------------------|----------------|
| `permission_id`       | `bigint(20)`   |      | Primary                                                |                       | auto_increment |
| `download_id`         | `varchar(32)`  |      | `download_order_product`                               |                       |                |
| `product_id`          | `bigint(20)`   |      | `download_order_key_product`, `download_order_product` |                       |                |
| `order_id`            | `bigint(20)`   |      | `download_order_key_product`, `download_order_product` | `0`                   |                |
| `order_key`           | `varchar(200)` |      | `download_order_key_product`                           |                       |                |
| `user_email`          | `varchar(200)` |      |                                                        |                       |                |
| `user_id`             | `bigint(20)`   | Yes  |                                                        |                       |                |
| `downloads_remaining` | `varchar(9)`   | Yes  |                                                        |                       |                |
| `access_granted`      | `datetime`     |      |                                                        | '0000-00-00 00:00:00' |                |
| `access_expires`      | `datetime`     | Yes  |                                                        | null                  |                |
| `download_count`      | `bigint(20)`   |      |                                                        | `0`                   |                |

### Table: `woocommerce_order_items`

| Field             | Type           | Null | Key        | Default | Extra          |
|-------------------|----------------|------|------------|---------|----------------|
| `order_item_id`   | `bigint(20)`   |      | Primary    |         | auto_increment |
| `order_item_name` | `longtext`     |      |            |         |                |
| `order_item_type` | `varchar(200)` |      |            | ``      |                |
| `order_id`        | `bigint(20)`   |      | `order_id` |         |                |

### Table: `woocommerce_order_itemmeta`

| Field           | Type           | Null | Key             | Default | Extra          |
|-----------------|----------------|------|-----------------|---------|----------------|
| `meta_id`       | `bigint(20)`   |      | Primary         |         | auto_increment |
| `order_item_id` | `bigint(20)`   |      | `order_item_id` |         |                |
| `meta_key`      | `varchar(255)` |      | `meta_key`      | null    |                |
| `meta_value`    | `longtext`     | Yes  |                 |         |                |

### Table: `woocommerce_tax_rates`

| Field               | Type           | Null | Key                 | Default | Extra          |
|---------------------|----------------|------|---------------------|---------|----------------|
| `tax_rate_id`       | `bigint(20)`   |      | Primary             |         | auto_increment |
| `tax_rate_country`  | `varchar(200)` |      | `tax_rate_country`  | ``      |                |
| `tax_rate_state`    | `varchar(200)` |      | `tax_rate_state`    | ``      |                |
| `tax_rate`          | `varchar(200)` |      |                     | ``      |                |
| `tax_rate_name`     | `varchar(200)` |      |                     | ``      |                |
| `tax_rate_priority` | `bigint(20)`   |      | `tax_rate_priority` | ``      |                |
| `tax_rate_compound` | `int(1)`       |      |                     | `0`     |                |
| `tax_rate_shipping` | `int(1)`       |      |                     | `1`     |                |
| `tax_rate_order`    | `bigint(20)`   |      |                     |         |                |
| `tax_rate_class`    | `varchar(200)` |      | `tax_rate_class`    | ``      |                |

### Table: `woocommerce_tax_rate_locations`

| Field           | Type           | Null | Key                                   | Default | Extra          |
|-----------------|----------------|------|---------------------------------------|---------|----------------|
| `location_id`   | `bigint(20)`   |      | Primary                               |         | auto_increment |
| `location_code` | `varchar(255)` |      | `location_type_code`                  |         |                |
| `tax_rate_id`   | `bigint(20)`   |      | `tax_rate_id`                         |         |                |
| `location_type` | `varchar(40)`  |      | `location_type`, `location_type_code` |         |                |

### Table: `woocommerce_shipping_zones`

| Field        | Type           | Null | Key     | Default | Extra          |
|--------------|----------------|------|---------|---------|----------------|
| `zone_id`    | `bigint(20)`   |      | Primary |         | auto_increment |
| `zone_name`  | `varchar(255)` |      |         |         |                |
| `zone_order` | `bigint(20)`   |      |         |         |                |

### Table: `woocommerce_shipping_zone_locations`

| Field           | Type           | Null | Key                                   | Default | Extra          |
|-----------------|----------------|------|---------------------------------------|---------|----------------|
| `location_id`   | `bigint(20)`   |      | Primary                               |         | auto_increment |
| `zone_id`       | `bigint(20)`   |      |                                       |         |                |
| `location_code` | `varchar(255)` |      | `location_type_code`                  |         |                |
| `location_type` | `varchar(40)`  |      | `location_type`, `location_type_code` |         |                |

### Table: `woocommerce_shipping_zone_methods`

| Field          | Type           | Null | Key     | Default | Extra          |
|----------------|----------------|------|---------|---------|----------------|
| `zone_id`      | `bigint(20)`   |      |         |         |                |
| `instance_id`  | `bigint(20)`   |      | Primary |         | auto_increment |
| `method_id`    | `varchar(255)` |      |         |         |                |
| `method_order` | `bigint(20)`   |      |         |         |                |
| `is_enabled`   | `tinyint(1)`   |      |         | `1`     |                |

### Table: `woocommerce_payment_tokens`

| Field        | Type           | Null | Key       | Default | Extra          |
|--------------|----------------|------|-----------|---------|----------------|
| `token_id`   | `bigint(20)`   |      | Primary   |         | auto_increment |
| `gateway_id` | `varchar(255)` |      |           |         |                |
| `token`      | `text`         |      |           |         |                |
| `user_id`    | `bigint(20)`   |      | `user_id` | `0`     |                |
| `type`       | `varchar(255)` |      |           |         |                |
| `is_default` | `tinyint(1)`   |      |           | `0`     |                |

### Table: `woocommerce_payment_tokenmeta`

| Field              | Type           | Null | Key                | Default | Extra          |
|--------------------|----------------|------|--------------------|---------|----------------|
| `meta_id`          | `bigint(20)`   |      | Primary            |         | auto_increment |
| `payment_token_id` | `bigint(20)`   |      | `payment_token_id` |         |                |
| `meta_key`         | `varchar(255)` | Yes  | `meta_key`         |         |                |
| `meta_value`       | `longtext`     | Yes  |                    |         |                |

### Table: `woocommerce_log`

| Field       | Type           | Null | Key     | Default | Extra          |
|-------------|----------------|------|---------|---------|----------------|
| `log_id`    | `bigint(20)`   |      | Primary |         | auto_increment |
| `timestamp` | `datetime`     |      |         |         |                |
| `level`     | `smallint(4)`  |      | `level` |         |                |
| `source`    | `varchar(200)` |      |         |         |                |
| `message`   | `longtext`     |      |         |         |                |
| `context`   | `longtext`     | Yes  |         |         |                |

### Table: `wc_webhooks`

| Field               | Type           | Null | Key       | Default               | Extra          |
|---------------------|----------------|------|-----------|-----------------------|----------------|
| `webhook_id`        | `bigint(20)`   |      | Primary   |                       | auto_increment |
| `status`            | `varchar(200)` |      |           |                       |                |
| `name`              | `text`         |      |           |                       |                |
| `user_id`           | `bigint`       |      | `user_id` |                       |                |
| `delivery_url`      | `text`         |      |           |                       |                |
| `secret`            | `text`         | Yes  |           |                       |                |
| `topic`             | `varchar(200)` | Yes  |           |                       |                |
| `date_created`      | `datetime`     | Yes  |           | `0000-00-00 00:00:00` |                |
| `date_created_gmt`  | `datetime`     | Yes  |           | `0000-00-00 00:00:00` |                |
| `date_modified`     | `datetime`     | Yes  |           | `0000-00-00 00:00:00` |                |
| `date_modified_gmt` | `datetime`     | Yes  |           | `0000-00-00 00:00:00` |                |
| `api_version`       | `smallint(4)`  | Yes  |           |                       |                |
| `failure_count`     | `smallint(10)` | Yes  |           |                       |                |
| `pending_delivery`  | `tinyint(1)`   | Yes  |           |                       |                |

### Table: `wc_download_log`

| Field             | Type           | Null | Key             | Default | Extra          |
|-------------------|----------------|------|-----------------|---------|----------------|
| `download_log_id` | `bigint(20)`   |      | Primary         |         | auto_increment |
| `timestamp`       | `datetime`     |      | `timestamp`     |         |                |
| `permission_id`   | `bigint(20)`   |      | `permission_id` |         |                |
| `user_id`         | `bigint(20)`   | Yes  |                 |         |                |
| `user_ip_address` | `varchar(100)` | Yes  |                 |         |                |

### Table: `wc_product_meta_lookup`

| Field            | Type            | Null | Key              | Default      | Extra |
|------------------|-----------------|------|------------------|--------------|-------|
| `product_id`     | `bigint(20)`    |      | Primary          |              |       |
| `sku`            | `varchar(100)`  | Yes  |                  | Empty string |       |
| `virtual`        | `tinyint(1)`    | Yes  | `virtual`        | 0            |       |
| `downloadable`   | `tinyint(1)`    | Yes  | `downloadable`   | 0            |       |
| `min_price`      | `decimal(10,2)` | Yes  | `min_max_price`  | Null         |       |
| `max_price`      | `decimal(10,2)` | Yes  | `min_max_price`  | Null         |       |
| `onsale`         | `tinyint(1)`    | Yes  | `onsale`         | 0            |       |
| `stock_quantity` | `double`        | Yes  | `stock_quantity` | Null         |       |
| `stock_status`   | `varchar(100)`  | Yes  | `stock_status`   | 'instock'    |       |
| `rating_count`   | `bigint(20)`    | Yes  |                  | 0            |       |
| `average_rating` | `decimal(3,2)`  | Yes  |                  | 0.00         |       |
| `total_sales`    | `bigint(20)`    | Yes  |                  | 0            |       |

### Table: `wc_tax_rate_classes`

| Field               | Type           | Null | Key     | Default | Extra          |
|---------------------|----------------|------|---------|---------|----------------|
| `tax_rate_class_id` | `bigint`       |      | Primary |         | auto_increment |
| `name`              | `varchar(200)` |      |         |         |                |
| `slug`              | `varchar(200)` |      | `slug`  |         |                |

## Source File
The database scheme is defined in [`includes/class-wc-install.php`](https://github.com/woocommerce/woocommerce/blob/master/includes/class-wc-install.php)