The new gallery introduced in 2.7 ([read here for more information](https://woocommerce.wordpress.com/2016/10/19/new-product-gallery-merged-in-to-core-for-2-7/)) uses Flexslider, Photowipe, and the jQuery Zoom plugin to offer swiping, lightboxes and other neat features.

As of 2.7 beta 2, this new gallery is off by default for custom and 3rd party themes since it's common to disable the WooCommerce gallery and replace with your own. To enable the gallery, you can declare support like this

```
add_theme_support( 'wc-product-gallery-zoom' );
add_theme_support( 'wc-product-gallery-lightbox' );
add_theme_support( 'wc-product-gallery-slider' );
```

You do not have to support all 3; you can pick and choose. If a feature is not supported, the scripts will not be loaded and the gallery code will not execute on product pages.