This is the schema used for the built in [CSV importer and exporter](https://github.com/woocommerce/woocommerce/wiki/Product-CSV-Importer-&-Exporter) in WooCommerce 3.1+.

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
| `parent_id ` | Parent | `id:100`, `SKU-1` | Set parent ID. Used for simple products in a group and variations. Can be just a numeric ID e.g. `id:100` or a SKU. Export will use SKU when possible. |
| `upsell_ids ` | Upsells | `id:100, id:101`, `SKU-1, SKU-2` | List of IDs. Can be just a numeric ID e.g. `id:100` or a SKU. Export will use SKU when possible. |
| `cross_sell_ids ` | Cross-sells | `id:100, id:101`, `SKU-1, SKU-2` | List of IDs. Can be just a numeric ID e.g. `id:100` or a SKU. Export will use SKU when possible. |