if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_color_scheme zenburn

set -U FZF_LEGACY_KEYBINDINGS 0
set -x EDITOR nvim

set -gx RG_CMD 'rg --color=always --files -i --hidden --follow --smart-case -g "!{.git,node_modules}*" -g "!{*.o*}" -g "!{*.clangd*}" -g "!{*build*}/*" -g "!*cmake" '
set -gx FZF_FIND_FILE_COMMAND $RG_CMD

set -x GCC_COLORS 'error=01' //check rest

bind \cp 'vim $(fzf);'

alias grep rg
alias del 'mv -t /tmp'
alias v $EDITOR
alias vi $EDITOR
alias vim $EDITOR
alias vimdiff '$EDITOR -d'

alias cmake 'cmake -DCMAKE_PROJECT_INCLUDE=~/.config/cmake/inject.cmake'
