if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_color_scheme zenburn

set -U FZF_LEGACY_KEYBINDINGS 0
set -x EDITOR nvim

set -gx FZF_DEFAULT_OPTS "-i --preview='batcat --style=numbers --color=always --line-range :500 {}' --preview-label='[ File Preview ]' --prompt='▶' --pointer='→' --border=rounded --info=inline --header='FZF Search' --header-first --reverse --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {}'"
set -gx FZF_CTRL_R_OPTS "--preview-label='[Command History ]"
set -gx FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window up:3:hidden:wrap --header 'Command History'"
set -gx FZF_DEFAULT_COMMAND "rg --files --ignore-case --hidden --follow --smart-case -g '!.git' -g '!node_modules/' -g '!*.o' -g '!.clangd/' -g '!build/' -g '!target/' "
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_COMPLETION_TRIGGER "**"

set -x GCC_COLORS 'error=01' 

alias grep rg
alias del 'mv -t /tmp'
alias v $EDITOR
alias vi $EDITOR
alias vim $EDITOR
alias vimdiff '$EDITOR -d'

alias cmake 'cmake -DCMAKE_PROJECT_INCLUDE=~/.config/cmake/inject.cmake'

bind \cp 'vim $(fzf);'

# projectdo https://github.com/paldepind/projectdo#aliases
alias t 'projectdo test'
alias r 'projectdo run'
alias b 'projectdo build'
alias p 'projectdo tool'
