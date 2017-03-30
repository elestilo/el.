The REST API is a powerful part of WooCommerce which lets you read and write various parts of WooCommerce data such as orders, products, coupons, customers, and shipping zones.

Authorization is usually the part most developers get stuck on so this guide will cover a quick way to test that your API is working on your server and you can auth. **If this works but your code to use the API does not, please bare in mind it will be a problem with your code. Please do not open issues asking for support about this on Github - use the support forums.**

We'll use both Postman and Insomnia clients in these examples. Both are free and will help you visualise what the API offers.

Before proceeding, please read the [REST API docs on authentication which covers the important parts concerning API Keys and Auth](https://woocommerce.github.io/woocommerce-rest-api-docs/#authentication).

## Generate Keys