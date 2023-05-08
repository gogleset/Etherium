// web3, mysql 라이브러리 import
const mongoose = require("mongoose");
const Web3 = require("web3");
const mysql = require("mysql2");
const mongoDBClass = require("./Utils");

const abiJson = require("./bus_stop.json");
// abi, address 주소
const abi = abiJson.abi;
const address = abiJson.address;

// mysql 연결 설정
let con = mysql.createConnection({
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: abiJson.password,
  database: "test",
});

// db 연결 확인
con.connect((err) => {
  if (err) throw err;
  console.log("DB Connected!"); //
});

// 쿼리문 연결
// con.query("select * from block", (err, rows, fields) => {
//   if (err) {
//     console.error("error connecting: " + err.stack);
//   }
//   console.log(rows);
// });

let sql =
  "INSERT INTO block (address, blockNumber, returnValues) VALUES ( ?, ?, ? );";

/**
 * 이더리움 네트워크 연결(가나쉬 테스트 네트워크)
 */
const web3 = new Web3("HTTP://127.0.0.1:7545");

// setprovider로 네트워크 연결 주소 바꿀 수도 있음
// (abi, address) 전달 하기
const smartContact = new web3.eth.Contract(abi, address);

const totalCount = async () => {
  try {
    let result = await smartContact.methods.TotalCount().call();
    return result;
  } catch (e) {
    throw e;
  }
};

const GetCheck = async (_index) => {
  // call 메소드는 가스소모가 없을 때 쓰면 된다.
  try {
    let result = await smartContact.methods.GetCheck(_index).call();
    return result;
  } catch (e) {
    throw e;
  }
};

const AddCheckList = async (_car_id, _check_res, _check_etc, _check_time) => {
  try {
    let accounts = await web3.eth.getAccounts();
    //  console.log(accounts);
    // 가스 값 소모비 설정
    let receipt = await smartContact.methods
      .AddCheckList(_car_id, _check_res, _check_etc, _check_time)
      .send({
        from: accounts[1], // 컨트랙트 어드래스
        gas: 200000, //가스값 설정
      });
    //   가져온 데이터 뽑기
    const { address, blockNumber, returnValues } = receipt.events.AddCheck;

    // mysql db연결
    await con.connect((err) => {
      if (err) throw err;
      console.log("DB Connected!!!");
      // 쿼리문 연결
      con.query(
        sql,
        [address, blockNumber, JSON.stringify(returnValues)], // 넣기 (배열 형태로 넣어줌)
        (error, results) => {
          if (error) throw error;
          console.log("Connected!");
        }
      );
    });
    // mongo db 연결
    // await mongoDBClass.check_res(
    //   address,
    //   blockNumber,
    //   JSON.stringify(returnValues)
    // );
    let result = await mongoDBClass.check_details(
      address,
      blockNumber,
      JSON.stringify(returnValues),
      "Y",
      "Y",
      "Y",
      "Y",
      "Y"
    );

    // result.then(() => mongoose.disconnect());
  } catch (error) {
    throw new Error(error);
  }
};

const getEvents = async () => {
  // 옵션
  const option = {
    filter: {
      1: "MX1232",
    },
    fromBlock: 0,
    toBlock: "latest",
  };
  // 지난 이벤트 기록 조회
  await smartContact.getPastEvents(
    "AddCheck", //이벤트가 발생하는 function
    option,
    (err, events) => {
      console.log(err, events);
    }
  );
};
// getEvents();

// totalCount().then((data) => {
// GetCheck(data);
// });
AddCheckList("MX123333", "Y", "Y", 204);
