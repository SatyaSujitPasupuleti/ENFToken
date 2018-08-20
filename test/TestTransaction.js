var ENFToken = artifacts.require("ENFToken");
var Transaction = artifacts.require("Transaction");
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

//change to regular
contract('Transaction', async(accounts)=> {
    it("Should start exchange properly", function() {
        var Account, trans;
        return ENFToken.deployed().then(function(instance) {
          return instance.balanceOf.call(accounts[0]); //500 million ENF in ENF contract
          Account=accounts[0];
        }).then(async function(balance){
          return Transaction.deployed().then(function(instance){
              instance.startExchange.call(10,accounts[1],1,{from:accounts[0]});
             trans=instance;

          }).then(async function(done){
            await delay(50000);
             await trans.transferBy();
             
             
             // this.timeout(30000); //timeout function for 10 seconds 
             //call transferBy
             //check balance of account[0]/account[1] after it is done
              
            
            

          });
  
        });

    });

});