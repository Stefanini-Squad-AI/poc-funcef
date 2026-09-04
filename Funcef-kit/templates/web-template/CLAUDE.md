# CLAUDE.md

FUNCEF web template — Next.js 16 App Router, feature-based.
Architecture, conventions, and agent conduct live in `.claude/rules/` (loaded
automatically). This file is the entry point and command reference.

## Stack

Next.js 16 (App Router) · React 19 · TypeScript · Tailwind · TanStack Query ·
React Hook Form + Zod · `@funcef-componentes/auth` (Better Auth + Microsoft
Entra; HTTP via `createApi`) · `@funcef-componentes/react` v2. Axios was removed in v3 —
HTTP goes through `@/core/api`, never an ad-hoc client. Zustand is not in the base either,
but for genuine global client state add zustand on demand — never for server state. Confirm exact
versions in `package.json` before version-specific work.

## Commands

```bash
# Development
pnpm dev             # start dev server
pnpm mock            # dev mock API (json-server on port 3001)
pnpm build           # production build
pnpm format          # prettier --write

# Verification (must all pass before marking work done)
pnpm typecheck       # tsc --noEmit
pnpm lint            # eslint
pnpm test:run        # vitest run (run once, no watch)
```

Run all three verification commands in sequence to confirm CI-equivalent health.

## Architecture

Four layers: `app/` → `features/` → `core/` → `shared/`. Import flow is
strictly one-way and enforced by `eslint-plugin-boundaries` — a forbidden import
fails lint (including unknown files, via `boundaries/no-unknown-files`).
Features never import from other features; promote shared code to `shared/` or
`core/`. Global client state is not a layer (add zustand on demand); telemetry
is opt-in via `@funcef-componentes/observability`.

### Rules — `.claude/rules/`

Always loaded (no `paths`):

- `architecture.md` — 4-layer map, import boundaries, naming, "where does code go?"
- `ways-of-working.md` — agent conduct (don't assume, minimum viable code, what not to do)
- `git-workflow.md` — conventional commits, husky/lint-staged, commit only when asked

Loaded on demand (when you touch matching files):

- `routing.md` (`src/app/**`) — route groups, proxy.ts, smart/dumb orchestrators
- `features.md` (`src/features/**`) — the feature contract (no service.ts)
- `data-fetching.md` (`src/features/**`, `src/app/**`) — React Query via `api<T>`
- `core.md` (`src/core/**`) — infrastructure, providers, guards, auth, config
- `code-style.md` (`src/**/*.{ts,tsx}`) — TS strict, Zod, imports `@/`
- `components.md` (`src/**/*.tsx`) — shared/ui vs \_components vs features/components + lib v2
- `testing.md` (`**/*.{test,spec}.*`, `**/__tests__/**`) — Vitest + MSW + Testing Library

## Skills

- `/new-feature` — user-invoked scaffold for a new feature under `src/features/`
  (asks questions, previews, then generates per the feature contract).
- `next-best-practices` — Next.js 16 reference. **Auto-loaded when relevant; NOT
  user-invocable** (no `/` prefix).
- `funcef-lib` — published design-system manifest reference (imports, story
  snippets, API) queried via `pnpm dlx @funcef-componentes/cli ds component <Name>`.
  **Auto-loaded when relevant; NOT user-invocable** (no `/` prefix).

## Gotchas

- **Language (code = EN, user-facing = PT)**: identifiers, files, folders, routes and
  types are ENGLISH; Portuguese only for strings the user sees (labels, toasts, Zod
  messages) and docs. ✅ `const dueDate` + toast `"Tarefa criada"`. ❌ `const dataVencimento`,
  ❌ `label="Due date"`. Backend response shapes keep their original keys.
- **Next.js 16 renamed Middleware → Proxy**: the middleware file is `src/proxy.ts`, not
  `middleware.ts`. Public Next.js docs reference `middleware.ts` — ignore that here.
- **Import boundaries are hard-enforced**: `eslint-plugin-boundaries` will fail the lint
  step for any forbidden cross-layer import. Don't suppress the error — fix the boundary.
- **Features never import from other features**: shared logic must be promoted to `shared/`
  (generic) or `core/` (identity/auth/session). ✅ promote to `shared/` or `core/`; ❌ `import { x } from '@/features/other-feature'`.
- **pnpm only**: the project uses pnpm. Never suggest or run `npm install` or `yarn`.
- **Commit only when asked**: husky + lint-staged run on commit; never commit speculatively.
  The user controls when work is committed.
- **lib v2 Base UI** (`@funcef-componentes/react ^2`): use `render` prop, NOT `asChild`;
  components emit `data-state` instead of `data-[state]`; loading indicator is
  `LoadingFuncef`. Prefer lib v2 over custom implementations. ✅ `<Slot render={<a />} />`; ❌ `<Slot asChild>`.
- **No service.ts layer**: features call `api<T>` directly from hooks; there is no
  `service.ts` intermediary. The feature contract is:
  `components → hooks → api/{endpoints,client} → types/validators`.
- **Data fetching via `api<T>`**: the `api` instance at `@/core/api` points to
  the same-origin BFF (`/api/bff` — Bearer resolved server-side by
  `createBffHandler`); features call `api.get<T>(endpoint)` — never instantiate
  an HTTP client ad hoc. ❌ `import axios`; ❌ `fetch('/api/...')` inside a hook.
- **Tests use Vitest + MSW**: test files use `renderHookWithProviders`, `jsonOk`, and
  MSW handlers — not Jest, not real network calls.
- **Env vars in `src/shared/config`**: `env.ts` (server-only, Zod-validated) and
  `env-client.ts`; never read `process.env` directly outside these files. Single
  exception: `process.env.NODE_ENV` (must stay a literal for bundler dead-code
  elimination).
- **Two separate mocks — don't mix them**: tests use MSW (`src/__tests__/msw/`); the dev
  API is json-server (`pnpm mock`, `mocks/db.json`). Never wire an MSW worker for dev.
- **Scenario conversion is CLI-driven**: the base repo IS Cenário 2 (Full BA / Entra ID);
  to convert to Consumidor TKF2 use `pnpm dlx @funcef-componentes/cli scenario apply` —
  there is no overlay material in this repo anymore.
