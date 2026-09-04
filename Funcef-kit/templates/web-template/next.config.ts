import type { NextConfig } from 'next';
import pkg from './package.json';

const nextConfig: NextConfig = {
  env: {
    NEXT_PUBLIC_APP_VERSION: pkg.version,
  },
  turbopack: {},

  basePath: process.env.NEXT_PUBLIC_BASE_PATH || '',
  assetPrefix: process.env.NEXT_PUBLIC_BASE_PATH || '',
  images: {
    qualities: [75, 100],
  },
  reactCompiler: true,
  output: 'standalone',

  async headers() {
    const scriptSrc = [
      "'self'",
      "'unsafe-inline'",
      // Necessário para Web Workers / WASM no App Router.
      "'wasm-unsafe-eval'",
      // Adicionar origens de scripts de terceiros AQUI (ex.: CDN de analytics opt-in).
    ]
      .filter(Boolean)
      .join(' ');

    const connectSrc = [
      "'self'",
      // O backend NÃO entra aqui: é chamado via BFF same-origin (/api/bff).
      // Telemetria (ex.: Azure Monitor) é opt-in via @funcef-componentes/observability —
      // ao adotá-la, adicione as origens de `observabilityConnectSrc` do pacote.
    ]
      .filter(Boolean)
      .join(' ');

    const frameSrc = [
      "'self'",
      // Adicionar origens de iframes de terceiros AQUI se necessário.
    ]
      .filter(Boolean)
      .join(' ');

    const csp = [
      "default-src 'self'",
      `script-src ${scriptSrc}`,
      "style-src 'self' 'unsafe-inline'",
      "font-src 'self'",
      "img-src 'self' data: blob:",
      `frame-src ${frameSrc}`,
      `connect-src ${connectSrc}`,
      "worker-src blob: 'self'",
      "object-src 'none'",
      "base-uri 'self'",
      "form-action 'self'",
    ].join('; ');

    const isProd = process.env.NODE_ENV === 'production';

    return [
      {
        source: '/:path*',
        headers: [
          { key: 'X-Content-Type-Options', value: 'nosniff' },
          { key: 'X-Frame-Options', value: 'SAMEORIGIN' },
          { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
          {
            key: 'Permissions-Policy',
            value: [
              'camera=()',
              'microphone=()',
              'geolocation=()',
              'payment=()',
              'usb=()',
              'magnetometer=()',
              'accelerometer=()',
              'gyroscope=()',
            ].join(', '),
          },
          {
            key: 'Vary',
            value:
              'RSC, Next-Router-State-Tree, Next-Router-Prefetch, Accept-Encoding',
          },
          ...(isProd ? [{ key: 'Content-Security-Policy', value: csp }] : []),
        ],
      },
    ];
  },
};

export default nextConfig;
