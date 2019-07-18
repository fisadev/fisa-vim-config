FROM ubuntu:19.04

RUN apt update
RUN apt install -y git vim python3 python3-pip curl exuberant-ctags ack-grep
RUN rm -rf /var/lib/apt/lists/*

COPY ./sample_code/ /root/
COPY ./nvim.appimage /root/
COPY ./nvim /usr/bin/

RUN pip3 install pynvim flake8 pylint isort

RUN mkdir -p /root/.config/nvim
COPY ./config.vim /root/.config/nvim/init.vim
COPY ./config.vim /root/.vimrc

CMD bash
