This page lists a few extra VVV configurations that can be useful in some scenarios. For example, how to set up a new project in PHPStorm for WooCommerce with Vagrant integration.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**

- [Activate Xdebug in VVV](#activate-xdebug-in-vvv)
- [Email setup in VVV](#email-setup-in-vvv)
  - [Setting up Gmail SMTP server](#setting-up-gmail-smtp-server)
- [Setting up a project in PHPStorm](#setting-up-a-project-in-phpstorm)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

### Activate Xdebug in VVV

Running `xdebug_on` inside Vagrant seems to be broken for me (Peter) as of 2019-05-14, so here are manual steps:

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
