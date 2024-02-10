import { ethers } from "hardhat";

async function main() {

  const game = await ethers.deployContract("CoinFlip");

  await game.waitForDeployment();

  console.log(
    `Contract deployed to ${game.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
