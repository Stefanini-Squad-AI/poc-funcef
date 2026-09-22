import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de sub-grupos (dropdown)
 * Migração de: dblkSubGrupo1-4 (TwwDBLookupCombo) no Delphi
 *   LookupTable = CdsSubGrupo, LookupField = 'CODSUBGRP', display = 'DESCSUBGRP'
 * Backend: GET /api/subgrupos
 */
export function useSubGrupos() {
  const query = useQuery({
    queryKey: [...queryKeys.subGrupos.list()],
    queryFn: () => contasContabeisApi.getSubGrupos(),
  });

  return {
    subGrupos: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
