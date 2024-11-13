// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Yul{

    function yul_let()public pure returns(uint256 z){
        assembly {
            let x := 10
            let total := mul(x,20)
            z:= total

        }
    }
}