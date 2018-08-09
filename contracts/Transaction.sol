pragma solidity ^0.4.24;
import "./ENFToken.sol";

//This contract would be deployed after ENFToken would be deployed
contract Transaction{
    address ENFadd;
    uint public amount;
    address public paidPerson;
    uint public time;
    ENFToken ENF;
/**
  * @dev Deploy contract after ENFToken is deployed, get ENFToken address
  * @param _enf ENFToken address
  */
    constructor(address _enf) public
    {
        ENFadd = _enf;
        ENF = ENFToken(ENFadd);

        
    }
 /**
  * @dev Start Timed Contract and store tokens in contract
  * @param _amount the amount of money that will be transfered in timed transaction
  * @param _to the address the ENF will be transfered to 
  * @param _timeInSeconds the time when the money can be redeemed
  */
    function startExchange(uint _amount,address _to, uint _timeInSeconds) public payable{
        amount = _amount;
        paidPerson = _to;
        time = now + _timeInSeconds * 1 seconds;
    }
/**
  * @dev Called when the time is over and the transaction can be processed
  */
    function transferBy() public payable{
        require(now >= time); //make sure funds are not paid before the time has elapsed
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
    function () external payable {
    }
    



}