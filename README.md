# aanton/dotfiles

My dotfiles & tools that i usually use in 🐧 Ubuntu 18.04.

Inspired by:
* https://github.com/victoriadrake/dotfiles
* https://github.com/alrra/dotfiles

## 👉 Requirements

* Install ZSH & set it as the default shell
  * Logout & login are required !
  * Verify that ZSH is the default shell

```bash
sudo apt install zsh
chsh -s "$(which zsh)"
gnome-session-quit # logout

echo $SHELL
```

## 🖱 Usage

Before running these scripts, you should review them & modify them according to your needs.

```bash
# Create symlinks
./create_symlinks.sh

# Create local configuration files
./create_local_configs.sh

# Install tools
./install_tools.sh

# Install fonts
./install_fonts.sh

# Continue only if installing in desktop environments ...

# Install desktop tools
./install_desktop_tools.sh
```

## ✏️ ToDo

* Install vscode plugins
* Install Z
* Install php & extensions
* Install composer
* Install MySQL Workbench
* Install node
* Install node packaged: surge
* Install Google Chrome
* Add `.profile`
* Add `.vimrc`
* Add `.curlrc`
* Configure desktop: gnome settings
* Log messages with colors & emojis
