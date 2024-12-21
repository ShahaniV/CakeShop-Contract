// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CakeShop is ERC20, Ownable {
    // Struct to store cake information
    struct Cake {
        uint256 id;
        string name;
        uint256 price;
    }

    // Predefined cakes in the shop
    Cake[] public cakes;

    // Mapping to track which cakes a user has redeemed
    mapping(address => uint256[]) public userCakes;

    // Constructor to initialize token and cakes
    constructor(address initialOwner) ERC20("DegenCake", "CAKE") Ownable(initialOwner) {
        // Adding cakes with IDs and prices
        cakes.push(Cake(0, "Chocolate Cake", 1));  // Price: 1 CAKE
        cakes.push(Cake(1, "Vanilla Cake", 2));    // Price: 2 CAKE
        cakes.push(Cake(2, "Strawberry Cake", 3)); // Price: 3 CAKE
    }

    // Mint tokens (only the owner can mint)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Redeem a cake (users pay CAKE tokens to redeem a cake)
    function redeemCake(uint256 cakeId) public {
        require(cakeId < cakes.length, "Cake does not exist");
        
        Cake memory cake = cakes[cakeId];
        
        // Ensure the user has enough tokens to redeem the cake
        require(balanceOf(msg.sender) >= cake.price, "Not enough tokens to redeem this cake");

        // Burn the required amount of CAKE tokens for the cake redemption
        _burn(msg.sender, cake.price);

        // Add the redeemed cake to the user's collection
        userCakes[msg.sender].push(cakeId);
    }

    // Get the cakes that a user has redeemed
    function getUserCakes(address user) public view returns (string[] memory) {
        uint256[] memory redeemedCakeIds = userCakes[user];
        string[] memory userCakesList = new string[](redeemedCakeIds.length);

        for (uint256 i = 0; i < redeemedCakeIds.length; i++) {
            userCakesList[i] = cakes[redeemedCakeIds[i]].name;
        }

        return userCakesList;
    }

    // Allow users to burn their tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // Custom transfer function
    function transferTokens(address to, uint256 amount) public returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance.");
        _transfer(msg.sender, to, amount);
        return true;
    }
}
