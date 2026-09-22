import type { Metadata, Viewport } from 'next';
import localFont from 'next/font/local';
import { GlobalProviders } from './global-providers';

import '@/app/globals.css';

const montserrat = localFont({
  src: [
    {
      path: '../assets/fonts/Montserrat-VariableFont_wght.ttf',
      style: 'normal',
    },
    {
      path: '../assets/fonts/Montserrat-Italic-VariableFont_wght.ttf',
      style: 'italic',
    },
  ],
  variable: '--font-montserrat',
  display: 'swap',
});

export const metadata: Metadata = {
  title: 'POC Contabilidad - FUNCEF',
  description: 'Migração Delphi 5 → .NET 10 + React 19',
};

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  viewportFit: 'cover',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html
      lang="pt-BR"
      suppressHydrationWarning
      className={`${montserrat.className} antialiased`}
    >
      <body>
        <GlobalProviders>{children}</GlobalProviders>
      </body>
    </html>
  );
}
