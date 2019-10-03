<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [3.8](#38)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

This document contains all the testing instructions for new features and enhancement that are added to each new release. Bugfix testing instructions will remain part of each PR only.

# 3.8

### Product Blocks

WooCommerce Product Blocks 2.4 is included in this release. WooCommerce Products Blocks is our eCommerce focused blocks for the Gutenberg editor that has been part of WordPress since 5.0.

The first Product Blocks were included in WooCommerce 3.6. With the inclusion of Product Blocks 2.4 in WooCommerce 3.8, new blocks were added:

- Reviews by Product
- Reviews by Category
- All Reviews
- Product Search

Existing block enhancements:

- Now it’s possible to allow hidden products to be selected and shown in the **Hand-picked products block**.

In order to have access to the new Product Blocks, you will need to have WordPress 5.1+ installed or have the latest version of the Gutenberg Editor plugin installed.

To test, you’ll want to add a new page or post and add each of the new blocks to that page. Some areas to focus on:

- Blocks discoverability
- Add, edit, publish, and delete block
- Block customization

To test the Hand-picked products block enhancement:

- Create hidden product(s)
- Add new page or post
- Add Hand-picked products block
- Select hidden product(s) to be shown in the block
- Edit, publish, and delete block

### Additional enhancements

In addition to the above, we have also included the following user-facing enhancements in WooCommerce 3.8:

1) Show error message in "My Account - view order" if the order does not exist.

To test:

- Go to `My Account -> Orders -> View order` (any order)
- Change order ID in the URL to a random order ID (make sure it does not exist in WC)
- An error indicating invalid order should be displayed

2) Update the recommended PHP version to 7.0 and the recommended WP version to 5.0.

To test:

- You should see a recommendation notice if you are using a less than recommended version of PHP and WordPress