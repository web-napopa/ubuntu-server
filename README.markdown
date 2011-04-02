# web.napopa.com's Ubuntu Server
It is a script that should be run after you install Ubuntu from the [minimal disk](https://help.ubuntu.com/community/Installation/MinimalCD "Ubuntu Minimal CD Image") or otherwise called **Ubuntu network install**.

## Script's results
**Ubuntu** = **Apache** + **PHP** + **MySQL** + **PHPMyAdmin** + **Symfony** + **X-Debug** + **FirePHP**

### Other applied OS changes
* Apache **rewrite module** is enabled
* Ensure PHP settings (php.ini):
  * Magic quotes Closed are turned off
  * Increases file upload limits
  * Increase memory limit
  * Display errors (even strict)
  * Enable X-Debug HTML error display
  * Globals are turned off

* A font editing program is installed - **Font Forge**
* An image editing program is installed - **ImageMagick** and the middleware to work with PHP
* Installs a minimal GUI shell which **doesn't** start automatically with the system ( execute `startx` if you ever need it). Useful for launching **Font Forge**
* Support versioning with **Subversion**, **Git** and **Bazaar-NG**
* Support **zip**, **rar** archives
* Remove unnecessary packages



## Usage

After you download it run:
	cd ubuntu-server
	chmod +x ./min.sh
	sudo ./min.sh

**Don't forget the sudo**.