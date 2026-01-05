4. Precision Loss in Fixed-Point Math

Solidity has no native decimals.

❌ Unsafe
uint interest = principal * rate / 100;


If rate < 100, precision may be lost.

✔ Safer Pattern

uint interest = (principal * rate * 1e18) / 100 / 1e18;