// 1. mongoose 모듈 가져오기
const mongoose = require("mongoose");
const jsons = require("./bus_stop.json");
const { Res, Res1 } = require("./models");

// 2. testDB 세팅
mongoose.connect(
  `mongodb+srv://choij2494:${jsons.passwords}@cluster0.mk4saib.mongodb.net/?retryWrites=true&w=majority`
);
// 3. 연결된 testDB 사용
let db = mongoose.connection;
// 4. 연결 실패
db.on("error", () => {
  console.log("Connection Failed!");
});
// 5. 연결 성공
db.once("open", () => {
  console.log("Connected!");
});

// 6. Schema 생성. (혹시 스키마에 대한 개념이 없다면, 입력될 데이터의 타입이 정의된 DB 설계도 라고 생각하면 됩니다.)
// var student = mongoose.Schema({
//   name: "string",
//   address: "string",
//   age: "number",
// });

// 7. 정의된 스키마를 객체처럼 사용할 수 있도록 model() 함수로 컴파일
// var Student = mongoose.model("Schema", student);

// 8. Student 객체를 new 로 생성해서 값을 입력
// let checkRes = new Res({
//   address: "0x97F57Fc21416cb117b89B65DF38fCc270C55f79D",
//   blockNumber: 1,
//   returnValues: {
//     res: 111,
//   },
// });

let checkRes1 = new Res1({
  carId: "asd123",
  blockNumber: 123,
  blockHash: "123jasdjlilfa",
  engineOil: "Y",
  missionOil: "Y",
  gasBoxCheck: "Y",
  tireCheck: "Y",
  lightCheck: "Y",
});

// console.log(checkRes);

// // 8. Student 객체를 new 로 생성해서 값을 입력
// let checkres = mongoose.Schema({
//   address: "string",
//   blockNumber: "string",
//   returnValues: "string",
//  createTime:"date"
// });

// 9. 데이터 저장
checkRes1
  .save()
  .then((data) => {
    console.log(data);
    checkRes1
      .find()
      .then((data) => console.log(data))
      .catch((err) => console.log(err));
  })
  .catch((err) => {
    // console.log(err);
  });

// 10. Student 레퍼런스 전체 데이터 가져오기
