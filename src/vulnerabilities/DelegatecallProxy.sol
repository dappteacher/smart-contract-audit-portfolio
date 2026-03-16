// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DelegatecallProxy {

    address public implementation;
    address public owner;

    constructor(address _impl) {
        implementation = _impl;
        owner = msg.sender;
    }

    function upgrade(address newImpl) external {

        require(msg.sender == owner, "not owner");

        implementation = newImpl;
    }

    function execute(bytes calldata data) external payable {

        (bool success,) = implementation.delegatecall(data);

        require(success);
    }

}