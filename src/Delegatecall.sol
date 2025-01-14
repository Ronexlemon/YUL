// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2 ;


contract B{
    uint256 public num;
    address public  sender;
    uint256 public value;

    function setVars(uint256 _num)public payable{
        num =_num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract A{
     uint256 public num;
    address public  sender;
    uint256 public value;

    event DelegateCallResponse(bool success,bytes data);
    event CallResponse(bool success,bytes data);

    //set vars using Delegate call

    function setVarsDelegateCall(address _contract,uint256 _num)public payable{

        (bool success,bytes memory data)= _contract.delegatecall(abi.encodeWithSignature("setVars(uint256)", _num));
        emit DelegateCallResponse(success,data);

    }

    //call with call

    function setVarsCall(address _contract,uint256 _num)public payable{
        (bool success,bytes memory data) = _contract.call{value:msg.value}(abi.encodeWithSignature("setVars(uint256)", _num));
        emit CallResponse(success, data);
    }

}