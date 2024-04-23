const NodeRSA = require("node-rsa");
const fs = require("fs");

const privateKeyFile = fs.readFileSync("./keys/privateKey.pem", 'utf-8');
const encryptedData = fs.readFileSync("./data/encrypted.txt", 'utf-8');

const privateKey = new NodeRSA(privateKeyFile);
console.log(`Key-Type : ${privateKey.isPublic() ? "Public Key" : "Private Key"}`);
console.log(`Key-Type : ${privateKey.isPrivate() ? "Private Key" : "Public Key"}`);

const decryptedData = privateKey.decrypt(encryptedData, 'utf8');
console.log("Decrypted Data : ", decryptedData);