// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AdvancedStorage {
    uint[] public arr;

    function add(uint id) public {
        arr.push(id);
    }

    function get(uint index) public view returns (uint) {
        return arr[index];
    }

    function getAll() public view returns (uint[] memory) {
        return arr;
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }
}
