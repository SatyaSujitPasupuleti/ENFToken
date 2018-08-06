var ENFToken = artifacts.require("ENFToken");

module.exports = function(deployer) {
  deployer.deploy(ENFToken);
};
