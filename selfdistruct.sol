pragma solidity ^0.8.5;


contract test {
    function a(address _addr, uint _x) external returns (uint) {
        test2(_addr).a(_x);
    }
}

contract test2 {
    uint public x;

    event Log(string message);
    function a(uint _x) external returns (uint){
        x = _x;
    }
}

contract Account {
    address owner;

    constructor(address _owner) payable {
        owner = _owner;
    }
}


contract AccountTwo {
    
    function a(address _owner) external {
        new Account(_owner);
    }
}

contract kill {

    constructor () payable {}
    function kills() external {
        selfdestruct(payable(msg.sender));
    }

    function tests() external pure returns(uint){
        return 123;
    }
}

contract attack {
    function getbalamnce() external view returns(uint) {
        return address(this).balance;
    }

    function kill(address _addr) external {
        kill(_addr).kills();
    } 
}
