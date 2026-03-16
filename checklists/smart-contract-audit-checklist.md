# Smart Contract Security Audit Checklist

This checklist is used during manual security reviews.

---

# Access Control

* privileged roles identified
* ownership transfer mechanisms reviewed
* role-based permissions validated
* initialization functions protected
* upgrade permissions restricted

---

# State Safety

* critical state variables identified
* invariants preserved during operations
* arithmetic behavior validated
* rounding direction reviewed
* storage updates consistent

---

# External Calls

* reentrancy risks evaluated
* return values checked
* callback mechanisms reviewed
* token transfer assumptions validated
* external dependencies documented

---

# Initialization & Upgradeability

* constructors verified
* initialization functions protected
* proxy storage layout validated
* upgrade authorization reviewed

---

# Denial of Service

* loops with unbounded iteration
* dependency on external calls
* gas-limit sensitive operations
* griefing attack vectors

---

# Cryptographic Verification

* signature validation reviewed
* replay protection implemented
* nonce usage verified
* domain separation checked

---

# Emergency Controls

* pause mechanisms evaluated
* emergency withdrawal options reviewed
* admin abuse potential assessed
