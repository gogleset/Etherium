// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
 public : 모든곳에서 접근 가능
 external : public 처럼 모든 곳에서 접근 가능하나, exteranal 이 정의된 자기자신의 스마트컨트랙트에선 접근 불가
 private: 오직 private이 정의된 자기자신의 스마트컨트랙에서만 가능( private이 정의된 현재 이 컨트랙을 상속받은 자식 컨트랙도 접근불가)
 interal : private 처럼 오직 internal이 정의된 자기자신의 스마트컨트랙에서도 가능(internal이 정의된 현재 이 컨트랙을 상속받은 자식 컨트랙도 접근가능) - 기본값
*/

/*
    function 이름() public { // (public,private,internal,external) 접근 제한자 변경가능 
        // 내용
    }
*/

contract lec5{
    
    //1.public
    uint256 public a = 3;
    
    //2.private
    uint256 private a2 = 5;

}


contract Public_example {
    // 모든 곳에서 접근 가능
    uint256 public a = 3;

    // 모든 곳에서 접근 가능, a의 밸류를 받아서 바꿔주는 함수
    function changeA(uint256 _value) public  {
        a =_value;
    }
    // 모든 곳에서 접근 가능, a의 값을 보여주는 함수
    function get_a() view public returns (uint256)  {
        return a;
    }
}

contract Public_example_2 {
    // public_example 인스턴스화
    Public_example instance = new Public_example();

    //모든 곳에서 접근 가능, 상속받은 instance의 changeA에 접근하여 값을 바꿔주는 함수
    function changeA_2(uint256 _value) public{
      instance.changeA(_value);
    }

    //모든 곳에서 접근 가능, 상속받은 instance의 get_a에 접근하여 값을 보여주는 함수
    function use_public_example_a() view public returns (uint256)  {
        return instance.get_a();
    }
}

contract private_example {
    // 자기 컨트랙트 내에서만 접근 가능
    uint256 private a = 3;
    
    // 모든 곳에서 접근 가능, a의 값을 보여주는 함수
    function get_a() view public returns (uint256)  {
        return a;
    }

}

contract external_example {
    // 자기 컨트랙트 내에서만 접근 가능
    uint256 private a = 3;
    
    // 모든 곳에서 접근 가능하지만, 자기 자신의 컨트랙트 내에선 접근 불가
    function get_a() view external returns (uint256)  {
        return a;
    }

}

contract external_example_2 {
    // external_example 상속받은 instance
    external_example instance = new external_example();

    // 
    function external_example_get_a() view public returns (uint256)  {
        return instance.get_a();
    }
}
