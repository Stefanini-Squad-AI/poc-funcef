import { createSessionProxy } from '@funcef-componentes/auth/proxy';
import { DEFAULT_SESSION_COOKIE_NAMES } from '@funcef-componentes/auth';
import { SIGNOUT_MARKER_COOKIE } from '@/core/auth/constants';
import { env } from '@/shared/config/env';

/**
 * Rotas acessíveis sem autenticação. CONFIGURÁVEL — adicione/remova rotas aqui.
 * O matcher abaixo cuida de assets/_next/api; estas são páginas públicas.
 */
const PUBLIC_ROUTES = ['/sign-in'];

/**
 * Guard binário de sessão (presença-de-cookie) do pacote: anônimo em rota
 * protegida → /sign-in; autenticado em rota pública → home (exceto durante o
 * logout, pelo marcador anti-loop). NÃO é fronteira de segurança — a fronteira
 * real é a DAL (`getServerSession` no layout autenticado) + backend a cada
 * request + 401 → teardown.
 *
 * `requireStaleMarker` fica DESLIGADO de propósito: o fluxo legítimo do
 * `?stale=1` parte do layout autenticado (RSC não escreve cookie, logo não há
 * marcador nesse caminho) — ligar a opção desativaria a deleção órfã
 * silenciosamente. Trade-off aceito: um link cross-site `?stale=1` pode apagar
 * cookies de sessão (logout forçado — incômodo, não é bypass de auth).
 */
export const proxy = createSessionProxy({
  publicRoutes: PUBLIC_ROUTES,
  sessionCookieNames: [...DEFAULT_SESSION_COOKIE_NAMES],
  signInPath: '/sign-in',
  signOutMarkerCookie: SIGNOUT_MARKER_COOKIE,
  // Mesmo domínio dos cookies da factory (core/auth) — deleção órfã em prod.
  cookieDomain: env.NODE_ENV === 'production' ? env.COOKIE_DOMAIN : undefined,
});

export const config = {
  matcher: [
    `/((?!api/|_next/|.well-known/|.*\\.(?:png|jpg|jpeg|gif|svg|ico|webp|css|js)$).*)`,
  ],
};
