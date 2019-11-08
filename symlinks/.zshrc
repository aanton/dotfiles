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
plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

# User configuration

# When adding a command to the history, remove the older duplicated one
setopt hist_ignore_all_dups

# Gnome Terminal colors
# https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
# https://askubuntu.com/questions/881949/ugly-color-for-directories-in-gnome-terminal
export LS_COLORS="$LS_COLORS:ow=1;7;94"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Git aliases
alias gd="git diff"
alias gs="git status"
alias ga="git add -u"
alias gc="git commit -v"
alias gl="git log --pretty=format:\"%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset\" --graph --date=iso --all -10"
alias gll="git log --pretty=format:\"%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset\" --graph --date=iso -10"
alias gf="git fetch -p"
alias gpull="git fetch -p && git pull --ff-only"
alias gpush="git push origin HEAD"
alias glast="git show -1"

# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh

  # fzf configuration
  export FZF_DEFAULT_OPTS="--multi --reverse --border --inline-info --preview '([ -e {} ] && (head -10 {} || tree -C {} | head -10 ) || (echo {})) 2> /dev/null' --preview-window=right:40%:wrap"
  export FZF_CTRL_R_OPTS="--no-preview"
  export FZF_CTRL_T_OPTS="--bind 'ctrl-x:execute(vim {} < /dev/tty > /dev/tty)'"
  export FZF_DEFAULT_COMMAND="(fd --hidden --exclude .git --follow || git ls-tree -r --name-only HEAD || (find . -path \"*/\.*\" -prune -o -type f -print -o -type l -print | sed s/^..//)) 2> /dev/null"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # fzf bindigs
  bindkey '^P' fzf-file-widget

  # fzf + git aliases
  alias gshow="git show \$(git log --pretty=oneline | fzf +m --preview 'git log -1 --stat {1}' | awk '{print \$1}')"
  alias grebase="git rebase -i \$(git log --pretty=oneline | fzf +m --preview 'git log -1 --stat {1}' | awk '{print \$1}')^"
  alias gbranch="git checkout \$(git branch -vv | fzf +m | awk '{print \$1}')"
fi

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
