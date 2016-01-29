Some confusion is present to the way WooCommerce does it's tax calculations. This post should hopefully clear that up.

## Defining Prices

Prices **for products** can be defined:

1. Including tax
2. Excluding tax

Note: shipping prices are always defined **excluding tax** in the current system, although a change is being considered.

When we say _defined including tax_, we are referring to the taxes of the store's **base country**.

e.g. A store with base country GB (United Kingdom) would define their prices with their GB rate of 20%.

## Tax Calculations (simplified)

To work out how much tax is applicable to a given price there is a calculation like as follows. For a tax rate of 20%, the following would be used:

**For tax inclusive prices**

Tax = Price - Price / 1.2

**For tax exclusive prices**

Tax = Price * 0.2

## Cross-border/country/region taxes

Calculating taxes across various countries for tax exclusive prices is simple; **you take the tax exclusive price and multiple by the tax rate.**

For prices including tax this is slightly more complicated.

### Prices including tax - Default v2.5.x Behavior

**Example 1**: Let's take an example of selling from GB (with their 20% tax rate) to Germany. The price of the product is 9.99 including tax. GB based sellers do not need to charge tax for physical goods in Germany so:

New price = 9.99 / 1.2 = 8.325

The German would pay 8.33 for the product.

**Example 2**: Let's take the same above example, but consider a digital good where tax would apply of the rate 19%.

First you would strip the GB tax, then you would need to apply the German tax like so:

New price = ( 9.99 / 1.2 ) * 1.19 = 9.90675

The German would pay 9.91.

### Prices including tax - Experimental Behavior

A common feature request is to charge the same amount everywhere and absorb the differences in taxes. To enable this feature in 2.5 you would use the code:

`
add_filters( 'woocommerce_adjust_non_base_location_prices', '__return_false' )
`

This would result in the following results, based on the previous 2 examples. 

**Example 1**: Selling from GB (with their 20% tax rate) to Germany. The price of the product is 9.99 including tax. GB based sellers do not need to charge tax for physical goods in Germany.

Price = 9.99 (the same)
Tax   = 0 (no tax is charged

The German would pay 9.99 for the product, the same as GB people.

**Example 2**: Let's take the same above example, but consider a digital good where tax would apply of the rate 19%.

Price = 9.99 (the same)
Tax   = 9.99 / 1.19 = 8.39 (slightly less than GB)

The German would again pay 9.99.

