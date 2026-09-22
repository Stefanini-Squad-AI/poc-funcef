import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

/**
 * Hook para obter os Parâmetros Contábeis da empresa (PARAMCONTAB).
 * Migração de: uCtrlContab.pas → TCtrlContab
 *   Sistema.IdEmpresa → SELECT PACMOEDAOFICIAL, PACMOEDAGERENCIAL, PACMOEDAGEREN1, PACMOEDAGEREN2
 *   FROM PARAMCONTAB WHERE IDPESSOA = IdEmpresa
 * Backend: GET /api/paramcontab/{idEmpresa}
 *
 * Usado para habilitar/deshabilitar combos de Tipo de Conversão
 * (FCadContasContabMT.pas líneas 740-762).
 */
export function useParamContab(idEmpresa: number) {
  const query = useQuery({
    queryKey: [...queryKeys.paramContab.detail(idEmpresa)],
    queryFn: () => contasContabeisApi.getParamContab(idEmpresa),
    staleTime: 0, // refetch após invalidação (PACREDUZ muda ao criar contas)
  });

  return {
    paramContab: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
