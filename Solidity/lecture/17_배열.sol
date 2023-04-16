// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
맵핑과 다르게 length를 넣을 수 있다.
솔리디티에선 맵핑을 더 선호한다. 
그 이유는 어레이의 장점은 순환인데, 순환자체가 문제가 될 수도 있다. 순환은 D-DOS 공격에 취약할 수 있다.
암튼그럼,
디도스 공격에 사용할 여지가 있기 때문에 array는 길이를 정해서 최대 50까지 사용하는게 좋다
*/
 
contract lec18{
    // 타입[길이] 접근제한자 배열명;
    uint256[] public ageArray;
    uint256[10] public ageFixedSizeArray;
    string[] public nameArray= ["Kal","Jhon","Kerri"];
  
    // 어디서든 접근 가능하고, 변수에 접근하여 배열의 길이 값을 읽는 함수
    function AgeLength()public view returns(uint256) {
        return ageArray.length;
    }
    
    // 어디서든 접근 가능하고, 변수에 접근하여 배열에 값을 추가해 주는 함수
    function AgePush(uint256 _age)public{
        ageArray.push(_age);
    }
    // 어디서든 접근 가능하고, 배열 변수의 주소값에 접근해 값을 바꾸어 주는 함수
    function AgeChange(uint256 _index, uint256 _age)public{
        ageArray[_index] = _age;
    }

    // 어디서든 접근 가능하고, 배열 변수의 주소값에 접근해 값을 읽는 함수.
    function AgeGet(uint256 _index)public view returns(uint256){
        return ageArray[_index];
    }
    // 어디서든 접근 가능하고, 배열 변수의 마지막 값을 빼주는 함수.
    function AgePop()public {
        ageArray.pop();
    }
    // 어디서든 접근 가능하고 배열 주소값에 접근해 값을 초기화 시켜주는 함수
    function AgePop(uint256 _index)public {
        delete ageArray[_index];
    }


}