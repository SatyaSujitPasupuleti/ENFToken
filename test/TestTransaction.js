var ENFToken = artifacts.require("ENFToken");
var Transaction = artifacts.require("Transaction");



contract('Transaction', async(accounts)=> {
    it("Should start exchange properly", function() {
        var Account, trans;
        return ENFToken.deployed().then(function(instance) {
          return instance.balanceOf.call(accounts[0]); //500 million ENF in ENF contract
          Account=accounts[0];
        }).then(function(balance){
          return Transaction.deployed().then(function(instance){
              instance.startExchange.call(10,accounts[1],20,{from:accounts[0]});
             trans=instance;

          }).then(function(done){
              this.timeout(30000);
              
            
            

          });
  
        });

    });

});