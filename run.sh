#!/bin/bash

ENVIRONMENT_FILE="env.sh"

# Check if the environment file exists
if ! [ -f "${ENVIRONMENT_FILE}" ]; then
  echo "The environment file is missing." >&2
  exit 1
fi

# Load environment variables
. ${ENVIRONMENT_FILE}

# Run the container
docker run -it -v ${DIR_WALLET}:/home/monero/wallet monerod
