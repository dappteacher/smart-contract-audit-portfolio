# Attack Surface Analysis

Compound V2 introduces multiple potential attack surfaces due to its complex economic interactions.

---

# Oracle Manipulation

Collateral valuation depends heavily on price oracles.

If oracle prices become inaccurate or manipulated, attackers may:

* borrow excessive assets
* avoid liquidation
* liquidate healthy positions

---

# Interest Accrual Logic

Interest accrual occurs when protocol functions trigger `accrueInterest()`.

Incorrect calculations could result in:

* incorrect borrow balances
* reserve inconsistencies
* protocol insolvency under extreme conditions

---

# Liquidation Mechanism

Liquidations restore solvency when borrowers become undercollateralized.

Potential risks include:

* incorrect account liquidity calculations
* liquidation incentive misconfiguration
* front-running liquidation transactions

---

# Exchange Rate Calculations

The exchange rate between cTokens and underlying assets determines deposit value.

Any miscalculation may affect:

* user balances
* protocol reserves
* interest distribution

---

# Privileged Controls

Administrative privileges may allow modification of:

* collateral factors
* interest models
* oracle addresses

Improper access control could enable catastrophic protocol manipulation.
