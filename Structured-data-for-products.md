WooCommerce outputs structured data for products automatically. [According to Google](https://developers.google.com/search/docs/data-types/product), in the context of your store, this markup is suitable for single product pages.

*Note: Prior to 3.5.6, limited data was sometimes output to archives/categories. This is no longer the case; according to Google guidelines only visible data should be marked up, and archives that link out to individual pages should not be marked out. [Issue ref](https://github.com/woocommerce/woocommerce/issues/22896), [Docs](https://developers.google.com/search/docs/guides/sd-policies#multiple-elements-on-a-page).*

The data that is marked up should be data already visible on your page.

> The structured data on the page should describe the content of that page. You should not create blank or empty pages just to hold structured data; nor should you add structured data about information that is not visible to the user, even if the information is accurate. 

[The full guidelines on structured data are found here.](https://developers.google.com/search/docs/guides/sd-policies)

WooCommerce outputs structured data to the page in `JSON+LD` format.

## Viewing generated structured data

If you view the source of a product page, search for `application/ld+json`. This holds structured data for all elements on the page. This may include breadcrumbs, products, and any other relevant structured data.

A product will look something like this:

```json
{
	"@context": "https:\/\/schema.org\/",
	"@type": "Product",
	"@id": "http:\/\/local.wordpress.test\/product\/wordpress-pennant\/#product",
	"name": "WordPress Pennant",
	"image": "http:\/\/local.wordpress.test\/wp-content\/uploads\/2019\/02\/pennant-1.jpg",
	"description": "This is an external product.",
	"sku": "wp-pennant",
	"offers": [
		{
			"@type": "Offer",
			"price": "11.05",
			"priceSpecification": {
				"price": "11.05",
				"priceCurrency": "USD",
				"valueAddedTaxIncluded": "true"
			},
			"priceCurrency": "USD",
			"availability": "https:\/\/schema.org\/InStock",
			"url": "http:\/\/local.wordpress.test\/product\/wordpress-pennant\/",
			"seller": {
				"@type": "Organization",
				"name": "Test",
				"url": "http:\/\/local.wordpress.test"
			}
		}
	]
}
```

You can see parsed structured data by using the [Google structured data testing tool](https://search.google.com/structured-data/testing-tool/u/0/). There you can either paste in the source code of your page, or provide a URL. It will list what structured data it finds. 

## Customizing structured data using WooCommerce filters

2 filters control the markup for products.

- `woocommerce_structured_data_product_offer` - Marks up prices as offers. The format of this varies depending on the product type. This filter passes an array of data for offers.
- `woocommerce_structured_data_product` - Controls the full set of data for the product. This filter passes an array of data.

### Adding extra data

The `woocommerce_structured_data_product` passes all values which will be output as structured data. This filter can therefore be used to change or add values for your structured data.

For example, let's say wanted to use IDs for SKU since we didn't use SKU on a particular store. This code could be used:

```
add_filter( 'woocommerce_structured_data_product', function( $markup, $product ) {
    $markup['sku'] = $product->get_id(); // Set sku to product id.
    return $markup;
} );
```

The resulting markup would then include this value.

## Generating product data in other places, e.g. archives

As noted earlier, structured data is no longer output on archives as it contradicts Google guidelines. If you do however want to have data generated on archives, you can use the following code:

```
add_action( 'woocommerce_shop_loop', array( wc()->structured_data, 'generate_product_data' ), 10 );
```

This tells WooCommerce to generate data for a product during a shop loop when the `woocommerce_shop_loop` filter is triggered.