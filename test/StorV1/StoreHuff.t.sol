// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2 ;


import {Base_TestV1_Store,Store} from "./Base_Test_Store.t.sol";
import {HuffDeployer} from "foundry-huff/HuffDeployer.sol";


contract StoreSolcHuff is Base_TestV1_Store{
    string public constant STORE_HUFF_LOCATION = "store/Store";
    function setUp() public override{
        store = Store( HuffDeployer.config().deploy(STORE_HUFF_LOCATION));
        
    }
    

}