import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@funcef-componentes/react';

export default function HomePage() {
  return (
    <div className="mx-auto max-w-4xl space-y-6">
      <div>
        <h1 className="mb-2 text-4xl font-bold">POC Contabilidad</h1>
        <p className="text-muted-foreground text-lg">
          Migração Delphi 5 → .NET 10 + React 19 com FUNCEF
        </p>
      </div>
      <Card>
        <CardHeader>
          <CardTitle>Sobre o POC</CardTitle>
          <CardDescription>
            Proof of Concept para migração do sistema de contabilidade
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-2">
          <p className="text-sm">
            <strong>✅ Backend:</strong> .NET 10 + Clean Architecture + Oracle
            (PLANOCONTA)
          </p>
          <p className="text-sm">
            <strong>✅ Frontend:</strong> Next.js 16 + React 19 + Design System
            FUNCEF
          </p>
          <p className="text-sm">
            <strong>✅ Framework:</strong> FUNCEF (Essenciais, ORM, Componentes)
          </p>
        </CardContent>
      </Card>
    </div>
  );
}
