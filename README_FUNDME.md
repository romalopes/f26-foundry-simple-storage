# Fund-me

### First video

Introduction
In this section, we'll create a decentralized crowdfunding contract. The complete codebase is available in the Github repository.

Overview
For this project, we will be using two contracts: FundMe, the main crowdfunding contract, and PriceConverter. They function much like Kickstarter, allowing users to send any native blockchain cryptocurrency. They also enable the owner of the contract to withdraw all the funds collected. We will then deploy these contracts on a testnet.

🗒️ NOTE:br
Use testnet sparingly. Limiting testnet transactions helps prevent network congestion, ensuring a smoother testing experience for everyone.

fund and withdraw
Once FundMe is deployed on Remix, you'll notice a set of functions, including a new red button labelled fund, indicating that the function is payable. A payable function allows you to send native blockchain currency (e.g., Ethereum, Polygon, Avalanche) to the contract.

We'll additionally indicate a minimum USD amount to send to the contract when the function fund is called. To transfer funds to the FundMe contract, you can navigate to the value section of the Remix deployment tab, enter a value (e.g. 0.1 ether) then hit fund. A MetaMask transaction confirmation will appear, and the contract balance will remain zero until the transaction is finalized. Once completed, the contract balance will be updated to reflect the transferred amount.

The contract owner can then withdraw the funds. In this case, since we own the contract, the balance will be removed from the contract's balance and transferred to our wallet.

Conclusion
These 25 lessons will guide you step-by-step through the implementation of a crowdfunding contract, that supports cryptocurrency contributions and owner withdrawals.

### Setup

Introduction
Let's begin by coding FundMe, a crowdfunding contract allowing users to send funds, which the owner can later withdraw. Before we start, let's clean up our Remix IDE workspace

Setting up the project
Start from scratch by opening your Remix IDE and deleting all existing contracts. Next, create a new contract named FundMe.

👀❗IMPORTANT:br
Before you start coding, try to write down in plain English what you want your code to achieve. This helps clarify your goals and structure your approach.

We want FundMe to perform the following tasks:

Allow users to send funds into the contract: users should be able to deposit funds into the 'FundMe' contract

Enable withdrawal of funds by the contract owner: the account that owns FundMe should have the ability to withdraw all deposited funds

Set a minimum funding value in USD: there should be a minimum amount that can be deposited into the contract

Let's outline the core structure of the contract:

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
contract FundMe {}
fund and withdraw functions
The FundMe contract will have two primary functions that serve as the main interaction points:

fund: allows users to deposit funds into the contract

withdraw: grants the contract owner the ability to withdraw the funds that have been previously deposited

First, let's code the fund function and leave the withdraw function commented out for the moment.

contract FundMe {
// send funds into our contract
function fund() public {}
// owner can withdraw funds
/_function withdraw() public {}_/
}

Introduction
In this part, we'll explore how to transfer Ethereum (ETH) to a smart contract by creating a fund function. This function will require a minimum amount of ETH to ensure proper transaction handling.

value and payable
When a transaction it's sent to the blockchain, a value field is always included in the transaction data. This field indicates the amount of the native cryptocurrency being transferred in that particular transaction.
For the function fund to be able to receive Ethereum, it must be declared payable. In the Remix UI, this keyword will turn the function red, signifying that it can accept cryptocurrency.

Wallet addresses and smart contracts are capable of holding and managing cryptocurrency funds. These entities can interact with the funds, perform transactions, and maintain balance records, just like a wallet.

function fund() public payable {
// allow users to send $
// have a minimum of $ sent
// How do we send ETH to this contract?
msg.value;
​
//function withdraw() public {}
}
In Solidity, the value of a transaction is accessible through the msg.value property. This property is part of the global object msg. It represents the amount of Wei transferred in the current transaction, where Wei is the smallest unit of Ether (ETH).

Reverting transactions
We can use therequire keyword as a checker, to enforce our function to receive a minimum value of one (1) whole ether:

require(msg.value > 1e18); // 1e18 = 1 ETH = 1 \* 10 \*\* 18
This require condition ensures that the transaction meets the minimum ether requirements, allowing the function to execute only if this threshold is satisfied. If the specified requirement is not met, the transaction will revert.

The require statement in Solidity can include a custom error message, which is displayed if the condition isn't met, clearly explaining the cause of the transaction failure:

require(msg.value > 1 ether, "Didn't send enough ETH"); //if the condition is false, revert with the error message
An online tool like Ethconverter can be useful for executing conversions between Ether, Wei, and Gwei.

👀❗IMPORTANT:br
1 Ether = 1e9 Gwei = 1e18 Wei

🗒️ NOTE:br
Gas costs are usually expressed in Gwei

If a user attempts to send less Ether than the required amount, the transaction will fail and a message will be displayed. For example, if a user attempts to send 1000 Wei, which is significantly less than one Ether, the function will revert and does not proceed.

Conclusion
In this lesson, we explored how to use the value field of a transaction to transfer Ether to a contract. We also learned how to generate an error message when the user sends insufficient Ether to the FundMe contract.

🧑‍💻 Test yourself
📕 Describe the role of the payable keyword. How does it affect the functionality of a function?

📕 Explain how the require statement works in Solidity and what prevents.

📕 What's the difference between Wei, Gwei and Ether?

🧑‍💻 Create a tinyTip function that requires the user to send less than 1 Gwei.

---

---

### --------------

### Sending ETH Through a Function

This chapter explains how to create a function in a smart contract that requires a minimum amount of Ethereum (ETH) to be sent

Introduction
In this part, we'll explore how to transfer Ethereum (ETH) to a smart contract by creating a fund function. This function will require a minimum amount of ETH to ensure proper transaction handling.

value and payable
When a transaction it's sent to the blockchain, a value field is always included in the transaction data. This field indicates the amount of the native cryptocurrency being transferred in that particular transaction.
For the function fund to be able to receive Ethereum, it must be declared payable. In the Remix UI, this keyword will turn the function red, signifying that it can accept cryptocurrency.

Wallet addresses and smart contracts are capable of holding and managing cryptocurrency funds. These entities can interact with the funds, perform transactions, and maintain balance records, just like a wallet.

function fund() public payable {
// allow users to send $
// have a minimum of $ sent
// How do we send ETH to this contract?
msg.value;
​
//function withdraw() public {}
}
In Solidity, the value of a transaction is accessible through the msg.value property. This property is part of the global object msg. It represents the amount of Wei transferred in the current transaction, where Wei is the smallest unit of Ether (ETH).

Reverting transactions
We can use therequire keyword as a checker, to enforce our function to receive a minimum value of one (1) whole ether:

require(msg.value > 1e18); // 1e18 = 1 ETH = 1 \* 10 \*\* 18
This require condition ensures that the transaction meets the minimum ether requirements, allowing the function to execute only if this threshold is satisfied. If the specified requirement is not met, the transaction will revert.

The require statement in Solidity can include a custom error message, which is displayed if the condition isn't met, clearly explaining the cause of the transaction failure:

require(msg.value > 1 ether, "Didn't send enough ETH"); //if the condition is false, revert with the error message
An online tool like Ethconverter can be useful for executing conversions between Ether, Wei, and Gwei.

👀❗IMPORTANT:br
1 Ether = 1e9 Gwei = 1e18 Wei

🗒️ NOTE:br
Gas costs are usually expressed in Gwei

If a user attempts to send less Ether than the required amount, the transaction will fail and a message will be displayed. For example, if a user attempts to send 1000 Wei, which is significantly less than one Ether, the function will revert and does not proceed.

Conclusion
In this lesson, we explored how to use the value field of a transaction to transfer Ether to a contract. We also learned how to generate an error message when the user sends insufficient Ether to the FundMe contract.

🧑‍💻 Test yourself
📕 Describe the role of the payable keyword. How does it affect the functionality of a function?
📕 Explain how the require statement works in Solidity and what prevents.
📕 What's the difference between Wei, Gwei and Ether?
🧑‍💻 Create a tinyTip function that requires the user to send less than 1 Gwei.

Here's the summary:

---

---

### --------------

### Sending ETH through a function

#### `value` and `payable`

Every transaction sent to the blockchain includes a `value` field — the amount of native cryptocurrency being transferred. For a function to receive ETH, it must be marked `payable` (turns the button red in Remix).

```solidity
function fund() public payable {
    // allow users to send $
    // have a minimum of $ sent
    msg.value; // amount of Wei sent in the current transaction
}
```

`msg.value` is part of the global `msg` object and represents the Wei amount sent. Both wallet addresses and smart contracts can hold and manage funds like a wallet.

---

#### Reverting transactions with `require`

Use `require` to enforce a minimum send amount. If the condition isn't met, the transaction reverts:

```solidity
require(msg.value > 1e18); // 1e18 = 1 ETH = 1 * 10 ** 18
```

A custom error message can be added to explain the failure:

```solidity
require(msg.value > 1 ether, "Didn't send enough ETH");
```

> **ETH units:** 1 Ether = 1e9 Gwei = 1e18 Wei — use [Ethconverter](https://ethconverter.online) for quick conversions. Gas costs are typically expressed in Gwei.

---

#### Test yourself

1. Describe the role of the `payable` keyword. How does it affect a function?
2. Explain how `require` works and what it prevents.
3. What's the difference between Wei, Gwei, and Ether?

**Challenge:** Create a `tinyTip` function that requires the user to send _less than_ 1 Gwei:

```solidity
function tinyTip() public payable {
    require(msg.value < 1e9, "Too much! Send less than 1 Gwei");
}
```

---

---

### --------------

### Reverts & gas in Solidity

#### Revert

A **revert** undoes all state changes made within a transaction from the beginning of the function call. Remaining gas is returned to the sender, but gas already consumed is **not** refunded.

```solidity
uint256 public myValue = 1;

function fund() public {
    myValue = myValue + 2;
    require(msg.value > 1e18, "didn't send enough ETH");
    // if require fails: myValue resets to 1, remaining gas is returned
}
```

In the example above, if `require` fails, `myValue` reverts to `1` despite having been incremented — all prior operations in that call are undone.

---

#### Gas usage

- Gas is consumed by every operation the EVM executes, even if the transaction ultimately reverts.
- Users set a **gas limit** — the max gas they're willing to spend. Any unused gas within that limit is returned on success.
- If a transaction reverts, **only unspent gas is returned**; gas used up to the revert point is charged.

---

---

#### Transaction fields

| Field           | Value transfer          | Contract interaction     |
| --------------- | ----------------------- | ------------------------ |
| Nonce           | tx counter for account  | tx counter for account   |
| Gas price (wei) | max price per gas unit  | max price per gas unit   |
| Gas limit       | max gas to use (~21000) | max gas to use (~21000)  |
| To              | recipient address       | contract address         |
| Value (wei)     | amount of ETH sent      | amount of ETH sent       |
| Data            | empty 🫙                | function + parameters 📦 |
| v, r, s         | sender signature        | sender signature         |

---

#### Test yourself

1. Describe the two types of transactions covered in this lesson.
2. Why are reverts used?
3. Bob sets gas price to 20 Gwei and gas limit to 50,000 units. The transaction consumes 30,000 units before reverting. How much ETH is charged?

> Calculation hint: 30,000 units × 20 Gwei = 600,000 Gwei = **0.0006 ETH**

---

---

### -------------------

### FundMe - Chainlink Oracles and USD Conversion

#### Introduction

##### Introduction

As blockchain and decentralized finance (DeFi) evolve, supporting multiple currencies becomes increasingly important. Allowing users to contribute using values tied to fiat currencies (like USD) improves usability and accessibility.

This lesson introduces:

- Currency conversion inside the `FundMe` contract
- Decentralized Oracles
- Chainlink Data Feeds
- Real-world price data integration

---

#### USD Values in FundMe

Initially, the contract required users to send at least `1 ETH`.

```solidity
require(msg.value > 1e18, "Didn't send enough ETH");
```

However, requiring a fixed ETH amount is problematic because:

- ETH price changes constantly
- 1 ETH may be worth much more or much less than intended

Instead, we can define a minimum USD contribution.

#### Minimum USD State Variable

```solidity
uint256 public minimumUSD = 5;
```

Goal:

- Require users to send at least `$5 USD` worth of ETH

Problem:

- `minimumUSD` is in USD
- `msg.value` is in ETH/Wei

This requires:

- Real-world ETH/USD price data

---

#### The Oracle Problem

Blockchains are deterministic systems:

- Every node must reach the same result
- External data cannot be fetched directly

Examples of external data:

- ETH/USD price
- Weather data
- Sports scores
- Random numbers

Attempting to fetch external data directly would:

- Break blockchain consensus
- Create inconsistencies across nodes

This challenge is called:

#### Oracle Problem

Smart contracts need a secure bridge between:

- On-chain data
- Off-chain real-world data

---

#### Decentralized Oracles

A decentralized Oracle network provides:

- External data to smart contracts
- Trust minimization
- Redundancy
- Tamper resistance

Centralized oracles are dangerous because they:

- Create single points of failure
- Reduce decentralization
- Can manipulate data

---

#### Chainlink

:contentReference[oaicite:0]{index=0} is a decentralized Oracle network that connects smart contracts to external data and computation.

It enables:

- Real-world price feeds
- Random number generation
- Automation
- API calls

Contracts using both:

- On-chain data
- Off-chain data

are called:

#### Hybrid Smart Contracts

---

#### Chainlink Products

#### 1. Data Feeds

Purpose:

- Provide reliable asset prices

Example:

- ETH/USD price feed

How it works:

1. Multiple Chainlink nodes fetch price data
2. Data gathered from multiple exchanges/providers
3. Nodes independently verify prices
4. Aggregated result stored on-chain

Used heavily in:

- DeFi
- Lending protocols
- Stablecoins
- DEXs

###### Important

- Powers over `$50B+` in DeFi applications

---

#### 2. Chainlink VRF

VRF = Verifiable Random Function

Purpose:

- Generate provably fair randomness

Use cases:

- NFT randomization
- Gaming
- Lotteries
- Raffles

Benefits:

- Tamper-proof
- Verifiable
- Cannot be manipulated

---

#### 3. Chainlink Automation (Keepers)

Previously called:

- Keepers

Purpose:

- Automatically execute smart contract actions

How it works:

- Nodes monitor conditions/events
- Trigger transactions automatically

Use cases:

- Auto payouts
- Liquidations
- Scheduled execution
- Yield harvesting

---

#$## 4. Chainlink Functions

Purpose:

- Allow decentralized API calls

Enables:

- External web APIs
- Off-chain computation
- Advanced integrations

Recommended for:

- Advanced developers
- Complex dApps

---

#### Why Chainlink Matters

Chainlink solves:

- The Oracle Problem
- External data reliability
- Decentralized computation

Benefits:

- Secure external data
- Decentralization
- High reliability
- Feature-rich smart contracts

---

#### FundMe Integration

Goal:

- Convert ETH value into USD

Flow:

```text
User sends ETH
        ↓
Contract receives msg.value
        ↓
Chainlink ETH/USD price feed queried
        ↓
ETH converted into USD
        ↓
Check against minimumUSD
        ↓
Accept or revert transaction
```

---

#### Key Concepts

##### msg.value

- Amount of ETH sent in transaction
- Measured in Wei

##### Wei

Smallest ETH unit.

:contentReference[oaicite:1]{index=1}

#$$## Hybrid Smart Contract
Combines:

- Blockchain logic
- External real-world data

---

#$$ Conclusion

Chainlink enables smart contracts to interact with real-world data securely.

In `FundMe`, Chainlink Data Feeds allow:

- ETH to USD conversion
- Minimum USD contribution checks

Chainlink ecosystem features include:

- Data Feeds
- VRF
- Automation
- Functions

These tools significantly expand the capabilities of decentralized applications (dApps).

---

#### Test Yourself

##### Questions

###### Describe 4 Chainlink products and the problems they solve

- Data Feeds
- VRF
- Automation
- Functions

##### Explain the Oracle Problem

- Why blockchains cannot access external data directly

##### Why are decentralized oracles important?

- Prevent centralization and manipulation

##### What is a Hybrid Smart Contract?

- Combines on-chain and off-chain data

---

---

## --------------

### ETH to USD Conversion with Solidity Interfaces

#### Introduction

This lesson explains how to convert Ethereum (ETH) values into USD using Solidity and how to interact with external smart contracts through **interfaces**.

The conversion process uses a **Chainlink Data Feed**, which provides the latest ETH/USD market price.

---

### Converting ETH to USD

Two main functions are needed:

```solidity
// Function to get the price of Ethereum in USD
function getPrice() public {}

// Function to convert a value based on the price
function getConversionRate() public {}
```

The goal is to:

1. Fetch the current ETH/USD price
2. Convert `msg.value` (ETH) into USD

---

### Chainlink Data Feed

The ETH price is obtained from a **Chainlink Data Feed**.

Main components:

- **AggregatorV3Interface**
  - Interface used to interact with the price feed contract
  - Keeps the ETH/USD price updated

- **latestRoundData()**
  - Returns the latest ETH price data

---

##Solidity Interfaces

An **interface** defines function signatures without implementation logic.

Interfaces allow contracts to interact with already deployed contracts without needing the full source code.

#### Advantages of Interfaces

- Lightweight and efficient
- Enable communication between contracts
- Only require:
  - Contract address
  - ABI (generated from the interface)

---

### Example: Using the Chainlink Interface

```solidity
function getVersion() public view returns (uint256) {
    return AggregatorV3Interface(
        0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
    ).version();
}
```

This example calls the `version()` function from the deployed Chainlink ETH/USD price feed contract.

---

### Steps to Convert ETH to USD

1. Import the Chainlink interface
2. Get the Data Feed contract address
3. Use `latestRoundData()` to fetch the ETH price
4. Convert the ETH amount into USD

---

### Important Notes

> Interfaces allow different contracts to interact seamlessly by sharing a common set of functionalities.

> It is recommended to work on testnets only after deployment logic is complete, since testing on-chain can consume time and resources.

---

### Additional Exercise

Implement another function in the `FundMe` contract using the `decimals()` method from the Data Feed contract.

Example idea:

```solidity
function getDecimals() public view returns (uint8) {
    return AggregatorV3Interface(
        0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
    ).decimals();
}
```

---

### References

- [Chainlink Documentation](https://docs.chain.link/?utm_source=chatgpt.com)
- [Chainlink Price Feed Addresses](https://docs.chain.link/data-feeds/price-feeds/addresses?utm_source=chatgpt.com)
- [AggregatorV3Interface GitHub](https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol?utm_source=chatgpt.com)
- [Solidity Documentation — Interfaces](https://docs.soliditylang.org/en/latest/contracts.html?utm_source=chatgpt.com#interfaces)

https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&networkType=testnet&testnetSearch=eth&testnetPage=1
0x694AA1769357215DE4FAC081bf1f309aDC325306

---

---

## --------------

### Converting ETH to USD with Chainlink Interfaces

#### Overview

To convert `msg.value` (in Wei/ETH) into USD, we need to fetch the live ETH/USD market price from a Chainlink Data Feed. Two helper functions handle this:

```solidity
// Function to get the price of Ethereum in USD
function getPrice() public {}

// Function to convert a value based on the price
function getConversionRate() public {}
```

---

#### Chainlink Data Feed

Our primary source for ETH prices is a [Chainlink Data Feed](https://docs.chain.link/data-feeds/using-data-feeds). Two key components:

- **`AggregatorV3Interface`** — a contract that takes a Data Feed address as input and keeps the ETH/USD price updated
- **`latestRoundData()`** — a function that returns `answer`, representing the latest Ethereum price

To use the Price Feed contract we need:

1. **Address** — available in the [Chainlink Price Feed Contract Addresses](https://docs.chain.link/data-feeds/price-feeds/addresses) docs (use the ETH/USD feed)
2. **ABI** — obtained by compiling the interface (see below)

---

#### Interfaces

Instead of importing, compiling, and deploying the full PriceFeed contract, we can use an **Interface** — it defines method signatures without implementation logic. Compiling it returns the ABI we need.

> **Note:** Interfaces allow different contracts to interact seamlessly by ensuring they share a common set of functionalities.

The `AggregatorV3Interface` is available in [Chainlink's GitHub repository](https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol).

We can test the interface by calling the `version()` function:

```solidity
function getVersion() public view returns (uint256) {
    return AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419).version();
}
```

The pattern is always:

1. Get the interface of the external contract
2. Compile it to get the ABI
3. Plug in the deployed contract's address
4. Call any available function on it

> **Note:** Work on testnets only after local deployment is complete — testnet transactions are slow and consume faucet funds.

---

#### Test Yourself

1. Explain the role of interfaces in Solidity and why they are advantageous.
2. What steps are required to convert a Wei value into its USD equivalent?
3. **Challenge:** Implement a function on `FundMe` that calls the `decimals()` method of the Data Feed address:

```solidity
function getDecimals() public view returns (uint8) {
    return AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419).decimals();
}
```

---

---

## ---------------

### Importing Libraries from NPM and GitHub

#### Overview

As smart contract projects grow, managing multiple interfaces inline clutters the source code. Instead of copying contract code manually, Solidity supports direct imports from GitHub and NPM.

---

#### Local Imports

For contracts stored locally, use a standard import statement:

```solidity
import "./SimpleStorage.sol";
```

---

#### Direct Imports from GitHub

For contracts hosted remotely — like Chainlink's `AggregatorV3Interface` — avoid copying the code manually. Instead, import it directly using the package path as specified in the [Chainlink documentation](https://docs.chain.link/docs/using-chainlink-reference-contracts):

```solidity
// Instead of this (manual copy):
import { AggregatorV3Interface } from "./AggregatorV3Interface.sol";

// Use this (direct import):
import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
```

---

#### Importing from NPM

The `@chainlink/contracts` package is available on [NPM](https://www.npmjs.com/package/@chainlink/contracts) and follows **Semantic Versioning (SemVer)**, allowing you to pin a specific version:

```bash
npm install @chainlink/contracts@1.2.3
```

The package is kept in sync with Chainlink's GitHub repository. When Remix encounters `@chainlink/contracts`, it resolves it as the NPM package and downloads all necessary code automatically.

Full example with the import in use:

```solidity
pragma solidity ^0.8.18;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {}
```

---

#### Test Yourself

1. What does the statement `@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol` resolve to when interpreted by the Solidity compiler?

---

---

## ----------------------------

### Getting Real World Price Data from Chainlink

#### Overview

To compare `msg.value` (in ETH) against a USD minimum, we need a live ETH/USD price. This is fetched from a deployed [Chainlink Data Feed](https://docs.chain.link/) using the `AggregatorV3Interface`.

This lesson explains how to retrieve real-world cryptocurrency prices in Solidity using the **Chainlink AggregatorV3Interface**.

The main goal is to fetch the latest ETH/USD price from a deployed Chainlink Data Feed contract.

---

### Creating a Contract Instance

To interact with the Chainlink Price Feed, create an instance of the `AggregatorV3Interface` using the Data Feed contract address.

Example using the Sepolia ETH/USD Data Feed:

```solidity id="jmsfxw"
AggregatorV3Interface priceFeed =
    AggregatorV3Interface(
        0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
    );
```

---

### The latestRoundData Function

The `latestRoundData()` function retrieves the latest price information from Chainlink.

```solidity id="ukcwgs"
function latestRoundData()
    external
    view
    returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );
```

The important value for this lesson is:

- `answer` → latest cryptocurrency price

Unused return values can be ignored using commas.

---

### Retrieving the Latest ETH Price

```solidity id="zfnodz"
function getLatestPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
}
```

This function returns the latest ETH/USD price.

---

### Understanding Decimals

Different Solidity values use different decimal precisions:

| Value                   | Type      | Decimals |
| ----------------------- | --------- | -------- |
| `msg.value`             | `uint256` | 18       |
| `answer` from Chainlink | `int256`  | 8        |

Since the price feed uses 8 decimals and ETH values use 18 decimals, the price must be adjusted.

To normalize the decimals:

```solidity id="bzcfki"
return price * 1e10;
```

This converts the price from 8 decimals to 18 decimals.

---

### Typecasting

The price returned by Chainlink is an `int256`, but Solidity calculations often require `uint256`.

Typecasting converts the value:

```solidity id="dhsrxc"
return uint(price) * 1e10;
```

---

### Final Implementation

```solidity id="psuzie"
function getLatestPrice() public view returns (uint256) {
    (,int answer,,,) = priceFeed.latestRoundData();
    return uint(answer) * 1e10;
}
```

This function:

1. Retrieves the latest ETH price
2. Adjusts decimals from 8 to 18
3. Converts the value from `int256` to `uint256`

---

### Key Concepts

#### Why multiply by `1e10`?

Chainlink ETH/USD feeds use 8 decimal places, while ETH values in Solidity use 18 decimals.

To match precisions:

10^{18-8}=10^{10}

So the price is multiplied by `1e10`.

---

### Important Note About Typecasting

Converting negative integers to unsigned integers can produce unexpected results.

Example:

```solidity id="czhgjf"
uint256(-2)
```

This results in a very large unsigned integer due to Solidity's binary representation rules.

---

### Additional Exercise

Create a contract with a:

```solidity id="wshuqw"
function getLatestBTCPriceInETH()
```

that retrieves the latest BTC/ETH price using another Chainlink Data Feed.

---

---

## ---------------------

### Solidity Math: Converting ETH to USD

#### Overview

Solidity only supports integers — no floating-point numbers. All decimal precision must be handled manually using fixed-point arithmetic with `1e18` as the base unit.

---

#### The `getPrice` and `getConversionRate` Functions

`getPrice()` returns the current ETH/USD price as a `uint256` with 18 decimal precision (via Chainlink). `getConversionRate()` uses it to convert a given ETH amount into its USD equivalent:

```solidity
function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
    uint256 ethPrice = getPrice();
    uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
    return ethAmountInUsd;
}
```

> **Note:** `ethPrice * ethAmount` yields a value with `1e18 * 1e18 = 1e36` precision. Dividing by `1e18` brings it back to `1e18` precision.

---

#### Decimal Precision Rule

> ⚠️ **Always multiply before dividing** to avoid truncation errors.

In Solidity integer math, division truncates. Example:

| Operation     | Floating-point result | Solidity result |
| ------------- | --------------------- | --------------- |
| `(5 / 3) * 2` | ≈ 3.33                | `1 * 2 = 2` ❌  |
| `(5 * 2) / 3` | ≈ 3.33                | `10 / 3 = 3` ✅ |

Always rearrange operations to multiply first.

---

#### Worked Example

Given:

- `ethAmount` = 1 ETH → `1e18`
- `ethPrice` = $2000 USD → `2000e18`

```
ethPrice * ethAmount = 2000e18 * 1e18 = 2000e36
2000e36 / 1e18 = 2000e18  ✅ (back to 18 decimal precision)
```

---

#### Enforcing a Minimum USD Value

With `getConversionRate` returning a value at `1e18` precision, the `MINIMUM_USD` constant must also be scaled to `1e18`:

```solidity
uint256 public constant MINIMUM_USD = 5 * 1e18;

require(
    getConversionRate(msg.value) >= MINIMUM_USD,
    "You need to spend more ETH!"
);
```

If the ETH sent is worth less than $5 USD, the transaction reverts:

```
Gas estimation failed.
Error: execution reverted, didn't send enough ETH.
```

---

#### Test Yourself

1. Why is it important to multiply before dividing in Solidity, and how does it help maintain precision?
2. What is the purpose of `getConversionRate` and how does it use `getPrice` to convert ETH to USD?
3. **Challenge:** Implement the reverse conversion — USD to ETH:

```solidity
function convertUsdToEth(uint256 usdAmount, uint256 ethPrice) public pure returns (uint256) {
    // usdAmount and ethPrice are both 1e18 precision
    return (usdAmount * 1e18) / ethPrice;
}
```

---

---

## ---------------------

### Tracking Funders with `msg.sender`

#### Overview

To track who is funding the contract and how much they've sent, we use a combination of a dynamic array and a mapping.

---

#### Tracking Funder Addresses

An array stores every address that sends money to the contract:

```solidity
address[] public funders;
```

Inside the `fund()` function, each caller's address is appended using `push()`:

```solidity
funders.push(msg.sender);
```

`msg.sender` is a Solidity global variable that always refers to the address that initiated the current transaction.

---

#### Mapping Addresses to Amounts

A mapping associates each funder's address with the total amount they have contributed:

```solidity
mapping(address => uint256) public addressToAmountFunded;
```

Each time `fund()` is called, the sent value is added to the caller's running total:

```solidity
addressToAmountFunded[msg.sender] += msg.value;
```

---

#### Combined in `fund()`

```solidity
function fund() public payable {
    require(getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
}
```

---

#### Test Yourself

1. Explain why the `addressToAmountFunded` mapping is needed inside the `FundMe` contract.
2. **Challenge:** Implement a `contributionCount` function that tracks how many times each address has called `fund()`:

```solidity
mapping(address => uint256) public addressToContributionCount;

function fund() public payable {
    require(getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
    addressToContributionCount[msg.sender] += 1;
}

function contributionCount(address funder) public view returns (uint256) {
    return addressToContributionCount[funder];
}
```

---

---

## -----------------------------------------------

### Creating Your Own Libraries in Solidity

#### Overview

When functionality is reused across contracts — like price feed helpers — it's best extracted into a **library**. Libraries are similar to contracts but cannot hold state variables or receive ETH, and all functions must be marked `internal` so they are embedded directly into the consuming contract at compile time.

> ⚠️ If any library function is **not** marked `internal`, the library cannot be embedded and must instead be deployed independently and linked to the contract manually.

Good examples of Solidity libraries can be found on [Solidity by Example](https://solidity-by-example.org/library/).

---

#### Creating `PriceConverter.sol`

Create a new file `PriceConverter.sol` and replace the `contract` keyword with `library`. Move `getPrice()` and `getConversionRate()` from `FundMe.sol` into it, mark all functions `internal`, and import `AggregatorV3Interface`:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }
}
```

---

#### Using the Library in `FundMe.sol`

Import the library and attach it to the `uint256` type with the `using` keyword:

```solidity
import {PriceConverter} from "./PriceConverter.sol";

using PriceConverter for uint256;
```

Library functions now behave as if they are native methods on `uint256`. The variable the function is called on is automatically passed as the first argument:

```solidity
// Before (direct function call):
require(getConversionRate(msg.value) >= minimumUsd, "didn't send enough ETH");

// After (library method on uint256):
require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");
```

If additional arguments are needed, pass them in parentheses — they map to the second parameter onwards:

```solidity
uint256 result = msg.value.getConversionRate(123);
// msg.value → first argument, 123 → second argument
```

---

#### Test Yourself

1. What are the differences between Solidity libraries and contracts?
2. What happens if a library function is not marked `internal`?
3. **Challenge:** Create a `MathLibrary` with a `sum` function, then use it inside `FundMe`:

```solidity
// MathLibrary.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

library MathLibrary {
    function sum(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
}
```

```solidity
// Inside FundMe.sol
import {MathLibrary} from "./MathLibrary.sol";

using MathLibrary for uint256;

function calculateSum(uint256 a, uint256 b) public pure returns (uint256) {
    return a.sum(b);
}
```

---

---

## -----------------------------------------------

### Solidity For Loops: Building the `withdraw` Function

#### Overview

To withdraw accumulated funds and clean up state, the `withdraw` function needs to reset every funder's record in the `addressToAmountFunded` mapping. This is done by iterating over the `funders` array with a `for` loop.

---

#### For Loop Structure

A `for` loop in Solidity (and most languages) has three parts:

1. **Initializer** — starting index
2. **Condition** — loop runs while this is true
3. **Increment** — step size per iteration

```
// Start at 0, end at 10, increment by 1 → 0, 1, 2, 3 ... 10
// Start at 3, end at 12, increment by 2 → 3, 5, 7, 9, 11
```

Arrays are zero-indexed:

```
// [1, 2, 3, 4]  ← elements
//  0  1  2  3   ← indexes
```

---

#### Resetting Funders in `withdraw`

The loop iterates through every address in `funders` and resets their funded amount to zero:

```solidity
uint256 funderIndex;
for (funderIndex = 0; funderIndex < funders.length; funderIndex++) {
    address funder = funders[funderIndex];
    addressToAmountFunded[funder] = 0;
}
```

Each iteration:

1. Reads the funder address at `funders[funderIndex]`
2. Sets their entry in `addressToAmountFunded` back to `0`
3. Increments `funderIndex` and checks the condition again

> **Note:** `addressToAmountFunded` maps each funder address to the total amount they have contributed.

---

#### Shorthand Operators

| Shorthand       | Equivalent                      |
| --------------- | ------------------------------- |
| `funderIndex++` | `funderIndex = funderIndex + 1` |
| `x += y`        | `x = x + y`                     |

---

#### Test Yourself

1. What are the two shorthand operators covered in this lesson?
2. How does a `for` loop work in Solidity?
3. **Challenge:** Implement a `pushNumbers` function that populates a `numbers` array with values 1 to 10:

```solidity
uint256[] public numbers;

function pushNumbers() public {
    for (uint256 i = 1; i <= 10; i++) {
        numbers.push(i);
    }
}
```

## Solidity `for` Loop

### Introduction

This lesson explains how to use `for` loops in Solidity to iterate through arrays and reset mappings inside a smart contract.

The example focuses on implementing a `withdraw` function in the `FundMe` contract.

---

## What is a `for` Loop?

A `for` loop repeatedly executes a block of code until a condition becomes false.

Typical structure:

```solidity id="twbplh"
for (initialization; condition; increment) {
    // code
}
```

A loop usually involves:

1. Starting value
2. Ending condition
3. Increment/decrement step

---

## Example of Array Indexes

```text id="jvcqum"
// [1, 2, 3, 4] elements
//  0  1  2  3  indexes
```

Arrays use indexes starting from `0`.

To access all elements, iterate through each index.

---

## Basic Loop Examples

### Incrementing by 1

```text id="oepvaz"
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
```

### Incrementing by 2

```text id="mbgvvp"
3, 5, 7, 9, 11
```

---

## Using `for` Loops in the `FundMe` Contract

The loop iterates through all funders and resets their funded amounts.

```solidity id="jbmvhw"
uint256 funderIndex;

for (
    funderIndex = 0;
    funderIndex < funders.length;
    funderIndex++
) {
    address funder = funders[funderIndex];
    addressToAmountFunded[funder] = 0;
}
```

---

## How This Loop Works

For each iteration:

1. Start at index `0`
2. Access the funder address in the array
3. Reset their funded amount to `0`
4. Increment the index
5. Continue until all funders are processed

---

## Mapping Reset Logic

The mapping:

```solidity id="whqjva"
mapping(address => uint256) public addressToAmountFunded;
```

stores:

- Key → funder address
- Value → amount funded

The loop clears all stored balances during withdrawal.

---

## Solidity Shortcuts

### Increment Operator

```solidity id="hlrwrw"
funderIndex++
```

Equivalent to:

```solidity id="qvtrmo"
funderIndex = funderIndex + 1;
```

---

### Addition Assignment Operator

```solidity id="oczgja"
x += y;
```

Equivalent to:

```solidity id="myptcq"
x = x + y;
```

---

## Example `withdraw` Function

```solidity id="ycvxfs"
function withdraw() public {
    for (
        uint256 funderIndex = 0;
        funderIndex < funders.length;
        funderIndex++
    ) {
        address funder = funders[funderIndex];
        addressToAmountFunded[funder] = 0;
    }

    funders = new address[](0);
}
```

This function:

1. Clears all funding records
2. Resets the `funders` array

---

## Additional Exercise — Push Numbers Into an Array

```solidity id="unvtvp"
uint256[] public numbers;

function pushNumbers() public {
    for (uint256 i = 1; i <= 10; i++) {
        numbers.push(i);
    }
}
```

This fills the `numbers` array with values from `1` to `10`.

---

## Key Concepts

| Concept        | Description                   |
| -------------- | ----------------------------- |
| `for` loop     | Repeats code execution        |
| Array indexing | Accesses elements by position |
| `mapping`      | Stores key-value pairs        |
| `++`           | Increment shorthand           |
| `+=`           | Addition shorthand            |

---

---

---

## -----------------------------------------------

### Sending ETH From a Contract in Solidity

#### Introduction

This lesson explains three different methods for sending ETH from a Solidity smart contract:

1. `transfer`
2. `send`
3. `call`

Each method has different:

- gas behavior
- error handling
- security considerations

---

### 1. `transfer`

The `transfer` function is the simplest way to send ETH.

```solidity id="okmptu"
// msg.sender -> address
// payable(msg.sender) -> payable address
payable(msg.sender).transfer(amount);
```

This sends `amount` of ETH from the contract to `msg.sender`.

---

### Why Use `payable`?

Addresses must be converted to `payable` before receiving ETH.

Example:

```solidity id="rjlwmq"
payable(msg.sender)
```

Without `payable`, Solidity blocks ETH transfers to the address.

---

### Transfer Characteristics

| Feature          | `transfer`            |
| ---------------- | --------------------- |
| Gas forwarded    | 2300 gas              |
| Failure behavior | Automatically reverts |
| Return value     | None                  |
| Simplicity       | Very simple           |

---

### Transfer Limitation

`transfer` only forwards `2300` gas.

If the receiver requires more gas:

- the transaction reverts
- the transfer fails

Because of this limitation, `transfer` is no longer recommended for most modern contracts.

---

### 2. `send`

The `send` function behaves similarly to `transfer`.

```solidity id="bmsxje"
bool success = payable(msg.sender).send(address(this).balance);
require(success, "Send failed");
```

---

### Send Characteristics

| Feature          | `send`          |
| ---------------- | --------------- |
| Gas forwarded    | 2300 gas        |
| Failure behavior | Returns `false` |
| Return value     | `bool`          |
| Auto revert      | No              |

- ⛽ Gas limit: **2300**
- ❌ Reverts if gas limit is exceeded or transfer fails
- No return value needed — failure is handled automatically

---

### Important Difference

Unlike `transfer`, `send` does NOT automatically revert.

The developer must manually check the result:

```solidity id="zbtirn"
require(success, "Send failed");
```

---

### 3. `call`

`call` is the most flexible and recommended method for sending ETH.

```solidity id="myffgt"
(bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
require(success, "Call failed");
```

---

### How `call` Works

The syntax:

```solidity id="swvsld"
.call{value: amount}("")
```

means:

- send ETH using `value`
- execute no function (`""` empty calldata)

---

### Call Characteristics

| Feature          | `call`                 |
| ---------------- | ---------------------- |
| Gas forwarded    | All remaining gas      |
| Failure behavior | Returns `false`        |
| Return value     | `(bool, bytes memory)` |
| Flexibility      | Highest                |

---

### Return Values of `call`

`call` returns:

```solidity id="zqltsl"
(bool success, bytes memory data)
```

Where:

- `success` → indicates success/failure
- `data` → stores returned data

---

### Why `call` is Recommended

`call` is now the preferred way to send ETH because:

- no strict 2300 gas limit
- compatible with modern smart contracts
- more flexible
- works with complex fallback/receive functions

> `call` is the recommended method for sending ETH in modern Solidity development.

---

### Example — Send ETH to Any Address

```solidity id="ngjjca"
function callAmountTo(address payable receiver) public payable {
    (bool success, ) = receiver.call{value: msg.value}("");

    require(success, "Call failed");
}
```

This function:

1. Accepts ETH
2. Sends ETH to another address using `call`
3. Reverts if the transfer fails

---

### Comparison Table

| Feature           | `transfer` | `send` | `call`         |
| ----------------- | ---------- | ------ | -------------- |
| Gas limit         | 2300       | 2300   | No fixed limit |
| Auto revert       | Yes        | No     | No             |
| Returns bool      | No         | Yes    | Yes            |
| Recommended today | No         | Rarely | Yes            |
| Flexibility       | Low        | Medium | High           |

---

Reference: [Solidity by Example — Sending Ether](https://solidity-by-example.org/sending-ether/)

### Key Concepts

- `payable` addresses can receive ETH
- `transfer` automatically reverts on failure
- `send` requires manual failure handling
- `call` is the modern standard for ETH transfers
- gas limits are critical when sending ETH

---

#### Test Yourself

1. What are the primary differences between `transfer`, `send`, and `call`?
2. Why must an address be cast to `payable` before sending ETH to it?
3. **Challenge:** Implement `callAmountTo` using `call` to send ETH to an address passed as an argument:

```solidity
function callAmountTo(address payable recipient, uint256 amount) public {
    (bool success, ) = recipient.call{value: amount}("");
    require(success, "Call failed");
}
```

---

---

## -----------------------------------------------

### Smart Contract Constructor & Access Control

#### Overview

Without restrictions, anyone can call `withdraw` and drain the contract. The fix is to designate an **owner** at deployment and restrict sensitive functions to that address only.

---

#### The Constructor

A constructor runs automatically during contract deployment — in the same transaction — making it the right place to assign ownership. Unlike regular functions, it uses neither the `function` nor `public` keywords:

```solidity
constructor() {}
```

---

#### Assigning the Owner

Declare an `owner` state variable and set it to `msg.sender` inside the constructor. At deployment time, `msg.sender` is the deployer's address:

```solidity
address public owner;

constructor() {
    owner = msg.sender;
}
```

> **Note:** Using a dedicated `callMeRightAway()` function would work but requires a second transaction. The constructor handles it in one.

---

#### Restricting `withdraw`

Add a `require` check at the top of `withdraw` so only the owner can call it:

```solidity
function withdraw() public {
    require(msg.sender == owner, "must be owner");
    // withdrawal logic here
}
```

If anyone other than the owner calls `withdraw`, the transaction reverts with `"must be owner"`.

---

#### Test Yourself

1. What is the purpose of a constructor and how does it differ from regular functions?
2. Why is it necessary to restrict access to the `withdraw` function?
3. **Challenge:** Write `withdrawOnlyFirstAccountRemix` that allows only the first Remix default account (`0x5B38Da6a701c568545dCfcB03FcB875f56beddC4`) to withdraw:

```solidity
function withdrawOnlyFirstAccountRemix() public {
    require(
        msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
        "Not the first Remix account"
    );
    (bool success, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(success, "Withdrawal failed");
}
```

---

---

## -----------------------------------------------

### Solidity Function Modifiers

#### Overview

When multiple functions share the same access condition (e.g. owner-only), repeating `require(msg.sender == owner, ...)` in each one clutters the contract. **Modifiers** extract that repeated logic into a single reusable snippet.

---

#### Creating a Modifier

```solidity
modifier onlyOwner {
    require(msg.sender == owner, "Sender is not owner");
    _;
}
```

> **Note:** The modifier is named `onlyOwner` to clearly reflect the condition it enforces.

##### The `_` (underscore)

`_` is a placeholder for the body of the function the modifier is applied to:

- Code **before** `_` runs first (the guard check)
- If it passes, the **function's own logic** executes in place of `_`
- Placing `_` before the `require` would execute the function body first, then check — which is not the intended behaviour

---

#### Applying the Modifier

Add the modifier name to the function signature:

```solidity
function withdraw(uint amount) public onlyOwner {
    // withdrawal logic
}
```

When `withdraw` is called, `onlyOwner` runs first. If `msg.sender != owner`, the transaction reverts before any withdrawal logic executes.

---

#### Test Yourself

1. Why is it beneficial to use modifiers for access control rather than repeating `require` checks?
2. **Challenge:** Implement an `onlyAfter` modifier that prevents a function from running before a specified timestamp:

```solidity
modifier onlyAfter(uint256 _time) {
    require(block.timestamp >= _time, "Too early");
    _;
}

// Usage example:
uint256 public unlockTime = block.timestamp + 1 days;

function timedWithdraw() public onlyOwner onlyAfter(unlockTime) {
    // withdrawal logic
}
```

---

---

## -----------------------------------------------

### Testing FundMe on a Testnet

#### Overview

This guide covers end-to-end testing of the `FundMe` contract — from deployment on Sepolia to interacting with all its functions and verifying outcomes on a block explorer.

---

#### Deployment

1. Compile the contract in Remix to confirm there are no errors
2. Set the environment to **Injected Provider — MetaMask** and confirm it is synced to Sepolia
3. Ensure your wallet has Sepolia ETH (available from a faucet)
4. Click **Deploy**, confirm the transaction in MetaMask, and wait for it to be mined

---

#### Contract Interaction

After deployment, Remix shows colour-coded buttons for each function:

| Button colour | Function type                | Example            |
| ------------- | ---------------------------- | ------------------ |
| 🔴 Red        | `payable`                    | `fund`             |
| 🟠 Orange     | Non-payable (state-changing) | `withdraw`         |
| 🔵 Blue       | `view` / `pure` (read-only)  | `owner`, `funders` |

The `owner` is automatically set to the deployer's MetaMask address via the constructor.

> **Note:** Calling `fund` with no value or less than $5 USD worth of ETH triggers a gas estimation error and wastes gas without executing the function.

---

#### Funding the Contract

Set the value to `0.1 ETH` in Remix and call `fund`. After MetaMask confirmation, verify on [Etherscan](https://sepolia.etherscan.io) or [Blockscout](https://eth-sepolia.blockscout.com):

- Contract balance increases by `0.1 ETH`
- `funders` array registers your address
- `addressToAmountFunded` records the amount sent

---

#### Withdrawing Funds

Call `withdraw` from the owner account. On success:

- Contract balance resets to `0`
- `addressToAmountFunded` mapping resets to `0`
- `funders` array clears

> If a **non-owner** account calls `withdraw`, the transaction reverts with a gas estimation error — the `onlyOwner` modifier blocks execution before any state changes occur.

---

#### Test Yourself

1. **Challenge:** Interact with the deployed `FundMe` contract on Remix and explore all possible outcomes:
   - Call `fund` with less than $5 USD → expect revert
   - Call `fund` with sufficient ETH → verify state updates on Etherscan
   - Call `withdraw` from a non-owner account → expect revert
   - Call `withdraw` from the owner account → verify balance and mappings reset to zero

---

---

## -----------------------------------------------

### Immutability and Constants in Solidity

#### Overview

Variables that are set only once — either at compile time or at deployment — can be marked `constant` or `immutable` to reduce gas costs and prevent accidental modification.

---

#### The Problem

In the base `FundMe` contract, deploying costs ~859,000 gas. Two variables never change after being set:

- `minimumUSD` — known at compile time
- `owner` — assigned once during deployment

Both are candidates for optimization.

---

#### `constant`

Use `constant` for values known at **compile time**. The variable is not assigned a storage slot, making reads cheaper and faster.

```solidity
uint256 public constant MINIMUM_USD = 5 * 1e18;
```

> **Naming convention:** all caps with underscores (e.g. `MINIMUM_USD`)

**Gas saving:** ~19,000 gas — roughly equivalent to the cost of a simple ETH transfer between two accounts.

> ⚠️ At an ETH price of $3,000, defining `MINIMUM_USD` as `constant` costs ~$9 to deploy, compared to ~$10 as a regular variable.

See the [Solidity documentation](https://solidity.readthedocs.io/) for full reference.

---

#### `immutable`

Use `immutable` for values assigned **once at deployment** (e.g. inside the constructor) that will never change:

```solidity
address public immutable i_owner;

constructor() {
    i_owner = msg.sender;
}
```

> **Naming convention:** prefix with `i_` (e.g. `i_owner`)

Gas savings are similar to `constant`. Like `constant`, `immutable` variables are not stored in a regular storage slot.

> 💡 Don't over-focus on gas optimization at early stages of learning — correctness and readability come first.

---

#### Summary

| Keyword     | When to use                   | Naming convention | Storage slot |
| ----------- | ----------------------------- | ----------------- | ------------ |
| `constant`  | Value known at compile time   | `ALL_CAPS`        | No           |
| `immutable` | Value set once in constructor | `i_varName`       | No           |

---

#### Test Yourself

1. Why would a developer choose `immutable` over `constant` for a specific variable?
2. **Challenge:** Add one `constant` and one `immutable` variable to `FundMe`:

```solidity
// constant: known at compile time
uint256 public constant MINIMUM_USD = 5 * 1e18;

// immutable: set once at deployment
address public immutable i_owner;
uint256 public immutable i_deployedAt;

constructor() {
    i_owner = msg.sender;
    i_deployedAt = block.timestamp;
}
```

---

---

## -----------------------------------------------

### Creating Custom Errors in Solidity

#### Introduction

This lesson explains how to improve gas efficiency in Solidity by replacing traditional `require` statements with **custom errors**, introduced in Solidity `0.8.4`.

The main benefit is reducing gas costs by avoiding storage of long revert strings.

---

### Problem with `require`

A typical `require` statement includes a string message:

```solidity id="qkqzvm"
require(msg.sender == owner, "sender is not an owner");
```

##### Issue

- The error string is stored on-chain
- Each character costs gas
- String handling increases deployment and execution cost

---

### Custom Errors (Gas Efficient Alternative)

Custom errors allow you to define reusable error types with minimal gas cost.

---

#### Defining a Custom Error

```solidity id="jvpsxn"
error NotOwner();
```

Custom errors should be declared at the top of the contract. Outside of the contract.

---

### Using Custom Errors with `revert`

Instead of `require`, use an `if` + `revert` pattern:

```solidity id="hckmrf"
if (msg.sender != i_owner) {
    revert NotOwner();
}
```

---

### Why Custom Errors Are Better

#### Gas Efficiency

- No storage of long strings
- Only error selector is stored
- Much cheaper in deployment and execution

---

#### Cleaner Code

- More explicit error definitions
- Easier to reuse across functions
- Better for large contracts

---

### Example: Full Pattern

```solidity id="qkzqma"
error NotOwner();

contract Example {
    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function onlyOwnerAction() public view {
        if (msg.sender != i_owner) {
            revert NotOwner();
        }
    }
}
```

---

### Comparison: `require` vs Custom Errors

| Feature       | `require(string)` | Custom Errors   |
| ------------- | ----------------- | --------------- |
| Gas cost      | High              | Low             |
| Error message | Stored on-chain   | Not stored      |
| Readability   | Simple            | More structured |
| Reusability   | Low               | High            |

---

### When to Use Custom Errors

Use custom errors when:

- optimizing gas is important
- building large smart contracts
- deploying to mainnet
- repeated validation logic exists

---

### Additional Exercise

Create a custom error for zero address validation:

```solidity id="xwqvkt"
error ZeroAddress();

function checkAddress(address _addr) public pure {
    if (_addr == address(0)) {
        revert ZeroAddress();
    }
}
```

#### Before vs After

```solidity
// Before (expensive string storage)
require(msg.sender == i_owner, "Sender is not owner");

// After (gas-efficient custom error)
if (msg.sender != i_owner) {
    revert NotOwner();
}
```

---

#### Test Yourself

1. What are the benefits of custom errors over `require` with a string message?
2. **Challenge:** Create a custom error for `address(0)` and implement it with `if` + `revert`:

```solidity
error ZeroAddress();

function setRecipient(address _recipient) public {
    if (_recipient == address(0)) {
        revert ZeroAddress();
    }
    // continue logic
}
```

---

### Key Concepts

- Custom errors reduce gas usage
- Introduced in Solidity 0.8.4
- Replace string-based `require` messages
- Use `if + revert` pattern
- Improve scalability of smart contracts

---

---

---

## -----------------------------------------------

### Implementing `receive` and `fallback` in Solidity

#### Introduction

In Solidity, if ETH is sent to a contract without a `receive` or `fallback` function, the transaction is rejected.

This lesson explains how the special `receive` and `fallback` functions work and how they help contracts properly handle direct ETH transfers and unknown function calls.

---

### `receive` and `fallback` Functions

Both functions are special Solidity functions used to handle incoming transactions.

Characteristics:

- must be declared `external`
- can be marked `payable`
- do not return values

---

### Basic Example

```solidity id="pnshjg"
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FallbackExample {
    uint256 public result;

    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}
```

---

### How They Work

#### `receive()`

Triggered when:

- ETH is sent directly to the contract
- `msg.data` is empty

Example:

```solidity id="mgijti"
receive() external payable {
    result = 1;
}
```

---

#### `fallback()`

Triggered when:

- a non-existent function is called
- transaction contains data
- `receive()` does not exist

Example:

```solidity id="wepkww"
fallback() external payable {
    result = 2;
}
```

---

### Execution Flow

```text id="vhulkw"
Ether sent to contract
        |
   is msg.data empty?
      /         \
    yes         no
    /             \
receive()?      fallback()
   /   \
 yes    no
 /        \
receive() fallback()
```

---

### Using `receive` and `fallback` in `FundMe`

A contract can redirect direct ETH transfers to the `fund()` function.

```solidity id="gxnqme"
receive() external payable {
    fund();
}

fallback() external payable {
    fund();
}
```

---

### Why This Is Useful

Without these functions:

- direct ETH transfers fail
- contributions are not recorded

With this implementation:

- ETH transfers succeed
- users are added to the `funders` array
- contributions are tracked automatically

---

### Example Scenario

A user sends ETH directly through:

- MetaMask
- wallet transfer
- block explorer

Even without calling `fund()` manually:

```text id="mlzzzk"
receive() → fund()
```

The contribution is still processed correctly.

---

### Gas Consideration

Directly calling `fund()` costs less gas.

However, using `receive` and `fallback` improves usability and prevents accidental failed transactions.

---

### Difference Between `receive` and `fallback`

| Function     | Trigger Condition                        |
| ------------ | ---------------------------------------- |
| `receive()`  | ETH sent with empty calldata             |
| `fallback()` | Unknown function call or calldata exists |

---

### Important Behavior

If:

- ETH is sent WITH data
- only `receive()` exists

then:

```text id="rctoyp"
the transaction reverts
```

because `receive()` only handles empty calldata.

---

### Complete Example

```solidity id="ibqlxl"
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FundMe {

    address[] public funders;

    function fund() public payable {
        funders.push(msg.sender);
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
```

---

### Key Concepts

| Concept             | Description                   |
| ------------------- | ----------------------------- |
| `receive()`         | Handles plain ETH transfers   |
| `fallback()`        | Handles unknown calls/data    |
| `payable`           | Allows receiving ETH          |
| `msg.data`          | Transaction calldata          |
| Direct ETH transfer | Can trigger special functions |

---

```
// ETH is sent to contract
//      is msg.data empty?
//          /   \
//         yes   no
//         /      \
//    receive()?  fallback()
//     /   \
//   yes    no
//   /        \
// receive()  fallback()
```

Reference: [Solidity by Example — Fallback](https://solidity-by-example.org/fallback/)

---

#### Applying to `FundMe`

To ensure ETH sent directly to the contract (without calling `fund`) is still properly tracked, redirect both functions to `fund()`:

```solidity
receive() external payable {
    fund();
}

fallback() external payable {
    fund();
}
```

When a user sends Sepolia ETH via MetaMask without calling `fund` directly, `receive` fires and routes the transaction through `fund`. The `funders` array and `addressToAmountFunded` mapping are updated as expected.

> **Note:** Directly calling `fund()` costs less gas than going through `receive` or `fallback`, but this approach ensures every ETH contribution is properly acknowledged and credited.

---

#### Test Yourself

1. How does `fallback` differ from `receive`?
2. What happens when ETH is sent with `msg.data` but only a `receive` function is defined in the contract?

- If ETH is sent with msg.data but only receive exists, the transaction will revert. receive only handles calls with empty msg.data. Without a fallback to catch the data case, the EVM has nowhere to route the call and rejects it entirely.

---

---

## -----------------------------------------------

### Solidity Events and `emit`

#### Overview

`emit` fires an **event** — a way for a contract to write a log entry on the blockchain that external applications (frontends, indexers, block explorers) can listen for and react to. Events are not readable by other contracts.

---

#### Declaring an Event

```solidity
event FundReceived(address indexed funder, uint256 amount);
```

#### Emitting It

```solidity
function fund() public payable {
    require(msg.value >= MINIMUM_USD, "Not enough ETH");
    emit FundReceived(msg.sender, msg.value);
}
```

---

#### Key Points

- **Events are cheap** — logging costs far less gas than writing to a state variable
- **Not readable on-chain** — only off-chain tools (ethers.js, The Graph, Etherscan) can read event logs; contracts cannot read their own logs
- **`indexed` parameters** allow off-chain tools to filter events efficiently — up to **3 parameters** per event can be indexed

```javascript
// Listening in JS with ethers.js
contract.on("FundReceived", (funder, amount) => {
  console.log(`${funder} sent ${amount}`);
});
```

---

#### Common Use Cases

| Use case                | Example event                                      |
| ----------------------- | -------------------------------------------------- |
| Track ETH sent          | `FundReceived(address funder, uint256 amount)`     |
| Track ownership changes | `OwnerChanged(address oldOwner, address newOwner)` |
| Track withdrawals       | `Withdrawn(address owner, uint256 amount)`         |

---

#### In the Context of `FundMe`

Adding events to `fund` and `withdraw` gives full visibility into contract activity without extra storage gas costs:

```solidity
event FundReceived(address indexed funder, uint256 amount);
event Withdrawn(address indexed owner, uint256 amount);

function fund() public payable {
    require(getConversionRate(msg.value) >= MINIMUM_USD, "Not enough ETH");
    addressToAmountFunded[msg.sender] += msg.value;
    funders.push(msg.sender);
    emit FundReceived(msg.sender, msg.value);
}

function withdraw() public onlyOwner {
    // ... reset logic
    emit Withdrawn(i_owner, address(this).balance);
}
```

---

---

## -----------------------------------------------

---

---

## -----------------------------------------------

# References

- [Solidity Documentation — Custom Errors](https://docs.soliditylang.org/en/latest/control-structures.html?utm_source=chatgpt.com#revert)
- [Solidity v0.8.4 Release Notes](https://docs.soliditylang.org/en/latest/080-breaking-changes.html?utm_source=chatgpt.com)
- [Solidity By Example — Error Handling](https://solidity-by-example.org/error/?utm_source=chatgpt.com)
- [Ethereum Smart Contract Best Practices](https://consensys.github.io/smart-contract-best-practices/?utm_source=chatgpt.com)
