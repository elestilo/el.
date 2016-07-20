Please refer to https://wpcalypso.wordpress.com/devdocs/docs/coding-guidelines/css.md?term=css for full details.

**TL;DR**

- Follow the [WP Coding standards for CSS](https://make.wordpress.org/core/handbook/best-practices/coding-standards/css/) unless is contradicts anything here
- Avoid `!important` and `*` selectors like the plague
- Use hyphens, not underscores or camelCase, when naming things like IDs, classes, variable names, mixins, placeholders. 

And for **class naming**, they should ideally be in the format `.component__element.is-modifier {}`

> Choose semantic class names based on hierarchy and content, not on positioning or visual appearance. (Example: .site__meta-info, instead of .site-menu-small or .site-top-section).