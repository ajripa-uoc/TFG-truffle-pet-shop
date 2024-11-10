
FROM node

# Set the GANACHE_URL build argument
ARG GANACHE_HOST
ENV GANACHE_HOST=${GANACHE_HOST}

ARG GANACHE_PORT
ENV GANACHE_PORT=${GANACHE_PORT}

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Install Truffle globally
RUN npm install -g truffle

# Copy the rest of the application code
COPY . .

# Compile the Truffle project
RUN truffle compile

# Run migrations (adjust network as needed)
RUN truffle migrate --network live

# Run tests
RUN truffle test --network live

# Expose the port the app runs on
EXPOSE 3000

# Modify config file to set the GANACHE_URL based on th environment variables
RUN chmod +x ./entrypoint.sh
CMD ["./entrypoint.sh"]