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
plugins=(gnu-utils gitfast osx vagrant docker kubectl)

path=("$HOME/bin"
      "$HOME/.local/bin"
      "$HOME/go/bin"
      /Applications/Xcode.app/Contents/Developer/usr/bin
      /usr/local/opt/gnu-sed/libexec/gnubin
      /usr/local/opt/grep/libexec/gnubin
      /usr/local/opt/openssl/bin/gnubin
      $path
)

export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32";

# direnv
eval "$(direnv hook zsh)"

# Ruby development
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Python development
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
 if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
 if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.agignore -g ""'
# export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
# export FZF_PREVIEW_OPTS="--preview '[[ \$(file --mime {}) =~ binary ]] &&
#                  echo {} is a binary file ||
#                  (bat --style=numbers --color=always {} ||
#                   highlight -O ansi -l {} ||
#                   coderay {} ||
#                   rougify {} ||
#                   cat {}) 2> /dev/null | head -500'"
# export FZF_CTRL_T_OPTS=$FZF_PREVIEW_OPTS
# export FZF_COMPLETION_OPTS=$FZF_PREVIEW_OPTS

export GOPATH=$(go env GOPATH)

# _fzf_compgen_path() {
#   ag --path-to-ignore ~/.agignore -g "" "$1"
# }

source $ZSH/oh-my-zsh.sh

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey \^U backward-kill-line

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo '±' && return
  echo '○'
}

function show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

function dpython() {
    cat << EOF > .envrc
source_up
pyenv=${PWD##*/}
layout virtualenv \${pyversion} \${pyenv}
layout activate \${pyenv}-\${pyversion}
unset PS1
EOF
}

PROMPT='$(show_virtual_env) %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}$(collapse_pwd) %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} $(prompt_char) '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[magenta]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

export LC_ALL=en_US.UTF-8
# Aliases
alias dm=docker-machine
alias v=vagrant
alias tf=terraform
alias vi=nvim
alias vim=nvim
alias nano=vi
alias f="fzf $FZF_PREVIEW_OPTS"

