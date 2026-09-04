import { createEntraSignInRoute } from '@funcef-componentes/auth/server';
import { env } from '@/shared/config/env';
import { auth } from '@/core/auth';

/**
 * Sign-in Entra pela lib: sessão válida → home; `?error=` sanitizado com 1
 * retry automático (freio por cookie); allowlist do destino externo; falha ao
 * iniciar o OAuth → página de erro do BA (sem 500 cru). Route Handler
 * server-only — o `nextCookies()` da factory grava o state do OAuth aqui.
 */
export const { GET } = createEntraSignInRoute(auth, {
  basePath: env.BASE_PATH,
  signInPath: '/sign-in',
});
