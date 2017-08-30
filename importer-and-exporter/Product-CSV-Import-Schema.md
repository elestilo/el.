<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [General CSV guidelines](#general-csv-guidelines)
- [CSV columns and formatting](#csv-columns-and-formatting)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This is the schema used for the built in [CSV importer and exporter](https://github.com/woocommerce/woocommerce/wiki/Product-CSV-Importer-&-Exporter) in WooCommerce 3.1+.

Visit the [Product CSV Importer and Exporter](https://docs.woocommerce.com/document/product-csv-importer-exporter/) guide for more information on how to use it.

## General CSV guidelines

- CSVs should be in UTF-8 format.
- Any dates should be defined for the store's local timezone.
- If importing a boolean value (true or false) use 1 or 0 in your CSV.
- Multiple values in a field get separated with commas.
- If referencing an existing product ID, prefix the id with `id:`. If referencing a SKU, no prefix is needed. e.g. `id:100, SKU101` 
- Custom meta is supported/imported but only plain text - no support for JSON or Serialised data.
- Taxonomy term hierarchy is denoted with `>`, terms are separated with commas.
- Serialised data is not supported.
- Images need to be pre-uploaded or available online in order to import to your store.
- External URLs are supported and imported into the media library if used. 
- You can define the filename if the image already exists in the media library.

## CSV columns and formatting

| CSV Column Name | Product Properties | Example | Notes |
|---|---|---|---|
| `ID` | id | `100` | Defining this will overwrite data for that ID on import. |
| `Type` | type | `simple`, `variation, virtual` | Product Type. Valid values: simple, variable, grouped, external, variation, virtual, downloadable. Multiple types can be used CSV separated. |
| `SKU` | sku | `my-sku` | Required. Auto-generated if missing. |
| `Name` | name | `My Product Name` | Required. |
| `Published` | status | `1` | 1 for published, 0 for draft. |
| `Is featured?` | featured | `1` | 1 or 0 |
| `Visibility in catalog` | catalog_visibility | `visible` | Supported values: `visible`, `catalog`, `search`, `hidden` |
| `Short Description` | short_description | `This is a product.` |  |
| `Description` | description | `This is more information about a product.` |  |
| `Date sale price starts` | date_on_sale_from | `2013-06-07 10:53:15` | Date or leave blank. |
| `Date sale price ends` | date_on_sale_to | `2013-06-07 10:53:15` | Date or leave blank. |
| `Tax Status` | tax_status | `taxable` | Supported values: `taxable`, `shipping`, `none` |
| `Tax Class` | tax_class | `standard` | Can use any existing tax class. |
| `In stock?` | stock_status | `1` | 1 or 0 |
| `Backorders allowed?` | backorders | `1` | 1, 0, or `notify` |
| `Sold individually?` | sold_individually | `1` | 1 or 0 |
| `Weight (unit)` | weight | `100` | Parse only numbers. |
| `Length (unit)` | length | `20` | Parse only numbers. |
| `Width (unit)` | width | `20` | Parse only numbers. |
| `Height (unit)` | height | `20` | Parse only numbers. |
| `Allow customer reviews?` | reviews_allowed | `1` | 1 or 0 |
| `Purchase Note` | purchase_note | `Thanks for buying it buddy.` |  |
| `Price` | price | `20.99` | May set sale or regular price depending on other columns. |
| `Regular Price` | regular_price | `24.99` | Non-sale price. |
| `Stock` | manage_stock / stock_quantity | `20` | Numeric stock level enables stock management. `parent` can be used for variations. Blank = no stock management. |
| `Categories` | category_ids | `Category 1, Category 1 > Category 2` | CSV list of categories. `>` used for hierarchy. |
| `Tags` | tag_ids | `Tax 1, Tag 2` | CSV list of tags. |
| `Shipping Class` | shipping_class_id | `Name` | Name of shipping class |
| `Attribute 1 Name` | attributes | `Color` | Looks for global attribute or uses text if not found. Include as many as needed. "Used for variations" is set automatically. |
| `Attribute 1 Value(s)` | attributes | `Blue, Red, Green` | List of values. Variations only need 1 value. First is used if multiple get provided. |
| `Attribute 1 Default` | default_attributes | `Blue` | Default value for variable products. |
| `Attribute 1 Visible` | attributes | `1` | 1 or 0 |
| `Images` | image_id / gallery_image_ids | `http://somewhere.com/image.jpg, http://somewhere.com/image2.jpg` | First is featured image. |
| `Download 1 Name` | downloads | `Download 1` |  |
| `Download 1 URL` | downloads | `url.zip` |  |
| `Download Limit` | download_limit | `1` | `n/a` or a limit. |
| `Download Expiry Days` | download_expiry | `1` | `n/a` or a day limit. |
| `Parent` | parent_id | `id:100`, `SKU-1` | Set parent ID. Used for simple products in a group and variations. Can be just a numeric ID e.g. `id:100` or a SKU. Export will use SKU when possible. |
| `Upsells` | upsell_ids | `id:100, id:101`, `SKU-1, SKU-2` | List of IDs. Can be just a numeric ID e.g. `id:100` or a SKU. Export will use SKU when possible. |
| `Cross-sells` | cross_sell_ids | `id:100, id:101`, `SKU-1, SKU-2` | List of IDs. Can be just a numeric ID e.g. `id:100` or a SKU. Export will use SKU when possible. |