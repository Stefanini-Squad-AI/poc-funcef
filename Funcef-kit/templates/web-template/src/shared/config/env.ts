import 'server-only';

import { parseEnv } from '@funcef-componentes/react/env';
import { z } from 'zod';

const envSchema = z.object({
  APP_URL: z
    .url('NEXT_PUBLIC_APP_URL deve ser uma URL válida')
    .default('http://localhost:3000'),

  API_URL: z.url('API_URL deve ser uma URL válida'),

  BASE_PATH: z.string().default(''),

  MICROSOFT_CLIENT_ID: z.string().min(1, 'MICROSOFT_CLIENT_ID é obrigatório'),

  /**
   * Secret do app registration (modo secret). OPCIONAL: ausente → a auth roda
   * em modo federated (client assertion via managed identity / credencial
   * Azure local) — ver `federatedClientAssertion` em core/auth.
   */
  MICROSOFT_CLIENT_SECRET: z.string().optional(),

  /**
   * clientId da user-assigned managed identity do Web App (modo federated).
   * Omitir → system-assigned. Ignorada em modo secret e no teste local.
   */
  AZURE_MANAGED_IDENTITY_CLIENT_ID: z.string().optional(),

  /**
   * Modo certificado (private_key_jwt): caminhos dos PEMs. Presentes (e sem
   * MICROSOFT_CLIENT_SECRET) → a app assina a client assertion localmente.
   * Caminho oficial para rodar sem secret FORA do Azure.
   */
  MICROSOFT_CLIENT_CERT_PATH: z.string().optional(),
  MICROSOFT_CLIENT_KEY_PATH: z.string().optional(),

  TENANT_ID: z.string().min(1, 'TENANT_ID é obrigatório'),

  AUDIENCE_API: z.string().min(1, 'AUDIENCE_API é obrigatório'),

  BETTER_AUTH_SECRET: z.string().min(1, 'BETTER_AUTH_SECRET é obrigatório'),

  REDIS_URL: z.string().optional(),

  COOKIE_MAX_AGE: z.coerce.number().default(5 * 60),

  /**
   * Domínio dos cookies de sessão ao expirá-los (ex.: `.funcef.com.br`).
   * Opcional — sem ele, só o domínio host implícito.
   */
  COOKIE_DOMAIN: z.string().optional(),

  NODE_ENV: z
    .enum(['development', 'production', 'test'])
    .default('development'),
});

export type Env = z.infer<typeof envSchema>;

// Durante `next build` os secrets de servidor podem faltar no CI — o parseEnv
// da lib aplica os buildFallbacks SÓ nessa fase; em runtime a validação
// estrita permanece.
export const env: Env = parseEnv(
  envSchema,
  {
    APP_URL: process.env.NEXT_PUBLIC_APP_URL,
    API_URL: process.env.API_URL,
    BASE_PATH: process.env.NEXT_PUBLIC_BASE_PATH,
    MICROSOFT_CLIENT_ID: process.env.MICROSOFT_CLIENT_ID,
    MICROSOFT_CLIENT_SECRET: process.env.MICROSOFT_CLIENT_SECRET,
    AZURE_MANAGED_IDENTITY_CLIENT_ID:
      process.env.AZURE_MANAGED_IDENTITY_CLIENT_ID,
    MICROSOFT_CLIENT_CERT_PATH: process.env.MICROSOFT_CLIENT_CERT_PATH,
    MICROSOFT_CLIENT_KEY_PATH: process.env.MICROSOFT_CLIENT_KEY_PATH,
    TENANT_ID: process.env.TENANT_ID,
    AUDIENCE_API: process.env.AUDIENCE_API,
    BETTER_AUTH_SECRET: process.env.BETTER_AUTH_SECRET,
    REDIS_URL: process.env.REDIS_URL,
    COOKIE_MAX_AGE: process.env.COOKIE_MAX_AGE,
    COOKIE_DOMAIN: process.env.COOKIE_DOMAIN,
    NODE_ENV: process.env.NODE_ENV,
  },
  {
    hint:
      '💡 Copie o arquivo .env.example para .env.local e preencha os valores:\n' +
      '   cp .env.example .env.local',
    varNames: {
      APP_URL: 'NEXT_PUBLIC_APP_URL',
      BASE_PATH: 'NEXT_PUBLIC_BASE_PATH',
    },
    buildFallbacks: {
      API_URL: 'http://localhost:3000',
      MICROSOFT_CLIENT_ID: 'build-placeholder',
      // MICROSOFT_CLIENT_SECRET saiu dos fallbacks: agora é opcional (modo
      // federated) — no build sem secret a factory monta o modo assertion
      // inerte (nenhum token é pedido durante o build).
      TENANT_ID: 'build-placeholder',
      AUDIENCE_API: 'build-placeholder',
      BETTER_AUTH_SECRET: 'build-placeholder',
    },
  }
);
