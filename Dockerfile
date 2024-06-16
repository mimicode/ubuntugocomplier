FROM ubuntu:22.04
ENV PATH=$PATH:/usr/local/go/bin:/usr/local/bin
ENV goversionname=go1.20
ENV nodeversion=v16.20.2

RUN apt-get update && apt-get install -y gcc-multilib gcc g++ make git wget gcc-mingw-w64

RUN wget -O /tmp/$goversionname.linux-amd64.tar.gz https://dl.google.com/go/$goversionname.linux-amd64.tar.gz && \
    tar zxvf /tmp/$goversionname.linux-amd64.tar.gz -C /usr/local && \
    rm -rf /tmp/$goversionname.linux-amd64.tar.gz && \
    go env -w GO111MODULE=on && go env -w GOPROXY=https://goproxy.cn,direct &&\
    go env -w GOROOT=/usr/local/go &&\
    go env -w GOPATH=/home/gopath
# install node
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash &&\
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" &&\
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &&\
    nvm install $nodeversion && \
    nvm alias default $nodeversion && \
    npm install -g yarn && \
    node -v && yarn -v



CMD ["/bin/bash"]
