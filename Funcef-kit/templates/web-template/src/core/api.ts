import { createApi } from '@funcef-componentes/auth/http';
import { envClient } from '@/shared/config/env-client';

/**
 * Fachada HTTP do backend principal via BFF same-origin (`/api/bff/*`): o
 * Bearer é resolvido NO SERVIDOR pelo route handler (createBffHandler) — sem
 * `getToken`, o token nunca existe no browser. Envelope FUNCEF normalizado,
 * erro carimbado (retry/toast) e `401 → AUTH_ERROR_EVENT → teardown`.
 * Vive em `core` (não `shared/lib`) pois conhece a topologia de auth;
 * `features` importam daqui. baseURL absoluta por contrato do createApi.
 */
export const api = createApi({
  baseURL: `${envClient.APP_URL}${envClient.BASE_PATH}/api/bff`,
});
