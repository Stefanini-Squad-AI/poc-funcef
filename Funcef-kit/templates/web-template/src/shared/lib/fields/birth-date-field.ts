import { z } from 'zod';

interface BirthDateFieldOptions {
  minAge?: number;
  maxAge?: number;
  allowFuture?: boolean;
}

export const createBirthDateField = (options: BirthDateFieldOptions = {}) => {
  const { minAge, maxAge, allowFuture = false } = options;

  return z
    .date({ error: 'Data de nascimento é obrigatória' })
    .refine((date) => allowFuture || date <= new Date(), {
      message: 'Data de nascimento não pode ser futura',
    })
    .refine(
      (date) => {
        if (!minAge && !maxAge) return true;
        const today = new Date();
        let age = today.getFullYear() - date.getFullYear();
        const monthDiff = today.getMonth() - date.getMonth();
        if (
          monthDiff < 0 ||
          (monthDiff === 0 && today.getDate() < date.getDate())
        ) {
          age--;
        }
        if (minAge && age < minAge) return false;
        if (maxAge && age > maxAge) return false;
        return true;
      },
      {
        message:
          minAge && maxAge
            ? `Idade deve estar entre ${minAge} e ${maxAge} anos`
            : minAge
              ? `Idade mínima é ${minAge} anos`
              : `Idade máxima é ${maxAge} anos`,
      }
    );
};

export const birthDateField = createBirthDateField();

export type BirthDateField = z.infer<typeof birthDateField>;
