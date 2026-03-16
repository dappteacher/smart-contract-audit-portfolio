# Aave V2 Security Review

This directory contains a **security-oriented architectural review** of the Aave V2 lending protocol.

The objective is to analyze the protocol from the perspective of a **smart contract auditor**, identifying:

* architectural security assumptions
* critical fund custody points
* attack surfaces in lending protocols
* economic manipulation vectors
* integration risks

---

# Protocol Overview

Aave V2 is a decentralized **lending and borrowing protocol** where users can:

* deposit assets as collateral
* borrow assets against collateral
* earn interest on deposits
* perform flash loans
* participate in liquidations

Deposits generate **aTokens**, which represent tokenized positions of supplied liquidity.

---

# Core Concepts

### Collateralized Lending

Users must deposit collateral before borrowing assets. The system enforces a **loan-to-value (LTV)** ratio to maintain solvency.

### Health Factor

Each borrowing position is assigned a **health factor** that determines the safety of the loan.

If the health factor falls below 1.0, the position becomes eligible for liquidation.

### Flash Loans

Aave allows uncollateralized loans provided that the borrowed amount is repaid within the same transaction.

Flash loans enable powerful financial strategies but introduce **potential attack vectors**.

---

# Security Objectives

The analysis focuses on identifying risks related to:

* collateral accounting
* liquidation mechanics
* oracle manipulation
* flash loan abuse
* privilege boundaries
* economic manipulation
