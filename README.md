# ubuntu-bash-provisioner

A Bash-based provisioning script that automates the setup of a fresh Ubuntu Server. This script configures system users, SSH security settings, installs Docker, sets up OpenVPN, and prepares the server for production or development use.

---

## ✨ Features

- Creates initial system users with optional password and home directory
- Customizes SSH configuration (e.g., port, user access)
- Installs and configures Docker
- Adds specified users to the `docker` group
- Automatically sets up crontab jobs
- Applies basic security and convenience configurations
- Uses a YAML file for simple configuration

---

## 📁 Example Configuration (config.yaml)

```yaml
initial_user:
  name: usr1

tech_user:
  name: techuser
  password: yes
  home: yes

connect_user:
  name: sshuser
  password: no
  home: yes

ssh_settings:
  port: 6090
```

> ✅ All users will be created according to the above structure. SSH will be configured to use the specified port.

---

## ⚙️ Installation

You can use this script to provision a fresh Ubuntu Server or build a VM template for future deployments.

### Steps:

1. **Prepare the Script Package**
   - Replace placeholder/dummy files in the `/repo` directory with your actual config files.
   - Run `build.sh` to create a compressed installation archive.

2. **Transfer to Server**
   - Copy the generated archive (`ubuntu_init.tar.gz`) to your new Ubuntu server, preferably using `rsync`:
     ```bash
     rsync ubuntu_init.tar.gz root@your-server:/root
     ```

3. **Unpack the Archive**
   - SSH into your server and extract the archive:
     ```bash
     cd /root
     tar -xzvf ubuntu_init.tar.gz
     ```

4. **Run the Installer**
   - Launch the installation script:
     ```bash
     ./install.sh
     ```
5. **Reboot the server**

   - Script will start it's job with the next boot 

---

## 🧰 Requirements

- Ubuntu Server 20.04 or newer
- Root privileges for setup
- Internet connection for installing packages (Docker, etc.)

---

## 📁 Project Structure

```
ubuntu-bash-provisioner/
├── build.sh
├── install.sh
├── ubuntu_init.sh
├── config.yaml
├── repo/
│   └── [your custom files]
```

---

## 📜 License

MIT License — feel free to use, modify, and adapt for your own infrastructure.

---

## 🛠 Author

**[Sławomir Kaczmarek]** [github](https://github.com/skaczmarek-dev) — DevOps enthusiast, automation fan, and Linux tinkerer.

> If you find this project useful or have suggestions, feel free to contribute or open an issue!