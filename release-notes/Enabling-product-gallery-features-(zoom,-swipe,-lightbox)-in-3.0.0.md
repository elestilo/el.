<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Disabling gallery features](#disabling-gallery-features)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

The new gallery introduced in 3.0.0 ([read here for more information](https://woocommerce.wordpress.com/2016/10/19/new-product-gallery-merged-in-to-core-for-2-7/)) uses Flexslider, Photoswipe, and the jQuery Zoom plugin to offer swiping, lightboxes and other neat features.

This new gallery is off by default for custom and 3rd party themes since it's common to disable the WooCommerce gallery and replace with your own. To enable the gallery, you can declare support like this

```
add_theme_support( 'wc-product-gallery-zoom' );
add_theme_support( 'wc-product-gallery-lightbox' );
add_theme_support( 'wc-product-gallery-slider' );
```

You do not have to support all 3; you can pick and choose. If a feature is not supported, the scripts will not be loaded and the gallery code will not execute on product pages.

## Disabling gallery features

Similarly, if gallery features are enabled, you can disable them with `remove_theme_support`:

```
remove_theme_support( 'wc-product-gallery-zoom' );
remove_theme_support( 'wc-product-gallery-lightbox' );
remove_theme_support( 'wc-product-gallery-slider' );
```

You can disable any parts; you do not need to disable all features.