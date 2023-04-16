// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract lec13 {
    // 이벤트로 값을 출력할 수 있다. 그 값들은 블록안에 저장되어 있으니 꺼내서 볼 수 있다.
    // Event를 이용하여 블록에 데이터를 저장할 수 있고, EVM Logging 기능을 사용하여 저장된 트랜잭션에 저장된 데이터를 호출할 수 있습니다.
    event info(string name, uint256 money);
    
    function sendMoney() public {
        // 출력이 되면 블록체인 안에 저장된다.
        // deploy시 로그에 보면 값이 보인다. 
        // 이벤트 데이터 저장 방법(emit)
        emit info("KimDaeJin", 1000);
    }
}