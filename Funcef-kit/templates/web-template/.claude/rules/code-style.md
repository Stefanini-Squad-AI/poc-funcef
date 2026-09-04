---
paths:
  - 'src/**/*.{ts,tsx}'
---

# Code style

Prettier and ESLint are the source of truth for formatting and lint — run them, don't
hand-format against them.

## Language

Write **code in English** — identifiers (variables, functions, types,
components), file and directory names, **routes** (`/tasks`, not `/tarefas`),
and these engineering rules (`.claude/rules/`).

**Portuguese** is reserved for:

- **user-facing strings**: labels, placeholders, titles, toasts, Zod validation
  messages, any UI text;
- **product docs**: `README`, `docs/` (incl. recipes). Code comments follow the
  surrounding file.

Exceptions — the **backend's contract**: (a) response shape keys keep their original
names (e.g. `{ resultado, mensagem, qtdRegistros }`); (b) endpoint path literals in
`api/endpoints.ts` may stay Portuguese (e.g. `/produtos`) when that's what the backend
exposes. Never translate either. The **routes** rule above is about Next.js _app_ routes
(`src/app/`), not backend API paths.

**Example:** ✅ `const dueDate` + `toast.success('Tarefa criada')` + `label="Vencimento"`.
❌ `const dataVencimento` (PT identifier), ❌ `label="Due date"` (UI text in English).

## Rules

- TypeScript strict; no unjustified `any`. Prefer precise, inferred types.
- Zod: always named import (`import { z } from 'zod'`), never default.
- Absolute imports via `@/` — no deep relative chains (`../../../`).
- One component per file. PascalCase component export, kebab-case filename (see `architecture.md`).
- No dead code, no commented-out blocks, no speculative abstractions.
- React 19: no `React.forwardRef` for new components — React 19 passes `ref` as a prop directly.

## See also

- `architecture.md` (naming conventions)
- `components.md` (component patterns)
