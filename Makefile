include .env

build:
	forge build

test:
	forge test -vvv

	# ALCHEMY SEPOLIA
deploy-alchemy-sepolia:
	forge script script/DeploySimpleStorage.s.sol \
		--rpc-url ${ALCHEMY_SEPOLIA_RPC_URL} \
		--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1} \
		--broadcast
verify-alchemy-sepolia:
	forge verify-contract \
		$(ALCHEMY_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		src/DeploySimpleStorage.s.sol \
		$(ETHERSCAN_API_KEY)

verify-2-alchemy-sepolia:
	forge create SimpleStorage \
	--rpc-url ${ALCHEMY_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1} \
	--optimize \
	--optimizer-runs 2000 \
	--out ./build \
  	--verifier etherscan

	fo

send-alchemy-sepolia:
	cast send $(ALCHEMY_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
    	"store(uint256)" \
    	1111 \
    --rpc-url ${ALCHEMY_SEPOLIA_RPC_URL} \
    --private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
read-alchemy-sepolia:
	cast call $(ALCHEMY_SIMPLE_STORAGE_CONTRACT_ADDRESS) "retrieve()" \
	--rpc-url ${ALCHEMY_SEPOLIA_RPC_URL} \


# INFURA SEPOLIA
deploy-infura-sepolia:
	forge script script/DeploySimpleStorage.s.sol \
		--rpc-url ${INFURA_SEPOLIA_RPC_URL} \
		--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1} \
		--broadcast
send-infura-sepolia:
	cast send $(INFURA_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
    	"store(uint256)" \
    	2222 \
    --rpc-url ${INFURA_SEPOLIA_RPC_URL} \
    --private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
read-infura-sepolia:
	cast call $(INFURA_SIMPLE_STORAGE_CONTRACT_ADDRESS) "retrieve()" \
	--rpc-url ${INFURA_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
verify-infura-sepolia:
	forge verify-contract \
		$(INFURA_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		SimpleStorage.sol

# TENDERLY SEPOLIA
deploy-tenderly-sepolia:
	forge script script/DeploySimpleStorage.s.sol \
		--rpc-url ${TENDERLY_SEPOLIA_RPC_URL} \
		--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1} \
		--broadcast
send-tenderly-sepolia:
	cast send $(TENDERLY_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
    	"store(uint256)" \
    	3333 \
    --rpc-url ${TENDERLY_SEPOLIA_RPC_URL} \
    --private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
read-tenderly-sepolia:
	cast call $(TENDERLY_SIMPLE_STORAGE_CONTRACT_ADDRESS) "retrieve()" \
	--rpc-url ${TENDERLY_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
verify-tenderly-sepolia:
	forge verify-contract \
		$(TENDERLY_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		SimpleStorage.sol

# CHAINSTACK SEPOLIA
deploy-chainstack-sepolia:
	forge script script/DeploySimpleStorage.s.sol \
		--rpc-url ${CHAINSTACK_SEPOLIA_RPC_URL} \
		--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1} \
		--broadcast
send-chainstack-sepolia:
	cast send $(CHAINSTACK_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		"store(uint256)" \
		4444 \
	--rpc-url ${CHAINSTACK_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
read-chainstack-sepolia:
	cast call $(CHAINSTACK_SIMPLE_STORAGE_CONTRACT_ADDRESS) "retrieve()" \
	--rpc-url ${CHAINSTACK_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
verify-chainstack-sepolia:
	forge verify-contract \
		$(CHAINSTACK_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		SimpleStorage.sol

# NODIES SEPOLIA
deploy-nodies-sepolia:
	forge script script/DeploySimpleStorage.s.sol \
		--rpc-url ${NODIES_SEPOLIA_RPC_URL} \
		--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1} \
		--broadcast
send-nodies-sepolia:
	cast send $(NODIES_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		"store(uint256)" \
		5555 \
	--rpc-url ${NODIES_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
read-nodies-sepolia:
	cast call $(NODIES_SIMPLE_STORAGE_CONTRACT_ADDRESS) "retrieve()" \
	--rpc-url ${NODIES_SEPOLIA_RPC_URL} \
	--private-key ${BRAVE_METAMASK_PRIVATE_KEY_1}
verify-nodies-sepolia:
	forge verify-contract \
		$(NODIES_SIMPLE_STORAGE_CONTRACT_ADDRESS) \
		SimpleStorage.sol



format:
	forge fmt