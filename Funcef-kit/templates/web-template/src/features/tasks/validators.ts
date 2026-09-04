import { z } from 'zod';

export const createTaskSchema = z.object({
  title: z
    .string()
    .trim()
    .min(3, 'Informe um título com ao menos 3 caracteres'),
});

export type TCreateTaskSchema = z.infer<typeof createTaskSchema>;
