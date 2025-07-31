# Linux environment with Node.js v22
FROM node:22

# Set working directory
WORKDIR /app

# Prevent interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    wget \
    vim \
    tar \
    unzip \
    git \
    strace \
    lsof \
    telnet \
    net-tools \
    less \
    procps \
    iputils-ping \
    netcat-openbsd \
    build-essential \
    autoconf \
    automake \
    libtool \
    nasm \
    pkg-config \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install agent-tars CLI globally
RUN npm install -g @agent-tars/cli@latest
RUN npm init playwright@latest
RUN npx playwright install --with-deps
RUN ln -s /root/.cache/ms-playwright/chromium-1181/chrome-linux/chrome /usr/bin/google-chrome && \
    ln -s /usr/bin/google-chrome /usr/bin/chromium && \
    ln -s /usr/bin/google-chrome /usr/bin/chromium-browser

RUN apt-get update && apt-get install -y xvfb xauth
# Default provider/model/API key - override these at runtime
ENV PROVIDER=volcengine
ENV MODEL=doubao-1-5-thinking-vision-pro-250428
# doubao-1-5-thinking-vision-pro-250428
# doubao-1-5-ui-tars-250428

ENV API_KEY=<your apikey to access the model>

# Run agent-tars CLI (with ESM support)
ENTRYPOINT ["sh", "-c", "xvfb-run --auto-servernum -- agent-tars --provider $PROVIDER --model $MODEL --apiKey $API_KEY"]
