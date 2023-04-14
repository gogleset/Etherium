// 트러플이 자바스크립트 파일을 알아서 읽어준다.
// abi -> truffle-config를 참조해서 이더리움 네트워크에다 넣어줌
let HelloWorld = artifacts.require("HelloWorld"); //컨트랙트 명을 가져다 적기

module.exports = function (deployer,network) {
  // deployment steps
    deployer.deploy(HelloWorld);
};



