## Dockerfile

FROM ubuntu

RUN apt-get update
RUN apt-get install -y gnat
RUN apt-get install -y emacs
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
