var Transaction = artifacts.require("Transaction");

//Test #1 Succeeds
contract('Transaction', function(accounts) {
    it("should store the amount,address and time" , function() {
        var account_one = accounts[0];
        var account_two = accounts[1];
        var trans;
        var amount_contract, reciever_contract,time_contract;
        return Transaction.deployed().then(function(instance) {
            trans=instance;
            return instance.startExchange.call(10,account_two,20,{from:account_one}); 
        }).then(function(amount){
            amount_contract = amount.toNumber();
        }).then(function(PaidPerson){
            reciever_contract = PaidPerson.toString();
        }).then(function(time){
            time_contract = time.toNumber();
        }).then(function(instance){
            assert.equal(amount_contract,10,"Amount was not equal to 10");
            assert.equal(reciever_contract,account_two,"address was not equal to 10");
            assert.equal(time_contract,20,"Time was not equal to 10");
    });

    
});



});