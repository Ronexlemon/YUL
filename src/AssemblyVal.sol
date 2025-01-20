// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract AssemblyVariable{
    //variable
    function squareOfAnumber(uint256 _num)public pure returns(uint256 z){
        assembly{
            z:=mul(_num,_num)
        }
    }
    function squareAndaddFive(uint256 _num)public pure returns(uint256 z){
        assembly{
            let c:=5
            z:= add(mul(_num,_num),c)

        }
    }
    function squareAnddivideByTwo(uint256 _num)public pure returns(uint256 result,uint256 square){
        assembly{
            let c:=2
            square:=mul(_num,_num)
            result:=div(square,c)
        }
    }
    function powerOfAnumber(uint256 _num,uint256 _power)public pure returns(uint256 _result){
        assembly{
            if eq(_power,0){
                _result:=1
            }
            let c:=0
            let newNum:=1

           for {} lt(c, _power) {}{
            newNum := mul(newNum,_num)
            c:=add(c,1)

           }
           _result :=newNum
            
        }
    }
}