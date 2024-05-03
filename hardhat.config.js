// require("@nomicfoundation/hardhat-toolbox");

// /** @type import('hardhat/config').HardhatUserConfig */
// module.exports = {
//   solidity: "0.8.24",
// };
//import {HardhatUserConfig} from "hardhat/config";
//import "@nomicfoundation/hardhat-toolbox";

require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();



const config = {
  solidity: "0.8.9",
  networks: {
    alfajores: {
      url: "https://alfajores-forno.celo-testnet.org",
      accounts: [process.env.PRIVATE_KEY],
      chainId: 44787,
    },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
};

//export default config;
module.exports = config;

// module.exports = {
//     solidity: "0.8.24",
//     networks: {
//         alfajores: {
//             url: "https://alfajores-forno.celo-testnet.org",
//             accounts: [process.env.PRIVATE_KEY],
//         },
//         celo: {
//             url: "https://forno.celo.org",
//             accounts: [process.env.PRIVATE_KEY],
//         },
//     },
//     etherscan: {
//         apiKey: {
//             alfajores: process.env.CELOSCAN_API_KEY,
//             celo: process.env.CELOSCAN_API_KEY,
//         },
//         customChains: [
//             {
//                 network: "alfajores",
//                 chainId: 44787,
//                 urls: {
//                     apiURL: "https://api-alfajores.celoscan.io/api",
//                     browserURL: "https://alfajores.celoscan.io",
//                 },
//             },
//             {
//                 network: "celo",
//                 chainId: 42220,
//                 urls: {
//                     apiURL: "https://api.celoscan.io/api",
//                     browserURL: "https://celoscan.io/",
//                 },
//             },
//         ],
//     },
// };