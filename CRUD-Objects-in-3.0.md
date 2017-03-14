<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [The benefits of CRUD](#the-benefits-of-crud)
- [CRUD object structure](#crud-object-structure)
  - [Data](#data)
  - [Getters and setters](#getters-and-setters)
  - [The constructor](#the-constructor)
  - [Saving and deleting](#saving-and-deleting)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

CRUD is an abbreviation of the 4 basic operations you can do to a database or resource – Create, Read, Update, Delete.

[WooCommerce 3.0 introduces CRUD objects](https://woocommerce.wordpress.com/2016/10/27/the-new-crud-classes-in-woocommerce-2-7/) for working with WooCommerce data. The following objects are handled by CRUD objects and data-stores:

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

## The benefits of CRUD

- Structure - each object has a pre-defined structure and keeps it's own data valid.
- Control - We control the flow of data, and any validation needed, so we know when changes occur.
- Ease of development - As a developer, you don’t need to know the internals of the data you’re working with, just the names.
- Abstraction - The data can be moved elsewhere e.g. custom tables, without affecting existing code.
- Unification - We can use the same code for updating things in admin as we do in the REST API and CLIs – everything is unified.
- Simplified code - less procedural code to update objects which reduces likelihood of malfunction and adds more unit test coverage.

## CRUD object structure

The `WC_Data` class is the basic implementation for CRUD objects - they should extend this. 

https://github.com/woocommerce/woocommerce/blob/master/includes/abstracts/abstract-wc-data.php

The most important parts to note; `$data` is an array of props supported in each object, and `$id` is the object's ID.

[The coupon object class](https://github.com/woocommerce/woocommerce/blob/master/includes/class-wc-coupon.php) is a good example of extending WC_Data and adding CRUD functions to all properties. 

### Data

`$data` stores the property names, and default values:

```
        /**
	 * Data array, with defaults.
	 * @since 2.7.0
	 * @var array
	 */
	protected $data = array(
		'code'                        => '',
		'amount'                      => 0,
		'date_created'                => '',
		'date_modified'               => '',
		'discount_type'               => 'fixed_cart',
		'description'                 => '',
		'date_expires'                => '',
		'usage_count'                 => 0,
		'individual_use'              => false,
		'product_ids'                 => array(),
		'excluded_product_ids'        => array(),
		'usage_limit'                 => 0,
		'usage_limit_per_user'        => 0,
		'limit_usage_to_x_items'      => 0,
		'free_shipping'               => false,
		'product_categories'          => array(),
		'excluded_product_categories' => array(),
		'exclude_sale_items'          => false,
		'minimum_amount'              => '',
		'maximum_amount'              => '',
		'email_restrictions'          => array(),
		'used_by'                     => array(),
	);
```

### Getters and setters

Each one of the keys in this array (property) has a getter and setter, e.g. `set_used_by()` and `get_used_by()`. `$data` itself is private, so the getters and setters **must** be used to access the data.

Example getter:

```

	/**
	 * Get records of all users who have used the current coupon.
	 * @since  2.7.0
	 * @param  string $context
	 * @return array
	 */
	public function get_used_by( $context = 'view' ) {
		return $this->get_prop( 'used_by', $context );
	}
```

Example setter:

```
	/**
	 * Set which users have used this coupon.
	 * @since 2.7.0
	 * @param array $used_by
	 * @throws WC_Data_Exception
	 */
	public function set_used_by( $used_by ) {
		$this->set_prop( 'used_by', array_filter( $used_by ) );
	}
```

`set_prop` and `get_prop` are part of `WC_Data`. These apply various filters (based on context) and handle changes (so we can save only changes and not all props).

A note on `$context`, when getting data to use on the frontend or display, `view` context is used. This applies filters so extensions can change the values dynamically.

`edit` context should be used when showing values to edit in the backend, and for saving to the database. These are raw values and are never filtered.

### The constructor

The constructor of the CRUD objects facilitates the read from the database. The actual read is not done by the CRUD class, but by it's [data store](https://github.com/woocommerce/woocommerce/wiki/Data-Stores). 

Example:

```
	/**
	 * Coupon constructor. Loads coupon data.
	 * @param mixed $data Coupon data, object, ID or code.
	 */
	public function __construct( $data = '' ) {
		parent::__construct( $data );

		if ( $data instanceof WC_Coupon ) {
			$this->set_id( absint( $data->get_id() ) );
		} elseif ( is_numeric( $data ) && 'shop_coupon' === get_post_type( $data ) ) {
			$this->set_id( $data );
		} elseif ( ! empty( $data ) ) {
			$this->set_id( wc_get_coupon_id_by_code( $data ) );
			$this->set_code( $data );
		} else {
			$this->set_object_read( true );
		}

		$this->data_store = WC_Data_Store::load( 'coupon' );
		if ( $this->get_id() > 0 ) {
			$this->data_store->read( $this );
		}
	}
```

Note how it sets the ID based on the data passed to the object, then calls the data store to retrieve the data from the database.

Once the data is read via the data store, or if no ID is set, `$this->set_object_read( true );` is set so the data store and CRUD object knows it's read. Once this is set, changes are tracked.

### Saving and deleting

Save and delete methods are optional at CRUD object level because the `WC_Data` class can handle it. When `save` is called, the data store is used to store data to the database. Delete removes the object from the database. Save must be called for changes to persist, otherwise they will be discarded.

The save method looks like this in `WC_Data`:

```
	/**
	 * Save should create or update based on object existence.
	 *
	 * @since  2.6.0
	 * @return int
	 */
	public function save() {
		if ( $this->data_store ) {
			// Trigger action before saving to the DB. Allows you to adjust object props before save.
			do_action( 'woocommerce_before_' . $this->object_type . '_object_save', $this, $this->data_store );

			if ( $this->get_id() ) {
				$this->data_store->update( $this );
			} else {
				$this->data_store->create( $this );
			}
			return $this->get_id();
		}
	}
``` 

Update/create is used depending on whether the object has an ID yet. The ID will be set after creation.

The delete method is like this:

```
	/**
	 * Delete an object, set the ID to 0, and return result.
	 *
	 * @since  2.6.0
	 * @param  bool $force_delete
	 * @return bool result
	 */
	public function delete( $force_delete = false ) {
		if ( $this->data_store ) {
			$this->data_store->delete( $this, array( 'force_delete' => $force_delete ) );
			$this->set_id( 0 );
			return true;
		}
		return false;
	}
```