FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y apt-utils && \
  apt-get upgrade -y && \
  apt-get install -y \
    sudo \
    gnupg \
    vim \
    git \
    git-core \
    make \
    wget \
    curl \
    procps \
    openssh-server \
    tzdata \
    htop \
    telnet \
    net-tools \
    tmux \
    tigervnc-standalone-server \
    xfce4 \
    xfce4-goodies \
    xterm \
    firefox \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    python3 \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    virtualenvwrapper \
    build-essential \
    && \
  apt-get --purge remove -y .\*-doc$ && \
  apt-get clean -y

RUN service ssh start

###
# Add a basic user

ARG USERNAME=user
ARG USERHOME=/home/user
ARG USERID=1000
ARG USERGECOS=user

RUN adduser \
  --home "$USERHOME" \
  --uid $USERID \
  --gecos "$USERGECOS" \
  --disabled-password \
  "$USERNAME"
COPY files/ /home/$USERNAME
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# RUN pip3 install something
