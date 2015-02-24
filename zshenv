# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# Python development
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
