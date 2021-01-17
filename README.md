# aanton/dotfiles

Scripts to install the dotfiles & tools that i use in 🐧 Ubuntu 20.04 (it could work on others Debian-based Linux distributions).

Inspired by:
* https://github.com/victoriadrake/dotfiles
* https://github.com/alrra/dotfiles

## 👉 Requirements

* Install `git` & `curl`
* Install ZSH & set it as the default shell
  * Logout & login are required !
  * Verify that ZSH is the default shell

```bash
sudo apt install git curl

sudo apt install zsh
chsh -s "$(which zsh)"
gnome-session-quit # logout (for Gnome environments)

echo $SHELL
```

## 🖱 Usage

Before running these scripts, you should review them & modify them according to your needs.

The scripts behaviours can be changed with these environment variables:
* `SKIP_APT_UPDATE`: Avoid updating APT before installing the tools
* `SKIP_CONFIRMATION`: Avoid asking for confirmation to install/configure some optional tools
* `SKIP_DESKTOP_TOOLS`: Avoid installing desktop tools

```bash
# Environment variables can be set before running the scripts ...
export SKIP_APT_UPDATE=true
export SKIP_CONFIRMATION=true
export SKIP_DESKTOP_TOOLS=true

# but also when running the scripts
SKIP_APT_UPDATE=true SKIP_CONFIRMATION=true SKIP_DESKTOP_TOOLS=true ./install.sh <command>
```

There are two usage alternatives:
* Run the "all-in-one" command to configure the dotfiles & install the tools
* Run commands step by step

```bash
# Display all available commands
./install.sh

# Run the "all-in-one" command (optional tools will require confirmation)
SKIP_CONFIRMATION=false ./install.sh all

# Run the "all-in-one" command without confirming the optional tools
SKIP_CONFIRMATION=true ./install.sh all

# Run the "all-in-one" command without confirming the optional tools, but skipping the desktop tools
SKIP_CONFIRMATION=true SKIP_DESKTOP_TOOLS=true ./install.sh all
```

```bash
# Command: Create symlinks
./install.sh create_symlinks

# Command: Create local configuration files
./install.sh create_local_configs

# Command: Install common tools
./install.sh install_common_tools

# Command: Install fonts
./install.sh install_fonts

# Command: Install desktop tools (only in GUI environments)
# Confirmation is required for some tools (can be skipped using SKIP_CONFIRMATION)
./install.sh install_desktop_tools

# Command: Install development tools
# Confirmation is required for some tools (can be skipped using SKIP_CONFIRMATION)
./install.sh install_dev_tools

# Command: Install vscode extensions
./install.sh install_vscode_extensions

# Command: Configure gnome desktop & terminal
# Confirmation is required (can be skipped using SKIP_CONFIRMATION)
./install.sh configure_gnome
```

## ✏️ ToDo

* Configure more symlinks
* Configure desktop: gnome & gnome-terminal
* Install more developments tools
* Install more desktop tools
* Install more vscode extensions
