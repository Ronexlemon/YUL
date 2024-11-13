// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Variable{

    function yul_let()public pure returns(uint256 z){
        assembly {
            let x := 10
            z:= mul(x,z)
            
        }
    }
}