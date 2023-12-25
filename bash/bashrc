alias ls="ls --color=auto"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}*" -g "!{*.o*}" -g "!{*.clangd*}" -g "!{*build*}/*" '
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

bind -x '"\C-p": vim $(fzf);'

exec fish
