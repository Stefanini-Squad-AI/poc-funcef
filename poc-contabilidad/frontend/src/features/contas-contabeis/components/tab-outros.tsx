'use client';

import { UseFormReturn } from 'react-hook-form';
import { Card, Input, Label } from '@funcef-componentes/react';
import type { TContaContabilSchema } from '../validators';
import { useContasTree } from '../hooks';
import { ContasList, ContasListSkeleton } from './contas-list';

type FormValues = TContaContabilSchema;

/**
 * Tab 5: Árvore de Contas Contábeis (TabSheet2 no DFM)
 *
 * Tab 3 (Conta x C.Custo) foi migrada para tab-centro-custo.tsx
 * Tab 4 (Conta x Sub-Conta) foi migrada para tab-sub-conta.tsx
 */
export function TabArvoreContas({ plano }: { plano?: number }) {
  const { contas, isLoading, error } = useContasTree(false, plano);

  if (isLoading) return <ContasListSkeleton />;

  if (error) {
    return (
      <Card className="border-destructive p-5">
        <h2 className="text-base font-semibold mb-2 text-destructive">
          Erro ao carregar contas
        </h2>
        <p className="text-sm text-muted-foreground">{error.message}</p>
      </Card>
    );
  }

  if (!contas || contas.length === 0) {
    return (
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Árvore de Contas Contábeis</h2>
        <p className="text-sm text-muted-foreground">
          O plano de contas está vazio. Verifique a conexão com o Oracle.
        </p>
      </Card>
    );
  }

  return <ContasList contas={contas} />;
}

/**
 * Tab 6: Detalhes (TabSheet6 no DFM)
 * Componente Delphi: DBMemoObs (TDBMemo) — campo OBSERVACAO
 */
export function TabObservacoes({ form }: { form: UseFormReturn<FormValues> }) {
  const { register } = form;

  return (
    <div className="space-y-6">
      <Card className="p-5">
        <h2 className="text-base font-semibold mb-4 text-primary">Descrição/Observações</h2>
        <textarea
          {...register('observacoes')}
          className="w-full min-h-[225px] rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring"
          placeholder="Observações sobre a conta contábil..."
        />
      </Card>
    </div>
  );
}
