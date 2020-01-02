FROM iandennismiller/base

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    build-essential \
    python \
    python-dev \
    python-pip \
    python-virtualenv \
    python3 \
    python3-dev \
    python3-pip \
    python3-virtualenv \
    python3.7 \
    python3.7-dev \
    virtualenvwrapper \
    && \
  apt-get --purge remove -y .\*-doc$ && \
  apt-get clean -y

RUN pip install -U pip
RUN pip3 install -U pip

###
# Add a basic user

# ARG USERNAME=user
# ARG USERHOME=/home/user
# ARG USERID=1000
# ARG USERGECOS=user

# RUN adduser \
#   --home "$USERHOME" \
#   --uid $USERID \
#   --gecos "$USERGECOS" \
#   --disabled-password \
#   "$USERNAME"
# COPY files/ /home/$USERNAME
# RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

# RUN pip3 install something
