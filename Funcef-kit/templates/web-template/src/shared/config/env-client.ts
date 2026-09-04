import { parseEnv } from '@funcef-componentes/react/env';
import { z } from 'zod';

const envClientSchema = z.object({
  APP_URL: z
    .url('NEXT_PUBLIC_APP_URL deve ser uma URL válida')
    .default('http://localhost:3000'),

  // Injetada pelo next.config.ts a partir do package.json (não vem de .env).
  APP_VERSION: z.string().optional(),

  BASE_PATH: z.string().default(''),
});

export type EnvClient = z.infer<typeof envClientSchema>;

export const envClient: EnvClient = parseEnv(
  envClientSchema,
  {
    APP_URL: process.env.NEXT_PUBLIC_APP_URL,
    APP_VERSION: process.env.NEXT_PUBLIC_APP_VERSION,
    BASE_PATH: process.env.NEXT_PUBLIC_BASE_PATH,
  },
  {
    header: '❌ Variáveis de ambiente (client) inválidas:',
    varNames: {
      APP_URL: 'NEXT_PUBLIC_APP_URL',
      APP_VERSION: 'NEXT_PUBLIC_APP_VERSION',
      BASE_PATH: 'NEXT_PUBLIC_BASE_PATH',
    },
  }
);
