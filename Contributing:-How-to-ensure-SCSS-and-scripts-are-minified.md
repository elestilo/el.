To handle minification, WooCommerce uses [Grunt](http://gruntjs.com). 

## Installing Grunt

1. Install Node.JS - https://nodejs.org/download/ - This allows you to use the npm package manager.
2. Install Grunt - http://gruntjs.com/getting-started

## Setting up Grunt for WooCommerce

In terminal/command line, cd to the WooCommerce directory and run `npm install`.

`npm install` will download and install all required modules which our Grunt file requires.

## Watching for changes

Whilst in the WooCommerce directory in Terminal, run `grunt watch`. This will watch for changes within SCSS and JS files and minify them when needed.

To trigger minification manually, just type `grunt` instead.

