ALTER TABLE CM.BASEDEPAGAMENTO
  ADD (
     VLRREDUCAOIRRF          NUMBER(17,2),
     VLRTRIBUTAVELIRRF       NUMBER(17,2),
     VLRREDUCAOIRRF13        NUMBER(17,2),
     VLRTRIBUTAVELIRRF13     NUMBER(17,2),
     VLRREDUCAOINSSIRRF      NUMBER(17,2),
     VLRTRIBUTAVELINSSIRRF   NUMBER(17,2),
     VLRREDUCAOINSSIRRF13    NUMBER(17,2),
     VLRTRIBUTAVELINSSIRRF13 NUMBER(17,2)	 
  );

-- Add comments to the columns 
comment on column cm.basedepagamento.vlrreducaoirrf
  is 'Redução aplicada no IR apurado na base Funcef';

comment on column cm.basedepagamento.vlrtributavelirrf
  is 'Valor tributável usado no cálculo da Redução no IR apurado na base Funcef';

comment on column cm.basedepagamento.vlrreducaoirrf13
  is 'Redução aplicada no IR apurado na base Abono Funcef';

comment on column cm.basedepagamento.vlrtributavelirrf13
  is 'Valor tributável usado no cálculo da Redução no IR apurado na base Abono Funcef';

comment on column cm.basedepagamento.vlrreducaoinssirrf
  is 'Redução aplicada no IR apurado na base INSS';

comment on column cm.basedepagamento.vlrtributavelinssirrf
  is 'Valor tributável usado no cálculo da Redução no IR apurado na base INSS';

comment on column cm.basedepagamento.vlrreducaoinssirrf13
  is 'Redução aplicada no IR apurado na base Abono INSS';

comment on column cm.basedepagamento.vlrtributavelinssirrf13
  is 'Valor tributável usado no cálculo da Redução no IR apurado na base Abono INSS';