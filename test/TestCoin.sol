pragma solidity ^0.4.24;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/ENFToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
contract TestCoin{
    ENFToken ENF = ENFToken(DeployedAddresses.ENFToken());
    constructor() public{

    }
   
    function testBalance() public{
        uint256 returnedBalance = ENF.balanceOf(msg.sender);
        uint256 expectedBalance = 500000000;
        Assert.equal(returnedBalance,expectedBalance,"Owner has 500 million ENF tokens");

    }//success
    //gives error because only owner can call it
    function testTransfer() public payable{
        address testAddress = 0x994d9587AF083850B5205deb51211A415825be27;
        ENF.transfer(testAddress,5);
        uint returnedBalance = ENF.balanceOf(testAddress);
        uint expectedBalance = 5;
        Assert.equal(returnedBalance,expectedBalance,"Address has 50 ENF tokens");

    }
    //gives error because only owner can call it
    function testTransferFromAccounts() public payable{
        address testAddress = 0xb124A4AABbFEb88F42999eC93aeb37288b42D140;
        address testAddress2 = 0xa4427151826A48b586C8FD0D247582424a530946;
       // ENF.transfer(testAddress,500);
       // ENF.transfer(testAddress2,500);
        ENF.transferFrom(testAddress,testAddress2,5);
        uint returnedBalance = ENF.balanceOf(testAddress2);
        uint expectedBalance = 505;
        Assert.equal(returnedBalance,expectedBalance, "Address has 55 ENF tokens");
        

    }

}