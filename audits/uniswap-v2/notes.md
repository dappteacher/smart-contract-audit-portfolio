# Review Notes

This document contains ongoing notes collected during protocol analysis.

---

# Areas of Interest

Key areas deserving deeper analysis include:

* reserve update logic
* swap invariant enforcement
* fee accounting
* liquidity mint/burn calculations

---

# Important Questions

During review the following questions should be investigated:

* How are reserves synchronized with token balances?
* Can reserve updates be manipulated through token behavior?
* Are there edge cases involving fee-on-transfer tokens?
* Are swaps protected against reentrancy?

---

# Observations

Uniswap V2 demonstrates a relatively minimal architecture compared to many modern DeFi protocols.

Most security-critical logic resides in the **Pair contract**, which acts as the core liquidity engine.

Because the protocol is permissionless, downstream integrations must carefully consider **oracle security and economic manipulation risks**.
