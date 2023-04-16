// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract lec14  {
    // event 의 키워드이고, 특정한 이벤트의 값들을 들고 올 때 사용된다. 예를 들어 500개의 이벤트가 있다고 칠때, "김진"이라는 이벤트만 가져오고 싶을 때 사용한다. 

    // 두개의 이벤트가 있다 num과, str의 값을 가진건 같다. 하지만 numberTracker2는 indexed라는 키워드를 가지고 있다.
    // indexed 키워드는 필터링해서 로그에 저장된 이벤트 데이터를 가져올 수 있다.
    event numberTracker(uint256 num, string str);
    event numberTracker2(uint256 indexed num, string str);

    uint256 num = 0;

    function PushEvent(string memory _str) public {
        // 이벤트를 저장한다
        emit numberTracker(num,_str);
        emit numberTracker2(num,_str);
        num ++;
    }
}