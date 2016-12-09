WooCommerce CLI (WC CLI) offers the ability to manage WooCommerce (WC) via the command-line, using WP CLI. The documentation here covers the version of WC CLI that started shipping in WC 2.7 and later. There is documentation on [WC 2.5 and 2.6's CLI](https://github.com/woocommerce/woocommerce/wiki/WP-CLI-commands).

WC CLI is powered by the [WC REST API](https://woocommerce.github.io/woocommerce-rest-api-docs/), meaning most of what is possible with the REST API can also be achieved via the command-line.

### What is WP-CLI?

For those who have never heard before WP-CLI, here's a brief description extracted from the [official website](http://wp-cli.org/).

> **WP-CLI** is a set of command-line tools for managing WordPress installations. You can update plugins, set up multisite installs and much more, without using a web browser.

### WooCommerce Commands

All WooCommerce related commands are grouped into `wp wc` command. The available commands (as of WC 2.7) are:

```
$ wp wc
usage: wp wc customer <command>
   or: wp wc customer_download <command>
   or: wp wc order_note <command>
   or: wp wc payment_gateway <command>
   or: wp wc product <command>
   or: wp wc product_attribute <command>
   or: wp wc product_attribute_term <command>
   or: wp wc product_cat <command>
   or: wp wc product_review <command>
   or: wp wc product_shipping_class <command>
   or: wp wc product_tag <command>
   or: wp wc product_variation <command>
   or: wp wc shipping_method <command>
   or: wp wc shipping_zone <command>
   or: wp wc shipping_zone_location <command>
   or: wp wc shipping_zone_method <command>
   or: wp wc shop_coupon <command>
   or: wp wc shop_order <command>
   or: wp wc shop_order_refund <command>
   or: wp wc tax <command>
   or: wp wc tax_class <command>
   or: wp wc tool <command>
   or: wp wc webhook <command>
   or: wp wc webhook_delivery <command>

See 'wp help wc <command>' for more information on a specific command.
```

When using the commands, you must specify your username or user ID using the `--user` argument. This is to let the REST API know which user should be used.
 
You can see more details about the commands using `wp help wc` or with the `--help` flag, which explains arguments and subcommands.

Example:

`wp wc customer --help`

```
NAME

  wp wc customer

SYNOPSIS

  wp wc customer <command>

SUBCOMMANDS

  create      Create a new item.
  delete      Delete an existing item.
  get         Get a single item.
  list        List all items.
  update      Update an existing item.
```

`wp wc customer list --help`

```
NAME

  wp wc customer list

DESCRIPTION

  List all items.

SYNOPSIS

  wp wc customer list [--context=<context>] [--page=<page>]
  [--per_page=<per_page>] [--search=<search>] [--exclude=<exclude>]
  [--include=<include>] [--offset=<offset>] [--order=<order>]
  [--orderby=<orderby>] [--email=<email>] [--role=<role>] [--fields=<fields>]
  [--field=<field>] [--format=<format>]


OPTIONS

  [--context=<context>]
    Scope under which the request is made; determines fields present in
    response.

  [--page=<page>]
    Current page of the collection.

  [--per_page=<per_page>]
    Maximum number of items to be returned in result set.

  [--search=<search>]
    Limit results to those matching a string.

  [--exclude=<exclude>]
    Ensure result set excludes specific IDs.

  [--include=<include>]
    Limit result set to specific IDs.

  [--offset=<offset>]
    Offset the result set by a specific number of items.

  [--order=<order>]
    Order sort attribute ascending or descending.

  [--orderby=<orderby>]
    Sort collection by object attribute.

  [--email=<email>]
    Limit result set to resources with a specific email.

  [--role=<role>]
    Limit result set to resources with a specific role.

  [--fields=<fields>]
    Limit response to specific fields. Defaults to all fields.

  [--field=<field>]
    Get the value of an individual field.

  [--format=<format>]
    Render response in a particular format.
    ---
    default: table
    options:
      - table
      - json
      - csv
      - ids
      - yaml
      - count
      - headers
      - body
      - envelope
    ---
```

Arguments like `--context`, `--fields`, `--field`, `--format` can be used on any `get` or `list` WC CLI command.

The `--porcelain` argument can be used on any `create` or `update` command to just get back the ID of the object, instead of a response.

Updating or creating some fields require passing JSON. These are fields that contain arrays of information. For example, setting [https://woocommerce.github.io/woocommerce-rest-api-docs/#customer-properties](billing information) using the customer command. This is just passing key/value pairs.

Example:


`$ wp wc customer create --email='me@woo.local' --user=1 --billing='{"first_name":"Justin","last_name":"S","company":"Automattic"}' --password='he
llo'`

`Success: Created customer 16.`


`$ wp wc customer get 16 --user=1`

```
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
| id                 | 16                                                                                                                                                             |
| date_created       | 2016-12-09T20:07:35                                                                                                                                            |
| date_modified      | 2016-12-09T20:07:35                                                                                                                                            |
| email              | me@woo.local                                                                                                                                                   |
| first_name         |                                                                                                                                                                |
| last_name          |                                                                                                                                                                |
| role               | customer                                                                                                                                                       |
| username           | me                                                                                                                                                             |
| billing            | {"first_name":"Justin","last_name":"S","company":"Automattic","address_1":"","address_2":"","city":"","state":"","postcode":"","country":"","email":"","phone" |
|                    | :""}                                                                                                                                                           |
| shipping           | {"first_name":"","last_name":"","company":"","address_1":"","address_2":"","city":"","state":"","postcode":"","country":""}                                    |
| is_paying_customer | false                                                                                                                                                          |
| meta_data          |                                                                     |
| orders_count       | 0                                                                                                                                                              |

| total_spent        | 0.00                                                                                                                                                           |
| avatar_url         | http://2.gravatar.com/avatar/81a56b00c3b9952d6d2c107a8907e71f?s=96                                                                                             |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------+
```

### Examples

Full documentation for every command is available using `--help`. Below are some example commands to show what the CLI can do.

All the examples below use user ID 1 (usually an admin account), but you should replace that with your own user account.

#### Command:

Clear the product/shop transients cache.

`$ wp wc tool run clear_transients --user=1`

#### Example:

`Success: Updated system_status_tool clear_transients.`

#### Command:

List all system tools.

`$ wp wc tool list --user=1`

#### Example:

```
+----------------------------+----------------------------------+-------------------------------+-----------------------------------------------------------------------------------+
| id                         | name                             | action                        | description                                                                       |
+----------------------------+----------------------------------+-------------------------------+-----------------------------------------------------------------------------------+
| clear_transients           | WC transients                    | Clear transients              | This tool will clear the product/shop transients cache.                           |
| clear_expired_transients   | Expired transients               | Clear expired transients      | This tool will clear ALL expired transients from WordPress.                       |
| delete_orphaned_variations | Orphaned variations              | Delete orphaned variations    | This tool will delete all variations which have no parent.                        |
| recount_terms              | Term counts                      | Recount terms                 | This tool will recount product terms - useful when changing your settings in a wa |
|                            |                                  |                               | y which hides products from the catalog.                                          |
| reset_roles                | Capabilities                     | Reset capabilities            | This tool will reset the admin, customer and shop_manager roles to default. Use t |
|                            |                                  |                               | his if your users cannot access all of the WooCommerce admin pages.               |
| clear_sessions             | Customer sessions                | Clear all sessions            | <strong class="red">Note:</strong> This tool will delete all customer session dat |
|                            |                                  |                               | a from the database, including any current live carts.                            |
| install_pages              | Install WooCommerce pages        | Install pages                 | <strong class="red">Note:</strong> This tool will install all the missing WooComm |
|                            |                                  |                               | erce pages. Pages already defined and set up will not be replaced.                |
| delete_taxes               | Delete all WooCommerce tax rates | Delete ALL tax rates          | <strong class="red">Note:</strong> This option will delete ALL of your tax rates, |
|                            |                                  |                               |  use with caution.                                                                |
| reset_tracking             | Reset usage tracking settings    | Reset usage tracking settings | This will reset your usage tracking settings, causing it to show the opt-in banne |
|                            |                                  |                               | r again and not sending any data.                                                 |
+----------------------------+----------------------------------+-------------------------------+-----------------------------------------------------------------------------------+
````
