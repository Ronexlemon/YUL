// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "./LibMapstore.sol";


contract MapStore{
    using LibMapStore for address;
   
   uint256  public  id;

    struct Member{
        address _member;
        bytes32 _memberId;
        uint256 _id;
    }

    event Register(address indexed _member,bytes32 id, uint256 memberId);

 

    mapping(uint256 => Member)public member;

    function register()external{
        require(msg.sender != address(0),"Address cannot be zero");
        uint256 _idforMember  = id;
        bytes32 _generatedId = msg.sender.generateId(_idforMember);
        member[_idforMember] = Member({_member:msg.sender,_memberId:_generatedId,_id:_idforMember});
        emit Register(msg.sender, _generatedId, _idforMember);
    }

    function getMember(uint256 _id)external view returns(Member memory){
        return member[_id];
    }
}