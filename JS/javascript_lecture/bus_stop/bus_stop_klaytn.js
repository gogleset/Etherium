const contractInfo = require("./bus_stop.json");
const Caver = require("caver-js");
require("dotenv").config();
const mysql = require("mysql2");
const mongoDBClass = require("./Utils");
const transferToken = require("./make_coin");

const cav = new Caver("https://api.baobab.klaytn.net:8651");

const abi = contractInfo.klaytnAbi;
const address = contractInfo.klaytnAddress;

const smartContract = new cav.klay.Contract(abi, address);
// console.log(smartContract)

const account = cav.klay.accounts.createWithAccountKey(
  contractInfo.kakasAddress,
  contractInfo.kakasPrivateKey
);
console.log(account.address);
const wallet = cav.klay.accounts.wallet.add(account);

// mysql 연결 설정
let con = mysql.createConnection({
  host: "127.0.0.1",
  port: "3306",
  user: "root",
  password: contractInfo.password,
  database: "test",
});
let sql =
  "INSERT INTO block (address, blockNumber, returnValues) VALUES ( ?, ?, ? );";
// db 연결 확인
con.connect((err) => {
  if (err) throw err;
  console.log("DB Connected!"); //
});

const totalCount = async () => {
  try {
    let result = await smartContract.methods.TotalCount().call();
    return result;
  } catch (e) {
    throw e;
  }
};

const GetCheck = async (_index) => {
  // call 메소드는 가스소모가 없을 때 쓰면 된다.
  try {
    let result = await smartContract.methods.GetCheck(_index).call();
    return result;
  } catch (e) {
    throw e;
  }
};

const AddCheckList = async (
  _car_id,
  _check_res,
  _check_etc,
  _check_time,
  _address,
  _amount
) => {
  try {
    //  console.log(accounts);
    // 가스 값 소모비 설정
    let receipt = await smartContract.methods
      .AddCheckList(_car_id, _check_res, _check_etc, _check_time)
      .send({
        from: contractInfo.kakasAddress, // 컨트랙트 어드래스
        gas: 2000000, //가스값 설정
      });
    //   가져온 데이터 뽑기
    const { address, blockNumber, returnValues } = receipt.events.AddCheck;
    // mysql db연결
    // await con.connect((err) => {
    //   if (err) throw err;
    //   console.log("DB Connected!!!");
    //   // 쿼리문 연결
    //   con.query(
    //     sql,
    //     [address, blockNumber, JSON.stringify(returnValues)], // 넣기 (배열 형태로 넣어줌)
    //     (error, results) => {
    //       if (error) throw error;
    //       console.log("Connected!");
    //     }
    //   );
    // });
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
    console.log(result);
    await transferToken(_address, _amount);
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
AddCheckList(
  "MX123333",
  "Y",
  "Y",
  204,
  "0xbED8720740df17424b1FD4814dc519b9dad55Db9",
  10000
);
