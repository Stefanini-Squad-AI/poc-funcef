unit uCalculaTabuaServico;

interface
  uses Classes, Messages, sysutils;

  type Treg_tabua_Servico =
       CLASS(TObject)
   idade : integer;  { idade da pessoa}
   l_x,    { número de pessoas que alcançam com vida a idade exata x}
   p_x,    { probabilidade que tem uma pessoa de idade x viver até o fim do
             ano - taxa de sobrev. dos ativos}
   q_x,    { probabilidade que tem uma pessoa de idade x morrer - taxa de mortalidade dos ativos}
   p_x_aa, { probabilidade de uma pessoa de idade x viver até o fim do
             ano sem se tornar inválida - taxa de sobrev. dos ativos}
   q_x_aa, { probabilidade de uma pessoa de idade x morrer sem se tornar
             inválida - taxa de mortalidade dos ativos}
   p_x_ai, { probabilidade de uma pessoa de idade x tornar-se inválida no ano
             e continuar viva}
   q_x_ai, { probabilidade de uma pessoa de idade x tornar-se inválida no ano
             e morrer no mesmo ano}
   p_x_a,  { probabilidade de uma pessoa de idade x viver até o fim do
             ano, seja como ativa seja como inválida}
   q_x_a,  { probabilidade de uma pessoa de idade x morrer no ano
             depois ou não de invalidar-se}
   i_x,    { probabilidade que tem uma pessoa de idade x tornar-se inválida no ano}
   p_x_i,  { Probabilidade de uma pessoa de idade x invalidar-se e
             estar viva}
   q_x_i,  { Probabilidade de uma pessoa de idade x invalidar-se e
             e morrer }
   l_x_aa, { número de válidos sobreviventes a cada idade, provenientes
             do grupo inicial l_x }
   ll_x_aa,{ número de válidos sobreviventes a cada idade, provenientes
             do grupo inicial l_x e l_x_aa}
   l_x_ii, { número de inválidos sobreviventes a cada idade, provenientes
             do grupo inicial l_x }
   // Funções de Sobrevivência
   N_x,    { numerador do valor renda}
   D_x,    { denominador do valor renda}
   S_x,    { soma }
   // Funções de Morte
   M_x,    { numerador do valor do seguro contra morte}
   C_x,    { denominador do valor do seguro contra morte}
   R_x,    { soma}
   // Funções de Sobrevivência  - válidos sobreviventes
   N_x_aa,    { numerador do valor renda}
   D_x_aa,    { denominador do valor renda}
   S_x_aa,    { soma }
   // Funções de Morte - válidos sobreviventes
   M_x_aa,    { numerador do valor do seguro contra morte}
   C_x_aa,    { denominador do valor do seguro contra morte}
   R_x_aa,    { soma}
   // Funções de Sobrevivência - inválidos sobreviventes
   N_x_ii,    { numerador do valor renda}
   D_x_ii,    { denominador do valor renda}
   S_x_ii,    { soma }
   // Funções de Morte - inválidos sobreviventes
   M_x_ii,    { numerador do valor do seguro contra morte}
   C_x_ii,    { denominador do valor do seguro contra morte}
   R_x_ii     { soma}

              : extended;
       end;

  function  calcula_tabua_servico
                                  (p_sq_tabua_mortalidade  : integer;
                                   p_sq_tabua_invalidez    : integer;
                                   p_sq_tabua_EntrInvalidez: integer;
                                   p_idade_lim_inferior : integer;
                                   p_idade_lim_superior : integer;
                                   p_taxa : real)
                                               : Tlist;

  procedure gera_tab_servico;
 {Carga da tábua de Mortalidade em Invalidez}
  Procedure CargaTabMortalidade (p_sq_tabua_mortalidade : integer);
 {Carga da tábua de Mortalidade em Invalidez}
  Procedure CargaTabInvalidez (p_sq_tabua_invalidez : integer);
 {Carga da tábua de Entrada em Invalidez}
  Procedure CargaTabEntradaInvalidez(p_sq_tabua_EntrInvalidez : integer);
 {Cálculo dos Inválidos}
  Procedure CalculoInvalidos;
 {Monta ll_x_aa -> número de válidos sobreviventes a cada idade}
  Procedure Montall_x_aa (p_idade_lim_inferior, p_idade_lim_superior : integer);

  type tabua = array [0..150] of extended;

var

   {Definição das variáveis utilizadas na tábua de Servicos}

   l_x,    { número de pessoas que alcançam com vida a idade exata x}
   p_x,    { probabilidade que tem uma pessoa de idade x viver até o fim do
             ano - taxa de sobrev. dos ativos}
   q_x,    { probabilidade que tem uma pessoa de idade x morrer - taxa de mortalidade dos ativos}
   p_x_aa, { probabilidade que tem uma pessoa de idade x viver até o fim do
             ano sem se tornar inválida - taxa de sobrev. dos ativos}
   q_x_aa, { probabilidade que tem uma pessoa de idade x morrer sem se tornar
             inválida - taxa de mortalidade dos ativos}
   p_x_ai, { probabilidade que tem uma pessoa de idade x tornar-se inválida no ano
             e continuar viva}
   q_x_ai, { probabilidade que tem uma pessoa de idade x tornar-se inválida no ano
             e morrer no mesmo ano}
   p_x_a,  { probabilidade que tem uma pessoa de idade x viver até o fim do
             ano, seja como ativa seja como inválida}
   q_x_a,  { probabilidade que tem uma pessoa de idade x morrer no ano
             depois ou não de invalidar-se}
   i_x,    { probabilidade que tem uma pessoa de idade x tornar-se inválida no ano}
   p_x_i,  { probabilidade que tem uma pessoa inválide de idade x
             estar viva no fim do ano}
   q_x_i,  { probabilidade que tem uma pessoa inválide de idade x
             estar morta no fim do ano}
   l_x_aa, { número de válidos sobreviventes a cada idade, provenientes
             do grupo inicial l_x }
   ll_x_aa,{ número de válidos sobreviventes a cada idade, provenientes
             do grupo inicial l_x }
   l_x_ii, { número de inválidos sobreviventes a cada idade, provenientes
             do grupo inicial l_x }
   // Funções de Sobrevivência
   N_x,    { numerador do valor renda}
   D_x,    { denominador do valor renda}
   S_x,    { soma }
   // Funções de Morte
   M_x,    { numerador do valor do seguro contra morte}
   C_x,    { denominador do valor do seguro contra morte}
   R_x,    { soma}
   // Funções de Sobrevivência
   N_x_aa,    { numerador do valor renda}
   D_x_aa,    { denominador do valor renda}
   S_x_aa,    { soma }
   // Funções de Morte
   M_x_aa,    { numerador do valor do seguro contra morte}
   C_x_aa,    { denominador do valor do seguro contra morte}
   R_x_aa,    { soma}
   // Funções de Sobrevivência
   N_x_ii,    { numerador do valor renda}
   D_x_ii,    { denominador do valor renda}
   S_x_ii,    { soma }
   // Funções de Morte
   M_x_ii,    { numerador do valor do seguro contra morte}
   C_x_ii,    { denominador do valor do seguro contra morte}
   R_x_ii     { soma}

            : tabua;

  Tabua_Serv : TList; {Tabela com valores calculados}

 {Definição de variáveis auxiliares}
 w_idade_maxima, w_idade_minima,
 w_idade_ini_MortGeral, w_idade_fim_MortGeral,
 w_idade_ini_Invalidez, w_idade_fim_Invalidez,
 w_idade_ini_EntradaInv,w_idade_fim_EntradaInv : integer;


implementation
uses
 uDtMdlSat, uFuncGerais;

{Cálculo da tábua de Serviços-------------------------------------}

function  calcula_tabua_servico
                                  (p_sq_tabua_mortalidade  : integer;
                                   p_sq_tabua_invalidez    : integer;
                                   p_sq_tabua_EntrInvalidez: integer;
                                   p_idade_lim_inferior : integer;
                                   p_idade_lim_superior : integer;
                                   p_taxa : real)

            :  Tlist;

var

 w_i, w_j : integer;
 v, d     : real;

begin

   {Inicializa tabela interna para cálculo da tábua de serviço}


    for w_i := 0 to 150 do
     begin
      l_x     [w_i] := 0.00;
      p_x     [w_i] := 0.00;
      q_x     [w_i] := 0.00;
      p_x_aa  [w_i] := 0.00;
      q_x_aa  [w_i] := 0.00;
      p_x_ai  [w_i] := 0.00;
      q_x_ai  [w_i] := 0.00;
      p_x_a   [w_i] := 0.00;
      q_x_a   [w_i] := 0.00;
      i_x     [w_i] := 0.00;
      p_x_i   [w_i] := 0.00;
      q_x_i   [w_i] := 0.00;
      l_x_aa  [w_i] := 0.00;
     ll_x_aa  [w_i] := 0.00;
      l_x_ii  [w_i] := 0.00;
      N_x     [w_i] := 0.00;
      D_x     [w_i] := 0.00;
      S_x     [w_i] := 0.00;
      M_x     [w_i] := 0.00;
      C_x     [w_i] := 0.00;
      R_x     [w_i] := 0.00;
      N_x_aa  [w_i] := 0.00;
      D_x_aa  [w_i] := 0.00;
      S_x_aa  [w_i] := 0.00;
      M_x_aa  [w_i] := 0.00;
      C_x_aa  [w_i] := 0.00;
      R_x_aa  [w_i] := 0.00;
      N_x_ii  [w_i] := 0.00;
      D_x_ii  [w_i] := 0.00;
      S_x_ii  [w_i] := 0.00;
      M_x_ii  [w_i] := 0.00;
      C_x_ii  [w_i] := 0.00;
      R_x_ii  [w_i] := 0.00;

     end;

    w_idade_ini_Invalidez := 0;
    w_idade_ini_EntradaInv:= 0;
    w_idade_fim_Invalidez := 0;
    w_idade_fim_EntradaInv:= 0;


   {Carga da Tábua de Mortalidade}
   CargaTabMortalidade(p_sq_tabua_mortalidade);

   {Carga da Tábua de Mortalidade em Invalidez}
   if p_sq_tabua_invalidez <> -1 then
      CargaTabInvalidez(p_sq_tabua_invalidez);

   {Carga da Tábua de Entrada em Invalidez}
   if p_sq_tabua_EntrInvalidez <> -1 then
      CargaTabEntradaInvalidez(p_sq_tabua_EntrInvalidez);

    {Apura idade mínima}

    w_idade_minima := w_idade_ini_MortGeral;

    if (p_sq_tabua_invalidez     = -1) and
       (p_sq_tabua_EntrInvalidez = -1) then
      else
      begin

       if w_idade_ini_Invalidez < w_idade_minima then
          w_idade_minima := w_idade_ini_Invalidez;

       if w_idade_ini_EntradaInv < w_idade_minima then
          w_idade_minima := w_idade_ini_EntradaInv;
      end;

   {Apura idade máxima}

    w_idade_maxima := w_idade_fim_MortGeral;

    if (p_sq_tabua_invalidez     = -1) and
       (p_sq_tabua_EntrInvalidez = -1) then
      else
      begin

       if w_idade_fim_Invalidez < w_idade_maxima then
          w_idade_maxima := w_idade_fim_Invalidez;

       if w_idade_fim_EntradaInv < w_idade_maxima then
          w_idade_maxima := w_idade_fim_EntradaInv;

      end;

   {Cálculo dos Inválidos}
   if (w_idade_ini_invalidez = 0) and
      (w_idade_fim_invalidez = 0) then
    else
      CalculoInvalidos;


   {Monta ll_x_aa -> número de válidos sobreviventes a cada idade,
                     provenientes do grupo inicial l_x }
    if (w_idade_ini_invalidez = 0) and
      (w_idade_fim_invalidez = 0) then
    else
      Montall_x_aa (p_idade_lim_inferior, p_idade_lim_superior);

  {Montagem da tabela de comutação}

    v := (1 / (1 + p_taxa)); {fator de redução do valor atual}
    d := 1.00000000 - v;     {fator de desconto}

               {  OBS: Número de pessoas que faleceram entre as idades x e x+1
                       -> ll_x_aa[w_i] - ll_x_aa[w_i+1] }

    for w_i := w_idade_minima to w_idade_maxima do
      begin
       D_x[w_i]    :=   l_x[w_i]    * y_x (v, w_i);
       C_x[w_i]    :=  (l_x[w_i]    - l_x[w_i+1])    * y_x (v, w_i+1);
       D_x_aa[w_i] :=  ll_x_aa[w_i] * y_x (v, w_i);
       C_x_aa[w_i] := (ll_x_aa[w_i] - ll_x_aa[w_i+1]) * y_x (v, w_i+1);
       D_x_ii[w_i] :=   l_x_ii[w_i] * y_x (v, w_i);
       if (l_x_ii[w_i] - l_x_ii[w_i+1]) > 0.00 then
          C_x_ii[w_i] :=  (l_x_ii[w_i] - l_x_ii[w_i+1]) * y_x (v, w_i+1);
      end;

    N_x[w_idade_maxima] := D_x[w_idade_maxima];
    M_x[w_idade_maxima] := C_x[w_idade_maxima];
    N_x_aa[w_idade_maxima] := D_x_aa[w_idade_maxima];
    M_x_aa[w_idade_maxima] := C_x_aa[w_idade_maxima];
    N_x_ii[w_idade_maxima] := D_x_ii[w_idade_maxima];
    M_x_ii[w_idade_maxima] := C_x_ii[w_idade_maxima];

    for w_i := (w_idade_maxima - 1) downto w_idade_minima do
      begin
       N_x[w_i] := N_x[w_i+1] + D_x[w_i];
       M_x[w_i] := M_x[w_i+1] + C_x[w_i];
       N_x_aa[w_i] := N_x_aa[w_i+1] + D_x_aa[w_i];
       M_x_aa[w_i] := M_x_aa[w_i+1] + C_x_aa[w_i];
       N_x_ii[w_i] := N_x_ii[w_i+1] + D_x_ii[w_i];
       M_x_ii[w_i] := M_x_ii[w_i+1] + C_x_ii[w_i];
      end;

    S_x[w_idade_maxima] := N_x[w_idade_maxima];
    R_x[w_idade_maxima] := N_x[w_idade_maxima] - (d * S_x[w_idade_maxima]);
    S_x_aa[w_idade_maxima] := N_x_aa[w_idade_maxima];
    R_x_aa[w_idade_maxima] := N_x_aa[w_idade_maxima] - (d * S_x_aa[w_idade_maxima]);
    S_x_ii[w_idade_maxima] := N_x_ii[w_idade_maxima];
    R_x_ii[w_idade_maxima] := N_x_ii[w_idade_maxima] - (d * S_x_ii[w_idade_maxima]);

    for w_i := (w_idade_maxima - 1) downto w_idade_minima do
      begin
       S_x[w_i] := S_x[w_i+1] + N_x[w_i];
       R_x[w_i] := N_x[w_i]   - (d * S_x[w_i]);
       S_x_aa[w_i] := S_x_aa[w_i+1] + N_x_aa[w_i];
       R_x_aa[w_i] := N_x_aa[w_i]   - (d * S_x_aa[w_i]);
       S_x_ii[w_i] := S_x_ii[w_i+1] + N_x_ii[w_i];
       R_x_ii[w_i] := N_x_ii[w_i]   - (d * S_x_ii[w_i]);
       if R_x_ii[w_i] > 0.00 then
        else  R_x_ii[w_i] := 0.00;
      end;

  { Alimenta tabua final }

   Gera_tab_servico;
   calcula_tabua_servico := tabua_serv;

end;

{-------------------------------------------------------------------}
{Carga da tábua de Mortalidade em Invalidez}
Procedure CargaTabMortalidade (p_sq_tabua_mortalidade : integer);
begin

   DtMdlSat.wwQryOcorrTabua.close;
   DtMdlSat.wwQryOcorrTabua.ParamByName('ir_dominio_sistema').asstring := 'MRT';
   DtMdlSat.wwQryOcorrTabua.ParamByName('cd_tabua').asinteger := p_sq_tabua_mortalidade;
   DtMdlSat.wwQryOcorrTabua.open;

   if DtMdlSat.wwQryOcorrTabua.recordcount = 0 then
      Raise Exception.create
        ('Ocorrências da Tábua de Mortalidade Geral não cadastrada');

   w_idade_ini_MortGeral := DtMdlSat.wwQryOcorrTabuanr_idade.asinteger;

   while not DtMdlSat.wwQryOcorrTabua.eof do
     begin

      w_idade_fim_MortGeral          := DtMdlSat.wwQryOcorrTabuanr_idade.asinteger;

      p_x    [w_idade_fim_MortGeral] := DtMdlSat.wwQryOcorrTabuanr_p_x.asfloat;;
      q_x    [w_idade_fim_MortGeral] := 1 - p_x    [w_idade_fim_MortGeral];

      l_x    [w_idade_fim_MortGeral] := DtMdlSat.wwQryOcorrTabuanr_l_x.asfloat;

      DtMdlSat.wwQryOcorrTabua.next;

     end;

end;
{-------------------------------------------------------------------}
{Carga da tábua de Mortalidade em Invalidez}
Procedure CargaTabInvalidez (p_sq_tabua_invalidez : integer);
begin

   DtMdlSat.wwQryOcorrTabua.close;
   DtMdlSat.wwQryOcorrTabua.ParamByName('ir_dominio_sistema').asstring := 'INV';
   DtMdlSat.wwQryOcorrTabua.ParamByName('cd_tabua').asinteger := p_sq_tabua_invalidez;
   DtMdlSat.wwQryOcorrTabua.open;

   if DtMdlSat.wwQryOcorrTabua.recordcount = 0 then
      Raise Exception.create
        ('Ocorrências da Tábua de Invalidez não cadastrada');

   w_idade_ini_Invalidez := DtMdlSat.wwQryOcorrTabuanr_idade.asinteger;

   while not DtMdlSat.wwQryOcorrTabua.eof do
     begin

      w_idade_fim_Invalidez         := DtMdlSat.wwQryOcorrTabuanr_idade.asinteger;
      q_x_i [w_idade_fim_Invalidez] := DtMdlSat.wwQryOcorrTabuanr_q_x.asfloat;
      p_x_i [w_idade_fim_Invalidez] := 1 - q_x_i [w_idade_fim_Invalidez];

      DtMdlSat.wwQryOcorrTabua.next;

     end;

end;

{-------------------------------------------------------------------}
{Carga da tábua de Entrada em Invalidez}
Procedure CargaTabEntradaInvalidez(p_sq_tabua_EntrInvalidez : integer);

begin

   DtMdlSat.wwQryOcorrTabua.close;
   DtMdlSat.wwQryOcorrTabua.ParamByName('ir_dominio_sistema').asstring := 'EIN';
   DtMdlSat.wwQryOcorrTabua.ParamByName('cd_tabua').asinteger := p_sq_tabua_EntrInvalidez;
   DtMdlSat.wwQryOcorrTabua.open;

   if DtMdlSat.wwQryOcorrTabua.recordcount = 0 then
      Raise Exception.create
        ('Ocorrências da Tábua de Entrada em Invalidez não cadastrada');

   w_idade_ini_EntradaInv := DtMdlSat.wwQryOcorrTabuanr_idade.asinteger;

   while not DtMdlSat.wwQryOcorrTabua.eof do
     begin

      w_idade_fim_EntradaInv      := DtMdlSat.wwQryOcorrTabuanr_idade.asinteger;
      i_x [w_idade_fim_EntradaInv]:= DtMdlSat.wwQryOcorrTabuanr_i_x.asfloat;

      DtMdlSat.wwQryOcorrTabua.next;

     end;
end;
{-------------------------------------------------------------------}
{Cálculo dos Inválidos}
Procedure CalculoInvalidos;
var
  w_i : integer;

begin

   for w_i := w_idade_ini_invalidez to w_idade_fim_invalidez do
     begin

      p_x_a  [w_i] := p_x [w_i];
      q_x_a  [w_i] := q_x [w_i];

     {probabilidade que tem uma pessoa de idade x tornar-se inválida
      no ano e continuar viva}
      p_x_ai[w_i] := i_x[w_i] * (1 - (q_x_i[w_i] / 2));

     {probabilidade que tem uma pessoa de idade x tornar-se inválida
      no ano e morrer no mesmo ano}
      q_x_ai[w_i] := i_x[w_i] - p_x_ai[w_i];

     {probabilidade que tem uma pessoa de idade x viver até o final do
      ano sem tornar-se inválida - taxa de sobrevivência dos ativos}
      p_x_aa[w_i] := p_x_a[w_i] - p_x_ai[w_i];

     {probabilidade que tem uma pessoa de idade x morrer sem se tornar
      inválida - taxa de mortalidade dos ativos}
      q_x_aa[w_i] := 1 - p_x_aa[w_i];

     {cálculo de ativos e inválidos }
      if w_idade_ini_Invalidez = w_i then
       begin
        // Ativos
        l_x_aa[w_i] := l_x[w_i];
        // Invalidos
        l_x_ii[w_i] := 0;
       end

      else

       begin
        // Ativos
        l_x_aa[w_i] := l_x_aa[w_i - 1] *
                      (1 - (q_x_aa[w_i - 1] + i_x[w_i]));
        // Inválidos
        l_x_ii[w_i] := l_x_ii[w_i - 1] * (1 - (q_x_i[w_i - 1])) +
                       l_x_aa[w_i - 1] * p_x_ai[w_i - 1];

       end;

   end;

end;

{-------------------------------------------------------------------}
{Monta ll_x_aa -> número de válidos sobreviventes a cada idade}
Procedure Montall_x_aa (p_idade_lim_inferior, p_idade_lim_superior : integer);
var
 w_i : integer;

begin

  {Montagem da tábua de Serviço - a partir de l_x ):

     ll_x_aa (j)-->
       Da  idade mínima  a 17 anos -> l_x (tab. Mortalidade geral)
       De  18 a 69 anos  = l_x_aa calculado
       De  70 a idade máxima --> l_x_aa * p_x (tab. Mortalidade geral)
     }

   for w_i := w_idade_minima to (w_idade_maxima - 1) do
     begin

       if w_i <= p_idade_lim_inferior then
          ll_x_aa[w_i] := l_x[w_i]
       else
       if w_i <= p_idade_lim_superior then
          ll_x_aa[w_i] := l_x_aa[w_i]
       else
          ll_x_aa[w_i] := l_x_aa[w_i-1] * p_x_aa[w_i];

     end;

end;

{-------------------------------------------------------------------}
{Gera Tabela de Serviço - final}
Procedure Gera_tab_servico;

var
   w_j, w_i : Integer;
   reg_tabua_Servico : Treg_tabua_Servico;

begin

    tabua_serv := TList.Create; {Cria a tabela de servico}
    tabua_serv.Capacity := w_idade_maxima;  {Configura tamanho da tabela}

    {Inicializa tabela }
    for w_i := w_idade_minima to (w_idade_maxima ) do
     begin
       tabua_serv.Add(Treg_tabua_Servico.Create);
     end;

   {Alimenta tabela calculada}
   for w_i := 0 to (w_idade_maxima - w_idade_minima) do
     begin

      w_j := w_i + w_idade_minima;
      reg_tabua_Servico := tabua_serv.items[w_i];
      reg_tabua_Servico.idade  :=  w_j;
      reg_tabua_Servico.l_x    :=  l_x    [w_j];
      reg_tabua_Servico.p_x    :=  p_x    [w_j];
      reg_tabua_Servico.q_x    :=  q_x    [w_j];
      reg_tabua_Servico.p_x_aa :=  p_x_aa [w_j];
      reg_tabua_Servico.q_x_aa :=  q_x_aa [w_j];
      reg_tabua_Servico.p_x_ai :=  p_x_ai [w_j];
      reg_tabua_Servico.q_x_ai :=  q_x_ai [w_j];
      reg_tabua_Servico.p_x_a  :=  p_x_a  [w_j];
      reg_tabua_Servico.q_x_a  :=  q_x_a  [w_j];
      reg_tabua_Servico.i_x    :=  i_x    [w_j];
      reg_tabua_Servico.p_x_i  :=  p_x_i  [w_j];
      reg_tabua_Servico.q_x_i  :=  q_x_i  [w_j];
      reg_tabua_Servico.l_x_aa :=  l_x_aa [w_j];
      reg_tabua_Servico.ll_x_aa:=  ll_x_aa[w_j];
      reg_tabua_Servico.l_x_ii :=  l_x_ii [w_j];
      reg_tabua_Servico.N_x    :=  N_x    [w_j];
      reg_tabua_Servico.D_x    :=  D_x    [w_j];
      reg_tabua_Servico.S_x    :=  S_x    [w_j];
      reg_tabua_Servico.C_x    :=  C_x    [w_j];
      reg_tabua_Servico.M_x    :=  M_x    [w_j];
      reg_tabua_Servico.R_x    :=  R_x    [w_j];
      reg_tabua_Servico.N_x_aa :=  N_x_aa [w_j];
      reg_tabua_Servico.D_x_aa :=  D_x_aa [w_j];
      reg_tabua_Servico.S_x_aa :=  S_x_aa [w_j];
      reg_tabua_Servico.C_x_aa :=  C_x_aa [w_j];
      reg_tabua_Servico.M_x_aa :=  M_x_aa [w_j];
      reg_tabua_Servico.R_x_aa :=  R_x_aa [w_j];
      reg_tabua_Servico.N_x_ii :=  N_x_ii [w_j];
      reg_tabua_Servico.D_x_ii :=  D_x_ii [w_j];
      reg_tabua_Servico.S_x_ii :=  S_x_ii [w_j];
      reg_tabua_Servico.C_x_ii :=  C_x_ii [w_j];
      reg_tabua_Servico.M_x_ii :=  M_x_ii [w_j];
      reg_tabua_Servico.R_x_ii :=  R_x_ii [w_j];

    end;

end;

end.
