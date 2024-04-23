const NodeRSA = require("node-rsa");
const fs = require("fs");

const publicKeyFile = fs.readFileSync("./keys/publicKey.pem", 'utf-8');

const publicKey = new NodeRSA(publicKeyFile);
console.log(`Key-Type : ${publicKey.isPublic() ? "Public Key" : "Private Key"}`);
console.log(`Key-Type : ${publicKey.isPrivate() ? "Private Key" : "Public Key"}`);

const message = "Hello World!";
const encryptedData = publicKey.encrypt(message, 'base64');
fs.writeFileSync("./data/encrypted.txt", encryptedData);

console.log("Encrypted Data : ", encryptedData);