import { http, HttpResponse } from 'msw';
import type { Task } from '@/features/tasks';

export interface EnvelopeOptions {
  mensagem?: string | null;
  qtdRegistros?: number | null;
  codNotificacao?: string | null;
}

/**
 * Resposta no envelope do backend (`{ resultado, mensagem, ... }`). O `createApi`
 * do pacote normaliza o envelope, de modo que o hook recebe um `ApiResponse<T>`
 * já normalizado — idêntico ao comportamento em produção.
 */
export function jsonOk<T>(data: T, options: EnvelopeOptions = {}) {
  return HttpResponse.json({
    resultado: data,
    mensagem: options.mensagem ?? null,
    qtdRegistros: options.qtdRegistros ?? null,
    codNotificacao: options.codNotificacao ?? null,
  });
}

/**
 * Resposta de erro HTTP (401/403/5xx). O corpo segue o envelope "flat" do backend
 * (`{ mensagem, codNotificacao }`) para que o `buildApiError` do pacote extraia a
 * mensagem (legível depois via `getToastMessage`).
 */
export function errorStatus(status: number, body: EnvelopeOptions = {}) {
  return HttpResponse.json(
    {
      mensagem: body.mensagem ?? null,
      codNotificacao: body.codNotificacao ?? null,
    },
    { status }
  );
}

// Handlers default de `tasks` (estado em memória) do MSW de TESTE (in-process).
// O mock de DEV é outro: json-server (`pnpm mock`, mocks/db.json).
// Testes registram seus próprios handlers via server.use(...).

let nextId = 3;
const tasks: Task[] = [
  { id: 1, title: 'Explorar o template', done: true },
  { id: 2, title: 'Criar a primeira feature', done: false },
];

export const taskHandlers = [
  http.get('*/tasks', () => jsonOk(tasks, { qtdRegistros: tasks.length })),

  http.post('*/tasks', async ({ request }) => {
    const body = (await request.json()) as { title?: string };
    if (!body?.title) {
      return errorStatus(400, { mensagem: 'Título é obrigatório.' });
    }
    const task: Task = { id: nextId++, title: body.title, done: false };
    tasks.push(task);
    return jsonOk(task);
  }),
];

/** Handlers default do server MSW de teste (cada teste registra os seus). */
export const handlers = [...taskHandlers];
