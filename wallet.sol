pragma solidity 0.8.10;

contract wallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
    
    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "not owner");
        owner.transfer(_amount);
    }

}
