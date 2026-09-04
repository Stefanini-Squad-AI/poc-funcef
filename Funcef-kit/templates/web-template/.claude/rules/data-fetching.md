---
paths:
  - 'src/features/**'
  - 'src/app/**'
---

<!-- The data layer. Loads when Claude touches features or routes. Feature contract: features.md. -->

# Data fetching

## The data layer (`api/`)

- `endpoints.ts` — pure builders: return URLs/configs, no HTTP, no React. Path literals
  mirror the **backend contract** and may be Portuguese (e.g. `/produtos`) — don't translate them.
- `client.ts` — typed HTTP calls using the **`api`** instance from `@/core/api`
  (`createApi` from `@funcef-componentes/auth`, with the FUNCEF envelope and
  stamped errors built in). Never instantiate `fetch` ad hoc in a feature or component.
- Backend response normalization (envelopes, casing) happens **inside** the lib's
  `createApi` — never re-implemented per feature.

```typescript
// features/<domain>/api/client.ts
import { api } from '@/core/api';
import { endpoints } from './endpoints';
import type { Task, CreateTaskData } from '../types';

export const tasksApi = {
  getAll: () => api.get<Task[]>(endpoints.list()),
  create: (data: CreateTaskData) =>
    api.post<Task, CreateTaskData>(endpoints.create(), data),
};
```

> `api.get<T>(…)` / `api.post<T, B>(…)` resolve to an **`ApiResponse<T>`** — the lib
> normalizes the backend envelope once, so the payload sits on **`.data`**. Hooks read
> `query.data?.data` (use `?? null` when returning a list).

## React Query is the default for server state

Client-side server data is fetched with React Query — never `useEffect` + `useState`
(that loses caching, dedup, retry, and background refetch).

> ✅ `import { api } from '@/core/api'` and `api.get<T>(endpoints.list())` inside `client.ts`.
> ❌ `import axios`, ❌ `fetch(...)` in a hook/component, ❌ instantiating an ad-hoc HTTP client.

- **GET** → `useQuery` or `useSuspenseQuery`.
- **POST / PUT / DELETE** → `useMutation`, invalidating the affected query keys on success.
- Query keys are descriptive and stable, via the `queryKeys` factory in
  `@/shared/lib`: `queryKeys.tasks.all`, `queryKeys.tasks.list()`.
- **Hook return shape**: query hooks return a named object
  (`{ <domain>: data?.data ?? null, is<Entity>Loading, error }`); mutation hooks return the
  **raw `useMutation` result** (`mutate` / `mutateAsync` / `isPending` / `isError`), with
  `meta: { globalErrorToast: true }` so failures route to the global toast.

### `useSuspenseQuery` vs `useQuery`

| Use `useSuspenseQuery` when…                       | Use `useQuery` when…                                |
| -------------------------------------------------- | --------------------------------------------------- |
| Data is a prerequisite to render the component     | Data is optional / conditional (`enabled`)          |
| A Suspense boundary or `loading.tsx` exists for it | You need inline `isLoading` / `isFetching` feedback |

A `useSuspenseQuery` **requires** a `<Suspense fallback={…}>` boundary or a route
`loading.tsx`. Never a `<Suspense>` without a fallback.

## Caching defaults (from `core/config/query-client.config.ts`)

- `staleTime: 1000 * 60 * 3` — 3 minutes
- `gcTime: 1000 * 60 * 6` — 6 minutes
- `retry`: selective — retries only retryable errors (`isRetryable`), max 2 attempts; mutations never retry
- `retryDelay`: exponential — `Math.min(1000 * 2^attempt, 8000)` (max 8 s)
- `refetchOnWindowFocus: false`
- `refetchOnReconnect: true`

Override per-query only when the use-case demands it (e.g. `staleTime: 0` for volatile data).

## Server-side fetching

Server Components fetch by calling **functions exported by the feature's `api/`**, never
the shared HTTP client directly. The page passes results down as props (see `routing.md`).

## See also

- `features.md` — feature folder contract and hook naming
- `routing.md` — how pages trigger server-side fetches
