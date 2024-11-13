 // SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import {Test, console} from "forge-std/Test.sol";

import {Yul} from "../src/Yul.sol";

contract YulTest is Test {
   
    Yul public yul;

    function setUp() public {
        
         yul = new Yul();
       
    }

   
     function test_multipication()public{
        uint256 z = yul.yul_let();
        console.log(z);
        assertEq(z,200);       
              
    }
    //conditional teting

    function test_condition()public{
    uint256  _result = yul.yul_condition(1);
        console.log(_result);
        assertEq(_result, 2);
    }
    //conditio test fuzz
    function testFuzz_condition(uint256 x)public{
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
}
