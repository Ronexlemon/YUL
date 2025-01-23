//SPDX-License-Identifier:MIT
pragma solidity ^0.8.2;

contract Receiver{
    event Received(address caller,uint256 amount,string message);
    fallback() external payable { 
emit Received(msg.sender,msg.value,"fallback was called");
    }
    receive() external payable{}

    function foo(string memory _message,uint256 _x)public payable returns(uint256){
        emit Received(msg.sender, msg.value, _message);
        return _x;
    }
    
}

contract Caller{
    event Response(bool success,bytes data);
    function testCallFoo(address payable _addr)public payable {
        (bool success,bytes memory data) = _addr.call{value:msg.value}(abi.encodeWithSignature("foo(string,uint256)", "Call foo",123));
        emit Response(success, data);
    }

    //calling a function that does not exists

    function testCallDoesNotExist(address payable _addr)public payable{
        (bool success,bytes memory data)= _addr.call{value:msg.value}(abi.encodeWithSignature("doesNotExits(string,uint256)", "does not exists",1234));
        emit Response(success, data);
    }
}