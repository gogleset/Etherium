// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;
/*
상속 받을 때 여러 줄의 코드를 상속 받기위해 반복 작업해야 하는 번거로움을 덜기 위해  
super를 써서  상속 받을 컨트랙의 이벤트를 한번에 가져올 수 있다.
*/

contract Father {
    event FatherName(string name);
    function who() public virtual{
        emit FatherName("KimDaeho");
        // emit FatherName("KimDaeho");
        // emit FatherName("KimDaeho");
        // emit FatherName("KimDaeho");
    }
}

contract Mother {
    event MotherName(string name);
    function who() public virtual{
        emit MotherName("leeSol");
    }
}

// 아버지 콘트랙트로 부터 상속 받은 Son
contract Son is Father{
    event sonName(string name);

    function who() public override{
        // 만약 FatherName이 많다면 super 키워드를 이용해 그 값을 모조리 가져올 수 있다
        super.who();
        emit sonName("KimJin");
    }
}