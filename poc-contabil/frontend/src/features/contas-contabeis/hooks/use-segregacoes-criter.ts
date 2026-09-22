import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de critérios de segregação de recursos (dropdown)
 * Migração de: dblkSegregacao (TwwDBLookupCombo) no Delphi
 *   cdsSegregaCriter.Data := CtrlSegregacao.ListaSegregaCriter
 * Backend: GET /api/segregacoescriter
 */
export function useSegregacoesCriter() {
  const query = useQuery({
    queryKey: [...queryKeys.segregacoesCriter.list()],
    queryFn: () => contasContabeisApi.getSegregacoesCriter(),
  });

  return {
    segregacoes: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
