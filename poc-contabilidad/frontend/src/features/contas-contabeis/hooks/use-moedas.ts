import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de moedas (dropdown)
 * Migração de: dblkMoeda (TwwDBLookupCombo) no Delphi
 *   LookupTable = CdsMoeda, LookupField = 'MOECODIGO', display = 'MOEDESC'
 * Backend: GET /api/moedas
 */
export function useMoedas() {
  const query = useQuery({
    queryKey: [...queryKeys.moedas.list()],
    queryFn: () => contasContabeisApi.getMoedas(),
  });

  return {
    moedas: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
