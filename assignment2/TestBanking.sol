pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Bankingnew.sol";

contract TestBanking {
    // The address of the adoption contract to be tested
    Bankingnew banking = Bankingnew(DeployedAddresses.Bankingnew());

    // The Initial expected balance
    uint expectedInitBalance = 0;

    // The amount of currency that will be used for depositing
    uint expectedDeposit = 150;

    // The amount of currency that will be used for withdrawing
    uint expectedWithdraw = 90;

    // The balance expected after a 90 withdraw
    uint expectedBalance = 60;

    //The expected owner of the account in this contract
    address expectedAdopter = address(this);

    //The expected answer of functions
    string answer = "successful";

    function testCreateAccount() public {
        string memory returnedValue = banking.createAccount();

        Assert.equal(returnedValue, answer, "The creation of a new account should be successful");
    }

    function testInitialBalance() public {
        uint balance = banking.checkBalance();

        Assert.equal(balance, expectedInitBalance, "Balance should start at 0");
    }

    function testDeposit() public {
        string memory returnedValue = banking.deposit(expectedDeposit);

        Assert.equal(returnedValue, answer, "Depositing currency should be successful");
    }

    function testWithdraw() public {
        string memory returnedValue = banking.withdraw(expectedWithdraw);

        Assert.equal(returnedValue, answer, "Withdrawing currency should be successful");
    }

    function testBalance() public {
        uint balance = banking.checkBalance();

        Assert.equal(balance, expectedBalance, "Balance should reflect recent withdrawal");
    }

}