import { useMutation, useQueryClient } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';
import type {
  CreateContaContabilRequest,
  UpdateContaContabilRequest,
} from '../types';

/**
 * Hooks de mutação — Migração de FCadContasContabMT.pas
 *
 * Mapa de equivalencias:
 * - CmeCadastroApplyInsert  → useCreateConta
 * - CmeCadastroApplyEdit    → useUpdateConta
 * - CmeCadastroApplyDelete  → useDeleteConta
 *
 * TanStack Query v5 invalida cache automaticamente após sucesso.
 * meta: { globalErrorToast: true } → toast automático de erro via MutationCache.
 */

export function useCreateConta() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (data: CreateContaContabilRequest) => contasContabeisApi.create(data),
    onSuccess: () => {
      // Invalidar cache de contas e de PARAMCONTAB (PACREDUZ foi incrementado)
      queryClient.invalidateQueries({ queryKey: queryKeys.contasContabeis.all });
      queryClient.invalidateQueries({ queryKey: queryKeys.paramContab.all });
    },
    meta: { globalErrorToast: true },
  });
}

export function useUpdateConta() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({
      plano,
      codigo,
      data,
    }: {
      plano: number;
      codigo: string;
      data: UpdateContaContabilRequest;
    }) => contasContabeisApi.update(plano, codigo, data),
    onSuccess: () =>
      queryClient.invalidateQueries({ queryKey: queryKeys.contasContabeis.all }),
    meta: { globalErrorToast: true },
  });
}

export function useDeleteConta() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ plano, codigo }: { plano: number; codigo: string }) =>
      contasContabeisApi.delete(plano, codigo),
    onSuccess: () =>
      queryClient.invalidateQueries({ queryKey: queryKeys.contasContabeis.all }),
    meta: { globalErrorToast: true },
  });
}
