pragma solidity ^0.4.24;
import "ENFToken.sol";
//This contract would be deployed after ENFToken would be deployed
contract TimedTransaction is ENFToken{
    Token public ENFToken= Token(0x0A); //get the token address after deployment
    uint amount;
    address paidPerson;
    double time;
    //Assume
    constructor(uint _amount,address _to, double _timeInSeconds) public
    {
        amount = _amount;
        paidPerson = _to;
        time = now + _timeInSeconds * 1 seconds;
        
    }
    
    function transferBy() public{
        require(now >= time); //make sure funds are not paid before the time has elapsed
        ENF.transferFrom(msg.sender,paidPerson,amount); //after time has elapsed web3.js will call this function 
    }
    



}