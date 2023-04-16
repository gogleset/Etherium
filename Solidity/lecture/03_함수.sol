// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;


contract lec4{
    /*
    function 이름() public { // (public,private,internal,external) 접근 제한자 변경가능 
        // 내용
    }
    */
   
   uint256 public a = 3;
   //1. parameter 와 return 값이 없는 function 
   function changeA1() public {
       a = 5;
   }
   
   //2. parameter 값이 있는 function 타입 먼저쓰고 변수 이름써주면 된다.
    // 함수의 파라미터를 정의할 땐 함수의 파라미터 타입을 정의해주면 된다.   
   function changeA2(uint256 _value) public{
       a = _value;
   }
   
   //3. return 값이 있는 function
    // 리턴값은 returns 키워드를 명시해주면 되고, 괄호 안에 리턴 타입을 적어주면 된다   
   function changeA3() public view returns(uint256){
       return a;
   }
   
   //4. parameter 와 return 값이 있는 function 
   function changeA4(uint256 _value) public returns(uint256){
       a = _value;
       return a;
   }
}