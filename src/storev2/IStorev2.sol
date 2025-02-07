// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


interface IStorev2 {
  

    function feedHorse(uint256 _id)external;

    
    function isHappyHorse(uint256 _id)external returns(bool);
    
}