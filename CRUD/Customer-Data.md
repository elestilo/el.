<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Customer](#customer)
  - [Billing address](#billing-address)
  - [Shipping Address](#shipping-address)
- [Customer Download](#customer-download)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

In an effort to unify CLI, API, and WP Admin, new CRUD classes are being implemented to form a new 'data manipulation API'.

Each CRUD class contains a representation of the data in array format which can be used by endpoints. This representation may differ from the actual stored 'meta keys' mainly due to legacy, but should represent the objects more clearly.

This document explains the `WC_Customer` and `WC_Customer_Download` classes.

## Customer

Name | Type | Description | Example
---- | ---- | ----------- | -------
`id` | `int` | Customer ID. | `1`
`date_created ` | `WC_DateTime|null` | `WC_DateTime` object for when customer was created or `null` if not set. Read only. | `1450186657`
`date_modified` | `WC_DateTime|null` | `WC_DateTime` object for when customer was last modified or `null` if not set. Read only. | `1457549521`
`email` | `string` | Customer email address. | `test@woo.local`
`first_name` | `string` | First name of customer. | `Justin`
`last_name` | `string` | Last name of customer. | `Shreve`
`role` | `string` | User role (customer for normal customers). | `customer`
`username` | `string` | Username for account login. | `justin`
`password` | `string` | Password for account login. Write only. | ``
`billing` | `array` | Array of billing address data. | See address data below.
`shipping` | `array` | Array of shipping address data. | See address data below.
`is_paying_customer` | `boolean` | Flag saying if this customer has bought something. | `true`

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

## Customer Download

Name | Type | Description | Example
---- | ---- | ----------- | -------
`download_id` | `string` | Download ID. | `91447fd1849316bbc89dfb7e986a6006`
`product_id` | `integer` | Product ID. | `87`
`user_id` | `integer` | User ID. | `1`
`user_email` | `integer` | User email. | `john.doe@example.com`
`order_id` | `integer` | Order ID. | `703`
`order_key` | `string` | Order key. | `wc_order_58c737bcc7b`
`downloads_remaining` | `string` | Empty string if unlimited, or numeric indicating how many downloads are available. | `wc_order_58c737bcc7b`
`access_granted` | `WC_DateTime|null` | `WC_DateTime` object for when access has been granted or `null` if not set. | `wc_order_58c737bcc7b`
`access_expires` | `WC_DateTime|null` | `WC_DateTime` object for when access expires or `null` if do not expires. | `wc_order_58c737bcc7b`
`download_count` | `integer` | Download count | `wc_order_58c737bcc7b`
