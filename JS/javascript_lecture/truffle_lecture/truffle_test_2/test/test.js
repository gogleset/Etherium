let AdvancedStorage = artifacts.require("AdvancedStorage");

// mocha.js
// 콘트랙트에 접속하여
contract("AdvancedStorage", (accounts) => {
  // 계정 address 정보
  // console.log(accounts);
  // console.log(data);
  // mocha.js에 있는 메소드
  it("should be array push", async () => {
    // 스마트 콘트랙트에 접속하여 배포
    const smartContract = await AdvancedStorage.deployed();
    await smartContract.add(0);
      const arr = await smartContract.get(0);
      const result = Number(arr);
      console.log(typeof result);

    // test객체 assert, 거짓일경우 문자열 실행
    assert(result === 0, "Returns is wrong");
  });
    it("should be returned array", async () => {
      // 스마트 콘트랙트에 접속하여 배포
      const smartContract = await AdvancedStorage.deployed();
      await smartContract.add(50);
        const idsArr = await smartContract.getAll();
        const ids = idsArr.map(id => id.toNumber());
      // test객체 assert, 거짓일경우 문자열 실행
      assert.deepEqual(ids ,[0, 50], "Returns is wrong");
    });
});
