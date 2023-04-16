// SPDX-License-Identifier:GPL-30
pragma solidity >= 0.7.0 < 0.9.0;

contract lec20{
    // 구조체 만들기 - 우리만의 타입 만들기
    struct Character{
        uint256 age;
        string name;
        string job;
    }
    
    // 매핑을 이용하여 키와 구조체로 매핑타입 만들어주기
    mapping(uint256=>Character) public CharacterMapping;

    // 구조체 타입의 배열을 만들어주기
    Character[] public CharacterArray;
    
    // 새로운 구조체 만드는 함수 
    // 리턴에 메모리 키워드를 적어줘야한다.
    function createCharacter(uint256 _age,string memory _name,string memory _job) pure public returns(Character memory) {
        return Character(_age,_name,_job);
    }

    // 구조체를 매핑에 저장하는 함수
    function createChracterMapping(uint256 _key, uint256 _age,string memory _name,string memory _job )  public {
       CharacterMapping[_key] = Character(_age,_name,_job);
    }
    
    // 매핑된 캐릭터 구조체를 키를 이용하여 보여주는 함수
    function getChracterMapping(uint256 _key)  public view returns(Character memory){
       return CharacterMapping[_key];
    }
    
    // 배열에 구조체를 추가한다.
    function createChracterArray(uint256 _age,string memory _name,string memory _job ) public {
       CharacterArray.push(Character(_age,_name,_job));
    }
    
    // 배열의 주소값으로 값을 보여준다.
    function getChracterArray(uint256 _index)  public view returns(Character memory){
       return CharacterArray[_index];
    }
}