# Docker Monero CLI Wallet

Simple Docker container for Monero CLI Wallet.

## Configuration

Create a directory to save the keys and set the path in a file named: `env.sh`

See [env.example.sh](env.example.sh) for an example.

This will be the wallet directory inside your host machine. Once you build the container, a bash script will be created in your wallet directory. It will work as the container entrypoint. You can modify the command arguments in this script.

## Usage

### `./build.sh`

Build the container.

### `./run.sh`

Run Monero CLI Wallet.
