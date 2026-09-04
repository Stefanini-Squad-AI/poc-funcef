---
paths:
  - 'src/features/**'
---

<!-- Loads only when Claude touches a feature. Layer map and import boundaries: architecture.md. -->

# Features — the domain layer

A feature is a **self-contained vertical slice of one business domain**. It owns its data
access, logic, UI, and types. Internal dependency flows one way:

```
components/  →  hooks/  →  api/        (never reversed)
(presentation) (logic)   (data access)
```

## Folder contract

```
features/<domain>/
├── api/
│   ├── endpoints.ts   # pure URL/config builders — return strings/configs, NO HTTP, no React
│   ├── client.ts      # typed HTTP calls (consume endpoints.ts via api<T> from @/core/api)
│   └── index.ts       # api barrel
├── hooks/        # React Query hooks wrapping api/ (useQuery / useMutation)
├── components/   # domain UI (presentation; the "dumb" side of smart/dumb)
├── types.ts      # DTOs and domain types
├── validators.ts # Zod schemas + inferred form types (only when the feature has forms)
└── index.ts      # barrel — the feature's PUBLIC API only
```

**There is no `service.ts`**. Hooks call the `api` instance directly — the
`Service` class pattern is not used in this template. The hook is the
data-access facade. (Example, if present: `features/tasks` — a disposable demo.)

## Rules

- **Components never call `api/` directly** — always through a hook.
- **`endpoints.ts` are pure builders** (no HTTP, no React); **`client.ts` makes the typed
  calls** through the `api` instance from `@/core/api`.
- **DTOs in `types.ts`; form types in `validators.ts`** via `z.infer` — never hand-write a
  type that Zod can infer.
- **`index.ts` exposes only the public building blocks** a page (or another layer) needs.
- **Features never import from other features** (see `architecture.md`). Shared need →
  promote to `shared/`.

> ✅ Need to share? Promote to `shared/` (generic) or `core/` (identity/session).
> ❌ `import { something } from '@/features/other-feature'` — `eslint-plugin-boundaries` rejects it.

## Hook naming

- Query: `useAll<Entity>` (list) / `use<Entity>ById` (detail) — `useAllTasks`, `useTaskById`.
- Mutation: `use<Action><Entity>` — `useCreateTask`, `useUpdateTask`, `useDeleteTask`.
- Never `useGet*` — `use` already implies data access.

## Sub-features

Split by **business cohesion, not by route**. A sub-feature mirrors the same contract.
Do not nest a domain folder inside a folder of the same name (redundant nesting).

## See also

- `data-fetching.md` — how `api/` and the React Query hooks are written
- `routing.md` — how pages consume a feature's public API
