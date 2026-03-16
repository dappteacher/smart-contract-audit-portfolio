# Protocol Architecture

Understanding protocol architecture is critical before reviewing implementation details.

---

# High-Level Design

Uniswap V2 is built around **liquidity pools** that allow permissionless token swaps.

Each pool maintains reserves of two tokens and allows users to exchange one token for another according to a pricing formula.

The protocol follows the **constant product market maker model**:

```
reserve0 * reserve1 = constant
```

This invariant ensures liquidity remains balanced after swaps.

---

# Core Components

## Factory Contract

The factory contract is responsible for:

* creating new pair contracts
* storing the registry of pairs
* ensuring each token pair is unique

Security considerations:

* pair creation must prevent duplicate pools
* deterministic pair addresses must be safe

---

## Pair Contract

The pair contract is the **central security boundary**.

Responsibilities include:

* holding token reserves
* executing swaps
* minting LP tokens
* burning LP tokens
* updating reserves

Security-critical properties:

* invariant enforcement
* reserve consistency
* protection against reentrancy
* fair liquidity accounting

---

## Liquidity Providers

Users provide liquidity by depositing both tokens of a pair.

In return they receive **LP tokens** representing their share of the pool.

These tokens allow users to later redeem their proportional share of reserves.

---

# Swap Mechanism

During swaps:

1. User sends input token to the pair contract.
2. Pair calculates output amount using reserve ratios.
3. Output token is transferred to the user.
4. Reserves are updated.

A small trading fee is applied to each swap.

---

# Economic Assumptions

Uniswap V2 assumes:

* arbitrageurs maintain price efficiency
* token transfers behave according to ERC20 expectations
* downstream protocols handle oracle usage carefully

Violations of these assumptions may introduce risk.
