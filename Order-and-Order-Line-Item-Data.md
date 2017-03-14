<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Abstract Order](#abstract-order)
- [Refund](#refund)
- [Order](#order)
  - [Billing address](#billing-address)
  - [Shipping Address](#shipping-address)
- [Line Item (product)](#line-item-product)
- [Fee Line](#fee-line)
- [Shipping Line](#shipping-line)
- [Tax Line](#tax-line)
- [Coupon Line](#coupon-line)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

In an effort to unify CLI, API, and WP Admin, new CRUD classes are being implemented to form a new 'data manipulation API'. 

Each CRUD class contains a representation of the data in array format which can be used by endpoints. This representation may differ from the actual stored 'meta keys' mainly due to legacy, but should represent the objects more clearly.

To get the data from an object, such as an order or line item, `$object->get_data()` is used. The following structure is used based on stored data and the v3 REST API.

## Abstract Order

This abstract order type is extended by Refunds and Orders.

Name | Type | Description | Example
---- | ---- | ----------- | -------
`id` | `int` | Order ID | `1`
`parent_id` | `int` | Parent Order ID | `2`
`status` | `string` | Order Status | `wc-pending`
`type` | `string` | Order type. Valid values: `shop_order`, `refund` | `shop_order`
`order_key` | `string` | Random hash/order key | `xxxxxxxx`
`currency` | `string` | Currency the order was created with | `GBP`
`version ` | `string` | Version of WooCommerce when the order was made. | `2.5.0`
`prices_include_tax ` | `bool` | Did the prices include tax during checkout? | `true`
`date_created` | `WC_DateTime|NULL` | WC_DateTime object for when order was created or null if not set |
`date_modified` | `WC_DateTime|NULL` | WC_DateTime object for when order was last modified or null if not set |
`customer_id` | `int` | User ID who owns the order. 0 for guests | `1`
`discount_total ` | `string` | Total discount amount for the order. Ran through `wc_format_decimal`. Sum of line item discounts. | `20.00`
`discount_tax ` | `string` | Total discount tax amount for the order. Ran through `wc_format_decimal`. Sum of line item tax discounts. | `2.00`
`shipping_total ` | `string` | Total shipping amount for the order. Ran through `wc_format_decimal`. Sum of shipping lines. Does not include taxes. | `12.00`
`shipping_tax ` | `string` | Total shipping tax amount for the order. Ran through `wc_format_decimal`. Sum of shipping line taxes. | `2.00`
`cart_tax ` | `string` | Sum of line item taxes only. Ran through `wc_format_decimal`. Previously referred to as `order_tax` but renamed for clarity. | `20.00`
`total ` | `string` | Grand total. Ran through `wc_format_decimal`. | `20.00`
`total_tax ` | `string` | Sum of ALL taxes. Ran through `wc_format_decimal`. | `20.00`
`line_items ` | array | Read only array of line item objects. | See below.
`tax_lines ` | array | Read only array of tax line item objects. | See below.
`shipping_lines ` | array | Read only array of shipping line item objects. | See below.
`fee_lines ` | array | Read only array of fee objects. | See below.
`coupon_lines ` | array | Read only array of coupon objects. | See below.
`meta_data` | `array` | Array of order item meta data. | `array( 100 => array( 100 => array( 'key' => 'value' ), 101 => array( 'key' => 'value' ) )`

## Refund

Abstract order properties, plus the following:

Name | Type | Description | Example
---- | ---- | ----------- | -------
`refund_amount` | `float` | Amount refunded. | `20.00`
`refund_reason ` | `string` | Reason for refund. | `Broken on arrival.`
`refunded_by ` | `int` | ID of user who performed the refund. | `1`

## Order

Abstract order properties, plus the following:

Name | Type | Description | Example
---- | ---- | ----------- | -------
`billing` | `array` | Array of billing address data. | See address data below.
`shipping` | `array` | Array of shipping address data. | See address data below.
`payment_method ` | `string` | Payment method ID. | `paypal`
`payment_method_title ` | `string` | Payment method title. | `PayPal`
`transaction_id ` | `string` | Unique transaction ID | `123456`
`customer_ip_address ` | `string` | Customer's IP address. | `86.163.90.200`
`customer_user_agent ` | `string` | User agent of the customer. | `Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36`
`created_via ` | `string` | What created the order? | `checkout`
`customer_note ` | `string` | Note left by customer during checkout. | `Please leave package by the back gate.`
`date_paid ` | `WC_DateTime|NULL` | WC_DateTime object for order payment date or null if not set. |
`date_completed ` | `WC_DateTime|NULL` | WC_DateTime object for order completion date or null if not set. |
`cart_hash` | `string` | md5 hash of cart items to ensure orders are not modified. |

### Billing address

Name | Type | Description | Example
---- | ---- | ----------- | -------
`first_name` | `string` | Billing first name | `Michael`
`last_name` | `string` | Billing last name | `Jolley`
`company` | `string` | Billing company name | `Automattic`
`address_1` | `string` | Billing address line 1 | `32 Wiggely Point`
`address_2` | `string` | Billing address line 2 | `Some street`
`city ` | `string` | Billing address city | `Cambridge`
`state ` | `string` | Billing address state/county | `Cambridgeshire`
`postcode ` | `string` | Billing address postcode/zip | `CB23 1PO`
`country ` | `string` | Billing address country code in ISO 3166-1 alpha-2 format | `GB`
`email ` | `string` | Billing email | `mike@test.com`
`phone ` | `string` | Billing phone number | `123456789`

### Shipping Address

Name | Type | Description | Example
---- | ---- | ----------- | -------
`first_name` | `string` | Shipping first name | `Michael`
`last_name` | `string` | Shipping last name | `Jolley`
`company` | `string` | Shipping company name | `Automattic`
`address_1` | `string` | Shipping address line 1 | `32 Wiggely Point`
`address_2` | `string` | Shipping address line 2 | `Some street`
`city ` | `string` | Shipping address city | `Cambridge`
`state ` | `string` | Shipping address state/county | `Cambridgeshire`
`postcode ` | `string` | Shipping address postcode/zip | `CB23 1PO`
`country ` | `string` | Shipping address country code in ISO 3166-1 alpha-2 format | `GB`

## Line Item (product)

Name | Type | Description | Example
---- | ---- | ----------- | -------
`order_id` | `int` | Order ID this item belongs to. | `1`
`order_item_id ` | `int` | Item ID. | `1`
`name ` | `string` | Product name. | `Pants`
`product_id ` | `int` | Product ID. | `1`
`variation_id ` | `int` | Variation ID, if applicable. | `1`
`qty ` | `int` | Quantity ordered. | `1`
`tax_class ` | `string` | Tax class of product | `reduced-rate`
`subtotal ` | `string` | Line subtotal (before discounts). Ran through `wc_format_decimal`. | `19.00`
`subtotal_tax ` | `string` | Line subtotal tax (before discounts). Ran through `wc_format_decimal`. | `1.00`
`total ` | `string` | Line total (after discounts). Ran through `wc_format_decimal`. | `19.00`
`total_tax` | `string` | Line total tax (after discounts). Ran through `wc_format_decimal`. | `1.00`
`taxes` | `array` | Line item taxes for both total and subtotal. Array of `Rate ID => Total`. | `array( 'subtotal' => array( 1 => '20.00', 2 => '10.00' ), 'total' => array( 1 => '20.00', 2 => '10.00' ) )`
`meta_data` | `array` | Array of order item meta data. | `array( 100 => array( 100 => array( 'key' => 'value' ), 101 => array( 'key' => 'value' ) )`

## Fee Line

Name | Type | Description | Example
---- | ---- | ----------- | -------
`order_id` | `int` | Order ID this item belongs to. | `1`
`order_item_id ` | `int` | Item ID. | `1`
`name ` | `string` | Fee name. | `Pants`
`tax_class ` | `string` | Tax class of fee. | `reduced-rate`
`tax_status ` | `string` | Tax status of fee. | `taxable`
`total ` | `string` | Line total (after discounts). Ran through `wc_format_decimal`. | `19.00`
`total_tax` | `string` | Line total tax (after discounts). Ran through `wc_format_decimal`. | `1.00`
`taxes` | `array` | Line item taxes for both total. Array of `Rate ID => Total`. | `array( 'total' => array( 1 => '20.00', 2 => '10.00' ) )`
`meta_data` | `array` | Array of order item meta data. | `array( 100 => array( 100 => array( 'key' => 'value' ), 101 => array( 'key' => 'value' ) )`

## Shipping Line

Name | Type | Description | Example
---- | ---- | ----------- | -------
`order_id` | `int` | Order ID this item belongs to. | `1`
`order_item_id ` | `int` | Item ID. | `1`
`method_title ` | `string` | Shipping method name. | `Flat Rate`
`method_id ` | `int` | Shipping method ID. | `flat_rate`
`total ` | `string` | Line total (after discounts). Ran through `wc_format_decimal`. | `19.00`
`total_tax ` | `string` | Line total tax (after discounts). Ran through `wc_format_decimal`. | `1.00`
`taxes ` | `array` | Line item taxes. Array of `Rate ID => Total`. | `array( 'total' => array( 1 => '20.00', 2 => '10.00' ) )`
`meta_data` | `array` | Array of order item meta data. | `array( 100 => array( 100 => array( 'key' => 'value' ), 101 => array( 'key' => 'value' ) )`

## Tax Line

Name | Type | Description | Example
---- | ---- | ----------- | -------
`order_id` | `int` | Order ID this item belongs to. | `1`
`order_item_id ` | `int` | Item ID. | `1`
`rate_code ` | `string` | Tax Rate code. | `GB-TAX-1`
`rate_id ` | `int` | Tax rate ID. | `10`
`label ` | `string` | Tax rate label. | `VAT`
`compound ` | `bool` | Is this a compound tax rate? | `false`
`tax_total ` | `string` | Tax total (not including shipping taxes). Ran through `wc_format_decimal`. | `19.00`
`shipping_tax_total ` | `string` | Shipping tax total. Ran through `wc_format_decimal`. | `1.00`
`meta_data` | `array` | Array of order item meta data. | `array( 100 => array( 100 => array( 'key' => 'value' ), 101 => array( 'key' => 'value' ) )` 
  
## Coupon Line

Name | Type | Description | Example
---- | ---- | ----------- | -------
`order_id` | `int` | Order ID this item belongs to. | `1`
`order_item_id ` | `int` | Item ID. | `1`
`code ` | `string` | Coupon code. | `DISCOUNT-1`
`discount ` | `string` | Discount total. Ran through `wc_format_decimal`. | `19.00`
`discount_tax ` | `string` | Discount total tax. Ran through `wc_format_decimal`. | `1.00`
`meta_data` | `array` | Array of order item meta data. | `array( 100 => array( 100 => array( 'key' => 'value' ), 101 => array( 'key' => 'value' ) )` 