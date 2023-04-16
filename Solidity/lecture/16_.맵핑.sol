// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
맵핑은 특정한 키와 밸류로 이루어져 있다.
*/

contract lec17{
    // 키와 밸류로 이루어진 변수들
    // 키와 밸류만 있기 때문에 length를 알 수 없다.
    // mapping(키 타입 => 밸류 타입) 접근제한자 맵핑명;
    mapping(string=>uint256) private priceList;
    mapping(uint256=>string) private nameList;
    mapping(uint256=>uint256) private ageList;
    
    
    //모든 곳에서 접근 가능한 ageList의 키를 넣어주는 함수
    // 핵심은 키와 값을 같이 넣어준다는 것이다.
    function setAgeList(uint256 _key,uint256 _age) public {
        ageList[_key] = _age;
    }
    
    //모든 곳에서 접근 가능한 ageList의 키 값 읽기 함수
    function getAge(uint256 _key) public view returns(uint256){
        return ageList[_key];
    }
    
    //모든 곳에서 접근 가능한 nameList의 키를 넣어주는 함수
    // 핵심은 키와 값을 같이 넣어준다는 것이다.
    function setNameList(uint256 _key,string memory _name) public {
        nameList[_key] = _name;
    }
    //모든 곳에서 접근 가능한 nameList의 키 값 읽기 함수
    function getName(uint256 _key) public view returns(string memory){
        return nameList[_key];
    }

      //모든 곳에서 접근 가능한 priceList의 키를 넣어주는 함수
    // 핵심은 키와 값을 같이 넣어준다는 것이다.
    function setPriceList(string memory _itemName,uint256 _price) public {
        priceList[_itemName] = _price;
    }
    
    //모든 곳에서 접근 가능한 nameList의 키 값 읽기 함수
    function getPriceList(string memory _key) public view returns(uint256){
        return priceList[_key];
    }
    
}