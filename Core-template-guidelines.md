WooCommerce core contains a series of templates which control the overall layout of WooCommerce store pages. They can be found within the `woocommerce/templates` directory.

These templates can contain a mixture of:

- Content/text
- Hooks
- Conditional logic

Templates can be overridden by themes, child-themes, and plugins using filters.

Each template file has a `@version` which reflects the last version of WooCommerce to edit or include this template file. If your overridden version differs, there will be a warning on WooCommerce Status page; template files need to be kept updated as they may include important fixes.

The following guidelines outline how template files should be written, and what they should include.

## Use coding standards

All templates should follow the WordPress Coding Standards for [HTML](https://make.wordpress.org/core/handbook/best-practices/coding-standards/html/) and [PHP](https://make.wordpress.org/core/handbook/best-practices/coding-standards/php/).

## Template structure

### Structuring templates logically

Template files should be grouped together into folders to make it easy to tell which template file corresponds to which area of a shop. For example, all of the email templates are grouped together into an "emails" folder and all of the checkout page templates are grouped together into a "checkout" folder. 

Within each template file, there should be a docblock at the top explaining the purpose of the template, where it is rendered, and what WooCommerce version it was last modified in. As a best-practice there should also be a check to make sure `ABSPATH` is defined followed by a call to `exit` if it is not defined.

After that section the HTML content of the page can be output. We encourage basic elements to be included in the actual template file, vs including all content via hooks. This is so the template file can be easily customized via a template override. If you do only hooks, it's difficult to know where content comes from or how to customize it. 

The exception to this rule is *dynamic content*, or *blocks of content with no logical structure or order*.

An example of structure within a template file, let's say an orders table, would be:

- Intro text
- Open table element.
- Loop
- Template include for each row
- Close table element.

Note we would not hook this content in via a filter. Whilst it would allow full customization without a template file, that makes the template file almost impossible for a new user to fathom it's purpose or how to customize elements. Use actions and filters sparingly, only when the content has no logical order or is mostly dynamic.

### Example template header

```php
<?php
/**
 * Template Name and Description
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/myaccount/template-name.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @author  Automattic
 * @package WooCommerce/Templates
 * @version 3.x.x
 */
 
if ( ! defined( 'ABSPATH' ) ) {
	exit;
}

// Add page content here.
```

### Variables and PHP logic

Where possible, PHP logic should be ran outside of template files and variables passed in. Keeping logic outside of template files lessens the need to update them as often, because code can be changed outside of the file.

The `wc_get_template` function allows variables to be passed into the template file.

### Localized strings

When including strings in template files, ensure they use good grammar, use US English, do not use title-case, and do not contain HTML. If you need to include HTML code in a string, use `sprintf` to insert the content dynamically.

Strings need to be escaped. See: https://developer.wordpress.org/themes/theme-security/data-sanitization-escaping/#escaping-securing-output.

Filters should not added around text strings in template files without good reason. In most cases, `gettext` filters which run on all localized strings are adequate for customizations.

Elements wrapping strings (paragraph tags for instance) should not have unique HTML class names unless the element specifically needs special styling. This is rare.

### Action and filter hooks

- When content is dynamic, hooks may be used to insert content, rather than having logic in the template itself.
- If making things like lists filterable, filters are preferable over `_start`/`_end` or `_before`/`_after` style hooks.
- Hook names should have a `woocommerce_` prefix.
- Hook names should be descriptive of the file/content context.
- Hook names can include a suffix which indicates placement e.g. `_start` or `_end`.

Example; placing an action hook before and after a form may use `woocommerce_example_form_start` and `woocommerce_example_form_end`.

When adding new actions to a template file, document it's usage and what functions are hooked into it so people looking at the template know where content is being injected via. e.g.:

```php
/**
 * woocommerce_before_shop_loop_item hook.
 *
 * @hooked woocommerce_template_loop_product_link_open - 10
 */
do_action( 'woocommerce_before_shop_loop_item' );
```

### Function calls

Direct function calls are permitted, but if you have several blocks of content with no logical order, these can be hooked in instead using the above method.

## Hook vs override - when to use what

- Whenever possible use the hooks to add or remove content. This method is more robust than overriding the templates. If you have overridden a template, you have to update the template any time the file changes. If you are using the hooks, you will only have to update if the hooks change, which happens much less frequently.
- If some structural change in HTML is necessary you should override a template.
- Do not delete any of WooCommerce hooks when overriding a template. This would prevent plugins hooking in to add content.

## Overriding templates in plugins

Plugins can hook into `woocommerce_locate_template` in order to create a alternative templates directory within the plugin.

See the example code below that allows to override WooCommerce templates using a directory called `templates` inside a plugin:

```php
/**
 * Get current plugin path.
 * 
 * @return string
 */
function myplugin_get_plugin_path() {
	// Gets the absolute path to this plugin directory.
	return untrailingslashit( plugin_dir_path( __FILE__ ) );
}

add_filter( 'woocommerce_locate_template', 'myplugin_woocommerce_locate_template', 10, 3 );

/**
 * Custom `/templates/` directory inside a plugin.
 * 
 * @param  string $template            Full template path
 * @param  string $template_name       Template name
 * @param  string $templates_directory Templates directory.
 * @return string
 */
function myplugin_woocommerce_locate_template( $template, $template_name, $templates_directory ) {
	$original_template = $template;

	if ( ! $templates_directory ) {
		$templates_directory = WC()->template_url;
	}

    // Plugin's custom templates/ directory
	$plugin_path = myplugin_get_plugin_path() . '/templates/';

	// Look within passed path within the theme - this is priority.
	$template = locate_template(
		array(
			$templates_directory . $template_name,
			$template_name,
		)
	);

	// Get the template from this plugin under /templates/ directory, if it exists.
	if ( ! $template && file_exists( $plugin_path . $template_name ) ) {
		$template = $plugin_path . $template_name;
	}

	// Use default template if not found a suitable template under plugin's /templates/ directory.
	if ( ! $template ) {
		$template = $original_template;
	}

	// Return what we found.
	return $template;
}
```

## Templates changes

We recommend using hooks, rather than overriding templates, because it means you don't need to update template files as often. We are doing big changes in major releases only so your code will be more reliable.

We reserve the right to deprecate templates, but when we do this the template should stay on WooCommerce core for a period of time before it gets removed. For example, we did this when we created the new "My Account" dashboard.

Excluding major changes and deprecated templates, we only do small fixes in minor or patch releases, and these types of changes should not cause issues for those of you who have already overridden any of our templates.
