//SPDX-License-Identifier: MIT

pragma solidity 0.8.10;

contract proxy {

    event Deploy(address);
    function deploy(bytes memory _code) external payable returns(address addr){
        assembly {
            addr := create(callvalue(), add(_code, 0x20), mload(_code));
        }
        emit Deploy(addr);
    }
}
