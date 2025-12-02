fish_add_path ~/bin
fish_add_path /opt/tools/cargo/bin 

set -gx RUSTUP_HOME /opt/tools/rustup
set -gx CARGO_HOME /opt/tools/cargo

set -gx CARGO_BUILD_JOBS (math (nproc) - 2)

set -g theme_color_scheme zenburn

set -U FZF_LEGACY_KEYBINDINGS 0
set -x EDITOR nvim

set -gx FZF_DEFAULT_OPTS "-i --preview='batcat --style=numbers --color=always --line-range :500 {}' --preview-label='[ File Preview ]' --prompt='▶' --pointer='→' --border=rounded --info=inline --header='FZF Search' --header-first --reverse "
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {}'"
set -gx FZF_CTRL_R_OPTS "--preview 'echo {}' --preview-window up:3:hidden:wrap --header 'Command History'"
set -gx FZF_DEFAULT_COMMAND \
    rg --files --hidden --follow --smart-case \
       -g '!.git' \
       -g '!.session.vim ' \
       -g '!node_modules/' \
       -g '!\*.o' \
       -g '!.clangd/' \
       -g '!build/' \
       -g '!.venv/' \
       -g '!.mypy/' \
       -g '!.mypy_cache/' \
       -g '!.ruff_cache/' \
       -g '!__pycache__/' \
       -g '!.pytest_cache/' \
       -g '!_deps/' \
       -g '!target/'

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

alias mk 'make -j(math (nproc) - 2)'

alias ssh 'env TERM=xterm ssh'

# Pyenv
#set PYENV_ROOT "$HOME/.pyenv"
#set -x PATH "$PYENV_ROOT/bin:$PATH"
#. (pyenv init - | psub)

# Venv
#function venv
#    python3 -m venv .venv
#    source .venv/bin/activate.fish
#end

# Ignore python warning
set -gx PYTHONWARNINGS "ignore"
