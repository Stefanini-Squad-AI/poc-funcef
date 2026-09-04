import {
  QueryClient,
  QueryCache,
  MutationCache,
  environmentManager,
  type Mutation,
} from '@tanstack/react-query';
import { toast } from '@funcef-componentes/react';
import { getToastMessage, isRetryable } from '@funcef-componentes/auth/http';

declare module '@tanstack/react-query' {
  interface Register {
    mutationMeta: { globalErrorToast?: boolean };
  }
}

/** Exibe o toast carimbado no erro pelo http-client da lib (`stampApiError`), ou nada se null. */
export function showErrorToast(error: unknown) {
  const message = getToastMessage(error);
  if (message) toast.error(message);
}

/** Toast automático de mutation só para quem fez opt-in via meta. */
export function onMutationError(
  error: unknown,
  _variables: unknown,
  _context: unknown,
  mutation: Mutation<unknown, unknown, unknown, unknown>
) {
  if (mutation.meta?.globalErrorToast) showErrorToast(error);
}

function makeQueryClient() {
  return new QueryClient({
    queryCache: new QueryCache({
      onError: (error) => showErrorToast(error),
    }),
    mutationCache: new MutationCache({
      onError: onMutationError,
    }),
    defaultOptions: {
      queries: {
        retry: (failureCount, error) => isRetryable(error) && failureCount < 2,
        retryDelay: (attempt) => Math.min(1000 * 2 ** attempt, 8000),
        staleTime: 1000 * 60 * 3,
        gcTime: 1000 * 60 * 6,
        refetchOnReconnect: true,
        refetchOnWindowFocus: false,
      },
      mutations: {
        retry: false,
      },
    },
  });
}

let browserQueryClient: QueryClient | undefined = undefined;

export function getQueryClient() {
  if (environmentManager.isServer()) {
    return makeQueryClient();
  } else {
    if (!browserQueryClient) browserQueryClient = makeQueryClient();
    return browserQueryClient;
  }
}
