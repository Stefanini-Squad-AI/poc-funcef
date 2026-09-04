import { useQuery } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { tasksApi } from '../api';

export function useAllTasks() {
  const query = useQuery({
    queryKey: queryKeys.tasks.list(),
    queryFn: () => tasksApi.getAll(),
  });

  return {
    tasks: query.data?.data ?? null,
    isTasksLoading: query.isLoading,
    error: query.error,
  };
}
