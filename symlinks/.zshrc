# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bgnotify
  composer
  docker
  kubectl
  npm
  sudo
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# When adding a command to the history, remove the older duplicated one
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt SHAREHISTORY

# Gnome Terminal colors
# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
# https://askubuntu.com/questions/881949/ugly-color-for-directories-in-gnome-terminal
export LS_COLORS="$LS_COLORS:ow=1;7;94"

# Less configuraion
export LESS="-ErX"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Git aliases
alias gco="git checkout"
alias gw="git switch"
alias ga="git add -u"
alias gc="git commit -v"
alias gcA="git commit -v --amend --no-edit"
alias gs="git status"
alias gsb="git status -sb"
alias gd="git diff"
alias gds="git diff --staged"
alias gdd="git difftool -d"
alias gdr="git diff @{u} @"
alias gddr="git difftool -d @{u} @"
alias gdl="git diff @^ @"
alias gddl="git difftool -d @^ @"
alias glast="git show -1"
alias gl="git log --pretty=format:\"%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset\" --graph --date=iso --exclude=refs/stash --all -16"
alias gll="git log --pretty=format:\"%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset\" --graph --date=iso -16"
alias glr="git log --pretty=format:\"%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset\" --graph --date=iso -16 @ @{u}"
alias glm="git log --pretty=format:\"%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset\" --graph --date=iso -16 @ main"
alias gl-committer="git log --pretty=format:\"%h %cd | %s%C(yellow)%d%Creset %C(blue)%cn%Creset\" --graph --date=iso --exclude=refs/stash --all -16"
alias gll-committer="git log --pretty=format:\"%h %cd | %s%C(yellow)%d%Creset %C(blue)%cn%Creset\" --graph --date=iso -16"
alias gf="git fetch -p"
alias gpull="git pull --ff-only"
alias gpush="git push origin HEAD"
alias gb='git branch -vv'
alias gba='git branch -vva'
alias gbd='git branch -d'
alias gm="git checkout main && gpull"

# NPM packages aliases (using npx)
alias tldr="npx tldr"
alias surge="npx surge"
alias servor="npx servor"

# Z
[ -f ~/z.sh ] && source ~/z.sh

# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh

  # fzf configuration
  export FZF_DEFAULT_OPTS="
    --multi
    --reverse
    --border
    --inline-info
    --bind 'ctrl-r:toggle-sort'
    --preview '([ -e {} ] && (head -10 {} || tree -C {} | head -10 ) || (echo {})) 2> /dev/null'
    --preview-window=right:40%:wrap
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b"

  export FZF_CTRL_R_OPTS="--no-preview"
  export FZF_DEFAULT_COMMAND="(fd --hidden --exclude .git --follow || git ls-tree -r --name-only HEAD || (find . -path \"*/\.*\" -prune -o -type f -print -o -type l -print | sed s/^..//)) 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  if [ -x "$(command -v code)" ]; then
    export FZF_CTRL_T_OPTS="--bind 'ctrl-x:execute(code -r {})'"
  else
    export FZF_CTRL_T_OPTS="--bind 'ctrl-x:execute(vim {} < /dev/tty > /dev/tty)'"
  fi

  # fzf bindigs
  bindkey '^P' fzf-file-widget

  # Custom functions (gbranch, grebase, ...) are defined in .functions.sh
fi

# nvm (lazy loading)
# https://blog.yo1.dog/better-nvm-lazy-loading/
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"

  nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
    nvm $@
  }

  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  DEFAULT_NODE_VER="$( (< "$NVM_DIR/alias/default" || < ~/.nvmrc) 2> /dev/null)"
  while [ -s "$NVM_DIR/alias/$DEFAULT_NODE_VER" ] && [ ! -z "$DEFAULT_NODE_VER" ]; do
    DEFAULT_NODE_VER="$(<"$NVM_DIR/alias/$DEFAULT_NODE_VER")"
  done

  if [ ! -z "$DEFAULT_NODE_VER" ]; then
    export PATH="$NVM_DIR/versions/node/v${DEFAULT_NODE_VER#v}/bin:$PATH"
  fi
fi

# Agnoster theme customizations
if [ $ZSH_THEME = "agnoster" ]; then
  precmd() {
    print ""
  }

  # Hide subdirectories in the prompt
  prompt_dir() {
    prompt_segment blue black "`echo $PWD | sed -E -e "s#$HOME#~#" -e 's#^(~?/[^/]+/).+(/[^/]+)$#\1...\2#'`"
  }
fi

# deno
if [ -d "$HOME/.deno" ]; then
  export DENO_INSTALL="/home/aanton/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# bun
if [ -d "$HOME/.bun" ]; then
  [ -s "/home/aanton/.bun/_bun" ] && source "/home/aanton/.bun/_bun"

  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
fi

# copy&paste
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.functions.sh ] && source ~/.functions.sh
