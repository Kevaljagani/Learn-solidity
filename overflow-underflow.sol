pragma solidity 0.6.10;

contract test {

    mapping(address => uint) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint){
        return balances[msg.sender];
    }


    function getBalanceContract() public view returns(uint){
        uint256 contractBalance = address(this).balance;
        return contractBalance;
    }

    function withdraw() public payable returns(uint){
        balances[msg.sender] -= msg.value;
    }

    function kill() public {
        selfdestruct(payable(msg.sender));
    }
} 
