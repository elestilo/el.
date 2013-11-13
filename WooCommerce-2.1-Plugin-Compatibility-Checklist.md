## Gateways can no longer use woocommerce_pay_page_id - use $order->get_checkout_payment_url( true )

## Filters used for downloadable product URLs

* Downloads are stored with an md5-hash key, and an **array** value consisting of name and url
* Functions/methods for getting URLs/paths have changed
* Meta key '_file_paths' renamed to '_downloadable_files'
* Upgrade script in place for 2.0.x to 2.1.x

## add_to_cart_handler removed in favour of add_to_cart_url and add_to_cart_text methods inside product classes

* Class methods overridden at product class level
* Less filters used overall - product objects are passed to the methods's filter