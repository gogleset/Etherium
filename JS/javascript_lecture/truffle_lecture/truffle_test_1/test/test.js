let HelloWorld = artifacts.require("HelloWorld"); 

// mocha.js
// 콘트랙트 헬로월드에 접속하여
contract("HelloWorld", (accounts) => {
    // 계정 address 정보
    // console.log(accounts);
    // console.log(data);
    // mocha.js에 있는 메소드
    it("should be returned HelloWorld", async () => {
        // 스마트 콘트랙트에 접속하여 배포
        const smartContract = await HelloWorld.deployed();
        const hello = await smartContract.hello();
        // test객체 assert,  오류일경우 문자열 실행
        assert(hello === "Hello World!!!", "Returns is wrong");
    });
});