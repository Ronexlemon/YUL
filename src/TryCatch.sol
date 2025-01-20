// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
error LessThanFive(uint256 _num);
contract TryCatch{
    uint256 num =10;
    event LogResult(bool _result);
    event LogError(string _error);
    

    function setNewNumber(uint256 _newNumber)public {
        try this.checkIfNumberIsGreator(_newNumber) returns (bool result){
            emit LogResult(result);

        }
        catch Error (string memory _error) {
            emit LogError(_error);

        }
    }
     function checkIfNumberIsGreator(uint256 _num)external view  returns(bool){
        if (_num < 5){
            revert LessThanFive(_num);

        }

        return _num > num?true:false;
    }
   
}