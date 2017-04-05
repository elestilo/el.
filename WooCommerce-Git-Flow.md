<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Branches](#branches)
- [Branch naming](#branch-naming)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

For core development, we use the following structure and flow.

![Git Flow](https://github.com/woocommerce/woocommerce/wiki/images/flow.png)

## Branches

* **Master** is the branch for all development and should always be the target of pull requests.
* Each major release has a release branch e.g. `release/3.0`.
* Fixes are applied to master, and then **cherry picked into the release branch if needed**.
* Features that are not for the next release (for major, when next is minor) get labelled 'major' and are left as PRs. They can be approved however.
* Tags get created from release branches when ready to deploy.

## Branch naming

Prefixes determine the type of branch, and include:

* fix/
* feature/
* add/
* update/
* release/

When creating a **fix branch**, use the correct prefix and the issue number. Example:

```
fix/12345
```

Alternatively you can summarise the change:

```
fix/shipping-tax-rate-saving
```