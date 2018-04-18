const ERC20Basic = artifacts.require('./ERC20Basic.sol');

module.exports = (deployer) => {
  deployer.deploy(ERC20Basic, 300000000, 'Tonal Quantum Token', 18, 'TOQ');
};
