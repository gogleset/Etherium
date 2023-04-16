// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract Father {
    event FatherName(string name);
    function who() public virtual{
        emit FatherName("KimDaeho");
    }
}

contract Mother {
    event MotherName(string name);
    function who() public virtual{
        emit MotherName("leeSol");
    }
}

// 다중 상속 받은 Son 컨트랙트
contract Son is Father, Mother{
    // 오버라이딩한 who는 두개인데 어떤 who를 가져올까?
    // 가장 최신, 즉 가장 오른쪽에있는 Mother 컨트랙트의 값을 가져온다.
    function who() public override(Father,Mother){
        super.who();
    }
}