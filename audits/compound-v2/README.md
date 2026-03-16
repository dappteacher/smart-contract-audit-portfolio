# Compound V2 Security Review

This directory contains a **security-focused architectural and risk analysis** of the Compound V2 lending protocol.

The objective of this review is to apply a structured smart contract auditing methodology to a widely used DeFi lending system.

The review focuses on:

* protocol architecture analysis
* lending and borrowing mechanics
* collateral valuation logic
* liquidation mechanisms
* attack surface identification

---

# Protocol Overview

Compound V2 is a decentralized lending protocol where users can supply assets to liquidity pools and earn interest, while borrowers can obtain loans by posting collateral.

Each asset in the system is represented by a **cToken**, which acts as a tokenized representation of deposits.

Users can:

* supply assets and receive cTokens
* borrow assets against collateral
* repay borrowed assets
* redeem cTokens for underlying assets
* liquidate unsafe positions

---

# Core Concepts

## cTokens

cTokens represent deposits in the protocol. They accrue interest over time through changes in the **exchange rate** between the cToken and its underlying asset.

## Collateralization

Borrowing requires sufficient collateral based on predefined **collateral factors**.

## Liquidation

If the borrower's account becomes undercollateralized, other users may liquidate part of the position in exchange for a liquidation incentive.

## Comptroller

The Comptroller contract manages protocol-wide risk parameters and determines whether user actions are allowed.

---

# Security Objectives

The purpose of this review is to analyze security assumptions and identify potential risks involving:

* collateral accounting
* interest accrual mechanisms
* liquidation incentives
* oracle dependency
* privilege boundaries
