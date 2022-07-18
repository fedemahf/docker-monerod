FROM debian:bullseye-slim

# Install dependencies
RUN \
  apt update && \
  apt upgrade -y && \
  apt install curl bzip2 -y

# Download Monero binaries and SHA256 sums
RUN \
  cd /tmp && \
  curl -L -O https://downloads.getmonero.org/cli/linux64 && \
  curl -L -O https://www.getmonero.org/downloads/hashes.txt

# Check the binaries signature - the build will fail if the hashes doesn't match
RUN \
  grep -qe $(sha256sum /tmp/linux64) /tmp/hashes.txt

# Extract monero binaries
RUN \
  cd /tmp && \
  tar -xvf linux64 && \
  mv /tmp/monero-x86_64-linux-gnu-*/monero* /usr/local/bin && \
  rm -rf /tmp/*

# Create and configure monero user
RUN \
  adduser --system --group --disabled-password monero && \
  mkdir -p /home/monero/wallet && \
  chown -R monero:monero /usr/local/bin/monero* && \
  chown -R monero:monero /home/monero/wallet

RUN \
  mkdir /var/log/monero && \
  mkdir /var/lib/monero && \
  touch /var/lib/monero/monerod.conf

COPY monerod.conf /var/lib/monero/monerod.conf

RUN \
  chown -R monero:monero /var/lib/monero && \
  chown -R monero:monero /var/log/monero

VOLUME /home/monero/wallet

# Switch to user monero
USER monero
WORKDIR /home/monero/wallet

# ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/home/monero/wallet/monero-wallet-cli.sh"]
