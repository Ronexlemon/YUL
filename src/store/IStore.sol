// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface  IStore {
     function updateNumberOfItems(uint256 _newNumber)external;  
    
    function getNumberOfItems()external  view returns(uint256);
    function resetNumber()external;
    function square()external;
    
}