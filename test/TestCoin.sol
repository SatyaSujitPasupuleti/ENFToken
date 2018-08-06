pragma solidity ^0.4.24;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ENFToken.sol";
contract TestCoin{
    ENFToken ENF = ENFToken(DeployedAddresses.ENFToken());
    constructor() public{

    }
   
    function testBalance() public{
        uint256 returnedBalance = ENF.balances[msg.sender];
        uint256 expectedBalance = 500000000;
        Assert.equal(returnedBalance,expectedBalance,"Owner has 500 million ENF tokens");

    }
    function testTransfer() public{
        address testAddress = 0x5fe3062B24033113fbf52b2b75882890D7d8CA54;
        ENF.transfer(testAddress,50);
        uint returnedBalance = ENF.balances[testAddress];
        uint expectedBalance = 50;
        Assert.equal(returnedBalance,expectedBalance,"Address has 50 ENF tokens");

    }
    function testTransferFromAccounts() public{
        address testAddress = 0x083c41ea13af6c2d5aaddf6e73142eb9a7b00183;
        address testAddress2 = 0x5fe3062B24033113fbf52b2b75882890D7d8CA54;
        ENF.transfer(testAddress,50);
        ENF.transfer(testAddress2,50);
        ENF.transferFrom(testAddress,testAddress2,5);
        uint returnedBalance = ENF.balances[testAddress];
        uint expectedBalance = 55;
        Assert.equal(returnedBalance,expectedBalance, "Address has 55 ENF tokens");
        

    }

}