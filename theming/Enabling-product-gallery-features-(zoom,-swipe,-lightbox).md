<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Enabling the gallery in themes that declare WC support](#enabling-the-gallery-in-themes-that-declare-wc-support)
- [Disabling gallery support](#disabling-gallery-support)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

The product gallery introduced in 3.0.0 ([read here for more information](https://woocommerce.wordpress.com/2016/10/19/new-product-gallery-merged-in-to-core-for-2-7/)) uses Flexslider, Photoswipe, and the jQuery Zoom plugin to offer swiping, lightboxes and other neat features.

In versions `3.0`,  `3.1`, and `3.2`, the new gallery is off by default and needs to be enabled using a snippet (below) or by using a compatible theme. This is because it's common for themes to disable the WooCommerce gallery and replace it with their own scripts.

In versions `3.3`+, the gallery is off by default for WooCommerce compatible themes unless they declare support for it (below). 3rd party themes with no WooCommerce support will have the gallery enabled by default.

## Enabling the gallery in themes that declare WC support
To enable the gallery in your theme, you can declare support like this:

```
add_theme_support( 'wc-product-gallery-zoom' );
add_theme_support( 'wc-product-gallery-lightbox' );
add_theme_support( 'wc-product-gallery-slider' );
```

You do not have to support all 3 parts of the gallery; you can pick and choose features. If a feature is not enabled, the scripts will not be loaded and the gallery code will not execute on product pages.

## Disabling gallery support

If gallery features are enabled (e.g. you have a theme which enabled them, or you are running a non-WC compatible theme), you can disable them with `remove_theme_support`:

```
remove_theme_support( 'wc-product-gallery-zoom' );
remove_theme_support( 'wc-product-gallery-lightbox' );
remove_theme_support( 'wc-product-gallery-slider' );
```

You can disable any parts; you do not need to disable all features.