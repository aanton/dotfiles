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
      xargs -n1 -I{} git show {}
  }

  function gbranch {
    local preview=$(__preview_git_log)

    git branch -vv | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -n1 -I{} git checkout {}
  }

  function gfixup {
    local preview=$(__preview_git_show)

    git log --oneline | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -n1 -I{} git commit -v --fixup {}
  }

  function grebase {
    local preview=$(__preview_git_show)

    git log --oneline | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -o -n1 -I{} git rebase -i {}^
  }

  function gtrack {
    local refFormat="%(refname:short);%(committerdate:iso);%(contents:subject);%(authorname)"
    local preview=$(__preview_git_show)

    git for-each-ref refs/remotes/ --sort=-committerdate --format="$refFormat" | \
      column -t -s ';' | \
      fgrep -v origin/HEAD | \
      fzf --exact --no-multi --no-sort --query=$1 --preview "$preview" | \
      awk '{print $1}' | \
      xargs -n1 -I{} git checkout --track {}
  }

fi
