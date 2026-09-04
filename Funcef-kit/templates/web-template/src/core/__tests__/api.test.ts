import { describe, it, expect } from 'vitest';
import { http } from 'msw';
import { server } from '@/__tests__/msw/server';
import { jsonOk, errorStatus } from '@/__tests__/msw/handlers';
import { getToastMessage, isRetryable } from '@funcef-componentes/auth/http';
import { api } from '../api';

// A fachada aponta para o BFF same-origin (`/api/bff/*`) — quem anexa o Bearer
// é o route handler no servidor (createBffHandler, coberto na lib). Aqui se
// testa o contrato da fachada: envelope, carimbo de erro e retry.
const EXEMPLO_URL = 'http://localhost:3000/api/bff/exemplo';

describe('api (createApi via BFF) — contrato do backend principal', () => {
  it('normaliza o envelope FUNCEF na resposta do BFF', async () => {
    server.use(
      http.get(EXEMPLO_URL, () =>
        jsonOk([{ id: 1, name: 'Cliente Fake' }], { qtdRegistros: 1 })
      )
    );

    const res = await api.get<{ id: number; name: string }[]>('/exemplo');

    expect(res.success).toBe(true);
    expect(res.data).toEqual([{ id: 1, name: 'Cliente Fake' }]);
    expect(res.totalRecords).toBe(1);
  });

  it('erro 4xx vira erro carimbado: mensagem legível e sem retry', async () => {
    server.use(
      http.get(EXEMPLO_URL, () =>
        errorStatus(400, { mensagem: 'Falha de negócio.' })
      )
    );

    const err = await api.get('/exemplo').catch((e) => e);

    expect(getToastMessage(err)).toBe('Falha de negócio.');
    expect(isRetryable(err)).toBe(false);
  });

  it('erro 5xx é retryable com mensagem genérica', async () => {
    server.use(http.get(EXEMPLO_URL, () => errorStatus(500)));

    const err = await api.get('/exemplo').catch((e) => e);

    expect(isRetryable(err)).toBe(true);
    expect(getToastMessage(err)).toMatch(/erro inesperado/i);
  });
});
