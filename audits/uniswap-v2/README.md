# Uniswap V2 Security Review

This directory contains a **manual security review and architectural analysis** of the Uniswap V2 protocol.

The objective of this review is to:

* understand the architecture of a major DeFi protocol
* analyze attack surfaces in automated market maker systems
* practice professional smart contract auditing methodology
* document security-relevant observations

---

# Protocol Overview

Uniswap V2 is a decentralized exchange protocol based on an **Automated Market Maker (AMM)** design.

Instead of traditional order books, liquidity is pooled in **pair contracts** that maintain reserves of two assets.

Swaps are executed using the **constant product invariant**:

```
x * y = k
```

Where:

* `x` = reserve of token0
* `y` = reserve of token1
* `k` = constant liquidity invariant

---

# Core Contracts

The protocol consists of several primary components:

### Factory

Responsible for deploying and tracking **Pair contracts**.

Functions include:

* creating new trading pairs
* maintaining registry of pools

---

### Pair

The **core liquidity pool contract**.

Responsibilities include:

* maintaining token reserves
* processing swaps
* minting liquidity provider tokens
* burning liquidity provider tokens
* enforcing AMM invariant

---

### Router

Provides user-friendly functions for:

* swaps
* liquidity deposits
* liquidity withdrawals
* multi-hop trading

The router itself does **not hold funds**.

---

### Library

Contains helper functions used for:

* reserve calculations
* price quoting
* routing computations

---

# Review Scope

This review focuses primarily on:

* Pair contract logic
* liquidity accounting
* swap mechanics
* reserve updates
* economic security assumptions

---

# Review Objectives

The security analysis focuses on identifying risks related to:

* reserve accounting errors
* oracle misuse
* flash loan manipulation
* unsafe token interactions
* economic attack surfaces
