CRUD is an abbreviation of the 4 basic operations you can do to a database or resource – Create, Read, Update, Delete.

[WooCommerce 2.7 introduces CRUD objects](https://woocommerce.wordpress.com/2016/10/27/the-new-crud-classes-in-woocommerce-2-7/) for working with WooCommerce data. The following objects are handled by CRUD objects and data-stores:

- [Orders](https://github.com/woocommerce/woocommerce/wiki/2.7---Order-and-Order-Line-Item-Data)
- [Order line items](https://github.com/woocommerce/woocommerce/wiki/2.7---Order-and-Order-Line-Item-Data)
- [Products](https://github.com/woocommerce/woocommerce/wiki/Product-Data-Schema-(2.7))
- [Coupons](https://github.com/woocommerce/woocommerce/wiki/2.7-Coupon-Data)
- [Customers](https://github.com/woocommerce/woocommerce/wiki/2.7-Customer-Data)
- Customer downloads
- Payment tokens
- Shipping zones

Each of these objects contains a schema for the data it controls (properties), a getter and setter for each property, and a save/delete method which talks to a **data store**. 

The data store handles the actual saving/reading from the database - the object itself does not need to be aware of where the data is stored. [You can read about data stores here](https://github.com/woocommerce/woocommerce/wiki/Data-Stores).
