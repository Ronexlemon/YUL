// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract StoreYul{
    uint256 public numberOFItems;

    function updateNumberOfItems(uint256 _newNumber)external{
        //numberOFItems=_newNumber;
        assembly{
        sstore(numberOFItems.slot,_newNumber)
        }
    }
    function getNumberOfItems()external view returns(uint256 _result){
        //return numberOFItems;
        assembly {
            _result := sload(numberOFItems.slot)
        }
    }
    function resetNumber()external{
        numberOFItems =0;
    }
    function square()external{
        numberOFItems=numberOFItems *numberOFItems;
    }
}