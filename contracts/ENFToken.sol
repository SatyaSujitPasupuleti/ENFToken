pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract ENFToken is StandardToken {
    string public name ="ENFToken";
    string public symbol="ENF";
    uint8 public decimals=8;
    uint public INITIAL_SUPPLY=500000000;
    


    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        
    }
}
