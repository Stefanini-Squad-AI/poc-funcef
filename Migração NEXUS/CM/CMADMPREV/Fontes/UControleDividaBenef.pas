unit UControleDividaBenef;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
{ ------------------------------------------------------------------------------------
Pendência   : WO28156
Responsável : Leandro
Data        : 02/12/2025
Descrição   : Ajuste referencia campo "ini cobr"
--------------------------------------------------------------------------------------
Pendência   : WO28073
Responsável : Leandro
Data        : 26/11/2025
Descrição   : Ajuste nome do campo na LancaTmpDesc
--------------------------------------------------------------------------------------
Pendência   : MIGRACAO-ORACLE
Responsável : Edilane
Data        : 14/10/2025
Descrição   : Casting de campos, remover aspas, espaços e acentos dos nomes de campos
Data        : 17/10/2025
Descrição   : campo alterado para VARCHAR manteve o espaço em branco
--------------------------------------------------------------------------------------
Alteracao   : InserirRubricaIndividual
Pendência   : WO22455
Responsável : Luis Ferrari
Data        : 09/06/2025
Descrição   : Alterar a data sysdate para a data do Lote contabil.
--------------------------------------------------------------------------------------
Alteracao   : CriaLogDivida
Pendência   : WO8288
Responsável : Helen V Bianchi
Data        : 01/03/2024
Descrição   : Adicionado Log de Movimentaçao na HSTDIVIDABENEFICIO p qq alteração
------------------------------------------------------------------------------------
Alteracao   : BuscaParametro, InserirRubricaIndividual
Pendência   : 136150
Responsável : leandro
Data        : 27/07/2023
Descrição   : alterar a conta contábil no momento de gerar/baixar os boletos emitidos
--------------------------------------------------------------------------------------
Alteracao   : CriaLogDivida, InsereTmpDesc/LancaTmpDesc
Pendência   : 126276
Responsável : edilaine
Data        : 11/07/2023
Descrição   : Historico de Movimentos da Divida
---------------------------------------------------------------------------------------
// Alteracao   : (VerificaPeridoBloqueado)
// Pendência   : 134591
// Responsável : Luis Ferrari
// Data        : 31/05/2023
// Descrição   : Ajuste no Flag de Periodo de contabilização
// --------------------------------------------------------------------------------
// Alteracao   : (dfm tsDividaBenef, updCap)
// Pendência   : 132927
// Responsável : Luis Ferrari
// Data        : 23/02/2023
// Descrição   : Ajuste no plano financeiro do rateio na emissão do boleto
// --------------------------------------------------------------------------------
Alteracao   : VerificaPeridoBloqueado
Pendência   : 115304
Responsável : edilaine
Data MERGE  : 25/01/2023
Data        : 21/10/2021
Descrição   : Contabilização da Provisão de Perdas para Dívidas Beneficio
---------------------------------------------------------------------------------------
Alterações  : GeraBoleto
Pendência   : 131169
Responsável : Leandro
Data        : 20/12/2022
Descrição   : Atualização nossonumero na tabela documento na geração do boleto
--------------------------------------------------------------------------------------
Alterações  : GeraBoleto
Pendência   : 129180
Responsável : Edilaine
Data        : 26/09/2022
Descrição   : Falta informação do cedente nos boletos de dívidas
--------------------------------------------------------------------------------------
Alterações  : criação do modelo
Pendência   : SIG33744
Responsável : Edilaine
Data MERGE  : 05/07/2022
Data        : 27/07/2018
Descrição   : Criação dos campos Status, Observação e Numprocinss das dívidas de benefícios,
              assim como a mudança de diversos controles da funcionalidade.
              reajustar dívidas de benefícios vinculadas ao plano REG REPLAN-não Saldada
              em janeiro
--------------------------------------------------------------------------------------}

interface

uses  Db, DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, uIntegraBack,
      Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      ComCtrls, UCtrlDocumento, UCtrlLancamento, uCMFileUtils, FileCtrl, FPreview,
      uCtrlGeraBoleto, uBeneficio, RGeraDocumento, StdCtrls,
      ppEndUsr, ppStrtch, ppMemo, ppBarCod, DBClient, uCMClientDataSet, uCmSqlParams,
      uCtrlContab, uVerificaPreenchimento, ULancContab,  // TestaPeriodo
      ppTypes, ppForms;



type
  TParametros = record
    OK  : boolean;
    iIdSeq : integer;
    sCODPORTFORMA,
    sCODTIPDOC,
    sUNIDNEGOC,
    sCODTIPRECDES,
    sCODCENTRORESPON,
    sCODFORMA,
    sPLANO,
    sCODCENTROCUSTOC,
    sTIPCODIGO,
    sPLACONTAD,
    sPLACONTAC,
    sCODPROVDESC,
    sIDPLANPREVCONTAB,
    sCONTALIQUIDO : string;
  end;

function iif(condicao : boolean; sVlrTrue, sVlrFalse : string) : string;

//Leandro  SIG136150 - inicio
//function BuscaParametros(qryDados, _qry : TwwQuery) : TParametros;
function BuscaParametrosNovo(qryDados, _qry : TwwQuery) : TParametros;
//Leandro  SIG136150 - fim

//function InserirRubricaIndividual(qryDados : TwwQuery; rValor : Double; iIdLote, iIdTmpDesc : integer) : boolean; //leandro sig136150
function InserirRubricaIndividual(qryDados : TwwQuery; rValor : Double; iIdLote, iIdTmpDesc, iIdPlanPrev : integer; dData : string) : boolean; //eandro sig136150  // WO22455 Ferrari

//function InserirRubricaIndividual(qryDados : TwwQuery; rValor : Double; iIdLote, iIdTmpDesc : integer) : boolean; //leandro sig136150
//function InserirRubricaIndividual(qryDados : TwwQuery; rValor : Double; iIdLote, iIdTmpDesc, iIdPlanPrev : integer) : boolean; //eandro sig136150

//function InsereTmpDesc(qryDados : TwwQuery;         //edilaine SIG126276
function LancaTmpDesc(qryDados : TwwQuery;            //edilaine SIG126276
                       var recParam : TParametros;
                       iIdLote : integer = 0;
                       rValor  : double = 0;
                       dAnoMes : string = '') : integer;

function LancaDoc( qryDados : TwwQuery; var ctrlDocumento : TCtrlDocumento;
                   iCodLancCAPCAR, PlnCodigo, iidPessoa,
                   idblkNovoPortForma, iUnidNegoc, iCodTipDoc : integer;
                   sdtenvio, sdtvencto, sNoDocumento, smmMotivo,
                   sTipRecDes, sCentroRespon, sCentroCusto, sContaCliFor,    //edilaine - SIG33744
                   RecPag: string;
                   valor: real;
                   aicodforma: integer
                  ) : Boolean;

function VerificaPrevia(idLote : integer; qryDados, _qry : TwwQuery; sMsg : string) : boolean;

function GeraBoleto(qryDados, _qryaux : TwwQuery; var lstSql : TStringList; sMsg : TStringList) : boolean;

procedure SalvaResultado(Texto : TMemo; sOperacao : String; sFileName: String = 'RESULTADO');

function VerificaPeridoBloqueado(sMesCobranca : string; winControl : TWinControl;
                                 bExibeMsg : boolean = true; bDesfaz : boolean = false): integer;    //edilaine SIG115304

function CriaLogDivida(sCodDivida, sTipoMov : string; sSaldoAnt : string = ''; sParcelaAnt : string = '';   //edilaine SIG126276
         sParcelaDesc : string = '') : boolean;   //Helen WO8288 - add sParcelaDesc

implementation

uses UAdmPrev, UParticipante, DAPrev, UDatabase, FAguarde, UMensErro,
     UFuncoesUteis, UPCS, USistema, DAPrevIntegraBack, UAutorizacao, DBaseDados;



function iif(condicao : boolean; sVlrTrue, sVlrFalse : string) : string;
begin
  if condicao then result := sVlrTrue
              else result := sVlrFalse;
end;


function VerificaPrevia(idLote : integer; qryDados, _qry : TwwQuery; sMsg : string) : boolean;
begin
  try
    //verifica se beneficio está na prévia
    _qry.Close;
    _qry.Sql.Clear;
    _qry.Sql.Add('SELECT 1  ');
    _qry.Sql.Add('  FROM HSTBENEFBFCIARIO HB  ');
    _qry.Sql.Add(' WHERE HB.IDPESSOA    = '+ qryDados.FieldbyName('IDPESSOA').AsString );
    _qry.Sql.Add('   AND HB.IDTITULAR   = '+ qryDados.FieldbyName('IDTITULAR').AsString );
    _qry.Sql.Add('   AND HB.IDPESSJUR   = '+ qryDados.FieldbyName('IDPESSJUR').AsString );
    _qry.Sql.Add('   AND HB.IDPLANOPREV = '+ qryDados.FieldbyName('IDPLNAOPREV').AsString );
    _qry.Sql.Add('   AND HB.LOTEORIGEM  = '+ IntToStr(idLote) );
    _qry.Sql.Add('   AND HB.LOTEORIGEM <> IDLOTE ' );
    _qry.Open;

    result :=  not _qry.isEmpty;

    if _qry.isEmpty then
    begin
      //verifica se desconto está na prévia
      _qry.Close;
      _qry.Sql.Clear;
      _qry.Sql.Add('SELECT 1  ');
      _qry.Sql.Add('  FROM TMPDESC TP ');
      _qry.Sql.Add(' WHERE TP.IDPESSOA    = '+ qryDados.FieldbyName('IDPESSOA').AsString  );
      _qry.Sql.Add('   AND TP.IDTITULAR   = '+ qryDados.FieldbyName('IDTITULAR').AsString );
      _qry.Sql.Add('   AND TP.IDPESSJUR   = '+ qryDados.FieldbyName('IDPESSJUR').AsString );
      _qry.Sql.Add('   AND TP.IDPLANOPREV = '+ qryDados.FieldbyName('IDPLANOPREV').AsString );
      _qry.Sql.Add('   AND TP.IDLOTE      = '+ IntToStr(idLote) );
      _qry.Sql.Add('   AND TP.LOTEPREVIA IS NOT NULL ');
      _qry.Open;

      result :=  not _qry.isEmpty;
    end;

  except
    sMsg := 'Erro ao verificar lançamento na Prévia';
  end;
end;


//Leandro  SIG136150 - inicio
function BuscaParametrosNovo(qryDados, _qry : TwwQuery) : TParametros;
var
  rParam : TParametros;
begin
  rParam.sCODPORTFORMA     := '-1';
  rParam.sCODTIPDOC        := '-1';
  rParam.sUNIDNEGOC        := '-1';
  rParam.sCODCENTRORESPON  := '-1';
  rParam.sCODFORMA         := '-1';
  rParam.sPLANO            := '-1';
  rParam.sTIPCODIGO        := '-1';
  rParam.sPLACONTAD        := '-1';
  rParam.sPLACONTAC        := '-1';
  rParam.sCODPROVDESC      := '-1';
  rParam.sIDPLANPREVCONTAB := '-1';

  rParam.sCONTALIQUIDO     := '-1';
  rParam.sCODCENTROCUSTOC  := '-1';
  rParam.sCODCENTRORESPON  := '-1';
  rParam.sCODTIPRECDES     := '-1';

  try
    try
     //parametros PLACONTAC e CODCENTROCUSTOC
       _qry.close;
       _qry.sql.clear;
       _qry.SQL.Add('SELECT PLACONTACBOLETO, CODCENTROCUSTODIVIDA, CODCENTRORESPONDIVIDA, CODTIPRECDESDIVIDA, CODALTERADORBAIXA, IDRUBRICARECBOLDIVIDA');
       _qry.SQL.Add('  FROM PLANPREV');
       _qry.SQL.Add(' WHERE IDPLANOPREV = '+qryDados.FieldByName('IDPLANOPREV').text);
       _qry.open;
       rParam.sContaLiquido    := _qry.FieldByName('PLACONTACBOLETO').text;
       rParam.sCODCENTROCUSTOC := _qry.FieldByName('CODCENTROCUSTODIVIDA').text;
       rParam.sCODCENTRORESPON := _qry.FieldByName('CODCENTRORESPONDIVIDA').text;
       //rParam.sCODTIPRECDES    := _qry.FieldByName('CODTIPRECDESDIVIDA').text;         //MIGRACAO-ORACLE
       rParam.sCODTIPRECDES    := trim(_qry.FieldByName('CODTIPRECDESDIVIDA').text);     //MIGRACAO-ORACLE
       _qry.Close;

       if trim(rParam.sContaLiquido) = '' then
         rParam.sContaLiquido := '-1';

       if trim(rParam.sCODCENTROCUSTOC) = '' then
         rParam.sCODCENTROCUSTOC := '-1';

       if trim(rParam.sCODCENTRORESPON) = '' then
         rParam.sCODCENTRORESPON := '-1';

       if trim(rParam.sCODTIPRECDES) = '' then
         rParam.sCODTIPRECDES := '-1';

     //Parametro CODPORTFORMA
       if qryDados.FieldByName('TIPOPAGAMENTO').Text = 'B' then
       begin
         _qry.sql.clear;
         _qry.SQL.Add('SELECT CODPORTFORMA, CODFORMA, DESCRICAO');
         _qry.SQL.Add('  FROM PORTADORFORMA');
         _qry.SQL.Add(' WHERE RECPAG = ''R''');
         _qry.SQL.Add('   AND CODPORTFORMA = nvl('+qryDados.FieldByName('CODPORTFORMA').Text+',0)');
         _qry.SQL.Add(' ORDER BY DESCRICAO');
         _qry.open;
         rParam.sCODPORTFORMA := _qry.FieldByName('CODPORTFORMA').text;
         rParam.sCODFORMA     := _qry.FieldByName('CODFORMA').text;
         _qry.Close;
       end;

       if trim(rParam.sCODPORTFORMA) = '' then
          rParam.sCODPORTFORMA := '-1';

       if trim(rParam.sCODFORMA) = '' then
          rParam.sCODFORMA := '-1';

     //Parametros Boleto
       _qry.sql.clear;
       _qry.SQL.Add('SELECT');
       _qry.SQL.Add(' BPL.UNIDNEGOC,');
       _qry.SQL.Add(' BPL.CODCENTRORESPON,');
       _qry.SQL.Add(' BPL.CODTIPRECDES, ');
       _qry.SQL.Add(' BPL.CODCENTROCUSTOD, BPL.PLANO,BPL.PLACONTAD,BPL.TIPCODIGO,BPL.IDPLANPREVCONTAB');
       _qry.SQL.Add('  FROM BENEFPLANPATRO BPL, BENEFPLANPREV BP, BENEFICIO B');
       _qry.SQL.Add(' WHERE BPL.IDPESSJUR   = '+qryDados.FieldByName('IDPESSJUR').Text);
       _qry.SQL.Add('   AND BPL.IDPLANOPREV = '+qryDados.FieldByName('IDPLANOPREV').text);
       _qry.SQL.Add('   AND BP.IDPLANOPREV  = BPL.IDPLANOPREV');
       _qry.SQL.Add('   AND BP.IDBENEFICIO  = BPL.IDBENEFICIO');
       _qry.SQL.Add('   AND B.IDBENEFICIO   = BP.IDBENEFICIO');
       _qry.SQL.Add('   AND B.IDBENEFICIO   = '+qryDados.FieldByName('IDBENEFICIO').text);
       _qry.SQL.Add(' ORDER BY B.NOME');
       _qry.open;
       rParam.sUNIDNEGOC       := _qry.FieldByName('UNIDNEGOC').text;
       rParam.sPLACONTAD       := _qry.FieldByName('PLACONTAD').text;
       rParam.sTIPCODIGO       := _qry.FieldByName('TIPCODIGO').text;
       rParam.sPLANO           := _qry.FieldByName('plano').text;
       _qry.Close;

       if trim(rParam.sTIPCODIGO)='' then
         rParam.sTIPCODIGO := '-1';

       if trim(rParam.sUNIDNEGOC) = ''  then
          rParam.sUNIDNEGOC := '-1';


       if Trim(rParam.sPLANO) = '' then
         rParam.sPLANO := '-1';

     //Parametro PLANO CONTABIL
       _qry.sql.clear;
       _qry.SQL.Add(' SELECT IDPLANPREVCONTAB FROM BENEFBFCIARIO B ');
       _qry.SQL.Add(' WHERE B.IDPLANOPREV = '+qryDados.FieldByName('IDPLANOPREV').text);
       _qry.SQL.Add('   AND B.IDPESSOA    = '+qryDados.FieldByName('IDPESSOA').Text);
       _qry.SQL.Add('   AND B.IDTITULAR   = '+qryDados.FieldByName('IDTITULAR').Text);
       _qry.SQL.Add('   AND B.IDPESSJUR   = '+qryDados.FieldByName('IDPESSJUR').Text);
       _qry.SQL.Add('   AND B.IDBENEFICIO = '+qryDados.FieldByName('IDBENEFICIO').text);
       _qry.open;
       rParam.sIDPLANPREVCONTAB := _qry.FieldByName('IDPLANPREVCONTAB').text;
       _qry.Close;

     //Parametro PLANO CONTABIL
       _qry.sql.clear;
       _qry.SQL.Add('SELECT PARAM.TPDOCRRECBANCO, PARAM.TPDOCRRECPATRO');
       _qry.SQL.Add('  FROM PESSOA P, FUNDACAO F, PARAMAPREV PARAM');
       _qry.SQL.Add(' WHERE P.IDPESSOA = F.IDPESSOA');
       _qry.SQL.Add('   AND F.IDPESSOA = 1');
       _qry.SQL.Add('   AND PARAM.IDFUNDACAO = F.IDPESSOA');
       _qry.SQL.Add(' ORDER BY P.NOME');
       _qry.open;
       rParam.sCODTIPDOC := _qry.FieldByName('TPDOCRRECBANCO').text;
       _qry.Close;

       if trim(rParam.sCODTIPDOC) = '' then
         rParam.sCODTIPDOC := '-1';

       rParam.OK := true;

    except
       rParam.OK := false;
    end;

  finally
    result := rParam;
  end;
end;

{function BuscaParametros(qryDados, _qry : TwwQuery) : TParametros;
var
  rParam : TParametros;
begin
  rParam.sCODPORTFORMA     := '-1';
  rParam.sCODTIPDOC        := '-1';
  rParam.sUNIDNEGOC        := '-1';
  rParam.sCODTIPRECDES     := '-1';
  rParam.sCODCENTRORESPON  := '-1';
  rParam.sCODFORMA         := '-1';
  rParam.sPLANO            := '-1';
  rParam.sCODCENTROCUSTOC  := '-1';
  rParam.sTIPCODIGO        := '-1';
  rParam.sPLACONTAD        := '-1';
  rParam.sPLACONTAC        := '-1';
  rParam.sCODPROVDESC      := '-1';
  rParam.sIDPLANPREVCONTAB := '-1';
  rParam.sCONTALIQUIDO     := '-1';

  try
    try
     //parametros PLACONTAC e CODCENTROCUSTOC
       _qry.close;
       _qry.sql.clear;
       _qry.SQL.Add('SELECT PLACONTAC,CODCENTROCUSTOC');
       _qry.SQL.Add('  FROM BENEFPLANPATRO');
       _qry.SQL.Add(' WHERE IDPESSJUR   = '+qryDados.FieldByName('IDPESSJUR').Text);
       _qry.SQL.Add('   AND IDBENEFICIO = '+qryDados.FieldByName('IDBENEFICIO').text);
       _qry.SQL.Add('   AND IDPLANOPREV = '+qryDados.FieldByName('IDPLANOPREV').text);
       _qry.open;
       rParam.sContaLiquido    := _qry.FieldByName('PLACONTAC').text;
       rParam.sCODCENTROCUSTOC := _qry.FieldByName('CODCENTROCUSTOC').text;
       _qry.Close;

       if trim(rParam.sContaLiquido) = '' then
         rParam.sContaLiquido := '-1';

       if trim(rParam.sCODCENTROCUSTOC) = '' then
         rParam.sCODCENTROCUSTOC := '-1';

     //Parametro CODPORTFORMA
       //if (qryDados.FieldByName('CODPORTFORMA').Text <> '') and (qryDados.FieldByName('CODPORTFORMA').Text <> '0') then
       if qryDados.FieldByName('TIPOPAGAMENTO').Text = 'B' then  //boleto
       begin
         _qry.sql.clear;
         _qry.SQL.Add('SELECT CODPORTFORMA, CODFORMA, DESCRICAO');
         _qry.SQL.Add('  FROM PORTADORFORMA');
         _qry.SQL.Add(' WHERE RECPAG = ''R''');
         //query_temp.SQL.Add('AND IDPESSOA ='+qrydet.FieldByName('IDPESSOA').Text);       // edilaine - 22/01/2014 - SOL 174933
         _qry.SQL.Add('   AND CODPORTFORMA = nvl('+qryDados.FieldByName('CODPORTFORMA').Text+',0)'); // edilaine - 22/01/2014 - SOL 174933
         _qry.SQL.Add(' ORDER BY DESCRICAO');
         _qry.open;
         rParam.sCODPORTFORMA := _qry.FieldByName('CODPORTFORMA').text;
         rParam.sCODFORMA     := _qry.FieldByName('CODFORMA').text;
         _qry.Close;
       end;

       if trim(rParam.sCODPORTFORMA) = '' then
          rParam.sCODPORTFORMA := '-1';

       if trim(rParam.sCODFORMA) = '' then
          rParam.sCODFORMA := '-1';

     //Parametros Boleto
       _qry.sql.clear;
       _qry.SQL.Add('SELECT');
       _qry.SQL.Add(' BPL.UNIDNEGOC,');
       _qry.SQL.Add(' BPL.CODCENTRORESPON,');
       _qry.SQL.Add(' BPL.CODTIPRECDES, ');
       _qry.SQL.Add(' BPL.CODCENTROCUSTOD, BPL.PLANO,BPL.PLACONTAD,BPL.TIPCODIGO,BPL.IDPLANPREVCONTAB');
       _qry.SQL.Add('  FROM BENEFPLANPATRO BPL, BENEFPLANPREV BP, BENEFICIO B');
       _qry.SQL.Add(' WHERE BPL.IDPESSJUR   = '+qryDados.FieldByName('IDPESSJUR').Text);
       _qry.SQL.Add('   AND BPL.IDPLANOPREV = '+qryDados.FieldByName('IDPLANOPREV').text);
       _qry.SQL.Add('   AND BP.IDPLANOPREV  = BPL.IDPLANOPREV');
       _qry.SQL.Add('   AND BP.IDBENEFICIO  = BPL.IDBENEFICIO');
       _qry.SQL.Add('   AND B.IDBENEFICIO   = BP.IDBENEFICIO');
       _qry.SQL.Add('   AND B.IDBENEFICIO   = '+qryDados.FieldByName('IDBENEFICIO').text);
       _qry.SQL.Add(' ORDER BY B.NOME');
       _qry.open;
       rParam.sUNIDNEGOC       := _qry.FieldByName('UNIDNEGOC').text;
       rParam.sCODTIPRECDES    := _qry.FieldByName('CODTIPRECDES').text;
       rParam.sCODCENTRORESPON := _qry.FieldByName('CODCENTRORESPON').text;
       rParam.sCODCENTROCUSTOC := _qry.FieldByName('CODCENTROCUSTOD').text;
       rParam.sPLACONTAD       := _qry.FieldByName('PLACONTAD').text;
       rParam.sTIPCODIGO       := _qry.FieldByName('TIPCODIGO').text;
       rParam.sPLANO           := _qry.FieldByName('plano').text;
       //sIDPLANPREVCONTAB:= query_temp.FieldByName('IDPLANPREVCONTAB').text;  // SOL 228648 KINTANA 2062629
       _qry.Close;

       if trim(rParam.sCODCENTROCUSTOC) = '' then
         rParam.sCODCENTROCUSTOC := '-1';

       if trim(rParam.sTIPCODIGO)='' then
         rParam.sTIPCODIGO := '-1';

       if trim(rParam.sUNIDNEGOC) = ''  then
          rParam.sUNIDNEGOC := '-1';

       if trim(rParam.sCODTIPRECDES) = '' then
         rParam.sCODTIPRECDES := '-1';

       if trim(rParam.sCODCENTRORESPON) = '' then
         rParam.sCODCENTRORESPON := '-1';

       if Trim(rParam.sPLANO) = '' then
         rParam.sPLANO := '-1';

     //Parametro PLANO CONTABIL
       // SOL 228648 KINTANA 2062629
       _qry.sql.clear;
       _qry.SQL.Add(' SELECT IDPLANPREVCONTAB FROM BENEFBFCIARIO B ');
       _qry.SQL.Add(' WHERE B.IDPLANOPREV = '+qryDados.FieldByName('IDPLANOPREV').text);
       _qry.SQL.Add('   AND B.IDPESSOA    = '+qryDados.FieldByName('IDPESSOA').Text);
       _qry.SQL.Add('   AND B.IDTITULAR   = '+qryDados.FieldByName('IDTITULAR').Text);
       _qry.SQL.Add('   AND B.IDPESSJUR   = '+qryDados.FieldByName('IDPESSJUR').Text);
       _qry.SQL.Add('   AND B.IDBENEFICIO = '+qryDados.FieldByName('IDBENEFICIO').text);
       _qry.open;
       rParam.sIDPLANPREVCONTAB := _qry.FieldByName('IDPLANPREVCONTAB').text;
       _qry.Close;
       // SOL 228648 KINTANA 2062629

     //Parametro PLANO CONTABIL
       _qry.sql.clear;
       //query_temp.SQL.Add('SELECT TPDOCRRECBANCO, TPDOCRRECPATRO');                   //Everson TIBERO
       _qry.SQL.Add('SELECT PARAM.TPDOCRRECBANCO, PARAM.TPDOCRRECPATRO');       //Everson TIBERO
       _qry.SQL.Add('  FROM PESSOA P, FUNDACAO F, PARAMAPREV PARAM');
       _qry.SQL.Add(' WHERE P.IDPESSOA = F.IDPESSOA');
       _qry.SQL.Add('   AND F.IDPESSOA = 1');
       _qry.SQL.Add('   AND PARAM.IDFUNDACAO = F.IDPESSOA');
       _qry.SQL.Add(' ORDER BY P.NOME');
       _qry.open;
       //sCODTIPDOC:=query_temp.FieldByName('TPDOCRRECPATRO').text;    // edilaine - 22/01/2014 - SOL 174933
       rParam.sCODTIPDOC := _qry.FieldByName('TPDOCRRECBANCO').text;   // edilaine - 22/01/2014 - SOL 174933
       _qry.Close;

       if trim(rParam.sCODTIPDOC) = '' then
         rParam.sCODTIPDOC := '-1';

       rParam.OK := true;

    except
       rParam.OK := false;
    end;

  finally
    result := rParam;
  end;
end;
}
//Leandro  SIG136150 - fim



//function InsereTmpDesc(qryDados : TwwQuery; var recParam : TParametros; iIdLote : integer = 0; rValor : double = 0) : integer;   //edilaine SIG126276
function LancaTmpDesc(qryDados : TwwQuery; var recParam : TParametros; iIdLote : integer = 0; rValor : double = 0; dAnoMes : string = '') : integer;      //edilaine SIG126276  // WO22455 Ferrari
var
   lidseq: integer;
   query,query2:TwwQuery;
   idrubrica,flgdesconto,
   sFLGATRASODEVOL,
   sINSCRICAONUMERO,
   SCODPROVDESC : string;
begin
  result := 0;   //processo OK

  query := TwwQuery.Create(Application);
  query.DataBaseName := 'BaseDados';
  query2 := TwwQuery.Create(Application);
  query2.DataBaseName := 'BaseDados';

  try
    lidseq:= (LeUltRegistro(Nil,'TMPDESC'));

    query2.SQL.Clear;
    query2.SQL.Add('SELECT * FROM BENEFPLANPREV');
    query2.SQL.Add('WHERE IDPLANOPREV= '+qryDados.FieldByName('IDPLANOPREV').text);
    query2.SQL.Add('AND IDBENEFICIO = '+qryDados.FieldByName('IDBENEFICIO').text);
    query2.open;

    //BRUNO AZEVEDO INÍCIO SIG33744
    if (qryDados.FieldByName('VALORPREVISTO').Value < 0) then begin
      idrubrica := query2.FieldByName('IDRUBRICADIVIDABENEFICIODEVOL').Text;
    end else begin
      if query2.FieldByName('IDRUBRICADIVIDABENEFNORMAL').Text<>'' then
         idrubrica := query2.FieldByName('IDRUBRICADIVIDABENEFNORMAL').Text
      else
         if query2.FieldByName('IDRUBRICADIVIDABENEFICIODEVOL').Text<>'' then
            idrubrica := query2.FieldByName('IDRUBRICADIVIDABENEFICIODEVOL').Text
         else
            if query2.FieldByName('IDRUBRICADIVIDABENEFTRASO').Text<>'' then
               idrubrica := query2.FieldByName('IDRUBRICADIVIDABENEFTRASO').Text
            else
               idrubrica := 'null';
    end;
    //BRUNO AZEVEDO FIM SIG33744

    if idrubrica='null' then
    begin
       result := -1;    //sem parametrização rubrica
       exit;
    end;

    if idrubrica <> 'null' then
      begin
       query2.active:=False;
       query2.SQL.Clear;
       query2.SQL.Add('SELECT FLGDESCONTO,CODPROVDESC FROM PROVDESC WHERE IDPROVENTO = '+#39+idrubrica+#39);
       query2.open;

       flgdesconto  := query2.FieldByName('FLGDESCONTO').Text;
       sCODPROVDESC := query2.FieldByName('CODPROVDESC').Text;

       //edilaine - SIG33744 : inicio
       if (flgdesconto = '1') and (qryDados.FieldByName('VALORPREVISTO').AsFloat < 0) then
          flgdesconto := '0';
       //edilaine - SIG33744 : fim
      end
    else
       flgdesconto:='1';  {flgdesconto:='0';}       //edilaine - SIG33744


    if flgdesconto = '0' then
       SFLGATRASODEVOL:= 'D'  {'A'}    //edilaine - SIG33744
    else
       SFLGATRASODEVOL:='N';

    query2.active:=False;
    query2.SQL.Clear;
    query2.SQL.Add('SELECT INSCRICAONUMERO FROM PARTPREVPLAN');
    query2.SQL.Add('WHERE IDPESSOA =' +qryDados.FieldByName('IDPESSOA').Text);
    query2.SQL.Add('      AND IDPLANOPREV ='+qryDados.FieldByName('IDPLANOPREV').Text);
    query2.Open;
    sINSCRICAONUMERO := query2.FieldByName('INSCRICAONUMERO').Text;
    query2.open;


    query.Active:=false;
    query.SQL.Clear;
    query.SQL.Add('INSERT INTO TMPDESC');
    query.SQL.Add('  (IDTMPDESC,');//
    query.SQL.Add('   IDPESSJUR,');//
    query.SQL.Add('   IDPLANOPREV,'); //
    query.SQL.Add('   IDTITULAR,');//
    query.SQL.Add('   IDPESSOA,');//
    query.SQL.Add('   IDPROVENTO,');
    query.SQL.Add('   IDMOTIVO,');
    query.SQL.Add('   MESCOBRANCA,');
    query.SQL.Add('   MESREFERENCIA,');
    query.SQL.Add('   FLGTIPODESC,');
    query.SQL.Add('   VALOR,');
    query.SQL.Add('   FLGDESCFOLHA,');
    query.SQL.Add('   SISTORIGEM,');
    query.SQL.Add('   IDMODULO,');
    query.SQL.Add('   SITENVIO,');
    query.SQL.Add('   SEQPROPOSTA,');
    query.SQL.Add('   REFERENCIA,');
    query.SQL.Add('   NUMPARCELAS,');
    query.SQL.Add('   PARCELA,');
    query.SQL.Add('   DATAINICIO,');

    query.SQL.Add('   CODTIPRECDES,');
    query.SQL.Add('   PLANO,');
    query.SQL.Add('   PLACONTAC,');
    query.SQL.Add('   IDDESCONTO,');
    query.SQL.Add('   UNIDNEGOC,');
    query.SQL.Add('   CODCENTRORESPON,');
    query.SQL.Add('   CODCENTROCUSTOC,');
    query.SQL.Add('   IDEMPRESA,');
    query.SQL.Add('   ORDEM,');
    query.SQL.Add('   FLGDESCONTO,');
    query.SQL.Add('   DATAREFERENCIA,');
    query.SQL.Add('   IDFUNDACAO,');
    query.SQL.Add('   FLGATRASODEVOL,');

    query.SQL.Add('   FLGEXISTEHST,');
    query.SQL.Add('   RECPAG,');
    query.SQL.Add('   CODPROVDESC,');
    query.SQL.Add('   IDEMPRESAPROP,');
    query.SQL.Add('   PLACONTAD,');

    query.SQL.Add('   IDPLANPREVCONTAB,');
    query.SQL.Add('   MATRICULA,');
    query.SQL.Add('   INSCRICAONUMERO,');
    query.SQL.Add('   PERIODO,');
    query.SQL.Add('   EXERCICIO,');
    query.SQL.Add('   IDLOTE,');
    query.SQL.Add('   DATACOBRANCA )');

    query.SQL.Add('VALUES');
    query.SQL.Add('  ('+FloatToStr(lidseq)+',');
    query.SQL.Add(' '+qryDados.FieldByName('IDPESSJUR').text+',');
    query.SQL.Add(' '+qryDados.FieldByName('IDPLANOPREV').text+',');
    query.SQL.Add(' '+qryDados.FieldByName('IDTITULAR').text+',');
    query.SQL.Add(' '+qryDados.FieldByName('IDPESSOA').text+',');
    query.SQL.Add(' '+idrubrica+',');
    query.SQL.Add(' '+qryDados.FieldByName('IDMOTIVO').text+',');
    //condição passar ou não o mes e ano WO22455
    if dAnoMes = '' then
      query.SQL.Add(' '+#39+qryDados.FieldByName('MESCOBRANCA').text+#39+',')
    else
      query.SQL.Add(' '+#39+dAnoMes+#39+',');

    if qryDados.FindField('MESINICIO') = nil then
       //query.SQL.Add(' '+#39+copy(qryDados.FieldByName('Ini Cobr').text,7,4)+'/'+copy(qryDados.FieldByName('Ini Cobr').text,4,2)+#39+',') // WO28073 - Leandro
       //query.SQL.Add(' '+#39+copy(qryDados.FieldByName('IniCobr').text,7,4)+'/'+copy(qryDados.FieldByName('IniCobr').text,4,2)+#39+',')    //WO28073 Leandro
       query.SQL.Add(' '+#39+copy(qryDados.FieldByName('IniCobr').text,7,4)+'/'+copy(qryDados.FieldByName('IniCobr').text,4,2)+#39+',') //WO28156 Leandro
       
    else
      query.SQL.Add(' '+#39+copy(qryDados.FieldByName('MESINICIO').text,7,4)+'/'+copy(qryDados.FieldByName('MESINICIO').text,4,2)+#39+',');

    query.SQL.Add(' '+#39+'D'+#39+','); // SOL 237951 PPM 493275 adicionado o novo flag 'D'
    //BRUNO AZEVEDO INÍCIO SIG33744
    if rValor > 0 then
       query.SQL.Add(' '+OraNumero(FloatToStr(rValor))+',')
    else
       query.SQL.Add(' '+OraNumero(FloatToStr(Abs(qryDados.FieldByName('VALORPREVISTO').AsFloat )))+',');
    //BRUNO AZEVEDO FIM SIG33744
    query.SQL.Add(' '+#39+'B'+#39+',');
    query.SQL.Add(' '+inttostr(Sistema.IdModulo)+',');
    query.SQL.Add(' '+inttostr(Sistema.IdModulo)+',');
    query.SQL.Add(' '+#39+'0'+#39+',');
    query.SQL.Add(' '+#39+'1'+#39+',');
    query.SQL.Add(' '+#39+qryDados.FieldByName('IDHSTORICODIVIDABENEFICIO').text+#39+',');///referencia

    if qryDados.FindField('QTDEPARCELAS') = nil then
       //query.SQL.Add(' '+#39+qryDados.FieldByName('Qtde Parcelas').text+#39+',') ///parcelas //WO28156 leandro
       query.SQL.Add(' '+#39+qryDados.FieldByName('QtdeParcelas').text+#39+',') ///parcelas
    else
       query.SQL.Add(' '+#39+qryDados.FieldByName('Qtdeparcelas').text+#39+',');   ///parcelas

    if qryDados.FindField('QUANTIDADEPARCELASPAGAS') = nil then
       //query.SQL.Add(' '+#39+formatfloat('0',(qryDados.FieldByName('Qtde Pagas').value)+1)+#39+',')   ///parcelas  //WO28073 Leandro
       //query.SQL.Add(' '+#39+formatfloat('0',(qryDados.FieldByName('QtdePagas').value)+1)+#39+',')   ///parcelas // WO28073 - Leandro
       //query.SQL.Add(' '+#39+formatfloat('0',(qryDados.FieldByName('Qtde Pagas').value)+1)+#39+',')   ///parcelas //WO28156 Leandro
       query.SQL.Add(' '+#39+formatfloat('0',(qryDados.FieldByName('QtdePagas').value)+1)+#39+',')   ///parcelas
       
    else
       query.SQL.Add(' '+#39+formatfloat('0',(qryDados.FieldByName('QUANTIDADEPARCELASPAGAS').value)+1)+#39+',');///parcelas

    if qryDados.FindField('MESINICIO') = nil then
       //query.SQL.Add(' '+#39+qryDados.FieldByName('Ini Cobr').text+#39+',') ///parcelas //WO28073 Leandro
       //query.SQL.Add(' '+#39+qryDados.FieldByName('IniCobr').text+#39+',') ///parcelas //WO28073 Leandro
       //query.SQL.Add(' '+#39+qryDados.FieldByName('Ini Cobr').text+#39+',') ///parcelas
       query.SQL.Add(' '+#39+qryDados.FieldByName('IniCobr').text+#39+',') ///parcelas //WO28153  Leandro
    else
       query.SQL.Add(' '+#39+qryDados.FieldByName('MESINICIO').text+#39+','); ///parcelas

    query.SQL.Add(' '+#39+recParam.sCODTIPRECDES+#39+',');
    query.SQL.Add(' '+#39+recParam.sPLANO+#39+',');///plano ver
    query.SQL.Add(' '+#39+recParam.sContaLiquido+#39+',');
    query.SQL.Add(' '+#39+qryDados.FieldByName('IDBENEFICIO').text+#39+',');//IDDESCONTO
    query.SQL.Add(' '+#39+recParam.sUNIDNEGOC+#39+',');
    //      query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39+',');
    query.SQL.Add(' '+#39+recParam.sCODCENTRORESPON+#39+',');

    if recParam.sCODCENTROCUSTOC = '-1' then  // SOL 228648 KINTANA 2062629
       query.SQL.Add(' NULL ,')
    else
       query.SQL.Add(' '+#39+recParam.sCODCENTROCUSTOC+#39+',');  // SOL 228648 KINTANA 2062629

    query.SQL.Add(' '+#39+inttostr(Sistema.IdEmpresa)+#39+',');
    query.SQL.Add(' '+#39+'1'+#39+',');///// Ordem ver
    query.SQL.Add(' '+#39+flgdesconto+#39+',');
    query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39+',');
    query.SQL.Add(' '+#39+'1'+#39+',');
    query.SQL.Add(' '+#39+SFLGATRASODEVOL+#39+',');

    query.SQL.Add(' '+#39+'0'+#39+',');
    query.SQL.Add(' '+#39+'P'+#39+',');
    query.SQL.Add(' '+#39+sCODPROVDESC+#39+',');
    query.SQL.Add(' '+#39+'1'+#39+',');
    query.SQL.Add(' '+#39+recParam.sPLACONTAD+#39+',');

    query.SQL.Add(' '+#39+recParam.sIDPLANPREVCONTAB+#39+',');
    query.SQL.Add(' '+#39+qryDados.FieldByName('Matricula').text+#39+',');          //MIGRACAO-ORACLE
    query.SQL.Add(' '+#39+sINSCRICAONUMERO+#39+',');

    query.SQL.Add(' '+#39+ COPY(qryDados.FieldByName('MESCOBRANCA').text,6,2)+#39+',');
    query.SQL.Add(' '+#39+ COPY(qryDados.FieldByName('MESCOBRANCA').text,1,4)+#39+',');

    query.SQL.Add(' '+#39+INTTOSTR(iIdLote)+#39+',');
    query.SQL.Add(' '+#39+DateToStr(StrToDate(DateToStr(Now)))+#39);
    query.SQL.Add(' )');
    try
      query.ExecSQL;

      recParam.iIdSeq := lidseq;
    except
      result := -2;    //erro inserir TMPDESC
    end;
   finally
     query.close;
     query.destroy;
     query2.close;
     query2.destroy;
  end ;
end;


//function InserirRubricaIndividual(qryDados : TwwQuery; rValor : Double; iIdLote, iIdTmpDesc : integer) : boolean; // leandro sig136150
function InserirRubricaIndividual(qryDados : TwwQuery; rValor : Double; iIdLote, iIdTmpDesc, iIdPlanPrev : integer; dData : string) : boolean; //leandro sig136150   // WO22455 Ferrari
var
  qrySEQRUBRICAINDIV : TwwQuery;
  insRUBRICAINDIV : TwwQuery;
  sequencialRubricaIndiv : Integer;
  qryIDRUBRICA : TwwQuery;  //leandro sig136150
  iIdRubrica : integer; //leandro sig136150
  _MESREFERENCIA : string;
begin
  Result := true;

  //leandro SIG136150 : inicio

  //Obter IdRubrica
  iIdRubrica := -1;
  qryIDRUBRICA := TwwQuery.Create(nil);
  try
    qryIDRUBRICA.DatabaseName := 'BaseDados';
    with qryIDRUBRICA do
    begin
      SQL.Clear;
      SQL.Add('SELECT IDRUBRICARECBOLDIVIDA ');
      SQL.Add('  FROM PLANPREV ');
      SQL.Add(' WHERE IDPLANOPREV = ' + IntToStr(iIdPlanPrev));
    end;
    qryIDRUBRICA.Open;
    if (not(qryIDRUBRICA.IsEmpty)) then
    begin
      iIdRubrica := qryIDRUBRICA.FieldByName('IDRUBRICARECBOLDIVIDA').AsInteger;
    end;
  finally
    FreeAndNil(qryIDRUBRICA);
  end;
  //leandro SIG136150 : fim

  //Obter sequencial da rubrica individual
  sequencialRubricaIndiv := 1;
  qrySEQRUBRICAINDIV := TwwQuery.Create(nil);
  try
    qrySEQRUBRICAINDIV.DatabaseName := 'BaseDados';
    with qrySEQRUBRICAINDIV do
    begin
      SQL.Clear;
      SQL.Add('SELECT (NVL(MAX(RI_S.SEQRUBRICAINDIV), 0)+1) SEQRUBRICAINDIV');
      SQL.Add('  FROM RUBRICAINDIV RI_S');
      SQL.Add(' WHERE RI_S.IDPESSOA  = '+qryDados.FieldByName('IDPESSOA').AsString);
      //SQL.Add('   AND RI_S.IDRUBRICA = 34134'); //leandro sig136150
      SQL.Add('   AND RI_S.IDRUBRICA = ' + IntToStr(iIdRubrica));  //leandro sig136150
    end;
    qrySEQRUBRICAINDIV.Open;
    if (not(qrySEQRUBRICAINDIV.IsEmpty)) then
    begin
      sequencialRubricaIndiv := qrySEQRUBRICAINDIV.FieldByName('SEQRUBRICAINDIV').AsInteger;
    end;
  finally
    FreeAndNil(qrySEQRUBRICAINDIV);
  end;

  //Inserir registro da RUBRICAINDIV
  insRUBRICAINDIV := TwwQuery.Create(Application);
  try
    insRUBRICAINDIV.DatabaseName := 'BaseDados';
    //_MESREFERENCIA:=COPY(qryDados.FieldByName('Ini Cobr').asstring,7,4)+'/'+COPY(qryDados.FieldByName('Ini Cobr').Asstring,4,2);   // WO22455 Ferrari //WO28073 Leandro
    //_MESREFERENCIA:=COPY(qryDados.FieldByName('IniCobr').asstring,7,4)+'/'+COPY(qryDados.FieldByName('IniCobr').Asstring,4,2);   // WO22455 Ferrari   //WO28073 Leandro
    //_MESREFERENCIA:=COPY(qryDados.FieldByName('Ini Cobr').asstring,7,4)+'/'+COPY(qryDados.FieldByName('Ini Cobr').Asstring,4,2);   // WO22455 Ferrari
    _MESREFERENCIA:=COPY(qryDados.FieldByName('IniCobr').asstring,7,4)+'/'+COPY(qryDados.FieldByName('IniCobr').Asstring,4,2);   // WO22455 Ferrari //WO28156 Leandro
    with insRUBRICAINDIV do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO RUBRICAINDIV (');
      SQL.Add('   IDPESSOA,');
      SQL.Add('   IDEMPRESA,');
      SQL.Add('   IDRUBRICA,');
      SQL.Add('   NUMOCORRENCIAS,');
      SQL.Add('   SEQRUBRICAINDIV,');
      SQL.Add('   IDFAVORECIDO,');
      SQL.Add('   IDREGRACALCULO,');
      SQL.Add('   VALORRUBRICA,');
      SQL.Add('   ANOMESINICIO,');
      SQL.Add('   FLGPERMANENTE,');
      SQL.Add('   PARCELAS,');
      SQL.Add('   FLGPERCENT,');
      SQL.Add('   FLGTPRUBMANUT,');
      SQL.Add('   FLGPENSAOALIM,');
      SQL.Add('   RUBRICAPROVENTOPA,');
      SQL.Add('   DATAFINAL,');
      SQL.Add('   ANOMESREF,');
      SQL.Add('   CODPORTFORMA,');
      SQL.Add('   IDTITULAR,');
      SQL.Add('   DATAINICIO,');
      SQL.Add('   FLGBASEPA,');
      SQL.Add('   FLGUSAABONO,');
      SQL.Add('   IDALIMENTADO,');
      SQL.Add('   IDLOTE,');
      SQL.Add('   FLGDESATIVADO,');
      SQL.Add('   FLGUSADO,');
      SQL.Add('   FLGCALCULACPMF,');
      SQL.Add('   ULTMESPREPARO,');
      SQL.Add('   VALORANTERIOR,');
      SQL.Add('   IDPROCESSO,');
      SQL.Add('   IDRUBRICA13,');
      SQL.Add('   IDRUBRICAPROVENTO13,');
      SQL.Add('   IDMOTIVO,');
      SQL.Add('   IDLOTEREVISAO,');
      SQL.Add('   FLGANTECIPABONO,');
      SQL.Add('   IDSEQINTERNOFB,');
      SQL.Add('   NUMPROCINSS,');
      SQL.Add('   IDMOVBENEF,');
      SQL.Add('   FLGCONTROLASALDO,');
      SQL.Add('   VLRSALDOINICIAL,');
      SQL.Add('   VLRTOTALPROC,');
      SQL.Add('   IDPLANOCONTABIL,');
      SQL.Add('   FLGRETROACAO,');
      SQL.Add('   FLGANTECIPAABONOINSS,');
      SQL.Add('   SITUACAOAJ,');
      SQL.Add('   OBSERVACAO,');
      SQL.Add('   FLGRUBRICARESGATE,');
      SQL.Add('   IDTMPDESC,');
      SQL.Add('   FLGREPROGRAMACAO, ');
      SQL.Add('   FLGRESGATEPARCELADO ');
      SQL.Add(' )');
      SQL.Add(' VALUES');
      SQL.Add(' (');
      SQL.Add('   '+qryDados.FieldByName('IDPESSOA').AsString+ ',');                 //IDPESSOA
      SQL.Add('   1,');                                                              //IDEMPRESA
      //SQL.Add('   34134,');                                                        //IDRUBRICA //leandro sig136150
      SQL.Add('   ' + intToStr(iIdRubrica) + ',');                                   //IDRUBRICA //leandro sig136150
      SQL.Add('   0,');                                                              //NUMOCORRENCIAS
      SQL.Add('   '+IntToStr(sequencialRubricaIndiv)+ ',');                          //SEQRUBRICAINDIV
      SQL.Add('   NULL,');                                                           //IDFAVORECIDO
      SQL.Add('   26128,');                                                          //IDREGRACALCULO
      SQL.Add('   '+OraNumero(FloatToStr(rValor))+',');                              //VALORRUBRICA
      SQL.Add('   null,');                                                           //ANOMESINICIO
      SQL.Add('   0,');                                                              //FLGPERMANENTE
      SQL.Add('   1,');                                                              //PARCELAS
      SQL.Add('   NULL,');                                                           //FLGPERCENT
      SQL.Add('   1,');                                                              //FLGTPRUBMANUT
      SQL.Add('   0,');                                                              //FLGPENSAOALIM
      SQL.Add('   NULL,');                                                           //RUBRICAPROVENTOPA
      SQL.Add('   '+QuotedStr(dData)+',');                                               //DATAFINAL data Vindo da contabilização WO22455 Ferrari
      SQL.Add('   '+QuotedStr(_MESREFERENCIA)+',');                                  //ANOMESREF         WO22455 Ferrari
      SQL.Add('   NULL,');                                                           //CODPORTFORMA
      SQL.Add('   '+qryDados.FieldByName('IDTITULAR').AsString+',');                 //IDTITULAR
      SQL.Add('   '+QuotedStr('01/'+copy(dData,4,7))+',');                             //DATAINICIO   WO22455 Ferrari
      SQL.Add('   0,');                                                              //FLGBASEPA
      SQL.Add('   0,');                                                              //FLGUSAABONO
      SQL.Add('   NULL,');                                                           //IDALIMENTADO
      SQL.Add('   '+intToStr(iIdLote)+',');                                          //IDLOTE
      SQL.Add('   0,');                                                              //FLGDESATIVADO
      SQL.Add('   null,');                                                           //FLGUSADO
      SQL.Add('   0,');                                                              //FLGCALCULACPMF
      SQL.Add('   NULL,');                                                           //ULTMESPREPARO
      SQL.Add('   0,');                                                              //VALORANTERIOR
      SQL.Add('   NULL,');                                                           //IDPROCESSO
      SQL.Add('   NULL,');                                                           //IDRUBRICA13
      SQL.Add('   NULL,');                                                           //IDRUBRICAPROVENTO13
      SQL.Add('   3123,');                                                           //IDMOTIVO
      SQL.Add('   NULL,');                                                           //IDLOTEREVISAO
      SQL.Add('   NULL,');                                                           //FLGANTECIPABONO
      SQL.Add('   null,');                                                           //IDSEQINTERNOFB
      SQL.Add('   NULL,');                                                           //NUMPROCINSS
      SQL.Add('   NULL,');                                                           //IDMOVBENEF
      SQL.Add('   0,');                                                              //FLGCONTROLASALDO
      SQL.Add('   0,');                                                              //VLRSALDOINICIAL
      SQL.Add('   NULL,');                                                           //VLRTOTALPROC
//      SQL.Add('   null,');                                                           //IDPLANOCONTABIL      //SIG 132927
      SQL.Add('   '+qryDados.FieldByName('IDPLANPREVCONTAB').AsString+',');          //IDPLANOCONTABIL      //SIG 132927 Ferrari
      SQL.Add('   1,');                                                              //FLGRETROACAO
      SQL.Add('   NULL,');                                                           //FLGANTECIPAABONOINSS
      SQL.Add('   NULL,');                                                           //SITUACAOAJ
      SQL.Add('   NULL,');                                                           //OBSERVACAO
      SQL.Add('   0,');                                                              //FLGRUBRICARESGATE
      //SQL.Add('   '+IntToStr(iIdTmpDesc)+',');                                     //IDTMPDESC
      SQL.Add('   null,');                                                           //IDTMPDESC
      SQL.Add('   NULL,');                                                           //FLGREPROGRAMACAO
      SQL.Add('   0');                                                               //FLGRESGATEPARCELADO
      SQL.Add(' )');
    end;
    try
       insRUBRICAINDIV.ExecSQL();
    except
      Result := false;
    end;
  finally
    FreeAndNil(insRUBRICAINDIV);
  end;
end;



function LancaDoc( qryDados : TwwQuery; var ctrlDocumento : TCtrlDocumento;
                   iCodLancCAPCAR, PlnCodigo, iidPessoa,
                   idblkNovoPortForma, iUnidNegoc, iCodTipDoc : integer;
                   sdtenvio, sdtvencto, sNoDocumento, smmMotivo,
                   sTipRecDes, sCentroRespon, sCentroCusto, sContaCliFor,    //edilaine - SIG33744
                   RecPag: string;
                   valor: real;
                   aicodforma: integer
                  ) : Boolean;
var
   lNumLancto    : longint;
   ssql, sDebCre : String;
   lidcbancaria  : integer;
   query : TwwQuery; //SIG20880
   bCadastraCli  : boolean;
   ind : integer;
   sMensagens: Array[1..10] Of String;
begin
   Result:=true;

   // SIG20880 inicio
   query:=TwwQuery.Create(nil);
   query.DataBaseName :='BaseDados';

   try
     query.close;
     query.SQL.Clear;
     query.SQL.add('SELECT IDFORCLI,CONTACCLIENTE FROM EMPRESACLIENTE WHERE IDFORCLI = ' +IntToStr(iidPessoa) );    //SIG 136150
     query.Open;
     bCadastraCli := query.isEmpty;

     try
        lidcbancaria:=0;

        //Início - William Santana - SIG33744
        if RecPag = 'P' then
        begin
          sDebCre:='C';
          iCodTipDoc := 51; //Diversos
        end
        else
        begin
          sDebCre:='D';
          iCodTipDoc := 93;  // diversos   111; //Sicov
        end;
        //Término - William Santana - SIG33744

        if bCadastraCli then
        begin
          if not CtrlDocumento.ForCli.Inserir(iidPessoa,
                                              Sistema.IdEmpresa,
                                              0,
                                              0,
                                              0,
                                              '',
                                              '',
                                              sContaCliFor, // '', - Leandro  SIG135150
                                              '',
                                              tfcCliente) then
          begin
            Result := false;
            exit;
          end;
        end
        // inicio // SIG136150 Ferrari
        else if trim(query.fieldbyname('CONTACCLIENTE').asstring) <> trim(sContaCliFor) then
        begin
         query.close;
         query.SQL.Clear;
         query.SQL.add('UPDATE EMPRESACLIENTE SET CONTACCLIENTE = ' + quotedstr(sContaCliFor) + ' , plano = null, Contacreceita = null, Contacadiantamento = null, Codsubconta = null WHERE IDFORCLI = ' +IntToStr(iidPessoa) );    //SIG 136150
         query.execsql;

        end;

        // fim // SIG136150 Ferrari
        CtrlDocumento.SetValues(
          icodlanccapcar, //licoddocumento
          strtofloat(snodocumento), //nodocumento
          '',  //scompldocumento
          '0', // sStatus
          recpag, // recpag
          '2', // sOperacao
          '',  //sNumslip,
          '',  //sNumleitcodbarras,
          sContaCliFor, //sPlaconta,
          '',  //sCodcentrocusto,
          '',  //sNossonumero,
          '',  //sNumdigcodbarras,
          '',  //sGrupodoc,
          '',  //sFlgemitelancbaix,
          '',  //sFlgconfirmarecpag,
          '',  //sEmisbloq,
          '',  //sReferencia,
          'NÃO RECEBER APÓS O VENCIMENTO',  //sObs         //edilaine - SIG33744
          strtodate(sdtvencto), //dDatavencto,
          strtodate(sdtenvio), //dDataemissao,
          strtodate(sdtvencto), //dDataprogramada,
          0,  //dDataremessa,
          0,  //dDatalimite,
          0,  //dDatacorrecao,
          0,  //rVlrmulta,
          0,  //rValorjuros,
          0,  //rValordesconto,
          0,  //rPercjurossimples,
          0,  //rPercjurosatuarial
          {111} iCodTipDoc,                               //edilaine - SIG33744
          Sistema.IdEmpresa, //liIdpessoa,
          Sistema.idmodulo, //liIdmodulo,
          iidPessoa, //liIdforcli,
          0, //liNumfatura,
          lidcbancaria, //liIdcbancaria,
          prmUnidNegoc, //-1, //liUnidnegoc,
          IntegraBack.Plano, //liPlano,//ver
          0, //liNumcpbaixa,
          0, //liNumapgr,
          0, //liMoecodigo,
          0, //liLotetransmissao,
          0, //liIndicecorrecao,
          Sistema.Idusuario, //liIdusuarioinclusao,
          Sistema.IdEmpresa, //liIdempresa,
          0, //liFlgnaoconciliado,
          0, //liControleremessa,
          0, //liCodsubconta,
          idblkNovoPortForma, //liCodportforma,
          0, //liCodgrupocnab,
          0, //liCodgeradorinss,
          aicodforma //liCodforma
           );


        CtrlDocumento.Lanctodocum.SetValues(
          strtodate(sdtenvio), //dDatalancto
          icodlanccapcar, //licoddocumento
          0, //liNumlancto
          valor, //rVlrliquido,
          0, //rValorOM
          valor, //rValor
          prmUnidNegoc, //-1, //liUnidnegoc,
          PlnCodigo, //liPlncodigo
          0, //liNumlotemanual,
          Sistema.Idusuario, //liIdusuarioinclusao,
          Sistema.IdEmpresa, //liIdempresa,
          0, //liIdnflivro,
          0, //liEstorno,
          {111} iCodTipDoc,                                  //edilaine - SIG33744
          0, //liCoddocinss,
          0, //liCodalterador
          '2', //sOperacao,
          '', //sNumrecibo,
          '', //sNumnf,
          '', //sNumfatura,
          copy(smmMotivo,1,60), //sHistoricocompl,
          '', //sFlgtipofatura,
          '', //sFlgrecebeunf,
          '', //sFlgfatemitida,
          sdebcre, //sDebcre
          Sistema.idmodulo, //liIdModulo
          IntegraBack.Plano, //liPlanoConta///ver
          Sistema.UsaPlanoPatro, //bUsaPlanoPatro
          false, //bContabiliza
          idblkNovoPortForma, //iCodPortForma,
          0, //iDiasFloat
          '', //sContaBaixa
          0 //liSubContaBaixa
          );


        CtrlDocumento.Rateiodocum.SetValues(
          valor, //rValor,
          0, //rValorOM,
          0, //rVlrresorcamen: Double;
          0, //liIdrateiodocum,
          Sistema.Idempresa, //liIdpessoa,
          icodlanccapcar, //licoddocumento
          iUnidNegoc, //liUnidnegoc,
          0, //liMoecodigo,
          Sistema.Idusuario, //liIdusuarioinclusao,
          0, //liIdreservaorcamen,
          IntegraBack.Plano, //liPlano,///ver
      //    qryDados.FieldByName('IDPLANOPREV').value, //liIdplanoprev,        // SIG 132927 Ferrari
          qryDados.FieldByName('IDPLANPREVCONTAB').value, //liIdplanoprev,    // SIG 132927 Ferrari
          qryDados.FieldByName('IDPESSJUR').value, //liIdpatro,
          1, //liIdprograma,
          0, //liIdprocesso,
          Sistema.idempresa, //liIdempresa
          sTipRecDes, //sCodtiprecdes,
          recpag, //sRecpag,
          sCentroRespon, //sCodcentrorespon,
          {''} sCentroCusto {SistemaFolha.CODCCUSTOFINAN}, //sCodcentrocusto,///ver      //edilaine - SIG33744
          '' //sNumimovel
          );

        if not CtrlDocumento.Insert then
        begin
          CtrlDocumento.MessageInfo := 'Matricula: '+ qryDados.FieldByName('MATRICULA').AsString + '  ' +    //MIGRACAO-ORACLE
                       '[Dívida: '  + CompletaString(qryDados.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' Erro ao inserir documento.';
          Result := false;
        end;

        // mensagem para boleto
        if Result then
        begin
          For ind := 1 To 10 Do sMensagens[ind] := '';
          sMensagens[1] := 'NÃO RECEBER APÓS O VENCIMENTO';

          If Not CtrlDocumento.IntBanco.SetaMensagensCNAB(icodlanccapcar, -1, sMensagens, false) Then
          Begin
            CtrlDocumento.MessageInfo := 'Matricula: '+ qryDados.FieldByName('MATRICULA').AsString + '  ' +            //MIGRACAO-ORACLE
                         '[Dívida: '  + CompletaString(qryDados.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                         ' Erro ao inserir mensagem no documento';
            Result := false;
          end;
        end;

       // INSERT INTO MENSAGENSCNAB (IDMENSAGENSCNAB, CODDOCUMENTO, CODGRUPOCNAB,  MENSAGEM1, MENSAGEM2, MENSAGEM3, MENSAGEM4, MENSAGEM5,  MENSAGEM6, MENSAGEM7, MENSAGEM8, MENSAGEM9, MENSAGEM10)
       // VALUES (13028995, 14087015, NULL, 'NÃO RECEBER APÓS O VENCIMENTO', '', '', '', '', '', '', '', '', '')


      except
        on E:Exception do
        begin
          CtrlDocumento.MessageInfo := 'Matricula: '+ qryDados.FieldByName('MATRICULA').AsString + '  ' +   //MIGRACAO-ORACLE
                       '[Dívida: '  + CompletaString(qryDados.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString, ' ', 8, false) + ']: ' +
                       ' erro ao inserir documento: '+e.Message;
          Result := false;
        end;
      end;

  finally
    FreeAndNil(query);
  end;

end;



function GeraBoleto(qryDados, _qryaux : TwwQuery; var lstSql : TStringList; sMsg : TStringList) : boolean;
var
  CtrlGeraBoleto : TCtrlGeraBoleto;
  sCodDocumento  : string;
  aReportDesign, aReportModelo: TMemoryStream;
  sCaminho, sNomeArq : string;
  bUnico : boolean;
  frmReport : TFrmPreview;
  sCodDivida : string;
  sMatricula : string;
begin
  result := false;

  CtrlGeraBoleto := TCtrlGeraBoleto.create;
  CtrlGeraBoleto.Initialize( dtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True
                             );

  {-----------------------------------------------------------------------------
   modelos de cobrança
  ------------------------------------------------------------------------------
   20: Caixa - SICOB
   22: SICOB - emprestimo
   24: SIGCB
   25: SICOB Funcef
   26: Cobrança registrada      <----
  -----------------------------------------------------------------------------}

  aReportDesign := TMemoryStream.Create;
  aReportModelo := TMemoryStream.Create;

  lstSql.clear;

  try
    bUnico := qryDados.RecordCount = 1;

    while not qryDados.eof do
    begin
      sMatricula := qryDados.FieldByName('Matricula').AsString;        //MIGRACAO-ORACLE
      sCodDivida := qryDados.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString;

      if (qryDados.FieldByName('FLGSTATUS').AsInteger <> 1) or
         (qryDados.FieldByName('FLGQUITADO').AsInteger = 1) then
      begin
        if bUnico then
           sMsg.text := 'Boleto não gerado para dívida '+iif(qryDados.FieldByName('FLGSTATUS').AsInteger = 2, 'suspensa', 'quitada')
        else
           sMsg.Add('Matricula: '+ sMatricula + '  ' +
                    '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                    ' Boleto não gerado para dívida '+iif(qryDados.FieldByName('FLGSTATUS').AsInteger = 2, 'suspensa', 'quitada') );
        qryDados.next;
        Continue;
      end;

      sCodDocumento := Trim(qryDados.FieldByName('CODDOCUMENTO').AsString);

      _qryAux.close;
      _qryAux.sql.clear;
      _qryAux.Sql.Add('SELECT p.descricao, R.NAME, R.IDREPORTS, R.ORIGEMCM, R.TEMPLATE ');
      _qryAux.Sql.Add('  FROM PORTADORFORMA P ');
      _qryAux.Sql.Add('  LEFT JOIN CONFIGBARRAS C ON C.IDCONFIGBARRAS = P.IDCONFIGBARRAS ');
      _qryAux.Sql.Add('  LEFT JOIN REPORTS R ON C.IDREPORTS = R.IDREPORTS ');
      _qryAux.Sql.Add(' WHERE P.CODPORTFORMA = '+qryDados.FieldByName('CODPORTFORMA').AsString );
      _qryAux.open;
      if (_qryAux.eof) or (_qryAux.FieldByName('IDREPORTS').AsString = '') then
      begin
        if bUnico then
           sMsg.text := 'Modelo de Boleto não localizado para Forma de Cobrança - Documento: '+sCodDocumento
        else
           sMsg.Add('Matricula: '+ sMatricula + '  ' +
                    '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                    ' Modelo de Boleto não localizado para Forma de Cobrança - Documento: '+sCodDocumento );
        qryDados.next;
        Continue;
      end;

      //passa dataset com dados para impressao (deve conter o campo CODDOCUMENTO)
      if CtrlGeraBoleto.PreparaDados(26, qryDados.FieldByName('IDCONTROLEDIVIDABENEFICIO').AsString,
                                         sCodDocumento,  {qryDados,}
                                         lstSql) then
      begin

        if not CtrlGeraBoleto.cdsDados.eof then
        begin

          CtrlGeraBoleto.cdsDados.first;
          if not CtrlGeraBoleto.cdsDados.eof then
          begin

            sCaminho := CaminhoParaSalvarArquivo(CtrlGeraBoleto.cdsDados.FieldByName('MATR_TITULAR').AsString,
                                                 CtrlGeraBoleto.cdsDados.FieldByName('MATRICULA').AsString);

            sNomeArq := 'Boleto ' + StringReplace(RetornaAnoMes(CtrlGeraBoleto.cdsDados.FieldByName('DATAPROGRAMADA').AsDateTime), '/', '', []) + ' - ' +
                                    CtrlGeraBoleto.cdsDados.FieldByName('MATRICULA').AsString  +'.pdf';


            RptModeloBoleto :=  TRptModeloBoleto.create(nil);
            try
              with RptModeloBoleto do
              begin
                  //edilaine SIG129180 : inicio
                  PpDados.datasource.dataset := CtrlGeraBoleto.cdsDados;

                  //cdsDados.data     := CtrlGeraBoleto.cdsDados.data;
                  {cdsDados} PpDados.datasource.dataset.Filtered := false;
                  {cdsDados} PpDados.datasource.dataset.Filter   := 'CODDOCUMENTO = '+ sCodDocumento;
                  {cdsDados} PpDados.datasource.dataset.Filtered := true;

                  if {cdsDados} PpDados.datasource.dataset.eof then
                  begin
                    {cdsDados} PpDados.datasource.dataset.Filtered := false;
                    {CtrlGeraBoleto.cdsDados} PpDados.datasource.dataset.Next;
                    continue;
                  end;
                  //edilaine SIG129180 : fim

                  try
                    aReportDesign.Clear;
                    TBlobField(_qryAux.FieldByName('TEMPLATE')).SaveToStream(aReportDesign);

                    aReportDesign.Position := 0;
                    DsgnCM.Report.Template.LoadFromStream(aReportDesign);

                    DsgnCM.Report.Template.SaveTo      := stFile;
                    DsgnCM.Report.Template.Format      := ftBinary;
                    DsgnCM.Report.Device               := dvFile;
                    DsgnCM.Report.DeviceType           := 'PDFFile';

                    DsgnCM.Report.TextFileName         :=  sCaminho + '\' + sNomeArq;
                    DsgnCM.Report.ArchiveFileName      :=  sCaminho + '\' + sNomeArq;
                    DsgnCM.Report.ShowAutoSearchDialog := False;
                    DsgnCM.Report.ShowPrintDialog      := False;
                    DsgnCM.report.ShowCancelDialog     := False;
                    DsgnCM.Report.AllowPrintToArchive  := True;
                    DsgnCM.Report.AllowPrintToFile     := True;


                    DsgnCM.Report.Print;

                    if FileExists(sCaminho + '\' + sNomeArq) then
                    begin
                      //LEANDRO POCEBON SIG131169 20/12/2022 : INICIO
                      lstSql.Add('UPDATE DOCUMENTO SET EMISBLOQ = ''S'', NOSSONUMERO = ' + Quotedstr(CtrlGeraBoleto.cdsDados.FieldByName('NOSSONUMERO').AsString) + ' WHERE CODDOCUMENTO = '+sCodDocumento +'; ' );
                      //LEANDRO POCEBON SIG131169 20/12/2022 : fim

                      if not bUnico then
                         sMsg.Add('Matricula: '+ sMatricula + '  ' +
                                  '[Dívida: '  + CompletaString(CtrlGeraBoleto.cdsDados.FieldByName('CODIGODIVIDA').AsString, ' ', 8, false) + ']: ' +
                                  ' Boleto gerado - Documento: '+sCodDocumento+'  ['+sCaminho+']');
                    end;
                  except
                    if bUnico then
                       sMsg.text := 'Erro ao gerar documento'
                    else
                       sMsg.Add('Matricula: '+ sMatricula + '  ' +
                                '[Dívida: '  + CompletaString(CtrlGeraBoleto.cdsDados.FieldByName('CODIGODIVIDA').AsString, ' ', 8, false) + ']: ' +
                                ' Erro ao gerar boleto - Documento: '+sCodDocumento);
                  end;
              end;
            finally
              RptModeloBoleto.PpDados.datasource.dataset := nil;
              RptModeloBoleto.free;
            end;

          end;

        end
        else
        begin
          if bUnico then
             sMsg.text := 'Não há dados para gerar documentos'
          else
             sMsg.Add('Matricula: '+ sMatricula + '  ' +
                      '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                      ' Não há dados para gerar boleto - Documento: '+sCodDocumento);
        end;
      end
      else
      begin
         if bUnico then
            sMsg.text := 'Não foi possível gerar documentos'
         else
            sMsg.Add('Matricula: '+ sMatricula + '  ' +
                     '[Dívida: '  + CompletaString(sCodDivida, ' ', 8, false) + ']: ' +
                     ' Não foi possível gerar boleto - Documento: '+sCodDocumento);
      end;

      qryDados.next;
    end;


    //atualiza dados da impressao
    if lstSql.Count > 0 then
    begin
      result := true;
      if bUnico then
         sMsg.text := 'Documentos gerados com sucesso em: '+char(10)+char(13)+ sCaminho;
    end;


  finally
    FreeAndNil(CtrlGeraBoleto);
    aReportDesign.Free;
    aReportModelo.Free;
  end;
end;


procedure SalvaResultado(Texto : TMemo; sOperacao : String; sFileName: String = 'RESULTADO');
Var
  F : TextFile;
  ind : integer;
  sCaminho : string;
  sAuxFileName : string;
Begin
    sCaminho := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

    {$I-}
    sAuxFileName := sCaminho + '\'+ sFileName+'.txt';

    AssignFile(F,sAuxFileName);
    if FileExists(sAuxFileName) then
       Append(F)
    else
       ReWrite(F);

    Writeln(F,'========================================================================');
    Writeln(F,'Histórico Operações - Dívida de Benefício [ '+sOperacao +' - '+DateTimeToStr(Now) +' ]');
    Writeln(F, '');
    for ind := 0 to Texto.Lines.Count-1 do
    begin
      Writeln(F, Texto.lines.Strings[ind] );
    end;

    Close(F);
    {$I+}
    Application.ProcessMessages;
end;

//edilaine SIG115304 : inicio
function VerificaPeridoBloqueado(sMesCobranca : string; winControl : TWinControl;
                                 bExibeMsg : boolean = true; bDesfaz : boolean = false): integer;
var
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
   qryAux      : TwwQuery;
   CtrlContab  : TCtrlContab;
begin
   Result := 0;

   CtrlContab := TCtrlContab.Create;
   CtrlContab.Initialize(dtmBaseDados.dbBaseDados,
                         true,
                         Sistema.ConnectionType,
                         Sistema.ConnectionSide);

   qryAux := TwwQuery.create(nil);
   qryAux.DataBaseName := 'BaseDados';

   try
     try
        // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s)
        sDataLanc   := '01'+copy(sMesCobranca,5,3)+'/'+copy(sMesCobranca,1,4);
        sDataLanc   := DateToStr(TrazUltDiaData(StrToDate(sDataLanc)));
        iEmpresa    := Sistema.idEmpresa;
        sMsgContab  := '';

        // verifica se ja executou contabilização
        //edilaine SIG115304 : inicio
        if not bDesfaz then
        begin
          qryAux.close;
          qryAux.SQL.Clear;
          qryAux.SQL.Text := 'SELECT H.* FROM HSTDIVIDABENEFICIO H '+
                             ' WHERE H.MESCOBRANCA = '+QuotedStr(sMesCobranca) +
                             '   AND H.PLNCODIGO IS NOT NULL ';
          qryAux.Open;
          if not qryAux.isEmpty then
          begin
            result := 1;
            if bExibeMsg then      //edilaine SIG115304
               raise EValidacao.CreateVal('Contabilização já processada para o período indicado: ' + #13 + '"' + sMesCobranca + '"', winControl);
          end;
        end;
        //edilaine SIG115304 : fim

        if TestaPeriodo(False, 'BaseDados', sDataLanc, IntToStr(Sistema.IdModulo), iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
        begin
          if result = 0 then     // SIG 134591 Ferrari
            Begin
              result := 2;
              raise EValidacao.CreateVal('Não é possível contabilizar no período indicado: ' + #13 + '"' + sMsgContab + '"', winControl);
            end;
        end;                     // SIG 134591 Ferrari

        if not(CtrlContab.TestaDataBloqueadaProc(iEmpresa, Sistema.IdModulo, sDataLanc)) then
        begin
          if result = 0 then           // SIG 134591 Ferrari
            Begin
              result := 3;
              sMsgContab := CtrlContab.MessageInfo;
              raise EValidacao.CreateVal('Não é possível contabilizar no período indicado: ' + #13 + '"' + sMsgContab + '"', winControl);
            end;  
        end;                         // SIG 134591 Ferrari

     except
        on ev : EValidacao do
        begin
           Screen.Cursor := crDefault;
            MsgDlg(ev.message, 'Beneficio Previdenciário', mtWarning, [mbOk], 0);
           if qryAux.active then qryAux.close;
           if ev.Control.CanFocus then ev.Control.SetFocus;
           Exit;
        end;
     end;

   finally
     FreeAndNil(qryAux);
     CtrlContab.Free;
   end;
end;
//edilaine SIG115304 : fim


//edilaine SIG126276 : inicio
function CriaLogDivida(sCodDivida, sTipoMov  : string;
                       sSaldoAnt : string = ''; sParcelaAnt : string = '';
                       sParcelaDesc : string = '' ) : boolean;//Helen WO8288 - add sParcelaDesc
var
   qryAux : TwwQuery;
   qryInc : TwwQuery;
   iIdMovDiv : integer;
begin
   Result := false;

   {DECODE TABELA TIPOMOVDIVIDA
      1 - Início da dívida
      2 - Suspensão
      3 - Reativação
      4 - Encerramento
      5 - Baixa definitiva
      6 - Quitação
      7 - Alteração de Saldo
      8 - Reajuste
      9 - Alteração Manual
     10 - Desfaz Reajuste
     11 - Desfaz Quitação
     12 - Desfaz Baixa Definitiva
     13 .... Verificar na  TABELA TIPOMOVDIVIDA //Helen WO8288
   }

   qryAux := TwwQuery.create(nil);
   qryAux.DataBaseName := 'BaseDados';

   qryInc := TwwQuery.create(nil);
   qryInc.DataBaseName := 'BaseDados';

   try
     try
       iIdMovDiv := LeUltRegistro(qryAux,'MOVDIVIDA');

       qryAux.Close;
       qryAux.SQL.Add('SELECT C.* ');
       qryAux.SQL.Add('  FROM CONTROLEDIVIDABENEFICIO C');
       qryAux.SQL.Add(' WHERE C.IDCONTROLEDIVIDABENEFICIO = '+ sCodDivida );
       qryAux.Open;

       if sSaldoAnt = '' then
          sSaldoAnt := qryAux.FieldByName('SALDODEVEDORATUAL').AsString;

       if sParcelaAnt = '' then
          sParcelaAnt := qryAux.FieldByName('QTDEPARCELAS').AsString;

       qryInc.Close;
       qryInc.SQL.Add('INSERT INTO MOVDIVIDA (      ');
       qryInc.SQL.Add('  IDMOVDIVIDABENEFICIO,      ');
       qryInc.SQL.Add('  IDCONTROLEDIVIDABENEFICIO, ');
       qryInc.SQL.Add('  IDPESSOA,                  ');
       qryInc.SQL.Add('  IDTITULAR,                 ');
       qryInc.SQL.Add('  IDBENEFICIO,               ');
       qryInc.SQL.Add('  IDPLANOPREV,               ');
       qryInc.SQL.Add('  DATAMOV,                   ');
       qryInc.SQL.Add('  IDTIPOMOVDIVIDA,           ');
       qryInc.SQL.Add('  VALORULTIMAPARCELA,        ');
       qryInc.SQL.Add('  VALORPARCELA,              ');
       qryInc.SQL.Add('  SALDODEVEDORATUAL,         ');
       qryInc.SQL.Add('  SALDODEVEDORANT,           ');
       qryInc.SQL.Add('  MESINICIO,                 ');
       qryInc.SQL.Add('  MESFIM,                    ');
       qryInc.SQL.Add('  QTDEPARCELASANT,           ');
       qryInc.SQL.Add('  QTDEPARCELASATUAL,         ');
       qryInc.SQL.Add('  FLGDESATIVADO,             ');
       qryInc.SQL.Add('  FLGATUALIZARSALDO,         ');
       qryInc.SQL.Add('  FLGQUITADO,                ');
       qryInc.SQL.Add('  FLGDESCFOLHA,              ');
       qryInc.SQL.Add('  FLGPORTFORMA,              ');
       qryInc.SQL.Add('  FLGSTATUS,                 ');
       qryInc.SQL.Add('  OBSERVACAO,                ');
       qryInc.SQL.Add('  ULTMESREAJ,                ');
       qryInc.SQL.Add('  FLGACAOJUD,                ');
       qryInc.SQL.Add('  SALDOPROVPERDA,            ');
       qryInc.SQL.Add('  SALDOBAIXADEF,             ');
       qryInc.SQL.Add('  PARCELA                    ');//WO8288 - Helen
       qryInc.SQL.Add(' ) VALUES (                  ');
       qryInc.SQL.Add( IntToStr(iIdMovDiv)  + ', '   );
       qryInc.SQL.Add( sCodDivida           + ', '   );
       qryInc.SQL.Add( qryAux.FieldByName('IDPESSOA').AsString                + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('IDTITULAR').AsString               + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('IDBENEFICIO').AsString             + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('IDPLANOPREV').AsString             + ', ' );
       qryInc.SQL.Add( QuotedStr( DateToStr( date ) )                         + ', ' );
       qryInc.SQL.Add( sTipoMov                                               + ', ' );
       qryInc.SQL.Add( OraNumero(qryAux.FieldByName('VALORULTIMAPARCELA').AsString)    + ', ' );
       qryInc.SQL.Add( OraNumero(qryAux.FieldByName('VALORPARCELA').AsString)          + ', ' );
       qryInc.SQL.Add( OraNumero(qryAux.FieldByName('SALDODEVEDORATUAL').AsString)     + ', ' );
       qryInc.SQL.Add( OraNumero(sSaldoAnt)                                   + ', ' );
       qryInc.SQL.Add( QuotedStr(qryAux.FieldByName('MESINICIO').AsString)    + ', ' );
       qryInc.SQL.Add( QuotedStr(qryAux.FieldByName('MESFIM').AsString)       + ', ' );
       qryInc.SQL.Add( OraNumero(sParcelaAnt)                                 + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('QTDEPARCELAS').AsString            + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('FLGDESATIVADO').AsString           + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('FLGATUALIZARSALDO').AsString       + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('FLGQUITADO').AsString              + ', ' );
       qryInc.SQL.Add( QuotedStr(qryAux.FieldByName('FLGDESCFOLHA').AsString) + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('FLGPORTFORMA').AsString            + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('FLGSTATUS').AsString               + ', ' );
       qryInc.SQL.Add( QuotedStr(qryAux.FieldByName('OBSERVACAO').AsString)   + ', ' );
       qryInc.SQL.Add( QuotedStr(qryAux.FieldByName('ULTMESREAJ').AsString)   + ', ' );
       qryInc.SQL.Add( qryAux.FieldByName('FLGACAOJUD').AsString              + ', ' );
       qryInc.SQL.Add( OraNumero(qryAux.FieldByName('SALDOPROVPERDA').AsString)+ ', ' );
       qryInc.SQL.Add( OraNumero(qryAux.FieldByName('SALDOBAIXADEF').AsString) + ', ' );
       qryInc.SQL.Add( QuotedStr(sParcelaDesc) ); //WO8288 - Helen
       qryInc.SQL.Add(')');
       qryInc.ExecSQL;

       Result := true;

     except
        on ev : EValidacao do
        begin
           Screen.Cursor := crDefault;
            MsgDlg(ev.message, 'Beneficio Previdenciário', mtWarning, [mbOk], 0);
           if qryAux.active then qryAux.close;
           if qryInc.active then qryAux.close;
           if ev.Control.CanFocus then ev.Control.SetFocus;
           Exit;
        end;
     end;
   finally
     FreeAndNil(qryAux);
     FreeAndNil(qryInc);
   end;
end;
//edilaine SIG126276 : fim


end.


