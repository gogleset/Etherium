// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract A{
    
    uint256 public a = 5;
    
    function change(uint256 _value) public {
        a = _value;
    } 

}

contract B{
    // new 키워드로 인스턴스 만들기
    A instance = new A();
    
    //모든 곳에서 접근 가능하고 함수 밖 변수에 읽기만 가능한 함수, 인스턴스의 값에 접근할 때 ()쓰기
    function get_A() public view returns(uint256) {
        return instance.a();
    }
    // 모든 곳에서 접근 가능한 리턴 없는 함수, 상속받은 change 메서드에 접근함
    function change_A(uint256 _value) public  {
        instance.change(_value);
    }    

}