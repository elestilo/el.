<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Coupon](#coupon)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

In an effort to unify CLI, API, and WP Admin, new CRUD classes are being implemented to form a new 'data manipulation API'.

Each CRUD class contains a representation of the data in array format which can be used by endpoints. This representation may differ from the actual stored 'meta keys' mainly due to legacy, but should represent the objects more clearly.

This document explains the Coupon CRUD.

## Coupon

Name | Type | Description | Example
---- | ---- | ----------- | -------
`id` | `int` | Coupon ID | `1`
`code` | `string` | Coupon code | `test-coupon`
`description` | `string` | Explanation of what the coupon does. | `Take 50% off your next order of $10 or more + free shipping!`
`discount_type` | `string` | Type of discount. Valid values: `fixed_cart`, `percent`, `fixed_product`, `percent_product`. | `percent`
`amount` | `float` | Amount off provided by the coupon. Ran through `wc_format_decimal`. | `50`
`expiry_date` | `string` | Date the coupon expires. | `1456237333`
`usage_count ` | `int` | How many times the coupon has been used. | `15`
`individual_use ` | `bool` | Individual use means this coupon cannot be used in conjunction with other coupons. | `true`
`product_ids` | `array` | Product IDs this coupon can be used with. | `array( 322, 345 )`
`excluded_product_ids` | `array` | Product IDs this coupon cannot be used with. | `array( 295 )`
`usage_limit` | `int` | Amount of times this coupon can be used globally. | `200`
`usage_limit_per_user ` | `int` | Amount of times this coupon can be used by a customer. | `1`
`limit_usage_to_x_items` | `int` | The number of products in your cart this coupon can apply to (for product discounts). | `0`
`free_shipping` | `bool` | Does this coupon grant free shipping? | `true`
`product_categories` | `array` | Product categories this coupon can be used with. | `array( 22 )`
`excluded_product_categories` | `array` | Product categories this coupon cannot be used with. | `array( 26 )`
`exclude_sale_items` | `bool` | Excluding sale items mean this coupon cannot be used on items that are on sale (or carts that contain on sale items). | `false`
`minimum_amount` | `float` | Minimum spend amount that must be met before this coupon can be used. Ran through `wc_format_decimal`. | `10.00`
`maximum_amount` | `float` | Maximum spend amount that must be met before this coupon can be used Ran through `wc_format_decimal`. | `500.00`
`email_restrictions` | `array` | Only customers with a matching email address can use the coupon. | `array( 'test@test.local', 'woo@test.local' )`
`used_by` | `array` | List of user IDs who have used the coupon. | `array( 63 )`
`custom_fields` | `array` | Read only array of all custom fields associated with this coupon. | `array( '_wc_points_modifier' => 2 )`
`custom_field` | `string` | Single custom field associated with this coupon. | `2`
`discount_amount` | `float` | Read only discount total for an item or cart. | `10.00`