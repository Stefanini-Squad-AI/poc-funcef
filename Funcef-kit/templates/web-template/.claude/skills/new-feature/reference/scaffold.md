# new-feature — the feature contract

This file is the **authoritative contract** the scaffold follows. If
`src/features/tasks/` exists it is a helpful concrete example, but it is a
disposable demo — never depend on it; this file is the source of truth.

## Contents
- Golden rule
- Naming conventions
- File set
- Templates (endpoints, client, types, hooks, barrel, tests)
- Registering the queryKeys group
- ApiResponse envelope (.data)
- Aggregator case (HTTP = "none")

## Golden rule
Generate the minimum file set the request needs — nothing speculative. Domain
names are **English**: translate the user's term (`orders`, not `pedidos`;
`users`, not `usuarios`). `api` comes only from `@/core/api`; query keys come
from the central factory; there is **no `service.ts`**.

## Naming conventions
| Context | Convention | Example |
| --- | --- | --- |
| Domain/folder/file | kebab-case, English | `orders/`, `use-orders-query.ts` |
| Type | PascalCase | `Order`, `CreateOrderData` |
| Query hook | `useAll<Entity>` / `use<Entity>ById` | `useAllOrders` |
| Mutation hook | `use<Action><Entity>` | `useCreateOrder` |
| API object | `<domain>Api` | `ordersApi` |
| Query keys | group in the central factory | `queryKeys.orders.list()` |

## File set
A standard feature with HTTP always has: `api/endpoints.ts`, `api/client.ts`,
`api/index.ts`, `types.ts`, `index.ts`. Add `hooks/use-<domain>-query.ts` (GET),
`hooks/use-<domain>-mutation.ts` (POST/PUT/DELETE), and one
`hooks/__tests__/*.test.tsx` per hook. There is **no `hooks/index.ts`** barrel —
consumers import hook files directly. Add `validators.ts` only when there is a form.

## Templates
Placeholders: `<domain>` kebab (`orders`), `<Entity>` PascalCase (`Order`),
`<entity>` camel (`order`), `<ENTITY>` SCREAMING for mock constants. Backend
endpoint paths keep the backend's contract (they may be Portuguese, e.g.
`/pedidos`), but everything in code is English.

### `api/endpoints.ts` — pure builders (no HTTP, no React)
```ts
export const endpoints = {
  list: () => '/<route>',
  detail: (id: string | number) => `/<route>/${id}`,
  create: () => '/<route>',
  // add only the operations the feature needs
};
```

### `api/client.ts` — typed calls via the shared `api` (object, not a class)
```ts
import { api } from '@/core/api';
import { endpoints } from './endpoints';
import type { <Entity>, Create<Entity>Data } from '../types';

export const <domain>Api = {
  getAll: () => api.get<<Entity>[]>(endpoints.list()),
  create: (data: Create<Entity>Data) =>
    api.post<<Entity>, Create<Entity>Data>(endpoints.create(), data),
};
```
> `api.get<T>(…)` resolves to `ApiResponse<T>`; the payload is on `.data`.

### `api/index.ts`
```ts
export { <domain>Api } from './client';
export { endpoints } from './endpoints';
```

### `types.ts`
```ts
export type <Entity> = {
  id: number;
  // remaining fields — keep the exact backend field names
};

export type Create<Entity>Data = Omit<<Entity>, 'id'>;
```

### `hooks/use-<domain>-query.ts` (GET)
```ts
'use client';

import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { <domain>Api } from '../api';

export const useAll<Entity> = () => {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.<domain>.list(),
    queryFn: () => <domain>Api.getAll(),
  });

  return { <domain>: data?.data ?? null, is<Entity>Loading: isLoading, error };
};
```

### `hooks/use-<domain>-mutation.ts` (POST/PUT/DELETE)
```ts
'use client';

import { useMutation, useQueryClient } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { <domain>Api } from '../api';
import type { Create<Entity>Data } from '../types';

export const useCreate<Entity> = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (data: Create<Entity>Data) => <domain>Api.create(data),
    onSuccess: () =>
      queryClient.invalidateQueries({ queryKey: queryKeys.<domain>.all }),
  });
};
```

### `index.ts` — public barrel (only what pages consume)
```ts
export * from './types';
export * from './api';
export * from './hooks';
// export * from './validators'; // only when the feature has forms
```

### `hooks/__tests__/use-<domain>-query.test.tsx` (Vitest + MSW)
```tsx
import { http } from 'msw';
import { describe, it, expect, vi } from 'vitest';
import { waitFor } from '@testing-library/react';
import { server } from '@/__tests__/msw/server';
import { jsonOk, errorStatus } from '@/__tests__/msw/handlers';
import { renderHookWithProviders } from '@/__tests__/render';
import { useAll<Entity> } from '../use-<domain>-query';
import type { <Entity> } from '../../types';

// Full BA token is best-effort; mock it unconditionally so tests never hit the network.
vi.mock('@/core/auth/client', () => ({ getMicrosoftAccessToken: async () => null }));

const <ENTITY>_MOCK: <Entity>[] = [{ id: 1 /* obviously fake fields */ }];
const ENDPOINT_URL = 'http://localhost:3000/<route>';

describe('useAll<Entity>', () => {
  it('returns the list on success (200)', async () => {
    server.use(http.get(ENDPOINT_URL, () => jsonOk(<ENTITY>_MOCK)));
    const { result } = renderHookWithProviders(() => useAll<Entity>());
    await waitFor(() => expect(result.current.is<Entity>Loading).toBe(false));
    expect(result.current.<domain>).toHaveLength(1);
  });

  it('sets the error state on 5xx', async () => {
    server.use(http.get(ENDPOINT_URL, () => errorStatus(500)));
    const { result } = renderHookWithProviders(() => useAll<Entity>());
    await waitFor(() => expect(result.current.error).not.toBeNull());
  });
});
```
For mutation tests, drive `result.current.mutateAsync` inside `act`, use
`errorStatus(500)` for the failure case, and the same
`vi.mock('@/core/auth/client', …)` block.

## Registering the queryKeys group
Every feature with HTTP registers a group in `src/shared/lib/query-keys.ts` (never inline):
```ts
<domain>: {
  all: ['<domain>'] as const,
  list: () => [...queryKeys.<domain>.all, 'list'] as const,
  detail: (id: string | number) => [...queryKeys.<domain>.all, 'detail', id] as const,
},
```

## ApiResponse envelope
`api.get<T>(…)` resolves to `ApiResponse<T>`; the payload is on `.data`. Hooks read
`data?.data` (`?? null` when the hook returns a list).

## Aggregator case (HTTP = "none")
No `api/`, no `hooks/`, no `types.ts`, no new `queryKeys` group. Just
`components/<name>/` + `index.ts` re-exporting the sub-features.
