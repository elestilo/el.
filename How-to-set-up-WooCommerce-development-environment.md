If you're running the development version of WooCommerce hosted on GitHub, there are a few extra steps required to get your environment ready, and some commands you need to run in order to get WooCommerce core files built. 

WooCommerce core uses [NPM](https://www.npmjs.com/) and [Grunt](https://gruntjs.com/) for build tasks, and [Composer](https://getcomposer.org/) for installing packages and dependencies.

## Start Development

1. Make sure you have `git`, `node`, `npm`, and a working WordPress installation ([we suggest using VVV](#Using-VVV-optional)).
2. Clone this repository inside your Plugins directory.
	```sh
	$ git clone git@github.com:woocommerce/woocommerce.git
	$ cd woocommerce
	```
    
3. [Install Composer](#installing-composer).
4. Install dependencies:
	```sh
	$ npm install
	$ composer install
	```
    
## Tools

WooCommerce core has linting rules in place via pre-commit hooks to ensure code standards are used. Ensure you have installed composer so these are set up!

Whilst developing we recommend adding support to your editor for the following (most IDEs have plugins for this):

- phpcs ([VS Studio Code extension](https://marketplace.visualstudio.com/items?itemName=ikappas.phpcs))
- editorconfig ([VS Studio Code extension](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig))
 
## Installing Composer

WooCommerce includes a number of packages such as the `woocommerce-rest-api` and the `jetpack-autoloader` and to use these packages you need Composer, the PHP package manager.

It's also necessary to use the PHP CodeSniffer that ensures your code follows code standards. 

### Installing Composer on macOS

Composer can be installed using [Homebrew](https://brew.sh/). If you don't have Homebrew, install it with

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

And then install Composer:

```sh
$ brew install composer
```

### Installing Composer on other systems

We recommend visiting the [official Composer download instructions](https://getcomposer.org/download/) to install composer on other operating systems. 

Most Linux distributions may have an older version of Composer as an installable package, but installing from the official source ensures you have the most up to date version.
Note that [we recommend using the Windows Subsystem for Linux](#developing-and-contributing-code-to-jetpack-from-a-windows-machine) to run Composer and PHP.

## Using VVV (optional)

[VVV is local developer environment, mainly aimed at WordPress developers. It uses Vagrant and VirtualBox, and can be used to build sites and contribute to WordPress.](https://github.com/Varying-Vagrant-Vagrants/VVV)

1. Install [VirtualBox](https://www.virtualbox.org/)
2. Install [vagrant](https://www.vagrantup.com/)
3. Install [VVV 3](https://varyingvagrantvagrants.org/docs/en-US/installation/)
4. Provision a new machine (`vagrant up`), allow installation of local plugins (vagrant-hostsupdater)
9. Clone woocommerce repo to `/wp-content/plugins`, i.e on the local machine. 
    ```sh
    $ cd vagrant-local/www/wordpress-one/public_html/wp-content/plugins
    $ git clone https://github.com/woocommerce/woocommerce.git
    ```
    
6. Activate WooCommerce on the Vagrant site (e.g. via WP admin)

### Running unit tests in VVV

Unit tests are ran using [phpunit](https://packagist.org/packages/phpunit/phpunit). We install this as one of our Composer dependencies, so if you've followed the steps above, the following should work for you. 

1. Log into the Vagrant virtual machine from vagrant-local directory
    ```sh
    $ vagrant ssh
    ```
    
2. In the Vagrant VM, go to the WooCommerce directory. If you've not yet installed composer, do so now.
    ```sh
    $ cd /srv/www/wordpress-local/public_html/wp-content/plugins/woocommerce
    $ composer install
    ```
    
3. You can now run unit tests using the following command:
    ```sh
    $ ./vendor/bin/phpunit
    ```
    
7. It should finish with something like:
    > Time: 2.5 minutes, Memory: 84.25MB
    >
    > OK (1404 tests, 5226 assertions)

### Activate Xdebug in VVV

Running `xdbug_on` inside Vagrant seems to be broken for me as of 2019-05-14, so here are manual steps:

1. Copy and paste output from [phpinfo()](http://vvv.test/phpinfo/) to [Xdebug wizard](https://xdebug.org/wizard.php), analyze and check step about editing the php.ini file (step 9 in my case).
2. Check if `/usr/lib/php/*/xdebug.so` is present in the VM (it should be):
    ```sh
    $ ls /usr/lib/php/20170718/xdebug.so
    ```
    
4. Update `/etc/php/*/fpm/php.ini` inside the Vagrant VM according to instructions from the Xdebug wizard website.
    ```sh
    $ sudo tee -a /etc/php/7.2/fpm/php.ini >/dev/null <<'EOF'
    [xdebug]
    zend_extension = /usr/lib/php/20170718/xdebug.so

    EOF
    ```
    
6. Restart php service
    ```sh
    $ sudo service php7.2-fpm restart
    ```
8. Check [phpinfo()](http://vvv.test/phpinfo/)--it should contain a new section for Xdebug

### Email setup in VVV
1. Standard mailhog catching all emails going out of virtual machine is available at http://vvv.test:8025/.
2. If you want to relay emails via the gmail SMTP server, follow the steps below:

#### Setting up Gmail SMTP server

1. Create a new gmail account and [allow access for less secure apps](https://support.google.com/accounts/answer/6010255?hl=en)

All of the below steps should be performed in the Vagrant VM:

2. Edit `/etc/php/7.2/fpm/conf.d/20-mailhog.ini` and replace existing sendmail path with `sendmail_path = "/usr/sbin/sendmail -t -i"`
3. Update mail config: `sudo nano /etc/postfix/main.cf` and replace the `relayhost =` line with these:
    
    > relayhost = [smtp.gmail.com]:587
    > smtp_sasl_auth_enable = yes
    > smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    > smtp_sasl_security_options = noanonymous
    > smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
    > smtp_use_tls = yes
    
4. `sudo nano /etc/postfix/sasl_passwd` and add this line:
    
    > [smtp.gmail.com]:587 username@gmail.com:password
    
5. Fix access, apply settings.
    ```bash=
    sudo chmod 400 /etc/postfix/sasl_passwd
    sudo postmap /etc/postfix/sasl_passwd
    sudo /etc/init.d/postfix reload
    ```
6. Test that everything works by creating a new WP account and then using the `Lost your password?` link on http://one.wordpress.test/wp-login.php or, on a more low-level by running the following command from the Vagrant VM 
    ```bash=
    echo "Subject: test" | /usr/lib/sendmail -v dest@email.com
    ```
7. If you don't receive the message, inspect the mail log:
    ```bash=
    tail -n 30 /var/log/mail.log
    ```
8. Don't forget to install [Stop emails](https://wordpress.org/plugins/stop-emails/) if you plan to generate products and orders using [WC Smooth Generator](https://github.com/woocommerce/wc-smooth-generator)

### Setting up a project in PHPStorm
1. Create a new WordPress project, I prefer to point it at the root WP folder to enable debugging through the WordPress code as well. 
2. PHPStorm should ask if you want to create project from existing sources.
3. Go to Preferences: Tools > Vagrant--set up instance folder and box.
4. You can set up vagrant instance also in the Tools > SSH Terminal section.
5. Preferences:  Language > PHP and set up remote PHP executable and language level.
7. Preferences:  Language > PHP > Servers and set host to current host (one.wordpress.test), check Use path mappings and set up the path mapping.
8. Preferences:  Language > PHP > Frameworks and enable WP integration.
9. Preferences:  Language > PHP > Debug and click on blue Validate link, set up correct server path and click on Validate button.
10. Update php.ini according to instructions (in the VM).
    ```sh
    $ sudo tee -a /etc/php/7.2/fpm/php.ini >/dev/null <<'EOF'
    xdebug.remote_host='192.168.50.1'
    xdebug.remote_enable=1

    EOF
    $ sudo service php7.2-fpm restart
    ```
    
10. Preferences: Version Control and add WooCommerce directory as a VCS root.
11. Optionally, [create a new GH token](https://github.com/settings/tokens) and add it under Preferences: Version Control > GitHub to allow pushing to GH.
13. To make **debugging** work, you might want to disable profiling tool Tideways which prepends a php file to each file that runs using php.ini's [auto prepend file](https://www.php.net/manual/en/ini.core.php#ini.auto-prepend-file) directive. To remove the auto-prepend, you can use the following updates to ini files:
    ```sh
    $ sudo tee /etc/php/7.2/fpm/conf.d/20-xhgui.ini >/dev/null <<'EOF'
    ; auto_prepend_file=/srv/tideways-header.php
    EOF

    $ sudo tee /etc/php/7.2/fpm/conf.d/20-tideways_xhprof.ini >/dev/null <<'EOF'
    ; extension=tideways_xhprof.so
    EOF

    $ sudo service php7.2-fpm restart
    ```
14. Alternatively, you can copy the tideways PHP file over to your local machine and map it in the path mappings for PHPDebug (confirmed to work by Rodrigo).