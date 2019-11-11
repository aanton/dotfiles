# aanton/dotfiles

Scripts to install the dotfiles & tools that i use in 🐧 Linux machines.

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
gnome-session-quit # logout (for Gnome environments)

echo $SHELL
```

## 🖱 Usage

Before running these scripts, you should review them & modify them according to your needs.

The scripts behaviours can be changed with these environment variables:
* `DISABLE_APT_UPDATE`: Avoid updating APT before installing the tools
* `FORCE_INSTALLATION`: Force installing the optional tools

```bash
# Create symlinks
./install.sh create_symlinks

# Create local configuration files
./install.sh create_local_configs

# Configure scripts behaviours
export DISABLE_APT_UPDATE=true
export FORCE_INSTALLATION=true

# Install tools
./install.sh install_tools

# Install fonts
./install.sh install_fonts

# Install desktop tools (only in GUI environments)
# Confirmation is required for some tools depending on the FORCE_INSTALLATION environment variable
./install.sh install_desktop_tools

# Install development tools
# Confirmation is required for each tool depending on the FORCE_INSTALLATION environment variable
./install.sh install_dev_tools
```

## ✏️ ToDo

* Install tools: Z, ...
* Install more developments tools
* Install more desktop tools
* Install more vscode extensions
* Add more symlinks: `.vimrc`, `.curlrc`, ...
* Configure desktop: gnome & gnome-terminal
