pragma solidity ^0.8.0;

import "src/KernelFactory.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// A sample ERC721 contract
contract SampleNFT is ERC721 {
    uint256 public tokenId;

    constructor() ERC721("SampleNFT", "SNFT") {}

    // Anyone can mint an NFT for anyone
    function mint(address _to) public {
        _safeMint(_to, tokenId++);
    }
}

bytes constant NFT_CODE = hex"000000000000000000000000000000000000000000000000000000000000000060806040523480156200001157600080fd5b506040518060400160405280600981526020016814d85b5c1b1953919560ba1b8152506040518060400160405280600481526020016314d3919560e21b81525081600090816200006291906200011f565b5060016200007182826200011f565b505050620001eb565b634e487b7160e01b600052604160045260246000fd5b600181811c90821680620000a557607f821691505b602082108103620000c657634e487b7160e01b600052602260045260246000fd5b50919050565b601f8211156200011a57600081815260208120601f850160051c81016020861015620000f55750805b601f850160051c820191505b81811015620001165782815560010162000101565b5050505b505050565b81516001600160401b038111156200013b576200013b6200007a565b62000153816200014c845462000090565b84620000cc565b602080601f8311600181146200018b5760008415620001725750858301515b600019600386901b1c1916600185901b17855562000116565b600085815260208120601f198616915b82811015620001bc578886015182559484019460019091019084016200019b565b5085821015620001db5787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b61135380620001fb6000396000f3fe608060405234801561001057600080fd5b50600436106100f55760003560e01c80636352211e11610097578063a22cb46511610066578063a22cb465146101f5578063b88d4fde14610208578063c87b56dd1461021b578063e985e9c51461022e57600080fd5b80636352211e146101b45780636a627842146101c757806370a08231146101da57806395d89b41146101ed57600080fd5b8063095ea7b3116100d3578063095ea7b31461016257806317d70f7c1461017757806323b872dd1461018e57806342842e0e146101a157600080fd5b806301ffc9a7146100fa57806306fdde0314610122578063081812fc14610137575b600080fd5b61010d610108366004610eb8565b61026a565b60405190151581526020015b60405180910390f35b61012a6102bc565b6040516101199190610f25565b61014a610145366004610f38565b61034e565b6040516001600160a01b039091168152602001610119565b610175610170366004610f6d565b610375565b005b61018060065481565b604051908152602001610119565b61017561019c366004610f97565b61048f565b6101756101af366004610f97565b6104c0565b61014a6101c2366004610f38565b6104db565b6101756101d5366004610fd3565b61053b565b6101806101e8366004610fd3565b61055d565b61012a6105e3565b610175610203366004610fee565b6105f2565b610175610216366004611040565b610601565b61012a610229366004610f38565b610639565b61010d61023c36600461111c565b6001600160a01b03918216600090815260056020908152604080832093909416825291909152205460ff1690565b60006001600160e01b031982166380ac58cd60e01b148061029b57506001600160e01b03198216635b5e139f60e01b145b806102b657506301ffc9a760e01b6001600160e01b03198316145b92915050565b6060600080546102cb9061114f565b80601f01602080910402602001604051908101604052809291908181526020018280546102f79061114f565b80156103445780601f1061031957610100808354040283529160200191610344565b820191906000526020600020905b81548152906001019060200180831161032757829003601f168201915b5050505050905090565b6000610359826106ad565b506000908152600460205260409020546001600160a01b031690565b6000610380826104db565b9050806001600160a01b0316836001600160a01b0316036103f25760405162461bcd60e51b815260206004820152602160248201527f4552433732313a20617070726f76616c20746f2063757272656e74206f776e656044820152603960f91b60648201526084015b60405180910390fd5b336001600160a01b038216148061040e575061040e813361023c565b6104805760405162461bcd60e51b815260206004820152603d60248201527f4552433732313a20617070726f76652063616c6c6572206973206e6f7420746f60448201527f6b656e206f776e6572206f7220617070726f76656420666f7220616c6c00000060648201526084016103e9565b61048a838361070c565b505050565b610499338261077a565b6104b55760405162461bcd60e51b81526004016103e990611189565b61048a8383836107f9565b61048a83838360405180602001604052806000815250610601565b6000818152600260205260408120546001600160a01b0316806102b65760405162461bcd60e51b8152602060048201526018602482015277115490cdcc8c4e881a5b9d985b1a59081d1bdad95b88125160421b60448201526064016103e9565b6006805461055a918391906000610551836111d6565b9190505561095d565b50565b60006001600160a01b0382166105c75760405162461bcd60e51b815260206004820152602960248201527f4552433732313a2061646472657373207a65726f206973206e6f7420612076616044820152683634b21037bbb732b960b91b60648201526084016103e9565b506001600160a01b031660009081526003602052604090205490565b6060600180546102cb9061114f565b6105fd338383610977565b5050565b61060b338361077a565b6106275760405162461bcd60e51b81526004016103e990611189565b61063384848484610a45565b50505050565b6060610644826106ad565b600061065b60408051602081019091526000815290565b9050600081511161067b57604051806020016040528060008152506106a6565b8061068584610a78565b6040516020016106969291906111fd565b6040516020818303038152906040525b9392505050565b6000818152600260205260409020546001600160a01b031661055a5760405162461bcd60e51b8152602060048201526018602482015277115490cdcc8c4e881a5b9d985b1a59081d1bdad95b88125160421b60448201526064016103e9565b600081815260046020526040902080546001600160a01b0319166001600160a01b0384169081179091558190610741826104db565b6001600160a01b03167f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92560405160405180910390a45050565b600080610786836104db565b9050806001600160a01b0316846001600160a01b031614806107cd57506001600160a01b0380821660009081526005602090815260408083209388168352929052205460ff165b806107f15750836001600160a01b03166107e68461034e565b6001600160a01b0316145b949350505050565b826001600160a01b031661080c826104db565b6001600160a01b0316146108325760405162461bcd60e51b81526004016103e99061122c565b6001600160a01b0382166108945760405162461bcd60e51b8152602060048201526024808201527f4552433732313a207472616e7366657220746f20746865207a65726f206164646044820152637265737360e01b60648201526084016103e9565b826001600160a01b03166108a7826104db565b6001600160a01b0316146108cd5760405162461bcd60e51b81526004016103e99061122c565b600081815260046020908152604080832080546001600160a01b03199081169091556001600160a01b0387811680865260038552838620805460001901905590871680865283862080546001019055868652600290945282852080549092168417909155905184937fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef91a4505050565b6105fd828260405180602001604052806000815250610b0b565b816001600160a01b0316836001600160a01b0316036109d85760405162461bcd60e51b815260206004820152601960248201527f4552433732313a20617070726f766520746f2063616c6c65720000000000000060448201526064016103e9565b6001600160a01b03838116600081815260056020908152604080832094871680845294825291829020805460ff191686151590811790915591519182527f17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31910160405180910390a3505050565b610a508484846107f9565b610a5c84848484610b3e565b6106335760405162461bcd60e51b81526004016103e990611271565b60606000610a8583610c3f565b600101905060008167ffffffffffffffff811115610aa557610aa561102a565b6040519080825280601f01601f191660200182016040528015610acf576020820181803683370190505b5090508181016020015b600019016f181899199a1a9b1b9c1cb0b131b232b360811b600a86061a8153600a8504945084610ad957509392505050565b610b158383610d17565b610b226000848484610b3e565b61048a5760405162461bcd60e51b81526004016103e990611271565b60006001600160a01b0384163b15610c3457604051630a85bd0160e11b81526001600160a01b0385169063150b7a0290610b829033908990889088906004016112c3565b6020604051808303816000875af1925050508015610bbd575060408051601f3d908101601f19168201909252610bba91810190611300565b60015b610c1a573d808015610beb576040519150601f19603f3d011682016040523d82523d6000602084013e610bf0565b606091505b508051600003610c125760405162461bcd60e51b81526004016103e990611271565b805181602001fd5b6001600160e01b031916630a85bd0160e11b1490506107f1565b506001949350505050565b60008072184f03e93ff9f4daa797ed6e38ed64bf6a1f0160401b8310610c7e5772184f03e93ff9f4daa797ed6e38ed64bf6a1f0160401b830492506040015b6d04ee2d6d415b85acef81000000008310610caa576d04ee2d6d415b85acef8100000000830492506020015b662386f26fc100008310610cc857662386f26fc10000830492506010015b6305f5e1008310610ce0576305f5e100830492506008015b6127108310610cf457612710830492506004015b60648310610d06576064830492506002015b600a83106102b65760010192915050565b6001600160a01b038216610d6d5760405162461bcd60e51b815260206004820181905260248201527f4552433732313a206d696e7420746f20746865207a65726f206164647265737360448201526064016103e9565b6000818152600260205260409020546001600160a01b031615610dd25760405162461bcd60e51b815260206004820152601c60248201527f4552433732313a20746f6b656e20616c7265616479206d696e7465640000000060448201526064016103e9565b6000818152600260205260409020546001600160a01b031615610e375760405162461bcd60e51b815260206004820152601c60248201527f4552433732313a20746f6b656e20616c7265616479206d696e7465640000000060448201526064016103e9565b6001600160a01b038216600081815260036020908152604080832080546001019055848352600290915280822080546001600160a01b0319168417905551839291907fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef908290a45050565b6001600160e01b03198116811461055a57600080fd5b600060208284031215610eca57600080fd5b81356106a681610ea2565b60005b83811015610ef0578181015183820152602001610ed8565b50506000910152565b60008151808452610f11816020860160208601610ed5565b601f01601f19169290920160200192915050565b6020815260006106a66020830184610ef9565b600060208284031215610f4a57600080fd5b5035919050565b80356001600160a01b0381168114610f6857600080fd5b919050565b60008060408385031215610f8057600080fd5b610f8983610f51565b946020939093013593505050565b600080600060608486031215610fac57600080fd5b610fb584610f51565b9250610fc360208501610f51565b9150604084013590509250925092565b600060208284031215610fe557600080fd5b6106a682610f51565b6000806040838503121561100157600080fd5b61100a83610f51565b91506020830135801515811461101f57600080fd5b809150509250929050565b634e487b7160e01b600052604160045260246000fd5b6000806000806080858703121561105657600080fd5b61105f85610f51565b935061106d60208601610f51565b925060408501359150606085013567ffffffffffffffff8082111561109157600080fd5b818701915087601f8301126110a557600080fd5b8135818111156110b7576110b761102a565b604051601f8201601f19908116603f011681019083821181831017156110df576110df61102a565b816040528281528a60208487010111156110f857600080fd5b82602086016020830137600060208483010152809550505050505092959194509250565b6000806040838503121561112f57600080fd5b61113883610f51565b915061114660208401610f51565b90509250929050565b600181811c9082168061116357607f821691505b60208210810361118357634e487b7160e01b600052602260045260246000fd5b50919050565b6020808252602d908201527f4552433732313a2063616c6c6572206973206e6f7420746f6b656e206f776e6560408201526c1c881bdc88185c1c1c9bdd9959609a1b606082015260800190565b6000600182016111f657634e487b7160e01b600052601160045260246000fd5b5060010190565b6000835161120f818460208801610ed5565b835190830190611223818360208801610ed5565b01949350505050565b60208082526025908201527f4552433732313a207472616e736665722066726f6d20696e636f72726563742060408201526437bbb732b960d91b606082015260800190565b60208082526032908201527f4552433732313a207472616e7366657220746f206e6f6e20455243373231526560408201527131b2b4bb32b91034b6b83632b6b2b73a32b960711b606082015260800190565b6001600160a01b03858116825284166020820152604081018390526080606082018190526000906112f690830184610ef9565b9695505050505050565b60006020828403121561131257600080fd5b81516106a681610ea256fea2646970667358221220c6f7a1c83a1ac7fa8cb2a220139cb7740ac9561e8ac7daa2b319259cf957e8c264736f6c63430008130033";

contract DeployNFT is Script {
    address DETERMINISTIC_DEPLOYER = 0x4e59b44847b379578588920cA78FbF26c0B4956C;
    function run() public {
        uint256 key = vm.envUint("DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(key);
        (bool success, bytes memory ret) = DETERMINISTIC_DEPLOYER.call(NFT_CODE);
        if(!success) {
            console.log("deploy failed");
            revert(string(ret));
        }
        console.log("nft deployed at %s", address(bytes20(ret)));
        vm.stopBroadcast();
    }
}
