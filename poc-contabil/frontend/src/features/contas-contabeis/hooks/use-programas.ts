import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter a lista de programas do critério (dropdown)
 * Migração de: cboPrograma (TwwDBIncrementalSearch) no Delphi
 *   SqlPrograma: SELECT IDPROGRAMA, DESCPROGRAMA FROM PROGRAMA ORDER BY 2
 * Backend: GET /api/programas
 */
export function useProgramas() {
  const query = useQuery({
    queryKey: [...queryKeys.programas.list()],
    queryFn: () => contasContabeisApi.getProgramas(),
  });

  return {
    programas: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
