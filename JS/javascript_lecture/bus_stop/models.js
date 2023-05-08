const mongoose = require("mongoose");
const { Schema } = require("mongoose");

//몽고디비 스키마 생성
let checkRes = mongoose.Schema({
  address: { type: String, required: true },
  blockNumber: { type: Number, required: true },
  returnValues: { type: Schema.Types.Mixed, required: true },
  createTime: { type: Date, required: true, default: () => new Date() },
});

let checkRes1 = mongoose.Schema({
  carId: { type: String, required: true },
  blockNumber: { type: Number, required: true },
  blockHash: { type: String, required: true },
  engineOil: { type: String, required: true },
  missionOil: { type: String, required: true },
  gasBoxCheck: { type: String, required: true },
  tireCheck: { type: String, required: true },
  lightCheck: { type: String, required: true },
  createTime: { type: Date, required: true, default: () => new Date() },
});

//  정의된 스키마를 객체처럼 사용할 수 있도록 model() 함수로 컴파일
let res = mongoose.model("checklist", checkRes);
let res1 = mongoose.model("detailCheck", checkRes1);

module.exports = { Res: res, Res1: res1 };
