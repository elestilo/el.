If you are using custom WooCommerce template overrides in your theme you need to declare WooCommerce support using the `add_theme_support` function. WooCommerce template overrides are only enabled on themes that declare WooCommerce support. If you do not declare WooCommerce support in your theme, WooCommerce will assume the theme is not designed for WooCommerce compatibility and will use shortcode-based unsupported theme rendering to display the shop.

Declaring WooCommerce support is straightforward and involves adding one function in your theme's functions.php file.

### Basic usage:

```
function mytheme_add_woocommerce_support() {
	add_theme_support( 'woocommerce' );
}
add_action( 'after_setup_theme', 'mytheme_add_woocommerce_support' );
```

Make sure you are using the `after_setup_theme` hook and not the `init` hook. Read more about this at the documentation for [add_theme_support](https://developer.wordpress.org/reference/functions/add_theme_support/).

### Usage with settings:

```
function mytheme_add_woocommerce_support() {
	add_theme_support( 'woocommerce', array(
		'thumbnail_image_width' => 150,
		'single_image_width'    => 300,

        'product_grid'          => array(
            'default_rows'    => 3,
            'min_rows'        => 2,
            'max_rows'        => 8,
            'default_columns' => 4,
            'min_columns'     => 2,
            'max_columns'     => 5,
        ),
	) );
}
add_action( 'after_setup_theme', 'mytheme_add_woocommerce_support' );
```

These are optional theme settings that you can set when declaring WooCommerce support.

`thumbnail_image_width` and `single_image_width` will set the image sizes for the shop. If these are not declared when adding theme support, the user can set image sizes in the Customizer under the **WooCommerce > Product Images** section. [Read more about this feature here](https://woocommerce.wordpress.com/2017/12/11/wc-3-3-image-size-improvements/).

The 'product_grid' settings let theme developers set default, minimum, and maximum column and row settings for the Shop. Users can set the rows and columns in the Customizer under the **WooCommerce > Product Catalog** section. [Read more about this feature here.](https://woocommerce.wordpress.com/2017/12/09/wc-3-3-will-look-great-on-all-the-themes/).