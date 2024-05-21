TMP_FOLDER=temp/
KERNEL_CONTRACT=0x94F097E1ebEB4ecA3AAE54cabb08905B239A7D27
KERNEL_FACTORY=0x6723b44Abeec4E71eBE3232BD5B455805baDD22f
FACTORY_STAKER=0xd703aaE79538628d27099B8c4f621bE4CCd142d5
ENTRYPOINT_ARG=0000000000000000000000000000000071727de22e5e9d8baf0edac6f37da032
KERNEL_ARG=0000000000000000000000000000000094F097E1ebEB4ecA3AAE54cabb08905B239A7D27
JUNK_WALLET_ARG=00000000000000000000000000000000f39Fd6e51aad88F6F4ce6aB8827279cffFb92266
FACTORY_STAKER_ARGS=000000000000000000000000000000009775137314fE595c943712B0b336327dfa80aE8A
BLOCKSCOUT_URL=http://127.0.0.1/api
CHAIN_ID=11155111 # Sepolia
PRIVATE_NETWORK_CHAIN_ID=31337
KERNEL_FOLDER=Kernel
KERNEL_FACTORY_FOLDER=KernelFactory
FACTORY_STAKER_FOLDER=FactoryStaker

# Create the temporary folder
rm -r -f $TMP_FOLDER && mkdir $TMP_FOLDER && cd $TMP_FOLDER || exit 1

# Clone and verify Kernel contract
forge clone $KERNEL_CONTRACT $KERNEL_FOLDER --chain $CHAIN_ID --no-commit
cd $KERNEL_FOLDER || exit 1
forge verify-contract $KERNEL_CONTRACT src/Kernel.sol:Kernel \
  --constructor-args $ENTRYPOINT_ARG \
  --watch --chain $PRIVATE_NETWORK_CHAIN_ID --verifier blockscout --verifier-url $BLOCKSCOUT_URL
cd ..

echo "[Script] Waiting for 5 seconds to avoid rate limit..." && sleep 5

# Clone and verify Kernel Factory contract
forge clone $KERNEL_FACTORY $KERNEL_FACTORY_FOLDER --chain $CHAIN_ID --no-commit
cd $KERNEL_FACTORY_FOLDER || exit
forge verify-contract $KERNEL_FACTORY src/factory/KernelFactory.sol:KernelFactory \
  --constructor-args $KERNEL_ARG \
  --watch --chain $PRIVATE_NETWORK_CHAIN_ID --verifier blockscout --verifier-url $BLOCKSCOUT_URL
cd ..

echo "[Script] Waiting for 5 seconds to avoid rate limit..." && sleep 5

# Go to the main repository path
forge clone $FACTORY_STAKER $FACTORY_STAKER_FOLDER --chain $CHAIN_ID --no-commit
cd $FACTORY_STAKER_FOLDER || exit
forge verify-contract $FACTORY_STAKER src/factory/FactoryStaker.sol:FactoryStaker \
  --constructor-args $FACTORY_STAKER_ARGS \
  --watch --chain $PRIVATE_NETWORK_CHAIN_ID --verifier blockscout --verifier-url $BLOCKSCOUT_URL
cd ..

# Delete the temporary folder
cd .. && rm -r -f $TMP_FOLDER
