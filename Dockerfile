FROM debian:bullseye-slim

# Install dependencies
RUN \
  apt update && \
  apt upgrade -y && \
  apt install curl bzip2 -y

# Create monero user
RUN \
  adduser --system --group --disabled-password monero && \
  mkdir -p /home/monero/wallet

# Download and extract monero binaries
RUN \
  cd /tmp && \
  curl -L -O https://downloads.getmonero.org/cli/linux64 && \
  tar -xvf linux64 && \
  mv /tmp/monero-x86_64-linux-gnu-*/* /usr/local/bin && \
  rm -rf /tmp/* && \
  chown -R monero:monero /usr/local/bin/monero* && \
  chown -R monero:monero /home/monero/wallet

VOLUME /home/monero/wallet

# Switch to user monero
USER monero
WORKDIR /home/monero/wallet

# ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/home/monero/wallet/monero-wallet-cli.sh"]
