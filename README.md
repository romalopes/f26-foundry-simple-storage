## Initialising a Foundry Project

Run [`forge init`](https://book.getfoundry.sh/projects/creating-a-new-project) to create a new Foundry project in the current directory:

```bash
forge init
```

To create the project in a new subfolder:

```bash
forge init nameOfNewFolder
```

> **Note:** `forge init` expects an empty folder by default. If the folder already has content, use:
>
> ```bash
> forge init --force .
> ```

If you encounter Git configuration errors, set your credentials first:

```bash
git config --global user.email "yourEmail@provider.com"
git config --global user.name "yourUsername"
```

---

#### Project Structure

After `forge init`, your folder will look like this:

```
f26-foundry-simple-storage/
├── lib/          ### installed dependencies (forge-std, openzeppelin, etc.)
├── script/       ### deployment and interaction scripts
├── src/          ### your smart contracts
├── test/         ### your tests
└── foundry.toml  ### Foundry configuration
```

| Folder / File  | Purpose                                              |
| -------------- | ---------------------------------------------------- |
| `lib/`         | Dependencies — includes `forge-std` by default       |
| `script/`      | Scripts for deploying and interacting with contracts |
| `src/`         | Smart contract source files                          |
| `test/`        | Test files                                           |
| `foundry.toml` | Project-wide Foundry configuration                   |

---

#### Adding Your Contract

1. Right-click `src` → **New File** → name it `SimpleStorage.sol`
2. Copy the contract code from the [Cyfrin GitHub repository](https://github.com/Cyfrin/foundry-simple-storage-f23/blob/main/src/SimpleStorage.sol)

---

#### Cleanup

Delete the default placeholder files Foundry creates:

```bash
rm src/Counter.sol
rm script/Counter.s.sol
rm test/Counter.t.sol
```

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

---

---

# ---------

# f26-foundry-simple-storage

## Creating a New Foundry Project

#### Setup

Starting from the folder created in the previous lesson:

```bash
mkdir f26-foundry-simple-storage
cd f26-foundry-simple-storage
```

> 💡 Press `Tab` after typing the first few letters of a path to autocomplete — works for commands, folders, and filenames.

Open the folder in VS Code:

```bash
code .
```

Some useful terminal basics before we begin:

```bash
touch randomFile.txt   ### create a file
rm randomFile.txt     ### delete a file
```

For a deeper dive into the terminal, check out the [Ubuntu command line tutorial](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview).

---

---

# ---------

## Compiling a Smart Contract with Foundry

#### Compiling

In your terminal, run either of these commands to compile all contracts in your project:

```bash
forge build
### or
forge compile
```

---

#### Output Folders

After compilation two new folders appear:

| Folder   | Purpose                                                                                                                                                                                                                      |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `out/`   | Compilation artifacts — contains the contract's [ABI](https://docs.soliditylang.org/en/latest/abi-spec.html), [Bytecode](https://www.geeksforgeeks.org/introduction-to-bytecode-and-opcode-in-solidity/), and other metadata |
| `cache/` | Temporary files used to speed up recompilation — safe to ignore                                                                                                                                                              |

The `out/` folder is the important one. Inside you'll find a JSON file per contract containing everything needed to deploy and interact with it.

---

#### Terminal Tip: Arrow Keys

You'll be running `forge build`, `forge test`, and `forge script` constantly. Instead of retyping commands, press:

- `↑` — cycle back through previous commands
- `↓` — cycle forward

Try it:

```bash
echo "I like Foundry"
echo "I love Cyfrin"
echo "Auditing is great"
```

Then use `↑` / `↓` to navigate between them — much faster than retyping.

---

---

# ---------

## Deploying a Smart Contract Locally Using Anvil

#### Overview

There are multiple ways to deploy a smart contract. During development with Foundry, the easiest option is **Anvil** — a local testnet node shipped with Foundry.

---

#### Running Anvil

```bash
anvil
```

This spins up a local blockchain with:

```
anvil


                             _   _
                            (_) | |
      __ _   _ __   __   __  _  | |
     / _` | | '_ \  \ \ / / | | | |
    | (_| | | | | |  \ V /  | | | |
     \__,_| |_| |_|   \_/   |_| |_|

    1.7.1 (4072e48705 2026-05-08T07:54:31.470926000Z)
    https://github.com/foundry-rs/foundry

Available Accounts
==================

(0) 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 (10000.000000000000000000 ETH)
(1) 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 (10000.000000000000000000 ETH)
(2) 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC (10000.000000000000000000 ETH)
(3) 0x90F79bf6EB2c4f870365E785982E1f101E93b906 (10000.000000000000000000 ETH)
(4) 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65 (10000.000000000000000000 ETH)
(5) 0x9965507D1a55bcC2695C58ba16FB37d819B0A4dc (10000.000000000000000000 ETH)
(6) 0x976EA74026E726554dB657fA54763abd0C3a0aa9 (10000.000000000000000000 ETH)
(7) 0x14dC79964da2C08b23698B3D3cc7Ca32193d9955 (10000.000000000000000000 ETH)
(8) 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f (10000.000000000000000000 ETH)
(9) 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720 (10000.000000000000000000 ETH)

Private Keys
==================

(0) 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
(1) 0x59c6995e998f97a5a0044966f0945389dc9e86dae88c7a8412f4603b6b78690d
(2) 0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a
(3) 0x7c852118294e51e653712a81e05800f419141751be58f605c371e15141b007a6
(4) 0x47e179ec197488593b187f80a00eb0da91f1b9d0b13f8733639f19c30a34926a
(5) 0x8b3a350cf5c34c9194ca85829a2df0ec3153be0318b5e2d3348e872092edffba
(6) 0x92db14e403b83dfe3df233f83dfa3a0d7096f21ca9b0d6d6b8d88b2b4ec1564e
(7) 0x4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356
(8) 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97
(9) 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6

Wallet
==================
Mnemonic:          test test test test test test test test test test test junk
Derivation path:   m/44'/60'/0'/0/


Chain ID
==================

31337

Base Fee
==================

1000000000

Gas Limit
==================

30000000

Genesis Timestamp
==================

1779578460

Genesis Number
==================

0

Listening on 127.0.0.1:8545
```

- 10 test addresses, each funded with 10,000 ETH
- Their associated private keys
- A local RPC endpoint at `http://127.0.0.1:8545`

> The RPC URL `http://127.0.0.1:8545` is what you'll use as the `RPC_URL` parameter when deploying contracts to Anvil.

Press `Ctrl + C` (or `Cmd + C`) to stop Anvil.

More details in the [Anvil documentation](https://book.getfoundry.sh/anvil/).

---

#### Alternative: Ganache

[Ganache](https://trufflesuite.com/ganache/) is another personal blockchain for local Ethereum development. Download and hit **Quickstart Ethereum** to get a local blockchain with funded addresses and private keys.

> **Windows WSL users:** Ganache can be tricky to configure in WSL. Since it won't be used later in the course, don't worry if setup doesn't work.

---

#### Configuring MetaMask for a Local Network

To interact with Anvil or Ganache via MetaMask:

1. Open MetaMask → three dots → **Expand View**
2. Go to **Settings → Networks**
3. Click **Add a Network → Add a Network manually**
4. Enter the following details:

| Field              | Anvil                   | Ganache                   |
| ------------------ | ----------------------- | ------------------------- |
| Network name       | Localhost               | Localhost                 |
| RPC URL            | `http://127.0.0.1:8545` | `http://127.0.0.1:7545`   |
| Chain ID           | `31337`                 | `5777` (sometimes `1337`) |
| Currency symbol    | ETH                     | ETH                       |
| Block explorer URL | —                       | —                         |

> Always verify the exact RPC URL and Chain ID in the Anvil terminal or Ganache UI — they can differ per machine.

---

#### Importing a Local Account into MetaMask

1. Click the **account selector** at the top of MetaMask
2. Click **Add account or hardware wallet → Import account**
3. Paste a private key from Anvil or Ganache
4. Click **Import**

> ⚠️ These accounts are for **local testing only**. Their private keys are public — never use them on mainnet or any real network.

---

---

# ----------------------------

# Deploying a Smart Contract with `forge create`

## Exploring Forge

```bash
forge --help
forge create --help
```

Full reference: [forge create documentation](https://book.getfoundry.sh/reference/forge/forge-create)

---

## Why `forge create SimpleStorage` Fails

Running `forge create SimpleStorage` alone fails because two required parameters are missing:

1. **Where to deploy?** — an RPC URL pointing to a running blockchain
2. **Who pays the gas?** — a private key to sign the transaction

By default, Forge tries `http://localhost:8545/` — if nothing is running there, it fails.

---

## Deploying to Anvil

Anvil is the preferred local chain going forward. Run these steps in order:

```bash
# 1. Clear the terminal
clear

# 2. Start Anvil
anvil

# 3. Open a new terminal tab (+), then deploy
#    (no --rpc-url needed — Forge defaults to Anvil's http://127.0.0.1:8545)
forge create SimpleStorage --interactive
```

Paste a private key from the Anvil terminal output when prompted.

After deployment, the Anvil terminal shows:

```
Transaction: 0x40d2ca8f...
Contract created: 0x5fbdb231...
Gas used: 357076

Block Number: 1
Block Hash: 0x85a56c0b...
Block Time: "Mon, 15 Apr 2024 11:50:55 +0000"
```

---

## Explicit Deployment (All Parameters)

The most explicit form — no defaults, no interactive prompts:

```bash
forge create SimpleStorage \
  --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

> ⚠️ Passing private keys directly via `--private-key` is convenient for local testing but **never do this with real keys**. The next lesson covers private key safety — arguably the most important topic in this course.

````md
# Deploying Smart Contracts Locally with Forge

## Introduction

`forge create` is the Foundry command used to deploy smart contracts.

To see all available options:

```bash
forge --help
forge create --help
```
````

Official documentation:

- [https://book.getfoundry.sh/reference/forge/forge-create](https://book.getfoundry.sh/reference/forge/forge-create)

---

# Requirements for Deployment

When deploying a smart contract, Forge needs two things:

1. RPC URL → Where to deploy
2. Private Key → Who signs and pays for the transaction

---

# Deploying with Anvil (Recommended)

Anvil is Foundry’s local Ethereum blockchain node.

Start it:

```bash
anvil
```

Anvil automatically:

- starts a local blockchain
- creates funded test accounts
- exposes the default RPC URL:

```text
http://127.0.0.1:8545
```

---

# Deploy to Anvil

Open a second terminal and run:

```bash
forge create SimpleStorage --interactive
```

We do not need to specify `--rpc-url` because Forge defaults to Anvil’s local RPC endpoint.

Paste one of Anvil’s private keys.

Example deployment output:

```text
Transaction: 0x40d2ca8f0d680f098c7d5e3c127ef1ce1207ef439ba6e163c2042483e15998a6
Contract created: 0x5fbdb2315678afecb367f032d93f642f64180aa3
Gas used: 357076

Block Number: 1
Block Hash: 0x85a56c0b8f166e86d1cce65412615e0d9a72972e04b2488023275131ea27330a
Block Time: Mon, 15 Apr 2024 11:50:55 +0000
```

---

# Explicit Deployment Command

Instead of interactive mode:

```bash
forge create SimpleStorage \
  --rpc-url http://127.0.0.1:8545 \
  --private-key YOUR_PRIVATE_KEY
```

This explicitly specifies:

- blockchain RPC endpoint
- deployment wallet/private key

---

# Important Concepts

## RPC URL

RPC endpoints connect applications to a blockchain.

Examples:

| Network          | RPC URL                 |
| ---------------- | ----------------------- |
| Anvil            | `http://127.0.0.1:8545` |
| Sepolia          | Remote RPC Provider     |
| Ethereum Mainnet | Remote RPC Provider     |

---

# Private Key Safety

⚠️ Extremely Important

Private keys:

- control wallets
- sign transactions
- authorize deployments

Never:

- commit private keys to GitHub
- share them publicly
- hardcode real private keys in projects

Anvil and Ganache keys are test-only and safe for local learning.

For production deployments, use:

- `.env` files
- hardware wallets
- encrypted keystores

---

# Useful Forge Deployment Flags

| Flag            | Purpose                 |
| --------------- | ----------------------- |
| `--rpc-url`     | Blockchain endpoint     |
| `--private-key` | Deployment wallet       |
| `--interactive` | Prompt for key securely |
| `--broadcast`   | Send real transaction   |
| `--verify`      | Verify source code      |

---

# Typical Local Development Workflow

## Start Local Blockchain

```bash
anvil
```

## Build Contracts

```bash
forge build
```

## Run Tests

```bash
forge test
```

## Deploy Contract

```bash
forge create SimpleStorage --interactive
```

---

# Recommended Development Stack

| Tool      | Purpose                     |
| --------- | --------------------------- |
| Foundry   | Smart contract toolkit      |
| Anvil     | Local blockchain            |
| VS Code   | Development environment     |
| Remix IDE | Visual contract interaction |
| Tenderly  | Advanced debugging          |

---

# Key Takeaways

- `forge create` deploys smart contracts
- Deployments require:
  - RPC URL
  - signer/private key

- Ganache and Anvil are local blockchains
- Anvil is the preferred modern workflow for Foundry
- Private key security is critical
- Local development uses test accounts only

```

```

---

---

# ----------------------------

# Private Key Safety

## Introduction

Private key security is one of the most important aspects of blockchain development.

A private key:

- controls access to your wallet
- signs transactions
- authorizes smart contract deployments

Anyone with access to your private key has full control over your funds.

---

## The Risk

Having a private key in plain text is extremely dangerous. Even worse — it may persist in your shell history without you realising:

```bash
# Hit ↑ after deploying and you'll see your key exposed like this:
forge create SimpleStorage --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec...
```

> **Note:** The Anvil/Ganache keys used in the previous lesson are well-known public test keys — keeping them in plain text for local testing is acceptable. Any other key, especially one associated with real funds, must never be exposed.

Clear your terminal history immediately after exposing a key:

```bash
history -c
```

---

# Never Expose Real Private Keys

⚠️ Keeping private keys in plain text is extremely dangerous.

The private keys used with:

- Anvil
- Ganache

are public test keys meant only for local development.

These keys should NEVER be used on:

- Ethereum Mainnet
- Testnets with real funds
- Production environments

---

## Real-World Consequences

Exposed private keys are one of the leading causes of catastrophic losses in crypto:

- [The Ronin Hack](https://www.halborn.com/blog/post/explained-the-ronin-hack-march-2022) — social engineering of private keys
- [Bo Shen lost $42M](https://www.bnnbloomberg.ca/early-crypto-investor-bo-shen-says-he-lost-42-million-in-wallet-hack-1.1850446) in a wallet hack
- [The $477M FTX hack](https://www.elliptic.co/blog/the-477-million-ftx-hack-following-the-blockchain-trail) — private keys stored in unencrypted form, leading to over $150M stolen from Alameda Research alone

Examples include:

- The Ronin Hack
- The FTX Wallet Exploit
- Wallet compromises through social engineering
- Unencrypted production keys
- Exposed secrets in GitHub repositories

Millions — sometimes billions — have been lost because of weak operational security.

---

## Your Safety Promise

Create a file called `Promise.md` in your project and write the following:

```text id="b4e49s"
Promise.md
```

```markdown
I promise to never use my private key associated with real money in plain text.
```

Consider sharing this publicly and tagging [@PatrickAlphaC](https://twitter.com/PatrickAlphaC) and [@CyfrinUpdraft](https://twitter.com/CyfrinUpdraft) to hold yourself accountable.

---

# Best Practices for Private Key Safety

## Never:

- commit private keys to GitHub
- share keys publicly
- hardcode keys in projects
- store production keys in plain text
- expose keys during livestreams or screenshots

---

# Safer Alternatives

Use:

- `.env` files
- encrypted keystores
- hardware wallets
- password managers
- deployment wallets with limited funds

---

# Future Improvements

In future lessons, safer workflows include:

- environment variables
- encrypted accounts
- secure RPC providers
- Alchemy integrations
- safer deployment scripts

---

# Important Takeaways

- Private keys control your crypto assets
- Plain text keys are extremely dangerous
- Shell history can leak secrets
- Test keys are safe only for local development
- Security habits are essential for Web3 developers

---

## What's Next

Upcoming lessons will cover:

- Getting free RPC URLs via **Alchemy** for any blockchain
- Safer methodologies for handling private keys in Foundry

# References

- [https://book.getfoundry.sh/](https://book.getfoundry.sh/)
- [https://book.getfoundry.sh/reference/forge/forge-create](https://book.getfoundry.sh/reference/forge/forge-create)
- [https://www.alchemy.com/](https://www.alchemy.com/)

---

---

# ----------------------------

# Deploying Smart Contracts Locally Using Foundry Scripts

## Introduction

Deploying smart contracts via scripts provides:

- reproducible deployments
- automation
- better testing workflows
- easier maintenance

Unlike `forge create`, scripting allows deployments to be fully programmable using Solidity.

One major advantage of Foundry is that deployment scripts are also written in Solidity.

---

# Foundry Script Conventions

Scripts are stored inside the:

```text
script/
```

directory.

Naming conventions:

- Scripts → `.s.sol`
- Tests → `.t.sol`

## Creating the Script

Create `script/DeploySimpleStorage.s.sol` — the `.s.sol` suffix is the naming convention for Foundry scripts (tests use `.t.sol`).

Example:

```text
script/DeploySimpleStorage.s.sol
```

> **Note:** `forge-std` (Forge Standard Library) is a collection of pre-written Solidity contracts that enhance scripting and testing within Foundry.

---

# Basic Script Structure

Create:

```text
script/DeploySimpleStorage.s.sol
```

Initial structure:

```solidity
// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract DeploySimpleStorage {

}
```

---

# Importing Foundry Script Utilities

To use Foundry scripting functionality:

- import `Script`
- inherit from `Script`

We also import the contract we want to deploy.

```solidity
// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {

}
```

---

# Forge Standard Library (`forge-std`)

`forge-std` (Forge Standard Library) is a collection of helper contracts used for:

- scripting
- testing
- cheatcodes
- debugging

Reference:

- [https://github.com/foundry-rs/forge-std](https://github.com/foundry-rs/forge-std)

---

# The `run()` Function

Every Foundry script uses a main function called:

```solidity
run()
```

This is the function executed when running:

```bash
forge script
```

Full deployment script:

```solidity
// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast();

        SimpleStorage simpleStorage = new SimpleStorage();

        vm.stopBroadcast();

        return simpleStorage;
    }
}
```

### Key components

| Element               | Purpose                                                        |
| --------------------- | -------------------------------------------------------------- |
| `import {Script}`     | Gives access to Foundry's scripting features                   |
| `is Script`           | Makes this contract a Foundry script                           |
| `run()`               | The main entry point — called by `forge script`                |
| `vm.startBroadcast()` | Marks the start of transactions to send to the RPC             |
| `vm.stopBroadcast()`  | Marks the end of those transactions                            |
| `new SimpleStorage()` | Deploys a new instance of the contract                         |
| `vm`                  | A Foundry **cheat code** — only works in Foundry scripts/tests |

For Foundry scripting best practices see the [official docs](https://book.getfoundry.sh/tutorials/solidity-scripting).

---

# Understanding `vm`

`vm` is a Foundry cheatcode interface.

Cheatcodes are special Foundry-only utilities used for:

- scripting
- testing
- debugging
- manipulating blockchain state

The `vm` keyword only works inside Foundry.

---

# `vm.startBroadcast()` and `vm.stopBroadcast()`

## Start Broadcasting

```solidity
vm.startBroadcast();
```

Marks the beginning of transactions that should be sent to the blockchain RPC.

---

## Stop Broadcasting

```solidity
vm.stopBroadcast();
```

Marks the end of transactions that should be broadcasted.

---

# Deploying the Contract

Inside the broadcast block:

```solidity
SimpleStorage simpleStorage = new SimpleStorage();
```

The `new` keyword deploys a new smart contract instance.

---

# Running the Script

### Without an RPC URL (dry run)

Run:

```bash
forge script script/DeploySimpleStorage.s.sol
```

Expected output:

```text
[⠆] Compiling...
[⠔] Compiling 2 files with 0.8.19
[⠒] Solc 0.8.19 finished in 1.08s
Compiler run successful!
Script ran successfully.
Gas used: 338569

== Return ==
0: contract SimpleStorage 0x90193C961A926261B756D1E5bb255e67ff9498A1
```

Foundry automatically launches a temporary Anvil instance, runs the script, then shuts it down. Nothing is permanently deployed.

---

# Important Behavior Without RPC URL

If no RPC URL is provided:

```bash
forge script script/DeploySimpleStorage.s.sol
```

Foundry automatically:

1. starts a temporary Anvil instance
2. runs the script
3. shuts down Anvil

No persistent blockchain deployment occurs.

---

# Running Against a Local Anvil Node

Start Anvil:

```bash
anvil
```

Then run:

```bash
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545
```

Expected output:

```text
SIMULATION COMPLETE.
To broadcast these transactions, add --broadcast
```

This runs a **simulation** — no transactions are actually broadcast. A `broadcast/` folder is created with details of the simulated run for future reference.

---

# Simulation vs Real Deployment

⚠️ Important:

Without `--broadcast`, Foundry only simulates transactions.

This means:

- no real deployment occurs
- no blockchain state changes happen

---

# Broadcasting Transactions - With broadcast (actual deployment)

To actually deploy the contract:

```bash
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545 \
    --broadcast \
    --private-key YOUR_PRIVATE_KEY
```

or

```bash
forge script script/DeploySimpleStorage.s.sol \
  --rpc-url http://127.0.0.1:8545 \
  --broadcast \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

After a successful deployment, the Anvil terminal confirms:

```
Transaction: 0x73eb9fb4...
Contract created: 0x5fbdb231...
Gas used: 357088

Block Number: 1
Block Hash: 0x8ea564f1...
Block Time: "Tue, 16 Apr 2024 13:39:51 +0000"
```

```
Script ran successfully.

== Return ==
0: contract SimpleStorage 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0

## Setting up 1 EVM.

==========================

Chain 31337

Estimated gas price: 1.759273551 gwei

Estimated total gas used for script: 723336

Estimated amount required: 0.001272545893286136 ETH

==========================

##### anvil-hardhat
✅  [Success] Hash: 0x6a5a13b2b3c62568d1bc9993e3e18f826daa7eaa6f063d188c4d04cb2d01cc1d
Contract: SimpleStorage
Contract Address: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
Block: 3
Paid: 0.000430530599725941 ETH (556413 gas * 0.773760857 gwei)

✅ Sequence #1 on anvil-hardhat | Total Paid: 0.000430530599725941 ETH (556413 gas * avg 0.773760857 gwei)

==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.

Transactions saved to: /Users/romalopes/Documents/studies/crypto/foundry-f26/f26-foundry-simple-storage/broadcast/DeploySimpleStorage.s.sol/31337/run-latest.json

Sensitive values saved to: /Users/romalopes/Documents/studies/crypto/foundry-f26/f26-foundry-simple-storage/cache/DeploySimpleStorage.s.sol/31337/run-latest.json

```

Now the contract is truly deployed to Anvil.

---

# Anvil Deployment Output

Inside the Anvil terminal:

```text
Transaction: 0x73eb9fb4ef7b159e03c50d669c42e2ec4eeaa9358bea0a710cb07168e5192570
Contract created: 0x5fbdb2315678afecb367f032d93f642f64180aa3
Gas used: 357088

Block Number: 1
Block Hash: 0x8ea564f146e04bb36fc27f0b491223a023b5882d2fcfce3ff85e0dd152e611e4
```

---

# Broadcast Folder

After running scripts, Foundry creates:

```text
broadcast/
```

This folder stores:

- deployment metadata
- transaction information
- script run history

Useful for:

- debugging
- tracking deployments
- reproducing deployments

---

## Summary: Three Modes

| Command                                  | RPC URL  | `--broadcast` | Result                              |
| ---------------------------------------- | -------- | ------------- | ----------------------------------- |
| `forge script ...`                       | None     | No            | Temp Anvil instance, no persistence |
| `forge script ... --rpc-url`             | Provided | No            | Simulation only                     |
| `forge script ... --rpc-url --broadcast` | Provided | Yes           | Real deployment ✅                  |

---

# Important Notes

## Solidity Version Compatibility

Ensure both files use the same Solidity version:

```solidity
pragma solidity 0.8.35;
```

Otherwise compilation errors may occur.

---

# Useful Commands

## Run Script Locally

```bash
forge script script/DeploySimpleStorage.s.sol
```

## Run Simulation Against Anvil

```bash
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545
```

## Broadcast Real Deployment

```bash
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545 \
    --broadcast \
    --private-key YOUR_PRIVATE_KEY
```

---

# Key Takeaways

- Foundry deployment scripts are written in Solidity
- Scripts use the `.s.sol` naming convention
- `vm` provides Foundry cheatcodes
- `vm.startBroadcast()` begins transaction broadcasting
- `vm.stopBroadcast()` ends transaction broadcasting
- Without `--broadcast`, deployments are only simulations
- Foundry automatically spins up temporary Anvil instances if no RPC URL is specified
- The `broadcast/` folder stores deployment information

---

# References

- [https://book.getfoundry.sh/](https://book.getfoundry.sh/)
- [https://book.getfoundry.sh/reference/forge/forge-script](https://book.getfoundry.sh/reference/forge/forge-script)
- [https://github.com/foundry-rs/forge-std](https://github.com/foundry-rs/forge-std)
- [https://eips.ethereum.org/EIPS/eip-3855](https://eips.ethereum.org/EIPS/eip-3855)

```

```

---

---

# ----------------------------

# What is a Blockchain Transaction?

## Introduction

A blockchain transaction is a data structure that records an action performed on a blockchain.

Examples:

- transferring ETH
- deploying smart contracts
- calling smart contract functions
- updating blockchain state

Every state-changing action on Ethereum is executed through a transaction.

---

# Foundry Transaction Records - The `broadcast` Folder

Foundry saves all blockchain interactions in the `broadcast/` folder, organized by `chainId`.

```text id="7u6e1p"
broadcast/
```

folder.

Inside it you may find:

- deployment history
- transaction metadata
- script execution data

Example structure:

```text id="yo2ih6"
broadcast/
├── DeploySimpleStorage.s.sol/
│   ├── 31337/
│   │   ├── run-latest.json
│   │   └── dry-run/
```

> **Note:** `chainId` is a unique identifier for a specific blockchain network, used to distinguish one chain from another and prevent cross-chain replay attacks.

---

# `dry-run/` Folder

The `dry-run/` folder contains simulated transactions interactions made without a running blockchain (e.g. when `--rpc-url` was not specified).

These occur when:

- no RPC URL is provided
- scripts are executed locally without broadcasting

Example:

```bash id="g1f8kc"
forge script script/DeploySimpleStorage.s.sol
```

Foundry temporarily creates an Anvil instance, simulates the transactions, and stores the results in `dry-run/`.

---

# Chain ID

Each blockchain network has a unique identifier called a:

```text id="e0zuw0"
chainId
```

Examples:

| Network          | Chain ID   |
| ---------------- | ---------- |
| Ethereum Mainnet | `1`        |
| Sepolia          | `11155111` |
| Anvil            | `31337`    |

Chain IDs:

- distinguish blockchains
- prevent replay attacks
- ensure transaction integrity

---

# Transaction JSON Example

Open `broadcast/run-latest.json` to inspect the last deployment. It contains `transactionType`, `contractName`, `contractAddress`, and the raw transaction data:

Inside `run-latest.json`:

```json id="g7t43r"
{
  "transaction": {
    "from": "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266",
    "to": null,
    "gas": "0x714e1",
    "value": "0x0",
    "input": "0x608060...",
    "nonce": "0x0",
    "chainId": "0x7a69",
    "accessList": null,
    "type": null
  }
}
```

---

# Transaction Fields Explained

| Field        | Description                                                                                                             |
| ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `from`       | The address that signed and sent the transaction                                                                        |
| `to`         | The recipient. `null` / `address(0)` means a new contract is being deployed                                             |
| `gas`        | Gas spent, in hex. Convert with `cast --to-base 0x714e1 dec`                                                            |
| `value`      | Amount of ETH sent. `0x0` = no ETH transferred                                                                          |
| `input`      | For deployments: the deployment bytecode + contract bytecode. For calls: the function selector + parameters             |
| `nonce`      | A unique incrementing counter per account — ensures each transaction is processed only once and prevents replay attacks |
| `accessList` | Optional list of addresses and storage keys the transaction will access, used to optimize gas costs                     |
| `v, r, s`    | Components of the cryptographic signature — prove the transaction was authorized by the sender's private key            |

## `from`

```json id="68ns6y"
"from": "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266"
```

The sender address.

This is the account that:

- signed the transaction
- paid gas fees

---

# `to`

```json id="dcmnru"
"to": null
```

The transaction recipient.

When deploying a contract:

- `to` is `null`
- or `address(0)`

because the contract does not yet exist.

---

# `gas`

```json id="aax4l6"
"gas": "0x714e1"
```

The gas limit for the transaction.

Gas values are commonly represented in hexadecimal.

Convert hex to decimal using:

```bash id="wxxup0"
cast --to-base 0x714e1 dec
```

---

# `value`

```json id="y72rv5"
"value": "0x0"
```

Amount of ETH sent with the transaction.

For contract deployment:

- usually `0`

But you can deploy contracts with initial ETH funding.

---

# `input`

```json id="9j5v1s"
"input": "0x608060..."
```

The transaction calldata.

For deployments this contains:

- deployment bytecode
- compiled smart contract code

---

# `nonce`

```json id="3nkg2v"
"nonce": "0x0"
```

A unique transaction counter per account.

The nonce:

- starts at `0`
- increments after every transaction

Purpose:

- prevents replay attacks
- guarantees transaction ordering

---

# `accessList`

```json id="j70q8h"
"accessList": null
```

Ethereum optimization feature.

Access lists:

- predefine storage locations
- reduce gas costs
- improve execution efficiency

---

# `type`

```json id="i6llhs"
"type": null
```

Transaction format/type.

This can define:

- legacy transactions
- EIP-1559 transactions
- future transaction standards

Ignore for now during early learning.

---

# Transaction Signatures (`v`, `r`, `s`)

Transactions also contain cryptographic signature values:

- `v`
- `r`
- `s`

These prove:

- authenticity
- ownership
- integrity

The signature is generated using the sender’s private key.

---

# Important Concept

⚠️ Every blockchain state change requires a transaction.

Examples:

- deploying contracts
- updating storage
- transferring ETH
- minting NFTs

The actual blockchain action is determined mainly by the:

```text id="tqu1vl"
input/data field
```

---

# Foundry `cast` Converting hex values with `cast`

`cast` is a Foundry CLI tool for interacting with Ethereum data.

Example:

```bash id="rkkt0d"
cast --help.
```

[cast documentation](https://book.getfoundry.sh/reference/cast/cast)

Useful for:

- encoding data
- decoding values
- converting hex
- querying blockchains

---

# Useful Commands

## Convert Hex to Decimal

```bash id="x9w0rb"
cast --to-base 0x714e1 dec
```

## View Foundry Script Output

```bash id="v47j4q"
cat broadcast/DeploySimpleStorage.s.sol/31337/run-latest.json
```

---

# Key Takeaways

- Transactions record blockchain actions
- Every state change requires a transaction
- Foundry stores transaction history in `broadcast/`
- `dry-run/` contains simulated transactions
- `nonce` prevents replay attacks
- `gas` measures computational cost
- `input/data` contains contract bytecode or calldata
- Transactions are cryptographically signed using private keys

## Private keys are used to sign every transaction. The `v`, `r`, `s` signature fields are what the network uses to verify authenticity without ever exposing the key itself.

# References

- [https://book.getfoundry.sh/](https://book.getfoundry.sh/)
- [https://book.getfoundry.sh/reference/cast/cast](https://book.getfoundry.sh/reference/cast/cast)
- [https://ethereum.org/en/developers/docs/transactions/](https://ethereum.org/en/developers/docs/transactions/)
- [https://eips.ethereum.org/](https://eips.ethereum.org/)

---

---

# ----------------------------

# Private Key Safety pt.2 — `.env` and Keystores

## Introduction

Using private keys directly in terminal commands is unsafe.

Example of an insecure deployment command:

```bash id="h0w4tq"
# ❌ Never do this with real keys
forge script script/DeploySimpleStorage.s.sol \
  --rpc-url http://127.0.0.1:8545 \
  --broadcast \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

Problems:

- private keys appear in shell history
- secrets may leak through screenshots or recordings
- terminal logs can expose credentials
- repetitive copy-pasting is inconvenient

---

# Using `.env` Files for Development

For local development, environment variables provide a cleaner workflow.

⚠️ Important:

- acceptable only for testing/development
- NEVER expose real production keys this way

---

## Using a `.env` File

### 1. Create `.env` in the project root

```bash
PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
RPC_URL=http://127.0.0.1:8545
```

### 2. Add `.env` to `.gitignore`

Make sure `.env` is listed in `.gitignore` so it is never committed to version control.

### 3. Load the variables into your shell

```bash
source .env
```

Verify they loaded correctly:

```bash
echo $PRIVATE_KEY
echo $RPC_URL
```

### 4. Use the variables in your command

```bash
forge script script/DeploySimpleStorage.s.sol \
  --rpc-url $RPC_URL \
  --broadcast \
  --private-key $PRIVATE_KEY
```

This keeps keys out of plain sight in the command line and makes repeated commands faster to type.

---

---

# Ignore `.env` in Git

Ensure `.env` is included in:

```text id="0v5t1s"
.gitignore
```

Example:

```gitignore id="jzk1qv"
.env
```

This prevents accidentally pushing secrets to GitHub.

---

# Load Environment Variables

Run:

```bash id="hvx6r3"
source .env
```

This loads the variables into the current shell session.

---

# Verify Variables

Check if variables were loaded correctly:

```bash id="n0jlwm"
echo $PRIVATE_KEY
echo $RPC_URL
```

---

# Using Variables in Forge Commands

Replace hardcoded values with environment variables:

```bash id="jlwmq5"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url $RPC_URL \
    --broadcast \
    --private-key $PRIVATE_KEY
```

Benefits:

- cleaner commands
- easier terminal workflow
- less repetitive typing
- hides secrets from immediate command visibility

---

# Important Security Warning

⚠️ `.env` files still store private keys in plain text.

This is NOT secure enough for:

- production wallets
- real funds
- enterprise deployments

`.env` should only be used for:

- local development
- test accounts
- Anvil/Ganache keys

---

# Production-Grade Solution: Keystore Files

Foundry supports encrypted keystore files.

For anything involving real money, Foundry's `--keystore` option stores your private key **encrypted by a password** — it is never available in plain text:

```bash
forge script script/DeploySimpleStorage.s.sol \
  --rpc-url $RPC_URL \
  --broadcast \
  --keystore <PATH_TO_KEYSTORE>
```

or:

```bash id="n9rt2m"
forge script --keystore <PATH>
```

A keystore:

- encrypts the private key
- protects it with a password
- avoids storing secrets in plain text

This is much safer for production deployments.

Run `forge script --help` for full keystore options, or see the [Cyfrin keystore guide](https://github.com/Cyfrin/foundry-full-course-f23?tab=readme-ov-file#can-you-encrypt-a-private-key---a-keystore-in-foundry-yet).

---

# Recommended Security Practices

## For Development

✅ Acceptable:

- `.env` files
- local Anvil keys
- test wallets

As long as:

- `.env` is never committed publicly
- no real funds are involved

---

# For Production

✅ Recommended:

- `--interactive`
- encrypted keystore files
- hardware wallets
- password-protected secrets management

❌ Avoid:

- plain text private keys
- GitHub exposure
- hardcoded secrets

---

## The Rules

| Scenario                     | Recommended approach                           |
| ---------------------------- | ---------------------------------------------- |
| Local testing with test keys | `$PRIVATE_KEY` in `.env` (never commit `.env`) |
| Real money / production      | `--interactive` or `--keystore` with password  |

---

## The .env Pledge

Take the [`.env` Pledge](https://updraft.cyfrin.io/courses/foundry/foundry-simple-storage/envpledge.cyfrin.io) — a commitment to safe key practices that started on GitHub and is now permanently on-chain as a soul-bound NFT. Mint yours to show your commitment to secure development.

The Web3 community created:

```text id="0p4kko"
THE .ENV PLEDGE
```

A commitment to:

- safe key management
- responsible development practices
- avoiding secret exposure

It later evolved into an on-chain pledge with soul-bound NFTs.

---

# Useful Commands

## Load `.env`

```bash id="yxr7kt"
source .env
```

## Verify Variables

```bash id="y2t5ee"
echo $PRIVATE_KEY
echo $RPC_URL
```

## Deploy Using Environment Variables

```bash id="jlwm6x"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url $RPC_URL \
    --broadcast \
    --private-key $PRIVATE_KEY
```

## Use Keystore

```bash id="6ij5zh"
forge script --keystore <PATH>
```

---

# Key Takeaways

- Never expose private keys in terminal commands
- `.env` files are acceptable only for development
- `.env` must be added to `.gitignore`
- Production systems should use encrypted keystores
- Foundry supports secure keystore-based deployments
- Security habits are critical in Web3 development

---

---

# ----------------------------

# Never Use a `.env` File for Private Keys — Encrypt Your Keys Instead

## Introduction

Storing private keys inside `.env` files is no longer considered a secure best practice. The secure alternative is to encrypt your key using **ERC-2335** via Foundry's `cast wallet import`.

Even though `.env` files are commonly used in development, they still:

- store secrets in plain text
- can leak through Git mistakes
- may be exposed through backups or logs
- remain vulnerable on compromised machines

> ⚠️ If you are seeing your private key in plain text anywhere — terminal, file, command — you are doing something wrong.

---

# Recommended Solution: Encrypted Keystores (ERC-2335)

Foundry supports encrypted wallet storage using:

```text id="6l53e7"
ERC-2335 keystores
```

Instead of exposing private keys directly:

- keys are encrypted
- access requires a password
- secrets are never exposed in terminal commands

This is significantly safer than:

- `.env` files
- hardcoded private keys
- terminal copy-pasting

---

# Importing a Wallet Securely

Example private key (Anvil test key only):

```text id="j3j5mi"
0xac0974bec39a17e36...
```

Import the wallet:

```bash id="pqgq2m"
cast wallet import nameOfAccountGoesHere --interactive
```

You will be prompted for:

1. the private key
2. a password to encrypt the keystore

This only needs to be done once. The key is stored encrypted — it is never available in plain text again.

⚠️ Ideally, do this outside VS Code or screen-sharing environments.

---

# What Happens Internally?

Foundry:

- encrypts the private key
- stores it as a keystore file
- protects access with a password

You only need to import the key once.

After that:

- deployments use the encrypted account
- no plain text private keys are needed

---

# Old Unsafe Deployment Method

❌ Avoid:

```bash id="30vuz1"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url $RPC_URL \
    --broadcast \
    --private-key $PRIVATE_KEY
```

Problems:

- exposes secrets
- leaks into shell history
- vulnerable to accidental disclosure

---

# Secure Deployment Method

✅ Recommended:

```bash id="3m9l7s"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545 \
    --broadcast \
    --account nameOfAccountGoesHere \
    --sender 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266
```

Foundry will:

- request the keystore password
- decrypt the key securely
- sign transactions safely

Without the password:

- deployment cannot proceed

---

# Listing Stored Wallets

View configured wallets:

```bash id="m9v2uk"
cast wallet list
```

Useful for:

- checking imported accounts
- managing deployment wallets

---

# Clear Terminal History

After handling secrets, clear terminal history:

```bash id="tr58vr"
history -c
```

This helps reduce accidental exposure of sensitive data.

---

# Why Keystores Are Better

## `.env` Files

❌ Problems:

- plain text storage
- easy to leak
- unsafe for production
- vulnerable to Git mistakes

---

# ERC-2335 Keystores

✅ Benefits:

- encrypted private keys
- password protection
- safer deployments
- no exposed secrets in commands
- production-ready workflow

---

# Security Best Practices

## Never:

- store production keys in `.env`
- expose private keys in terminal commands
- commit secrets to GitHub
- share screenshots containing keys

---

# Recommended:

- encrypted keystores
- password-protected wallets
- hardware wallets
- interactive signing
- secure secrets management

---

# Useful Commands

## Import Wallet

```bash id="lfiv79"
cast wallet import myAccount --interactive
```

It will ask the private key and you can check after.

## List Wallets

```bash id="r5o9gi"
cast wallet list
```

## Deploy Using Encrypted Account

```bash id="1l1c5u"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545 \
    --broadcast \
    --account myAccount \
    --sender YOUR_WALLET_ADDRESS
```

## Clear Terminal History

```bash id="4sm3xn"
history -c
```

---

# Key Takeaways

- `.env` files are not safe for real private keys
- Foundry supports encrypted ERC-2335 keystores
- `cast wallet import` securely stores wallets
- `--account` is safer than `--private-key`
- Password-protected keystores are production-grade
- If your private key is visible in plain text, your workflow is insecure

---

---

# ----------------------------

# Interacting with Smart Contracts Using Foundry Cast

## Introduction

After deploying a smart contract with Anvil and Foundry, we can interact with it directly from the command line using:

```
cast
```

`cast` is Foundry’s command-line tool for interacting with Ethereum-compatible blockchains.

Useful for:

- sending transactions
- reading contract storage
- converting data formats
- interacting with deployed smart contracts

`cast send` signs and publishes a transaction. Run `cast send --help` for full options.

---

# Interacting with a Deployed Contract

Before interacting:

1. start Anvil
2. deploy the contract
3. copy the deployed contract address

Example deployed contract:

```text id="x2yqg0"
0x5FbDB2315678afecb367f032d93F642f64180aa3
```

⚠️ Your contract address may differ.

---

# Sending Transactions with `cast send`

`cast send`:

- signs a transaction
- broadcasts it to the blockchain
- modifies blockchain state

Example:

```bash id="tcfm7f"
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
    "store(uint256)" \
    1337 \
    --rpc-url $ANVIL_RPC_URL \
    --private-key $ANVIL_PRIVATE_KEY_1
```

# Understanding the Command

| Part                         | Description                                            |
| ---------------------------- | ------------------------------------------------------ |
| `cast send`                  | Signs and publishes the transaction                    |
| `0x5FbDB2...`                | The target contract address                            |
| `"store(uint256)"`           | The function signature to call                         |
| `1337`                       | The argument passed to `store()` — any valid `uint256` |
| `--rpc-url $RPC_URL`         | The blockchain endpoint                                |
| `--private-key $PRIVATE_KEY` | The key used to sign the transaction                   |

---

# Private Key

```bash id="mzz5js"
--private-key $PRIVATE_KEY
```

Used to:

- sign the transaction
- pay gas fees
- authorize state changes

⚠️ In production, prefer:

- encrypted keystores
- `--account`
- hardware wallets

---

# Reading Blockchain Data with `cast call`

`cast call`:

- reads blockchain data
- does NOT modify state
- does NOT require gas

Example:

```bash id="7eh41l"
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 \
    "retrieve()"
```

Example output:

```text id="6l2d8m"
0x0000000000000000000000000000000000000000000000000000000000000539
```

---

# Understanding the Return Value

The returned value is hexadecimal.

Convert hex to decimal:

```bash id="cxg3ph"
cast --to-base \
0x0000000000000000000000000000000000000000000000000000000000000539 \
dec
```

Output:

```text id="h9m7n2"
1337
```

This confirms the stored value inside the contract.

---

# Difference Between `send` and `call`

| Command     | Purpose    | Changes State | Requires Gas |
| ----------- | ---------- | ------------- | ------------ |
| `cast send` | Write data | ✅ Yes        | ✅ Yes       |
| `cast call` | Read data  | ❌ No         | ❌ No        |

---

# Common Workflow

## 1. Start Anvil

```bash id="s7o0b9"
anvil
```

---

# 2. Deploy Contract

```bash id="g2v08m"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url http://127.0.0.1:8545 \
    --broadcast
```

---

# 3. Store a Value

```bash id="8pn43i"
cast send CONTRACT_ADDRESS \
    "store(uint256)" \
    1337 \
    --rpc-url $RPC_URL \
    --private-key $PRIVATE_KEY
```

---

# 4. Read Stored Value

```bash id="0nvkpq"
cast call CONTRACT_ADDRESS "retrieve()"
```

---

# Useful Cast Commands

## General Help

```bash id="gjdr8l"
cast --help
```

## Send Help

```bash id="sxtnlf"
cast send --help
```

## Call Help

```bash id="xxs3eh"
cast call --help
```

## Convert Hex to Decimal

```bash id="wcd8mr"
cast --to-base HEX_VALUE dec
```

---

# Key Takeaways

- `cast` is Foundry’s blockchain interaction CLI tool
- `cast send` modifies blockchain state
- `cast call` reads blockchain data
- Function signatures specify contract methods
- Returned blockchain data is often encoded in hexadecimal
- `cast --to-base` converts values between formats
- Smart contracts can be fully interacted with directly from the terminal

---

---

# ----------------------------

# Deploying Smart Contracts to Testnets with Foundry and Alchemy

## Introduction

After deploying locally with Anvil, the next step is deploying smart contracts to a public blockchain testnet such as:

- Sepolia
- Ethereum Mainnet

To do this, we need:

1. a public RPC endpoint
2. a funded wallet/private key
3. Foundry deployment scripts

---

# RPC URLs and Node Providers

Public blockchains require an RPC endpoint to:

- send transactions
- read blockchain data
- deploy contracts

Instead of running a full Ethereum node ourselves, we can use:

```text id="x8w2qt"
Node as a Service (NaaS)
```

providers.

Popular providers:

- [Alchemy](https://www.alchemy.com?utm_source=chatgpt.com)
- [Infura](https://www.infura.io?utm_source=chatgpt.com)
- [QuickNode](https://www.quicknode.com?utm_source=chatgpt.com)
- [Tenderly](https://dashboard.tenderly.co/romalopes/project/infrastructure)
- [chainstack](https://console.chainstack.com/projects)
- [ANKR](https://www.ankr.com/rpc/eth/)
- [buildbear](https://explorer.buildbear.io/intensive-doctoroctopus-e8f1025a)
- [Nodies](https://www.nodies.app/dashboard/networks)

---

# Why Not Use MetaMask RPC Directly?

[MetaMask](https://metamask.io?utm_source=chatgpt.com) includes built-in RPC connections, but:

- they are optimized for MetaMask usage
- not ideal for external deployment tooling

For Foundry deployments, we should use our own RPC endpoint.

---

## Getting an RPC URL with Alchemy

[Alchemy](https://www.alchemy.com/) is a free NaaS platform that provides RPC endpoints for Ethereum and other chains.

1. Sign up at [alchemy.com](https://www.alchemy.com/)
2. Create a new app (e.g. name: `Sepolia Testing`, chain: Ethereum, network: Sepolia)
3. Click **View Key** to copy your HTTPS RPC endpoint

This endpoint works exactly like the Ganache or Anvil local endpoints — just on a real network.

## 1. Create an Alchemy Account

Open:

- [Alchemy Dashboard](https://dashboard.alchemy.com?utm_source=chatgpt.com)

Sign up and create a new application.

---

# 2. Configure the App

Example setup:

- Chain: Ethereum
- Network: Sepolia

This generates an HTTPS RPC endpoint like:

```text id="e6wx8d"
https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
```

This endpoint works similarly to:

- Anvil RPC
- Ganache RPC

---

## Updating `.env`

Replace the local RPC URL and private key with your Sepolia values:

```bash
Sepolia_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
PRIVATE_KEY=your_metamask_private_key_here
```

# Funding a Testnet Wallet

Local Anvil accounts do NOT exist on public testnets.

To deploy on Sepolia:

1. create/use a MetaMask account
2. switch to Sepolia network
3. obtain Sepolia ETH from a faucet

Useful faucets:

- [Alchemy Sepolia Faucet](https://www.alchemy.com/faucets/ethereum-sepolia?utm_source=chatgpt.com)
- [Sepolia Faucet by PoW Faucet](https://sepolia-faucet.pk910.de?utm_source=chatgpt.com)

---

# Exporting a Private Key

⚠️ Never share production private keys.

Inside MetaMask:

1. open account details
2. export private key
3. use ONLY for learning/testnet purposes

4. Switch MetaMask to the **Sepolia** network
5. Select an account that has Sepolia ETH
6. Go to **Account Details → Export Private Key**
7. Confirm with your password and copy the key

> ⚠️ Never share or commit your real private key. Make sure `.env` is in `.gitignore`.

---

# Configuring Environment Variables

Create:

```text id="yxr8n5"
.env
```

Example:

```bash id="4g7uwr"
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_API_KEY
PRIVATE_KEY=YOUR_PRIVATE_KEY
```

---

# Load Environment Variables

```bash id="q3x7f6"
source .env
```

---

# Deploying to Sepolia

Run:

```bash id="6qhm8z"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url $SEPOLIA_RPC_URL \
    --private-key $PRIVATE_KEY \
    --broadcast
```

This:

- signs the deployment transaction
- broadcasts it to Sepolia
- deploys the smart contract publicly

---

# What `--broadcast` Does

Without:

```bash id="qoh0nx"
--broadcast
```

Foundry only simulates the transaction.

With `--broadcast`:

- transactions are actually sent to the blockchain
- gas fees are paid
- blockchain state changes occur

---

# Verifying the Deployment

After deployment, Foundry outputs:

- contract address
- transaction hash

You can verify the deployment on:

- [Sepolia Etherscan](https://sepolia.etherscan.io?utm_source=chatgpt.com)

Paste:

- transaction hash
- contract address

to inspect:

- deployment details
- gas usage
- block confirmations

---

# Monitoring Transactions in Alchemy

Inside the [Alchemy Dashboard](https://dashboard.alchemy.com?utm_source=chatgpt.com) you can monitor:

- RPC requests
- transaction broadcasts
- API usage
- blockchain activity

Useful for:

- debugging
- analytics
- infrastructure monitoring

---

# Security Considerations

⚠️ Important:

- never expose real private keys publicly
- never commit `.env` files
- prefer encrypted keystores for production

Safer alternatives:

- hardware wallets
- ERC-2335 keystores
- interactive signing

---

# Typical Deployment Workflow

## 1. Start with Local Development

```bash id="q4h3sm"
anvil
```

---

# 2. Test Locally

```bash id="g0j9a1"
forge test
```

---

# 3. Configure Public RPC

```bash id="w2v4ei"
source .env
```

---

# 4. Deploy to Sepolia

```bash id="q4d77g"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url $SEPOLIA_RPC_URL \
    --private-key $PRIVATE_KEY \
    --broadcast
```

---

# 5. Verify on Etherscan

Search:

- transaction hash
- contract address

on:

- [Sepolia Etherscan](https://sepolia.etherscan.io?utm_source=chatgpt.com)

---

# Key Takeaways

- Public deployments require RPC providers
- Alchemy provides Ethereum RPC infrastructure
- Testnet wallets need funded Sepolia ETH
- `forge script --broadcast` performs real deployments
- Etherscan allows public verification
- Security practices become critical on public networks

---

# References

- [Foundry Book](https://book.getfoundry.sh/?utm_source=chatgpt.com)
- [Foundry Forge Script Docs](https://book.getfoundry.sh/reference/forge/forge-script?utm_source=chatgpt.com)
- [Alchemy](https://www.alchemy.com?utm_source=chatgpt.com)
- [Sepolia Etherscan](https://sepolia.etherscan.io?utm_source=chatgpt.com)
- [Ethereum Sepolia Testnet Docs](https://ethereum.org/en/developers/docs/networks/?utm_source=chatgpt.com#sepolia)

---

---

# ----------------------------

# Verifying Smart Contracts on Etherscan

## Introduction

After deploying a smart contract to a public network like Sepolia, the contract initially appears on block explorers only as raw bytecode.

Example:

- unreadable hexadecimal bytecode
- no visible Solidity source code
- no direct interaction UI

> **Note:** This lesson covers manual verification on Etherscan. The process is nearly identical on [Blockscout](https://blockscout.com) and other explorers. A future lesson covers programmatic verification via Foundry.

To make the contract human-readable and publicly trusted, we verify it on:

- :contentReference[oaicite:0]{index=0}

Verification:

- publishes the Solidity source code
- generates the ABI automatically
- enables contract interaction directly from the explorer
- improves transparency and trust

---

# What Happens Before Verification?

Without verification, Etherscan only shows:

- compiled bytecode
- transaction data
- raw blockchain information

Example issue:

- impossible to easily read the contract logic
- no "Read Contract" tab
- no "Write Contract" tab

---

# Manual Verification Process

## 1. Open the Contract Page

Go to your deployed contract address on:

- :contentReference[oaicite:1]{index=1}

Example:

```text id="k7q9wr"
https://sepolia.etherscan.io/address/YOUR_CONTRACT_ADDRESS
```

---

# 2. Open the Verification Page

Inside the contract page:

1. click the `Contract` tab
2. click:

```text id="f8t2xa"
Verify and Publish
```

---

## Steps to Verify Manually

1. Find your contract on [Sepolia Etherscan](https://sepolia.etherscan.io) and click the **Contract** tab
2. Click **Verify and Publish**
3. Fill in the details:

| Field            | Value                                      |
| ---------------- | ------------------------------------------ |
| Contract Address | Pre-populated (paste from terminal if not) |
| Compiler Type    | `Solidity (Single file)`                   |
| Compiler Version | Match your contract (e.g. `0.8.19`)        |
| License          | `MIT`                                      |

4. On the next page:
   - Paste your full Solidity contract source code
   - Set **Optimization** to `Yes`
   - Leave everything else as default

5. Submit. A successful verification shows:

```
Successfully generated Bytecode and ABI for Contract Address [0x...]
```

---

# 3. Enter Verification Details

## Contract Address

Usually auto-filled.

If not:

- paste the deployed contract address manually

---

# Compiler Type

Select:

```text id="b2r4wd"
Solidity (Single file)
```

because:

- contract is written in Solidity
- deployment used a single source file

---

# Compiler Version

Select the exact Solidity version used during deployment.

Example:

```text id="u7k1gm"
0.8.35
```

⚠️ Must exactly match the deployment compiler version.

---

# License Type

Select the license used in the source code.

Example:

```text id="q4n9tv"
MIT
```

Matches:

```solidity id="8g5jvt"
// SPDX-License-Identifier: MIT
```

---

# 4. Paste the Solidity Source Code

Paste the full Solidity contract.

Example:

```solidity id="w7n0ms"
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
}
```

---

# 5. Configure Optimization

If optimization was enabled during compilation:

Select:

```text id="8b3vks"
Yes
```

Otherwise:

- bytecode mismatch may occur

---

# 6. Submit Verification

Click:

```text id="x8q7op"
Verify and Publish
```

Successful output:

```text id="j3g9hf"
Successfully generated Bytecode and ABI for Contract Address
```

This confirms:

- source code matches deployed bytecode
- contract is verified successfully

---

# What Verification Enables

After verification, Etherscan unlocks:

## Read Contract

Allows:

- reading public variables
- calling view/pure functions
- querying blockchain state

Without paying gas.

---

# Write Contract

Allows:

- sending transactions
- modifying contract state
- interacting directly through the browser

Requires:

- wallet connection
- gas fees

---

## After Verification

Once verified, the contract page on Etherscan gains two new tabs:

- **Read Contract** — call `view`/`pure` functions directly from the browser
- **Write Contract** — send transactions to state-changing functions (requires MetaMask)

This is the manual approach. Future lessons will cover how to verify programmatically using Foundry, which supports multiple block explorers automatically.

# Why Verification Matters

## Transparency

Anyone can inspect:

- source code
- functions
- logic

---

# Trust

Users can verify:

- deployed bytecode matches source code
- contract behavior is public

---

# Better Developer Experience

Verification enables:

- ABI generation
- frontend integration
- easier debugging
- direct blockchain interaction

---

# Manual vs Programmatic Verification

## Manual Verification

Done through:

- Etherscan UI

Good for:

- learning
- debugging
- small projects

---

# Programmatic Verification

Can later be automated using Foundry:

```bash id="n2m7xl"
forge verify-contract
```

Benefits:

- faster workflow
- CI/CD integration
- repeatable deployments

Foundry supports:

- Etherscan
- Blockscout
- multiple explorers

---

# Common Verification Errors

## Compiler Version Mismatch

The Solidity version must exactly match deployment.

---

# Optimization Settings Mismatch

Optimization settings must match compilation configuration.

---

# Wrong Source Code

The deployed bytecode must correspond exactly to the submitted source.

---

# Missing Constructor Arguments

Contracts with constructors may require encoded constructor parameters.

---

# Example Workflow

## 1. Deploy Contract

```bash id="7o1rhz"
forge script script/DeploySimpleStorage.s.sol \
    --rpc-url $SEPOLIA_RPC_URL \
    --broadcast
```

---

# 2. Copy Contract Address

Example:

```text id="5v0k2x"
0x1093560Fe9029c4fB9044AbF2fC94288970D98Db
```

---

# 3. Open Etherscan

- [Sepolia Etherscan](https://sepolia.etherscan.io?utm_source=chatgpt.com)

---

# 4. Verify and Publish

Provide:

- Solidity source code
- compiler version
- optimization settings
- license type

---

# 5. Interact with Contract

Use:

- Read Contract
- Write Contract

directly in the browser.

---

# Key Takeaways

- Verification publishes the Solidity source code
- Etherscan compares source code against deployed bytecode
- Verified contracts are transparent and trusted
- Verification enables browser-based interaction
- Compiler version and optimization settings must match deployment
- Foundry later supports automated verification workflows

---

# References

- [Foundry Book](https://book.getfoundry.sh/?utm_source=chatgpt.com)
- [Etherscan Contract Verification Docs](https://docs.etherscan.io/contract-verification/verify-with-hardhat?utm_source=chatgpt.com)
- [Sepolia Etherscan](https://sepolia.etherscan.io?utm_source=chatgpt.com)
- [Ethereum Smart Contracts Docs](https://ethereum.org/en/developers/docs/smart-contracts/?utm_source=chatgpt.com)

```

```

---

---

# ----------------------------

# Verifying a Smart Contract on Etherscan

## Overview

After deploying to Sepolia, the contract shows only raw bytecode on Etherscan — unreadable and uninteractable. Verification publishes the source code, making the contract transparent and directly usable through the block explorer.

> **Note:** This lesson covers manual verification on Etherscan. The process is nearly identical on [Blockscout](https://blockscout.com) and other explorers. A future lesson covers programmatic verification via Foundry.

---

## Steps to Verify Manually

1. Find your contract on [Sepolia Etherscan](https://sepolia.etherscan.io) and click the **Contract** tab
2. Click **Verify and Publish**
3. Fill in the details:

| Field            | Value                                      |
| ---------------- | ------------------------------------------ |
| Contract Address | Pre-populated (paste from terminal if not) |
| Compiler Type    | `Solidity (Single file)`                   |
| Compiler Version | Match your contract (e.g. `0.8.19`)        |
| License          | `MIT`                                      |

4. On the next page:
   - Paste your full Solidity contract source code
   - Set **Optimization** to `Yes`
   - Leave everything else as default

5. Submit. A successful verification shows:

```
Successfully generated Bytecode and ABI for Contract Address [0x...]
```

---

## After Verification

Once verified, the contract page on Etherscan gains two new tabs:

- **Read Contract** — call `view`/`pure` functions directly from the browser
- **Write Contract** — send transactions to state-changing functions (requires MetaMask)

This is the manual approach. Future lessons will cover how to verify programmatically using Foundry, which supports multiple block explorers automatically.

---

---

# ----------------------------

---

---

# ----------------------------

---

---

# ----------------------------

---

---

# ----------------------------
