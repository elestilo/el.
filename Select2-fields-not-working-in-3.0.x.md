If you see something like this on product and coupon edit pages you may have a Select2 conflict or JavaScript error:

![](https://cloud.githubusercontent.com/assets/27859664/25281923/8ab71cf0-2674-11e7-883d-c360240841bf.png)

WooCommerce 3.0 updated the Select2 library to v4 which is not backwards compatible with v3. See [this post](https://github.com/woocommerce/woocommerce/wiki/2.6.x-to-3.0.0-Developer-Migration-Notes#select2-version-4).

[You may also see an error like this](https://wordpress.org/support/topic/3-0-error-option-ajax-is-not-allowed-for-select2/) in your JavaScript error console:

```
Error: Option ‘ajax’ is not allowed for Select2
```

## Possible causes

- A generic JavaScript error stopping scripts from running.
- A plugin/theme loading v3 Select2 globally on all admin pages, including WooCommerce pages
- A WooCommerce extension that has not been updated [following these instructions](https://github.com/woocommerce/woocommerce/wiki/2.6.x-to-3.0.0-Developer-Migration-Notes#select2-version-4).

## Finding a JavaScript error

JavaScript errors can be looked up in the console. To do this, in Chrome browser, go to `View > Developer > JavaScript console`.

A panel will open up at the bottom of the screen. Refresh the page, and see what errors are displayed. If there is no error or obvious cause, continue on.

## Finding the conflict

If you see the above problems and think it's related to Select2 v3 usage, you can find which plugin/theme is loading the old library by:

- Right clicking the page
- View page source
- Search the source for `select2.min.js` or `select.js`
- Look at the path/directory the script comes from. This will be the plugin loading it.

## Resolving the conflict

Unfortunately there is no way to 'fix' this directory due to the incompatibles between the 2 versions. The only ways this can be resolved are:

- Removing the conflicting plugin
- For extensions, [following these instructions](https://github.com/woocommerce/woocommerce/wiki/2.6.x-to-3.0.0-Developer-Migration-Notes#select2-version-4) to be compatible with WC 3.0.x.
- Extensions modifying code to only load Select2 on their own admin pages.
- Extensions updating to Select2 v4.
