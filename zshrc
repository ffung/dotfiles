# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(gnu-utils gitfast osx vagrant docker)

path=("$HOME/bin"
      "$HOME/.local/bin"
      /Applications/Xcode.app/Contents/Developer/usr/bin
      $path
)

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";

# Ruby development
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Python development
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
 if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
 if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.agignore -g ""'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

_fzf_compgen_path() {
  ag --path-to-ignore ~/.agignore -g "" "$1"
}

_fzf_compgen_dir() {
  ag --path-to-ignore ~/.agignore -g "" "$1"
}

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey \^U backward-kill-line

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

export GOPATH=~/work/go
# Aliases
alias dm=docker-machine
alias v=vagrant
alias tf=terraform
alias gb=$GOPATH/bin/gb
alias vi=nvim
