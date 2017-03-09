# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Aliases
alias dm=docker-machine
alias v=vagrant
alias tf=terraform

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gitfast osx vagrant docker gnu-utils)

source $ZSH/oh-my-zsh.sh

path=("$HOME/bin"
       "$HOME/.local/bin"
       $path
      /Applications/Xcode.app/Contents/Developer/usr/bin
)

bindkey \^U backward-kill-line

FPATH=~/.zsh/functions:$FPATH

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  echo '○'
}

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}$(collapse_pwd) %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} $(prompt_char) '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Ruby development
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Python development
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export GOPATH=~/work/go
alias gb=$GOPATH/bin/gb
alias vi=nvim
