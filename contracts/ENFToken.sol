pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/BasicToken.sol";

contract ENFToken is BasicToken {
    string public name ="ENFToken";
    string public symbol="ENF";
    uint8 public decimals=8;
    uint public INITIAL_SUPPLY=500000000;
    


    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        
    }
    function getTotalSupply() public returns(uint){
        return totalSupply_;
    }
   
}
