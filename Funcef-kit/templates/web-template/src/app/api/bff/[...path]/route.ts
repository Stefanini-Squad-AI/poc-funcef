import { createBffHandler } from '@funcef-componentes/auth/server';
import { env } from '@/shared/config/env';
import { auth } from '@/core/auth';

/**
 * BFF same-origin: o browser chama `/api/bff/*` e ESTE handler resolve o access
 * token Microsoft no servidor (sessão httpOnly) antes de repassar ao backend
 * (`env.API_URL`) — o Bearer nunca chega ao JavaScript do browser. Sem sessão
 * → 401, que no cliente dispara o fluxo padrão `AUTH_ERROR_EVENT → teardown`.
 */
export const { GET, POST, PUT, PATCH, DELETE } = createBffHandler(auth, {
  upstreamUrl: env.API_URL,
  providerId: 'microsoft',
});
