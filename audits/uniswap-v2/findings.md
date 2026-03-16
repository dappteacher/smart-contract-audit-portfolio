# Findings

The following observations were identified during the review.

Note: Some issues are well-known design considerations rather than newly discovered vulnerabilities.

---

# INFO-01 Spot Price Should Not Be Used As Secure Oracle

Severity: Informational

## Description

Uniswap V2 pools expose token prices derived from current reserves.

These prices represent **instantaneous spot prices**, which can be temporarily manipulated by actors with sufficient capital.

Because swaps update reserves immediately, attackers can distort prices during a transaction.

## Impact

Protocols that use Uniswap spot prices directly as an oracle may become vulnerable to price manipulation attacks.

Flash loans can make such manipulation economically viable.

## Recommendation

Protocols integrating with Uniswap should:

* use time-weighted average price mechanisms
* rely on robust oracle systems
* validate price feeds across multiple sources

---

# LOW-01 Non Standard ERC20 Tokens May Introduce Integration Risks

Severity: Low

## Description

Uniswap assumes token transfers behave according to ERC20 expectations.

However some tokens implement non-standard behavior including:

* transfer fees
* rebasing supply
* transfer restrictions

Such behavior may create unexpected interactions with pool accounting.

## Impact

Integrations interacting with unusual tokens may experience accounting discrepancies or transaction failures.

## Recommendation

Integrators should carefully evaluate token behavior before integrating them into liquidity pools.
