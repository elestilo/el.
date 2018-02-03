<?xml version="1.0" encoding="UTF-8"?><rss version="2.0"
	xmlns:content="http://purl.org/rss/1.0/modules/content/"
	xmlns:wfw="http://wellformedweb.org/CommentAPI/"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:atom="http://www.w3.org/2005/Atom"
	xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
	xmlns:slash="http://purl.org/rss/1.0/modules/slash/"
	xmlns:georss="http://www.georss.org/georss" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:media="http://search.yahoo.com/mrss/"
	>

<channel>
	<title>WooCommerce 2.5 &#8211; Develop WooCommerce</title>
	<atom:link href="https://woocommerce.wordpress.com/tag/woocommerce-2-5/feed/" rel="self" type="application/rss+xml" />
	<link>https://woocommerce.wordpress.com</link>
	<description>The official WooCommerce development blog</description>
	<lastBuildDate>Sat, 03 Feb 2018 07:34:46 +0000</lastBuildDate>
	<language>en</language>
	<sy:updatePeriod>hourly</sy:updatePeriod>
	<sy:updateFrequency>1</sy:updateFrequency>
	<generator>http://wordpress.com/</generator>
<cloud domain='woocommerce.wordpress.com' port='80' path='/?rsscloud=notify' registerProcedure='' protocol='http-post' />
<image>
		<url>https://secure.gravatar.com/blavatar/84d6d0013fea0508f9db89e5b0ab64d9?s=96&#038;d=https%3A%2F%2Fs2.wp.com%2Fi%2Fbuttonw-com.png</url>
		<title>WooCommerce 2.5 &#8211; Develop WooCommerce</title>
		<link>https://woocommerce.wordpress.com</link>
	</image>
	<atom:link rel="search" type="application/opensearchdescription+xml" href="https://woocommerce.wordpress.com/osd.xml" title="Develop WooCommerce" />
	<atom:link rel='hub' href='https://woocommerce.wordpress.com/?pushpress=hub'/>
	<item>
		<title>WooCommerce 2.5.5 Fix Release</title>
		<link>https://woocommerce.wordpress.com/2016/03/11/woocommerce-2-5-5-fix-release/</link>
		<comments>https://woocommerce.wordpress.com/2016/03/11/woocommerce-2-5-5-fix-release/#comments</comments>
		<pubDate>Fri, 11 Mar 2016 18:05:00 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=1335</guid>
		<description><![CDATA[The WooCommerce 2.5.5 fix release is now available. A total of ~6 commits made it into this release fixing a notice in WP Admin during product creation which affected some users. As an aside, we&#8217;re currently working hard no a new API/CRUD classes in WooCommerce core to support Orders, Coupons, and products. Once complete this<a class="more-link" href="https://woocommerce.wordpress.com/2016/03/11/woocommerce-2-5-5-fix-release/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>The WooCommerce 2.5.5 fix release is now available. A total of <a href="https://github.com/woothemes/woocommerce/compare/2.5.4...release/2.5">~6 commits</a> made it into this release fixing a notice in WP Admin during product creation which affected some users.</p>
<p>As an aside, we&#8217;re currently working hard no a new API/CRUD classes in WooCommerce core to support <a href="https://github.com/woothemes/woocommerce/pull/10259">Orders</a>, <a href="https://github.com/woothemes/woocommerce/pull/10417">Coupons</a>, and products. Once complete this will make things such as saving products more testable via unit tests making issues like the above one much less likely to slip through the net!</p>
<p>The changelog for 2.5.5 is below.</p>
<pre>* Fix - Prevent notice when unsetting terms on product edit screen.
* Tweak - zeroclipboard fallback for firefox on system status report.
* Tweak - Check valid product ID is provided on add_to_cart shortcode.</pre>
<p>You can download it on <a href="https://wordpress.org/plugins/woocommerce/">WordPress.org</a> or as an automatic update in your administration panel.</p>
<p>If you spot any further issues, please report them to us in detail on <a href="https://github.com/woothemes/woocommerce/issues/new">Github</a> so the development team can review – comments on this post are closed.</p>
]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2016/03/11/woocommerce-2-5-5-fix-release/feed/</wfw:commentRss>
		<slash:comments>1</slash:comments>
	
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>
	</item>
		<item>
		<title>WooCommerce 2.5.4 Fix Release</title>
		<link>https://woocommerce.wordpress.com/2016/03/10/woocommerce-2-5-4-fix-release/</link>
		<pubDate>Thu, 10 Mar 2016 17:26:59 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=1319</guid>
		<description><![CDATA[The WooCommerce 2.5.4 fix release is now available. You can download it on WordPress.org or as an automatic update in your administration panel. A total of ~29 commits made it into this release fixing several minor issues and making some small tweaks.The biggest fix in 2.5.4 was utf8mb4 support for our database table schema (thanks JJJ). This was causing<a class="more-link" href="https://woocommerce.wordpress.com/2016/03/10/woocommerce-2-5-4-fix-release/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>The WooCommerce 2.5.4 fix release is now available. You can download it on <a href="https://wordpress.org/plugins/woocommerce/">WordPress.org</a> or as an automatic update in your administration panel.</p>
<p>A total of <a href="https://github.com/woothemes/woocommerce/compare/2.5.3...2.5.4">~29 commits</a> made it into this release fixing several minor issues and making some small tweaks.The biggest fix in 2.5.4 was <a href="https://github.com/woothemes/woocommerce/commit/f4e90ca834fe91846bd64800b03467eb368fd35d">utf8mb4 support for our database table schema</a> (thanks JJJ). This was causing new users to have missing woocommerce_terms tables after install.</p>
<p>The changelog for 2.5.4 is below.</p>
<pre>* Fix - Fix table creation when using utf8mb4 charset.
* Fix - Have wp_insert_post return WP_Error when creating our coupon, so the is_wp_error check can catch it.
* Fix - Clear sale price on save if sale is no longer valid.
* Fix - Round refund values to ensure refunds can be performed.
* Fix - When getting coupon by code used twice, latest should be queried.
* Fix - CLI improvements for setting up variations and deleting orders.
* Fix - Allow big selects when getting variations to support larger queries.
* Fix - Trigger webhook when user edits addresses on frontend.
* Fix - Hide shipping row when calculator is disabled, and shipping costs are hidden.
* Fix - Unset deleted attributes when updating products.
* Tweak - Update date for paid orders during non-manual updates only.
* Tweak - wc_get_page_permalink - if the page ID is not set, redirect home instead to prevent white screens.
* Tweak - Remove log dir from system status report.
* Tweak - When sorting by date, fallback to ID.
* Tweak - Rename pay link for clarity.
* Tweak - Provide a fallback message if copying to the clipboard fails in system status report.</pre>
<p>If you spot any further issues, please report them to us in detail on <a href="https://github.com/woothemes/woocommerce/issues/new">Github</a> so the development team can review – comments on this post are closed.</p>
]]></content:encoded>
		
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>
	</item>
		<item>
		<title>WooCommerce 2.5.3 Fix Release</title>
		<link>https://woocommerce.wordpress.com/2016/03/01/woocommerce-2-5-3-fix-release/</link>
		<comments>https://woocommerce.wordpress.com/2016/03/01/woocommerce-2-5-3-fix-release/#comments</comments>
		<pubDate>Tue, 01 Mar 2016 17:09:29 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=1301</guid>
		<description><![CDATA[The WooCommerce 2.5.3 fix release is now available. You can download it on WordPress.org or as an automatic update in your administration panel. The most notable change is to customer details on the thanks page. The thanks page has an obscure URL making it impossible to guess/find and see other user&#8217;s orders, however, if someone did discover the URL they&#8217;d see<a class="more-link" href="https://woocommerce.wordpress.com/2016/03/01/woocommerce-2-5-3-fix-release/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>The WooCommerce 2.5.3 fix release is now available. You can download it on <a href="https://wordpress.org/plugins/woocommerce/">WordPress.org</a> or as an automatic update in your administration panel.</p>
<p>The most notable change is to customer details on the thanks page. The thanks page has an obscure URL making it impossible to guess/find and see other user&#8217;s orders, however, if someone did discover the URL they&#8217;d see the customer address along with order details. To maintain privacy this is now hidden if the user viewing the page is a guest, or does not own the order.</p>
<p>A total of <a href="https://github.com/woothemes/woocommerce/compare/2.5.2...2.5.3">~34 commits</a> made it into this release fixing several minor issues and making some small tweaks. The changelog for 2.5.3 is below.</p>
<pre>* Fix - Correct the 'unavailable template' call for variations so the message is displayed correctly, fixing a JS error.
* Fix - Add 'media-models' dependency to write panel scripts.
* Fix - Fix hide empty check in category walkers.
* Fix - Current class fix on some servers when empty.
* Fix - Multibyte safe trim string function.
* Fix - Prevent a notice by stopping a loop in woocommerce_products_will_display from stomping on other variables.
* Fix - If an attribute meta key is not set, technically its 'any', so should match. Prevents issues when meta data is missing after renaming attributes.
* Fix - Make wc_get_product_variation_attributes ignore non variation attributes.
* Fix - Notice when no order notes exist.
* Fix - Removed extra tab from plain email shipping address.
* Fix - Round shipping after tax calculation instead of before to prevent wrong taxes being calculated.
* Fix - State input box was not reappearing when switching from a hidden input to a text input.
* Fix - Don't duplicate rating and review counts.
* Fix - CLI - Allow setting of a single category.
* Fix - API - Replace term_taxonomy_id for term_id whilst creating/editing terms.
* Fix - API - Fix parent_id and menu_order for variations.
* Fix - Combine update post calls when update_status is ran.
* Fix - Total number of comments in the admin panel.
* Tweak - Show customer details for logged in users only on thanks page to prevent customer details being revealed if someone finds out the URL.
* Tweak - Wrap status report in backticks to stop people breaking .org forums.
* Tweak - Error handling for screen ids.
* Tweak - Use $wpdb-&gt;replace instead of doing a select and then deciding to do an update or insert in session handler.
* Tweak - Added check for private WooCommerce pages in status report.
* Tweak - Transactional emails for failed -&gt; on hold.
* Dev - Include new triggers when removing and adding the password strength meter.
* Dev - Allow pass objects and arrays as webhook callbacks.</pre>
<p>If you spot any further issues, please report them to us in detail on Github so the development team can review – comments on this post are closed.</p>
]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2016/03/01/woocommerce-2-5-3-fix-release/feed/</wfw:commentRss>
		<slash:comments>2</slash:comments>
	
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>
	</item>
		<item>
		<title>WooCommerce 2.5.2 Fix Release</title>
		<link>https://woocommerce.wordpress.com/2016/02/01/woocommerce-2-5-2-fix-release/</link>
		<pubDate>Mon, 01 Feb 2016 16:09:45 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=1211</guid>
		<description><![CDATA[The WooCommerce 2.5.2 fix release is now available. You can download it on WordPress.org or as an automatic update in your administration panel. A total of ~46 commits made it into this release fixing several minor issues. * Fix - Compatibility with w3 total cache inline minification. * Fix - Remove stock bw compat code<a class="more-link" href="https://woocommerce.wordpress.com/2016/02/01/woocommerce-2-5-2-fix-release/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>The WooCommerce 2.5.2 fix release is now available. You can download it on <a href="https://wordpress.org/plugins/woocommerce/">WordPress.org</a> or as an automatic update in your administration panel.</p>
<p>A total of <a href="https://github.com/woothemes/woocommerce/compare/2.5.1...2.5.2">~46 commits</a> made it into this release fixing several minor issues.</p>
<pre>* Fix - Compatibility with w3 total cache inline minification.
* Fix - Remove stock bw compat code which was preventing manage stock being disabled at variation level.
* Fix - When calculating shipping total, force rounding.
* Fix - Make save button clickable in tax rate table after using autocomplete field.
* Fix - Fix passed image_size variable in email templates.
* Fix - Don't show purchase note to admin in emails.
* Fix - Fix 'hide empty' setting in category widget .
* Fix - Prevent notice in get_allowed_countries.
* Fix - Prevent add-to-cart querystring in pagination links.
* Tweak - Allow propagation in variation script.
* Tweak - Product image alt text.
* Tweak - Remove notice and add styling for add payment page.
* Tweak - Set input margin and label display for compatibility with themes using bootstrap CSS.
* Tweak - Add context to category term localization.
* Tweak - Moved cart URL functions to core-functions file to make them available in admin area.
* Tweak - Added password hint text and error messages when showing the password strength meter in forms.
* Tweak - Added Saudi Riyal currency.
* Tweak - Added Russian Ruble symbol.
* Tweak - When COOKIEPATH is an empty string, set to '/' so cookies work across all pages.
<span class="s1">* Dev - Template - Pass $category into wc_product_cat_class() in content-product_cat.php</span></pre>
<p>If you spot any further issues, please report them to us in detail on Github so the development team can review – comments on this post are closed.</p>
]]></content:encoded>
		
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>
	</item>
		<item>
		<title>WooCommerce 2.5.1 Fix Release</title>
		<link>https://woocommerce.wordpress.com/2016/01/25/woocommerce-2-5-1-fix-release/</link>
		<pubDate>Mon, 25 Jan 2016 15:28:09 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=1183</guid>
		<description><![CDATA[The WooCommerce 2.5.1 fix release is now available. You can download it on WordPress.org or as an automatic update in your administration panel. A total of ~36 commits made it into this release fixing several minor issues. = 2.5.1 - 25/01/2016 = * Fix - Remove usage of get_currentuserinfo() which is deprecated in WordPress 4.5.<a class="more-link" href="https://woocommerce.wordpress.com/2016/01/25/woocommerce-2-5-1-fix-release/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>The WooCommerce 2.5.1 fix release is now available. You can download it on <a href="https://wordpress.org/plugins/woocommerce/">WordPress.org</a> or as an automatic update in your administration panel.</p>
<p>A total of <a href="https://github.com/woothemes/woocommerce/compare/2.5.0...2.5.1">~36 commits</a> made it into this release fixing several minor issues.</p>
<pre>= 2.5.1 - 25/01/2016 =
* Fix - Remove usage of get_currentuserinfo() which is deprecated in WordPress 4.5.
* Fix - Fix responsive product sizes when the columns class is missing.
* Fix - Fix function exists check for woocommerce_template_loop_category_title.
* Fix - check_version on all requests so that the installer runs after remote plugin updates.
* Fix - Only show the "add payment method" button when needed, and check for required fields on the add payment method page.
* Fix - Correctly block UI to prevent attribute issues in backend when adding multiple attributes in quick succession.
* Fix - Show SKU in admin emails.
* Fix - Don't show downloads in admin emails.
* Fix - Fix query/missing variable in validate_user_usage_limit function.
* Fix - Prevent endless loading on checkout when reload_checkout session variable was used.
* Fix - Correctly display html entities in tax screen autocomplete.
* Fix - Do sales reports based on refund line items rather than fully refunded orders to prevent double refunds being reported.
* Fix - Qty button can be hidden for variable products sold individually.
* Fix - Show the taxable country rather than base country in "estimated for" text during checkout.
* Fix - Prevent select2 gaining focus on IOS7 scroll.
* Fix - API - Fix indexes on decimal and thousand values.
* Tweak - Clear cron jobs on uninstall .
* Tweak - Don't disable place order button on checkout if a weak password is used.
* Tweak - Added password strength meter in lost password and edit accout pages.
* Tweak - Pass $args to woocommerce_dropdown_variation_attribute_options_html hook.
</pre>
<p>If you spot any further issues, please report them to us in detail on Github so the development team can review – comments on this post are closed.</p>
]]></content:encoded>
		
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>
	</item>
		<item>
		<title>Say hello to WooCommerce 2.5 &#8220;Dashing Dolphin&#8221;</title>
		<link>https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/</link>
		<comments>https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/#comments</comments>
		<pubDate>Mon, 18 Jan 2016 14:22:31 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=1023</guid>
		<description><![CDATA[Today we&#8217;re proud to release WooCommerce 2.5 &#8220;Dashing Dolphin&#8221; into the wild! 2.5 has been in development for ~5 months and has seen around 1600 commits from 42 contributors. This is another evolutionary release which focusses on improvements to existing functionality, as well as stability and performance. We do however have some new features to mention in 2.5 which developers<a class="more-link" href="https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>Today we&#8217;re proud to release WooCommerce 2.5 &#8220;Dashing Dolphin&#8221; into the wild! 2.5 has been in development for ~5 months and has seen around <a href="https://github.com/woothemes/woocommerce/compare/2.4.0...2.5.0"><strong>1600 commits</strong></a> from <strong>42 contributors</strong>.</p>
<p>This is another evolutionary release which focusses on improvements to existing functionality, as well as stability and performance. We do however have some new features to mention in 2.5 which developers in particular should enjoy using.</p>
<p><img data-attachment-id="1059" data-permalink="https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/dolphin/" data-orig-file="https://woocommerce.files.wordpress.com/2016/01/dolphin.png?w=612" data-orig-size="386,446" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="dolphin" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2016/01/dolphin.png?w=612?w=260" data-large-file="https://woocommerce.files.wordpress.com/2016/01/dolphin.png?w=612?w=386" class=" size-full wp-image-1059 aligncenter" style="border:0;height:150px;" src="https://woocommerce.files.wordpress.com/2016/01/dolphin.png?w=612" alt="dolphin.png" srcset="https://woocommerce.files.wordpress.com/2016/01/dolphin.png 386w, https://woocommerce.files.wordpress.com/2016/01/dolphin.png?w=130 130w, https://woocommerce.files.wordpress.com/2016/01/dolphin.png?w=260 260w" sizes="(max-width: 386px) 100vw, 386px" /></p>
<p><strong>Introducing WooCommerce CLI</strong></p>
<p>The <strong>WooCommerce CLI</strong> (command line interface) lets you perform many actions on your store via the command line, <span class="s1">such as creating customers and coupons</span>. This should be very useful for power users! Here is a quick example of the CLI in action, in this example updating then deleting a coupon.</p>
<p><img data-attachment-id="1146" data-permalink="https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/2016-01-12-10_54_27/" data-orig-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-10_54_27.gif?w=612" data-orig-size="700,525" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-01-12 10_54_27" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-10_54_27.gif?w=612?w=300" data-large-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-10_54_27.gif?w=612?w=612" class="alignnone size-full wp-image-1146" src="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-10_54_27.gif?w=612" alt="2016-01-12 10_54_27.gif"   /></p>
<p><a href="https://github.com/woothemes/woocommerce/wiki/WP-CLI-commands">The documentation for our CLI can be found here.</a></p>
<p><strong>A new sessions table</strong></p>
<p>Being stateless, WordPress doesn’t have an in-built way of handling session data. You can use cookies or implement PHP Sessions, but both have limitations and some hosts aren’t equipped to deal with them by default.</p>
<p>Early on we decided to adopt a solution based on <a href="https://github.com/ericmann/wp-session-manager">wp-session-manager</a> whereby you have a cookie to identify each user, and have their session data stored in the WP options table. This worked well, and has served us nicely until now, however it did lead to problems with scalability and data cleanup.</p>
<p>For these reasons we’re introducing a <strong>new session handler</strong> which uses custom tables, rather than the WordPress options table.</p>
<p><a href="https://woocommerce.wordpress.com/2015/10/07/new-session-handler-in-2-5/">You can read more about this feature here.</a></p>
<p><strong>Performance improvements</strong></p>
<p>We made a number of performance improvements in 2.5, mainly working on optimising our usage of transients <a href="https://woocommerce.wordpress.com/2015/12/04/woocommerce-2-5-beta-2/">which we covered in our beta 2 post.</a></p>
<p>tl;dr we&#8217;ve <strong>audited all transients</strong>, removing those that are unnecessary and moving to alternative forms of data storage and caching where possible. Combined with the new sessions table, query speed should be improved due to reduced usage of the wp options table.</p>
<p><strong>Tax rate settings UI</strong></p>
<p>We&#8217;ve been experimenting with <a href="http://backbonejs.org/">backbonejs</a> to improve the user interface recently, which should feature more prominantly in core from 2.6. In 2.5 we&#8217;ve used it to improve the tax rate input screens, which now saves via ajax and has a new inline search.</p>
<p><img data-attachment-id="1162" data-permalink="https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/2016-01-12-12_04_11/" data-orig-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_04_11.gif?w=612" data-orig-size="700,257" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-01-12 12_04_11" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_04_11.gif?w=612?w=300" data-large-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_04_11.gif?w=612?w=612" class="alignnone size-full wp-image-1162" src="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_04_11.gif?w=612" alt="2016-01-12 12_04_11.gif"   /></p>
<p><strong>Improved checkout flow</strong></p>
<p>We touched on some checkout screen tweaks in our <a href="https://woocommerce.wordpress.com/2015/12/04/woocommerce-2-5-beta-2/">beta 2 post here</a> and <a href="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/">the beta 1 post here</a>. Most <span class="s1">notably </span><span style="line-height:1.7;">we have:</span></p>
<ul>
<li>Moved the terms and conditions box before the place order button</li>
<li>Tweaked default call to action button styles</li>
<li>Added error recovery when malformed JSON is returned by the ajax methods.</li>
<li>Removed the &#8216;estimated&#8217; text from the cart totals area.</li>
<li>Made it so when only 1 gateway is enabled, the radio buttons will be hidden.</li>
<li>Added password strength indicators when creating an account.</li>
</ul>
<p><img data-attachment-id="1164" data-permalink="https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/2016-01-12-12_06_35/" data-orig-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_06_35.gif?w=612" data-orig-size="250,249" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-01-12 12_06_35" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_06_35.gif?w=612?w=250" data-large-file="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_06_35.gif?w=612?w=250" class=" size-full wp-image-1164 aligncenter" src="https://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_06_35.gif?w=612" alt="2016-01-12 12_06_35.gif"   /></p>
<p><strong>Everything else&#8230;</strong></p>
<p>There are over 25 tweaks listed in the <a href="https://github.com/woothemes/woocommerce/blob/2.5.0/readme.txt">changelog</a>, including:</p>
<ul>
<li>Moved emails in the email settings to a table to keep things organised.</li>
<li>wp.template usage for variations which now allows developers to change the layout of single variations.</li>
<li>Removed the welcome screen.</li>
<li>For coupons with category restrictions, respect the category hierarchy.</li>
<li>A new wc_array_cartesian function to generate variations in a logical order.</li>
</ul>
<p>And some REST API improvements for developers using it:</p>
<ul>
<li>Added /products/shipping_classes endpoint.</li>
<li>Added support to POST, PUT, and DELETE categories and tags.</li>
<li>Added support to filter products by tag, category, shipping class, and attribute.</li>
<li>Added tax and tax_class endpoints.</li>
</ul>
<p>We hope you&#8217;re excited about these changes <img src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f642.png" alt="🙂" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<h2>Template Changes</h2>
<p>With most new releases, updates to template files are needed in order to add or change functionality. When we make a major change, the template version is incremented. Themes which bundle these templates may need to update them to reflect core.</p>
<p>We covered some reasoning behind the larger changes in our <a href="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/">beta 1 announcement</a>.</p>
<p>There are 7 new template files (see the beta 1 post). The following template files have been version bumped in 2.5:</p>
<ol>
<li>single-product/review.php – Added new action hooks + verified reviewer code</li>
<li>single-product/add-to-cart/variable.php – Correctly escape variation data.</li>
<li>order/order-details.php – woocommerce_purchase_note_order_statuses filter.</li>
<li>order/order-details-item.php – woocommerce_purchase_note_order_statuses filter.</li>
<li>loop/add-to-cart.php – Uses supports_ajax_add_to_cart method.</li>
<li>global/quantity-input.php – Changed min and max attributes.</li>
<li>content-widget-product.php – File was missing version.</li>
<li>content-product.php – Action hooks to handle anchor output.</li>
<li>content-product_cat.php – Action hooks to handle anchor output.</li>
<li>checkout/payment.php – Support for new terms.php template file.</li>
<li>checkout/form-pay.php – Support for new terms.php template file.</li>
<li>cart/mini-cart.php – URL escaping.</li>
<li>cart/cart-shipping.php – Extra filters and some simplification of strings.</li>
</ol>
<p>Additionally all email templates have been updated to use a unified order details template (email-order-details.php).</p>
<h2>Testing</h2>
<p>Since November 9th 2015 we&#8217;ve had 3 beta versions and 2 release candidates giving ample warning to developers to test, including posts on Twitter, Facebook, and our dev blog.</p>
<p>Our <a href="https://wordpress.org/plugins/woocommerce-beta-tester/">beta tester plugin</a> is installed on around ~60 sites according to .org, but this number does not include manual installs from Github. According to Github API, RC1 was downloaded manually over 100 times so we 190 times, so it&#8217;s good to see people testing things out.</p>
<p>Internally we&#8217;ve been testing the RC on some new stores we&#8217;re building (for WooConf), on WPJobManager.com, and on WooThemes.com. We have also tested all WooThemes extensions for compatibility, and had our 3rd party devs do the same.</p>
<p>We also know at least one user <a href="https://github.com/woothemes/woocommerce/issues/9922#issue-124389509">accidentally updated</a> and had no upgrade issues <img src="https://s0.wp.com/wp-content/mu-plugins/wpcom-smileys/twemoji/2/72x72/1f609.png" alt="😉" class="wp-smiley" style="height: 1em; max-height: 1em;" /></p>
<blockquote><p>however it happened, I never noticed until now. The store&#8217;s got about 10 WooCommerce extension plugins. So, it looks like WC 2.5 isn&#8217;t going to break as many things as previous major releases!</p></blockquote>
<p>Thanks to everyone who contributed, tested, and translated this release and we hope you all enjoy using it!</p>
<p>&nbsp;</p>
]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2016/01/18/say-hello-to-woocommerce-2-5-dashing-dolphin/feed/</wfw:commentRss>
		<slash:comments>8</slash:comments>
	
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2016/01/dolphin.png" medium="image">
			<media:title type="html">dolphin.png</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2016/01/2016-01-12-10_54_27.gif" medium="image">
			<media:title type="html">2016-01-12 10_54_27.gif</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_04_11.gif" medium="image">
			<media:title type="html">2016-01-12 12_04_11.gif</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2016/01/2016-01-12-12_06_35.gif" medium="image">
			<media:title type="html">2016-01-12 12_06_35.gif</media:title>
		</media:content>
	</item>
		<item>
		<title>WooCommerce 2.5 Release Candidate</title>
		<link>https://woocommerce.wordpress.com/2016/01/05/woocommerce-2-5-release-candidate/</link>
		<comments>https://woocommerce.wordpress.com/2016/01/05/woocommerce-2-5-release-candidate/#comments</comments>
		<pubDate>Tue, 05 Jan 2016 16:13:43 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=857</guid>
		<description><![CDATA[The release candidate for WooCommerce 2.5 is now available. RC means we think we’re done, but with thousands of users and hundreds of plugins and themes with WooCommerce support, it’s possible we’ve missed something. We hope to ship WooCommerce 2.5.0 on Monday, January 18, but we need your help to get there. If you haven’t tested WC 2.5 yet,<a class="more-link" href="https://woocommerce.wordpress.com/2016/01/05/woocommerce-2-5-release-candidate/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>The release candidate for WooCommerce 2.5 is now available.</p>
<p>RC means we <em>think</em> we’re done, but with thousands of users and hundreds of plugins and themes with WooCommerce support, it’s possible we’ve missed something. We hope to ship WooCommerce 2.5.0 on <strong>Monday, January 18</strong>, but we need your help to get there.</p>
<p>If you haven’t tested WC 2.5 yet, now is the time!</p>
<p>We&#8217;ve made <a href="https://github.com/woothemes/woocommerce/compare/2.5.0-beta-3...master">~100 changes</a> since release beta 3 three weeks ago. Mostly small fixes, including:</p>
<ul>
<li>Correcting Malaysian states.</li>
<li>Filtering non-images out of product image galleries.</li>
<li>Moved terms checkboxes logically before place order buttons.</li>
<li>Fixed sanitization of shipping tax class names.</li>
<li>Tweaked save logic for variable products.</li>
<li>Correctly hide attributes from quick edit.</li>
<li>Fixed some wc_var_price transient issues.</li>
</ul>
<p><strong>Think you’ve found a bug?</strong> Please post in detail to <a href="https://github.com/woothemes/woocommerce/issues/new">Github</a>.</p>
<p>To test WooCommerce 2.5 RC1, you can use our <a href="https://wordpress.org/plugins/woocommerce-beta-tester/">WooCommerce Beta Tester plugin</a> or you can <a href="https://github.com/woothemes/woocommerce/releases/download/2.5.0-RC1/woocommerce.zip">download the release candidate here</a> (zip).</p>
<p>For more information about what’s new in 2.5, check out <a href="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/">Beta 1</a>,<a href="https://woocommerce.wordpress.com/2015/12/04/woocommerce-2-5-beta-2/"> beta 2</a> and <a href="https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/">beta 3</a> blog posts.</p>
<p><strong>Developers</strong>, please test your plugins and themes against WooCommerce 2.5 before next week. If you find compatibility problems, we never want to break things, so please be sure to <a href="https://github.com/woothemes/woocommerce/issues/new">post to Github</a> so we can figure those out before the final release.</p>
<p><strong>Translators</strong>, it is important than we translate 100% of the WooCommerce 2.5 strings so translations are downloaded automatically on update. Your help is most welcome! See more in <a href="https://woocommerce.wordpress.com/2015/12/10/time-to-start-translating-woocommerce-2-5/">Time to start translating WooCommerce 2.5</a>.</p>
]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2016/01/05/woocommerce-2-5-release-candidate/feed/</wfw:commentRss>
		<slash:comments>9</slash:comments>
	
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>
	</item>
		<item>
		<title>WooCommerce 2.5 &#8211; The force is strong with Beta 3</title>
		<link>https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/</link>
		<comments>https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/#comments</comments>
		<pubDate>Thu, 17 Dec 2015 13:27:17 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[beta]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=740</guid>
		<description><![CDATA[Today we tagged WooCommerce 2.5 Beta 3. Now you can witness the power of this fully operational beta. Download it here. If you missed our posts about previous beta releases, you can read about 2.5 Beta 1 here and beta 2 here. Thank the maker! Changes since beta 2 Here are our changes since beta 2: Refactored<a class="more-link" href="https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>Today we tagged WooCommerce 2.5 Beta 3. Now you can witness the power of this fully <em>operational</em> beta.</p>
<p style="text-align:center;"><a class="button" href="https://github.com/woothemes/woocommerce/releases/download/2.5.0-beta-3/woocommerce.zip">Download it here.</a></p>
<div id="v-MyvocsiH-1" class="video-player" style="width:612px;height:336px">
<embed id="v-MyvocsiH-1-video" src="https://v0.wordpress.com/player.swf?v=1.04&amp;guid=MyvocsiH&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="612" height="336" title="intro" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>
<p>If you missed our posts about previous beta releases, you can read about <a href="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/">2.5 Beta 1 here</a> and<a href="https://woocommerce.wordpress.com/2015/12/04/woocommerce-2-5-beta-2/"> beta 2 here</a>. Thank the maker!</p>
<h2>Changes since beta 2</h2>
<p>Here are our changes since beta 2:</p>
<ul>
<li>Refactored our add-ons screen so it can be extended by add-ons.</li>
<li>Made some small changes to widgets API to be extended by add-ons.</li>
<li>Added a get_id() method for products.</li>
<li>Fixed some conflicts with PHP7.</li>
<li>Additional hooks for order line items.</li>
<li>Round discount totals to avoid issues with floats.</li>
<li>Various API and CLI tweaks/improvements.</li>
<li>Improved the usefulness of the wc_get_template_part filter.</li>
<li>Fixed some currency code.</li>
</ul>
<p><a href="https://github.com/woothemes/woocommerce/pull/9797">We also made a decision</a> to remove the &#8216;dropdown&#8217; view of shipping options in the cart. This was so we could have a hook after each shipping method to add additional options or text if an addon wanted to display something there. Dropdowns restrict this ability and would mean maintaining two completely different sets of code to cater for each.</p>
<p>You can see the full list of <a href="https://github.com/woothemes/woocommerce/compare/2.5.0-beta-2...2.5.0-beta-3">commits since beta 2 here</a>.</p>
<h2>Final call for testers</h2>
<p>What? You haven&#8217;t tested beta yet? I find your lack of faith disturbing.</p>
<p>Everything is proceeding as we have foreseen, so the Release Candidate is still planned for <strong>Jan 4th–8th 2016</strong> so long as we <em>stay on target</em>. Developers please test your code before then. Try not. Do. Or do not. There is no try.</p>
<p>We also welcome user tests, but we recommend using a development site, since there may be undiscovered bugs.</p>
<p><a href="https://woocommerce.wordpress.com/2015/07/25/how-to-beta-test-woocommerce/">We have a beta testing plugin to make obtaining the beta release and staying updated simple.</a> We suggest grabbing that if you would like to be involved.</p>
<p><a href="https://github.com/woothemes/woocommerce/issues">Please raise any issues found on Github</a> with a [2.5] issue title prefix so we see them right away. We would be <span class="s1">honoured </span><span style="line-height:1.7;">if you would join us!</span></p>
<p><img data-attachment-id="842" data-permalink="https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/team/" data-orig-file="https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=612" data-orig-size="1150,752" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;1&quot;}" data-image-title="team" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=612?w=300" data-large-file="https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=612?w=612" class="alignnone size-full wp-image-842" src="https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=612" alt="team.jpg" srcset="https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=612 612w, https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=150 150w, https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=300 300w, https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=768 768w, https://woocommerce.files.wordpress.com/2015/12/team.jpg?w=1024 1024w, https://woocommerce.files.wordpress.com/2015/12/team.jpg 1150w" sizes="(max-width: 612px) 100vw, 612px"   /></p>
<p>And of course, may the force be with you.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div><a href="https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/"><img alt="intro" src="https://videos.files.wordpress.com/MyvocsiH/intro_std.original.jpg" width="160" height="120" /></a></div>]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2015/12/17/woocommerce-2-5-the-force-is-strong-with-beta-3/feed/</wfw:commentRss>
		<slash:comments>6</slash:comments>
	<enclosure url="http://videos.files.wordpress.com/MyvocsiH/intro_hd.mp4" length="24268800" type="video/mp4" />

		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2015/12/team.jpg" medium="image">
			<media:title type="html">team.jpg</media:title>
		</media:content>

		<media:group>
			<media:content url="http://videos.files.wordpress.com/MyvocsiH/intro_hd.mp4" fileSize="24268800" type="video/mp4" medium="video" bitrate="3160" isDefault="true" duration="60" width="1280" height="704" />

			<media:content url="http://videos.files.wordpress.com/MyvocsiH/intro_dvd.mp4" fileSize="11735040" type="video/mp4" medium="video" bitrate="1528" isDefault="false" duration="60" width="640" height="352" />

			<media:content url="http://videos.files.wordpress.com/MyvocsiH/intro_std.mp4" fileSize="6113280" type="video/mp4" medium="video" bitrate="796" isDefault="false" duration="60" width="400" height="220" />

			<media:content url="http://videos.files.wordpress.com/MyvocsiH/intro_fmt1.ogv" fileSize="6113280" type="video/ogg" medium="video" bitrate="796" isDefault="false" duration="60" width="400" height="220" />

			<media:rating scheme="urn:mpaa">g</media:rating>
			<media:title type="plain">intro</media:title>
			<media:description type="plain">Made with http://www.starwars.com/games-apps/star-wars-crawl-creator</media:description>
			<media:thumbnail url="https://videos.files.wordpress.com/MyvocsiH/intro_std.original.jpg" width="256" height="140" />
			<media:player url="https://v0.wordpress.com/player.swf?v=1.04&#038;guid=MyvocsiH&#038;isDynamicSeeking=true" width="400" height="220" />
		</media:group>
	</item>
		<item>
		<title>WooCommerce 2.5 Beta 1</title>
		<link>https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/</link>
		<comments>https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/#comments</comments>
		<pubDate>Mon, 09 Nov 2015 14:55:48 +0000</pubDate>
		<dc:creator><![CDATA[Mike Jolley]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=441</guid>
		<description><![CDATA[WC 2.5 codename “Dashing Dolphin” has been tagged for testing. This release has seen a short development cycle of ~3 months and comprises of ~1000 commits from 21 contributors. You can download beta 1 here. Release Highlights 2.5 mostly contains enhancements to existing functionality, but we have added some new features which developers will appreciate such as WP CLI support! The<a class="more-link" href="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p>WC 2.5 codename “Dashing Dolphin” has been <a href="https://github.com/woothemes/woocommerce/releases/tag/2.5.0-beta-1">tagged for testing</a>. This release has seen a short development cycle of ~3 months and comprises of ~1000 commits from 21 contributors.</p>
<p><a href="https://github.com/woothemes/woocommerce/archive/2.5.0-beta-1.zip">You can download beta 1 here.</a></p>
<h2>Release Highlights</h2>
<p>2.5 mostly contains enhancements to existing functionality, but we have added some new features which developers will appreciate such as <a href="https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/">WP CLI support</a>!</p>
<p>The <strong>WooCommerce CLI</strong> (command line interface) lets you perform many actions on your store via the command line, <span class="s1">such as creating customers and coupons</span>. This should be useful for power users.</p>
<figure data-shortcode="caption" id="attachment_391" style="max-width: 622px" class="wp-caption alignnone"><img data-attachment-id="391" data-permalink="https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/woocommerce-wp-cli-demo/" data-orig-file="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif" data-orig-size="796,468" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="woocommerce-wp-cli-demo" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=300" data-large-file="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=612" class="alignnone size-large wp-image-391" src="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=612&#038;h=360" alt="woocommerce-wp-cli-demo"   /><figcaption class="wp-caption-text">WooCommerce CLI in action</figcaption></figure>
<p><a href="https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/">The post here has more details on the CLI.</a></p>
<p>The <strong>WooCommerce REST API</strong> has been further enhanced with some new endpoints:</p>
<ul>
<li>/products/shipping_classes to update product shipping classes.</li>
<li>POST, PUT, and DELETE for product categories and tags.</li>
<li>Added support to filter products by tag, category, shipping class, and attribute.</li>
<li>Added tax and tax_class endpoints for setting tax rates.</li>
</ul>
<p>The <a href="https://woothemes.github.io/woocommerce-rest-api-docs/">REST API documentation</a> will be updated with this new endpoints soon.</p>
<p>For performance and scalability reasons we&#8217;re introducing a <strong>new session handler</strong> which uses custom tables, rather than the WordPress options table. <a href="https://woocommerce.wordpress.com/2015/10/07/new-session-handler-in-2-5/">You can read more about this feature here.</a></p>
<p>Also related to performance, we&#8217;ve improved the way in which <strong>verified reviews</strong> are stored and retrieved, and we&#8217;ve improved <strong>backend searches</strong>.</p>
<p>Some admin screens have been tweaked; most notably the <strong>tax settings screen</strong> which is now ajax enhanced/faster and supports search.</p>
<figure data-shortcode="caption" id="attachment_541" style="max-width: 622px" class="wp-caption alignnone"><img data-attachment-id="541" data-permalink="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/2015-11-04-at-14-28/" data-orig-file="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png" data-orig-size="1288,372" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2015-11-04 at 14.28" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=300" data-large-file="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=612" class="alignnone size-large wp-image-541" src="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=612&#038;h=177" alt="2015-11-04 at 14.28.png" srcset="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=612&amp;h=177 612w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=1224&amp;h=354 1224w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=150&amp;h=43 150w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=300&amp;h=87 300w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=768&amp;h=222 768w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=1024&amp;h=296 1024w" sizes="(max-width: 612px) 100vw, 612px"   /><figcaption class="wp-caption-text">Ajax powered with inline search</figcaption></figure>
<p>The email settings screen has also been tweaked to remove the sub-navigation links in favour of a table.</p>
<figure data-shortcode="caption" id="attachment_544" style="max-width: 622px" class="wp-caption alignnone"><img data-attachment-id="544" data-permalink="https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/2015-11-04-at-14-29/" data-orig-file="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png" data-orig-size="1261,608" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2015-11-04 at 14.29" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=300" data-large-file="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=612" class="alignnone size-large wp-image-544" src="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=612&#038;h=295" alt="2015-11-04 at 14.29" srcset="https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=612&amp;h=295 612w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=1224&amp;h=590 1224w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=150&amp;h=72 150w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=300&amp;h=145 300w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=768&amp;h=370 768w, https://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=1024&amp;h=494 1024w" sizes="(max-width: 612px) 100vw, 612px"   /><figcaption class="wp-caption-text">Emails are shown in a neat table in 2.5</figcaption></figure>
<p>The checkout and order flows have also had some adjustment:</p>
<ul>
<li>When only 1 gateway is enabled, the radio buttons will be hidden.</li>
<li>We now only display the coupon form on the checkout if a coupon hasn&#8217;t yet been applied.</li>
<li>We have added a handy &#8216;pay&#8217; link to the order screen which you can send to customers.</li>
<li>We have added the <strong>terms and conditions</strong> checkbox to the pay page, which was previously only shown on checkout.</li>
<li>Password strength indicators are now displayed on checkout when creating an account.</li>
<li>If payment fails, admin will receive an email.</li>
<li>When a WordPress user is deleted, their orders turn into guest orders.</li>
<li>When calculating order taxes, tax settings are respected and default to the base country.</li>
<li>Order notes are added to record manual email sends to customers.</li>
</ul>
<p>Other notable tweaks include:</p>
<ul>
<li>Variations are now generated in a logical order using a new wc_array_cartesian function.</li>
<li>Variations will fade in to avoid the initial &#8216;flicker&#8217; during page load.</li>
<li>Reports now show both net and gross averages.</li>
<li>The welcome screen is no more.</li>
</ul>
<p>You can see the full changelog in the readme file.</p>
<h2>Template changes</h2>
<p>For <strong>frontend</strong> <strong>templates</strong> we&#8217;ve changed some files to make templating more flexible:</p>
<ul>
<li>Product archive anchors are now hooked into templates rather than hard coded.</li>
<li>We&#8217;ve added template files for the customer details list in emails (emails/email-customer-details.php)</li>
<li>Revised single variation cart template. Template files now exist for variations, and the cart button will display (disabled) when no selections are made.</li>
<li>New star ratings. The old one was 5 separate buttons. This new one consolidates the 5 options into one element making it leaner visually and more intuitive. Works in IE9+ with a graceful degradation for IE8.</li>
</ul>
<p>The following template files have been version bumped in 2.5 and may require theme updates:</p>
<ol>
<li>single-product/review.php &#8211; Added new action hooks + verified reviewer code</li>
<li>single-product/add-to-cart/variable.php &#8211; Correctly escape variation data.</li>
<li>order/order-details.php &#8211; woocommerce_purchase_note_order_statuses filter.</li>
<li>order/order-details-item.php &#8211; woocommerce_purchase_note_order_statuses filter.</li>
<li>loop/add-to-cart.php &#8211; Uses supports_ajax_add_to_cart method.</li>
<li>global/quantity-input.php &#8211; Changed min and max attributes.</li>
<li>content-widget-product.php &#8211; File was missing version.</li>
<li>content-product.php &#8211; Action hooks to handle anchor output.</li>
<li>content-product_cat.php &#8211; Action hooks to handle anchor output.</li>
<li>checkout/payment.php &#8211; Support for new terms.php template file.</li>
<li>checkout/form-pay.php &#8211; Support for new terms.php template file.</li>
<li>cart/mini-cart.php &#8211; URL escaping.</li>
<li>cart/cart-shipping.php &#8211; Extra filters and some simplification of strings.</li>
</ol>
<p>The following template files are new in 2.5.0:</p>
<ol>
<li>single-product/add-to-cart/variation.php</li>
<li>single-product/add-to-cart/variation-add-to-cart-button.php</li>
<li>emails/email-customer-details.php</li>
<li>emails/plain/email-customer-details.php</li>
<li>emails/admin-failed-order.php</li>
<li>product-searchform.php</li>
<li>checkout/terms.php</li>
</ol>
<h2>Release Schedule</h2>
<p><strong>Beta 1</strong> is out today (Nov 9th) and the beta testing period will run through to the end of the year to avoid a release during the holiday season. Subsequent betas will be released as needed.</p>
<p>If all goes to plan, Release Candidate 1 will be tagged sometime between <strong>Jan 4th–8th 2016</strong>, with the final release dropping a week later.</p>
<h2>How to beta test</h2>
<p><a href="https://woocommerce.wordpress.com/2015/07/25/how-to-beta-test-woocommerce/">We posted a nice little write-up on beta testing here which should get you started.</a> Please read that and jump right in!</p>
]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2015/11/09/woocommerce-2-5-beta-1/feed/</wfw:commentRss>
		<slash:comments>22</slash:comments>
	
		<media:content url="http://0.gravatar.com/avatar/9b87f99f47e30735e1136c5141531fdf?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">mikejolley</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=796" medium="image">
			<media:title type="html">woocommerce-wp-cli-demo</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-28.png?w=1024" medium="image">
			<media:title type="html">2015-11-04 at 14.28.png</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2015/11/2015-11-04-at-14-29.png?w=1024" medium="image">
			<media:title type="html">2015-11-04 at 14.29</media:title>
		</media:content>
	</item>
		<item>
		<title>Sneak Peek: WP CLI Support in WooCommerce 2.5</title>
		<link>https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/</link>
		<comments>https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/#comments</comments>
		<pubDate>Thu, 01 Oct 2015 14:54:33 +0000</pubDate>
		<dc:creator><![CDATA[Akeda Bagus]]></dc:creator>
				<category><![CDATA[Core]]></category>
		<category><![CDATA[WooCommerce 2.5]]></category>

		<guid isPermaLink="false">http://woocommerce.wordpress.com/?p=376</guid>
		<description><![CDATA[WP CLI support is one of the features that&#8217;s included in WooCommerce 2.5 milestone. In case you haven&#8217;t heard WP-CLI: WP-CLI is a set of command-line tools for managing WordPress installations. You can update plugins, set up multisite installs and much more, without using a web browser. All WooCommerce related commands are grouped into wp<a class="more-link" href="https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/">&ellipsis;Read the full post &#187;</a>]]></description>
				<content:encoded><![CDATA[<p><a href="http://wp-cli.org/">WP CLI</a> support is one of the features that&#8217;s included in WooCommerce 2.5 milestone. In case you haven&#8217;t heard WP-CLI:</p>
<blockquote><p><strong>WP-CLI</strong> is a set of command-line tools for managing WordPress installations. You can update plugins, set up multisite installs and much more, without using a web browser.</p></blockquote>
<p>All WooCommerce related commands are grouped into <code>wp wc</code> command:</p>
<pre>$ wp wc
usage: wp wc coupon 
   or: wp wc customer 
   or: wp wc order 
   or: wp wc product 
   or: wp wc report 
   or: wp wc tool 

See 'wp help wc &lt;command&gt;' for more information on a specific command.
</pre>
<p>Currently, following commands are available:</p>
<ul>
<li><strong>Coupon</strong>
<pre>$ wp wc coupon
usage: wp wc coupon create [--&lt;field&gt;=&lt;value&gt;] [--porcelain]
   or: wp wc coupon delete &lt;id&gt;...
   or: wp wc coupon get [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc coupon list [--&lt;field&gt;=&lt;value&gt;] [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc coupon types
   or: wp wc coupon update &lt;coupon&gt; --&lt;field&gt;=&lt;value&gt;

See 'wp help wc coupon &lt;command&gt;' for more information on a specific command.</pre>
</li>
<li><strong>Customer</strong>
<pre>$ wp wc customer
usage: wp wc customer create [--&lt;field&gt;=&lt;value&gt;] [--porcelain]
   or: wp wc customer delete &lt;customer&gt;...
   or: wp wc customer downloads [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc customer get [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc customer list [--&lt;field&gt;=&lt;value&gt;] [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc customer orders [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc customer update &lt;customer&gt; --&lt;field&gt;=&lt;value&gt;

See 'wp help wc customer &lt;command&gt;' for more information on a specific command.
</pre>
</li>
<li><strong>Order</strong>
<pre>$ wp wc order
usage: wp wc order create [--&lt;field&gt;=&lt;value&gt;] [--porcelain]
   or: wp wc order delete
   or: wp wc order get [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc order list [--&lt;field&gt;=&lt;value&gt;] [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc order update &lt;id&gt; --&lt;field&gt;=&lt;value&gt;

See 'wp help wc order &lt;command&gt;' for more information on a specific command.
</pre>
</li>
<li><strong>Product</strong>
<pre>$ wp wc product
usage: wp wc product category 
   or: wp wc product create [--&lt;field&gt;=&lt;value&gt;] [--porcelain]
   or: wp wc product delete &lt;id&gt;...
   or: wp wc product get [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc product list [--&lt;field&gt;=&lt;value&gt;] [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc product reviews [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;]
   or: wp wc product types
   or: wp wc product update &lt;id&gt; --&lt;field&gt;=&lt;value&gt;

See 'wp help wc product &lt;command&gt;' for more information on a specific command.
</pre>
</li>
<li><strong>Report</strong>
<pre>$ wp wc report
usage: wp wc report list [--format=&lt;format&gt;]
   or: wp wc report sales [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;] [--period=&lt;period&gt;] [--date_min] [--date_max] [--limit]
   or: wp wc report top_sellers [--&lt;field&gt;=&lt;value&gt;] [--field=&lt;field&gt;] [--fields=&lt;fields&gt;] [--format=&lt;format&gt;] [--period=&lt;period&gt;] [--date_min] [--date_max] [--limit]

See 'wp help wc report &lt;command&gt;' for more information on a specific command.
</pre>
</li>
<li><strong>Tool</strong>
<pre>$ wp wc tool
usage: wp wc tool clear_transients

See 'wp help wc tool &lt;command&gt;' for more information on a specific command.
</pre>
</li>
</ul>
<p>Here&#8217;s the demo of WooCommerce CLI in action:</p>
<p><a href="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif"><img data-attachment-id="391" data-permalink="https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/woocommerce-wp-cli-demo/" data-orig-file="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=612" data-orig-size="796,468" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="woocommerce-wp-cli-demo" data-image-description="" data-medium-file="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=612?w=300" data-large-file="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=612?w=612" class="alignnone wp-image-391 size-full" src="https://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif?w=612" alt="woocommerce-wp-cli-demo"   /></a></p>
<p>In case a command is not obvious to you, appending <code>--help</code> should give you more information about the command.</p>
<p>This feature is available in master branch. If you find the feature is useful in the next release, we encourage you to checkout the branch, test it, and report any issues to our <a href="https://github.com/woothemes/woocommerce/issues">GitHub&#8217;s issues tracker</a>.</p>
]]></content:encoded>
			<wfw:commentRss>https://woocommerce.wordpress.com/2015/10/01/sneak-peek-wp-cli-support-in-woocommerce/feed/</wfw:commentRss>
		<slash:comments>7</slash:comments>
	
		<media:content url="http://1.gravatar.com/avatar/afcb5e74963880eb3deb35b8cd4c1645?s=96&#38;d=monsterid&#38;r=G" medium="image">
			<media:title type="html">akedabagusjs</media:title>
		</media:content>

		<media:content url="http://woocommerce.files.wordpress.com/2015/10/woocommerce-wp-cli-demo.gif" medium="image">
			<media:title type="html">woocommerce-wp-cli-demo</media:title>
		</media:content>
	</item>
	</channel>
</rss>