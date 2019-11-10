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
gnome-session-quit # logout

echo $SHELL
```

## 🖱 Usage

Before running these scripts, you should review them & modify them according to your needs.

The scripts behaviours can be changed with these environment variables:
* `DISABLE_APT_UPDATE=true`: Avoid updating APT before installing the tools
* `FORCE_INSTALLATION=true`: Force installing the optional tools

```bash
# Create symlinks
./create_symlinks.sh

# Create local configuration files
./create_local_configs.sh

# Configure scripts behaviours
# export DISABLE_APT_UPDATE=true
export FORCE_INSTALLATION=true

# Install tools
./install_tools.sh

# Install fonts
./install_fonts.sh

# Install desktop tools (only in GUI environments)
./install_desktop_tools.sh

# Install optional tools
# Confirmation is required for each tool depending on the FORCE_INSTALLATION environment variable
./install_optional_tools.sh
```

## ✏️ ToDo

* Install tools: Z, ...
* Install more developments tools
* Install more desktop tools
* Install more vscode extensions
* Add more symlinks: `.vimrc`, `.curlrc`, ...
* Configure desktop: gnome & gnome-terminal
