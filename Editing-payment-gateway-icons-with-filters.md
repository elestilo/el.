# PayPal Standard

`add_filter('woocommerce_paypal_icon', 'custom_woocommerce_paypal_icon')

function custom_woocommerce_paypal_icon( $url ) {
	$url = 'http://yoursite,com/youriconurl.png';
	return $url;
}`

# Hooks for other gateways

* woocommerce_cheque_icon
* woocommerce_bacs_icon