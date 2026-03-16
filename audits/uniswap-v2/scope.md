# Review Scope

## Protocol

Uniswap V2

## Repository

https://github.com/Uniswap/v2-core

## Key Contracts Reviewed

* UniswapV2Factory.sol
* UniswapV2Pair.sol
* UniswapV2ERC20.sol

Router contracts are located in the separate repository:

https://github.com/Uniswap/v2-periphery

---

# Components Under Review

The review focuses on the **core protocol layer**:

### Factory

Responsible for deploying pair contracts and maintaining the registry of pools.

### Pair

The most critical contract in the system.

Responsible for:

* liquidity accounting
* swaps
* invariant enforcement
* reserve updates

### LP Token Logic

Liquidity provider tokens represent proportional ownership of pool reserves.

---

# Out of Scope

The following components are considered outside the core scope:

* frontend applications
* deployment infrastructure
* governance mechanisms outside protocol core
* integrations by third-party protocols

---

# Security Focus Areas

Particular attention is given to:

* reserve accounting integrity
* swap invariant enforcement
* liquidity mint/burn fairness
* oracle manipulation risks
* flash loan attack vectors
* unsafe token transfer assumptions
