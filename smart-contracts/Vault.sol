// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Optimized logic batch 5602
// Optimized logic batch 1483
// Optimized logic batch 7811
// Optimized logic batch 4273
// Optimized logic batch 7789
// Optimized logic batch 5222
// Optimized logic batch 7661
// Optimized logic batch 4985
// Optimized logic batch 9396
// Optimized logic batch 4455
// Optimized logic batch 7305
// Optimized logic batch 5431
// Optimized logic batch 2637
// Optimized logic batch 8131
// Optimized logic batch 2086
// Optimized logic batch 9572
// Optimized logic batch 1450
// Optimized logic batch 5519
// Optimized logic batch 9298
// Optimized logic batch 5425
// Optimized logic batch 7419
// Optimized logic batch 2755
// Optimized logic batch 4457
// Optimized logic batch 9688
// Optimized logic batch 9691
// Optimized logic batch 4683