const FlightLog = artifacts.require("FlightLog");

contract("FlightLog", (accounts) => {
// mocha method
    // 프로세스를 진행하기전 세팅 메소드 before
  before(async () => {
    flightLog = await FlightLog.deployed();
    console.log(flightLog.address);
  });

  // it("deploys successfully", async () => {
  //     const owner = await flightLog.owner;
  //     console.log(owner);
  //     // assert.equal(owner, accounts[0]);
  // });
  it("owner is correct", async () => {
    const owner = await flightLog.getOwner();
    const contractOwner = await flightLog.owner.call(); //call 메소드로 호출(mocha)
      console.log(contractOwner);
    assert.equal(owner, accounts[0]);
  });

  it("adds a flight", async () => {
    const flight = "ND1309";
    await flightLog.logging("2023-04-15", flight);
    const arrLogs = await flightLog.getLog(0);
    console.log(arrLogs);
    assert.equal(arrLogs.flight, "HL-ND1309");
    assert.equal(arrLogs.managerSign, false);
    assert.equal(arrLogs.studentSign, false);
  });

  it("adds a manager Sign", async () => {
    await flightLog.doManagerSign(0);
    const arrLogs = await flightLog.getLog(0);
    console.log(arrLogs);
    assert.equal(arrLogs.managerSign, true);
    assert.equal(arrLogs.studentSign, false);
  });

  it("adds a student Sign", async () => {
    await flightLog.doStudentSign(0);
    const arrLogs = await flightLog.getLog(0);
    console.log(arrLogs);
    assert.equal(arrLogs.managerSign, true);
    assert.equal(arrLogs.studentSign, true);
  });

  // doManagerSign doStudentSign
});
