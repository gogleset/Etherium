// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*

library:  기존에 만들던 스마트 컨트랙과 다른 종류의 스마트 컨트랙이라 할  수 있습니다. 
라이브러리를 사용함으로써 몇가지 이점과 제한사항이 있습니다.

이점
1. 재사용 : 블록체인에 라이브러리가 배포되면, 다른 스마트 컨트랙들에 적용가능.
2. 가스 소비 줄임 : 라이브러리는 재사용가능 한 코드, 
즉 여러개의 스마트 컨트랙에서 공통으로 쓰이는 코드를 따로 라이브러리 통해서 배포 하기에, 
다른 스마트 컨트랙에 명시를 해주는것이 아니라, 라이브러리를 적용만 하면 되기에 가스 소비량을 줄일 수 있다. 
왜냐하면, 가스는 스마트 컨트랙의 사이즈/길이에 영향을 많이 받기 때문이다. 
3.데이터 타입 적용: 라이브러리의 기능들은 데이터 타입에 적용할 수 있기에, 좀 더 쉽게 사용할 수 있다.

제한사항
1. fallback 함수 불가: fallback 함수를 라이브러리 안에 정의를 못 하기에, 이더를 갖고 있을 수 없습니다.
2. 상속 불가
3. payable 함수 정의 불가 

예시) 만약 여러개의 스마트 컨트랙트들이 있는데 거기서 공통으로 자주 쓰이는 함수가 있다고 가정하자,
공통으로 쓰이는 함수들을 라이브러리 안에 넣으면 여러개의 스마트 컨트랙들은 라이브러리에 접속해서 공통의 함수를 쓸 수 있다는 것이다.
여러 스마트 컨트랙의 길이는 줄고 가스량을 효율적으로 감소시킬 수 있다.


https://www.youtube.com/watch?v=CkQDssQ7EJM
*/
//0.8 -> overflow revert
// overflow: 0~255 -> 256 -> 0

//라이브러리 선언
library SafeMath{
    // 0~255;
    // 오버플로우 방지 라이브러리(0~255의 범위를 넘어버리면 -> 0 이된다.)
    function add(uint8 a, uint8 b) internal pure returns (uint8) {
        //만약 a+b가 a보다 크거나 같지 않으면 
        // 1 + 256 >= 1 -> 오버플로우되서 0 >= 1이 된다.
        // 0.8버전 이후로는 오버플로우가 자체 에러가 된다.
        require(a+b >= a , "SafeMath: addition overflow");
        return a + b;
    }
}

contract lec40{
    // using 라이브러리명 for 데이터타입
    using SafeMath for uint8;
    uint8 public a; 
    
    function becomeOverflow(uint8 _num1,uint8 _num2) public  {
       // a = _num1.add(_num2);
        a = SafeMath.add(_num1 ,_num2);
    } 
}

