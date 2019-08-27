<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [SCSS](#scss)
- [Javascript](#javascript)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## SCSS

When updating SCSS files in the WooCommerce project, please **commit only your changes to unminified SCSS files**. The minification will be handled as part of the release process.

To get the minified CSS files, run task `node_modules/.bin/grunt css`. Alternatively, if you are performing multiple changes and want grunt to watch all SCSS files and trigger the update automatically, run `node_modules/.bin/grunt watch` in the WooCommerce plugin folder.

For further details on how to set up `grunt`, see the section on [how to install dependencies and generate assets](https://github.com/woocommerce/woocommerce/wiki/How-to-set-up-WooCommerce-development-environment#install-dependencies-and-generate-assets) in the guide to set up a WooCommerce development environment.

## Javascript

When changing the JS files, please **commit only unminified files** (i.e. the readable JS files). The minification will be handled as part of the release process.

To ensure you can test your changes, run with `SCRIPT_DEBUG` turned on, i.e. add `define( 'SCRIPT_DEBUG', true );` to your wp-config.php file.