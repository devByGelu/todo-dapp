// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Todo {
  struct STodo {
    bytes32 description;
  }

  mapping(address => STodo[]) public todos;

  constructor() public {}

  function addTodo(bytes32 description) public returns (uint256 addedIndex) {
    todos[msg.sender].push(STodo(description));
    return todos[msg.sender].length;
  }

  function remove(uint256 index) public returns (uint256 newLength) {
    delete todos[msg.sender][index];
    return todos[msg.sender].length;
  }

  function getTodos() public view returns (bytes32[] memory ret) {
    STodo[] memory t;
    t = todos[msg.sender];
    bytes32[] memory data = new bytes32[](t.length);
    for (uint256 index = 0; index < t.length; index++) {
      data[index] = t[index].description;
    }
    ret = data;
  }
}
