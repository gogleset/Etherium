// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
enum을 쓰는 이유가 배열보다 "상태"를 더 직관적으로 표현할수 있어서 라고 보면 된다
/enum: 사람이 읽을수 있게, 사용자/개발자에 의해 정의된 상수세트 타입 (uint8 = 0~255(2^8-1))
    enum 이름 {

    }

*/




contract lec38{
    // 상수 세트 타입
    enum CarStatus{
        TurnOff,
        TurnOn,
        Driving,
        Stop
    }
    
    // Enum도 구조체처럼 만들 수 있다.
    CarStatus public carStatus;
    
    constructor(){
        carStatus = CarStatus.TurnOff;
    }
    // 로그에 등록할 이벤트 등록
    event carCurrentStatus(CarStatus _carStatus, uint256 _carStatusInInt);
    
    // 
    function turnOnCar() public {
        // carStatus가 TurnOff가 맞지 않다면, 출력
        require(carStatus == CarStatus(0), "To turn on, your car must be turned off");
        // 아니라면 TurnOn으로 바꿔주기
        carStatus = CarStatus(1);
        // 이벤트에 출력
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    

    function DrivingCar() public {
        // TurnOn이 맞지 않다면 출력
        require(carStatus == CarStatus.TurnOn, "To drive a car, your car must be turned on");
        // 드라이빙으로 바꿔주기
        carStatus = CarStatus.Driving;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    
    function StopCar() public {
        // Driving이 맞지 않다면 
        require(carStatus == CarStatus.Driving, "To drive a car, your car must be turned on");
        // stop으로 바꿔주기
        carStatus = CarStatus.Stop;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    
    function turnOffCar() public {
        // Turnon 혹은 Stop이 맞지 않다면
        require(carStatus == CarStatus.TurnOn 
                || carStatus == CarStatus.Stop , "To turn off, your car must be turned on or driving");
                // TurnOff로 맞춰주기
        carStatus = CarStatus.TurnOff;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }

    function CheckStatus() public view returns(CarStatus) {
        // checking enum status(uint8)
        return carStatus;
    }
}



