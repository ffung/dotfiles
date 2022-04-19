# use vi as the visual editor
alias vi=nvim
alias vim=nvim
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER="less -XF"

# Local config
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
