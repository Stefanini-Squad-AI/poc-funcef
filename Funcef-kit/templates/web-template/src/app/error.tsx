'use client';

import { useEffect } from 'react';
import {
  Button,
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@funcef-componentes/react';
import { envClient } from '@/shared/config/env-client';
export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  const isDevelopment = process.env.NODE_ENV === 'development';

  useEffect(() => {
    if (isDevelopment) {
      console.error('Erro capturado pelo Error Boundary:', error);
    }
  }, [error, isDevelopment]);

  return (
    <div className="flex min-h-screen items-center justify-center p-6">
      <Card className="border-destructive w-full max-w-md">
        <CardHeader>
          <CardTitle className="text-destructive text-2xl">
            Algo deu errado!
          </CardTitle>
          <CardDescription>
            Ocorreu um erro inesperado. Por favor, tente novamente.
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          {isDevelopment && (
            <div className="bg-muted rounded-md p-3">
              <p className="text-muted-foreground font-mono text-sm">
                {error.message}
              </p>
              {error.digest && (
                <p className="text-muted-foreground mt-2 text-xs">
                  Digest: {error.digest}
                </p>
              )}
            </div>
          )}
          <div className="flex gap-2">
            <Button onClick={reset} className="flex-1">
              Tentar novamente
            </Button>
            <Button
              variant="outline"
              onClick={() => (window.location.href = `${envClient.BASE_PATH}/`)}
              className="flex-1"
            >
              Ir para início
            </Button>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
