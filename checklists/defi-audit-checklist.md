# DeFi Protocol Security Checklist

This checklist focuses on **DeFi-specific risks** beyond standard Solidity vulnerabilities.

---

# Protocol Model

* token flow clearly understood
* trusted roles documented
* protocol invariants defined
* fund custody model verified

---

# Pricing & Oracles

* oracle source validated
* spot price misuse evaluated
* TWAP mechanisms reviewed
* manipulation resistance analyzed

---

# Liquidity Mechanics

* deposit logic reviewed
* withdrawal logic reviewed
* mint and burn calculations validated
* reserve accounting verified

---

# Flash Loan Risks

* flash loan attack vectors considered
* temporary liquidity manipulation evaluated
* protocol invariants maintained under flash loans

---

# Liquidation Mechanics

* liquidation conditions validated
* liquidation incentives reviewed
* liquidation race conditions analyzed

---

# Economic Security

* incentive compatibility analyzed
* reward distribution fairness reviewed
* fee mechanisms validated

---

# MEV Considerations

* front-running exposure evaluated
* sandwich attack potential analyzed
* transaction ordering assumptions validated
