# f26-foundry-simple-storage

### Creating a New Foundry Project

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

#### Initialising a Foundry Project

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
