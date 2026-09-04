---
name: funcef-lib
description: Queries the published catalog of @funcef-componentes/react (design system manifest) - import, usage examples (stories), and API for components, hooks, PDF module, and utilities. Use before writing TSX with a lib component whose API you don't know.
user-invocable: false
---

# funcef-lib — published design system manifest

Source of truth for the API of `@funcef-componentes/react` components:
the manifest published at `https://designsystem.funcef.com.br/manifests/components.json`
(~600 KB, 97 entries — components, hooks, PDF module, utilities).

**Never download/load the whole manifest into context.** Query it via the CLI:

```bash
pnpm dlx @funcef-componentes/cli ds component              # lists id + name of every entry
pnpm dlx @funcef-componentes/cli ds component Checkbox     # prints the component's entry (small JSON)
pnpm dlx @funcef-componentes/cli ds component <termo> --fresh  # skips the 24h cache and re-downloads
```

The term matches by `name` or `id` (case-insensitive; exact wins, otherwise substring).
An ambiguous term lists the candidates. Cache local por máquina (LOCALAPPDATA/funcef-cli);
without FUNCEF network access the CLI falls back to the expired cache with a warning.

## What each entry contains

| Field       | Use                                                                 |
| ----------- | ------------------------------------------------------------------- |
| `import`    | ready-to-use import line (present in 81/97 entries)                 |
| `stories[]` | `snippet` (real JSX) + `description`/`summary` in Portuguese — canonical usage examples |
| `jsDocTags` | additional metadata                                                  |
| `error`     | props docgen failure — today present in ALL entries                 |

Today the manifest **does not carry typed props** (`react-docgen-typescript` failed on
every entry): the usage reference is the `stories` and the `import`. If docgen
is fixed upstream in the design system, typed props will start appearing in entries.

## What the manifest does NOT replace

The lib v2 API conventions remain in `.claude/rules/components.md` and always
apply: `render` instead of `asChild`, `data-state` attribute, `LoadingFuncef`,
no `React.forwardRef` (React 19).
