// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Simple {
    uint32 balance;

    struct Tool {
        uint32 price;
        address owner;
    }

    mapping(string => Tool) tools;

    constructor() public {
        balance = 100;
    }

    function askFor(string memory what) public {
        require(tools[what].price <= balance);
        balance -= tools[what].price;
        tools[what].owner = msg.sender;
    }

    function getTool(string memory what) public view returns (uint32, address) {
        return (tools[what].price, tools[what].owner);
    }
}
