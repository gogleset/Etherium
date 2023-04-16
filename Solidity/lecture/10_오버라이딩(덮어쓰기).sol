// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract Father{
    
    string public familyName = "Kim";
    string public givenName = "Jung";
    uint256 public money = 100; 
    
    constructor(string memory _givenName) public {
        givenName = _givenName;
    }
    
    
    function getFamilyName() view public returns(string memory){
        return familyName;
    } 
    
    function getGivenName() view public returns(string memory){
        return givenName;
    } 
    
    // overriding 해야할 부분은 virtual 키워드를 넣어 주어야 한다.
    function getMoney() view virtual public  returns(uint256){
        return money;
    }
}

//override = 똑같은 함수 수정, 덮어쓰기
contract Son is Father("James"){
    uint256 public earning = 0;

    // constructor() Father("James"){
    // }

    

    function work() public {
        earning += 100;
    }
    
    // 덮어쓰기 할 메소드에 override 키워드를 추가한다.
    // 모든 곳에서 접근 가능한 읽기만하는 money + earning 리턴 함수
    // Father에 있는 똑같은 함수를 다시 작성하는 것 = override 키워드 작성
    function getMoney() view public override returns(uint256){
        return money+earning;
    }
}