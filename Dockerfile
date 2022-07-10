FROM debian:bullseye-slim

# Install dependencies
RUN \
  apt update && \
  apt upgrade -y && \
  apt install curl bzip2 -y

# Create monero user
RUN \
  adduser --system --group --disabled-password monero && \
  mkdir -p /home/monero/wallet /home/monero/bin

# Download and extract monero binaries
RUN \
  cd /tmp && \
  curl -L -O https://downloads.getmonero.org/cli/monero-linux-x64-v0.17.3.2.tar.bz2 && \
  tar -xf monero-linux-x64-v0.17.3.2.tar.bz2 && \
  mv /tmp/monero-x86_64-linux-gnu-v0.17.3.2/* /home/monero/bin && \
  rm -rf /tmp/* && \
  chown -R monero:monero /home/monero

VOLUME /home/monero/wallet

# Switch to user monero
USER monero
WORKDIR /home/monero/wallet

# ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/home/monero/wallet/monero-wallet-cli.sh"]
