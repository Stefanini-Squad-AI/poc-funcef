'use client';

import { QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';
import { ThemeProvider as NextThemesProvider } from 'next-themes';
import dynamic from 'next/dynamic';
import { getQueryClient } from '@/core/config/query-client.config';

const Toaster = dynamic(
  () => import('@funcef-componentes/react').then((m) => m.Toaster),
  { ssr: false }
);

export function GlobalProviders({ children }: { children: React.ReactNode }) {
  const queryClient = getQueryClient();

  return (
    <NextThemesProvider
      attribute="class"
      defaultTheme="light"
      enableSystem
      disableTransitionOnChange
    >
      <QueryClientProvider client={queryClient}>
        {children}
        <Toaster
          position="top-center"
          duration={5000}
          closeButton
          visibleToasts={5}
        />
        {process.env.NODE_ENV === 'development' && <ReactQueryDevtools />}
      </QueryClientProvider>
    </NextThemesProvider>
  );
}
