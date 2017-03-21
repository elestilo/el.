## Overview

End-to-end testing tests whether the whole flow of an application is working as expected. This is different from unit testing, which tests only individual components to verify they work properly. Unit testing doesn't test whether visible components are rendering and working correctly, and doesn't test the system as a whole (e.g. "can a user complete the checkout process successfully?"). End-to-end testing can fill in those gaps.

End-to-end testing will be an important part in ensuring WooCommerce is working correctly and changes don't break anything. It automates the manual process of going through all of the different customer-facing and admin-facing pages, performing actions on those pages, and verifying those actions yield the expected result. This increases the speed and accuracy of the QA process, and it increases confidence that nothing is broken before releases. The long-term plan for the project is to ideally be able to automatically go through [the whole core testing checklist](https://github.com/woocommerce/woocommerce/wiki/Core-Testing-Checklist).

The end-to-end tests bundled in WooCommerce can be used to verify WooCommerce is working correctly on its own, or they can be used to verify WooCommerce is not broken after enabling an extension. The latter should be helpful for extension developers that want to verify they didn't break core WooCommerce anywhere with their extension. If your extension substantially changes WooCommerce screens, you may have to use a custom test suite. Instructions for building a custom test suite using the WooCommerce end-to-end components are further down this page.

## Getting started

Getting set up with and running the end-to-end tests is a fairly straightforward process that should take you less than 15 minutes. In the future, some of these steps are going to get automated for an easier and quicker set up.
1. Start with a clean WooCommerce install.
2. Use one of the standard WordPress twenty-* themes.
3. Import the WooCommerce dummy data using the WordPress Importer. The dummy data can be found in the WooCommerce plugin folder at `dummy-data/dummy-data.xml`.
4. Add a flat rate shipping method to the default "Rest of the World" shipping zone.
5. `cd` to the WooCommerce plugin folder.
6. Run `npm install` to get all of the dependencies.
7. Copy the file `tests/e2e-tests/config/local-sample.json` to `tests/e2e-tests/config/local-development.json`.
8. Fill in the correct details in `local-development.json`.
9. To run all of the tests run `grunt e2e-tests`. If you want to run only one file's tests you can use the `e2e-test` command with the `--file` flag: `grunt e2e-test --file="checkout-page.js"`.
10. Sit back and relax while the computer does all of the work.

## Using the end-to-end components for testing your extensions

The end-to-end testing components are designed in an extendable, reusable way that enables WooCommerce extension developers to use them to write end-to-end test suites for their extensions without having to set up everything from scratch. Adding end-to-end tests for extensions will make compatibility testing with new WooCommerce versions quicker and reduce the chance of introducing bugs to your extensions.

You can import the library into your test suite and save a lot of time by not having to implement all of the basic actions a user can do in WooCommerce. The WooCommerce end-to-end testing library is implemented as a series of objects, each representing a WooCommerce screen. 

To get started, follow along with our [Using WooCommerce End-to-end Objects in Extension Testing guide](#todo).

If you're already familiar, and are just looking for documentation on the objects and their methods, that is available [here](#needstogolive).

## Contributing

If you are interested in contributing to the project, that's great! there are a couple ways you can get involved:

1. **Writing tests for WooCommerce**. There are a lot of edge cases that aren't currently covered by the testing, and some components that aren't tested. Feel free to write tests for any gaps in testing that you notice following the same style as the current ones. Just open a pull request with your changes.

2. **Working on the test components**. There are components that still need to be developed for some WooCommerce pages. These components are the backbone of the end-to-end testing, and all of the tests are composed using them. If you notice any bugs and want to file a ticket or want to handle implementing a component, head on over to the wc-e2e-page-objects [issues](https://github.com/woocommerce/wc-e2e-page-objects/issues). 
