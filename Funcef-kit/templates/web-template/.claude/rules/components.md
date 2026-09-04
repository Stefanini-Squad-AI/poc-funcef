---
paths:
  - 'src/**/*.tsx'
---

<!-- Loads when Claude touches any TSX file. Architecture: architecture.md. -->

# Components

## Where components live

| Location                                   | Use when                                                   |
| ------------------------------------------ | ---------------------------------------------------------- |
| `src/shared/ui/<name>/`                    | Generic, reusable across multiple features                 |
| `src/app/<route>/_components/<name>/`      | Specific to one route; not exported outside `_components/` |
| `src/features/<domain>/components/<name>/` | Domain UI for one feature; consumed via the feature barrel |

## lib v2 — `@funcef-componentes/react`

Always prefer `@funcef-componentes/react` v2 over custom implementations or third-party alternatives.

**v2 API differences from Radix / shadcn (IMPORTANT):**

- Use `render` prop for polymorphism — **NOT `asChild`**:

  ```tsx
  // ✅ lib v2
  <Button render={<a href="/path" />}>Link button</Button>

  // ❌ wrong — asChild is not available in v2
  <Button asChild><a href="/path">Link button</a></Button>
  ```

> ✅ `<Component render={<a href="/x" />}>…</Component>` · `data-state` · `<LoadingFuncef />`.
> ❌ `asChild`, ❌ `data-[state]`, ❌ `React.forwardRef` (React 19 passes `ref` as a prop).

- Components emit **`data-state`** attribute (not `data-[state]` selector syntax).
- Loading indicator is **`LoadingFuncef`** — import from `@funcef-componentes/react`.

**API/props/usage examples for any lib component:** run
`pnpm dlx @funcef-componentes/cli ds component <Name>` — queries the published
design-system manifest (details in the `funcef-lib` skill).

## React 19 notes

- No `React.forwardRef` for new components — React 19 passes `ref` as a prop directly.
- No `React.FC` type annotation — just type props explicitly.

## Patterns

- `shared/ui` components: one component per file, kebab-case file, PascalCase export, `index.ts` barrel.
- `_components`: underscore prefix, local scope, not exported from the feature barrel.
- Feature components: consumed only through the feature's `index.ts` barrel.

## See also

- `architecture.md` (naming, layers)
- `code-style.md` (TS, imports)
