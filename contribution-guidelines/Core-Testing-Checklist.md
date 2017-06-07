This list outlines **general** items to test before a release of core. Release specific items are not included.

`WP_DEBUG` should be enabled at all times, and we generally test against Twenty Twelve theme since its clean and easy to spot issues.

_Code_

1. Run PHPUnit - check for errors, particularly from installer.
2. Run e2e tests on a clean install with dummy data.


_Admin checks_

1. Activation on a **new install**
  1. Ensure wizard is triggered.
  2. Run through all wizard steps.
2. Activation on an existing install.
3. Navigate through all admin screens, including all settings screens.
4. Save settings. Ensure there are no errors.
5. Enable/configure some shipping methods.
6. Enable cheque gateway for testing.
7. Create a new simple product.
8. Create a new variable product
  1. Include a global attribute.
  2. Include a new product attribute.

_Frontend/Checkout_

Whilst logged out:

1. View shop page and paginated pages. Check display. Add to cart.
2. View category archive. Check display.
3. View single product (simple). Add to cart.
4. View single product (variable). Add to cart.
5. View cart page.
  1. Check items are displayed correctly.
  2. Calculate shipping. Refresh. Do changes persist?
  3. Increment/decrement item quantities and save.
  4. Proceed to checkout.
6. Enter details and checkout with Cheque or BACS.
  1. Make a mistake - are errors shown?
  2. Place order.
  3. Are the details correct after order placed?
  4. Check order emails are received and working.

Repeat the above after logging in, then:

1. View account page. Is the order there?
2. Go to order admin. Is the order correct?
3. Mark order completed. Confirm emails are sent.