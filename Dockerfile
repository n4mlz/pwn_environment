# CTF pwn image

FROM ubuntu:22.04

# setup

ENV DEBIAN_FRONTEND noninteractive
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl wget git vim unzip make gcc sudo python3 python3-pip build-essential binutils fakeroot less man strace ltrace ubuntu-advantage-tools
RUN groupadd user -g 1001 && useradd -m user -s /bin/bash -u 1000 -g 1001 -G sudo
RUN echo user:passwd | chpasswd
RUN echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER user
WORKDIR /home/user
RUN git config --global user.email "n4mlz.dev@gmail.com" && git config --global user.name "n4mlz"

# zsh

# RUN sudo apt-get install -y zsh cargo cmake libssl-dev pkg-config
# RUN cargo install sheldon starship --locked
# RUN git clone https://github.com/n4mlz/dotfiles.git && sudo chmod -R 777 dotfiles && ./dotfiles/scripts/deploy.sh
# RUN echo passwd | chsh -s /bin/zsh
# RUN zsh
# RUN export PATH="$HOME/.cargo/bin:$PATH"

# zoxide bat eza colordiff nvim

RUN sudo apt-get install -y zoxide bat neovim colordiff
RUN sudo apt-get install -y gpg
RUN sudo mkdir -p /etc/apt/keyrings
RUN wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
RUN sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
RUN sudo apt-get update
RUN sudo apt-get install -y eza

# gdb

# pwntools
