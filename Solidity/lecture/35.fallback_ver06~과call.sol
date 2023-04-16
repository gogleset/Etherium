// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

// fallback 함수는 이름 그대로 대비책 함수 입니다. 
/*
특징 
1. 먼저 무기명 함수, 이름이 없는 함수입니다.
2. external 필수
3. payable

왜 쓰는가 ?
1. 스마트 컨트랙이 이더를 받을 수 있게 한다.
2. 이더 받고 난  후  어떠한 행동을 취하게 할 수 있다. 
3. call함수로 없는 함수가 불려질때, 어떠한 행동을 취하게 할 수 있다. 
call은 이더를 보내는것 말고도 외부 스마트 컨트랙의 함수를 부를 수 있다.

0.6 이후 fallback 

fallback은 recevie 와 fallback 으로 두가지 형태로 나뉘게 되었습니다.

1. receive:  순수하게 이더만 받을때 작동 합니다. 
2. fallback: 함수를 실행하면서 이더를 보낼때, 불려진 함수가 없을 때 작동합니다.


0.6 이후 
기본형 :  불려진 함수가 특정 스마트 컨트랙이 없을때 fallback 함수가 발동 합니다. 
fallback() external {
   
}

payable 적용시 : 이더를 받고 나서도 fallaback 함수가 발동합니다. 
fallback() external payable {
   
}

receive() external payable{
    
}

call :로우레벨 함수 
1. 송금하기
2. 외부 스마트 컨트랙 함수 부르기 
3. 가변적인 gas
4. 이스탄불 하드포크, 2019년 12월이후, gas 가격 상승에 따른,  call 사용 권장/ send tranfer = 2300gas 
5. re-entrancy(재진입) 공격위험 있기에, Checks_Effects_Interactions_pattern 사용  
*/



contract add{
    // 이벤트 등록
    event JustFallback(string _str);
    event JustReceive(string _str);
    // _num1+_num2를 리턴하는 순수함수
    function addNumber(uint256 _num1, uint256 _num2) public pure returns(uint256){
        return _num1 + _num2;
    }
    // call로 불려진 함수가 없을때
    // payable 이더를 받고 나서도 fallback 함수가 발동합니다. 
    fallback() external payable  {
     emit JustFallback("JustFallback is called");
    }
    // 순수하게 이더를 받을때만 동작하는 함수
    receive() external payable {
     emit JustReceive("JustReceive is called");
    }
}

contract caller{
    // 이벤트 등록
    event calledFunction(bool _success, bytes _output);
   
    //1. 송금하기 
    function transferEther(address payable _to) public payable{
        // 송금 성공시 true false 리턴
        // 여기선 함수를 부르지 않았으니 송금기능이다.
        (bool success,) = _to.call{value:msg.value}("");
        // 실패시 에러
        require(success,"failed to transfer ether");
    }
    
    //2. 외부 스마트 컨트랙 함수 부르기 
    function callMethod(address _contractAddr,uint256 _num1, uint256 _num2) public{
        
        // 외부 스마트 컨트랙트에 있는 함수를 부르기
        // 성공여부를 따지는 bool값과 리턴 값을 담은 byte가 들어있다.
        // abi는 이더리움 환경에서 스마트컨트랙을 상호작용하게 하는 표준이다.
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call(
            // abi.encodeWithSignature라는 메소드를 이용해 함수의 이름과 타입, 전해줄 value들을 보내주면 된다.
             abi.encodeWithSignature("addNumber(uint256,uint256)",_num1,_num2)
        );
              
        require(success,"failed to transfer ether");
        emit calledFunction(success,outputFromCalledFunction);
    }
    
    function callMethod3(address _contractAddr) public payable{
        
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call{value:msg.value}(
             abi.encodeWithSignature("Nothing()")
        );
              
        require(success,"failed to transfer ether");
        emit calledFunction(success,outputFromCalledFunction);
    }
}

