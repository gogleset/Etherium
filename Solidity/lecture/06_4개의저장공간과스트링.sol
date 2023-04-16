// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;
/*
    storage : 대부분의 변수, 함수들이 저장되며, 스마트 컨트랙트 배포 시 블록에 들어가며, 영속적으로 저장이되어 가스 비용이 비싸다.
    memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장이 된다. 그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기에 storage보다 가스 비용이 싸다.
    Calldata : 주로 external function 의 파라미터에서 사용 된다.
    stack:  EVM (Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역인데 1024Mb 제한적입니다.이 컨트랙을 상속받은 자식 컨트랙도 접근가능
*/

contract lec7 {
    // string은 기본 데이터가 아니고, 레퍼런스 데이터 타입이다. string을 쓸 때는 메모리라는 키워드를 붙여야 한다.
    // 기본 데이터 타입은 memory가 기본값이기 때문에 지정을 안해줘도 된다.
    // 모든 곳에서 접근 가능한 읽기,쓰기 불가한 순수함수, 함수 내에서 저장되는 스트링 타입 매개변수 _str을 받고, 스트링 타입 리턴을 받는다.
    function get_string(string memory _str) public pure returns(string memory){
        return _str;
    }
}