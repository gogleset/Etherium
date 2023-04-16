// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract Father{
    string public familyName = "Kim";
    string public givenName = "Jung";
    uint256 public money = 100; 
    
    // 생성자 함수- givenName을 할당한다.
    constructor(string memory _givenName) public {
        givenName = _givenName;
    }
    
    //모든 곳에서 접근 가능한 변수 familyName을 읽기만 가능한 함수
    function getFamilyName() view public  returns(string memory){
        return familyName;
    } 
    
    // 모든 곳에서 접근 가능한  givenName을 읽기만 가능한 함수
    function getGivenName() view public  returns(string memory){
        return givenName;
    } 
    
    // 모든 곳에서 접근 가능한 money에 읽기만 가능한 함수
    function getMoney() view public returns(uint256){
        return money;
    }
}

// 간단한 상속과 생성자 함수에 접근.
contract Son is Father("James"){
    
}