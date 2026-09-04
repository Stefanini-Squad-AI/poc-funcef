import { http } from 'msw';
import { describe, it, expect } from 'vitest';
import { waitFor } from '@testing-library/react';
import { server } from '@/__tests__/msw/server';
import { jsonOk } from '@/__tests__/msw/handlers';
import { renderHookWithProviders } from '@/__tests__/render';
import { useAllTasks } from '../use-tasks-query';
import type { Task } from '../../types';

const TASKS_MOCK: Task[] = [
  { id: 1, title: 'Primeira', done: false },
  { id: 2, title: 'Segunda', done: true },
];

// A origem da fachada muda por cenário (BFF same-origin no Full BA; API direta
// no Consumidor) — o matcher por sufixo cobre os dois com UM teste, e é isso
// que permite o arquivo ficar FORA do overlay.
const ENDPOINT_URL = /\/tasks$/;

describe('useAllTasks', () => {
  it('retorna a lista de tarefas após sucesso (200)', async () => {
    server.use(http.get(ENDPOINT_URL, () => jsonOk(TASKS_MOCK)));

    const { result } = renderHookWithProviders(() => useAllTasks());

    await waitFor(() => expect(result.current.isTasksLoading).toBe(false));

    expect(result.current.tasks).toHaveLength(2);
    expect(result.current.tasks?.[0]).toMatchObject({ title: 'Primeira' });
    expect(result.current.error).toBeNull();
  });
});
