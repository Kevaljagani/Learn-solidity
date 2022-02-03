//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Ownable {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function setNewOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "no zero address");
        owner = _newOwner;
    }

    mapping(address => uint) public balances;
    
    function getBalance() external returns(uint) {
        balances[msg.sender] = 100;
        return balances[msg.sender]; 
    }

    enum Status {
        none,
        packed,
        shipped,
        delivered
    }

    Status public status;

    function getStatus() view external returns(Status) {
        return status;
    }

    function setStatus(Status newStatus) external {
        status = newStatus;
    }

    function ship() external {
        status = Status.shipped;
    }

    function reset() external returns(Status) {
        delete status;
        return status;
    }

    
}
