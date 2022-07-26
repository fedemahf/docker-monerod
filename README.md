# Docker Monero daemon
Simple Docker container for Monero daemon.

## Configuration
Create a directory to save the keys and set the path in a file named: `env.sh`

See [env.example.sh](env.example.sh) for an example.

This will be the wallet directory inside your host machine. Once you build the container, a bash script will be created in your wallet directory. It will work as the container entrypoint. You can modify the command arguments in this script.

## Usage
### `./build.sh`
Build the container.

### `./run.sh`
Run Monero daemon.

## References
- [Guide | How to run your own Monero node](https://www.coincashew.com/coins/overview-xmr/guide-or-how-to-run-a-full-node) at coincashew.com
- [Running Monero Open Node + Tor Onion](https://monerodocs.org/running-node/open-node-tor-onion/) at monerodocs.org

## See also
- [fedemahf/docker-monerod](https://github.com/fedemahf/docker-monerod) - Simple Docker container for Monero daemon
