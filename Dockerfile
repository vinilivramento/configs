FROM ubuntu:latest

# Install basic tools and use bash instead of dash
RUN apt update && \
    apt install -y sudo software-properties-common bat curl fonts-powerline git gcc  g++ less ripgrep unzip vim wget && \
     rm -rf /var/lib/apt/lists/* && \
     ln -sf /bin/bash /bin/sh

# Install fish shell 
RUN apt-add-repository ppa:fish-shell/release-3 && \
    apt update && \
    apt install -y fish && \
    rm -rf /var/lib/apt/lists/*

#RUN chsh -s /usr/bin/fish

# Add user deloper with sudo and no password required to execute sudo commands
RUN useradd --create-home --shell /bin/bash developer && \
    usermod -aG sudo developer && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER developer
WORKDIR /home/developer

# Install fuzzy finder fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install

# Install fisher (Fish plugin manager)
RUN curl -sL https://git.io/fisher | fish -c 'source ; fisher install jorgebucaran/fisher' && \
    fish -c 'fisher install IlanCosman/tide@v6' && \
    fish -c 'fisher install PatrickF1/fzf.fish' && \
    fish -c 'fisher install nickeb96/puffer-fish' && \
    fish -c 'fisher install halostatue/fish-docker@v1.x'

# Set the custom username
# set custom name for docker instance
# ENV PS1="my_custom_name@\h:\w\$ "

# Copy config files to tmp
WORKDIR /tmp/
COPY . . 
WORKDIR /home/developer

# Create basic dirs for user
RUN mkdir ~/bin && mkdir ~/Tools

# Install Node.js and npm
RUN cd Tools && \
    wget https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.xz && \
    tar -xf node-v20.11.0-linux-x64.tar.xz && \
    rm node-v20.11.0-linux-x64.tar.xz && \
    sudo ln -s ~/Tools/node-v20.11.0-linux-x64/bin/node /usr/local/bin/node && \
    sudo ln -s ~/Tools/node-v20.11.0-linux-x64/bin/npm /usr/local/bin/npm

# Setup vim, nvim, bash, and fish config files 
RUN cat /tmp/fish/config.fish >> ~/.config/fish/config.fish && \
    cat /tmp/bash/bashrc >> ~/.bashrc && \
    cp /tmp/vim/vimrc ~/.vimrc && \
    cp -r /tmp/nvim ~/.config/

# Install nvim
RUN cd Tools && \
    wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz && \
    tar -xf nvim-linux64.tar.gz && \
    rm nvim-linux64.tar.gz && \
    sudo ln -s ~/Tools/nvim-linux64/bin/nvim /usr/local/bin/nvim 

# Install nvim plugins. Need 40s to install tree-sitter parsers 
RUN node --version && npm --version && \
    nvim --headless "+Lazy! sync" +qa && \
    nvim --headless -c "TSUpdate" -c "sleep 40" -c qa && \
    nvim --headless -c "MasonInstall bash-language-server clangd pyright rust-analyzer" -c "sleep 50" -c qa 
#get tide files

# Remove tmp files 
RUN sudo rm -rf /tmp/*

WORKDIR /home/developer/workspace
CMD ["/usr/bin/fish"]
