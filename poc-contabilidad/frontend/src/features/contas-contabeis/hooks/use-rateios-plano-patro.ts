import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de rateios administrativos por plano/patrocinadora (dropdown)
 * Migração de: dblkRateioPlanoPatro (TwwDBLookupCombo) no Delphi
 *   cdsRateioPlanoPatro.Data := CtrlProcessaTotalPrev.ListaRatAdm
 * Backend: GET /api/rateiosplanopatro
 */
export function useRateiosPlanoPatro(incluirInativos: boolean = false) {
  const query = useQuery({
    queryKey: [...queryKeys.rateiosPlanoPatro.list(), incluirInativos],
    queryFn: () => contasContabeisApi.getRateios(incluirInativos),
  });

  return {
    rateios: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
