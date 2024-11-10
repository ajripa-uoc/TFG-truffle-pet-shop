
# TFG Truffle Pet Shop

This project is a decentralized application (DApp) built with Truffle, Ganache, and Docker Compose. It demonstrates a blockchain-based pet adoption platform. The application’s backend is developed using Ethereum smart contracts and deployed locally with Ganache.

## Prerequisites

- **Docker**: Install Docker and Docker Compose to run the application in a containerized environment.
- **Node.js and npm**: These are required if you want to manage dependencies or build the project locally without Docker.

## Project Structure

- `contracts/`: Ethereum smart contracts for the application.
- `migrations/`: Migration scripts to deploy smart contracts.
- `src/`: Frontend code for the DApp.
- `test/`: Tests for the smart contracts.

## Getting Started

### Cloning the Repository

```bash
git clone https://github.com/ajripa-uoc/TFG-truffle-pet-shop.git
cd TFG-truffle-pet-shop
```

## Running the Project with Docker Compose

The project uses Docker Compose to orchestrate the setup, with the following services:

- **web**: The frontend application. **Note**: `web` requires `ganache-cli` to be up and running for the build phase.
- **ganache-cli**: Provides a local Ethereum blockchain environment.

### Step 1: Start `ganache-cli`

Since the `web` service depends on `ganache-cli` to be running during the build phase, you need to start `ganache-cli` first:

```bash
docker-compose up -d ganache-cli
```

### Step 2: Build and Start `web`

Once `ganache-cli` is running, build and start `web`:

```bash
docker-compose up --build web
```

This will bring up the `web` service along with any other dependencies defined in the `docker-compose.yml`.

### Accessing the Application

After starting the services, you can access the DApp in your web browser at:

```
http://localhost:3000
```

## Development and Testing

### Running Tests

To test the smart contracts, you can run:

```bash
truffle test
```

### Interacting with the Smart Contracts

After deploying the contracts with `truffle migrate`, you can interact with them using the Truffle console:

```bash
truffle console
```

## Troubleshooting

- **Connection Issues**: If `web` can’t connect to `ganache-cli`, make sure `ganache-cli` is running, and restart `web`.
- **Environment Variables**: Ensure `GANACHE_URL` is set to the correct URL.
