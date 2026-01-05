Division Errors (Truncation & Division by Zero)
❌ Integer Truncation
uint reward = (3 / 2) * 100; // = 100, not 150


Why unsafe:

Solidity uses integer math

Fractions are truncated

✔ Fix

uint reward = (3 * 100) / 2;