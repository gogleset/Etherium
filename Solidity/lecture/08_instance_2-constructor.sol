// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

// 하나의 컨트랙트에서 다른 컨트랙트에 접근할 때 사용한다.
contract A{
    // 상태변수
    string public name;
    uint256 public age;
    
    // 생성자 함수 - 
    constructor(string memory _name, uint256 _age){
        name = _name;
        age = _age;
    }
        
    // 컨트랙트 메소드
    // 모든곳에서 접근 가능한 name과 age를 바꾸는 함수  
    function change(string memory _name, uint256 _age) external {
         name = _name;
         age = _age;
    }
}

contract B{
    // 인스턴스 만들기 (가스 소비량이 많다. 스마트 컨트랙트가 가볍다면 상관 없지만, 문제점은 한 블록당 가스를 소비할 수 있는 양이 제한적이라 많은 소비량을 쓰는 것을 비추)
    A instance = new A("Alice", 52);
  
    
    // 모든 곳에서 접근 가능한 함수 instance의 메서드에 접근한다.
    function change(string memory _name, uint256 _age) public  {
        instance.change(_name,_age);
    }
  
    // 밖의 변수들을 읽기만 가능한 함수 
    function get() public view returns(string memory, uint256) {
        //인스턴스에 접근할땐 ()붙이기 안붙히면 에러
        return (instance.name(), instance.age());
    }
}