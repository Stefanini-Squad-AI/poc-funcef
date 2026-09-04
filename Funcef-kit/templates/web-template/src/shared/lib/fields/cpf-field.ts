import { z } from 'zod';
import { cpfValidator } from '../validators/cpf';
import { cleanCpfCnpj } from '../formatters/cpf-cnpj';

export const cpfField = z
  .string()
  .min(1, 'CPF é obrigatório')
  .default('')
  .transform((val) => cleanCpfCnpj(val))
  .refine((val) => cpfValidator.validate(val), { message: 'CPF inválido' });

export type CpfField = z.infer<typeof cpfField>;
