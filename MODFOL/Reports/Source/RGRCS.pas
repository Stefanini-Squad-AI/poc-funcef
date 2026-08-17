// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RGRCS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, TXRB;

type
  TRptGRCS = class(TFrmCmReport)
    rpGRCS: TppReport;
    rpGRCSDtlBnd: TppDetailBand;
    rpGRCSShape1: TppShape;
    rpGRCSShape6: TppShape;
    rpGRCSShape38: TppShape;
    rpCRPagosImage1: TppImage;
    rpGRCSLabel1: TppLabel;
    rpGRCSLabel2: TppLabel;
    rpGRCSShape2: TppShape;
    rpGRCSShape3: TppShape;
    rpGRCSShape5: TppShape;
    rpGRCSShape7: TppShape;
    rpGRCSShape8: TppShape;
    rpGRCSShape9: TppShape;
    rpGRCSShape10: TppShape;
    rpGRCSLine2: TppLine;
    rpGRCSLine1: TppLine;
    rpGRCSLabel3: TppLabel;
    rpGRCSShape4: TppShape;
    rpGRCSShape11: TppShape;
    rpGRCSShape12: TppShape;
    rpGRCSShape13: TppShape;
    rpGRCSShape14: TppShape;
    rpGRCSShape15: TppShape;
    rpGRCSShape16: TppShape;
    rpGRCSShape18: TppShape;
    rpGRCSShape19: TppShape;
    rpGRCSShape20: TppShape;
    rpGRCSLine3: TppLine;
    rpGRCSLine4: TppLine;
    rpGRCSShape17: TppShape;
    rpGRCSShape21: TppShape;
    rpGRCSLine5: TppLine;
    rpGRCSLine6: TppLine;
    rpGRCSLine7: TppLine;
    rpGRCSShape22: TppShape;
    rpGRCSShape23: TppShape;
    rpGRCSShape24: TppShape;
    rpGRCSShape25: TppShape;
    rpGRCSLine8: TppLine;
    rpGRCSShape26: TppShape;
    rpGRCSShape27: TppShape;
    rpGRCSShape28: TppShape;
    rpGRCSShape29: TppShape;
    rpGRCSShape30: TppShape;
    rpGRCSLine10: TppLine;
    rpGRCSShape31: TppShape;
    rpGRCSShape32: TppShape;
    rpGRCSLine11: TppLine;
    rpGRCSLine12: TppLine;
    rpGRCSLine13: TppLine;
    rpGRCSShape33: TppShape;
    rpGRCSShape34: TppShape;
    rpGRCSShape35: TppShape;
    rpGRCSShape36: TppShape;
    rpGRCSShape37: TppShape;
    rpGRCSLine14: TppLine;
    rpGRCSLabel4: TppLabel;
    rpGRCSLabel5: TppLabel;
    rpGRCSLabel6: TppLabel;
    rpGRCSLabel7: TppLabel;
    rpGRCSLabel8: TppLabel;
    rpGRCSLabel9: TppLabel;
    rpGRCSLabel10: TppLabel;
    rpGRCSLabel11: TppLabel;
    rpGRCSLabel12: TppLabel;
    rpGRCSLabel13: TppLabel;
    rpGRCSLabel14: TppLabel;
    rpGRCSLabel15: TppLabel;
    rpGRCSLabel16: TppLabel;
    rpGRCSLabel17: TppLabel;
    rpGRCSLabel18: TppLabel;
    rpGRCSLabel19: TppLabel;
    rpGRCSLabel20: TppLabel;
    rpGRCSLabel21: TppLabel;
    rpGRCSLabel22: TppLabel;
    rpGRCSLabel23: TppLabel;
    rpGRCSLabel24: TppLabel;
    rpGRCSLabel25: TppLabel;
    rpGRCSLabel26: TppLabel;
    rpGRCSLabel27: TppLabel;
    rpGRCSLabel28: TppLabel;
    rpGRCSLabel29: TppLabel;
    rpGRCSLabel30: TppLabel;
    rpGRCSLabel31: TppLabel;
    rpGRCSLabel32: TppLabel;
    rpGRCSLabel33: TppLabel;
    rpGRCSLabel34: TppLabel;
    rpGRCSLabel35: TppLabel;
    rpGRCSLabel36: TppLabel;
    rpGRCSLabel37: TppLabel;
    rpGRCSLabel38: TppLabel;
    rpGRCSLabel39: TppLabel;
    rpGRCSLabel40: TppLabel;
    rpGRCSLabel41: TppLabel;
    rpGRCSLabel42: TppLabel;
    rpGRCSLabel43: TppLabel;
    rpGRCSLabel44: TppLabel;
    rpGRCSLabel45: TppLabel;
    rpGRCSLabel46: TppLabel;
    rpGRCSLabel47: TppLabel;
    rpGRCSLabel48: TppLabel;
    rpGRCSLabel49: TppLabel;
    rpGRCSLabel50: TppLabel;
    rpGRCSLabel51: TppLabel;
    rpGRCSLabel52: TppLabel;
    rpGRCSLabel53: TppLabel;
    rpGRCSLabel54: TppLabel;
    rpGRCSLabel55: TppLabel;
    rpGRCSShape39: TppShape;
    rpGRCSLabel56: TppLabel;
    rpGRCSLabel57: TppLabel;
    rpGRCSShape40: TppShape;
    rpGRCSLabel58: TppLabel;
    rpGRCSLabel59: TppLabel;
    rpGRCSLine15: TppLine;
    rpGRCSShape41: TppShape;
    rpGRCSLabel60: TppLabel;
    rpGRCSLabel61: TppLabel;
    rpGRCSLine16: TppLine;
    rpGRCSShape42: TppShape;
    rpGRCSLabel62: TppLabel;
    rpGRCSLabel63: TppLabel;
    rpGRCSLine9: TppLine;
    rpGRCSShape43: TppShape;
    rpGRCSLabel64: TppLabel;
    rpGRCSLabel65: TppLabel;
    rpGRCSLine17: TppLine;
    rpGRCSShape44: TppShape;
    rpGRCSShape45: TppShape;
    rpGRCSLabel66: TppLabel;
    rpGRCSShape46: TppShape;
    rpGRCSShape47: TppShape;
    rpGRCSLabel67: TppLabel;
    rpGRCSShape48: TppShape;
    rpGRCSShape49: TppShape;
    rpGRCSLabel68: TppLabel;
    rpGRCSShape50: TppShape;
    rpGRCSShape51: TppShape;
    rpGRCSLabel69: TppLabel;
    rpGRCSShape52: TppShape;
    rpGRCSLine18: TppLine;
    rpGRCSLabel70: TppLabel;
    rpGRCSLabel71: TppLabel;
    rpGRCSLabel72: TppLabel;
    rpGRCSLine19: TppLine;
    rpGRCSLabel73: TppLabel;
    rpGRCSLine20: TppLine;
    rpGRCSLine21: TppLine;
    rpGRCSLine22: TppLine;
    rpGRCSLine23: TppLine;
    rpGRCSLine24: TppLine;
    rpGRCSLine25: TppLine;
    rpGRCSLine26: TppLine;
    rpGRCSLine27: TppLine;
    rpGRCSLine28: TppLine;
    rpGRCSLine29: TppLine;
    rpGRCSLabel74: TppLabel;
    rpGRCSShape54: TppShape;
    rpGRCSLabel75: TppLabel;
    rpGRCSShape55: TppShape;
    rpGRCSShape56: TppShape;
    rpGRCSLabel76: TppLabel;
    rpGRCSLabel77: TppLabel;
    rpGRCSShape57: TppShape;
    rpGRCSShape58: TppShape;
    rpGRCSLabel78: TppLabel;
    rpGRCSLabel79: TppLabel;
    rpGRCSLabel80: TppLabel;
    rpGRCSShape59: TppShape;
    rpGRCSShape60: TppShape;
    rpGRCSLabel81: TppLabel;
    rpGRCSLabel82: TppLabel;
    rpGRCSLabel83: TppLabel;
    rpGRCSShape61: TppShape;
    rpGRCSLabel84: TppLabel;
    rpGRCSLabel85: TppLabel;
    rpGRCSLabel86: TppLabel;
    rpGRCSLabel87: TppLabel;
    rpGRCSLabel88: TppLabel;
    rpGRCSLabel89: TppLabel;
    rpGRCSLabel90: TppLabel;
    rpGRCSLabel91: TppLabel;
    rpGRCSLabel92: TppLabel;
    rpGRCSLabel93: TppLabel;
    rpGRCSLabel94: TppLabel;
    rpGRCSLine30: TppLine;
    rpGRCSShape62: TppShape;
    rpGRCSLabel95: TppLabel;
    rpGRCSShape63: TppShape;
    rpGRCSLabel97: TppLabel;
    rpGRCSLabel98: TppLabel;
    rpGRCSShape64: TppShape;
    rpGRCSLabel99: TppLabel;
    rpGRCSLabel100: TppLabel;
    rpGRCSShape65: TppShape;
    rpGRCSLabel101: TppLabel;
    rpGRCSLabel102: TppLabel;
    rpGRCSLabel103: TppLabel;
    rpGRCSLabel104: TppLabel;
    rpGRCSLine31: TppLine;
    rpGRCSLabel105: TppLabel;
    rpGRCSLabel106: TppLabel;
    rpGRCSLabel107: TppLabel;
    rpGRCSLabel108: TppLabel;
    rpGRCSLabel109: TppLabel;
    rpGRCSLine32: TppLine;
    rpGRCSShape66: TppShape;
    rpGRCSLabel110: TppLabel;
    rpGRCSLabel111: TppLabel;
    rpGRCSShape67: TppShape;
    rpGRCSLabel112: TppLabel;
    rpGRCSLabel113: TppLabel;
    rpGRCSShape68: TppShape;
    rpGRCSLabel114: TppLabel;
    rpGRCSShape69: TppShape;
    rpGRCSLabel116: TppLabel;
    rpGRCSLabel117: TppLabel;
    rpGRCSShape70: TppShape;
    rpGRCSLabel118: TppLabel;
    rpGRCSLabel119: TppLabel;
    rpGRCSLabel120: TppLabel;
    rpGRCSShape71: TppShape;
    rpGRCSLabel121: TppLabel;
    rpGRCSLabel122: TppLabel;
    rpGRCSShape72: TppShape;
    rpGRCSLabel123: TppLabel;
    rpGRCSLabel125: TppLabel;
    rpGRCSShape73: TppShape;
    rpGRCSLabel124: TppLabel;
    rpGRCSShape74: TppShape;
    rpGRCSLabel127: TppLabel;
    rpGRCSLabel128: TppLabel;
    rpGRCSDBText1: TppDBText;
    rpGRCSDBText2: TppDBText;
    rpGRCSDBText3: TppDBText;
    rpGRCSDBText4: TppDBText;
    rpGRCSDBText5: TppDBText;
    rpGRCSDBText6: TppDBText;
    rpGRCSDBText7: TppDBText;
    rpGRCSDBText8: TppDBText;
    rpGRCSDBText9: TppDBText;
    rpGRCSDBText10: TppDBText;
    rpGRCSDBText11: TppDBText;
    rpGRCSDBText12: TppDBText;
    rpGRCSDBText13: TppDBText;
    rpGRCSDBText14: TppDBText;
    rpGRCSDBText15: TppDBText;
    rpGRCSDBText17: TppDBText;
    rpGRCSDBText18: TppDBText;
    rpGRCSDBText19: TppDBText;
    rpGRCSDBText20: TppDBText;
    rpGRCSDBText21: TppDBText;
    rpGRCSDBText22: TppDBText;
    rpGRCSDBText23: TppDBText;
    rpGRCSDBText26: TppDBText;
    rpGRCSShape75: TppShape;
    rpGRCSLabel130: TppLabel;
    rpGRCSLabel131: TppLabel;
    rpGRCSShape76: TppShape;
    rpGRCSLabel132: TppLabel;
    rpGRCSLabel133: TppLabel;
    rpGRCSLine33: TppLine;
    rpGRCSShape77: TppShape;
    rpGRCSLabel134: TppLabel;
    rpGRCSLabel135: TppLabel;
    rpGRCSLine34: TppLine;
    rpGRCSDBText27: TppDBText;
    rpGRCSDBText28: TppDBText;
    rpGRCSDBText29: TppDBText;
    rpGRCSLabel129: TppLabel;
    rpGRCSMemo1: TppMemo;
    rpGRCSMemo2: TppMemo;
    rpGRCSDBText30: TppDBText;
    rpGRCSDBText31: TppDBText;
    rpGRCSLabel115: TppLabel;
    rpGRCSImage3: TppImage;
    rpGRCSLine35: TppLine;
    rpGRCSDBText32: TppDBText;
    rpGRCSDBText33: TppDBText;
    rpGRCSDBText16: TppDBText;
    rpGRCSDBText24: TppDBText;
    rpGRCSLabelTotal: TppLabel;
    rpGRCSSmryBnd: TppSummaryBand;
    ppGRCS: TppBDEPipeline;
    dsGRCS: TwwDataSource;
    sqlGRCS: TCMSqlParams;
    CdsGRCS: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    rpGRCSDBText34: TppDBText;
    rpGRCSDBText35: TppDBText;
    rpGRCSDBText36: TppDBText;
    rpGRCSDBText37: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsGRCSAfterScroll(DataSet: TDataSet);
    procedure rpGRCSSmryBndAfterPrint(Sender: TObject);
    procedure rpGRCSDtlBndBeforePrint(Sender: TObject);
  end;

var
  RptGRCS: TRptGRCS;

implementation

uses dCds, uCtrlFuncoesRH, uSistema, fAguarde;

{$R *.DFM}

procedure TRptGRCS.CrmRptCMBeforePrint(Sender: TObject);
var
  DocID: integer;
  sPeriodo, sMesRef: string;
begin
  inherited;
  // Período escolhido
  sMesRef := CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger);
  sPeriodo := FU.PoeZero(FU.TrazUltDiaMes(CmpRptCM.ParamByName('MesRef').asInteger,
    CmpRptCM.ParamByName('AnoRef').asInteger)) +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
    CmpRptCM.ParamByName('AnoRef').asString;

  // Documentos
  with (dmCds.sql) do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CNPJ:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;
  DocID := dmCds.Cds.FieldByName('IDDOCUMENTO').asInteger;

  with (sqlGRCS.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    // Dados do Estabelecimento
    Add('  UPPER(PJ.RAZAOSOCIAL) AS NOME_ESTAB,');
    Add('  CNPJ_ESTAB.NUM AS CNPJ_ESTAB,');
    Add('  UPPER(EPJ.LOGRADOURO) AS ENDERECO_ESTAB,');
    Add('  EPJ.NUMERO AS NUMERO_ESTAB,');
    Add('  UPPER(EPJ.COMPLEMENTO) AS COMPLEMENTO_ESTAB,');
    Add('  UPPER(EPJ.BAIRRO) AS BAIRRO_ESTAB,');
    Add('  UPPER(CPJ.NOME) AS CIDADE_ESTAB,');
    Add('  RTRIM(SUBSTR(EPJ.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EPJ.CEP,6,3)) AS CEP_ESTAB,');
    Add('  ESPJ.CODESTADO AS UF_ESTAB,');
    Add('  UPPER(ICNAE.DESCRICAO) AS CNAE_NOME,');
    Add('  ICNAE.IDITEMCNAE AS CNAE_COD,');
    // Dados do Sindicato
    Add('  UPPER(PS.RAZAOSOCIAL) AS NOME_SINDI,');
    Add('  CNPJ_SINDI.NUM AS CNPJ_SINDI,');
    Add('  UPPER(EPS.LOGRADOURO) AS ENDERECO_SINDI,');
    Add('  EPS.NUMERO AS NUMERO_SINDI,');
    Add('  UPPER(EPS.COMPLEMENTO) AS COMPLEMENTO_SINDI,');
    Add('  UPPER(EPS.BAIRRO) AS BAIRRO_SINDI,');
    Add('  UPPER(CPS.NOME) AS CIDADE_SINDI,');
    Add('  RTRIM(SUBSTR(EPS.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EPS.CEP,6,3)) AS CEP_SINDI,');
    Add('  ESPS.CODESTADO AS UF_SINDI,');
    Add('  S.REGISTROMT AS COD_SINDI,');
    // Dados calculados
    Add('  ' +QuotedStr(CmpRptCM.ParamByName('DataPagamento').asString)+ ' AS DATA_LIM_PAG,');
    Add('  ' +QuotedStr(Copy(CmpRptCM.ParamByName('DataPagamento').asString,7,4))+ ' AS EXERCICIO,');
    Add('  ' +QuotedStr(Copy(CmpRptCM.ParamByName('DataPagamento').asString,1,2) +', '+
      FU.MesExtensoAno(Copy(CmpRptCM.ParamByName('DataPagamento').asString,7,4)  +'/'+
      Copy(CmpRptCM.ParamByName('DataPagamento').asString,4,2)))+ ' AS DATA,');
    Add('  FP.DATAINICIOATIV AS DATA_INI_ATIVID,');
    Add('  TOT_EMPREGADOS.NUMERO AS NUM_TOT_EMPREGADOS,');
    Add('  VLR_TOT_CONTRIB.NUMERO AS NUM_TOT_EMPR_CONTR,');
    Add('  (TOT_EMPREGADOS.NUMERO - VLR_TOT_CONTRIB.NUMERO) AS NUM_TOT_EMPR_NAO_CONTR,');
    Add('  NVL(NUM_FILIAIS.NUM,1) AS NUM_ESTAB,');
    Add('  DECODE(FP.INDTIPOEMPRESA, 0,''X'', '''') AS TIPO_UNICO,');
    Add('  DECODE(FP.INDTIPOEMPRESA, 1,''X'', '''') AS TIPO_PRICIPAL,');
    Add('  DECODE(FP.INDTIPOEMPRESA, 2,''X'', '''') AS TIPO_FILIAL,');
    Add('  DECODE(FP.INDTIPOEMPRESA, 0,'''', 1,'''', 2,'''', ''X'') AS TIPO_OUTROS,');
    Add('  ('' '') AS CALC_ESTAB_EMPREGADOR,');
    Add('  ('' '') AS CALC_AUTONOMO,');
    Add('  (''X'') AS CALC_EMPREGADO,');
    Add('  VLR_TOT_REM.VALOR AS TOT_REM,');
    Add('  VLR_TOT_CONTRIB.VALOR AS VAL_CONTRIB,');
    // ------------------------------------------------------------------------------- //
    // Se Existir Juros
    if (CmpRptCM.ParamByName('Juros').asFloat > 0) then
    begin
      if (CmpRptCM.ParamByName('PercentJuros').asBoolean) then
        Add('  DECODE(FP.INDTIPOEMPRESA, NULL, 0, VLR_TOT_CONTRIB.VALOR * (' +
          FloatToStr(CmpRptCM.ParamByName('Juros').asFloat)+ ' / 100)) AS JUROS,')
      else
        Add('  DECODE(FP.INDTIPOEMPRESA, NULL, 0, ' +
          FloatToStr(CmpRptCM.ParamByName('Juros').asFloat)+ ') AS JUROS,');
    end
    else
      Add('  (0) AS JUROS,');

    // Se Existir Multa
    if (CmpRptCM.ParamByName('Multa').asFloat > 0) then
    begin
      if (CmpRptCM.ParamByName('PercentMulta').asBoolean) then
        Add('  DECODE(FP.INDTIPOEMPRESA, NULL, 0, VLR_TOT_CONTRIB.VALOR * (' +
          FU.Float2String(CmpRptCM.ParamByName('Multa').asFloat)+ ' / 100)) AS MULTA,')
      else
        Add('  DECODE(FP.INDTIPOEMPRESA, NULL, 0, ' +
          FU.Float2String(CmpRptCM.ParamByName('Multa').asFloat)+ ') AS MULTA,');
    end
    else
      Add('  (0) AS MULTA,');

    Add('  ((VLR_TOT_CONTRIB.VALOR * ' +
        FU.Float2String(CmpRptCM.ParamByName('CotacaoMoedaDataPag').asFloat)+
       ') - (VLR_TOT_CONTRIB.VALOR * ' +
       FU.Float2String(CmpRptCM.ParamByName('CotacaoMoedaDataVenc').asFloat)+
       ')) AS CORRECAO_MONET');
    // ------------------------------------------------------------------------------- //
    Add('FROM');
    Add('  PESSOA PS, PESSOA PJ, ENDPESS EPS, ENDPESS EPJ, CIDADES CPS, CIDADES CPJ,');
    Add('  ESTADO ESPS, ESTADO ESPJ, ITEMCNAE ICNAE, FILIALPESSOA FP, SINDICATO S,');
    // ------------------------------------------------------------------------------- //
    // CNPJ do Estabelecimento
    Add('  (SELECT DO.IDPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, FILIALPESSOA FP');
    Add('   WHERE (DO.IDDOCUMENTO = ' +IntToStr(DocID)+ ') AND');
    Add('         (DO.IDPESSOA    = FP.IDFILIALPESSOA)) CNPJ_ESTAB,');
    // ------------------------------------------------------------------------------- //
    // CNPJ do Sindicato
    Add('  (SELECT DO.IDPESSOA, RTRIM(DO.NUMDOCUMENTO) AS NUM');
    Add('   FROM   DOCPESSOA DO, SINDICATO S');
    Add('   WHERE (DO.IDDOCUMENTO = ' +IntToStr(DocID)+ ') AND');
    Add('         (DO.IDPESSOA    = S.IDPESSOA)) CNPJ_SINDI,');
    // -------------------------------------------------------------------- //
    // Número Total de Funcionários no mês do Pagamento
    Add('  (SELECT F.IDESTAB, COUNT(DISTINCT F.IDPESSOA) AS NUMERO');
    Add('   FROM');
    Add('     FUNCIONARIO F, SITFUNC ST');
    Add('   WHERE');
    Add('     ((ST.TIPOSIT         <> ''D'') OR');
    Add('      ((F.DATADESLIGAMENTO > TO_DATE(' +QuotedStr(sPeriodo)+ ',''DD/MM/YYYY'')) AND');
    Add('       (ST.TIPOSIT         = ''D''))) AND');
    Add('     (F.TIPOCONTRATO      <> ''G'') AND');
    Add('     (F.DATAADMISSAO      <= TO_DATE(' +QuotedStr(sPeriodo)+ ',''DD/MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      Add(FU.MontaLinhaSelSQL('     (F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString,11));

    Add('     (ST.IDSITFUNC         = F.IDSITFUNC)');
    Add('   GROUP BY F.IDESTAB) TOT_EMPREGADOS,');
    // -------------------------------------------------------------------------------- //
    // Total da Contribuição por Sindicato
    Add('  (SELECT F.IDESTAB, PF.IDSINDICATO, SUM(H.VALORPROVENTO) AS VALOR,');
    Add('          COUNT(DISTINCT F.IDPESSOA) AS NUMERO');
    Add('   FROM   HISTRUBSAL H, PESSOAFISICA PF, FUNCIONARIO F, RUBRICAXPESS RP');
    Add('   WHERE');
    Add('     (PF.IDSINDICATO  IN (' +CmpRptCM.ParamByName('IdSindicato').asString+ ')) AND');

    if (CmpRptCM.ParamByName('ListaIdRubricaContrib').asString <> '') then
      Add(FU.MontaLinhaSelSQL('     (RP.CODPROVDESC',CmpRptCM.ParamByName('ListaIdRubricaContrib').asString,1));

    if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      Add(FU.MontaLinhaSelSQL('     (F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString,6));

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    Add('     (RP.IDPESSOA     = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES           = ' +QuotedStr(sMesRef)+ ') AND');
    Add('     (RP.IDRUBRICA    = H.IDRUBRICA) AND');
    Add('     (F.IDPESSOA      = PF.IDPESSOA) AND');
    Add('     (F.IDPESSOA      = H.IDPESSOA)');
    Add('   GROUP BY F.IDESTAB, PF.IDSINDICATO) VLR_TOT_CONTRIB,');
    // -------------------------------------------------------------------------------- //
    // Total da Remuneração por Sindicato
    Add('  (SELECT F.IDESTAB, PF.IDSINDICATO, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     HISTRUBSAL H, PESSOAFISICA PF, RUBRICAXPESS RP, FUNCIONARIO F, SITFUNC ST,');
    Add('     (SELECT DISTINCT PF.IDPESSOA');
    Add('      FROM');
    Add('        HISTRUBSAL H, PESSOAFISICA PF, RUBRICAXPESS RP, FUNCIONARIO F, SITFUNC ST');
    Add('      WHERE');
    Add('        (PF.IDSINDICATO       IN (' +CmpRptCM.ParamByName('IdSindicato').asString+ ')) AND');
//    Add('        ((ST.TIPOSIT         <> ''D'') OR');
//    Add('         ((F.DATADESLIGAMENTO > TO_DATE(' +QuotedStr(sPeriodo)+ ',''DD/MM/YYYY'')) AND');
//    Add('          (ST.TIPOSIT         = ''D''))) AND');
    Add('        (F.TIPOCONTRATO      <> ''G'') AND');
    Add('        (F.DATAADMISSAO      <= TO_DATE(' +QuotedStr(sPeriodo)+ ',''DD/MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('ListaIdRubricaContrib').asString <> '') then
      Add(FU.MontaLinhaSelSQL('        (RP.CODPROVDESC',CmpRptCM.ParamByName('ListaIdRubricaContrib').asString,6));

    if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      Add(FU.MontaLinhaSelSQL('        (F.IDESTAB',CmpRptCM.ParamByName('ListaIdEstab').asString,10));

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    Add('        (RP.IDPESSOA          = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('        (H.MES                = ' +QuotedStr(sMesRef)+ ') AND');
    Add('        (RP.IDRUBRICA         = H.IDRUBRICA) AND');
    Add('        (ST.IDSITFUNC         = F.IDSITFUNC) AND');
    Add('        (F.IDPESSOA           = PF.IDPESSOA) AND');
    Add('        (F.IDPESSOA           = H.IDPESSOA)) NAO_TEM');
    Add('   WHERE');
    Add('     (PF.IDSINDICATO      IN (' +CmpRptCM.ParamByName('IdSindicato').asString+ ')) AND');
//    Add('     ((ST.TIPOSIT        <> ''D'') OR');
//    Add('     ((F.DATADESLIGAMENTO > TO_DATE(' +QuotedStr(sPeriodo)+ ',''DD/MM/YYYY'')) AND');
//    Add('      (ST.TIPOSIT         = ''D''))) AND');

    if (CmpRptCM.ParamByName('TipoContrato').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('TipoContrato').asString) > 0) then
        Add('  (F.TIPOCONTRATO    IN (' +CmpRptCM.ParamByName('TipoContrato').asString+ ')) AND')
      else
        Add('  (F.TIPOCONTRATO     = ' +CmpRptCM.ParamByName('TipoContrato').asString+ ') AND');

    Add('     (F.DATAADMISSAO     <= TO_DATE(' +QuotedStr(sPeriodo)+ ',''DD/MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('ListaIdRubricaRemSel').asString <> '') then
      Add(FU.MontaLinhaSelSQL('     (RP.CODPROVDESC',CmpRptCM.ParamByName('ListaIdRubricaRemSel').asString,5));

    Add('     (RP.IDPESSOA         = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');
    Add('     (H.MES               = ' +QuotedStr(sMesRef)+ ') AND');
    Add('     (RP.IDRUBRICA        = H.IDRUBRICA) AND');
    Add('     (ST.IDSITFUNC        = F.IDSITFUNC)AND');
    Add('     (F.IDPESSOA          = PF.IDPESSOA) AND');
    Add('     (F.IDPESSOA          = NAO_TEM.IDPESSOA) AND');
    Add('     (F.IDPESSOA          = H.IDPESSOA)');
    Add('   GROUP BY F.IDESTAB, PF.IDSINDICATO) VLR_TOT_REM,');
    // -------------------------------------------------------------------------------- //
    // Número de Filiais do Estabalecimento
    Add('  (SELECT FP1.IDFILIALPESSOA AS IDPESSOA, COUNT(P.IDPESSOA) AS NUM');
    Add('   FROM   PESSOA P, FILIALPESSOA FP1, FILIALPESSOA FP2');
    Add('   WHERE (FP1.IDFILIALPESSOA = P.IDPESSOA) AND');
    Add('         (FP2.IDFILIALPESSOA = P.IDGRUPO)');
    Add('   GROUP BY FP1.IDFILIALPESSOA) NUM_FILIAIS');
    // ------------------------------------------------------------------ //
    Add('WHERE');
    Add('  (S.IDPESSOA        IN (' +CmpRptCM.ParamByName('IdSindicato').asString+ ')) AND');

    if (CmpRptCM.ParamByName('ListaIdEstab').asString <> '') then
      Add(FU.MontaLinhaSelSQL('  (FP.IDFILIALPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString,1));

    Add('  (S.IDPESSOA        = PS.IDPESSOA) AND');
    Add('  (PS.IDPESSOA       = EPS.IDPESSOA) AND');
    Add('  (PS.IDENDCOMERCIAL = EPS.IDENDERECO) AND');
    Add('  (FP.IDITEMCNAE     = ICNAE.IDITEMCNAE) AND');
    Add('  (FP.IDFILIALPESSOA = PJ.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = CNPJ_ESTAB.IDPESSOA) AND');
    Add('  (PJ.IDPESSOA       = TOT_EMPREGADOS.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = EPJ.IDPESSOA) AND');
    Add('  (PJ.IDENDCOMERCIAL = EPJ.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = VLR_TOT_CONTRIB.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = VLR_TOT_REM.IDESTAB) AND');
    Add('  (S.IDPESSOA        = VLR_TOT_CONTRIB.IDSINDICATO) AND');
    Add('  (S.IDPESSOA        = VLR_TOT_REM.IDSINDICATO) AND');
    Add('  (EPJ.IDCIDADES     = CPJ.IDCIDADES) AND');
    Add('  (CPJ.IDESTADO      = ESPJ.IDESTADO) AND');
    Add('  (EPS.IDCIDADES     = CPS.IDCIDADES) AND');
    Add('  (CPS.IDESTADO      = ESPS.IDESTADO) AND');
    Add('  (FP.IDFILIALPESSOA = NUM_FILIAIS.IDPESSOA(+)) AND');
    Add('  (S.IDPESSOA        = CNPJ_SINDI.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  NOME_SINDI');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlGRCS.Open;
  frmAguarde.Max := CdsGRCS.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptGRCS.CdsGRCSAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Refresh;
end;

procedure TRptGRCS.rpGRCSDtlBndBeforePrint(Sender: TObject);
begin
  rpGRCSLabelTotal.Caption := FU.ValStr(CdsGRCS.FieldByName('VAL_CONTRIB').asFloat +
    CdsGRCS.FieldByName('MULTA').asFloat + CdsGRCS.FieldByName('JUROS').asFloat +
    CdsGRCS.FieldByName('CORRECAO_MONET').asFloat, 12, 2, true, ',');
end;

procedure TRptGRCS.rpGRCSSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
