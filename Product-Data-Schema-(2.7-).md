In an effort to unify CLI, API, and WP Admin, new CRUD classes were implemented in v2.7 to form a new 'data manipulation API'.

Each CRUD class contains a representation of the data in array format. This document lists properties available for products - each property has a `get_` getter and `set_` setter method for accessing and setting values.

Name | Type | Description | Example
---- | ---- | ----------- | -------
`id` | `int` | Product ID | `1`