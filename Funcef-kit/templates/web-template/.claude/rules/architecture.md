<!--
  Always-loaded rule (no `paths`): the layer map is needed for almost every
  "where does this go?" decision. Keep it tight. Per-layer detail lives in the
  path-scoped sub-rules — do not duplicate it here.
-->

# Architecture

Feature-based Next.js (App Router). Code is organized by **business domain**, not by
technical type. Four layers, with a strict one-way dependency flow.

## Layers

| Layer       | Role                                                            | May import from              |
| ----------- | --------------------------------------------------------------- | ---------------------------- |
| `app/`      | Routing & orchestration — decides **what** to show              | `features`, `core`, `shared` |
| `features/` | Business domain — decides **how** it works                      | `core`, `shared`             |
| `core/`     | Infra + cross-cutting concerns (providers, auth, config, `api`) | `shared`                     |
| `shared/`   | Reusable base — generic UI, utils, types, env                   | nothing above it             |

> Global state (zustand/`store/`) is NOT part of the base template — server
> state is React Query; for genuine client state add zustand on demand.
> Telemetry is opt-in via `@funcef-componentes/observability` — cross-cutting
> tooling, not a layer.

## Import boundaries — unidirectional, never reversed

```
app/       → features, core, shared
features/  → core, shared            (never another feature)
core/      → shared
shared/    → NEVER imports from app, features, core
```

A lower layer must never import from a higher one. `shared/` is the floor: it knows
nothing about any domain. **Features never import from other features** — if two
features need the same thing, promote it to `shared/`; cross-cutting infra
(auth, session, providers, the `api` instance) lives in `core/`, which features may import.

**Enforced by ESLint:** `eslint-plugin-boundaries` (`boundaries/dependencies` in
`eslint.config.mjs`) makes a forbidden import fail lint. This is the hard guardrail;
the table above is the intent.

## Golden rule — where does the code go?

```
Specific to one route/URL?         → app/<route>/
Specific to one business domain?   → features/<domain>/
Cross-cutting infra or identity?   → core/   (providers, auth, config, api)
Reused across features, generic?   → shared/
Global client state?               → zustand on demand (not a layer)
```

If you can't place it, the boundary is unclear — stop and resolve the layer first.

## Naming

| Item                | Convention        | Example                               |
| ------------------- | ----------------- | ------------------------------------- |
| Files & directories | kebab-case        | `user-card.tsx`, `personal-info/`     |
| Component exports   | PascalCase        | `UserCard`                            |
| Hook exports        | `use` + camelCase | `useUser`, `useUserUpdate`            |
| Type exports        | PascalCase        | `User`, `PaginatedResponse`           |
| Barrels             | always `index.ts` | `features/tasks/index.ts`             |
| Route pages         | always `page.tsx` | `app/(authenticated)/(home)/page.tsx` |

**Idioma (regra do template):** código em INGLÊS — identificadores, arquivos,
pastas, rotas, tipos. PORTUGUÊS apenas em (a) strings que chegam ao usuário
(labels, toasts, mensagens de validação) e (b) docs/comentários/JSDoc. Só
shapes de resposta do backend mantêm seus nomes originais. Detalhe em
`code-style.md`.

## See also

- `routing.md` — the `app/` layer: route groups, proxy.ts, pages as orchestrators
- `features.md` — internal contract of a feature (no service.ts)
- `data-fetching.md` — the data layer (hooks → `api` de `@/core/api`, caching)
- `core.md` — infrastructure & cross-cutting concerns in `core/`
