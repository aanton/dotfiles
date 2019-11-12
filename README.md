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
* `FORCE_INSTALLATION`: Force installing the optional tools
* `SKIP_APT_UPDATE`: Avoid updating APT before installing the tools
* `SKIP_DESKTOP_TOOLS`: Avoid installing desktop tools

```bash
export FORCE_INSTALLATION=true
export SKIP_APT_UPDATE=true
export SKIP_DESKTOP_TOOLS=true
```

There are two usage alternatives:
* Run the "all-in-one" command to configure the dotfiles & install the tools
* Run commands step by step

```bash
# Display all available commands
./install.sh

# Run the "all-in-one" command but asking for some optional tools
FORCE_INSTALLATION=false ./install.sh all

# Run the "all-in-one" command forcing the installation of the optional tools
FORCE_INSTALLATION=true ./install.sh all

# Run the "all-in-one" command forcing the installation of the optional tools but skipping the desktop tools
FORCE_INSTALLATION=true SKIP_DESKTOP_TOOLS=true ./install.sh all
```

```bash
# Command: Create symlinks
./install.sh create_symlinks

# Command: Create local configuration files
./install.sh create_local_configs

# Command: Install tools
./install.sh install_tools

# Command: Install fonts
./install.sh install_fonts

# Command: Install desktop tools (only in GUI environments)
# Confirmation is required for some tools depending on the FORCE_INSTALLATION environment variable
./install.sh install_desktop_tools

# Command: Install development tools
# Confirmation is required for each tool depending on the FORCE_INSTALLATION environment variable
./install.sh install_dev_tools

# Command: Install vscode extensions
./install.sh install_vscode_extensions

# Command: Configure gnome desktop & terminal
./install.sh configure_gnome
```

## ✏️ ToDo

* Configure more symlinks
* Configure desktop: gnome & gnome-terminal
* Install more developments tools
* Install more desktop tools
* Install more vscode extensions
