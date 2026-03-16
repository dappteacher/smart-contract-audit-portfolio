# Smart Contract Audit Portfolio Index

This document is a structured index of the repository’s security research, audit reports, protocol reviews, proof-of-concept tests, and simulation scripts.

It is intended to provide a fast, professional overview of the portfolio for:

- smart contract security teams
- DeFi founders
- audit firms
- technical recruiters
- protocol engineers

---

# Repository Purpose

This repository documents my work in:

- smart contract auditing
- DeFi protocol security analysis
- attack surface identification
- vulnerability modeling
- proof-of-concept simulation
- invariant-oriented testing

The goal is to demonstrate a practical and professional auditing workflow across major Solidity and DeFi systems.

---

# Repository Map

## Core Research and Documentation

- [`README.md`](./README.md)
- [`PORTFOLIO_INDEX.md`](./PORTFOLIO_INDEX.md)

## Methodology

- [`methodology/audit-methodology.md`](./methodology/audit-methodology.md)
- [`methodology/severity-classification.md`](./methodology/severity-classification.md)

## Checklists

- [`checklists/smart-contract-audit-checklist.md`](./checklists/smart-contract-audit-checklist.md)
- [`checklists/defi-audit-checklist.md`](./checklists/defi-audit-checklist.md)

## Audit Targets

- [`audits/uniswap-v2/`](./audits/uniswap-v2/)
- [`audits/aave-v2/`](./audits/aave-v2/)
- [`audits/compound-v2/`](./audits/compound-v2/)

## Formal Audit Reports

- [`reports/uniswap-v2-audit-report.md`](./reports/uniswap-v2-audit-report.md)
- [`reports/aave-v2-audit-report.md`](./reports/aave-v2-audit-report.md)
- [`reports/compound-v2-audit-report.md`](./reports/compound-v2-audit-report.md)

## Smart Contract Labs

- [`src/compound/`](./src/compound/)
- [`src/aave/`](./src/aave/)
- [`src/uniswap/`](./src/uniswap/)
- [`src/vulnerabilities/`](./src/vulnerabilities/)

## Security Tests

- [`test/compound/`](./test/compound/)
- [`test/aave/`](./test/aave/)
- [`test/uniswap/`](./test/uniswap/)
- [`test/exploits/`](./test/exploits/)

## Simulation Scripts

- [`script/CompoundSimulation.s.sol`](./script/CompoundSimulation.s.sol)
- [`script/FlashLoanAttack.s.sol`](./script/FlashLoanAttack.s.sol)
- [`script/OracleManipulation.s.sol`](./script/OracleManipulation.s.sol)

---

# Audit Portfolio Overview

## 1. Uniswap V2 Review

### Directory
- [`audits/uniswap-v2/`](./audits/uniswap-v2/)

### Focus Areas
- AMM architecture
- reserve accounting
- invariant reasoning
- oracle misuse risk
- liquidity and swap mechanics

### Documents
- [`audits/uniswap-v2/README.md`](./audits/uniswap-v2/README.md)
- [`audits/uniswap-v2/scope.md`](./audits/uniswap-v2/scope.md)
- [`audits/uniswap-v2/architecture.md`](./audits/uniswap-v2/architecture.md)
- [`audits/uniswap-v2/attack-surfaces.md`](./audits/uniswap-v2/attack-surfaces.md)
- [`audits/uniswap-v2/findings.md`](./audits/uniswap-v2/findings.md)
- [`audits/uniswap-v2/notes.md`](./audits/uniswap-v2/notes.md)

### Report
- [`reports/uniswap-v2-audit-report.md`](./reports/uniswap-v2-audit-report.md)

### Tests
- [`test/uniswap/invariant_tests.t.sol`](./test/uniswap/invariant_tests.t.sol)

---

## 2. Aave V2 Review

### Directory
- [`audits/aave-v2/`](./audits/aave-v2/)

### Focus Areas
- lending pool architecture
- collateralization
- health factor logic
- liquidation analysis
- flash-loan-enabled attack paths
- oracle dependency

### Documents
- [`audits/aave-v2/README.md`](./audits/aave-v2/README.md)
- [`audits/aave-v2/scope.md`](./audits/aave-v2/scope.md)
- [`audits/aave-v2/architecture.md`](./audits/aave-v2/architecture.md)
- [`audits/aave-v2/attack-surfaces.md`](./audits/aave-v2/attack-surfaces.md)
- [`audits/aave-v2/findings.md`](./audits/aave-v2/findings.md)
- [`audits/aave-v2/notes.md`](./audits/aave-v2/notes.md)

### Report
- [`reports/aave-v2-audit-report.md`](./reports/aave-v2-audit-report.md)

### Tests
- [`test/aave/flashloan_attack.t.sol`](./test/aave/flashloan_attack.t.sol)
- [`test/aave/liquidation_tests.t.sol`](./test/aave/liquidation_tests.t.sol)

---

## 3. Compound V2 Review

### Directory
- [`audits/compound-v2/`](./audits/compound-v2/)

### Focus Areas
- cToken accounting
- exchange rate reasoning
- collateral factor enforcement
- interest accrual
- liquidation scenarios
- oracle dependency

### Documents
- [`audits/compound-v2/README.md`](./audits/compound-v2/README.md)
- [`audits/compound-v2/scope.md`](./audits/compound-v2/scope.md)
- [`audits/compound-v2/architecture.md`](./audits/compound-v2/architecture.md)
- [`audits/compound-v2/attack-surfaces.md`](./audits/compound-v2/attack-surfaces.md)
- [`audits/compound-v2/findings.md`](./audits/compound-v2/findings.md)
- [`audits/compound-v2/notes.md`](./audits/compound-v2/notes.md)

### Report
- [`reports/compound-v2-audit-report.md`](./reports/compound-v2-audit-report.md)

### Tests
- [`test/compound/liquidation_simulation.t.sol`](./test/compound/liquidation_simulation.t.sol)
- [`test/compound/exchange_rate_invariant.t.sol`](./test/compound/exchange_rate_invariant.t.sol)
- [`test/compound/interest_accrual_tests.t.sol`](./test/compound/interest_accrual_tests.t.sol)
- [`test/compound/oracle_manipulation_simulation.t.sol`](./test/compound/oracle_manipulation_simulation.t.sol)

---

# Smart Contract Labs

## Protocol Mocks

These contracts are simplified protocol models used for testing, simulation, and security reasoning.

### Compound
- [`src/compound/MockCToken.sol`](./src/compound/MockCToken.sol)
- [`src/compound/MockComptroller.sol`](./src/compound/MockComptroller.sol)

### Aave
- [`src/aave/MockLendingPool.sol`](./src/aave/MockLendingPool.sol)

### Uniswap
- [`src/uniswap/MockUniswapPair.sol`](./src/uniswap/MockUniswapPair.sol)

---

## Vulnerability Labs

These contracts are intentionally vulnerable or intentionally simplified to demonstrate exploit mechanics and security failure modes.

- [`src/vulnerabilities/ReentrancyVault.sol`](./src/vulnerabilities/ReentrancyVault.sol)
- [`src/vulnerabilities/DelegatecallProxy.sol`](./src/vulnerabilities/DelegatecallProxy.sol)
- [`src/vulnerabilities/OracleManipulation.sol`](./src/vulnerabilities/OracleManipulation.sol)

---

# Exploit and Security Tests

## Protocol-Oriented Tests

### Compound
- [`test/compound/liquidation_simulation.t.sol`](./test/compound/liquidation_simulation.t.sol)
- [`test/compound/exchange_rate_invariant.t.sol`](./test/compound/exchange_rate_invariant.t.sol)
- [`test/compound/interest_accrual_tests.t.sol`](./test/compound/interest_accrual_tests.t.sol)
- [`test/compound/oracle_manipulation_simulation.t.sol`](./test/compound/oracle_manipulation_simulation.t.sol)

### Aave
- [`test/aave/flashloan_attack.t.sol`](./test/aave/flashloan_attack.t.sol)
- [`test/aave/liquidation_tests.t.sol`](./test/aave/liquidation_tests.t.sol)

### Uniswap
- [`test/uniswap/invariant_tests.t.sol`](./test/uniswap/invariant_tests.t.sol)

---

## Exploit Demonstrations

These tests model classic smart contract vulnerabilities and attack paths.

- [`test/exploits/reentrancy_attack.t.sol`](./test/exploits/reentrancy_attack.t.sol)
- [`test/exploits/delegatecall_attack.t.sol`](./test/exploits/delegatecall_attack.t.sol)
- [`test/exploits/oracle_manipulation_attack.t.sol`](./test/exploits/oracle_manipulation_attack.t.sol)

---

# Simulation Scripts

These scripts demonstrate end-to-end protocol and vulnerability scenarios.

- [`script/CompoundSimulation.s.sol`](./script/CompoundSimulation.s.sol)  
  Simulates collateral supply, borrowing, and interest accrual in a Compound-style mock environment.

- [`script/FlashLoanAttack.s.sol`](./script/FlashLoanAttack.s.sol)  
  Demonstrates borrow-check ordering issues in an Aave-style mock lending pool.

- [`script/OracleManipulation.s.sol`](./script/OracleManipulation.s.sol)  
  Demonstrates how missing access control on an oracle can inflate or crash borrow power.

---

# Security Themes Covered

This portfolio currently demonstrates work across the following categories:

## Smart Contract Vulnerabilities
- reentrancy
- delegatecall misuse
- missing access control
- unsafe oracle update design

## DeFi Risks
- oracle manipulation
- liquidation edge cases
- collateral accounting
- interest accrual logic
- exchange rate reasoning
- flash-loan-assisted attack feasibility

## Audit Methodology
- scope definition
- architecture review
- attack surface mapping
- findings classification
- adversarial scenario modeling
- proof-of-concept design

---

# How To Review This Repository

A recommended review path for technical readers is:

## Option 1: Audit-Focused Review
1. Read [`README.md`](./README.md)
2. Read [`methodology/audit-methodology.md`](./methodology/audit-methodology.md)
3. Read one protocol folder under [`audits/`](./audits/)
4. Review the corresponding report in [`reports/`](./reports/)
5. Review related tests in [`test/`](./test/)

## Option 2: Security Research Review
1. Review [`src/vulnerabilities/`](./src/vulnerabilities/)
2. Review exploit tests in [`test/exploits/`](./test/exploits/)
3. Review scripts in [`script/`](./script/)

## Option 3: DeFi Protocol Review
1. Start with Uniswap V2
2. Continue to Aave V2
3. Continue to Compound V2
4. Compare architecture, risks, and testing strategy across all three

---

# Portfolio Status

## Completed
- repository structure
- methodology documents
- severity model
- audit checklists
- Uniswap V2 review
- Aave V2 review
- Compound V2 review
- formal audit reports
- mock protocol contracts
- vulnerability labs
- proof-of-concept tests
- simulation scripts

## Planned Improvements
- additional DeFi protocol reviews
- more invariant testing
- fuzz testing extensions
- advanced exploit recreations
- gas analysis notes
- architecture diagrams

---

# Author

**Jacob (Yaghoub) Adelzadeh**

## Focus
- Solidity security
- DeFi protocol auditing
- smart contract vulnerability research
- proof-of-concept exploit simulation

## LinkedIn
- https://www.linkedin.com/in/dappteacher

---

# Disclaimer

This repository is intended for educational, research, and portfolio purposes.

Some findings and risk patterns discussed here may already be publicly known or commonly understood within the smart contract security community.

The purpose of this repository is to demonstrate:

- technical understanding
- security methodology
- audit communication
- testing and adversarial reasoning