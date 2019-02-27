When new versions of WooCommerce are released, often you'll be prompted to run a database upgrade. Whilst it's possible to do this through WP admin, advanced users may prefer to run these upgrades via the CLI, for example, on busy stores where timeouts could occur.

[This page outlines how to install and begin using the WP CLI](https://wp-cli.org/).

To update the database, use the following CLI command:

```bash
wp wc update
```

There are no extra arguments needed, and only the pending upgrades will be ran. Once the updates have been ran, the new version will be shown.

![Terminal output](https://woocommerce.files.wordpress.com/2019/02/2.-vagrant-ssh-ssh-2019-02-27-16-41-19.png)
