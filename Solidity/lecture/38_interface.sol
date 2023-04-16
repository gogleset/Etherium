// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
interface : 스마트컨트랙 내에서 정의되어야할 필요한 것 
1, 함수는 external로 표시
2, enum, structs 가능 
3, 변수, 생성자 불가(constructor X)
*/

// interface 선언
interface ItemInfo {
    // 구조체
    struct item{
        string name;
        uint256 price;
    }
    // name과 price를 넣어줄 함수
    function addItemInfo(string memory _name,uint256 _price) external;
    function getItemInfo(uint256 _index) external view returns(item memory);
}

contract lec39 is ItemInfo{
    // interface item의 배열값
    item[] public itemList;
    uint[] public a;

    // interface의 함수들을 정의 override 키워드를 적용해야한다.
    function addItemInfo(string memory _name,uint256 _price) override public {
        itemList.push(item(_name,_price));
    }
    function getItemInfo(uint256 _index) override public view returns(item memory) {
        return itemList[_index];
    }
} 