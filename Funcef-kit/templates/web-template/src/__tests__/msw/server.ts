import { setupServer } from 'msw/node';
import { handlers } from './handlers';

/** MSW server para os testes (Vitest). Mesmos handlers do worker de DEV. */
export const server = setupServer(...handlers);
