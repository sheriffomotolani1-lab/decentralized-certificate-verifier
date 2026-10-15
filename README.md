# Decentralized Certificate Verifier 🎓⛓️

A lightweight, secure, and decentralized smart contract built on Ethereum (Sepolia Testnet) to issue and verify digital certificates, preventing credentials fraud and ensuring tamper-proof record verification.

## 📌 Project Overview
The **Decentralized Certificate Verifier** allows authorized issuers (institutions, academies, or event organizers) to mint digital certificate records directly onto the blockchain. Anyone can publicly verify the validity, student details, course title, and timestamp of an issued certificate using its unique identifier hash.

---

## 🚀 Live Deployment Details

* **Network:** Sepolia Testnet
* **Smart Contract Address:** [`0x46F7c07939e7b7B820D97d8f247f2d30A21899AC`](https://sepolia.etherscan.io/address/0x46F7c07939e7b7B820D97d8f247f2d30A21899AC)
* **Deployment Transaction Hash:** [`0x864c8a0e58f61c2f7ad4b12be7fa7662670d3e2ae97aa73f4a5d677fecffb0fe`](https://sepolia.etherscan.io/tx/0x864c8a0e58f61c2f7ad4b12be7fa7662670d3e2ae97aa73f4a5d677fecffb0fe)

---

## ✨ Features
* **Access Control (`onlyOwner`):** Restricts certificate issuance to the contract deployer/issuer.
* **Tamper-Proof Ledger:** Certificates stored on-chain cannot be altered or retroactively faked.
* **Public Verification:** Anyone can query `verifyCertificate(bytes32 certId)` to check authenticity without needing permission or paying gas fees.
* **Event Logging:** Emits `CertificateIssued` events for seamless off-chain tracking and indexers.

---

## 🛠️ Smart Contract Architecture

### Key State Variables & Structs
* **`Certificate` Struct:**
  * `studentName` (string)
  * `courseName` (string)
  * `grade` (string)
  * `issueDate` (uint256)
  * `exists` (bool)
* **`certificates` Mapping:** Maps a unique `bytes32` identifier to its respective `Certificate` data.

### Core Functions
1. `issueCertificate(bytes32 certId, string studentName, string courseName, string grade)`
   * Restricted to the owner (`onlyOwner`).
   * Validates that the certificate ID is not already used.
2. `verifyCertificate(bytes32 certId)`
   * Public view function returning the full details and validity status of a given certificate ID.

---

## 💻 Testing & Interaction in Remix IDE

1. Open [Remix IDE](https://remix.ethereum.org).
2. Load `CertificateVerifier.sol`.
3. In **Deploy & Run Transactions**, set Environment to **Injected Provider - MetaMask** (Sepolia Network).
4. Use **At Address** with `0x46F7c07939e7b7B820D97d8f247f2d30A21899AC` to load the live contract.
5. Call `issueCertificate` using a 32-byte hex ID (e.g., `0x1111111111111111111111111111111111111111111111111111111111111111`).
6. Query `verifyCertificate` with the same ID to verify on-chain storage.

---

## 📜 License
This project is open-source and available under the [MIT License](LICENSE).
