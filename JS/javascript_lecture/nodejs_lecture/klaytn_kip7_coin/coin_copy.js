const CaverExtKAS = require('caver-js-ext-kas')
​
const caver  = new CaverExtKAS()
​
const accessKeyId = "<klaytn api service accessKeyId >"
const secretAccessKey = "<klaytn api service secretAccessKey>"
const chainId = "<chainId>"
​
// Initialize KAS API
caver.initKASAPI(chainId, accessKeyId, secretAccessKey )
​
const keyringContainer = new caver.keyringContainer()
​
// Create a keyring with a private key
const keyring = keyringContainer.keyring.createFromPrivateKey('<wallet private key>')
​
console.log(keyring.address)
keyringContainer.add(keyring)
​
// Create Token function
​
async function createToken() {
   const kip7 = await caver.kct.kip7.deploy({
        name: 'OEI',//토큰 이름
        symbol: 'OEI',//토큰 심볼
        decimals:0, //소수점 자리수
        initialSupply: '1000000000000000000' //초기 발행량
   } ,keyring.address,keyringContainer )
​
   console.log(kip7)
}
​
async function transferToken(address , amount) {
    const oeiToken = await new caver.kct.kip7('<wallet address>')
    await oeiToken.setWallet(keyringContainer)
    const receipt  = await oeiToken.transfer(address, amount , {from: keyring.address})
    console.log(receipt)
}
​
​
// createToken()
// transferToken('0xC63c0D9397d145A8e31bb1Dfd5f6A6Ebc3Ea13cc','200')
​
​
async function getBalance(address) {
    const oeiToken = await new caver.kct.kip7('0xf3c1d71f4837c84b8b139439ae8a056b1c386383')
    const balance = await oeiToken.balanceOf(address)
    console.log(balance)
}
​
// getBalance('0x387902EC4Ca2B18d62Ba456ED7A3932B75dfEA54')
​
async function createWallet() {
    const wallet = await caver.kas.wallet.createAccount()
    console.log(wallet)
}
​
​
createWallet()