Our guidelines are based on those used in [Calypso](https://github.com/Automattic/wp-calypso) which itself follows the BEM methodology. Refer to [this doc](https://wpcalypso.wordpress.com/devdocs/docs/coding-guidelines/css.md?term=css) for full details. There are a few differences in WooCommerce however which are outlined below;

### Prefixing
WooCommerce is a WordPress plugin and has to play nicely with WordPress core and other plugins / themes. To minimise conflict potential all classes should be prefixed with `.woocommerce-`.

### Class names
Calypso is built in React and uses components to formulate CSS class names. WooCommerce Core has none of these components so uses a more traditional [BEM](http://getbem.com/) approach to [naming classes](http://cssguidelin.es/#bem-like-naming). 

When adding classes just remember;

**Block** - Standalone entity that is meaningful on its own.

**Element** - Parts of a block and have no standalone meaning. They are semantically tied to its block.

**Modifier** - Flags on blocks or elements. Use them to change appearance or behaviour.

### Example
* `.woocommerce-catalog {}` (block).
* `.woocommerce-catalog-product {}` (nested block).
* `.woocommerce-catalog-product--sale {}` (modifier).
* `.woocommerce-catalog-product__link {}` (element).
* `.woocommerce-catalog-product__title {}` (element).
* `.woocommerce-catalog-product__price {}` (element).
* `.woocommerce-catalog-product__rating {}` (element).
* `.woocommerce-catalog-product__button-add-to-cart {}` (element).
* `.woocommerce-catalog-product__button-add-to-cart--added {}` (modifier).

You can read more about BEM key concepts [here](https://en.bem.info/methodology/key-concepts/).

**TL;DR**

- Follow the [WP Coding standards for CSS](https://make.wordpress.org/core/handbook/best-practices/coding-standards/css/) unless is contradicts anything here.
- Follow [Calypso guidelines](https://wpcalypso.wordpress.com/devdocs/docs/coding-guidelines/css.md?term=css).
- Use BEM for [class names](https://en.bem.info/methodology/naming-convention/).
- Prefix all the things.


