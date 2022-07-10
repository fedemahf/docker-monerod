#!/bin/bash

ENVIRONMENT_FILE="env.sh"
SCRIPT_FILE="monero-wallet-cli.sh"

# Check if the environment file exists
if ! [ -f "${ENVIRONMENT_FILE}" ]; then
  echo "The environment file is missing." >&2
  exit 1
fi

# Load environment variables
. ${ENVIRONMENT_FILE}

# Copy script if it doesn't exists
if ! [ -f "${DIR_WALLET}/${SCRIPT_FILE}" ]; then
  cp "./${SCRIPT_FILE}" "${DIR_WALLET}/${SCRIPT_FILE}"
fi

# Build container
docker build -t monero-wallet-cli .
