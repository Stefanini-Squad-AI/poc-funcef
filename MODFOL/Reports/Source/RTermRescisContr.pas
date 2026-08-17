// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTermRescisContr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppCtrls, ppBands, ppClass, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptTermRescisContr = class(TFrmCmReport)
    rpTermRescisContr: TppReport;
    rpTermRescisContrDtlBnd: TppDetailBand;
    rpTermRescisContrDBText22: TppDBText;
    rpTermRescisContrDBText23: TppDBText;
    rpTermRescisContrDBText25: TppDBText;
    rpTermRescisContrDBText24: TppDBText;
    rpTermRescisContrDBText28: TppDBText;
    rpTermRescisContrSmryBnd: TppSummaryBand;
    ppGroup1: TppGroup;
    rpTermRescisContrGrpHdrBnd: TppGroupHeaderBand;
    rpTermRescisContrShape47: TppShape;
    rpTermRescisContrShape49: TppShape;
    rpTermRescisContrShape45: TppShape;
    rpTermRescisContrShape41: TppShape;
    rpTermRescisContrShape42: TppShape;
    rpTermRescisContrShape39: TppShape;
    rpTermRescisContrShape36: TppShape;
    rpTermRescisContrShape34: TppShape;
    rpTermRescisContrShape32: TppShape;
    rpTermRescisContrShape30: TppShape;
    rpTermRescisContrShape28: TppShape;
    rpTermRescisContrShape20: TppShape;
    rpTermRescisContrShape18: TppShape;
    rpTermRescisContrShape16: TppShape;
    rpTermRescisContrShape14: TppShape;
    rpTermRescisContrShape12: TppShape;
    rpTermRescisContrShape10: TppShape;
    rpTermRescisContrShape8: TppShape;
    rpTermRescisContrShape4: TppShape;
    rpTermRescisContrShape22: TppShape;
    rpTermRescisContrShape6: TppShape;
    rpTermRescisContrShape24: TppShape;
    rpTermRescisContrShape1: TppShape;
    rpTermRescisContrShape25: TppShape;
    rpTermRescisContrShape2: TppShape;
    rpTermRescisContrShape7: TppShape;
    rpTermRescisContrShape5: TppShape;
    rpTermRescisContrShape9: TppShape;
    rpTermRescisContrShape17: TppShape;
    rpTermRescisContrShape15: TppShape;
    rpTermRescisContrShape13: TppShape;
    rpTermRescisContrShape11: TppShape;
    rpTermRescisContrShape19: TppShape;
    rpTermRescisContrShape21: TppShape;
    rpTermRescisContrShape23: TppShape;
    rpTermRescisContrShape3: TppShape;
    rpTermRescisContrLabel1: TppLabel;
    rpTermRescisContrLabel2: TppLabel;
    rpTermRescisContrLabel14: TppLabel;
    rpTermRescisContrLabel4: TppLabel;
    rpTermRescisContrLabel5: TppLabel;
    rpTermRescisContrLabel7: TppLabel;
    rpTermRescisContrLabel8: TppLabel;
    rpTermRescisContrLabel9: TppLabel;
    rpTermRescisContrLabel10: TppLabel;
    rpTermRescisContrLabel11: TppLabel;
    rpTermRescisContrLabel12: TppLabel;
    rpTermRescisContrLabel13: TppLabel;
    rpTermRescisContrLabel3: TppLabel;
    rpTermRescisContrDBText1: TppDBText;
    rpTermRescisContrDBText2: TppDBText;
    rpTermRescisContrDBText3: TppDBText;
    rpTermRescisContrDBText4: TppDBText;
    rpTermRescisContrDBText5: TppDBText;
    rpTermRescisContrDBText6: TppDBText;
    rpTermRescisContrShape51: TppShape;
    rpTermRescisContrShape43: TppShape;
    rpTermRescisContrShape26: TppShape;
    rpTermRescisContrLabel22: TppLabel;
    rpTermRescisContrShape50: TppShape;
    rpTermRescisContrShape27: TppShape;
    rpTermRescisContrShape29: TppShape;
    rpTermRescisContrShape31: TppShape;
    rpTermRescisContrShape33: TppShape;
    rpTermRescisContrShape35: TppShape;
    rpTermRescisContrShape38: TppShape;
    rpTermRescisContrShape40: TppShape;
    rpTermRescisContrShape52: TppShape;
    rpTermRescisContrShape46: TppShape;
    rpTermRescisContrShape44: TppShape;
    rpTermRescisContrLabel15: TppLabel;
    rpTermRescisContrLabel16: TppLabel;
    rpTermRescisContrLabel17: TppLabel;
    rpTermRescisContrLabel18: TppLabel;
    rpTermRescisContrLabel19: TppLabel;
    rpTermRescisContrLabel20: TppLabel;
    rpTermRescisContrLabel21: TppLabel;
    rpTermRescisContrLabel23: TppLabel;
    rpTermRescisContrLabel24: TppLabel;
    rpTermRescisContrLabel26: TppLabel;
    rpTermRescisContrLabel27: TppLabel;
    rpTermRescisContrDBText11: TppDBText;
    rpTermRescisContrDBText12: TppDBText;
    rpTermRescisContrDBText13: TppDBText;
    rpTermRescisContrDBText14: TppDBText;
    rpTermRescisContrDBText15: TppDBText;
    rpTermRescisContrDBText16: TppDBText;
    rpTermRescisContrDBText20: TppDBText;
    rpTermRescisContrDBTextCTPS: TppDBText;
    rpTermRescisContrLabel28: TppLabel;
    rpTermRescisContrLabel29: TppLabel;
    rpTermRescisContrLabel30: TppLabel;
    rpTermRescisContrLabel32: TppLabel;
    rpTermRescisContrDBText7: TppDBText;
    rpTermRescisContrDBText8: TppDBText;
    rpTermRescisContrDBText18: TppDBText;
    rpTermRescisContrLabel6: TppLabel;
    rpTermRescisContrDBTextPIS: TppDBText;
    rpTermRescisContrDBText230: TppDBText;
    rpTermRescisContrDBText9: TppDBText;
    rpTermRescisContrDBText21: TppDBText;
    rpTermRescisContrDBText17: TppDBText;
    rpTermRescisContrDBText10: TppDBText;
    rpTermRescisContrLabel31: TppLabel;
    rpTermRescisContrShape48: TppShape;
    rpTermRescisContrLabel25: TppLabel;
    rpTermRescisContrDBText19: TppDBText;
    rpTermRescisContrDBTxtItemCNAE: TppDBText;
    rpTermRescisContrLabel51: TppLabel;
    rpTermRescisContrGrpFootBnd: TppGroupFooterBand;
    rpTermRescisContrShape88: TppShape;
    rpTermRescisContrShape68: TppShape;
    rpTermRescisContrShape66: TppShape;
    rpTermRescisContrShape86: TppShape;
    rpTermRescisContrShape81: TppShape;
    rpTermRescisContrShape79: TppShape;
    rpTermRescisContrShape75: TppShape;
    rpTermRescisContrShape67: TppShape;
    rpTermRescisContrShape64: TppShape;
    rpTermRescisContrShape62: TppShape;
    rpTermRescisContrShape60: TppShape;
    rpTermRescisContrShape58: TppShape;
    rpTermRescisContrShape53: TppShape;
    rpTermRescisContrShape77: TppShape;
    rpTermRescisContrShape71: TppShape;
    rpTermRescisContrShape72: TppShape;
    rpTermRescisContrLine4: TppLine;
    rpTermRescisContrLine3: TppLine;
    rpTermRescisContrShape59: TppShape;
    rpTermRescisContrShape61: TppShape;
    rpTermRescisContrShape69: TppShape;
    rpTermRescisContrShape89: TppShape;
    rpTermRescisContrShape85: TppShape;
    rpTermRescisContrShape87: TppShape;
    rpTermRescisContrShape84: TppShape;
    rpTermRescisContrShape83: TppShape;
    rpTermRescisContrShape78: TppShape;
    rpTermRescisContrShape80: TppShape;
    rpTermRescisContrShape82: TppShape;
    rpTermRescisContrShape76: TppShape;
    rpTermRescisContrShape63: TppShape;
    rpTermRescisContrShape73: TppShape;
    rpTermRescisContrShape74: TppShape;
    rpTermRescisContrShape70: TppShape;
    rpTermRescisContrLabel36: TppLabel;
    rpTermRescisContrLabel37: TppLabel;
    rpTermRescisContrLabel38: TppLabel;
    rpTermRescisContrShape65: TppShape;
    rpTermRescisContrLabel39: TppLabel;
    rpTermRescisContrLabel40: TppLabel;
    rpTermRescisContrLabel41: TppLabel;
    rpTermRescisContrLabel42: TppLabel;
    rpTermRescisContrLabel43: TppLabel;
    rpTermRescisContrLabel44: TppLabel;
    rpTermRescisContrLabel45: TppLabel;
    rpTermRescisContrLabel46: TppLabel;
    rpTermRescisContrLabel48: TppLabel;
    rpTermRescisContrLabel49: TppLabel;
    rpTermRescisContrLabel50: TppLabel;
    rpTermRescisContrLine1: TppLine;
    rpTermRescisContrDBText26: TppDBText;
    rpTermRescisContrDBText27: TppDBText;
    rpTermRescisContrLine2: TppLine;
    rpTermRescisContrShape57: TppShape;
    rpTermRescisContrShape55: TppShape;
    rpTermRescisContrShape54: TppShape;
    rpTermRescisContrLabel33: TppLabel;
    rpTermRescisContrShape56: TppShape;
    rpTermRescisContrLabel35: TppLabel;
    rpTermRescisContrLabel34: TppLabel;
    rpTermRescisContrDBCalc3: TppDBCalc;
    rpTermRescisContrDBCalc1: TppDBCalc;
    rpTermRescisContrDBCalc2: TppDBCalc;
    rpTermRescisContrMemo1: TppMemo;
    rpTermRescisContrMemo2: TppMemo;
    rpTermRescisContrMemo5: TppMemo;
    rpTermRescisContrMemo4: TppMemo;
    rpTermRescisContrMemo3: TppMemo;
    rpTermRescisContrDBText29: TppDBText;
    ppTermRescisContr: TppBDEPipeline;
    ppTermRescisContrppField1: TppField;
    ppTermRescisContrppField2: TppField;
    ppTermRescisContrppField3: TppField;
    ppTermRescisContrppField4: TppField;
    ppTermRescisContrppField5: TppField;
    ppTermRescisContrppField6: TppField;
    ppTermRescisContrppField7: TppField;
    ppTermRescisContrppField8: TppField;
    ppTermRescisContrppField9: TppField;
    ppTermRescisContrppField10: TppField;
    ppTermRescisContrppField11: TppField;
    ppTermRescisContrppField12: TppField;
    ppTermRescisContrppField13: TppField;
    ppTermRescisContrppField14: TppField;
    ppTermRescisContrppField15: TppField;
    ppTermRescisContrppField16: TppField;
    ppTermRescisContrppField17: TppField;
    ppTermRescisContrppField18: TppField;
    ppTermRescisContrppField19: TppField;
    ppTermRescisContrppField20: TppField;
    ppTermRescisContrppField21: TppField;
    ppTermRescisContrppField22: TppField;
    ppTermRescisContrppField23: TppField;
    ppTermRescisContrppField24: TppField;
    ppTermRescisContrppField25: TppField;
    ppTermRescisContrppField26: TppField;
    ppTermRescisContrppField27: TppField;
    ppTermRescisContrppField28: TppField;
    ppTermRescisContrppField29: TppField;
    ppTermRescisContrppField30: TppField;
    ppTermRescisContrppField31: TppField;
    ppTermRescisContrppField32: TppField;
    ppTermRescisContrppField33: TppField;
    ppTermRescisContrppField34: TppField;
    ppTermRescisContrppField35: TppField;
    ppTermRescisContrppField36: TppField;
    ppTermRescisContrppField37: TppField;
    ppTermRescisContrppField38: TppField;
    dsTermRescisContr: TwwDataSource;
    sqlTermRescisContr: TCMSqlParams;
    CdsTermRescisContr: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTermRescisContrAfterOpen(DataSet: TDataSet);
    procedure CdsTermRescisContrAfterScroll(DataSet: TDataSet);
    procedure rpTermRescisContrSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTermRescisContr: TRptTermRescisContr;

implementation

uses UsoGeralRH, uFuncoesUteisRH, fAguarde, dBaseDados;

{$R *.DFM}

procedure TRptTermRescisContr.CrmRptCMBeforePrint(Sender: TObject);
var
  MascaraDoc: array [1..2] of string;
  DocID: array [1..2] of integer;
begin
  inherited;
  DocID[1] := 0;
  DocID[2] := 0;
  MascaraDoc[1] := '';
  MascaraDoc[2] := '';

  // Documentos
  with (dtmBaseDados.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = :PIS1) OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = :PIS2) OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = :CTPS)) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Prepare;
    ParamByName('PIS1').asString := 'PIS:';
    ParamByName('PIS2').asString := 'PIS/PASEP:';
    ParamByName('CTPS').asString := 'CTPS:';
    Open;
  end;

  with (dtmBaseDados.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'PIS:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'PIS/PASEP:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger;
        MascaraDoc[1] := FieldByName('MASCARA').asString;
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CTPS:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
        MascaraDoc[2] := FieldByName('MASCARA').asString;
      end;

      Next;
    end;
  end;

  with (sqlTermRescisContr.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,');
    Add('  RTRIM(CONTATO.NOME) || DECODE(RTRIM(CONTATO.CARGO),NULL,NULL,'' - '' ||'+
      'RTRIM(CONTATO.CARGO)) AS CONTATO,');
    Add('  DECODE(PJ.NUMDOCUMENTO,NULL,NULL,:CNPJ || PJ.NUMDOCUMENTO) AS CGC,');
    Add('  FP.IDITEMCNAE,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) AS ENDERECO,');
    Add('  E.BAIRRO,');
    Add('  CIDADES.NOME AS CIDADE,');
    Add('  ES.CODESTADO AS UF,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');
    Add('  RTRIM(PF.NOME) AS EMPREGADO,');
    Add('  (NVL(PENSAOALIM.VALOR,0) || '' %'') AS PENSAOALIM,');

    if (CmpRptCM.ParamByName('ExibeCCusto').asBoolean) then
      Add('  RTRIM(CC.NOME) AS C_CUSTO,');
      
    Add('  C.TITULO AS FUNCAO,');
    Add('  RTRIM(CTPS.NUM) AS CTPS_NUM,');
    Add('  DECODE(CTPS.UF,NULL,NULL,''/''||CTPS.UF) AS CTPS_UF,');
    Add('  PIS.NUM AS PIS,');
    Add('  F.MATRICULA, F.DATAADMISSAO, F.DATAOPCAOFGTS, F.DATAAVISO,');
    Add('  F.CODCENTROCUSTO AS DIVISAO, F.DATADESLIGAMENTO, PFIS.DATANASC,');
    Add('  F.HOMOLOGACAONUMERO AS DATAHOMOLOGACAO,');
    Add('  MO_SAI.DESCRICAO AS MOTIVOSAIDA,');
    Add('  F.IDFORMARESC AS MOTIVOFGTS,');
    Add('  AG.NUMAGENCIA,');
    Add('  PA.NOME AS NOMEAGENCIA,');
    Add('  PB.NOME AS NOMEBANCO,');
    Add('  RP.CODPROVDESC AS CODRUBRICA,');
    Add('  RP.DESCRPROVDESC AS RUBRICA,');
    Add('  P.FLGDESCONTO AS TIPORUBRICA,');
    Add('  NVL(MAIOR_REM.VALOR,0) AS MAIOR_REMUNERACAO,');
    Add('  RTRIM(DECODE(RTRIM(H.REFERENCIA),''***'','''',''Ferias'','''',''Férias'','''',');
    Add('    ''13.o Salar'','''',''Rescisao'','''',''Rescisão'','''',H.REFERENCIA)) AS REFERENCIA,');
    Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,-H.VALORPROVENTO) AS VALOR,');
    Add('  DECODE(P.FLGDESCONTO,0,H.VALORPROVENTO,0) AS PROVENTOS,');
    Add('  DECODE(P.FLGDESCONTO,1,H.VALORPROVENTO,0) AS DESCONTOS');
    Add('FROM');
    Add('  ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PESSOA PJ, PESSOA PF,'+
      ' PESSOA PB, PESSOA PA, PROVDESC P,');
    Add('  RUBRICAXPESS RP, PESSOAFISICA PFIS, FUNCIONARIO F, CARGO C, ENDPESS E,');
    Add('  BANCO B, AGENCIABANCARIA AG, CIDADES, ESTADO ES, MOTIVO MO, MOTIVO MO_SAI,');
    Add('  SITFUNC S, FILIALPESSOA FP,'+
      IFF(CmpRptCM.ParamByName('ExibeCCusto').asBoolean, ' CENTCUST CC,', ''));
    // -------------------------------------------------------------------- //
    // Percentual de Pensão Alimentícia do Funcionário
    Add('  (SELECT RI.IDPESSOA, RI.VALORRUBRICA AS VALOR');
    Add('   FROM   RUBRICAINDIV RI, PROVDESC PD');
    Add('   WHERE (PD.CODRUBCLT    = ''50018'') AND');

    // Funcionários escolhidos
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('         (RI.IDPESSOA    IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('         (RI.IDPESSOA     = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('         (RI.VALORRUBRICA < 100) AND');
    Add('         (PD.IDPROVENTO   = RI.IDRUBRICA)) PENSAOALIM,');
    // ------------------------------------------------------------------- //
    // Contato do Funcionário
    Add('  (SELECT IDENDERECO, NOME, CARGO');
    Add('   FROM   CONTATOPESS');
    Add('   WHERE (IDCONTATO = ' +CmpRptCM.ParamByName('IdResponsavel').asString+ ')) CONTATO,');
    // -------------------------------------------------------------------- //
    // Maior Remuneração do Funcionário
    Add('  (SELECT H.IDPESSOA, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE (P.CODRUBCLT  = ''63012'') AND');

    // Funcionários escolhidos
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('         (H.IDPESSOA    IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('         (H.IDPESSOA     = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');

    Add('         (H.IDPESSOA   = F.IDPESSOA) AND');

    case (CmpRptCM.ParamByName('TipoRescisao').asInteger) of
      0 : Add('         (H.IDMOTIVO   = F.IDMOTIVODESLIGRAIS) AND');
      1 : Add('         (H.IDMOTIVO   = F.IDMOTIVODESLIGGERENCIAL) AND');
      2 : Add('         (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
    end;

    Add('         (H.MES        = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('         (P.IDPROVENTO = H.IDRUBRICA)');
    Add('   GROUP BY');
    Add('     H.IDPESSOA, P.IDPROVENTO) MAIOR_REM,');
    // -------------------------------------------------------------------- //
    // PIS do Funcionário
    Add('  (SELECT IDPESSOA, RTRIM(NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA');
    Add('   WHERE (IDDOCUMENTO = ' +IntToStr(DocID[1])+ ')) PIS,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM, ES.CODESTADO AS UF');
    Add('   FROM   DOCPESSOA DP, ESTADO ES, PAIS PA');
    Add('   WHERE (DP.IDDOCUMENTO = ' +IntToStr(DocID[2])+ ') AND');
    Add('         (DP.IDPAIS      = PA.IDPAIS) AND');
    Add('         (PA.IDPAIS      = ES.IDPAIS) AND');
    Add('         (DP.IDESTADO    = ES.IDESTADO)) CTPS');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add('  (PJ.IDPESSOA          = ' +CmpRptCM.ParamByName('IdEstab').asString+ ') AND');

    // Funcionários escolhidos
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
      begin
        Add('  (F.IDPESSOA          IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
        Add('  (PF.IDPESSOA         IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND');
      end
      else
      begin
        Add('  (F.IDPESSOA           = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
        Add('  (PF.IDPESSOA          = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
      end;

    Add('  (S.TIPOSIT            = ''D'') AND');
    Add('  ((P.CODRUBCLT        <> ''63012'') OR');
    Add('   (P.CODRUBCLT        IS NULL)) AND');
    Add('  (P.FLGDESCONTO        < 2) AND');
    Add('  (H.IDPESSJUR          = ' +CmpRptCM.ParamByName('IdEmpresa').asString+ ') AND');
    Add('  (H.MES                = ' +QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
      PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+ ') AND');
    Add('  (PJ.IDPESSOA          = FP.IDFILIALPESSOA) AND');
    Add('  (S.IDSITFUNC          = F.IDSITFUNC) AND');
    Add('  (F.IDMOTIVODESLIGRAIS = MO_SAI.IDMOTIVO) AND');

    case (CmpRptCM.ParamByName('TipoRescisao').asInteger) of
      0 :
      begin
        Add('  (F.IDMOTIVODESLIGRAIS = H.IDMOTIVO) AND');
        Add('  (F.IDMOTIVODESLIGRAIS = MO.IDMOTIVO) AND');
      end;
      1 :
      begin
        Add('  (F.IDMOTIVODESLIGGERENCIAL = H.IDMOTIVO) AND');
        Add('  (F.IDMOTIVODESLIGGERENCIAL = MO.IDMOTIVO) AND');
      end;
      2 :
      begin
        Add('  (H.IDMOTIVO   = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
        Add('  (MO.IDMOTIVO  = ' +CmpRptCM.ParamByName('IdTipoFolha').asString+ ') AND');
      end;
    end;

    Add('  (F.IDAGENCIAFGTS      = AG.IDPESSOA) AND');
    Add('  (B.IDPESSOA           = PB.IDPESSOA) AND');
    Add('  (B.IDPESSOA           = AG.IDBANCO) AND');
    Add('  (AG.IDPESSOA          = PA.IDPESSOA) AND');
    Add('  (P.IDPROVENTO         = H.IDRUBRICA) AND');
    Add('  (H.IDRUBRICA          = RP.IDRUBRICA) AND');
    Add('  (RP.IDPESSOA          = F.IDEMPRESA) AND');
    Add('  (PF.IDPESSOA          = CTPS.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA          = F.IDESTAB) AND');
    Add('  (PF.IDPESSOA          = F.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = PFIS.IDPESSOA) AND');
    Add('  (F.IDPESSOA           = H.IDPESSOA) AND');
    Add('  (F.IDCARGO            = C.IDCARGO) AND');

    if (CmpRptCM.ParamByName('ExibeCCusto').asBoolean) then
    begin
      Add('  (F.CODCENTROCUSTO     = CC.CODCENTROCUSTO) AND');
      Add('  (F.IDEMPRESA          = CC.IDEMPRESA) AND');
    end;

    Add('  (PJ.IDPESSOA          = E.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL    = E.IDENDERECO) AND');
    Add('  (E.IDCIDADES          = CIDADES.IDCIDADES) AND');
    Add('  (E.IDENDERECO         = CONTATO.IDENDERECO) AND');
    Add('  (CIDADES.IDESTADO     = ES.IDESTADO) AND');
    Add('  (F.IDPESSOA           = PENSAOALIM.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA           = MAIOR_REM.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA           = PIS.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  UPPER(EMPREGADO), TIPORUBRICA, CODRUBRICA');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTermRescisContr.Prepare;
  sqlTermRescisContr.ParamByName('CNPJ').asString := 'CNPJ: ';
  sqlTermRescisContr.Open;

  if (MascaraDoc[1] <> '') then
    rpTermRescisContrDBTextPIS.DisplayFormat := MascaraDoc[1] + ';0;_';
  if (MascaraDoc[2] <> '') then
    rpTermRescisContrDBTextCTPS.DisplayFormat := MascaraDoc[2] + ';0;_';
end;

procedure TRptTermRescisContr.CdsTermRescisContrAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTermRescisContr.CdsTermRescisContrAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTermRescisContr.rpTermRescisContrSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
