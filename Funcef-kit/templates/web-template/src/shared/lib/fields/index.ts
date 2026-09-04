// Glue de domínio FUNCEF mantido deliberadamente no base (decisão do dono,
// Etapa 4 do refactor v3): 0 consumidores é esperado até a primeira feature
// real usar CPF/CNPJ/data de nascimento. NÃO remover como "código morto".
export * from './cpf-field';
export * from './birth-date-field';
