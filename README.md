# My configs 

* Terminal emulator [kitty](https://sw.kovidgoyal.net/kitty)
  * install [kitty](https://sw.kovidgoyal.net/kitty/binary)
  * configure: ```cp -r kitty  ~/.config/kitty/kitty.conf```
  * configure: ```cp -r current-theme.conf ~/.config/kitty/current-theme.conf```

* Install fonts-powerline 

* Command-line shell [fish](https://github.com/fish-shell/fish-shell)
    * install via package manager: ```apt install fish```
    * install fish plugin manager [fisher](https://github.com/jorgebucaran/fisher)
    * install fish theme [tide](https://github.com/IlanCosman/tide): ```fisher install IlanCosman/tide@v6```
    * install fish plugin [fzf](https://github.com/PatrickF1/fzf.fish)
    * install fish plugin [puffer](https://github.com/nickeb96/puffer-fish)
    * install fish plugin [fish-docker](https://github.com/halostatue/fish-docker) ```fisher install halostatue/fish-docker@v1.x```````
    * configure: ```cp fish/config.fish ~/.config/fish/ ```

* Configure bash
  * append folloing content to .bashrc: ```cat bash/bashrc >> ~/.bashrc```

* Cat clone with syntax highlighting called [bat](https://github.com/sharkdp/bat)
  * install via package manager: ```apt install bat```

* Regex tool [ripgrep](https://github.com/BurntSushi/ripgrep)
    * install via package manager: ```apt install ripgrep```

* Fuzzy finder [fzf](https://github.com/junegunn/fzf)
    * install either via package manager or via git repository [junegunn/fzf](https://github.com/junegunn/fzf?tab=readme-ov-file#using-git)

* Single-letter project commands [projectdo](https://github.com/paldepind/projectdo)
    * download [script](https://raw.githubusercontent.com/paldepind/projectdo/master/projectdo) and put in path 

* Install node.js (and npm)
    * Download [package] (https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz)
    * Unpack and create symbolic links to node and npm in ~/bin

* Editor [neovim](https://github.com/neovim/neovim) 
    * install most recent released [binary](https://github.com/neovim/neovim/releases/) and put in path
    * configure: ```cp -r nvim ~/.config```
    * open nvim and install all plugins by running ```PackerInstall```
    * Use [Mason](https://github.com//packer.nvim) to install LSP tooling: ```bash-language-server pyright rust-analyzer codelldb```

* Editor vim:
  * basic configuration: ```cp vimrc ~/.vimrc```

* Rust Configuration and Tooling
    * install [rustup](https://www.rust-lang.org/tools/install) and run ```rustup update```
    * install [cargo-modules](https://github.com/regexident/cargo-modules): ```cargo install cargo-modules``` 
    * install [cargo-nextest](https://nexte.st/book/installation.html): ```cargo install cargo-nextest```

* C++ Configuration and Tooling
    * install clang, clangd and clang-format via package manager
    * setup generic clangd config: ```cp clangd/config.yaml ~/.config/clangd/```
    * copy clang-format file to the project as: ```cp clang-format/clang-format path-to-project/.clang-format```
    * install [ccache](https://github.com/ccache/ccache): ```cp cmake/ccache ~/.config/ccache.conf```
      * adjust max_size if needed
      * set a proper cache_dir with enough size
      * add a prefix_command if needed
    * install cmake
      * add inject cmake file: ```cp cmake/inject.cmake ~/.config/cmake/```
      * make sure inject file is correctly configured, such as adding an alias: ```alias cmake 'cmake -DCMAKE_PROJECT_INCLUDE=~/.config/cmake/inject.cmake'```

* Diff and merge tool [meld](https://meldmerge.org/)
    * install via package manager
    * configure to be used by git:
      * ```git config --global diff.tool meld```
      * ```git config --global merge.tool meld```
      * ```git config --global --add difftool.prompt false```

* Docker:
    * install via package manager
    * configure [permissions](https://docs.docker.com/engine/install/linux-postinstall/): ```sudo groupadd docker && sudo usermod -aG docker $USER```

* [Lazydocker](https://github.com/jesseduffield/lazydocker) tool 
    * install: ```curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash```
