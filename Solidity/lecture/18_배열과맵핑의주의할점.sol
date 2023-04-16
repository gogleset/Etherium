// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

/*
배열과 매핑의 업데이트 방법
num의 주소를 복사하는 것이 아니라 값을 복사하는 것이기 때문에
num을 바꾼다고 해서 이후에 할당된 값이 변경되지 않는다.
*/

contract lec19{
   uint256 num = 89;
   mapping(uint256 => uint256) numMap;
   uint256[] numArray;
   
    // 모든 곳에서 접근 가능한 _num을 받아서 num의 값을 변경
   function changeNum(uint256 _num) public{
       num = _num;
   }
    // 모든 곳에서 접근 가능한 num을 읽는 view 함수   
   function showNum() public view returns(uint256){
      return num;
   }
    
    // 모든 곳에서 접근 가능한 numMap의 처음 주소값에 num을 할당하는 함수
   function numMapAdd() public{
       numMap[0] = num;
   }
    //    모든 곳에서 접근 가능한 numMap의 처음 주솟값을 읽는 함수
   function showNumMap() public view returns(uint256){
       return numMap[0];
   }
    //    모든 곳에서 접근 가능한 numMap의 처음 주솟값을 수정하는 함수.
   function updateMap() public{
       numMap[0] = num;
   }
     // 모든 곳에서 접근 가능한 numArray에 num을 할당하는 함수
   function numArrayAdd() public{
       numArray.push(num);
   }
     // 모든 곳에서 접근 가능한 numArray의 처음 주소값의 값을 읽는 함수
   function showNumArray() public view returns(uint256){
       return numArray[0];
   }
    //    모든 곳에서 접근 가능한 numArray의 처음 주솟값을 수정하는 함수.
   function updateArray() public {
       numArray[0] = num;
   }
   
}