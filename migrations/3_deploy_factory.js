const BasicToken =
  artifacts.require('./BasicToken.sol');

module.exports = (deployer) => {
  deployer.deploy(BasicToken);
};
