# Research Notes

This document records ongoing observations and research questions during the review.

---

# Areas for Deeper Analysis

Key areas deserving further investigation include:

* account liquidity calculations
* exchange rate computation
* liquidation logic
* interest accrual edge cases

---

# Questions for Investigation

During analysis the following questions should be explored:

* Can oracle updates be manipulated or delayed?
* Can flash loans affect liquidation opportunities?
* Are exchange rate calculations vulnerable to rounding errors?
* Can interest accrual be bypassed in certain conditions?

---

# Observations

Compound V2 separates risk management logic into the Comptroller contract.

This architecture centralizes safety checks but also increases reliance on correct configuration of protocol parameters.

As with most lending protocols, economic manipulation scenarios represent an important category of potential attack vectors.
