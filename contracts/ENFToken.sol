pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/BasicToken.sol";

contract ENFToken is BasicToken {
    string public name ="ENFToken";
    string public symbol="ENF";
    uint8 public decimals=8;
    uint public INITIAL_SUPPLY=500000000;
   
    

 /**
  * @dev Constructor of ENFToken, uses BasicToken
  */
    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        
    }
     /**
  * @dev returns total supply of ENf token
  */
    function getTotalSupply() public view returns(uint){
        return totalSupply_;
    }
   
   
}
