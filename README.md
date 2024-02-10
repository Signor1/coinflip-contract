# Coin Flip Contract

This Solidity smart contract allows users to participate in a simple coin flip game. The contract randomly determines the outcome of the coin flip and rewards the winner with the amount wagered.

## Getting Started

To deploy and interact with the contract, you'll need to set up a development environment and install dependencies.

### Prerequisites

- Node.js (v14.x or later)
- npm (Node.js package manager)
- Hardhat

### Installation

1. Clone the repository:

```
git clone [<repository_url>](https://github.com/Signor1/coinflip-contract.git)
```

2. Navigate to the project directory:

```
cd coin-flip-contract
```

3. Install dependencies:

```
npm install
```

4. Compile the contracts:

```
npx hardhat compile
```

5. Deploy the contracts to a local Hardhat network:

```
npx hardhat run scripts/deploy.js --network localhost
```

## Usage

Once the contract is deployed, users can interact with it through various functions.

### Available Functions

- `flipCoin(uint256 bet)`: Allows a user to place a bet and flip the coin.
- `getBalance()`: Retrieves the contract balance.
- `withdraw(uint256 amount)`: Allows the contract owner to withdraw funds.

### Example Interaction

```javascript
const CoinFlipContract = await ethers.getContractFactory("CoinFlipContract");
const coinFlip = await CoinFlipContract.deploy();
await coinFlip.deployed();

// Place a bet and flip the coin
await coinFlip.FlipCoin(0.1 ether);

// Check contract balance
const balance = await coinFlip.contractBalance();
console.log("Contract Balance:", ethers.utils.formatEther(balance));
```

## Testing

Unit tests are included to ensure the functionality of the contract.

1. Run the unit tests:

```
npx hardhat test
```

## Contributing

Contributions are welcome! Feel free to submit issues or pull requests.
