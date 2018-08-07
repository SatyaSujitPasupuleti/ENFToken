pragma solidity ^0.4.24;
import "./ENFToken.sol";

//This contract would be deployed after ENFToken would be deployed
contract Transaction{
    address ENFadd;
    uint amount;
    address paidPerson;
    uint time;
    ENFToken ENF;
   
    constructor(address _enf) public
    {
        ENFadd = _enf;
        ENF = ENFToken(ENFadd);

        
    }
    function startExchange(uint _amount,address _to, uint _timeInSeconds) public{
        amount = _amount;
        paidPerson = _to;
        time = now + _timeInSeconds * 1 seconds;
    }
    
    function transferBy() public{
        require(now >= time); //make sure funds are not paid before the time has elapsed
        ENF.transferFrom(msg.sender,paidPerson,amount); //after time has elapsed web3.js will call this function 
    }
    



}