unit uBuilderQuery;

interface

Uses Classes, stdctrls, sysutils, dbtables, db, ufuncgerais,Dialogs;

Type

  TBuilderQuery = Class
    Private

      //-- Listas de tabelas com seus atributos
      FQuery            : TQuery;
      Ftabelas          : TStringList;
      FtabelasSelec     : TStringList;
      FtabelasJuncao    : TStringList;
      FatributoCondicao : TStringList;
      FcomplCondicaoSQL : TStringList;
      Fsintaxe          : tmemo;
      w_param           : boolean;
      w_params          : tstringlist;

      {Carrega tabelas que serão utilizadas para montagem da query }
      procedure Carrega_Tabelas;
      {Identifica os atributos da condição}
      procedure identifica_atributos (Condicao : tmemo);
      {Monta sintaxe da query a partir de um CONIÇÃO}
      function Monta_Sintaxe (Condicao : tmemo) : tquery;
      {Monta sintaxe da query a partir de um CAMPO DA BASE}
      function Monta_Sintaxe_base (Condicao : tmemo) : tquery;
      {verifica se já exite junção carregada}
      function Verifica_Juncao (w_chave_princ, w_chave : string) : boolean;
      {Seta complemento para Entidade/Patrocinadora/Plano de Benefício}
      procedure ComplCondicao (w_tipo_query : integer; w_tabela : string);
      {Retira da condição o alias <tabela>[...] }
      function FormataCondicao (Condicao : string) : string;
      {Verifica caminho a partir dos relacionamentos Fk }
      function  VerificaRelac
                 (w_no_tabela_orig, w_no_atributo_tabela_orig,
                  w_no_tabela_dest, w_no_atributo_tabela_dest : string) : boolean;
      {Verifica caminho a partir das ramificações de cada tabela do
       caminho percorrido apontado pelas Fk }
      function  VerificaRamif
                (w_no_tabela_orig, w_no_atributo_tabela_orig,
                 w_no_tabela_dest, w_no_atributo_tabela_dest : string) : boolean;
      {Formata data valida para bd}
      function  DataToChar(sqltext : string)  : string;

    Public

     {Montagem da query a partir da condição solicitada }
      function  Monta_Query  (w_tipo_query : integer;
                              Condicao : tmemo) : tquery;

      //-- Create e Destroy da Classe
      Constructor Create (AOWner : TComponent);
      Destructor  Destroy; override;

end;

implementation
uses
   uDtMdlSat,  uglobal;

{---------------------------------------------------------------------}
{ Cronstructor e Destroy da Classe }
Constructor TBuilderQuery.Create (AOWner : TComponent);

Begin
     Inherited Create;

     Ftabelas          := TStringList.Create;
     FtabelasSelec     := TStringList.Create;
     FtabelasJuncao    := TStringList.Create;
     FAtributoCondicao := TStringList.Create;
     FComplCondicaoSQL := TStringList.Create;
     w_params          := TStringList.Create;
     Fsintaxe          := tmemo.create(AOwner);
     FQuery            := TQuery.create(AOwner);


End;

Destructor TBuilderQuery.Destroy;
Begin

  Ftabelas.free;
  FtabelasSelec.free;
  FtabelasJuncao.free;
  FAtributoCondicao.free;
  FComplCondicaoSQL.free;
  w_params.Free;
  Fsintaxe.Free;
  FQuery.free;

  Inherited Destroy;

End;

{---------------------------------------------------------------------}
{ Carrega tabelas que serão utilizadas para montagem da query }
procedure TBuilderQuery.Carrega_Tabelas;

begin

  {Recupera tabela disponiveis com seru atributos}
   DtMdlSat.wwQryAtributoTabelas.close;
   DtMdlSat.wwQryAtributoTabelas.open;

   if DtMdlSat.wwQryAtributoTabelas.recordcount = 0 then
     Raise Exception.create
     ('Falta cadastrar no sistema estrutura das tabelas');

  { Carrega atributos chave primaria na lista Ftabelas }

  while not DtMdlSat.wwQryAtributoTabelas.eof do
    begin

     if Ftabelas.indexof (DtMdlSat.wwQryAtributoTabelasno_tabela.asstring) = -1 then
        Ftabelas.add(DtMdlSat.wwQryAtributoTabelasNO_TABELA.asstring);

     DtMdlSat.wwQryAtributoTabelas.next;
    end;

end;

{---------------------------------------------------------------------}
{Montagem da query a partir da condição solicitada }
function  TBuilderQuery.Monta_Query  (w_tipo_query : integer;
                                      Condicao : tmemo) : tquery;

begin

  if Condicao.Lines.Count = 0 then
   begin
//RCM 24-Mai-2005 --     MessageDlg('Falta informar condição do participante para montagem da query',
//RCM 24-Mai-2005 --        mtWarning, [mbOk], 0);
     Exit;
   end;

  {Carrega tabelas disponíveis para monta a condição}
  Carrega_Tabelas;

  {Identifica atributos da condição solicitada}
  Identifica_atributos (Condicao);

  {Monta estrutura sintática da query}
  if w_tipo_query = 1 then
     //-- monta query a partir de uma CONDIÇÃO
     Monta_Query := Monta_Sintaxe (Condicao)
  else
     //-- monta que a partir de um CAPO DA BASE
     Monta_Query := Monta_Sintaxe_Base (Condicao);
 

end;

{---------------------------------------------------------------------}
{Identifica os atributos da condição}
procedure TBuilderQuery.identifica_atributos (Condicao : tmemo);
var
 w_pos : integer;
 w_nome_tabela : string;
 w_string      : string;
 w_ind_ch : integer;

begin

  FtabelasSelec.clear;

 {Identifica tabelas utilizadas na CONDIÇÃO}
  w_string := Condicao.text;

  while Pos('.', w_string) > 0 do
    w_string[Pos('.', w_string)] := ' ';

  while Pos('[', w_string) > 0 do
    w_string[Pos('[', w_string)] := ' ';

  while Pos(']', w_string) > 0 do
    w_string[Pos(']', w_string)] := ' ';

  while w_string <> '' do
   begin

     w_nome_tabela := str_delimSB(w_string, ' ');

     w_ind_ch := Ftabelas.indexof (w_nome_tabela);
     if w_ind_ch <> -1 then
       if FtabelasSelec.indexof (w_nome_tabela) = -1 then
        FtabelasSelec.add(w_nome_tabela);

     w_pos := pos(' ', w_string) + 1;
     if w_pos <= 0 then w_pos := 1;
     w_string := copy (w_string, w_pos,
                       length(w_string) - length(w_nome_tabela));

   end;

   FtabelasSelec.sort;

end;

{---------------------------------------------------------------------}
{Monta sintaxe da query a partir de uma CONDIÇÃO                      }
{---------------------------------------------------------------------}
function TBuilderQuery.Monta_Sintaxe (Condicao : tmemo) : tquery;
var
 w_condicao_form, w_chave_princ, w_chave : string;
 w_pos, w_i, w_j : integer;
 w_str, w_str_params : string;

begin
   FQuery.close;
   FQuery.DataBaseName := 'BaseDados';

   FQuery.SQL.Clear;

   FQuery.SQL.add('Select 1 from ');

  {Insere tabelas na query}
   FtabelasJuncao.clear;
   FComplCondicaoSQL.clear;
   w_param := false;

  {Insere tabelas selecionadas na query}
  for w_i := 0 to FtabelasSelec.count - 1 do
    if w_i = 0 then
       FQuery.SQL.Add(FtabelasSelec[w_i]+ ' ' + FtabelasSelec[w_i])
    else
       FQuery.SQL.Add(' , ' + FtabelasSelec[w_i]+ ' ' + FtabelasSelec[w_i]);

   FQuery.SQL.Add('where ');

  {Identifica Junções}

   DtMdlSat.wwQryPkTabela.close;
   DtMdlSat.wwQryPkTabela.open;

   if DtMdlSat.wwQryPkTabela.recordcount = 0 then
     Raise Exception.create
     ('Falta cadastrar no sistema chaves primarias / estrangeiras para as tabelas');

   while not DtMdlSat.wwQryPkTabela.eof do
     begin

      //-- Verifica se é tabela selecionada na condição
      if FtabelasSelec.indexof (DtMdlSat.wwQryPkTabelano_tabela.asstring) = -1 then
        begin
          DtMdlSat.wwQryPkTabela.next;
          continue;
        end;

      w_chave_princ := trim(DtMdlSat.wwQryPkTabelano_tabela.asstring) + '.' + (DtMdlSat.wwQryPkTabelano_atributo_tabela.asstring);

      //-- Combina atributo com outras tabelas selecionadas
      for w_j := 0 to FtabelasSelec.count - 1 do
       begin

        if trim(DtMdlSat.wwQryPkTabelano_tabela.asstring) = trim(FtabelasSelec[w_j]) then
           continue;

        DtMdlSat.wwQryPkTabelaSel.close;
        DtMdlSat.wwQryPkTabelaSel.parambyname('no_tabela').asstring
                  := trim(FtabelasSelec[w_j]);
        DtMdlSat.wwQryPkTabelaSel.open;

        while not DtMdlSat.wwQryPkTabelaSel.eof do
         begin

         //-- verifica chaves
         w_chave := trim(FtabelasSelec[w_j]) + '.'
                  + trim(DtMdlSat.wwQryPkTabelaSelno_atributo_tabela.asstring);

         //-- Verifica se combinação de chaves são diferentes
         if w_chave_princ <> w_chave then
           begin

            //-- Verifica relacionamento
            if VerificaRelac(DtMdlSat.wwQryPkTabelano_tabela.asstring,
                          DtMdlSat.wwQryPkTabelano_atributo_tabela.asstring,
                          FtabelasSelec[w_j],
                          DtMdlSat.wwQryPkTabelaSelno_atributo_tabela.asstring)
            then
            else
              begin
               DtMdlSat.wwQryPkTabelaSel.next;
               continue;
              end;

             //-- Verifica se já exite chave na junção
              if not Verifica_Juncao (w_chave_princ, w_chave) then
             //-- Inclui junção
                begin
                 FtabelasJuncao.add (w_chave_princ + ' = ' + w_chave);
                 //-- Seta complemento para Entidade/Patrocinadora/Plano
                 ComplCondicao (1, DtMdlSat.wwQryPkTabelano_tabela.asstring);
                 ComplCondicao (1, FtabelasSelec[w_j]);
                 break; //-------------------------------------------
                end; {if not}
           end; {if}

          DtMdlSat.wwQryPkTabelaSel.next;

         end; {while}
       end; {for}

     DtMdlSat.wwQryPkTabela.next;

    end; {while}

   { Gera condição para variáveis globais caso não tenha
     sido gerado nenhuma junção.}

   if FtabelasJuncao.Count > 0 then
   else
      for w_i := 0 to FtabelasSelec.count - 1 do
        //-- Seta complemento para Entidade/Patrocinadora/Plano
        ComplCondicao (1, FtabelasSelec[w_i]);


  {Insere junção (comparação) entre chaves de tabelas na query}
   if Condicao.Lines.Count > 0 then
     for w_i := 0 to FtabelasJuncao.count - 1 do
       if w_i = 0   then
          FQuery.SQL.Add(FtabelasJuncao[w_i])
       else
          FQuery.SQL.Add(' and ' + FtabelasJuncao[w_i]);

 {Insere condição informada}

  //-- Formata data valida para bd

  w_condicao_form := DataToChar (Condicao.text);

  //-- Retira da condição o alias <tabela>[...]

  w_condicao_form := FormataCondicao (w_condicao_form);
  //w_condicao_form := FormataCondicao (Condicao.text);


  if FtabelasJuncao.count > 0 then
      FQuery.SQL.Add(' and ' + w_condicao_form)
  else
      FQuery.SQL.Add(w_condicao_form);


  {Valida query}
  try
    FQuery.Active := true;
  except
    Raise Exception.Create
     ('Erro na sintaxe da condição desejada. Favor Corrigir');
  end;

 {Insere condição com parâmetros}

  w_str_params := '';

  for w_i := 0 to FComplCondicaoSQL.count - 1 do
    begin

      if (w_i = 0) and
         (FtabelasJuncao.count = 0) and
         (w_condicao_form = '')     then
        begin
         w_pos := Pos('and', FComplCondicaoSQL[w_i]);
         w_str := FComplCondicaoSQL[w_i];
         w_str[w_pos ] := ' ';
         w_str[w_pos +1] := ' ';
         w_str[w_pos +2] := ' ';
         FComplCondicaoSQL[w_i]:= w_str;
        end;

        FQuery.SQL.Add(FComplCondicaoSQL[w_i]);
        w_str_params := w_str_params + FComplCondicaoSQL[w_i];

    end;

  {Retorna query validada}
  Monta_Sintaxe :=  FQuery;

end;

{---------------------------------------------------------------------}
{Monta sintaxe da query a partir de um CAMPO DA BASE}
function TBuilderQuery.Monta_Sintaxe_base (Condicao : tmemo) : tquery;
var
 w_pos, w_i, w_j : integer;
 w_condicao_form, w_str, w_chave_princ, w_chave : string;
 w_str_params : string;

begin

  FQuery.close;
  FQuery.DataBaseName := 'BaseDados';

  if pos ('[', Condicao.Lines.Text) > 0 then
     w_condicao_form := copy ( Condicao.Lines.Text, 1 , pos ('and', Condicao.Lines.Text)-1)
  else
     w_condicao_form := Condicao.Lines.Text;

  if Trim(w_condicao_form) = 'FI_VALOR_PARTICIPANTE.CD_TIPO_VALOR' then
    w_condicao_form := 'FI_VALOR_PARTICIPANTE.VL_PARTICIPANTE '
  else if Trim(w_condicao_form) = 'FI_VALOR_BENEFICIARIO.CD_TIPO_VALOR' then
    w_condicao_form := 'FI_VALOR_BENEFICIARIO.VL_PARTICIPANTE ';

  FQuery.SQL.Clear;
  FQuery.SQL.Add ('Select ' + w_condicao_form  + ' from ');

  if pos ('[', Condicao.Lines.Text) > 0 then
     w_condicao_form := copy ( Condicao.Lines.Text, pos ('and', Condicao.Lines.Text)+3,
                               length(Condicao.Lines.Text)-pos('and', Condicao.Lines.Text)+3)
  else
     w_condicao_form := '';

  {Insere tabelas na query}
  FtabelasJuncao.clear;
  FComplCondicaoSQL.clear;
  w_param := false;

  {Insere tabelas selecionadas na query}
  for w_i := 0 to FtabelasSelec.count - 1 do
    if w_i = 0 then
      FQuery.SQL.Add(trim(FtabelasSelec[w_i])+ ' ' + trim(FtabelasSelec[w_i]))
    else
      FQuery.SQL.Add(' , ' + trim(FtabelasSelec[w_i])+ ' ' + (FtabelasSelec[w_i]));

   if w_condicao_form <> '' then
       FQuery.SQL.Add(' where ');

  {Identifica Junções}

   DtMdlSat.wwQryPkTabela.close;
   DtMdlSat.wwQryPkTabela.open;

   if DtMdlSat.wwQryPkTabela.recordcount = 0 then
     Raise Exception.create
     ('Falta cadastrar no sistema chaves primarias / estrangeiras para as tabelas');

   while not DtMdlSat.wwQryPkTabela.eof do
     begin

      //-- Verifica se é tabela selecionada na condição
      if FtabelasSelec.indexof (trim(DtMdlSat.wwQryPkTabelano_tabela.asstring)) = -1 then
        begin
          DtMdlSat.wwQryPkTabela.next;
          continue;
        end;

      w_chave_princ := trim(DtMdlSat.wwQryPkTabelano_tabela.asstring) + '.' + trim(DtMdlSat.wwQryPkTabelano_atributo_tabela.asstring);

      //-- Combina atributo com outras tabelas selecionadas
      for w_j := 0 to FtabelasSelec.count - 1 do
       begin

        if trim(DtMdlSat.wwQryPkTabelano_tabela.asstring) = trim(FtabelasSelec[w_j]) then
           continue;

        DtMdlSat.wwQryPkTabelaSel.close;
        DtMdlSat.wwQryPkTabelaSel.parambyname('no_tabela').asstring
                  := trim(FtabelasSelec[w_j]);
        DtMdlSat.wwQryPkTabelaSel.open;

        while not DtMdlSat.wwQryPkTabelaSel.eof do
         begin

         //-- verifica chaves
         w_chave := trim(FtabelasSelec[w_j]) + '.'
                  + trim(DtMdlSat.wwQryPkTabelaSelno_atributo_tabela.asstring);

         //-- Verifica se combinação de chaves são diferentes
         if w_chave_princ <> w_chave then
           begin

            //-- Verifica relacionamento
            if VerificaRelac(DtMdlSat.wwQryPkTabelano_tabela.asstring,
                          DtMdlSat.wwQryPkTabelano_atributo_tabela.asstring,
                          FtabelasSelec[w_j],
                          DtMdlSat.wwQryPkTabelaSelno_atributo_tabela.asstring)
            then
            else
              begin
               DtMdlSat.wwQryPkTabelaSel.next;
               continue;
              end;

             //-- Verifica se já exite chave na junção
              if not Verifica_Juncao (w_chave_princ, w_chave) then
             //-- Inclui junção
                begin
                 FtabelasJuncao.add (w_chave_princ + ' = ' + w_chave);
                 //-- Seta complemento para Entidade/Patrocinadora/Plano
                 ComplCondicao (2, DtMdlSat.wwQryPkTabelano_tabela.asstring);
                 ComplCondicao (2, FtabelasSelec[w_j]);
                 break; //-------------------------------------------
                end; {if not}
           end; {if}

          DtMdlSat.wwQryPkTabelaSel.next;

         end; {while}
       end; {for}

     DtMdlSat.wwQryPkTabela.next;

    end; {while}

   { Gera condição para variáveis globais caso não tenha
     sido gerado nenhuma junção.}

   if FtabelasJuncao.Count > 0 then
   else
      for w_i := 0 to FtabelasSelec.count - 1 do
        //-- Seta complemento para Entidade/Patrocinadora/Plano
        ComplCondicao (2, FtabelasSelec[w_i]);


  {Insere junção (comparação) entre chaves de tabelas na query}
   if w_condicao_form <> '' then
     for w_i := 0 to FtabelasJuncao.count - 1 do
       if w_i = 0   then
        begin
         FQuery.SQL.Add(FtabelasJuncao[w_i]);
        end 
       else
         FQuery.SQL.Add(' and ' + FtabelasJuncao[w_i]);

   //-- Retira da condição o alias <tabela>[...]

   w_condicao_form := FormataCondicao (w_condicao_form);

   if FtabelasJuncao.count > 0 then
      FQuery.SQL.Add(' and ' + w_condicao_form)
   else
      FQuery.SQL.Add(w_condicao_form);

  {Valida query}
  try
    FQuery.Active := true;
  except
    Raise Exception.Create
     ('Erro na sintaxe da condição desejada. Favor Corrigir');
  end;

 {Insere condição de complemento }

  if w_condicao_form = '' then
     FQuery.SQL.Add(' where ');

  w_str_params := '';

  for w_i := 0 to FComplCondicaoSQL.count - 1 do
    begin

      if (w_i = 0) and
         (FtabelasJuncao.count = 0)    then
        begin
         w_pos := Pos('and', FComplCondicaoSQL[w_i]);
         w_str := FComplCondicaoSQL[w_i];
         w_str[w_pos ] := ' ';
         w_str[w_pos +1] := ' ';
         w_str[w_pos +2] := ' ';
         FComplCondicaoSQL[w_i]:= w_str;
        end;

       FQuery.SQL.Add(FComplCondicaoSQL[w_i]);
       w_str_params := w_str_params + FComplCondicaoSQL[w_i];

    end;

 {Retorna query validada}
  Monta_Sintaxe_base :=  FQuery;

end;

{---------------------------------------------------------------------}
{verifica se já exite junção carregada}
function TBuilderQuery.Verifica_Juncao (w_chave_princ, w_chave : string) : boolean;
var
  w_l : integer;

begin

  Verifica_Juncao := true;

  w_l := FtabelasJuncao.indexof (w_chave_princ + ' = ' + w_chave);
  if w_l <> -1 then
     exit;

  w_l := FtabelasJuncao.indexof (w_chave + ' = ' + w_chave_princ);
  if w_l <> -1 then
     exit;

  Verifica_Juncao := false;

end;

{---------------------------------------------------------------------}
{Retira da condição o alias <tabela>[...] }
function TBuilderQuery.FormataCondicao (Condicao : string) : string;
var
 w_pos : integer;

begin

  while pos('[', Condicao) > 0 do
   begin
    w_pos := pos('[', Condicao);

    //-- retira alias da condição
    while condicao[w_pos] <> ' ' do
     begin
       condicao[w_pos] := ' ';
       w_pos := w_pos - 1;

       if w_pos = 0 then
          break;

     end;

  end;

  while Pos(']', Condicao) > 0 do
        Condicao[Pos(']', Condicao)] := ' ';


  FormataCondicao := Condicao;

end;

{---------------------------------------------------------------------}
{Seta complemento para Entidade/Patrocinadora/Plano de Benefício}
procedure TBuilderQuery.ComplCondicao (w_tipo_query : integer; w_tabela : string);
var
  w_chave : string;


begin

   DtMdlSat.wwQryComplQuery.close;
   DtMdlSat.wwQryComplQuery.parambyname('no_tabela').asstring := trim(w_tabela);
   DtMdlSat.wwQryComplQuery.open;

   while not DtMdlSat.wwQryComplQuery.eof do
     begin

     w_chave := trim(DtMdlSat.wwQryComplQueryno_tabela.asstring) + '.' +
                trim(DtMdlSat.wwQryComplQueryno_atributo_tabela.asstring);

     //-- campo cd_versao
     if trim(DtMdlSat.wwQryComplQueryno_atributo_tabela.asstring) = 'CD_VERSAO' then
      if FComplCondicaoSQL.indexof(' and ' + w_chave + ' = :CD_VERSAO') = -1 then
         begin
           w_param := true;
           FComplCondicaoSQL.add(' and ' + w_chave + ' = :CD_VERSAO');
         end;

     //-- campo cd_partic
     if trim(DtMdlSat.wwQryComplQueryno_atributo_tabela.asstring) = 'CD_PARTIC' then
      if FComplCondicaoSQL.indexof(' and ' + w_chave + ' = :CD_PARTIC') = -1 then
         begin
           w_param := true;
           FComplCondicaoSQL.add(' and ' + w_chave + ' = :CD_PARTIC');
         end;

     //-- campo vl_calculo_atuarial
     if trim(DtMdlSat.wwQryComplQueryno_atributo_tabela.asstring) = 'VL_CALCULO_ATUARIAL' then
       begin
         // complementação a partir do CAMPO DA BASE
         w_chave := DtMdlSat.wwQryComplQueryno_tabela.asstring + '.' +
                   'DT_GERACAO';
         FComplCondicaoSQL.add(' and ' + w_chave + ' = :DT_GERACAO');
         w_chave := DtMdlSat.wwQryComplQueryno_tabela.asstring + '.' +
                   'NO_VARIAVEL';
         FComplCondicaoSQL.add(' and ' + w_chave + ' = :NO_VARIAVEL');
         w_param := true;
       end;


    DtMdlSat.wwQryComplQuery.next;

   end;

end;
{---------------------------------------------------------------------}
{Verifica caminho a partir dos relacionamentos Fk }
function  TBuilderQuery.VerificaRelac
                (w_no_tabela_orig, w_no_atributo_tabela_orig,
                 w_no_tabela_dest, w_no_atributo_tabela_dest : string) : boolean;

begin

    result := false;

    DtMdlSat.wwQryPkFkTabela.close;
    DtMdlSat.wwQryPkFkTabela.ParamByName('no_tabela').asstring := trim(w_no_tabela_orig);
    DtMdlSat.wwQryPkFkTabela.ParamByName('no_atributo_tabela').asstring := trim(w_no_atributo_tabela_orig);
    DtMdlSat.wwQryPkFkTabela.open;

    while not DtMdlSat.wwQryPkFkTabela.eof do
      begin

       if ((trim(DtMdlSat.wwQryPkFkTabelaNo_tabela.asstring) = trim(w_no_tabela_dest)) and
           (trim(DtMdlSat.wwQryPkFkTabelaNo_atributo_tabela.asstring) = trim(w_no_atributo_tabela_dest))) or
          ((trim(DtMdlSat.wwQryPkFkTabelaNo_tabela_fk.asstring) = trim(w_no_tabela_dest)) and
           (trim(DtMdlSat.wwQryPkFkTabelaNo_atributo_tabela_fk.asstring) = trim(w_no_atributo_tabela_dest)))
        then
           // ok - achou
           begin
             result := true;
             break;
           end;

       if trim(DtMdlSat.wwQryPkFkTabelaNo_tabela.asstring) = trim(w_no_tabela_dest) then
         begin
           DtMdlSat.wwQryPkFkTabela.next;
           continue;
         end;

       // -- verifica ramificações da foreing key
       if VerificaRamif (DtMdlSat.wwQryPkFkTabelaNo_tabela_fk.asstring,
                         DtMdlSat.wwQryPkFkTabelaNo_atributo_tabela_fk.asstring,
                         w_no_tabela_dest, w_no_atributo_tabela_dest)
       then
         begin
          result := true;
          exit;
        end;

      // -- testa se chegou a tabela primitiva
      if trim(DtMdlSat.wwQryPkFkTabelaNo_tabela_fk.asstring) = '' then
      else
        if VerificaRelac (DtMdlSat.wwQryPkFkTabelaNo_tabela_fk.asstring,
                        DtMdlSat.wwQryPkFkTabelaNo_atributo_tabela_fk.asstring,
                        w_no_tabela_dest, w_no_atributo_tabela_dest)
        then
           // ok - achou
           begin
             result := true;
             break;
           end;

      DtMdlSat.wwQryPkFkTabela.next;

    end;

end;
{-------------------------------------------------------------------}
{Verifica caminho a partir das ramificações de cada tabela do
 caminho percorrido apontado pelas Fk }
function  TBuilderQuery.VerificaRamif
                (w_no_tabela_orig, w_no_atributo_tabela_orig,
                 w_no_tabela_dest, w_no_atributo_tabela_dest : string) : boolean;
begin

    result := false;

    DtMdlSat.wwQryRamificacao.close;
    DtMdlSat.wwQryRamificacao.ParamByName('no_tabela_fk').asstring := trim(w_no_tabela_orig);
    DtMdlSat.wwQryRamificacao.ParamByName('no_tabela').asstring
                     := trim(DtMdlSat.wwQryPkFkTabelaNo_tabela.asstring);
    DtMdlSat.wwQryRamificacao.ParamByName('no_atributo_tabela_fk').asstring
                     := trim(DtMdlSat.wwQryPkFkTabelaNo_atributo_tabela_fk.asstring);
    DtMdlSat.wwQryRamificacao.open;

    while not DtMdlSat.wwQryRamificacao.eof do
      begin
       if (trim(DtMdlSat.wwQryRamificacaoNo_tabela.asstring) = trim(w_no_tabela_dest)) and
          (trim(DtMdlSat.wwQryRamificacaoNo_atributo_tabela.asstring) = trim(w_no_atributo_tabela_dest)) then
           // ok - achou
           begin
             result := true;
             break;
           end;

       DtMdlSat.wwQryRamificacao.next;

    end;

end;
{-------------------------------------------------------------------}
{Formata data valida para bd}

function TBuilderQuery.DataToChar(sqltext : string)   : string;
var S: string;
    posdd : integer;

begin
  S := sqltext ;

  while Pos('@Data', S) > 0 do
    begin
     posdd := Pos('@Data', S)+Pos('[', S)-Pos('@Data', S)+1;
     s := copy(s, 1, Pos('@Data', S)-1) +
          ' TO_CHAR(TO_DATE(' + '''' +
            copy(s, posdd+1, 2) + '-' + copy(s, posdd+4, 2) + '-' + copy(s, posdd+7, 4) + '''' +
          ', ' + '''' + 'dd-mm-yyyy' + '''' + '),' + '''' + 'dd/mm/yyyy' + '''' + ')'   +
          copy(s,
               Pos('@Data', S)+(Pos(']', S)-Pos('@Data', S)+1),
               length(s)-Pos(']', S));
    end;
  DataToChar := S;

end;

end.
