# Yiimp Install Script

Official Yiimp repository (used by this install script):
[https://github.com/tpruvot/yiimp](https://github.com/tpruvot/yiimp)

---

## Yiimp Installation Script for Ubuntu Server

⚠️ USE THIS SCRIPT ONLY WITH A NEW CLEAN INSTALLATION OF UBUNTU SERVER 22.04 ⚠️

---

## Installation Steps

Connect to your VPS and run the following commands:

```bash
apt update
apt upgrade
reboot
```

After reboot:

```bash
adduser pool # "pool" is just an example username
adduser pool sudo
su - pool
sudo apt -y install git
git clone https://github.com/sikkienl/yiimp_install_script.git
cd yiimp_install_script
bash install.sh
```

❗ **DO NOT run the script as `root` or with `sudo`.**

At the end of the installation, you **MUST reboot** to finalize setup.

---

## Accessing Yiimp

* Website:
  `http://xxx.xxx.xxx.xxx` or `https://xxx.xxx.xxx.xxx` (if Let's Encrypt SSL was enabled)

* Website:
  `http://xxx.xxx.xxx.xxx/site/myadmin` or `https://xxx.xxx.xxx.xxx/site/myadmin`

Enjoy your Yiimp pool!

---

## Troubleshooting

If you encounter issues after installation (for example: nginx or mariadb not found), run:

```bash
bash install-debug.sh
```

⚠️ Watch the log output carefully during installation.

---

## Required Configuration (IMPORTANT)

###### :bangbang: **YOU MUST UPDATE THE FOLLOWING FILES**

### 1. `/var/web/serverconfig.php`

* Set your **public personal IP** (not your VPS IP)

  ```php
  define('YAAMP_ADMIN_IP', 'YOUR_PERSONAL_IP');
  ```
* Update exchange public keys
* Customize server-specific settings

### 2. `/etc/yiimp/keys.php`

* Add/update secret API keys from exchanges (optional)

### 3. Change Admin Panel URL (Optional)

If you want to rename `AdminPanel`:

Edit:

```
/var/web/yaamp/modules/site/SiteController.php
```

Change **line 11** from:

```php
AdminPanel
```

to your preferred name.

---

## Important Notes

* Configuring Yiimp and coins requires basic Linux knowledge (and many beers 🍺).
* Your MySQL credentials (username/password) are stored in:

  ```
  ~/.my.cnf
  ```

---

## Interactive Installer Questions

During installation, the script will ask for:

* Server name
  *(No `http://` or `www`)*
  Examples:

  * `crypto.com`
  * `pool.crypto.com`
  * `80.41.52.63`

* Are you using a subdomain (e.g. `mypoolx11.crypto.com`)

* Support email address

* Enable stratum AutoExchange

* Public IP for admin access (**your personal IP, not VPS IP**)

* Install Fail2Ban

* Install UFW and configure firewall ports

* Install Let's Encrypt SSL

---

## Post-Installation Notes

This install script will get you **about 95% ready** to run Yiimp.

While some basic security is included, **it is the server owner’s responsibility** to properly secure the server. After installation you should:

* Review and customize `serverconfig.php`
* Add your exchange API keys
* Add and configure coins via the Yiimp control panel

Several wallets are already present by default. These come from the Yiimp database import and are **not related to this install script**.

