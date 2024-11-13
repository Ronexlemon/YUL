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

    //conditional

   function yul_condition(uint256 _num) public pure returns (uint256 _result) {
    assembly {
        
        // Check if _num is non-zero
        if _num {
            _result := add(_num, 1)
        } 
        // Otherwise, set _result to 0
        if iszero(_num) {
            _result := 0
        }
    }
}

}

