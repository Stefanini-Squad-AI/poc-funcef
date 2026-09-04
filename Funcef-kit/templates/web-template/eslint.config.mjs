import { defineConfig, globalIgnores } from 'eslint/config';
import nextVitals from 'eslint-config-next/core-web-vitals';
import nextTs from 'eslint-config-next/typescript';
import eslintConfigPrettier from 'eslint-config-prettier/flat';
import boundaries from 'eslint-plugin-boundaries';

const eslintConfig = defineConfig([
  ...nextVitals,
  ...nextTs,
  {
    settings: {
      react: { version: '19' },
    },
  },
  {
    files: ['src/**/*.{ts,tsx}'],
    // Boundaries governam código de produção; testes são lintados pelos
    // demais blocos, mas ficam fora do grafo de camadas.
    ignores: [
      '**/__tests__/**',
      '**/*.test.ts',
      '**/*.test.tsx',
      '**/*.spec.ts',
      '**/*.spec.tsx',
    ],
    plugins: { boundaries },
    settings: {
      'boundaries/include': ['src/**/*'],
      'boundaries/elements': [
        {
          type: 'feature',
          pattern: 'src/features/*',
          capture: ['feature'],
        },
        { type: 'core', pattern: 'src/core' },
        { type: 'shared', pattern: 'src/shared' },
        { type: 'app', pattern: 'src/app' },
        // Fallback 'src' (por último): classifica os arquivos na raiz de src
        // (proxy.ts, instrumentation.ts) como 'app' (infra de orquestração) —
        // os padrões mais específicos acima têm precedência.
        { type: 'app', pattern: 'src' },
      ],
    },
    rules: {
      // Arquivo lintado sem elemento classificado = erro, não buraco silencioso.
      'boundaries/no-unknown-files': 'error',
      'boundaries/dependencies': [
        'error',
        {
          default: 'disallow',
          policies: [
            {
              from: { element: { type: 'app' } },
              allow: [
                { to: { element: { type: 'app' } } },
                { to: { element: { type: 'feature' } } },
                { to: { element: { type: 'core' } } },
                { to: { element: { type: 'shared' } } },
              ],
            },
            {
              from: { element: { type: 'feature' } },
              allow: [
                {
                  to: {
                    element: {
                      type: 'feature',
                      captured: {
                        feature: '{{ from.element.captured.feature }}',
                      },
                    },
                  },
                },
                { to: { element: { type: 'core' } } },
                { to: { element: { type: 'shared' } } },
              ],
            },
            {
              from: { element: { type: 'core' } },
              allow: [
                { to: { element: { type: 'core' } } },
                { to: { element: { type: 'shared' } } },
              ],
            },
            {
              from: { element: { type: 'shared' } },
              allow: [{ to: { element: { type: 'shared' } } }],
            },
          ],
        },
      ],
    },
  },
  {
    files: [
      '**/*.test.ts',
      '**/*.test.tsx',
      '**/*.spec.ts',
      '**/*.spec.tsx',
      '**/__tests__/**',
    ],
    rules: {
      '@typescript-eslint/no-explicit-any': 'off',
      // renderHook(() => useX()) chama hook dentro de callback — padrão de teste.
      'react-hooks/rules-of-hooks': 'off',
    },
  },
  globalIgnores([
    '.next/**',
    'out/**',
    'build/**',
    'coverage/**',
    'next-env.d.ts',
    '**/__mocks__/**',
    '.claude/skills/**',
  ]),
  eslintConfigPrettier,
]);

export default eslintConfig;
