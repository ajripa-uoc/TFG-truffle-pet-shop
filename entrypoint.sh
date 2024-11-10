# entrypoint.sh
# This script is used to start the app. It writes the environment variables to the config.js file and then starts the app.

#!/bin/sh
: "${GANACHE_URL:=http://localhost:8545}" # Default to localhost if GANACHE_URL is not set

# Write the GANACHE_URL to config.js
echo "window.GANACHE_URL = \"$GANACHE_URL\";" > ./src/js/config.js

# Start the app
npm run dev