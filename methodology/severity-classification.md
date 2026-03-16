# Severity Classification Model

Findings discovered during security reviews are categorized according to impact and exploitability.

---

# Critical

Issues that can lead to **catastrophic protocol failure**.

Examples:

* direct theft of user funds
* permanent freezing of assets
* total protocol compromise

Critical issues typically require **immediate remediation**.

---

# High

Issues that may result in **significant loss of funds or severe disruption**.

Examples include:

* privilege escalation
* large economic manipulation
* serious accounting flaws

High severity issues should be addressed before deployment.

---

# Medium

Issues with **meaningful but limited impact**.

Examples include:

* partial denial-of-service
* economic inefficiencies
* logic errors with restricted conditions

These should be resolved to improve protocol safety.

---

# Low

Issues with **minor security implications**.

Examples include:

* edge-case inconsistencies
* minor privilege misconfigurations
* potential future risk patterns

Low severity findings improve long-term maintainability.

---

# Informational

Observations that **do not represent an immediate security vulnerability**.

Examples include:

* code quality improvements
* documentation suggestions
* best-practice recommendations

Informational findings still improve protocol robustness.
