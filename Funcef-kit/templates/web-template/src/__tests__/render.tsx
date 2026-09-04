import { ReactNode, Suspense } from 'react';
import {
  render,
  renderHook,
  type RenderHookOptions,
} from '@testing-library/react';
import {
  QueryClient,
  QueryClientProvider,
  QueryCache,
  MutationCache,
} from '@tanstack/react-query';
import {
  showErrorToast,
  onMutationError,
} from '@/core/config/query-client.config';

/** QueryClient isolado por teste, espelhando `query-client.config`:
 *  mesmos handlers de toast/erro, sem retry e sem cache (gcTime: 0). */
export function makeTestQueryClient() {
  return new QueryClient({
    queryCache: new QueryCache({
      onError: (error) => showErrorToast(error),
    }),
    mutationCache: new MutationCache({
      onError: onMutationError,
    }),
    defaultOptions: {
      queries: {
        retry: false,
        gcTime: 0,
      },
      mutations: { retry: false },
    },
  });
}

function Providers({
  children,
  client,
}: {
  children: ReactNode;
  client: QueryClient;
}) {
  return (
    <QueryClientProvider client={client}>
      <Suspense fallback={<div data-testid="suspense-fallback">loading</div>}>
        {children}
      </Suspense>
    </QueryClientProvider>
  );
}

interface Options {
  client?: QueryClient;
}

/** Sem consumidor no exemplo mínimo (que só testa hooks) — infra de teste
 *  para testes de componente, documentada em `.claude/rules/testing.md`. */
export function renderWithProviders(ui: ReactNode, { client }: Options = {}) {
  const queryClient = client ?? makeTestQueryClient();
  return {
    client: queryClient,
    ...render(<Providers client={queryClient}>{ui}</Providers>),
  };
}

export function renderHookWithProviders<Result, Props>(
  callback: (props: Props) => Result,
  { client, ...options }: Options & RenderHookOptions<Props> = {}
) {
  const queryClient = client ?? makeTestQueryClient();
  return {
    client: queryClient,
    ...renderHook(callback, {
      wrapper: ({ children }) => (
        <Providers client={queryClient}>{children}</Providers>
      ),
      ...options,
    }),
  };
}
