import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de planos contábeis (dropdown)
 * Migração de: dblkPlanoContabil (TCMDBLookupCombo) no Delphi
 *   CdsPlanoContabil.Data := CtrlContaContabil.ListPlanosContas(Sistema.IdEmpresa)
 * Backend: GET /api/planoscontabeis
 */
export function usePlanosContabeis(incluirInativos: boolean = false) {
  const query = useQuery({
    queryKey: [...queryKeys.planosContabeis.list(), incluirInativos],
    queryFn: () => contasContabeisApi.getPlanos(incluirInativos),
  });

  return {
    planos: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
