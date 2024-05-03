/**
 * Create a variable here that holds the contract address after you deploy!
 */
// const contractAddress = "0x1063F3412a35976F4ddE9b6c2a5777BA190C5439";
import juiceMe from "../contracts/CoffeePortal.json";
import erc20 from "../contracts/IERC20Token.json";

const contractAddress = "0x8056E56eB3D1080a4CC047A9050f204834e262Eb";

const cUSDContractAddress = "0x5b207C79fd665d33D74C19138E2944Ffb72016c7";
import contractABI from  "../contracts/CoffeePortal.abi.json";
//const contractABI = juiceMe.abi;

const erc20ABI = erc20.abi;
/*
 * Just a state variable we use to store our user's public wallet.
 */

export { contractAddress, cUSDContractAddress,contractABI, erc20ABI};