// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract functionSelector{

    function getSelector(string memory _func)public pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}