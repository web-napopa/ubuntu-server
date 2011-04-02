#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./utils.sh

# basic GUI which DOESN'T run automatically, started by executing "startx" command (remove next line if you dont want any GUI)
install_apt fluxbox xinit thunar thunar-archive-plugin mrxvt python-software-properties mousepad

# lib for rebuilding kernel (used when ubuntu is installed as virtual machine)
install_apt dkms

#versioning
install_apt git subversion bzr 

#archive
install_apt unrar unzip

#image editing
install_apt imagemagick 

#font editing
install_apt fontforge fontforge-extras potrace fontforge-doc python-fontforge

#url handling
install_apt curl 

#web server
install_apt apache2 php5 libapache2-mod-php5 php5-cli mysql-server mysql-client libapache2-mod-auth-mysql php5-mysql php-pear php5-curl php5-gd php5-idn php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-tidy php5-xmlrpc php5-xsl php5-xdebug

#enable mod_rewrite
sudo a2enmod rewrite
restart_apache

#phpmyadmin
install_apt phpmyadmin

#phpmyadmin is now accesible through http://localhost/phpmyadmin
make_shortcut "/usr/share/phpmyadmin/" "/var/www/phpmyadmin"

#install firephp
sudo pear channel-discover pear.firephp.org
sudo pear install firephp/FirePHPCore 

#install symfony
sudo pear upgrade PEAR
sudo pear channel-discover pear.symfony-project.com
sudo pear install symfony/symfony

#removal
remove_apt plymouth-theme-xubuntu-logo
remove_apt plymouth-theme-ubuntu-logo
remove_apt plymouth-theme-ubuntu-text
remove_apt plymouth-label
remove_apt libxfce4util-bin xfce4-panel


#### SERVER SETTINGS ###
replace_ini_entry --file "/etc/apache2/apache2.conf" --search-raw "ServerName" --replacement-raw "ServerName 127.0.0.1" --replacement-escaped "ServerName 127\.0\.0\.1"
# no limit:
# memory_limit = -1"
phpIniFilePath="/etc/php5/apache2/php.ini"
replace_ini_entry --file "$phpIniFilePath" --search-raw "error_reporting" --replacement-raw "error_reporting = E_ALL | E_STRICT "
replace_ini_entry --file "$phpIniFilePath" --search-raw "memory_limit" --replacement-raw "memory_limit = 128M"
replace_ini_entry --file "$phpIniFilePath" --search-raw "html_errors" --replacement-raw "html_errors = On"
replace_ini_entry --file "$phpIniFilePath" --search-raw "magic_quotes_gpc" --replacement-raw"magic_quotes_gpc = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "magic_quotes_runtime" --replacement-raw "magic_quotes_runtime = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "magic_quotes_sybase" --replacement-raw "magic_quotes_sybase = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "upload_max_filesize" --replacement-raw "upload_max_filesize = 200M"
replace_ini_entry --file "$phpIniFilePath" --search-raw "max_input_time" --replacement-raw "max_input_time = 180"
replace_ini_entry --file "$phpIniFilePath" --search-raw "post_max_size" --replacement-raw "post_max_size = 200M"
replace_ini_entry --file "$phpIniFilePath" --search-raw "max_execution_time" --replacement-raw "max_execution_time = 180"
replace_ini_entry --file "$phpIniFilePath" --search-raw "max_file_uploads" --replacement-raw "max_file_uploads = 50"
replace_ini_entry --file "$phpIniFilePath" --search-raw "display_errors" --replacement-raw "display_errors = On"
replace_ini_entry --file "$phpIniFilePath" --search-raw "short_open_tag" --replacement-raw "short_open_tag = On"
replace_ini_entry --file "$phpIniFilePath" --search-raw "register_globals" --replacement-raw "register_globals = Off"
replace_ini_entry --file "$phpIniFilePath" --search-raw "error_reporting" --replacement-raw "error_reporting = E_ALL | E_STRICT "
# fix ini comments
fix_ini_file_comments "/etc/php5/cli/conf.d/ming.ini"