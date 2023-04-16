// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// modifier 
// revert나 require를 적용한다.


contract lec30{
    /* modifier 모디파이어명(parameter){
    revert 혹은 require 적용          
}*/ 
    modifier onlyAdults{
         revert("You are not allowed to pay for the cigarette");
         _; // 적용될 코드의 앞과 뒤를 적용한다. 여기서는 적용될 코드의 앞으로 적용했다.
    } 
    
    // 접근 제한자 뒤에 적는게 좋다.
    function BuyCigarette() public onlyAdults returns(string memory){
        return "Your payment is succeeded";
    }
    
    
    // 파라미터를 받을때
    modifier onlyAdults2(uint256 _age){
         require(_age>18,"You are not allowed to pay for the cigarette");
         _;
    }
    
    function BuyCigarette2(uint256 _age) public onlyAdults2(_age) returns(string memory){
        return "Your payment is succeeded";
    }
    
     

    uint256 public num = 5;
    modifier numChange{
        num = 10;
        _; 
        
    }
    function numChangeFunction() public numChange{
        // num = 10;
        num = 15;
    }
}