This page will guide you through the process of setting up WooCommerce development environment on your local machine. It should work on Linux, macOS, or Windows 10 with the Linux Subsystem.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Pre-requisites](#pre-requisites)
- [Configure a local WordPress instance](#configure-a-local-wordpress-instance)
- [Clone WooCommerce repository](#clone-woocommerce-repository)
- [Install dependencies and generate assets](#install-dependencies-and-generate-assets)
- [IDE integrations](#ide-integrations)
- [Additional resources](#additional-resources)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Pre-requisites

Before starting, make sure you have the following software installed and working on your machine:

1. [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to clone the WooCommerce repository (or your fork of the WooCommerce repository).
2. [NPM](https://www.npmjs.com/get-npm) to install Node packages used to build assets and other tasks.
3. [Composer](https://getcomposer.org/download/) to install PHP packages required by WooCommerce such as the `woocommerce-rest-api` and the `jetpack-autoloader`. It's also necessary to use the PHP CodeSniffer that ensures your code follows code standards.

## Configure a local WordPress instance

For this guide we will use [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV), which is a local WordPress development environment built using Vagrant and VirtualBox, to run a local WordPress instance and install WooCommerce on top of it. But it is worth noting that it is possible to set up a WooCommerce development environment using several other stacks (docker, LAMP, etc). If you opt to use a solution other than VVV, you can skip to the next section. Keep in mind that you might need to make some small adjustments to the steps in the rest of this guide.

To configure our local WordPress instance, you will need to:

1. Install [VirtualBox](https://www.virtualbox.org/)
2. Install [vagrant](https://www.vagrantup.com/)
3. Install and provision [VVV](https://varyingvagrantvagrants.org/docs/en-US/installation/)
4. If everything worked as expected, you should have a WordPress installation running on the following URL: https://one.wordpress.test. This is the WP site that we will use to install WooCommerce.

## Clone WooCommerce repository

To install WooCommerce on your WordPress installation, you need to decide whether you will clone the WooCommerce repository directly or your WooCommerce fork. If you plan to contribute to WooCommerce code base, it is recommended that you clone your fork. If needed, see [this GitHub document on how to create a fork](https://help.github.com/en/articles/fork-a-repo).

In your terminal:

1. Go to the WordPress plugins directory:
    ```
    $ cd ~/vagrant-local/www/wordpress-one/public_html/wp-content/plugins/
    ```
2. Clone the repository:
    * If cloning WooCommerce repository:
    ```
    $ git clone git@github.com:woocommerce/woocommerce.git
    ```
    * If cloning your own fork replace `USER_NAME` with your GitHub username:
    ```
    $ git clone git@github.com:USER_NAME/woocommerce.git
    ```

## Install dependencies and generate assets

To install WooCommerce dependencies (this includes some functionality such as Gutenberg Blocks and the REST API that are developed as separate projects and Grunt that is used to generated minified versions of the SCSS and JS files):

```
$ cd ~/vagrant-local/www/wordpress-one/public_html/wp-content/plugins/woocommerce
$ npm install
$ composer install
```

The source code found on GitHub does not contain compiled CSS or Javascript. To generate those assets run the following command from the WooCommerce root directory:

```
$ node_modules/.bin/grunt assets
```

To automatically rebuild the assets whenever a JS or SCSS file is modified run:

```
$ node_modules/.bin/grunt watch
```

## IDE integrations

WooCommerce core has linting rules in place via pre-commit hooks to ensure code standards are used. Ensure you have installed NPM and Composer packages, so these are set up!

While developing, we recommend adding support to your editor for the following (most IDEs have plugins for this):

- phpcs
    * [VS Studio Code extension](https://marketplace.visualstudio.com/items?itemName=ikappas.phpcs)
- eslint
- editorconfig
    * [VS Studio Code extension](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
 
## Additional resources

1. [Running unit tests](https://github.com/woocommerce/woocommerce/blob/master/tests/README.md)
2. [Running e2e tests](End-to-end-Testing)
3. [Extra VVV configurations](Extra-VVV-Configurations)