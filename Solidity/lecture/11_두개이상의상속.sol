// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;


contract Father{
    uint256 public fatherMoney = 100;
    
    // 모든 곳에서 접근 가능한 함수 밖 변수에 접근 불가능한 순수함수. 아버지의 이름을 리턴한다.
    function getFatherName() public pure returns(string memory){
        return "KimJung";
    }
    // 모든 곳에서 접근 가능하고 수정 가능한 함수. fatherMoney를 리턴한다.
    function getMoney() public view virtual returns(uint256){
        return fatherMoney;
    }
    
}


contract Mother{
    uint256 public motherMoney = 500;

    // 모든 곳에서 접근 가능한 함수 밖 변수에 접근 불가능한 순수함수. 어머니의 이름을 리턴한다.
    function getMotherName() public  pure returns(string memory){
        return "Leesol";
    }
    // 모든 곳에서 접근 가능하고 수정 가능한 함수. motherMoney를 리턴한다.
    function getMoney() public view virtual returns(uint256){
        return motherMoney;
    }
}


// 두개 이상의 컨트랙트 상속받는 법
contract Son is Father, Mother {
    // 두개 이상의 컨트랙트에서 override 하는 방법
    // override(오버라이드 할 컨트랙트들)
    function getMoney() public view override(Father,Mother) returns(uint256){
        return fatherMoney+motherMoney;
    }
}