/**
 * Marcador transitório (não-httpOnly) setado pelo teardown ao deslogar/expirar.
 * Enquanto presente, o proxy (src/proxy.ts) não rebate a rota de login para "/",
 * evitando loop até os cookies de sessão serem apagados. Sem diretivas pois é
 * compartilhado entre proxy (servidor) e teardown (client).
 */
export const SIGNOUT_MARKER_COOKIE = 'app_signout';

/** Validade (segundos) do marcador anti-loop — curta de propósito. */
export const SIGNOUT_MARKER_MAX_AGE = 10;
