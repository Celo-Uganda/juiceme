
const {ethers} = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying crowdfunding contract with the account:", deployer.address);
    const JuiceMe = await ethers.getContractFactory("CoffeePortal");
    const juiceme = await JuiceMe.deploy(5);

    

    console.log(
        `Coffee Portal deployed to ${juiceme.address}`
    );
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})