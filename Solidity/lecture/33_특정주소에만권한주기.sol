// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

// payable을 생성자에 넣을때
// 특정 주소에게만 권한 주기


contract MobileBanking{
    // 주소 변수
    address owner;

    // 토큰과 상호작용 시 payable 키워드
    constructor() payable{
        owner = msg.sender;
    }
    
    // 에러핸들링
    modifier onlyOwner{
        require(msg.sender == owner, "Only Owner!");
        _;
    }
    
    // 이벤트 등록
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to,uint256 _value);
   
    // 어디서든 접근가능한 이더리움 보내는 함수.
    function sendEther(address payable _to) public onlyOwner payable {
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);    
        emit SendInfo(msg.sender,(msg.sender).balance);
    }

    // 어디서든 접근 가능한 값을 보는 함수.
    function checkValueNow() public onlyOwner {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }
    
    // 어디서든 접근 가능한 
    function checkUserMoney(address _to) public onlyOwner {
        // msg.sender는 스마트 컨트랙트를 사용하는 주체, 파라미터 _to, _to의 현재 계좌 잔액
        emit CurrentValueOfSomeone(msg.sender,_to ,_to.balance);
    }
    
}








