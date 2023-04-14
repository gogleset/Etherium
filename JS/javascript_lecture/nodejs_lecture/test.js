const CaverExtKas = require('caver-js-ext-kas');
const caver = new CaverExtKas();
console.log(caver);
const key = {
    "accessKeyId": "KASKVAIFZVX3UX12E1Y0RX0H",
    "secretAccessKey": "GiSwI2bActxNiL_N204X_hDVQerhvI5geMNvGHYf",
    "authorization": "Basic S0FTS1ZBSUZaVlgzVVgxMkUxWTBSWDBIOkdpU3dJMmJBY3R4TmlMX04yMDRYX2hEVlFlcmh2STVnZU1OdkdIWWY=",
    "chainId": 1001,
};


console.log(caver.initKASAPI(key.chainId, key.accessKeyId, key.secretAccessKey));


