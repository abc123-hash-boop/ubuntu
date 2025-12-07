# Using Ubuntu
FROM ubuntu:25.10

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# install useful tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ttyd \
    bash \
    vim \
    make \
    curl \
    wget \
    git \
    htop \
    net-tools \
    locales \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8

WORKDIR /root

# ttyd 默认监听 8080 端口
EXPOSE 8080

# Enable ttyd
CMD ["ttyd", "-p", "8080", "--writable", "bash"]
