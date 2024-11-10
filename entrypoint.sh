#!/bin/sh
# entrypoint.sh
# This script orchestrates the deployment and setup process for the application.
# It performs the following steps:
# 1. Compiles the smart contracts using Truffle to ensure there are no syntax or compilation errors.
# 2. Deploys the compiled contracts to the blockchain network specified.
# 3. Executes tests on the deployed contracts to validate their functionality and reliability.
# If any of these steps fail, the script will terminate immediately, preventing the application from starting
# and ensuring only verified code is deployed.

# Once the contracts are deployed and validated:
# - The script sets up environment configurations by writing the necessary environment variables
#   to a `config.js` file, which will be used by the client browser.
# - Finally, the script starts the application in development mode using `npm run dev`.

# Exit on any error
set -e

# Exit on any error
set -e

# Truffle migrate
echo "Compiling contracts..."
truffle compile || { echo "Truffle compile failed"; exit 1; }

echo "Migrating contracts..."
truffle migrate || { echo "Truffle migrate failed"; exit 1; }

echo "Running tests..."
truffle test || { echo "Truffle test failed"; exit 1; }

# Set up config.js
: "${GANACHE_URL:=http://localhost:8545}" # Default to localhost if GANACHE_URL is not set
echo "window.GANACHE_URL = \"$GANACHE_URL\";" > ./src/js/config.js

# Start the app
echo "Starting the app..."
npm run dev