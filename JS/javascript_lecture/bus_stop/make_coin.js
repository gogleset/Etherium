const CaverExtKas = require("caver-js-ext-kas");
const caver = new CaverExtKas();
const key = {
  accessKeyId: "KASKVAIFZVX3UX12E1Y0RX0H",
  secretAccessKey: "GiSwI2bActxNiL_N204X_hDVQerhvI5geMNvGHYf",
  authorization:
    "Basic S0FTS1ZBSUZaVlgzVVgxMkUxWTBSWDBIOkdpU3dJMmJBY3R4TmlMX04yMDRYX2hEVlFlcmh2STVnZU1OdkdIWWY=",
  chainId: 1001,
};

// API 초기화
caver.initKASAPI(key.chainId, key.accessKeyId, key.secretAccessKey);

// 키링( Klaytn 계정의 정보를 저장하는 Keyring )
const keyringContainer = new caver.keyringContainer();
// 키링과 프라이빗 키 생성
const keyring = keyringContainer.keyring.createFromPrivateKey(
  "0x08122338e55ac177d7655ff0e59554eb1a24382a79fe0414dad79a5fdf4d8d3b"
);

// console.log(keyringContainer);
// console.log(keyring.address);
// 키링콘테이너에 넣어주기
keyringContainer.add(keyring);

// Create Token Function (토큰이 만들어지는 처리)
const createToken = async () => {
  try {
    const kip7 = await caver.kct.kip7.deploy(
      {
        name: "PIZZACOIN", //토큰 이름
        symbol: "PIZ", // 토큰 심볼
        decimals: 0, // 소수점 자리수
        initialSupply: "10000000000", // 초기 발행량
      },
      keyring.address,
      keyringContainer
    );
    console.log(kip7);
  } catch (err) {
    return err;
  }
};
// createToken()
//   .then((data) => {
//     console.log(data);
//   })
//   .catch((err) => {
//     console.log(err);
//   });

// 주소와 보내는 양
async function transferToken(address, amount) {
  // 콘트랙트 어드레스 입력
  const oeiToken = await new caver.kct.kip7(
    "0x206d456a9bd2083080f0a2b261e9c78a139df424"
  );
  await oeiToken.setWallet(keyringContainer);
  const receipt = await oeiToken.transfer(address, amount, {
    from: keyring.address,
  });
  console.log(receipt);
}

transferToken("0x3a4288c03c1b2fa5e8d7eedfecb0b7c61f8e4271", 1000000000);

// 조회
async function getBalance(address) {
  const oeiToken = await new caver.kct.kp7(
    "0x05A55B97d8ECc30219c3D285fBDe8f4bCcA9527C"
  );
  const balance = await oeiToken.balanceOf(address);
  console.log(balance);
}

async function createWallet() {
  const wallet = await caver.kas.wallet.createAccount();
  console.log(wallet);
}
module.exports = transferToken;
