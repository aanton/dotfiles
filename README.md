# aanton/dotfiles

My dotfiles & tools that i usually use in 🐧 Ubuntu 18.04.

Inspired by:
* https://github.com/victoriadrake/dotfiles
* https://github.com/alrra/dotfiles

## Requirements

* Install ZSH & set it as the default shell
  * Logout & login are required !
  * Verify that ZSH is the default shell

```shell
sudo apt install zsh
chsh -s "$(which zsh)"
gnome-session-quit # logout

echo $SHELL
```

## Usage

1. Create symlinks
2. Create local configuration files
3. Install tools

In desktop environments:

4. Install desktop tools


```bash
./create_symlinks.sh
./create_local_configs.sh
./install_tools.sh

# Continue only if installing in desktop environments
./install_desktop_tools.sh
```
