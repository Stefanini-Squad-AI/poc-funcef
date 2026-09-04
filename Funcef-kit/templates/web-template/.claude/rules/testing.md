---
paths:
  - '**/*.{test,spec}.{ts,tsx}'
  - '**/__tests__/**'
---

# Testing

**Vitest + MSW + Testing Library.** Tests live next to the code in `__tests__/`,
mirroring the source tree. Do **not** use Jest — the project uses Vitest.

## What to test

- `shared` utils / validators / formatters → pure unit tests
- hooks → behavior (loading/success/error), wrapped in `renderHookWithProviders`
- components → rendering + user interaction, not implementation details
- `api/client` → request shaping and response parsing, with MSW mocking the HTTP layer

## Test infrastructure (`src/__tests__/`)

- `render.tsx` — exports `renderWithProviders` and `renderHookWithProviders`; each wraps
  the subject in a fresh `QueryClient` (retry: false, gcTime: 0) + Suspense boundary.
- `msw/handlers.ts` — exports `jsonOk<T>(data)` (wraps in backend envelope `{ resultado }`
  so the normalizer fires) and `errorStatus(status)`.
- `msw/server.ts` — MSW Node server; started/reset/stopped in `setup.ts`.

## Hook test pattern

```typescript
import { http } from 'msw';
import { describe, it, expect } from 'vitest';
import { waitFor } from '@testing-library/react';
import { server } from '@/__tests__/msw/server';
import { jsonOk } from '@/__tests__/msw/handlers';
import { renderHookWithProviders } from '@/__tests__/render';
import { useAllTasks } from '../use-tasks-query';
import type { Task } from '../../types';

const MOCK_DATA: Task[] = [{ id: 1, title: 'Primeira', done: false }];

describe('useAllTasks', () => {
  it('returns list on success', async () => {
    server.use(
      http.get('http://localhost:3000/tasks', () => jsonOk(MOCK_DATA))
    );
    const { result } = renderHookWithProviders(() => useAllTasks());
    await waitFor(() => expect(result.current.isTasksLoading).toBe(false));
    expect(result.current.tasks).toHaveLength(1);
  });
});
```

Mutation hooks return the raw `useMutation` result — drive `mutateAsync` inside `act`:

```typescript
import { act, waitFor } from '@testing-library/react';
// same server / renderHookWithProviders / jsonOk / errorStatus / vi.mock imports as above

it('creates on success', async () => {
  server.use(http.post('http://localhost:3000/tasks', () => jsonOk(null)));
  const { result } = renderHookWithProviders(() => useCreateTask());
  await act(async () => {
    await result.current.mutateAsync({ title: 'Nova' });
  });
  await waitFor(() => expect(result.current.isSuccess).toBe(true));
});
```

For the failure case, respond with `errorStatus(500)`, wrap `mutateAsync` in try/catch,
and assert `result.current.isError`.

MSW handlers live in `src/__tests__/msw/` (`handlers.ts` + `server.ts`) — they
mock HTTP in tests. The DEV mock is separate (`json-server`, `mocks/db.json`).

## Rules

- Test behavior, not implementation. Prefer querying by role/text over test-ids.
- No real network — MSW mocks HTTP. Sample data must be obviously fake.
- Token in tests (Full BA): hook tests mock `@/core/auth/client`
  unconditionally (`getMicrosoftAccessToken: async () => null`). With no better-auth
  responding in tests the request goes out without `Authorization` and MSW intercepts
  normally, so this mock keeps token resolution from touching the network. (See
  `use-tasks-query.test.tsx` for the pattern, if that example is still present.)
- Add/update tests when behavior changes; create only the test files the change needs.

## See also

- `data-fetching.md`, `features.md`
