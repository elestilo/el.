## Versions in active development

* [WooCommerce 2.1 - Peppy Penguin](https://github.com/woothemes/woocommerce/wiki/WooCommerce-2.1-Peppy-Penguin)

## Network and multisite compatibility

WooCommerce is compatible to be run in multisite setups up to a certain level. To further increase support and possibilities to use the plugin in a multisite setup (thinking about multi storefronts and other similar use cases), we're planning on doing a core plugin release dedicated to this topic. This is planned to take place during the WooCommerce 2.3 cycle, but this is not set in stone yet.

## Ideas or future releases

- Search customers (on order page) by other meta such as tel
- clear all filters for each layered nav #4479
- Allow coupons to be added/edited from orders, with discount calc #4404
- Onsale layered nav widget #4302
- Separate business logic for creating new product variation into its own function. #3343
- Ability to hook into core classes initializing was implemented. #3689
- Checkout review page #3578
- Add option to automatically delete expired coupons #3622
- Ability to register custom endpoints for pages such as my-account #3708
- Software download stats #3608
- Mandatory attributes #3667
- Attribute grouping #3461 [http://ideas.woothemes.com/forums/133476-woocommerce/suggestions/3368079-attribute-groups-for-woocommerce](http://ideas.woothemes.com/forums/133476-woocommerce/suggestions/3368079-attribute-groups-for-woocommerce)
- Custom stock statuses [#3051](https://github.com/woothemes/woocommerce/issues/3051)
- Zones #4936
- True multi-currency support
- Add dedicated page for products in promotion [#2249](https://github.com/woothemes/woocommerce/issues/2249)
- Add option to automatically create account at checkout [#3155](https://github.com/woothemes/woocommerce/issues/3155)
- Allow coupon to work with mixed sale and non sale items [#2696](https://github.com/woothemes/woocommerce/issues/2696)
- Payment options / Shipping dependencies [#2961](https://github.com/woothemes/woocommerce/issues/2961)
- Add proper revisions to products (as soon as WP core supports this) [#2178](https://github.com/woothemes/woocommerce/issues/2178)
- Remove color picker to a separate plugin
- Allow tax inc prices to remain constant regardless of tax rate #4131
- discount codes related to Qty purchased, not $ amount of order. #4212
- Shipping inc tax prices #4425

### Variations rewrite

* [#1984](https://github.com/woothemes/woocommerce/issues/1984) - Validation for variations and more filters to affect the form behaviour.
* [#2399](https://github.com/woothemes/woocommerce/issues/2399) - Base product would define all properties (price, weight, stock, whatever) and variations can overwrite this for that specific variation.
* [#5039](https://github.com/woothemes/woocommerce/issues/5039) - AJAX option for variations