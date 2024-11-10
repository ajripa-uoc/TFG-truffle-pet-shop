module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      url: process.env.GANACHE_URL || "http://ganache:8545",
      network_id: "*" // Match any network id
    },
    develop: {
      port: 7545
    }
  }
};
