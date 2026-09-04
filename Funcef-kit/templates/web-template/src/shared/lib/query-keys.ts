/**
 * Factory central de query-keys do React Query — evita arrays inline
 * (`['tasks', 'list']`) espalhados pela base.
 *
 * Padrão por grupo: `all` (raiz), `list()` (coleção), `detail(id)`.
 */
export const queryKeys = {
  tasks: {
    all: ['tasks'] as const,
    list: () => [...queryKeys.tasks.all, 'list'] as const,
    // Sem consumidor no exemplo mínimo — faz parte do shape padrão do grupo.
    detail: (id: string | number) =>
      [...queryKeys.tasks.all, 'detail', id] as const,
  },
} as const;
