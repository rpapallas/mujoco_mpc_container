apt-get update 
DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration
DEBIAN_FRONTEND=noninteractive TZ="Europe/London" apt-get install -y tzdata
apt-get -y upgrade

add-apt-repository ppa:ubuntu-toolchain-r/test
apt update

apt-get install -y --force-yes \
    wget \
    tmux \
    vim-gtk \
    zip \
    unzip \
    git \
    build-essential \
    pypy \
    cmake \
    curl \
    software-properties-common \
    apt-utils \
    python3-pip \
    ninja-build \
    curl \
    python-is-python3 \
    libgl1-mesa-dev \
    libxinerama-dev \
    libxcursor-dev \
    libxrandr-dev \
    libxi-dev \
    ninja-build \
    clang-12 \
    gcc-10 \
    g++-10 \
    && apt-get -y autoremove \
    && apt-get clean

# Update default C and C++ compiler:
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 10
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 10
update-alternatives --config gcc
update-alternatives --config g++


# Let's have a custom PS1 to help people realise in which container they are working.
CUSTOM_ENV=/.singularity.d/env/99-zz_custom_env.sh
cat >$CUSTOM_ENV <<EOF
#!/bin/bash
PS1="[mj_mpc] Singularity> \w \$ "
EOF
chmod 755 $CUSTOM_ENV
