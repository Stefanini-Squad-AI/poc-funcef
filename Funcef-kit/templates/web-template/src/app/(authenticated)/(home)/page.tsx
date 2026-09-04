import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from '@funcef-componentes/react';

export default function HomePage() {
  return (
    <div className="p-6">
      <div className="mx-auto max-w-4xl space-y-6">
        <div>
          <h1 className="mb-2 text-4xl font-bold">Bem-vindo ao Template Web</h1>
          <p className="text-muted-foreground text-lg">
            Template completo para desenvolvimento de aplicações web com Next.js
          </p>
        </div>
        <Card>
          <CardHeader>
            <CardTitle>Sobre o Template</CardTitle>
            <CardDescription>
              Este template demonstra o uso completo da arquitetura
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-2">
            <p className="text-sm">
              <strong>✅ Componentes da Lib:</strong> Páginas usando componentes
              de @funcef-componentes (Button, Input, Card, Badge, etc.).
            </p>
            <p className="text-sm">
              <strong>✅ React Query:</strong> Hooks para queries e mutations
              com cache automático.
            </p>
            <p className="text-sm">
              <strong>✅ TypeScript:</strong> Tipagem completa em toda a
              aplicação.
            </p>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
