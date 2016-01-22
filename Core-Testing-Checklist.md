This list outlines **general** items to test before a release of core. Release specific items are not included.

`WP_DEBUG` should be enabled at all times, and we generally test against Twenty Twelve theme since its clean and easy to spot issues.

_Code_

1. Run PHPUnit - check for errors, particularly from installer.

_Admin_

1. Activation (new install)
  1. Run through wizard
2. Activation (existing install with content)
3. Navigate through all admin screens, incl. settings.
4. Save settings.
5. Enable some shipping methods.
6. Enable cheque gateway for testing.
7. Create simple product.
8. Create variable product
  1. Include global attribute.
  2. Include product attribute.

_Frontend/Checkout_
1. View shop page and paginated pages. Add to cart.
2. View category archive.
3. View single product (simple). Add to cart.
4. View single product (variable). Add to cart.
5. View cart page.
  1. Check items are displayed correctly.
  2. Calc shipping.
  3. Inc/Dec item qty.
  4. Proceed to checkout.
6. Enter details and checkout with Cheque or BACS.
  1. Make a mistake - are errors shown?
  2. Place order.
  3. Are the details correct after order placed?
  4. Check order emails are received and working.
7. View account page. Is the order there?
8. Go to order admin. Is the order correct?
9. Mark order completed.
  1. Confirm emails are sent.