import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { contasContabeisApi } from '../api';

export function useContasTree(incluirInativas: boolean = false, plano?: number) {
  const query = useQuery({
    queryKey: [...queryKeys.contasContabeis.tree(), incluirInativas, plano ?? 'all'],
    queryFn: () => contasContabeisApi.getTree(incluirInativas, plano),
    staleTime: 0, // Sempre refetch para ter dados atualizados (ex: após criar conta pai)
  });

  return {
    contas: query.data?.data ?? null,
    isLoading: query.isLoading,
    error: query.error,
  };
}
