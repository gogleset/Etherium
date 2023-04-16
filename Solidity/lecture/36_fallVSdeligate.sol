// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
/*
Call vs Delegate call
Delegate call: 
1. msg.sender 가 본래의 스마트컨트랙 사용자를 나타낸다 
2. delegate call이 정의된  스마트 컨트랙(즉caller)이 외부 컨트랙의 함수들들 마치 자신의 것 처럼 사용(실질적인 값도 caller애 저장) 
조건 
외부 스마트컨트랙과 caller 스마트컨트랙은 같은 변수를 갖고 있어야 한다.   

why?
upgradable smart contract 용도 

https://www.youtube.com/watch?v=NnZ0KOy2yJY 이거 보는 게 좋음 진짜
*/




contract add{
    // 조건 
    // 외부 스마트컨트랙과 caller 스마트컨트랙은 같은 변수를 갖고 있어야 한다.   
    uint256 public num = 0;
    event Info(address _addr,uint256 _num);
    
    function plusOne() public {
        num = num + 1;
        emit Info(msg.sender,num);
    }    
}

contract caller{
    // 조건 
    // 외부 스마트컨트랙과 caller 스마트컨트랙은 같은 변수를 갖고 있어야 한다.   
    uint256 public num = 0;
    // 외부함수 부르는 함수(call)
    function callNow(address _contractAddr) public payable{
        // call이기때문에 call 자체의 변수에 접근한다.
        (bool success,) = _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }

    // 외부함수 부르는 함수(delegatecall)
    function delcateCallNow(address _contractAddr) public payable{
        // 이 스마트 컨트랙트의 자체 변수 num이 바뀌어야 한다. delegatecall
        (bool success,) = _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }
}
 