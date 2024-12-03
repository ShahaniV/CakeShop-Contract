# CakeShop-Contract: Token-Based Game Reward System

CakeShop is a blockchain-based token system deployed on the Avalanche Testnet. It allows users to mint, redeem, transfer, and burn tokens while interacting with in-game rewards like cakes.

## Description

CakeShop leverages ERC20 tokens (CAKE) to create an engaging gaming experience. Players can earn CAKE tokens, redeem them for virtual cakes, transfer tokens to others, or burn tokens they no longer need. Transactions are tracked on the Avalanche Testnet via Snowtrace, ensuring transparency and security.

## Getting Started

### Installing

1. Deploy the CakeShop smart contract on the Avalanche Testnet using Remix.
2. Ensure you have:
   - MetaMask configured for Avalanche Testnet.
   - Two accounts (Owner and Player) for testing.
3. Import the deployed contract in MetaMask to view CAKE tokens.

### Executing Program

1. **Mint Tokens**  
   The owner mints CAKE tokens for players:
```
mint(<Player Address>, <Amount>)
```
2. **Redeem Cakes**  
Players can redeem cakes by burning CAKE tokens:
```
redeemCake(<Cake ID>)
```
3. **Transfer Tokens**  
Tokens can be transferred between accounts:
```
transfer(<Recipient Address>, <Amount>)
```
4. **Burn Tokens**  
Players can burn unwanted CAKE tokens:
```
burn(<Amount>)
```
5. **Check Transactions**  
Verify transactions on Snowtrace Testnet:  
[Snowtrace Testnet](https://testnet.snowtrace.io/)

## Help

- **Common Issue:** "Not enough tokens to redeem this cake."  
Solution: Ensure the account has sufficient CAKE tokens to complete the transaction.

- For additional help, run:
```
Remix Solidity Debugger
```
## Authors

**Shahani Fe D. Vicio | FEU Institute of Technology**  
