# Compound V2 Security Review (Portfolio Audit)

**Author:** Jacob (Yaghoub) Adelzadeh
**Category:** DeFi Lending Protocol
**Target Protocol:** Compound V2
**Repository:** https://github.com/compound-finance/compound-protocol
**Audit Type:** Independent Research / Portfolio Review

---

# 1. Executive Summary

This report presents a security-oriented review of the Compound V2 lending protocol.

Compound V2 is a decentralized money market where users supply assets to earn interest and borrow assets using collateral. The protocol manages liquidity pools and enforces collateralization rules through smart contracts.

Because lending systems control large pools of liquidity and depend heavily on price oracles and economic incentives, security analysis must consider both:

* smart contract vulnerabilities
* economic manipulation vectors

This review focuses on identifying risks related to:

* collateral valuation
* liquidation mechanics
* interest accrual
* oracle dependencies
* privilege boundaries

---

# 2. Protocol Overview

**Compound Labs’s Compound V2 protocol enables decentralized lending and borrowing.

Users interact with markets represented by **cTokens**, which serve as tokenized representations of supplied assets.

Depositors earn interest through an increasing **exchange rate** between cTokens and the underlying asset.

Borrowers can access liquidity by posting collateral.

If a borrower’s position becomes undercollateralized, other users may liquidate the position.

---

# 3. Scope

The review focused on the core lending infrastructure.

## Contracts Reviewed

* Comptroller.sol
* CToken.sol
* CErc20.sol
* CEther.sol
* InterestRateModel.sol
* PriceOracle.sol

## Security-Critical Components

| Component           | Role                                      |
| ------------------- | ----------------------------------------- |
| Comptroller         | Risk management and collateral validation |
| cTokens             | Asset markets and liquidity pools         |
| Price Oracle        | Asset price feeds                         |
| Interest Rate Model | Determines supply and borrow interest     |

---

# 4. Methodology

The review followed a structured smart contract auditing methodology consisting of:

1. Protocol architecture analysis
2. State transition review
3. Attack surface mapping
4. Adversarial threat modeling
5. Economic risk analysis
6. Severity classification and reporting

The review focused on identifying both technical vulnerabilities and economic attack vectors common in DeFi lending systems.

---

# 5. Threat Model

The following threat actors were considered.

### External Attackers

Actors interacting with the protocol without privileged permissions.

Potential goals include:

* extracting liquidity
* manipulating collateral valuation
* exploiting liquidation incentives

---

### Flash Loan Attackers

Actors capable of temporarily accessing large liquidity through flash loans.

Flash loans significantly reduce the capital required to manipulate markets.

---

### Privileged Actors

Administrative roles may modify protocol parameters including:

* collateral factors
* oracle addresses
* interest models

Improper governance or compromised privileges could introduce systemic risks.

---

# 6. Findings Summary

| Severity      | Count |
| ------------- | ----- |
| Critical      | 0     |
| High          | 0     |
| Medium        | 0     |
| Low           | 1     |
| Informational | 1     |

---

# 7. Findings

---

## INFO-01 Oracle Dependency Risk

### Severity

Informational

### Description

Compound relies on external price oracles to determine collateral value.

Incorrect oracle prices may temporarily distort account liquidity calculations.

---

### Impact

Potential risks include:

* excessive borrowing against inflated collateral
* delayed liquidation events
* liquidation of healthy positions

---

### Recommendation

Oracle infrastructure should ensure:

* price freshness
* manipulation resistance
* reliable fallback mechanisms

---

## LOW-01 Interest Accrual Timing Risk

### Severity

Low

### Description

Compound V2 accrues interest lazily when certain functions trigger the `accrueInterest()` routine.

In rare cases, delayed interest accrual could temporarily produce accounting discrepancies.

---

### Impact

Delayed updates may cause small inconsistencies in:

* borrow balances
* reserve accounting
* exchange rate calculations

---

### Recommendation

Ensure critical user interactions consistently trigger interest accrual updates.

---

# 8. Architectural Observations

Several architectural design choices contribute to protocol safety.

### Comptroller Risk Layer

The Comptroller contract centralizes protocol risk management and enforces collateral requirements.

### Collateralization Enforcement

Borrowing positions are continuously evaluated to ensure collateral exceeds borrow value.

### Liquidation Incentives

Liquidation bonuses incentivize third parties to restore protocol solvency.

---

# 9. Key Risk Areas for Lending Protocols

Security reviews of lending systems should evaluate:

* oracle reliability
* liquidation fairness
* interest accrual correctness
* exchange rate calculations
* collateral factor configuration

Failures in these areas may expose protocols to systemic risk.

---

# 10. Conclusion

Compound V2 represents a mature decentralized lending protocol with well-defined risk management mechanisms.

However, lending protocols inherently depend on several critical assumptions:

* reliable price oracles
* properly configured collateral factors
* fair liquidation mechanisms

Security analysis must therefore consider both smart contract correctness and economic adversarial scenarios.

---

# 11. Disclaimer

This review was conducted for educational and portfolio purposes.

Some findings reflect well-known design considerations in DeFi lending systems rather than previously undisclosed vulnerabilities.
