//SPDX-License-Identifier: mit
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Wrapper {
    ERC20 public tokenC;

    constructor(address _tokenC) {
        tokenC = ERC20(_tokenC);
    }

    function swap(address _token, uint amount) public returns (bool) {
        ERC20 token = ERC20(_token);
        require(token.transferFrom(msg.sender, address(this), amount));
        require(tokenC.transfer(msg.sender, amount));
        return true;
    }

    function unswap(address _token, uint amount) public returns (bool) {
        ERC20 token = ERC20(_token);
        require(tokenC.transferFrom(msg.sender, address(this), amount));
        require(token.transfer(msg.sender, amount));
        return true;
    }
}
