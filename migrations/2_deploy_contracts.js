var ENFToken = artifacts.require("ENFToken");
var Transactions = artifacts.require("Transaction.sol");
module.exports = function(deployer) {
  deployer.deploy(ENFToken).then(function() {
    return deployer.deploy(Transactions, ENFToken.address)
  });
};
