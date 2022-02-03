pragma solidity ^0.8.10;

contract test {
    string public mystring = "Helloworld";

    // value types and reference types 

    //valuewtypes
    bool public b = true;
    int public q = -123;
    uint public c = 123; 
    int public d = type(int).max;

    function add (uint x, uint y) external pure returns(uint) {
        return x+y;
    }

    //state variable (store data on bc)
    uint public statevariable = 123;

    //local variable (inside fun not saved on bc)
    function foo() external pure returns(uint) {
        uint notState = 1234;
        return notState;
    }

    //global vars -----------------?
    //view vs pure-----------------?
    function globalVars() external view returns(address, uint, uint){
        address sender = msg.sender;
        uint timeStamp = block.timestamp;
        uint blockNum = block.number;
        return (sender, timeStamp, blockNum);
    }

    uint public num;
    





}
