<!-- Always-loaded: commit conventions must be in context whenever Claude commits. Keep tiny. -->

# Git workflow

- Conventional Commits (`feat`, `fix`, `chore`, `docs`, `refactor`, `test`) — enforced by commitlint.
- husky + lint-staged run ESLint + Prettier + typecheck on pre-commit. Never bypass with `--no-verify`.
- Commit only when asked. Branch off the default branch; never commit straight to it.
- Small, focused commits; the subject describes the change, not the file.
- Subject line must start with a lowercase letter (commitlint `subject-case` rule).
