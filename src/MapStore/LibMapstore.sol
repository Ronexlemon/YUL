// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


library LibMapStore{

    function generateId(address _member,uint256 _id)external pure returns(bytes32){
        return keccak256(abi.encodePacked(_member,_id));
    }
}