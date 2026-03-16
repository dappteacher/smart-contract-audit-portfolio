# Uniswap V2 Audit-Style Review

**Author:** Jacob Adelzadeh  
**Status:** Portfolio Research  
**Category:** DeFi / AMM  
**Target:** Uniswap V2

## 1. Overview

This document presents an audit-style security review of Uniswap V2, with emphasis on architecture understanding, attack-surface analysis, and integration-related risk.

## 2. Scope

Reviewed areas include:

- AMM pair model
- reserve accounting
- mint and burn flows
- swap mechanics
- oracle-related assumptions
- flash-loan-assisted manipulation risks

## 3. Methodology

The review was performed using:

- manual architecture review
- adversarial threat modeling
- attack surface mapping
- security property analysis
- review of common DeFi exploit patterns

## 4. Summary

| Severity | Count |
|----------|-------|
| Critical | 0 |
| High     | 0 |
| Medium   | 0 |
| Low      | 1 |
| Info     | 1 |

## 5. Findings

### INFO-01: Spot Price Should Not Be Used as a Secure Oracle

#### Description
Uniswap V2 spot pricing can be manipulated over short windows and therefore should not be trusted as a secure price source for external protocols.

#### Impact
Unsafe downstream integrations may become vulnerable to oracle manipulation.

#### Recommendation
Use TWAP-based mechanisms or stronger oracle designs.

---

### LOW-01: Integrations Must Consider Non-Standard ERC20 Behavior

#### Description
Assumptions about token transfer behavior may not hold for all ERC20-like assets.

#### Impact
Unexpected accounting or compatibility risks may arise in integrations.

#### Recommendation
Explicitly define supported token assumptions and test edge cases.

## 6. Conclusion

Uniswap V2 is a foundational AMM design and a strong educational target for security review. The most important practical security lesson is that protocol integrations must carefully handle pricing assumptions, token behavior assumptions, and flash-loan-enabled market manipulation.