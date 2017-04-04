1. Use `woocommerce` textdomain in all strings.
2. When using dynamic strings in printf/sprintf, if you are replacing > 1 string use numbered args. e.g. `Test %s string %s.` would be `Test %1$s string %2$s.`
3. Use sentence case. e.g. `Some Thing` should be `Some thing`.
4. Avoid HTML. If needed, insert the HTML using sprintf.