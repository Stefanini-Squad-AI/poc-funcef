{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit UFolhaBenef;

interface

uses wwquery, Udatabase, USistema, SysUtils, dbasedados, UobjFolha;

const
  cteIdModuloAdmPREV  = 16;
  cteIdModuloCCP      = 32;
  cteIdModuloFolhaBen = 18;
  cteIdModuloFolhaCM  = 21;

procedure CarregaParametros(qryAux: twwquery);
Function InserirParametro (qryAux: twwquery; sNomeParm , sTipoParm, svalorParm : String) : Boolean;
Function AlterarParametro (qryAux: twwquery; sNomeParm , svalorParm : String) : Boolean;
Function BuscaValorParametro(qryAux: twwquery; sNomeParm : String) : String;

implementation

Procedure CarregaParametros(qryAux: twwquery);
begin
  //P.RAMOS - 26.03.2002 - ELIMINA REGISTROS DA PARAMFOLHA QUE NÃO PERTENCEM A NENHUMA FUNDAÇÃO
  ExecutarQuery(qryAux, 'delete from paramfolha p '+
                        'where not exists (select f.idpessoa '+
                                          'from fundacao f '+
                                          'where f.idpessoa = p.idfundacao)');

   // fernando - funcef - 18/04/2002
   If BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSS') = #255 then
      InserirParametro(qryAux, 'IDRUBCPMFPAINSS','N','0');
   try
     SistemaFolha.IDRUBCPMFPAINSS := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSS'));
   except
     SistemaFolha.IDRUBCPMFPAINSS := 0;
   end;
   // fim - fernando - funcef - 18/04/2002

   If BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSSDESC') = #255 then
      InserirParametro(qryAux, 'IDRUBCPMFPAINSSDESC','N','0');
   try
     SistemaFolha.IDRUBCPMFPAINSSDESC := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSSDESC'));
   except
     SistemaFolha.IDRUBCPMFPAINSSDESC := 0;
   end;

   If BuscaValorParametro(qryAux, 'FLGAPAGAPREVIA') = #255 then
      InserirParametro(qryAux, 'FLGAPAGAPREVIA','N','0');
   try
     SistemaFolha.FlgApagaPrevia := StrtoInt(BuscaValorParametro(qryAux, 'FLGAPAGAPREVIA'));
   except
     SistemaFolha.FlgApagaPrevia := 0;
   end;

   If BuscaValorParametro(qryAux, 'FLGUSAMARGEM3070') = #255 then
      InserirParametro(qryAux, 'FLGUSAMARGEM3070','N','0');
   try
     SistemaFolha.FLGUSAMARGEM3070 := StrtoInt(BuscaValorParametro(qryAux, 'FLGUSAMARGEM3070'));
   except
     SistemaFolha.FLGUSAMARGEM3070 := 0;
   end;

   If BuscaValorParametro(qryAux, 'FLGVERIFICAPARM') = #255 then
      InserirParametro(qryAux, 'FLGVERIFICAPARM','N','0');
   try
      SistemaFolha.FlgVerificaParm := StrtoInt(BuscaValorParametro(qryAux, 'FLGVERIFICAPARM'));
   except
         SistemaFolha.FlgVerificaParm := 0;
   end;

   If BuscaValorParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO') = #255 then
      InserirParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO','N','0');
   try
      SistemaFolha.FlgEnviaContribManutencao := StrtoInt(BuscaValorParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO'));
   except
         SistemaFolha.FlgEnviaContribManutencao := 0 ;
   end;

   If BuscaValorParametro(qryAux, 'FLGNUMLOTES') = #255 then
         InserirParametro(qryAux, 'FLGNUMLOTES','N','1');
   try
      SistemaFolha.FLGNUMLOTES := StrtoInt(BuscaValorParametro(qryAux, 'FLGNUMLOTES'));
   except
         SistemaFolha.FLGNUMLOTES := 1 ;
   end;

   If BuscaValorParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO') = #255 then
         InserirParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO','N','0');
   try
      SistemaFolha.FlgEnviaContribConcessao := StrtoInt(BuscaValorParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO'));
   except
         SistemaFolha.FlgEnviaContribConcessao := 0 ;
   end;

   If BuscaValorParametro(qryAux, 'CODCENTRORESPON') = #255 then
        InserirParametro(qryAux, 'CODCENTRORESPON','S','0');
   try
      SistemaFolha.CodCentroRespon := BuscaValorParametro(qryAux, 'CODCENTRORESPON');
   except
         SistemaFolha.CodCentroRespon := '0';
   end;

   If BuscaValorParametro(qryAux, 'CODPORTFORMA') = #255 then
         InserirParametro(qryAux, 'CODPORTFORMA','S','0');
   try
      SistemaFolha.CodPortForma := BuscaValorParametro(qryAux, 'CODPORTFORMA');
   except
         SistemaFolha.CodPortForma := '0';
   end;

   If BuscaValorParametro(qryAux, 'CODTIPRECDES') = #255 then
         InserirParametro(qryAux, 'CODTIPRECDES','S','0');
   try
      SistemaFolha.CodTipRecDes := BuscaValorParametro(qryAux, 'CODTIPRECDES');
   except
         SistemaFolha.CodTipRecDes := '0';
   end;

   If BuscaValorParametro(qryAux, 'CODTIPRECDESFAV') = #255 then
         InserirParametro(qryAux, 'CODTIPRECDESFAV','S','0');
   try
      SistemaFolha.CodTipRecDesFav := BuscaValorParametro(qryAux, 'CODTIPRECDESFAV');
   except
         SistemaFolha.CodTipRecDesFav := '0';
   end;

   If BuscaValorParametro(qryAux, 'UNIDNEGOC') = #255 then
         InserirParametro(qryAux, 'UNIDNEGOC','S','0');
   try
      SistemaFolha.UnidNegoc := BuscaValorParametro(qryAux, 'UNIDNEGOC');
   except
         SistemaFolha.UnidNegoc := '0';
   end;

   If BuscaValorParametro(qryAux, 'SUBCONTA') = #255 then
         InserirParametro(qryAux, 'SUBCONTA','S','0');
   try
      SistemaFolha.SubConta := BuscaValorParametro(qryAux, 'SUBCONTA');
   except
         SistemaFolha.SubConta := '0';
   end;

   If BuscaValorParametro(qryAux, 'CODCENTROCUSTOC') = #255 then
         InserirParametro(qryAux, 'CODCENTROCUSTOC','S','0');
   try
      SistemaFolha.CodCentroCustoC := BuscaValorParametro(qryAux, 'CODCENTROCUSTOC');
   except
         SistemaFolha.CodCentroCustoC := '0';
   end;

   If BuscaValorParametro(qryAux, 'CODCCUSTOFINAN') = #255 then
         InserirParametro(qryAux, 'CODCCUSTOFINAN','S','');
   try
      SistemaFolha.CODCCUSTOFINAN := BuscaValorParametro(qryAux, 'CODCCUSTOFINAN');
   except
         SistemaFolha.CODCCUSTOFINAN := '';
   end;

   If BuscaValorParametro(qryAux, 'MASCARAMATRICULA') = #255 then
         InserirParametro(qryAux, 'MASCARAMATRICULA','S','');
   try
      SistemaFolha.MASCARAMATRICULA := BuscaValorParametro(qryAux, 'MASCARAMATRICULA');
   except
         SistemaFolha.MASCARAMATRICULA := '';
   end;

   If BuscaValorParametro(qryAux, 'CODCENTROCUSTOD') = #255 then
         InserirParametro(qryAux, 'CODCENTROCUSTOD','S','0');
   try
      SistemaFolha.CodCentroCustoD := BuscaValorParametro(qryAux, 'CODCENTROCUSTOD');
   except
         SistemaFolha.CodCentroCustoD := '0';
   end;

   If BuscaValorParametro(qryAux, 'PLACONTAD') = #255 then
         InserirParametro(qryAux, 'PLACONTAD','S','');
   SistemaFolha.PLACONTAD:=BuscaValorParametro(qryAux, 'PLACONTAD');

   If BuscaValorParametro(qryAux, 'PLACONTAC') = #255 then
         InserirParametro(qryAux, 'PLACONTAC','S','');
   SistemaFolha.PLACONTAC:=BuscaValorParametro(qryAux, 'PLACONTAC');

   // Indica se usa modelo de 1 ou 2 Contra-cheques por página
   If BuscaValorParametro(qryAux, 'CONTRACHEQUESPORPAGINA') = #255 then
         InserirParametro(qryAux, 'CONTRACHEQUESPORPAGINA','S','1');
   try
     SistemaFolha.ContraChequePorPagina:=
       strtoint(BuscaValorParametro(qryAux, 'CONTRACHEQUESPORPAGINA'));
   except
     SistemaFolha.ContraChequePorPagina:=1;
   end;

   // Indica se usa rubrica interna ou externa no contracheque trimestral e na 2ª via do contracheque.
   If BuscaValorParametro(qryAux, 'RUBRICACONTRACHEQUE') = #255 then
         InserirParametro(qryAux, 'RUBRICACONTRACHEQUE','S','0');
   try
     SistemaFolha.RUBRICACONTRACHEQUE:=
       strtoint(BuscaValorParametro(qryAux, 'RUBRICACONTRACHEQUE'));
   except
     SistemaFolha.RUBRICACONTRACHEQUE:=0;
   end;


   // Separador de 2 Contra-cheque
   If BuscaValorParametro(qryAux, 'SEPARADOR2CONTRACHEQUES') = #255 then
         InserirParametro(qryAux, 'SEPARADOR2CONTRACHEQUES','S','');
   SistemaFolha.SeparadorContraCheque:=
     BuscaValorParametro(qryAux, 'SEPARADOR2CONTRACHEQUES');

   // Bruno Bastos 25/06/2002 Início
   If BuscaValorParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM') = #255 then
         InserirParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM','N','0');
   SistemaFolha.FLGNUMDEPIRNUMDEPSALFAM := StrToInt(BuscaValorParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM'));
   // Bruno Bastos 25/06/2002 Fim

   // Bruno Bastos 09/07/2002 Início
   If BuscaValorParametro(qryAux, 'FLGESTADORUB') = #255 then
         InserirParametro(qryAux, 'FLGESTADORUB','N','0');
   SistemaFolha.FLGESTADORUB := StrToInt(BuscaValorParametro(qryAux, 'FLGESTADORUB'));
   // Bruno Bastos 09/07/2002 Fim

   If BuscaValorParametro(qryAux, 'FLGUSACODRUBEXT') = #255 then
         InserirParametro(qryAux, 'FLGUSACODRUBEXT','N','0');
   SistemaFolha.FLGUSACODRUBEXT := StrToInt(BuscaValorParametro(qryAux, 'FLGUSACODRUBEXT'));

   // Bruno Bastos 10/07/2002 Início
   If BuscaValorParametro(qryAux, 'IDGRUPOREGRAFOLHA') = #255 then
      InserirParametro(qryAux, 'IDGRUPOREGRAFOLHA','N','0');
   try
      SistemaFolha.IDGRUPOREGRAFOLHA := StrtoInt(BuscaValorParametro(qryAux, 'IDGRUPOREGRAFOLHA'));
   except
      SistemaFolha.IDGRUPOREGRAFOLHA := 0;
   end;

   If BuscaValorParametro(qryAux, 'IDESTRUTM30') = #255 then
      InserirParametro(qryAux, 'IDESTRUTM30','N','0');
   try
      SistemaFolha.IDESTRUTM30 := StrtoInt(BuscaValorParametro(qryAux, 'IDESTRUTM30'));
   except
      SistemaFolha.IDESTRUTM30 := 0;
   end;

   If BuscaValorParametro(qryAux, 'IDESTRUTM70') = #255 then
      InserirParametro(qryAux, 'IDESTRUTM70','N','0');
   try
      SistemaFolha.IDESTRUTM70 := StrtoInt(BuscaValorParametro(qryAux, 'IDESTRUTM70'));
   except
      SistemaFolha.IDESTRUTM70 := 0;
   end;

   If BuscaValorParametro(qryAux, 'FLGUSAREGRAXRUB') = #255 then
     InserirParametro(qryAux, 'FLGUSAREGRAXRUB','N','0');
   SistemaFolha.FLGUSAREGRAXRUB := StrToInt(BuscaValorParametro(qryAux, 'FLGUSAREGRAXRUB'));
   // Bruno Bastos 10/07/2002 Fim

   //Bruno Bastos 07/08/2002 Início
   If BuscaValorParametro(qryAux, 'FLGAGRUPARUBRICA') = #255 then
     InserirParametro(qryAux, 'FLGAGRUPARUBRICA','N','0');
   SistemaFolha.FLGAGRUPARUBRICA := StrToInt(BuscaValorParametro(qryAux, 'FLGAGRUPARUBRICA'));
   //Bruno Bastos 07/08/2002 Fim

   If BuscaValorParametro(qryAux, 'FLGINTEGRACONTABIL') = #255 then
     InserirParametro(qryAux, 'FLGINTEGRACONTABIL','N','1');
   SistemaFolha.FLGINTEGRACONTABIL := StrToInt(BuscaValorParametro(qryAux, 'FLGINTEGRACONTABIL'));

   If BuscaValorParametro(qryAux, 'FLGINTEGRAFINANC') = #255 then
     InserirParametro(qryAux, 'FLGINTEGRAFINANC','N','1');
   SistemaFolha.FLGINTEGRAFINANC := StrToInt(BuscaValorParametro(qryAux, 'FLGINTEGRAFINANC'));

   If BuscaValorParametro(qryAux, 'IDPROGRAMAFOLHA') = #255 then
     InserirParametro(qryAux, 'IDPROGRAMAFOLHA','N','0');
   SistemaFolha.IDPROGRAMAFOLHA := StrToInt(BuscaValorParametro(qryAux, 'IDPROGRAMAFOLHA'));

   If BuscaValorParametro(qryAux, 'FLGCAPCONTROLACPMF') = #255 then
     InserirParametro(qryAux, 'FLGCAPCONTROLACPMF','N','0');
   SistemaFolha.FLGCAPCONTROLACPMF := StrToInt(BuscaValorParametro(qryAux, 'FLGCAPCONTROLACPMF'));

   If BuscaValorParametro(qryAux, 'IDRUBCREDSALFAM') = #255 then
      InserirParametro(qryAux, 'IDRUBCREDSALFAM','N','0');
   try
      SistemaFolha.IDRUBCREDSALFAM := StrtoInt(BuscaValorParametro(qryAux, 'IDRUBCREDSALFAM'));
   except
         SistemaFolha.IDRUBCREDSALFAM := 0;
   end;

   If BuscaValorParametro(qryAux, 'VALORSALFAM') = #255 then
      InserirParametro(qryAux, 'VALORSALFAM','R','0');
   try
      SistemaFolha.VALORSALFAM := StrToFloat(SistemaFolha.ClienteNumero(BuscaValorParametro(qryAux, 'VALORSALFAM')));
   except
         SistemaFolha.VALORSALFAM := 0;
   end;

   If BuscaValorParametro(qryAux, 'TETOSALFAM') = #255 then
      InserirParametro(qryAux, 'TETOSALFAM','R','0');
   try
      SistemaFolha.TETOSALFAM := StrToFloat(SistemaFolha.ClienteNumero(BuscaValorParametro(qryAux, 'TETOSALFAM')));
   except
         SistemaFolha.TETOSALFAM := 0;
   end;

   //P.RAMOS - 02.09.2002 - PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA
   If BuscaValorParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA') = #255 then
     InserirParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA','N','0');
   try
     SistemaFolha.FlgZeraBaseNegativaPrevia:=StrtoInt(BuscaValorParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA'));
   except
     SistemaFolha.FlgZeraBaseNegativaPrevia:=0;
   end;
end;

Function InserirParametro(qryAux: twwquery; sNomeParm , sTipoParm, svalorParm : String) : Boolean;
begin
     If Length(Trim(sNomeParm)) > 50 then
        sNomeParm := Copy(sNomeParm,1,50);
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add('INSERT INTO PARAMFOLHA ');
     qryAux.sql.add('(IDFUNDACAO, NOMEPARAM, TIPOPARAM, VALORPARAM)');
     qryAux.sql.add(' VALUES ');
     qryAux.sql.add('(:PIDFUNDACAO, :PNOMEPARAM, :PTIPOPARAM, :PVALORPARAM)');
     qryAux.parambyname('PIDFUNDACAO').asInteger := Sistema.IdEmpresa;
     qryAux.parambyname('PNOMEPARAM').asString := sNomeParm;
     qryAux.parambyname('PTIPOPARAM').asString := sTipoParm;
     If sTipoParm <> 'R' then
          qryAux.parambyname('PVALORPARAM').asString := sValorParm
     else
          qryAux.parambyname('PVALORPARAM').asString := SistemaFolha.Oranumero(sValorParm);
     try
        if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
        qryAux.ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
        result := true;
     except
           result := false;
     end;
end;

Function AlterarParametro(qryAux: twwquery; sNomeParm , svalorParm : String) : Boolean;
begin
     qryAux.close;
     qryAux.sql.clear;
     qryAux.sql.add(' UPDATE PARAMFOLHA ');
     qryAux.sql.add(' SET VALORPARAM = :PVALORPARM');
     qryAux.sql.add(' WHERE IDFUNDACAO = :PIDFUNDACAO');
     qryAux.sql.add(' AND NOMEPARAM = :PNOMEPARAM');
     qryAux.parambyname('PIDFUNDACAO').asInteger := Sistema.IdEmpresa;
     qryAux.parambyname('PNOMEPARAM').asString   := sNomeParm;
     qryAux.parambyname('PVALORPARM').asString  := sValorParm;
     try
        if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
        qryAux.ExecSQL;
        dtmBaseDados.dbBaseDados.Commit;
        result := true;
     except
           result := false;
     end;
end;

Function BuscaValorParametro (qryAux: twwquery; sNomeParm : String) : String;
VAR
   valtmp : String;
begin
  valtmp := #255;
  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add(' SELECT VALORPARAM,TIPOPARAM FROM PARAMFOLHA ');
  qryAux.sql.add(' WHERE IDFUNDACAO = :PIDFUNDACAO AND');
  qryAux.sql.add(' NOMEPARAM = :PNOMEPARAM ');
  qryAux.parambyname('PIDFUNDACAO').asInteger := Sistema.IdEmpresa;
  qryAux.parambyname('PNOMEPARAM').asString   := sNomeParm;
  qryAux.open;
  If not qryAux.eof then
  begin
    valtmp := Trim(qryAux.fieldbyname('VALORPARAM').asstring);
    If ((sNomeParm <> 'CODCCUSTOFINAN') and (sNomeParm <> 'MASCARAMATRICULA')) then
       If valtmp = '' then
          valtmp := '0';
  end;
  result := valTmp;
end;

end.
{==============================================================================|
| UNIT: UFOLHABENEF                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   Parametros Globais do Sistema                                              |
|                                                                              |
===============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/03/2002 A 05/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - CRIAÇÃO DA UNIT                                                         |
|     - Esta Unit contem todo o novo esquema de criação de parametros globais  |
|       da Folha de Beneficios                                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/03/2002 A 12/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12E                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - INCLUSÃO DOS PARAMETROS RELATIVOS A PARAMETRIZAÇÃO CONTÁBIL-FINANCEIRA  |
|       PADRÃO.                                                                |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro relativo ao controle de cálculo automático de     |
|      dependentes para imposto de renda e dependentes de salário família.     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2002 A 09/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro relativo ao controle do estado em que se encontra |
|      as rubricas.                                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2002 A 10/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro para saber a qual grupo da regra que a rubrica    |
|    pertence.                                                                 |
|                                                                              |
|    - Inclusão do parâmetro para saber se o sisttema vai usar somente as      |
|    rubricas associadas as regras da folha ou não.                            |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Inclusão do parâmetro para integração contábil.                         |
|    - Inclusão do parâmetro para integração com o Financeiro.                 |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDPROGRAMAFOLHA do contas a pagar .                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13i                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro FLGNUMLOTES que determina a quantidade de lotes que   |
|   podem estar abertos simultaneamente.                                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13k                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao dos novos parametros IDRUBCREDSALFAM, VALORSALFAM e TETOSALFAM    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2002 A 06/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13L                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao do novo parametro MASCARAMATRICULA                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: 07/08/2002 A 07/08/2002                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro para saber o sistema irá agrupar por rubrica ou    |
|   não principalmente em demonstrativos de pagamento.                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Implementei os parametros relativos a margem de 30% e 70%                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/09/2002 A 02/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONTROLA SE BASES CALCULADAS NA PREVIA PODEM SER NEGATIVAS                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DD/MM/AAAA A DD/MM/AAAA                            |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|==============================================================================}

