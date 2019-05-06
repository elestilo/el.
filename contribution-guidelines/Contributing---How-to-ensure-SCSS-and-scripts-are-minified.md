<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Installing Grunt](#installing-grunt)
- [Setting up Grunt for WooCommerce](#setting-up-grunt-for-woocommerce)
- [Watching for changes](#watching-for-changes)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# General principles

When contributing to the project, please commit your changes to unminified files (i.e. the readable JS files and SCSS files). The minification will be handled as part of the release process.

To ensure you can test your changes, run with `SCRIPT_DEBUG` turned on, i.e. add `define( 'SCRIPT_DEBUG', true );` to your wp-config.php.

If you want to run the minification anyway, please see the details below. 

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

Whilst in the WooCommerce directory in Terminal, run `grunt watch`. This will watch for changes within SCSS and JS files and minify them when needed.

To trigger minification manually, just type `grunt` instead.

</details>