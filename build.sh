#!/bin/bash

ENVIRONMENT_FILE="env.sh"
SCRIPT_FILE="monero-daemon.sh"
CONFIG_FILE="monerod.conf"

# Check if the environment file exists
if ! [ -f "${ENVIRONMENT_FILE}" ]; then
  echo "The environment file is missing." >&2
  exit 1
fi

# Load environment variables
. ${ENVIRONMENT_FILE}

# Copy script if it doesn't exists
if ! [ -f "${DIR_CHAIN}/${SCRIPT_FILE}" ]; then
  echo "cp \"./${SCRIPT_FILE}\" \"${DIR_CHAIN}/${SCRIPT_FILE}\""
  cp "./${SCRIPT_FILE}" "${DIR_CHAIN}/${SCRIPT_FILE}"
fi

# Copy config if it doesn't exists
if ! [ -f "${DIR_CHAIN}/${CONFIG_FILE}" ]; then
  echo "cp \"./${CONFIG_FILE}\" \"${DIR_CHAIN}/${CONFIG_FILE}\""
  cp "./${CONFIG_FILE}" "${DIR_CHAIN}/${CONFIG_FILE}"
fi

# Build container
docker build -t monerod .
