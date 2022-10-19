pragma solidity ^0.4.19;

contract constructor {

    address owner;    // current owner of the contract

    function TipJar() public{
        owner = msg.sender;
    }

    function withdraw() public {
        require(owner == msg.sender);
        msg.sender.transfer(address(this).balance);
    }

    function deposit(uint256 amount) public payable {
        require(msg.value == amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
pragma solidity ^0.4.19;

contract account {

    mapping(address => uint256) public balanceOf;   // balances, indexed by addresses

    function deposit(uint256 amount) public payable {
        require(msg.value == amount);

        balanceOf[msg.sender] += amount;     // adjust the account's balance
    }
}