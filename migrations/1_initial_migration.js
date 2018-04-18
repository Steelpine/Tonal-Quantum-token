const TonalQuantum = artifacts.require('./TonalQuantum.sol');

module.exports = (deployer) => {
  deployer.deploy(TonalQuantum);
};
