# Findings

The following observations were identified during the security review.

Note: Some findings describe **design risks or integration considerations** rather than newly discovered vulnerabilities.

---

# INFO-01 Oracle Dependency Risk

Severity: Informational

## Description

The Aave protocol relies on external price oracles to determine collateral value.

If oracle prices are manipulated or delayed, borrowers may be able to extract excess liquidity before liquidation occurs.

## Impact

Incorrect oracle pricing may allow:

* excessive borrowing
* unfair liquidations
* protocol insolvency under extreme conditions

## Recommendation

Protocols should ensure that oracle systems provide:

* reliable price feeds
* manipulation resistance
* robust fallback mechanisms

---

# LOW-01 Flash Loan Enabled Economic Attacks

Severity: Low

## Description

Flash loans allow attackers to borrow large capital temporarily without collateral.

While flash loans are a core feature of Aave, they also increase the feasibility of economic attacks across DeFi protocols.

## Impact

Flash loans may be used to:

* manipulate token prices
* exploit vulnerable integrations
* perform large-scale arbitrage

## Recommendation

Downstream protocols interacting with Aave should carefully evaluate flash-loan-related risks.
