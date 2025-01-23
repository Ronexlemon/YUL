// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Store{
    uint256 public numberOFItems;

    function updateNumberOfItems(uint256 _newNumber)external{
        numberOFItems=_newNumber;
    }
    function getNumberOfItems()external view returns(uint256){
        return numberOFItems;
    }
}