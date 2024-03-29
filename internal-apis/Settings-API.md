<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Registering](#registering)
  - [Registering a group](#registering-a-group)
  - [Registering a setting](#registering-a-setting)
- [REST API](#rest-api)
  - [GET /wc/v1/settings](#get-wcv1settings)
  - [GET /wc/v1/settings/$group](#get-wcv1settingsgroup)
  - [GET /wc/v1/settings/$group/$setting](#get-wcv1settingsgroupsetting)
  - [POST /wc/v1/settings/$group/batch](#post-wcv1settingsgroupbatch)
  - [POST /wc/v1/settings/$group/batch](#post-wcv1settingsgroupbatch-1)
  - [PUT /wc/v1/settings/$group/$setting](#put-wcv1settingsgroupsetting)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Notice: This page is a draft for an unmerged and unreleased API. The new API allows settings to be registered (outside of the context of admin) and returned by the REST API. Things are subject to change while the API is in development.

There are two concepts to understand before diving in and working with the Settings API:

Settings groups: A grouping of specific settings. For example settings under the _WooCommerce > Settings > Products_ are all under the 'products' grouping. You can have subgroups allowing for a hierarchy of related settings and groups.

Settings: The actual settings being updated.

Note on legacy/wp-admin settings: There is some code in place that takes current settings registered in wp-admin and transforms them into the new filters. No notice or info is currently displayed to developers when registering settings the current way. I imagine we would like to remove this code at some point after showing deprecated notices, and make everyone use a consistent method.

## Registering

### Registering a group

Groups are registered by filtering the `woocommerce_settings_groups` array and adding to it.

```
add_filter( 'woocommerce_settings_groups', function( $locations ) {
	$locations[] = array(
		'id'          => 'test',
		'label'       => __( 'Test Extension', 'woocommerce' ),
		'description' => __( 'My awesome test settings.', 'woocommerce' ),
	);
	return $locations;
} );
```

You can register the following data when adding a new group:

* _id_: A unique identifier that can be used to link settings together. Alphanumeric string that contains no spaces. Required.
* _label_: A human readable label. This is a string that can be used in the UI. Required.
* _description_: A human readable description. This is a string that can be used in the UI. Optional.
* _parent_id_: ID of a parent group if this group is a child group. Optional.

### Registering a setting

Settings are registered by filtering special filters ran when setting groups are used. Each setting group has it's own array to filter (to avoid working on ridiculously long global setting arrays).

The filter for the group we created above would be `woocommerce_settings-test`. test would be replaced with whatever ID you used for your new group.

```
add_filter( 'woocommerce_settings-test', function( $settings ) {
	$settings[] = array(
		'id'          => 'woocommerce_shop_page_display',
		'option_key'  => 'woocommerce_shop_page_display',
		'label'       => __( 'Shop Page Display', 'woocommerce' ),
		'description' => __( 'This controls what is shown on the product archive.', 'woocommerce' ),
		'default'     => '',
		'type'        => 'select',
		'options'     => array(
			''              => __( 'Show products', 'woocommerce' ),
			'subcategories' => __( 'Show categories &amp; subcategories', 'woocommerce' ),
			'both'          => __( 'Show both', 'woocommerce' ),
		),
	);
	return $settings;
} );


add_filter( 'woocommerce_settings-email_new_order', function( $settings ) {
	$settings[] = array(
		'id'          => 'subject',
		'option_key'  => array( 'woocommerce_new_order_settings', 'subject' ),
		'label'       => __( 'Subject', 'woocommerce' ),
		'description' => __( 'This controls the email subject line. Leave blank to use the default subject: <code>[{site_title}] New customer order ({order_number}) - {order_date}</code>.', 'woocommerce' ),
		'default'     => '',
		'type'        => 'text',
	);
	return $settings;
} );
```

The following data can be registered when creating a new setting:

* _id_: A unique identifier. This ID is used in the REST API. This ID needs to be unique for the setting group, but not the entire system. Required.
* _type_: Type of field/data for the setting. Accepted values: text, email, number, color, password, textarea, select, multiselect, multi_select_countries (which will return as multiselect, but will load countries for you), image_width, radio, checkbox. Required.
* _option_key_: This is the key used to pull and update the value in the database. get_option/update_option will use the key here. This can either be a string, or an array for settings that are stored in an array of a single option key (like email settings). This is never returned via the API and only used internally. Required.
* _label_: A human readable label. This is a string that can be used in the UI. Optional.
* _description_: A human readable description. This is string that can be used in the UI. Optional.
* _tip_: A human readable extra tip/help text. This is a string that can be used in the UI. Optional.
* _placeholder_: Placeholder text to be used in some settings if no value/default is set. Optional.
* _default_: Default value for this setting. Optional.
* _options_: An array of key value pairs for settings that allow you to pick from a pre-defined list of values.

## REST API

### GET /wc/v1/settings

Calling the root settings endpoint will return all available groups currently registered to WooCommerce.

```
[
    {
        "id": "test",
        "label": "Test Extension",
        "description": "My awesome test settings.",
        "parent_id": "",
        "sub_groups": [ "sub-test" ]
    },
    {
        "id": "sub-test",
        "label": "Sub test",
        "description":"",
        "parent_id": "test",
        "sub_groups" :[]
    },
    {
        "id": "general",
        "label": "General",
        "description": "",
        "parent_id":"",
        "sub_groups":[]
    },
    {
        "id": "products",
        "label": "Products",
        "description": "",
        "parent_id": "",
        "sub_groups": []
    },
    ...
]
```

### GET /wc/v1/settings/$group

Calling an endpoint for a specific group will return all settings registered to that group.

Here is an example if we call the core 'products' group.

```
[
    {
        "id": "woocommerce_weight_unit",
        "label": "Weight Unit",
        "description": "This controls what unit you will define weights in.",
        "type": "select",
        "default": "kg",
        "options": {
            "kg": "kg",
            "g": "g",
            "lbs": "lbs",
            "oz": "oz"
        },
        "tip": "This controls what unit you will define weights in.",
        "value": "lbs"
    },
    ...
]
```


### GET /wc/v1/settings/$group/$setting

Fetching a single setting allows you to fetch data on a single setting only. Here is an example on a different setting registered to the 'products' group.

```
{
    "id": "woocommerce_review_rating_verification_label",
    "label": "",
    "description": "Show \"verified owner\" label for customer reviews",
    "type": "checkbox",
    "default": "yes",
    "value": "yes"
}
```

### POST /wc/v1/settings/$group/batch

You can update multiple values at once for the same group. Only include the settings objects you wish to update.

Values are validated according to their type. Radio buttons, select, and multiselect can only accept values that are present in their options arrays. Checkboxes support 'yes' and 'no'. image_width supports height, width, and crop. All other text based settings are sanitized like they are in wp-admin. If you pass a bogus value that can't be set, a 400 error will be returned.

Set a body of 'update' (array):

### POST /wc/v1/settings/$group/batch

```
'update' => array(
    array(
        'id'    => 'woocommerce_shop_page_display',
        'value' => 'both',
    ),
    array(
        'id'    => 'woocommerce_enable_lightbox',
        'value' => 'no',
    ),
),
```

The response should match the GET request to /wc/v1/settings/$group with the updated values returned in the `update` property.

### PUT /wc/v1/settings/$group/$setting

You can update a single setting just by passing its values in the body:

PUT /wc/v1/settings/$group/$setting

```
'value' => 'no'
```

The response should match the GET request to /wc/v1/settings/$group/$setting with the updated value returned.