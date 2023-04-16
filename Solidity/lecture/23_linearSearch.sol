// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
keccak256은 솔리디티 내장함수중 하나로써, 해쉬화를 시켜주는 함수입니다.
보통, 솔리디티는 스트링을 써도 스트링자체로 저장이 되는게 아니라, 자체적으로 바이트화 된다고 알고 있어요.
그렇기에, 스트링끼리 비교가 불가능해요.

그렇기때문에 keccak256으로 해쉬화를 시켜서 비교를 한다면, 해쉬특성상 값이 서로 같고 다름을 쉽게 파악을 할 수가있어요. 그리고 keccak256의 파라미터는 바이트  타입이기에 기존의 스트링을 바이트화 시켜서 keccak256에 넣은것입니다:)
*/


contract lec24{
    // 이벤트 등록
    // event CountryIndexName(uint256 indexed _index, string _name);
    string[] private countryList = ["South Korea","North Korea","USA","China","Japan"];  //index 번호는 0,1,2,3
    
    
    //Taiwan
    function linearSearch(string memory _search) public view returns(uint256,string memory){
        for(uint256 i=0; i<countryList.length; i++){
            // 만약 _search값과 반복문의 값이 일치한다면 
            // string은 비교가 불가능 그래서 byte화 시켜서 변환하고,keccak256으로 해쉬화 시켜서 비교
            if(keccak256(bytes(countryList[i])) == keccak256(bytes(_search))){
                // 반복문의 인덱스번호와 값 리턴
                return (i,countryList[i]);
            }
        }
        // 값이 없다면
        return(0,"Nothing");
    } 

}