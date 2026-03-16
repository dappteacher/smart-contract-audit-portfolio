# Attack Surface Analysis

Understanding where attacks may originate is a core part of protocol security review.

---

# Reserve Accounting

Reserve variables track the balances of tokens in a pool.

Potential risks include:

* inconsistent reserve updates
* desynchronization between balances and reserves
* rounding errors affecting fairness

Incorrect reserve accounting could break the AMM invariant.

---

# Flash Loan Assisted Manipulation

Flash loans allow attackers to borrow large capital temporarily.

This can enable:

* short-term reserve manipulation
* price distortion
* exploitation of downstream integrations

While Uniswap itself remains functional, external protocols may be vulnerable.

---

# Oracle Misuse

Uniswap spot prices can be manipulated within a single transaction.

Protocols that rely directly on pool prices as an oracle may become vulnerable.

Mitigation typically involves:

* time-weighted average price (TWAP)
* external oracle feeds

---

# External Token Behavior

Uniswap interacts with arbitrary ERC20 tokens.

Potential risks include:

* tokens with transfer fees
* tokens with rebasing supply
* tokens that revert on transfers

Unexpected token behavior can break assumptions in integrations.

---

# Liquidity Accounting

LP tokens represent proportional ownership of pool reserves.

Security review should verify:

* correct minting of LP tokens
* fair distribution of trading fees
* accurate burn redemption

Incorrect accounting could cause liquidity imbalance.

---

# Invariant Enforcement

Swaps must preserve the constant product invariant after fees.

Any flaw in swap calculations could allow value extraction from pools.

Invariant enforcement is therefore a critical security property.
