FROM ubuntu:18.04 as build-gcc6809

# Install what's needed to build gcc6809
RUN apt -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update \
 && apt install -y --no-install-recommends \
    binutils \
    ca-certificates \
    flex \
    gcc \
    gcc-multilib \
    git \
    libgmp-dev \
    libmpfr-dev \
    libz-dev \
    make \
    remake \
    sudo

# Clone and build gcc6809
WORKDIR /root
RUN git clone https://gitlab.com/dfffffff/gcc6809.git \
 && cd gcc6809/build-6809 \
 && sudo remake -i everything

# Copy built gcc6809 to new image and install dev tools.
# gcc6809 is installed to /usr/local.
FROM ubuntu:18.04
COPY --from=build-gcc6809 /usr/local /usr/local
RUN apt -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update \
 && apt install -y --no-install-recommends \
    libmpfr-dev \
    make \
    python3 \
    srecord \
    binutils \
    moreutils
WORKDIR /root
