'use client';

import { createAuthClient } from 'better-auth/react';
import { envClient } from '@/shared/config/env-client';

export const authClient = createAuthClient({
  baseURL: `${envClient.APP_URL}${envClient.BASE_PATH}/api/auth`,
  fetchOptions: {
    credentials: 'include',
  },
  sessionOptions: {
    refetchInterval: 5 * 60 * 1000,
  },
});
