 // SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import {Test, console} from "forge-std/Test.sol";

import {Yul} from "../src/Yul.sol";

contract YulTest is Test {
   
    Yul public yul;

    function setUp() public {
        
         yul = new Yul();
       
    }

   
     function test_multipication()public view{
        uint256 z = yul.yul_let();
        console.log(z);
        assertEq(z,200);       
              
    }
    //conditional teting

    function test_condition()public view{
    uint256  _result = yul.yul_condition(1);
        console.log(_result);
        assertEq(_result, 2);
    }
    //conditio test fuzz
    function testFuzz_condition(uint256 x)public view{
        uint256  _result = yul.yul_condition(x);
        console.log(_result);
      uint256 expected;
    if (x == type(uint256).max) {
        expected = 0; // Since adding 1 to max uint256 will overflow and we expect 0 as per the function’s logic
    } else if (x != 0) {
        expected = x + 1;
    } else {
        expected = 0;
    }
        assertEq(_result, expected);
        
    }
    //for loop 3 => 1+2+3 = 6 ,1+2+3+4 =10 , 1+2+3+4+5 =15

    function test_addtion()public view{
        uint256 result = yul.yul_forLoop_sum(3);
        console.log(result);
        assertEq(result, 6);
    }
    function test_square()public view{
        uint256 result = yul.yul_square(5);
        console.log(result);
        assertEq(result, 25);
    }
    
    //revert error
    function testFail_revert()public {
        vm.expectRevert();
        yul.yul_error(2);
        }
    function test_error()public{
        vm.expectRevert();
        yul.yul_error(20);

    }

    function test_power()public {
        uint256 result = yul.power(10, 4);
        assertEq(result, 10000);
    }
   
   function test_loadMemory()public{
    bytes32 mem = yul.loadMemory();
    //console.log(mem);
    assertEq(mem, bytes32(uint256(0x80)));
   }
   /*****
    * Memory
    */
   function test_msload_mstore()public view{
    bytes32 z = yul.mLoad();
   
   assertEq(z,bytes32(uint256(0x14))); //that is 20 in decimal
   

   }
   /***
    * Storage
    */

   function test_sload()public view{
    bytes32 z;
bytes32 b;
    (z,b) = yul.sLoad();
    assertEq(z,bytes32(uint256(0x0a))); //we have 10 in decimal which is a in hexdecimal
    assertEq(b,bytes32(uint256(0x00))); //we have nothing
   }
   function test_sstore()public{
    bytes32 z = yul.sStore();
    assertEq(z,bytes32(uint256(0x80))); //we have 128 which is hex 0x80
   }
   /****
    * Comparison and bitwise
    * 
    */
   function test_lessThan_EqualTo()public view{
    uint256 a;
    uint256 b;
    (a,b) = yul.lessThanOrEqualTo(10, 20);
    assertEq(a, 1);
    assertEq(b, 0);
   }

   /*****
    * Environmental Variables
    */
   function test_caller()public view{
    address _caller = yul.calleR();
    console.log(_caller);
    assertEq(_caller, address(this));
   }
   /***
    * Control and operation
    */
   function test_calldataload_functionSelector()public view{
    bytes4 z = yul.callCallData();
    assertEq(z,bytes4(keccak256("callCallData()")));

   }

   function test_contract_address()public view{
    address z= yul.addressThis();
    assertEq(z,address(yul));
   }

   
}
