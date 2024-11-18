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
    
    //memory Operation
    //mload -> loads  32 bytes of data from a specific location
    function mLoad()public view returns(bytes32 z){
        assembly {
            //load the free memory pointer space 128 i decimal -> 0x80 in hex
            let freeMem:=mload(0x80)
            //store 20 at 0x80
            mstore(freeMem,20)
            //load 32 bytes from 0x80
            z:=mload(freeMem)
            
        }
    }
    /****
     * Storage operations
     * sload -> loads data from a storage slot
     * store -> store a value at a slot
     */
    function sLoad()public view returns(bytes32 z,bytes32 b){
        assembly {
            //load from slot 0
            let data := sload(0)
            //load from slot 1
            let data2 := sload(1)
            //store data and data2 in z and b
            z:=data
            b:=data2
            
            
        }
    }
    function sStore()public  returns(bytes32 z){
        assembly {
            //store 128 at slot 2
             sstore(2,128)
            //return the value of v
            z:= sload(2)
        }
    }
    /*****8
     * Comparison and bitWise
     */
    function lessThanOrEqualTo(uint256 a, uint256 b)public pure returns(uint256 result,uint256 resultb){
        assembly {
            //if a<b then result = 1 else result = 0
            result := lt(a,b)
            resultb := eq(a,b)
        }
    }
    /****
     * Environment Operation
     */
    function calleR()public view returns(address _caller){
        assembly {
            //get the address of the caller
            _caller:= caller()
        }
    }

    /*****
     * Control
     */
    function callCallData()public view returns(bytes4 result){
        assembly {
            let b := calldataload(0)
            result := b
        }
    }
    /*****
     * Return Address
     */
    function addressThis()public view returns(address  _contract){
        assembly {
            //get the address of the contract
            _contract:= address()
        }
    }

}

