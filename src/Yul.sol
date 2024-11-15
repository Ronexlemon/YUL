// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Yul{
    uint256 marks =10;

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

//loop
//for

function yul_forLoop_sum(uint256 _num)public pure returns(uint256 _total){
    assembly {
        for{let i:=0} iszero(gt(i, _num)){i:=add(i,1)}{_total := add(_total,i)}
    }
}
//square
function yul_square(uint256 _num)public pure returns(uint256 _result){
    assembly {
        _result := mul(_num,_num)
    }
}
 //error
    function yul_error(uint256 _num)public pure{
        assembly {
            if gt(_num,10) {revert(0,0)}
            
        }
    }

    //power
    function power(uint256 base,uint256 exponent)public returns(uint256 result){
        assembly {
            switch exponent
            case 0 {result := 1}
            case 1 {result :=base}
            default{
                result :=1
                for {let i:=0} lt(i,exponent) {i:=add(i,1)}{
                    result := mul(result,base)
                }
            }
            
        }
    }
    //loadmemory
    function loadMemory()public returns(bytes32 mem){
        assembly {
            mem:= mload(0x40)
        }
    }

}

