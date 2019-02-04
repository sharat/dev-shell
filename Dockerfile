FROM debian:latest
FROM node:10
FROM microsoft/dotnet:2.2-sdk


WORKDIR /root
COPY . /root

# Install packages
RUN apt-get update && apt-get install -y \
    git \
    vim \
    zsh \
    wget \
    curl \
    screen

# Zsh
RUN zsh -c exit
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Configure npm
RUN echo "export PATH=$PATH:./node_modules/.bin" >> /root/.zshrc

# Configure git
RUN git config --global user.name "Sarath C"
RUN git config --global user.email sarath.c@experionglobal.com
RUN git config --global core.editor vim
RUN git config --global credential.helper 'store --file ~/.git-credentials'

WORKDIR /root

EXPOSE 4567

# start image with docker run -it -p 8080:8080 dev /bin/zsh

