To log errors triggered by WordPress plugins, you can use the debug log.

1. [Edit your wp-config.php file](https://codex.wordpress.org/Editing_wp-config.php)
2. Add the following lines to enable debug (if these are already defined, edit the values):
```php
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );
```
3. As errors are logged, they should appear in `wp-content/debug.log`. You can open this file in a text editor.

This will enable the debug log, but will hide errors on your site.

For more information see [Debugging in WordPress](https://codex.wordpress.org/Debugging_in_WordPress).