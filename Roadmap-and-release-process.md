<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Backward Compatibility](#backward-compatibility)
- [Roadmap](#roadmap)
- [Feature requests](#feature-requests)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

WooCommerce has a minor release (e.g., 3.1, 3.2) every 3-4 months, typically per quarter. Each cycle consists of:

- 4-6 weeks development (1 sprint per week)
- 2-4 weeks beta testing
- 2-4 weeks release candidate period and feature freeze

Each new release has a corresponding milestone on Github, with a description explaining the main goals of the release, and a planned release date. Example: [3.2 Milestone on Github](https://github.com/woocommerce/woocommerce/milestone/70).

Major releases (e.g., 3.0, 4.0) are less frequent and typically will be announced with at least 3 months warning, with the features already developed and announced separately thus being available for testing as soon as possible.

Patch versions (e.g., 3.1.1, 3.1.2)  are released on an as-needed basis, usually to address bugs or regressions. Patch versions are documented on the [dev blog](https://woocommerce.wordpress.com/) and also have a milestone on Github to track issues. 

Major new features or updates are developed as **feature plugins** first before being merged into core. A good example of this is the [WC API](https://github.com/woocommerce/wc-api-dev) in which the next major version is developed separately. This allows for:

- Faster feature iteration with less risk.
- More contribution opportunities, including opportunities to manage a project.
- Reduced maintenance burden for core, and less risk of backwards compatibility issues.

## Backward Compatibility

WooCommerce follows [Semantic Versioning](http://semver.org/). We're committed to ensure minor and patch releases are non-breaking and fully backwards compatible. 

If keeping backward compatibility is not possible, the feature, the enhancement or the bug fix will be scheduled for the next major release.

Feature plugins and experimental features are however subject to change and may not be backwards compatible since these will be used at your own risk.

## Roadmap

Github is home to all things that we intend to build into core. A longer term roadmap is being hosted on Github Projects here: https://github.com/woocommerce/woocommerce/projects/3

- Near-term projects are to be tackled in the next 3-6 months
- Medium-term projects are to be done in the next 6-12 months
- Long-term projects are at least a year away

Items on the roadmap reflect when things will ship, not when development will begin. More details about an item should be added to the issue/card descriptions. Discussion on issues/cards is welcome.

Non-issue cards on the roadmap will be converted to issues when development is being planned. 

Milestones will only be created when a target date for the release is decided.

## Feature requests

You can [request new features on the ideas board](http://ideas.woocommerce.com/). Ideas which gain traction will be considered for core inclusion, or as extensions/services.

If you'd like to contribute to a new idea thats great! You can chat to us and get validation on Slack or in the dev chats (these are announced on the [dev blog](https://woocommerce.wordpress.com/) and are bi-weekly).