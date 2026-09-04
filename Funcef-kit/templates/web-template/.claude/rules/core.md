---
paths:
  - 'src/core/**'
---

<!-- Loads when Claude touches core. Layer map: architecture.md. -->

# Core — infrastructure & cross-cutting concerns

`core/` holds app-wide wiring and infrastructure concerns that more than one feature
needs. **Features may import from `core/`** — that is how the app avoids
feature-to-feature imports. `core/` itself imports only from `shared/`,
never from `app/` or `features/`.

## What lives here

- `core/config/` — query client config (`getQueryClient`), menu config, env-level setup.
- `core/api.ts` — the `api` instance (`createApi` from `@funcef-componentes/auth`)
  for the main backend; it knows the auth provider (which is why it lives in
  `core/`, not `shared/`).
- `core/auth/` — provider wiring: factory (`createFuncefAuth`), `authClient`,
  `getServerSession`, teardown. (Session guards and `AuthErrorListener` come from
  `@funcef-componentes/auth/client`, mounted in the authenticated shell.)

## Rules

- Compose providers here; mount the composed tree in the root `layout.tsx` via `GlobalProviders`.
- Validate environment variables in one place (`src/shared/config/env.ts`) — fail fast on a missing required var.
- No domain business logic — `core/` wires and exposes infrastructure, it doesn't implement features.
- Never import from `app/` or `features/` (enforced by `eslint-plugin-boundaries`).

## See also

- `architecture.md` — layer map and import boundaries
- `data-fetching.md` — the `api` instance and React Query
