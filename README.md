
# LinuxFresh 🍃

A comprehensive Bash script to automate the maintenance of Debian-based Linux systems. This tool ensures your environment is always up to date, upgraded, and free of unnecessary package clutter.

## 🔍 Features
* **Complete Update**: Synchronizes package indexes with the latest repository data.
* **Smart Upgrade**: Performs a `full-upgrade` to handle complex dependency changes.
* **System Cleanup**: Automatically removes obsolete packages and clears the local cache to save disk space.
* **DFIR Ready**: Perfect for keeping forensic VMs and CTF environments stable and up-to-date.


## 🚀 Usage

### 1. Clone the repository
```bash
git clone [https://github.com/RedHackJo/LinuxFresh.git](https://github.com/RedHackJo/LinuxFresh.git)

cd LinuxFresh

```

### 2. Set Permissions

Make the script executable:

```bash
chmod +x refresh.sh

```

### 3. Run the Maintenance

The script requires root privileges to manage system packages:

```bash
sudo ./refresh.sh

```

---

## 🛠️ Technical Details

The script utilizes both `apt upgrade` and `apt full-upgrade`. While a standard upgrade only installs newer versions of existing packages, a **full-upgrade** is more robust—it can remove packages if necessary to resolve dependency issues and perform a complete system refresh.

## 🛡️ Disclaimer

*Always ensure you have a backup of critical data before performing a full system upgrade, especially on production environments.*

Thanks for using LinuxFresh 🍃
