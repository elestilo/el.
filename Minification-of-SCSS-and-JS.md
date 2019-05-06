<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Installing Grunt](#installing-grunt)
- [Setting up Grunt for WooCommerce](#setting-up-grunt-for-woocommerce)
- [Watching for changes](#watching-for-changes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# General principles

## SCSS

When updating SCSS files in the WooCommerce project, please **commit your changes to both unminified SCSS files and minified CSS files**.

To get the minified CSS files, run task `grunt css`. Alternatively, if you are performing multiple changes and want grunt to watch all SCSS files and trigger the update automatically, run `grunt watch css` in the woocommerce plugin folder.

For further details on how to set up `grunt`, please see the details section.

<details>

---

For minification, WooCommerce uses [Grunt](http://gruntjs.com)

## Installing Grunt

1. Install Node.JS - https://nodejs.org/download/ - This allows you to use the npm package manager.
2. Install Grunt - http://gruntjs.com/getting-started

## Setting up Grunt for WooCommerce

In terminal/command line, cd to the WooCommerce directory and run `npm install`.

`npm install` will download and install all required modules which our Grunt file requires.

## Watching for changes

Whilst in the WooCommerce directory in Terminal, run `grunt watch css`. This will watch for changes within SCSS files and minify them when needed.

To trigger minification manually, just type `grunt css` instead.

</details>

## Javascript

When changing the JS files, please **commit only unminified files** (i.e. the readable JS files). The minification will be handled as part of the release process.

To ensure you can test your changes, run with `SCRIPT_DEBUG` turned on, i.e. add `define( 'SCRIPT_DEBUG', true );` to your wp-config.php file.

