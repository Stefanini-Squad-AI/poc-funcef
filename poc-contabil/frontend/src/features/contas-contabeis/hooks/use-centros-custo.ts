import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de centros de custo disponíveis (não associados)
 * Migração de: FCadContasContabMT.pas → CdsCCusto (grid esquerdo)
 *   ListCCustoCadContas: SELECT ... FROM CENTCUST WHERE NOT EXISTS (CONTASXCC)
 * Backend: GET /api/centroscusto?idEmpresa=1&plano=1&placConta=1.1.1.01
 */
export function useCentrosCusto(idEmpresa: number, plano: number, placConta: string, enabled: boolean = true) {
  const query = useQuery({
    queryKey: [...queryKeys.centrosCusto.list(idEmpresa, plano, placConta)],
    queryFn: () => contasContabeisApi.getCentrosCusto(idEmpresa, plano, placConta),
    enabled: enabled && !!placConta,
    staleTime: 0, // Sempre refetch ao montar (dados podem ter mudado via API)
  });

  return {
    centrosCusto: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}

/**
 * Hook para obter a lista de centros de custo já associados à conta
 * Migração de: FCadContasContabMT.pas → CdsContasxCC (grid direito)
 *   ListContasxCC: SELECT ... FROM CENTCUST C, CONTASXCC CC WHERE ...
 * Backend: GET /api/contasxcc?idEmpresa=1&plano=1&placConta=1.1.1.01
 */
export function useContasxCC(idEmpresa: number, plano: number, placConta: string, enabled: boolean = true) {
  const query = useQuery({
    queryKey: [...queryKeys.contasxCC.list(idEmpresa, plano, placConta)],
    queryFn: () => contasContabeisApi.getContasxCC(idEmpresa, plano, placConta),
    enabled: enabled && !!placConta,
    staleTime: 0, // Sempre refetch ao montar (dados podem ter mudado via API)
  });

  return {
    contasxCC: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}

/**
 * Mutation para associar centros de custo a uma conta
 * Migração de: btnVaiUmClick / btnVaiTodosClick
 * Backend: POST /api/contasxcc/associate
 */
export function useAssociateContasxCC(idEmpresa: number, plano: number, placConta: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (codCentrosCusto: string[]) =>
      contasContabeisApi.associateContasxCC({
        plano,
        placConta,
        idEmpresa,
        idUsuarioInclusao: 1,
        codCentrosCusto,
      }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.centrosCusto.all });
      queryClient.invalidateQueries({ queryKey: queryKeys.contasxCC.all });
    },
  });
}

/**
 * Mutation para desassociar centros de custo de uma conta
 * Migração de: btnVoltaUmClick / btnVoltaTodosClick
 * Backend: POST /api/contasxcc/disassociate
 */
export function useDisassociateContasxCC(idEmpresa: number, plano: number, placConta: string) {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (codCentrosCusto: string[]) =>
      contasContabeisApi.disassociateContasxCC({
        plano,
        placConta,
        idEmpresa,
        codCentrosCusto,
      }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.centrosCusto.all });
      queryClient.invalidateQueries({ queryKey: queryKeys.contasxCC.all });
    },
  });
}
