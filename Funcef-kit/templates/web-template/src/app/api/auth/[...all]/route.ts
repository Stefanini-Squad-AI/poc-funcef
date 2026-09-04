import { auth } from '@/core/auth';
import { toNextJsHandler } from '@funcef-componentes/auth/server';

export const { GET, POST } = toNextJsHandler(auth);
