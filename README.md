# Docker Monero CLI Wallet

Simple Docker container for Monero CLI Wallet.

## Usage

### `docker build -t monero-wallet-cli .`

Builds the container.

## `docker run -it -v ${pwd}/wallet:/home/monero/wallet monero-wallet-cli`

Runs the container in interactive mode. Run `cd ~ && ./bin/monero-wallet-cli` to run the wallet.
