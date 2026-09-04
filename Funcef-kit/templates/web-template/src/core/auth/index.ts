import 'server-only';

import { env } from '@/shared/config/env';
import { DefaultAzureCredential } from '@azure/identity';
import { azureClientAssertion } from '@funcef-componentes/auth/azure';
import {
  certificateClientAssertion,
  createFuncefAuth,
  createGetServerSession,
  normalizeRedisConnection,
  redisStorage,
  type MicrosoftClientAssertion,
} from '@funcef-componentes/auth/server';
import { Redis } from 'ioredis';
import { readFileSync } from 'node:fs';

const isProd = env.NODE_ENV === 'production';
const REDIS_OPTIONS = { maxRetriesPerRequest: 3, lazyConnect: true };
const globalForRedis = globalThis as unknown as { redisClient?: Redis };

function createRedis(url: string): Redis {
  const conn = normalizeRedisConnection(url);
  return typeof conn === 'string'
    ? new Redis(conn, REDIS_OPTIONS)
    : new Redis({ ...conn, ...REDIS_OPTIONS });
}

const redis: Redis | null = env.REDIS_URL
  ? (globalForRedis.redisClient ??= createRedis(env.REDIS_URL))
  : null;

/** Exatamente uma, em cascata: secret → certificado → federated. */
function clientCredential() {
  if (env.MICROSOFT_CLIENT_SECRET)
    return { clientSecret: env.MICROSOFT_CLIENT_SECRET };

  let clientAssertion: MicrosoftClientAssertion;

  if (env.MICROSOFT_CLIENT_CERT_PATH && env.MICROSOFT_CLIENT_KEY_PATH)
    clientAssertion = certificateClientAssertion({
      certificatePem: readFileSync(env.MICROSOFT_CLIENT_CERT_PATH, 'utf8'),
      privateKeyPem: readFileSync(env.MICROSOFT_CLIENT_KEY_PATH, 'utf8'),
    });
  else if (isProd)
    clientAssertion = azureClientAssertion(
      env.AZURE_MANAGED_IDENTITY_CLIENT_ID
        ? { managedIdentityClientId: env.AZURE_MANAGED_IDENTITY_CLIENT_ID }
        : undefined
    );
  else
    clientAssertion = azureClientAssertion({
      credential: new DefaultAzureCredential(),
    });

  return { clientAssertion };
}

export const auth = createFuncefAuth({
  secret: env.BETTER_AUTH_SECRET,
  baseURL: env.APP_URL,
  basePath: env.BASE_PATH,
  microsoft: {
    clientId: env.MICROSOFT_CLIENT_ID,
    ...clientCredential(),
    tenantId: env.TENANT_ID,
    audience: env.AUDIENCE_API,
    profilePhoto: true,
  },
  ...(redis && {
    secondaryStorage: redisStorage({
      client: redis,
      keyPrefix: 'funcef-auth:',
    }),
  }),
  cookieDomain: isProd ? env.COOKIE_DOMAIN : undefined,
  secureCookies: isProd,
  trustedOrigins: ['https://*.funcef.com.br'],
  cookieCacheMaxAge: env.COOKIE_MAX_AGE,
  errorRedirectPath: '/sign-in',
});

export const getServerSession = createGetServerSession(auth);
