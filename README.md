# IPFS Hash Storage DApp

A decentralized application (DApp) that demonstrates how to store and retrieve IPFS file hashes on the Ethereum blockchain using a smart contract.  
The project uses **Ganache**, **Truffle Suite**, and **IPFS**, with an optional **Infura IPFS API** integration.

---

## 📌 Project Overview

This project simulates a real-world decentralized file storage workflow:
- Files are uploaded to IPFS
- The generated IPFS CID (hash) is stored on-chain
- The hash can be retrieved anytime from the smart contract

---

## 🛠️ Technologies Used

- **Solidity**
- **Ethereum (Local Blockchain)**
- **Ganache**
- **Truffle Suite**
- **Node.js**
- **IPFS Desktop**
- **Infura IPFS API (Bonus)**

---

## 📁 Project Structure

IPFS-Hash-Storage-DAPP/
│
├── contracts/
│ └── IPFSStorage.sol
│
├── migrations/
│ └── 1_deploy_contracts.js
│
├── build/
├── truffle-config.js
├── package.json
├── README.md

## ⚙️ 1. Local Blockchain Setup (Ganache)

### Install Ganache
Download from:
https://trufflesuite.com/ganache/

### Run Ganache
- Start a new workspace
- RPC Server:
http://127.0.0.1:7545

## 🧱 2. Smart Contract Implementation

### Features
- Stores an IPFS hash (CID)
- Updates the stored hash
- Retrieves the stored hash

### Compile the Contract
```bash
truffle compile
Deploy to Local Blockchain
truffle migrate --reset
🌐 3. Upload File to IPFS (Minimum Requirement)
Using IPFS Desktop
Install IPFS Desktop:
https://docs.ipfs.tech/install/ipfs-desktop/

Open IPFS Desktop

Upload any file

Copy the generated CID (IPFS Hash)

🔗 4. Interacting With the Smart Contract
Open Truffle Console
truffle console
Store IPFS Hash
let instance = await IPFSStorage.deployed()
await instance.setHash("PASTE_IPFS_CID_HERE")
Retrieve Stored Hash
await instance.getHash()

Infura IPFS Integration
Create Infura IPFS Project
Go to https://infura.io

Create a new IPFS project

Save:

Project ID

Project Secret

Install IPFS HTTP Client
npm install ipfs-http-client
Upload File Programmatically (Example)
import { create } from 'ipfs-http-client'

const client = create({
  host: 'ipfs.infura.io',
  port: 5001,
  protocol: 'https',
  headers: {
    authorization:
      'Basic ' + Buffer.from(PROJECT_ID + ':' + PROJECT_SECRET).toString('base64'),
  },
})

const uploadFile = async () => {
  const file = Buffer.from("Hello IPFS")
  const result = await client.add(file)
  console.log("CID:", result.cid.toString())
}

uploadFile()
✅ Project Requirements Status
✔ Local blockchain using Ganache

✔ Smart contract storing IPFS hash

✔ File upload via IPFS Desktop

✔ Smart contract interaction

⭐ Bonus — Implement a Local HD Wallet
Use HD wallet key derivation to
create a wallet that interacts with your local blockchain.
Examples:
·        Using@truffle/hdwallet-provider
·        Generating a mnemonic
·        Signing contract transactions using the HD provide

---
👤 Author

Moresa
GitHub: https://github.com/Mo-Resa77
