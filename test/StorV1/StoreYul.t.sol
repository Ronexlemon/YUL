// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2 ;


import {Base_TestV1_Store,Store,IStore} from "./Base_Test_Store.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";
import {StoreYul} from "../../src/store/StoreYul.sol";


contract StoreSolcYul is Base_TestV1_Store{
   
    function setUp() public override{
        store = IStore(address(new Store()));
        
    }
    

}