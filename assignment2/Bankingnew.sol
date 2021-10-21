pragma solidity ^0.5.0;

contract Bankingnew {

    mapping(address => uint) accounts;

    function createAccount() public returns (string memory) {
        require(msg.sender != address(0x0));
        accounts[msg.sender] = 0;
        return "successful";
    }

    function createAccount(address adr) public returns (string memory) {
        require(adr != address(0x0));
        accounts[adr] = 0;
        return "successful";
    }

    function checkBalance() public view returns (uint) {
        return accounts[msg.sender];
    }

    function deposit(uint amount) public returns (string memory) {
        require(amount > 0);
        accounts[msg.sender] = accounts[msg.sender] + amount;
        return "successful";
    }

    function withdraw(uint amount) public returns (string memory) {
        require(amount > 0 && amount <= accounts[msg.sender]);
        accounts[msg.sender] = accounts[msg.sender] - amount;
        return "successful";
    }
}