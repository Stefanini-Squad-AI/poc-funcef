import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter os Parâmetros Globais da empresa (PARAMGLOBAL).
 * Migração de: uCtrlParamIntegra.pas → GetParams(IdEmpresa)
 *   Sistema.IdEmpresa → SELECT * FROM PARAMGLOBAL WHERE IDPESSOA = IdEmpresa
 * Backend: GET /api/paramglobal/{idEmpresa}
 *
 * O IdEmpresa é definido via env NEXT_PUBLIC_ID_EMPRESA (default: 1).
 * No legacy, vem do login (Sistema.IdEmpresa).
 */
export function useParamGlobal(idEmpresa: number) {
  const query = useQuery({
    queryKey: [...queryKeys.paramGlobal.detail(idEmpresa)],
    queryFn: () => contasContabeisApi.getParamGlobal(idEmpresa),
    staleTime: Infinity, // não muda durante a sessão
  });

  return {
    paramGlobal: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
