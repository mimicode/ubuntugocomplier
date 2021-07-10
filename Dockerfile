FROM ubuntu:18.04
ENV PATH $PATH:/usr/local/go/bin:/usr/local/bin
RUN apt-get update && apt-get install -y gcc-multilib gcc g++ make git wget gcc-mingw-w64
RUN wget -O /tmp/go1.16.4.linux-amd64.tar.gz https://dl.google.com/go/go1.16.5.linux-amd64.tar.gz && \
tar zxvf /tmp/go1.16.4.linux-amd64.tar.gz -C /usr/local && \
rm -rf /tmp/go1.16.4.linux-amd64.tar.gz && \
go env -w GO111MODULE=on && go env -w GOPROXY=https://goproxy.cn,direct
