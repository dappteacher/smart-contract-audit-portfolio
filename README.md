# Smart Contract Audit Portfolio

**Author:** Jacob (Yaghoub) Adelzadeh
**Focus:** Solidity Security • DeFi Protocol Analysis • Smart Contract Auditing

---

## Overview

This repository documents my **smart contract security research and manual auditing practice** across major Solidity-based protocols and DeFi systems.

The goal is to demonstrate a **professional security auditing workflow**, including:

* protocol architecture analysis
* attack surface identification
* adversarial threat modeling
* vulnerability research
* proof-of-concept exploit thinking
* structured audit reporting

This repository serves as a **public audit portfolio** showcasing my methodology, research process, and findings while reviewing real-world protocols.

---

## Audited Protocols (Research Targets)

| Protocol    | Category   | Status      |
| ----------- | ---------- | ----------- |
| Uniswap V2  | AMM / DEX  | In Progress |
| Compound V2 | Lending    | Planned     |
| Aave V2     | Lending    | Planned     |
| MakerDAO    | Stablecoin | Planned     |
| Curve       | AMM        | Planned     |

---

## Repository Structure

```
smart-contract-audit-portfolio

audits/
    protocol-specific research

reports/
    full audit-style reports

checklists/
    reusable security audit checklists

methodology/
    auditing framework and severity model

assets/
    diagrams and supporting material
```

---

## Audit Methodology

The review process used in this repository follows a structured security workflow:

1. Scope definition
2. Protocol architecture analysis
3. State transition review
4. Attack surface mapping
5. Vulnerability analysis
6. Proof-of-concept design
7. Severity classification
8. Security reporting

Full methodology:

```
methodology/audit-methodology.md
```

---

## Security Focus Areas

Common vulnerability classes reviewed during audits include:

* reentrancy vulnerabilities
* access control failures
* flash loan attack vectors
* oracle manipulation
* accounting inconsistencies
* unsafe external calls
* upgradeability risks
* governance manipulation

---

## Tools Used

Security research in this repository may involve the following tools:

* **Foundry** – testing and fuzzing
* **Slither** – static analysis
* **Echidna** – property-based fuzzing
* **Mythril** – symbolic analysis

---

## Purpose of This Repository

This project exists to:

* build a **public smart contract auditing portfolio**
* practice **real-world DeFi protocol security analysis**
* document **vulnerability patterns and attack surfaces**
* demonstrate **professional audit reporting**

---

## Disclaimer

All content in this repository is for **educational and research purposes only**.

Some issues discussed may already be known or previously disclosed.
The goal of this repository is to demonstrate **security reasoning and auditing methodology**, not to claim novel discoveries.

---

## Contact

If you are interested in collaboration, smart contract security discussions, or audit services:

LinkedIn:
https://www.linkedin.com/in/dappteacher
