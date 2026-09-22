import { parseEnv } from '@funcef-componentes/react/env';
import { z } from 'zod';

const envClientSchema = z.object({
  NEXT_PUBLIC_API_URL: z
    .url('NEXT_PUBLIC_API_URL deve ser uma URL válida')
    .default('http://localhost:5000'),

  NEXT_PUBLIC_APP_URL: z
    .url('NEXT_PUBLIC_APP_URL deve ser uma URL válida')
    .default('http://localhost:3000'),

  // Injetada pelo next.config.ts a partir do package.json (não vem de .env).
  NEXT_PUBLIC_APP_VERSION: z.string().optional(),
});

export type EnvClient = z.infer<typeof envClientSchema>;

export const envClient: EnvClient = parseEnv(
  envClientSchema,
  {
    NEXT_PUBLIC_API_URL: process.env.NEXT_PUBLIC_API_URL,
    NEXT_PUBLIC_APP_URL: process.env.NEXT_PUBLIC_APP_URL,
    NEXT_PUBLIC_APP_VERSION: process.env.NEXT_PUBLIC_APP_VERSION,
  },
  {
    header: '❌ Variáveis de ambiente (client) inválidas:',
    varNames: {
      NEXT_PUBLIC_API_URL: 'NEXT_PUBLIC_API_URL',
      NEXT_PUBLIC_APP_URL: 'NEXT_PUBLIC_APP_URL',
      NEXT_PUBLIC_APP_VERSION: 'NEXT_PUBLIC_APP_VERSION',
    },
  },
);
