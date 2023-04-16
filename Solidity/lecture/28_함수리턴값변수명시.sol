// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract lec29{
    /*
    함수 리턴 명의 차이
    */

    // 리턴명이 없는 경우
    // total이라는 지역 변수를 만들어 줘야한다.
    function add(uint256 _num1, uint256 _num2) public pure returns (uint256){
        uint256 total = _num1 + _num2;
        return total;
    }
    
    // 리턴명이 있고
    // 리턴명이 있을 시 변수를 정의하지 않아도 된다. 그리고 헷갈리지도 않게된다.
    function add2(uint256 _num1, uint256 _num2) public pure returns (uint256 total){
         total = _num1 + _num2;
         return total;
    }
    
}