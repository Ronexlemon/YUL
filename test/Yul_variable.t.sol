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
}
