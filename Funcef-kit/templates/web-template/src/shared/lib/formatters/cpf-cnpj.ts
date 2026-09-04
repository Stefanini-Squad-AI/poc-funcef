export const cleanCpfCnpj = (value: string): string =>
  value?.replace(/\D/g, '') || '';

export const formatCpf = (value: string): string => {
  const cleanedValue = cleanCpfCnpj(value);

  if (cleanedValue.length > 11) {
    return formatCpf(cleanedValue.slice(0, 11));
  }

  return cleanedValue
    .replace(/(\d{3})(\d)/, '$1.$2')
    .replace(/(\d{3})(\d)/, '$1.$2')
    .replace(/(\d{3})(\d{1,2})/, '$1-$2')
    .replace(/(-\d{2})\d+?$/, '$1');
};

export const formatCnpj = (value: string): string => {
  const cleanedValue = cleanCpfCnpj(value);

  if (cleanedValue.length > 14) {
    return formatCnpj(cleanedValue.slice(0, 14));
  }

  return cleanedValue
    .replace(/(\d{2})(\d)/, '$1.$2')
    .replace(/(\d{3})(\d)/, '$1.$2')
    .replace(/(\d{3})(\d)/, '$1/$2')
    .replace(/(\d{4})(\d{1,2})/, '$1-$2')
    .replace(/(-\d{2})\d+?$/, '$1');
};

export const formatCpfCnpj = (value: string): string => {
  const cleanedValue = cleanCpfCnpj(value);

  if (cleanedValue.length <= 11) {
    return formatCpf(value);
  }

  return formatCnpj(value);
};
