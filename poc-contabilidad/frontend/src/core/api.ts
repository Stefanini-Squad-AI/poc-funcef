import { createApi } from '@funcef-componentes/auth/http';
import { envClient } from '@/shared/config/env-client';

/**
 * Fachada HTTP do backend .NET — envelope FUNCEF normalizado
 * (`resultado` → `data`), erro carimbado (retry/toast) e
 * `401 → AUTH_ERROR_EVENT → teardown`.
 *
 * Como o POC ainda não tem BFF/auth, aponta direto para a API .NET
 * (CORS habilitado no Program.cs). Quando integrar auth, trocar para
 * BFF same-origin (`/api/bff/*`).
 */
export const api = createApi({
  baseURL: envClient.NEXT_PUBLIC_API_URL,
});
