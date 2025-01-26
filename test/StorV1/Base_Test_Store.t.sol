//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;

import {Store} from "../../src/store/Store.sol";
import {Test,console2} from "forge-std/Test.sol";
abstract contract Base_TestV1_Store is Test{
    Store public store;
 function setUp()public virtual{
    store = new Store();
 }
    
function test_readValue()public view{
    uint256 val = store.getNumberOfItems();
    assertEq(val, 0);
}
function test_setNumber()public{
    store.updateNumberOfItems(10);
    uint256 val = store.getNumberOfItems();
    assertEq(val, 10);
}
}