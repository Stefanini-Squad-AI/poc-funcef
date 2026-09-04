'use client';

import { createSessionTeardown as createLibSessionTeardown } from '@funcef-componentes/auth/http';
import type { QueryClient } from '@tanstack/react-query';
import { createLogger } from '@funcef-componentes/react/utils';
import { envClient } from '@/shared/config/env-client';
import { authClient } from './client';
import { SIGNOUT_MARKER_COOKIE, SIGNOUT_MARKER_MAX_AGE } from './constants';

const logger = createLogger({
  service: 'session-teardown',
  disabled: process.env.NODE_ENV === 'production',
});

interface CreateSessionTeardownOptions {
  queryClient: QueryClient;
}

/**
 * Teardown de sessão sobre `createSessionTeardown` do pacote — o runner é
 * guardado (anti-reentrância) pois 401 global, idle-logout e logout manual
 * disparam o mesmo encerramento. `clearClientState` cobre só o cache do React
 * Query; estado adicional (ex. zustand, se adotado) fica por conta do projeto.
 */
export function createSessionTeardown({
  queryClient,
}: CreateSessionTeardownOptions): () => Promise<void> {
  return createLibSessionTeardown({
    signOutRemote: () => authClient.signOut(),
    clearServerCookies: async () => {}, // no-op: signOutRemote já expira os cookies httpOnly
    clearClientState: () => {
      queryClient.clear();
    },
    redirect: () => {
      document.cookie = `${SIGNOUT_MARKER_COOKIE}=1; path=/; max-age=${SIGNOUT_MARKER_MAX_AGE}; samesite=lax`;
      window.location.href = `${envClient.BASE_PATH}/sign-in`;
    },
    logger,
  });
}
