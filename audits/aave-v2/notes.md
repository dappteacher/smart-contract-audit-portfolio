# Research Notes

This document records ongoing observations and research questions.

---

# Areas Requiring Deep Review

The following areas deserve deeper analysis:

* health factor calculations
* liquidation threshold logic
* reserve accounting
* interest rate updates
* oracle interactions

---

# Questions For Further Research

Important questions during the review include:

* Can oracle updates be front-run?
* Are liquidations economically fair?
* Can flash loans manipulate collateral value?
* Are interest calculations resistant to rounding errors?

---

# Observations

Aave V2 introduces significantly greater complexity compared to AMM protocols.

Security analysis must consider both:

* smart contract vulnerabilities
* economic attack scenarios

Because lending protocols manage large liquidity pools, even small logic errors can lead to significant financial losses.
