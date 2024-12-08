const { defaultAccounts } = require('ethereum-waffle');

require('@nomiclabs/hardhat-waffle')

module.exports = {
  solidity: '0.8.0',
  networks: {
    ganache: {
      url: 'HTTP://127.0.0.1:8545',
      accounts: ['0x545f26b50bd8b18a50749f05c1ea83d814756f9030125b62687e0c196d867011']
    }
  }
};