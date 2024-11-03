#!/bin/bash

# fzf + git functions
if [ -f ~/.fzf.zsh ]; then

  function __preview_git_log {
    local format="%h %ad | %s%C(yellow)%d%Creset %C(blue)%an%Creset"
    echo "git log --pretty=format:\"$format\" --graph --date=iso --color=always -10 {1}"
  }

  function __preview_git_show {
    echo "git log -1 --stat --patch --color=always {1}"
  }

  function gshow {
    local preview=$(__preview_git_show)

    git log --oneline | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -I{} git show {}
  }

  function gdshow {
    local preview=$(__preview_git_show)

    git log --oneline | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -I{} git difftool -d {}^..{}
  }

  function gbranch {
    local preview=$(__preview_git_log)

    git branch -vv --sort=-committerdate | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -I{} git checkout {}
  }

  function gfixup {
    local preview=$(__preview_git_show)

    git log --oneline | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -I{} git commit -v --fixup {}
  }

  function grebase {
    local preview=$(__preview_git_show)

    git log --oneline | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -o -I{} git rebase -i {}^
  }

  function gtrack {
    local refFormat="%(refname:short);%(committerdate:iso);%(contents:subject);%(authorname)"
    local preview=$(__preview_git_show)

    local tracked_branches=$(git for-each-ref --format='%(refname:short)' refs/heads/ | sed -e 's/^/origin\//' | tr '\n' ';')
    local untracked_branches=$(git for-each-ref refs/remotes/ --sort=-committerdate --format="$refFormat" | while read line; do remote_branch=$(echo $line | awk -F';' '{print $1}'); if [ -z $(echo $tracked_branches | fgrep "$remote_branch;") ] && [ "$remote_branch" != "origin/HEAD" ]; then echo $line; fi; done;)

    echo "$untracked_branches" | \
      column -t -s ';' | \
      fgrep -v origin/HEAD | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -I{} git checkout --track {}
  }

fi

function sudo-node-by-nvm-version {
  sudo ln -sf "$NVM_DIR/versions/node/$(nvm version)/bin/node" "/usr/local/bin/node"
  sudo ln -sf "$NVM_DIR/versions/node/$(nvm version)/bin/npm" "/usr/local/bin/npm"
  sudo ln -sf "$NVM_DIR/versions/node/$(nvm version)/bin/npx" "/usr/local/bin/npx"
}
