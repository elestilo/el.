To log errors triggered by WordPress plugins, you can use the debug log.

1. [Edit your wp-config.php file](https://codex.wordpress.org/Editing_wp-config.php)
2. Add the following lines to enable debug (if these are already defined, edit the values): https://gist.github.com/mikejolley/41265138d6229697f50599d73d52be2f
3. As errors are logged, they should appear in `wp-config/debug.log`. You can open this file in a text editor.

This will enable the debug log, but will hide errors on your site.

For more information see [Debugging in WordPress](https://codex.wordpress.org/Debugging_in_WordPress).