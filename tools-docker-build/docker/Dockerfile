FROM golang

MAINTAINER jamie

#
# fundamental packages
#
ENV TERM xterm

RUN apt-get -y update

RUN echo "LC_ALL=en_US.UTF-8\nLANG=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" >> /etc/locale.conf
# Set the locale
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8

RUN apt-get clean && apt-get update && apt-get install -y vim

#
# user account
#
RUN echo "User: builder Pass: builder"
RUN useradd -G adm,sudo builder
RUN echo "builder:builder" | chpasswd
RUN echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN mkdir -p /home/builder && chown -R builder:builder /home/builder
USER builder
WORKDIR /home/builder

RUN echo "export LC_ALL=en_US.UTF-8" > .bashrc
RUN echo "export LANG=en_US.UTF-8" >> .bashrc

# shell prompt
RUN echo 'export PS1="[\u@stratohome-builder] \W # "' >> .bashrc
RUN chmod a+x .bashrc


