const NodeRSA = require("node-rsa");
const fs = require("fs");

const key = new NodeRSA({ b: 512 });

console.log(`Key-Type : ${key.isPublic() ? "Public Key" : "Private Key"}`);
console.log(`Key-Type : ${key.isPrivate() ? "Private Key" : "Public Key"}`);

const publicKey = key.exportKey('public');
const privateKey = key.exportKey('private');

fs.writeFileSync("./keys/publicKey.pem", publicKey);
fs.writeFileSync("./keys/privateKey.pem", privateKey);