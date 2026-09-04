import { useMutation, useQueryClient } from '@tanstack/react-query';
import { queryKeys } from '@/shared/lib';
import { tasksApi } from '../api';
import type { CreateTaskData } from '../types';

export function useCreateTask() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: (data: CreateTaskData) => tasksApi.create(data),
    onSuccess: () =>
      queryClient.invalidateQueries({ queryKey: queryKeys.tasks.all }),
    // Falha da mutation toasta via handler global (erro carimbado da lib).
    meta: { globalErrorToast: true },
  });
}
