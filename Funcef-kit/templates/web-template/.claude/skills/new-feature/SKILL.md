---
name: new-feature
description: Scaffolds a new feature under src/features/ following the template's feature contract (defined in this skill's reference/scaffold.md) — adaptive questions, file preview, then generation. Use when the user asks to create a new feature, sub-feature, or CRUD domain slice. Do NOT use for new routes/pages only (app/ layer), shared UI components, or changes to an existing feature.
user-invocable: true
---

# New Feature Scaffold

Use when creating a new feature or sub-feature in `src/features/`. Guides placement
decisions, determines the right file set, shows a preview for approval, then generates
boilerplate that matches the template's contract via subagents.

The contract this scaffold follows is defined in [`reference/scaffold.md`](reference/scaffold.md)
— the authoritative source of truth for every file it emits. `src/features/tasks/` is a
concrete example if it exists, but it is a disposable demo: never depend on it.

## Hard Gate

Never create files before explicit `[Generate]` confirmation from the user. Show the
preview, wait for approval, then generate.

## Process

1. **Dispatch exploration subagent** — immediately on invoke, read-only, Haiku model
2. **Gather context** — 3 required questions + conditional follow-ups, one at a time
3. **Determine files** — build the exact file list from answers
4. **Show preview** — file tree + optional checkboxes; user adjusts and confirms
5. **Generate** — dispatch generation subagent (Sonnet) after `[Generate]`

## Step 1: Exploration subagent

Dispatch immediately when the skill is invoked. Use the Haiku model. Runs in parallel with
your first question. Read-only. Prompt:

> You are exploring a Next.js codebase to collect context for a feature scaffold.
> Working directory: the project root. Read-only — do not modify any file.
>
> Find and return:
>
> 1. The shared HTTP client: confirm `api` is exported from `@/core/api`
>    (file `src/core/api.ts` — a `createApi` instance from
>    `@funcef-componentes/auth/client`; calls: `api.get<T>`, `api.post<T, B>`).
> 2. The central query-key factory in `src/shared/lib/query-keys.ts` — return the
>    existing groups and the `all` / `list()` / `detail(id)` shape.
> 3. The reusable Zod fields exported from `@/shared/lib/fields`
>    (`cpfField`, `birthDateField`/`createBirthDateField`).
> 4. The feature contract + templates in `reference/scaffold.md` (this skill's folder).
>    Also read `src/features/tasks/**` IF it exists, as a concrete example — it is a
>    disposable demo, so do not require it.
> 5. The list of existing root feature directory names in `src/features/`, and whether
>    a feature named `[NAME]` already exists there.
> 6. The test helpers: `renderHookWithProviders` from `@/__tests__/render`, and
>    `jsonOk` / `errorStatus` from `@/__tests__/msw/handlers`, plus `server` from
>    `@/__tests__/msw/server`.

Use the results to fill real import paths, the query-key pattern, and the field imports in
the generation step. If the feature `[NAME]` already exists, stop and tell the user before
asking anything else.

## Step 2: Gather context

Ask these 3 questions, one at a time:

**Q1 (always):** "What feature are you building? Give it a name (in English — translate if you were given a Portuguese term, e.g. `orders` not `pedidos`) and one sentence on what it does."

**Q2 (always):** "Is this a new root feature (`src/features/<domain>/`) or a sub-feature of an existing one? If sub-feature, which root does it belong to?"

**Q3 (always):** "What HTTP operations does it need? List endpoint URL(s) and method(s) (GET / POST / PUT / DELETE). Type `none` if it only aggregates existing sub-features."

Then ask follow-ups **only when still ambiguous**:

| When                               | Ask                                                                              |
| ---------------------------------- | -------------------------------------------------------------------------------- |
| Has POST/PUT/DELETE                | "Does this operation need a form? (validators.ts + Zod schema)"                  |
| Return type not described          | "Describe the response shape — key fields and their types."                      |
| Form has a known field             | "Any of these fields CPF / birth date? (reuse shared fields)"                    |
| Placement is sub-feature           | "Where exactly inside `<root>`? (e.g. `perfil/dados-pessoais`)"                  |
| User mentioned constants           | "List the constants/enums needed."                                               |
| Description mentions UI explicitly | "Does it need UI components scaffolded?"                                         |

Stop asking when you have enough to build the file list and fill in the generated files.

## Step 3: Determine files

### Standard feature (has HTTP operations)

Always generate:

```
<domain>/
├── api/
│   ├── endpoints.ts   pure URL builders — no HTTP, no React
│   ├── client.ts      typed HTTP calls via api<T> from @/core/api (object, no class)
│   └── index.ts       api barrel
├── types.ts           DTOs and domain types
└── index.ts           feature public barrel
```

Add conditionally:

| Condition           | Files added                                                                                          |
| ------------------- | ---------------------------------------------------------------------------------------------------- |
| Has GET             | `hooks/use-<domain>-query.ts`, `hooks/__tests__/use-<domain>-query.test.tsx`                          |
| Has POST/PUT/DELETE | `hooks/use-<domain>-mutation.ts`, `hooks/__tests__/use-<domain>-mutation.test.tsx`                    |
| Has form            | `validators.ts`, `__tests__/validators.test.ts`                                                      |
| Has constants       | `constants.ts`                                                                                       |
| Has UI              | `components/<name>/<name>.tsx`, `components/<name>/index.ts`                                         |

Any standard feature with HTTP also requires **registering a new group in the central
`queryKeys` factory** (`src/shared/lib/query-keys.ts`) — call this out in Step 5 and the
preview. The scaffold never inlines `queryKey` arrays.

### Aggregator case (HTTP = "none")

Only generate:

```
<domain>/
├── components/
│   └── <name>/
│       ├── <name>.tsx   composes sub-features
│       └── index.ts
└── index.ts             barrel re-exporting sub-features
```

`api/`, `hooks/`, and `types.ts` are NOT generated. No new `queryKeys` group is needed.

## Step 4: Preview

Present this format and wait for user input before proceeding:

```
## New Feature — `<domain>`

📁 src/features/<path>/
├── api/
│   ├── endpoints.ts                              ← URL builders
│   ├── client.ts                                 ← typed HTTP calls (api<T>)
│   └── index.ts
├── hooks/
│   ├── __tests__/
│   │   └── use-<domain>-query.test.tsx           ← MSW: loading/success/error
│   └── use-<domain>-query.ts                     ← GET hook (useQuery + queryKeys)
├── types.ts
└── index.ts

⚠ Register a `<domain>` group in src/shared/lib/query-keys.ts (all / list() / detail(id))

Options:
  [ ] Add validators.ts + __tests__/validators.test.ts   (form + Zod schemas; reuse shared fields)
  [ ] Add hooks/use-<domain>-mutation.ts (+ test)         (POST/PUT/DELETE + invalidateQueries)
  [ ] Add components/<name>/                              (UI via @funcef-componentes/react)
  [ ] Add constants.ts                                    (project constants/enums)

  [Generate]   [Cancel]
```

If the user requests adjustments (wrong name, placement, endpoint), update and re-show
the preview. Only proceed when the user selects `[Generate]`.

## Naming conventions

| Context                   | Convention                       | Example                                 |
| ------------------------- | -------------------------------- | --------------------------------------- |
| Feature/file directory    | kebab-case, English              | `orders/`, `personal-data/`             |
| File name                 | kebab-case                       | `use-orders-query.ts`, `endpoints.ts`   |
| TypeScript type/interface | PascalCase                       | `Order`, `CreateOrderData`              |
| Query hook                | `use<Entity>` / `useAll<Entity>` | `useTaskById`, `useAllTasks`            |
| Mutation hook             | `use<Action><Entity>`            | `useCreateTask`, `useDeleteTask`        |
| API object                | `<domain>Api` (camelCase)        | `tasksApi`, `ordersApi`                 |
| Endpoint builders object  | `endpoints` (per-feature)        | `endpoints.getAll()`                    |
| Query keys                | central factory group            | `queryKeys.tasks.list()`                |

> Note: the authoritative contract + templates live in `reference/scaffold.md`;
> `.claude/rules/features.md` documents the naming rules. `src/features/tasks`, if
> present, is a concrete example (a disposable demo).

## Step 5: Generation subagent

Dispatch a Sonnet subagent after `[Generate]`. Provide all of the following:

- Feature domain name (kebab-case directory), entity name (PascalCase)
- Exact list of files to create with their full paths
- HTTP endpoint URL(s) and method(s)
- Response type shape (fields and types from the user's description)
- Whether form/validators are needed, the field list, and which fields map to a shared
  field (`cpfField` / `birthDateField`)
- Confirmation that `api` is imported from `@/core/api` and `queryKeys` from
  `@/shared/lib/query-keys` (from exploration result)
- The existing `queryKeys` shape (so the new group matches `all` / `list()` / `detail(id)`)

Instruct the subagent to: (1) follow the templates in `reference/scaffold.md` — the
authoritative contract — using an **English** domain name (translate PT terms: `orders`,
not `pedidos`); (2) import `api` from `@/core/api` and `queryKeys` from
`@/shared/lib/query-keys`; (3) register the new group in `src/shared/lib/query-keys.ts`
(never inline); (4) if `src/features/tasks/` exists, use it as a concrete example, but the
reference is authoritative — never require `tasks/`. When done, run
`pnpm typecheck && pnpm lint && pnpm test:run` and report the real output.

## See also

- `.claude/rules/features.md` — feature folder contract and hook naming
- `.claude/rules/data-fetching.md` — `endpoints.ts` / `client.ts` / React Query patterns
- `.claude/rules/testing.md` — Vitest + MSW test infrastructure and the hook test pattern
- `.claude/rules/components.md` — `@funcef-componentes/react` v2 and React 19 notes
- `reference/scaffold.md` — the authoritative file contract + templates
- `src/features/tasks/**` — a concrete example if present (a disposable demo)
