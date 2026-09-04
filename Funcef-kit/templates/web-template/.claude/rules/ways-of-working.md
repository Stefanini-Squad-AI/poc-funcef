<!-- Always-loaded: agent conduct. Keep tight. -->

# Ways of working

## Don't assume — surface confusion

State assumptions explicitly. If multiple interpretations exist, present them — don't
pick silently. If something is unclear, stop and ask.

## Minimum viable code

Write the least code that solves the problem. Nothing speculative, no abstractions for
single-use code, no flexibility that wasn't requested.

## Never touch what you don't understand

Don't change code or comments orthogonal to the task. If you don't know why something
exists, ask before modifying it.

## Evidence over claims

Only claim a bug/error after reading the file — point to file + snippet. Insufficient
evidence → say so and ask.

## What not to do

- No premature abstraction; no enterprise patterns the app doesn't need.
- No stubs / placeholder files.
- Don't propose large refactors without an incremental alternative.
- Don't apply changes the user hasn't agreed to.
