pragma solidity ^0.4.24;
import "./ENFToken.sol";

//This contract would be deployed after ENFToken would be deployed
contract Transaction{
    address ENFadd;
    uint public amount;
    address public paidPerson;
    uint public time;
    ENFToken ENF;
    bool inDispute=false;
    address owner;
/**
  * @dev Deploy contract after ENFToken is deployed, get ENFToken address
  * @param _enf ENFToken address (used in migrations)
  */
    constructor(address _enf) public
    {
        ENFadd = _enf;
        ENF = ENFToken(ENFadd);
        owner = msg.sender;

        
    }
 /**
  * @dev Start Timed Contract and store tokens in contract
  * @param _amount the amount of money that will be transfered in timed transaction
  * @param _to the address the ENF will be transfered to 
  * @param _timeInSeconds the time when the money can be redeemed
  */
    function startExchange(uint _amount,address _to, uint _timeInSeconds) public payable{
        //require(msg.value = amount); 
        amount = _amount;
        paidPerson = _to;
        time = now + _timeInSeconds * 1 seconds;
    }
/**
  * @dev Called when the time is over and the transaction can be processed
  */
    function transferBy() public payable{
        require(now >= time); //make sure funds are not paid before the time has elapsed
        require(inDispute = false); //prevents web3 from calling when the transaction is in dispute
        ENF.transfer(paidPerson,amount); //after time has elapsed web3.js will call this function 
    }
    function getAmount() public view returns(uint) {
        return amount;
    }
    function getAddress() public view returns(address){
        return paidPerson;
    }
    function getTime() public view returns(uint){
        return time;
    }
    /**
  * @dev Called by interface when Owner wants to dispute contract
  */
    function setDispute() public{
        require(msg.sender==owner); //only owner can call this function
        require(now <= time); //owner can only call function before time is done
        inDispute = true;

    }
    /**
  * @dev Called after the disputers decide who won the dispute
  * @param disputers the majority voters of the dispute
  * @param DisputeWinnerIsOwner the winner of the dispute as decided by the disputers. 
  * True if the owner (brand) is the winner, false if the influencer is the winner
  */

    function resolve(address[] disputers,bool DisputeWinnerIsOwner,uint amount_disputers) public{
        //called by web3 after voters dispute the transaction
       
        //give 10% of the amount to the disputers
        amount = amount - amount_disputers;
        for(uint i = 0;i < disputers.length; i++ ){
            ENF.transfer(disputers[i],amount_disputers);

        }
        if(DisputeWinnerIsOwner == true) 
        {
            ENF.transfer(owner,amount);
        }
        else{
            ENF.transfer(paidPerson,amount);
        }
        

    }

    function () external payable {
    }
    



}