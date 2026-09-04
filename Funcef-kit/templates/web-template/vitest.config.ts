import { defineConfig } from 'vitest/config';
import path from 'path';

export default defineConfig({
  test: {
    globals: true,
    environment: 'jsdom',
    environmentOptions: { jsdom: { url: 'http://localhost:3000' } },
    setupFiles: ['./src/__tests__/setup.ts'],
    include: ['src/**/*.test.{ts,tsx}'],
    server: {
      deps: {
        inline: [/@funcef-componentes/],
      },
    },
    css: false,
    env: {
      // Só o OVERLAY (Consumidor TKF2) consome NEXT_PUBLIC_API_URL — no base a
      // API é server-only (API_URL, rota BFF). Mantida para o smoke do overlay.
      NEXT_PUBLIC_API_URL: 'http://localhost:3000',
      NEXT_PUBLIC_APP_URL: 'http://localhost:3000',
      NEXT_PUBLIC_BASE_PATH: '',
      // Consumidor TKF2 (overlay): o env-client do cenário exige ENTRADA_URL.
      // Ignorado pelo env-client do Full BA (Zod descarta chaves extras).
      NEXT_PUBLIC_ENTRADA_URL: 'http://localhost:3000',
    },
    coverage: {
      provider: 'v8',
      reporter: ['text', 'html', 'lcov'],
      include: ['src/shared/lib/**/*.ts', 'src/core/config/**/*.ts'],
      // Piso, não meta: falha o CI se a cobertura REGREDIR do patamar atual
      // (medido em 2026-07-11: 17.5/9.1/10.5/20.9). Recalibrar quando o
      // escopo do include mudar — e subir conforme shared/lib ganhar testes.
      thresholds: {
        statements: 15,
        branches: 5,
        functions: 10,
        lines: 20,
      },
    },
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
    },
  },
});
