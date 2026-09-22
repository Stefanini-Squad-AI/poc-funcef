import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de sub-contas disponíveis (não associadas)
 * Migração de: FCadContasContabMT.pas → CdsSubConta (grid esquerdo)
 *   ListSubContaCadContas: SELECT ... FROM SUBCONTA WHERE NOT EXISTS (CONTASXSUBC)
 * Backend: GET /api/subcontas?idEmpresa=1&plano=1&placConta=1.1.1.01
 */
export function useSubContas(idEmpresa: number, plano: number, placConta: string, enabled: boolean = true) {
  const query = useQuery({
    queryKey: [...queryKeys.subContas.list(idEmpresa, plano, placConta)],
    queryFn: () => contasContabeisApi.getSubContas(idEmpresa, plano, placConta),
    enabled: enabled && !!placConta,
  });

  return {
    subContas: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}

/**
 * Hook para obter a lista de sub-contas já associadas à conta
 * Migração de: FCadContasContabMT.pas → CdsContasxSC (grid direito)
 *   ListContasxSC: SELECT ... FROM CONTASXSUBC WHERE ...
 * Backend: GET /api/contasxsc?idEmpresa=1&plano=1&placConta=1.1.1.01
 */
export function useContasxSC(idEmpresa: number, plano: number, placConta: string, enabled: boolean = true) {
  const query = useQuery({
    queryKey: [...queryKeys.contasxSC.list(idEmpresa, plano, placConta)],
    queryFn: () => contasContabeisApi.getContasxSC(idEmpresa, plano, placConta),
    enabled: enabled && !!placConta,
  });

  return {
    contasxSC: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}

/**
 * Mutation para associar sub-contas a uma conta
 * Migração de: btnVaiUm2Click / btnVaiTodos2Click
 * Backend: POST /api/contasxsc/associate
 */
export function useAssociateContasxSC(idEmpresa: number, plano: number, placConta: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (codSubContas: number[]) =>
      contasContabeisApi.associateContasxSC({
        plano,
        placConta,
        idEmpresa,
        idUsuario: 1,
        codSubContas,
      }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.subContas.all });
      queryClient.invalidateQueries({ queryKey: queryKeys.contasxSC.all });
    },
  });
}

/**
 * Mutation para desassociar sub-contas de uma conta
 * Migração de: btnVoltaUm2Click / btnVoltaTodos2Click
 * Backend: POST /api/contasxsc/disassociate
 */
export function useDisassociateContasxSC(idEmpresa: number, plano: number, placConta: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (codSubContas: number[]) =>
      contasContabeisApi.disassociateContasxSC({
        plano,
        placConta,
        idEmpresa,
        codSubContas,
      }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.subContas.all });
      queryClient.invalidateQueries({ queryKey: queryKeys.contasxSC.all });
    },
  });
}
