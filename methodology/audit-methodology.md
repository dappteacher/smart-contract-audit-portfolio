# Smart Contract Audit Methodology

This document describes the structured process used when reviewing smart contracts and DeFi protocols.

The goal is to apply **systematic security analysis** rather than ad-hoc code inspection.

---

# 1. Scope Definition

The first step is identifying the **audit boundaries**.

This includes:

* contracts in scope
* external dependencies
* trusted actors
* upgradeability mechanisms
* off-chain components (if relevant)

Clearly defining scope prevents incorrect assumptions during the audit.

---

# 2. Architecture Review

Before reviewing code line-by-line, the **system architecture must be understood**.

Important questions include:

* What are the core protocol components?
* How do contracts interact?
* Where are funds stored?
* What are the trust assumptions?
* Which components have privileged permissions?

Architecture understanding helps identify **critical security boundaries**.

---

# 3. State Transition Analysis

Protocols are analyzed by reviewing **state transitions** across key user actions.

Examples include:

* deposit
* withdraw
* borrow
* repay
* mint
* burn
* swap
* liquidate

For each transition we ask:

* Which variables change?
* Are invariants preserved?
* Can an attacker manipulate inputs?

---

# 4. Attack Surface Mapping

Next we identify **areas of high risk**.

Typical attack surfaces include:

* external contract calls
* token transfers
* oracle dependencies
* upgradeable proxies
* governance controls
* callback mechanisms

Understanding these surfaces helps prioritize deeper review.

---

# 5. Vulnerability Review

The code is reviewed for common vulnerability classes including:

* reentrancy
* access control failures
* arithmetic errors
* unsafe external calls
* signature validation errors
* denial-of-service vectors
* economic manipulation risks

Both **technical bugs** and **economic design weaknesses** are considered.

---

# 6. Adversarial Thinking

Security reviews assume a **malicious environment**.

The following scenarios are considered:

* flash loan attacks
* MEV manipulation
* oracle manipulation
* governance attacks
* griefing or denial-of-service

Protocols must remain secure even when interacting with adversarial actors.

---

# 7. Proof-of-Concept Design

Where possible, theoretical issues are evaluated through:

* exploit scenario design
* testing strategies
* attack simulations

The goal is to validate whether an issue is **practically exploitable**.

---

# 8. Severity Classification

Each finding is assigned a severity level based on:

* exploitability
* impact on funds
* protocol disruption potential
* required privileges

Severity definitions are documented in:

```
severity-classification.md
```

---

# 9. Reporting

All findings are documented with the following structure:

* Title
* Severity
* Description
* Impact
* Recommendation

Clear documentation ensures findings are **actionable and understandable**.
