<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [CSV Rules](#csv-rules)
- [Basic Props](#basic-props)
- [Special or mapped props](#special-or-mapped-props)
- [Excluded props by default](#excluded-props-by-default)
- [Props -> CSV Format](#props---csv-format)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This is a proposal for the CSV Import Schema for https://github.com/woocommerce/woocommerce/issues/13077.

---

## CSV Rules

- Must be in UTF8 format.
- Dates in ISO 8601 format using the local store timezone.
- Boolean values use 1 or 0.
- Arrays of fields use commas to separate values.
- Human readable values rather than programmatic e.g. names instead of ids.
- Linking to products use product NAME or SKU.
- -1 unlimited values leave field blank.
- No column match treated as **custom meta data**.
- Custom meta is supported/imported but only plain text - no support for JSON or Serialised data. Let extensions take care of this themselves.
- Taxonomies must be registered/identified by a filter to be imported as such.
- Taxonomy hierarchy uses `>`
- Core types will include `variation` to keep them in the same CSV. Non-variation fields ignored on import. Non-variation fields set to `null` or `n/a` on export.
- Serialised data is not supported.
- All column headers use 'nice' names, not the actual props/key values.
- On import, to map products to other products use ROW number? Since IDs do not exist.

## Image handling

- Images need to be pre-uploaded or available online.
- URLs are supported and imported into the media library if used. 
- To prevent duplication, imported images should store the source URL in meta.
- Allow user to define the filename and compare this to the media library filenames to link images to a product.

## Basic Props

- id
- sku
- name
- status
- featured
- catalog_visibility
- description
- short_description
- date_on_sale_from
- date_on_sale_to
- tax_status
- tax_class
- stock_status
- backorders
- sold_individually
- weight
- length
- width
- height
- reviews_allowed
- purchase_note

## Special or mapped props

- price (maps to sale or regular)
- regular_price
- upsell_ids - Avoid use of IDs?
- cross_sell_ids
- category_ids
- tag_ids
- parent_id
- shipping_class_id
- type / virtual / downloadable
- downloads
- download_limit
- download_expiry
- image_id / gallery_image_ids
- default_attributes
- attributes
- manage_stock
- stock_quantity

## Excluded props by default

These props can be imported, but they are never exported by default due to being of minor importance:

- date_created
- sale_price
- menu_order ?
- slug - Generate from name. Enabled by filter.
- total_sales

These props are neither imported or exported:

- date_modified
- rating_counts
- average_rating
- review_count
- meta_data

## Props -> CSV Format

| Prop | Name in CSV | Example | Notes |
|---|---|---|---|
| `id` | ID | `100` | Defining this will overwrite data for that ID on import. |
| `type` | Type | `simple`, `variation, virtual` | Product Type. Valid values: simple, variable, grouped, external, variation, virtual, downloadable. Multiple types can be used CSV separated. |
| `sku` | SKU | `my-sku` | Required. Auto-generated if missing. |
| `name` | Name | `My Product Name` | Required. |
| `status` | Published | `1` | 1 for published, 0 for draft. |
| `featured` | Is featured? | `1` | 1 or 0 |
| `catalog_visibility` | Visibility in catalog | `visible` | Supported values: `visible`, `catalog`, `search`, `hidden` |
| `short_description` | Short Description | `This is a product.` |  |
| `description` | Description | `This is more information about a product.` |  |
| `date_on_sale_from` | Date sale price starts | `2013-06-07 10:53:15` | Date or leave blank. |
| `date_on_sale_to` | Date sale price ends | `2013-06-07 10:53:15` | Date or leave blank. |
| `tax_status` | Tax Status | `taxable` | Supported values: `taxable`, `shipping`, `none` |
| `tax_class` | Tax Class | `standard` | Can use any existing tax class. |
| `stock_status` | In stock? | `1` | 1 or 0 |
| `backorders` | Backorders allowed? | `1` | 1, 0, or `notify` |
| `sold_individually` | Sold individually? | `1` | 1 or 0 |
| `weight` | Weight (unit) | `100` | Parse only numbers. |
| `length` | Length (unit) | `20` | Parse only numbers. |
| `width` | Width (unit) | `20` | Parse only numbers. |
| `height` | Height (unit) | `20` | Parse only numbers. |
| `reviews_allowed` | Allow customer reviews? | `1` | 1 or 0 |
| `purchase_note` | Purchase Note | `Thanks for buying it buddy.` |  |
| `price` | Price | `20.99` | May set sale or regular price depending on other columns. |
| `regular_price ` | Regular Price | `24.99` | Non-sale price. |
| `manage_stock / stock_quantity ` | Stock | `20` | Numeric stock level enables stock management. `parent` can be used for variations. Blank = no stock management. |
| `category_ids` | Categories | `Category 1, Category 1 > Category 2` | CSV list of categories. `>` used for hierarchy. |
| `tag_ids ` | Tags | `Tax 1, Tag 2` | CSV list of tags. |
| `shipping_class_id` | Shipping Class | `Name` | Name of shipping class |
| `attributes` | Attribute 1 Name | `Color` | Looks for global attribute or uses text if not found. Include as many as needed. "Used for variations" is set automatically. |
| `attributes` | Attribute 1 Value(s) | `Blue, Red, Green` | List of values. Variations only need 1 value. First is used if multiple get provided. |
| `default_attributes` | Attribute 1 Default | `Blue` | Default value for variable products. |
| `attributes` | Attribute 1 Visible | `1` | 1 or 0 |
| `image_id / gallery_image_ids` | Images | `http://somewhere.com/image.jpg, http://somewhere.com/image2.jpg` | First is featured image. |
| `attributes` | Attribute 1 Value(s) | `Blue, Red, Green` | List of values. Variations only need 1 value. First is used if multiple get provided. |
| `downloads` | Download 1 Name | `Dowload 1` |  |
| `downloads` | Download 1 URL | `url.zip` |  |
| `download_limit ` | Download Limit | `1` | `n/a` or a limit. |
| `download_expiry ` | Download Expiry Days | `1` | `n/a` or a day limit. |
| `parent_id ` | Parent | `id:100`, `SKU-1`, `row:20` | Set parent ID. Used for simple products in a group and variations. Can be just a numeric ID e.g. `id:100`, a row ID if importing for the first time e.g. `row:20`, or a SKU. Export will use SKU when possible. |
| `upsell_ids ` | Upsells | `id:100, id:101`, `SKU-1, SKU-2`, `row:20, row:21` | List of IDs. Can be just a numeric ID e.g. `id:100`, a row ID if importing for the first time e.g. `row:20`, or a SKU. Export will use SKU when possible. |
| `cross_sell_ids ` | Cross-sells | `id:100, id:101`, `SKU-1, SKU-2`, `row:20, row:21` | List of IDs. Can be just a numeric ID e.g. `id:100`, a row ID if importing for the first time e.g. `row:20`, or a SKU. Export will use SKU when possible. |