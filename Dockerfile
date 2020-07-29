## Dockerfile

FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y time
RUN apt-get install -y emacs
RUN apt-get install -y clisp
RUN apt-get install -y clang
RUN apt-get install -y sbcl
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
