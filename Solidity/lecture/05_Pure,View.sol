// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
    function 이름() public { // (public,private,internal,external) 접근 제한자 변경가능 
        // 내용
    }
*/

/*
 public : 모든곳에서 접근 가능
 external : public 처럼 모든 곳에서 접근 가능하나, exteranal 이 정의된 자기자신의 스마트컨트랙트에선 접근 불가
 private: 오직 private이 정의된 자기자신의 스마트컨트랙에서만 가능( private이 정의된 현재 이 컨트랙을 상속받은 자식 컨트랙도 접근불가)
 interal : private 처럼 오직 internal이 정의된 자기자신의 스마트컨트랙에서도 가능(internal이 정의된 현재 이 컨트랙을 상속받은 자식 컨트랙도 접근가능) - 기본값
*/

/*
 view : function 밖의 변수들을 읽을수 있으나 변경 불가능
 pure : function 밖의 변수들을 읽지 못하고, 변경도 불가능
 viwe 와 pure 둘다 명시 안할때: function 밖의 변수들을 읽어서, 변경을 해야함.이 정의된 현재 이 컨트랙을 상속받은 자식 컨트랙도 접근가능
*/

contract lec6{
     uint256 public a = 1;
    
    //view: function 밖의 변수들을 읽을수 있으나 변경 불가능
    function viewExample() public view returns(uint256){
        return a+2;
    }
    
    // 일반 함수는 밖의 변수를 읽고, 변경도 가능하다.
    function readAndChangeA() public returns(uint256){
        // 실제 a가 바뀐다.
        a = 3;
        // 바뀐 a에 2를 더해 5가 나온다.
        return a+2;
    } 
    
    // 순수하게 function 내부 변수들만 구성된 것이 pure이다. 외부 변수 접근 불가하고, 변경도 불가하다.
    function pureExample() pure public returns(uint256){
        uint256 a2 = 3;
        return a2+2;
    } 
}