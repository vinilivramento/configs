fish_add_path ~/bin
fish_add_path /opt/tools/cargo/bin 

set -gx RUSTUP_HOME /opt/tools/rustup
set -gx CARGO_HOME /opt/tools/cargo

set -g theme_color_scheme zenburn

set -U FZF_LEGACY_KEYBINDINGS 0
set -x EDITOR nvim

set -gx FZF_DEFAULT_OPTS "-i --preview='batcat --style=numbers --color=always --line-range :500 {}' --preview-label='[ File Preview ]' --prompt='▶' --pointer='→' --border=rounded --info=inline --header='FZF Search' --header-first --reverse "
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {}'"
set -gx FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window up:3:hidden:wrap --header 'Command History'"
set -gx FZF_DEFAULT_COMMAND "rg --files --ignore-case --hidden --follow --smart-case -g '!.git' -g '!node_modules/' -g '!*.o' -g '!.clangd/' -g '!build/' -g '!target/' "
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

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
