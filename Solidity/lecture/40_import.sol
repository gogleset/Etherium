// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;
// import는 같은 파일내에 콘트랙트를 만든다음 인스턴스를 생성하는 방법이 아니라, 외부파일의 콘트랙트 코드를 사용하기 위해 쓰이는 방법
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";

contract lec41 {
    using SafeMath for uint256;
    uint public a;
    uint public maximum = ~uint256(0); // ==2**256-1; // 2**256 == 2^256
    function becomeOverflow(uint _num1, uint _num2) public {
        a = _num1.add(_num2);
    }
}