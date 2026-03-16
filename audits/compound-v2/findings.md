# Findings

The following observations were identified during the review.

Note: Some findings reflect design considerations commonly discussed in DeFi lending systems.

---

# INFO-01 Oracle Dependency Risk

Severity: Informational

## Description

Compound V2 relies on price oracles to determine the value of collateral assets.

Incorrect oracle prices could temporarily distort borrowing limits and liquidation eligibility.

---

## Impact

Potential consequences include:

* excessive borrowing against inflated collateral
* liquidation of healthy positions
* systemic protocol risk during volatile markets

---

## Recommendation

Oracle systems should provide:

* reliable price feeds
* manipulation resistance
* fallback mechanisms

---

# LOW-01 Interest Accrual Timing Risk

Severity: Low

## Description

Interest accrual occurs lazily when certain protocol functions are executed.

Under unusual conditions, delays in calling `accrueInterest()` may temporarily cause accounting inconsistencies.

---

## Impact

Delayed interest accrual could lead to small discrepancies in borrower balances or exchange rate calculations.

---

## Recommendation

Ensure that critical protocol interactions trigger interest accrual consistently.
