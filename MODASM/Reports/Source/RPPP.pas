{
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
// Autor(a)    :  Darivaldo Alencar
// Data        :  25/05/2016
// Pendência   :  SIG 21755
// Descricao   :  Alterado campo CATCNAE  para IDCATCNAE nas tabelas ITEMCNAE
//                e FILIALPESSOA(somente na query).
//------------------------------------------------------------------------------
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
}
unit RPPP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, ppProd, ppClass, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppPrnabl, ppBands, ppCache, ppStrtch, ppSubRpt, ppMemo, DBTables, Wwquery, ppRegion,
  ppVar, IvDictio, IvMulti, TXRB, USistema;

type
  TRptPPP = class(TFrmCmReport)
    dsPPP: TwwDataSource;
    ppPPP: TppBDEPipeline;
    rpPPP: TppReport;
    ppCargos: TppBDEPipeline;
    dsCargos: TwwDataSource;
    rpGPSImage1: TppImage;
    rpGPSLabel1: TppLabel;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine7: TppLine;
    ppLabel7: TppLabel;
    ppLine8: TppLine;
    ppLabel9: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    rpPPPHdrBand: TppHeaderBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine23: TppLine;
    ppDBText13: TppDBText;
    ppMemo1: TppMemo;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppLine26: TppLine;
    ppLabel23: TppLabel;
    ppPPRA: TppBDEPipeline;
    dsPPRA: TwwDataSource;
    ppAgentes: TppBDEPipeline;
    ppAgentesppField1: TppField;
    ppAgentesppField2: TppField;
    ppAgentesppField3: TppField;
    ppAgentesppField4: TppField;
    ppAgentesppField5: TppField;
    ppAgentesppField6: TppField;
    dsAgentes: TwwDataSource;
    sqlCargos: TwwQuery;
    sqlPPRA: TwwQuery;
    sqlAgentes: TwwQuery;
    sqlPPP: TwwQuery;
    ppLabel2: TppLabel;
    ppLabel8: TppLabel;
    ppDBText2: TppDBText;
    ppLine2: TppLine;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppRequisitos: TppBDEPipeline;
    dsRequisitos: TwwDataSource;
    sqlRequisitos: TwwQuery;
    ppExames: TppBDEPipeline;
    dsExames: TwwDataSource;
    qryExames: TwwQuery;
    ppEvolFunc: TppBDEPipeline;
    dsEvolFunc: TwwDataSource;
    qryEvolFunc: TwwQuery;
    rpRequisitos: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText7: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    rpCargo: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLine22: TppLine;
    ppLabel51: TppLabel;
    ppLine33: TppLine;
    ppDBText9: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    rpEvolFunc: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    rpAgentes: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape7: TppShape;
    ppLabel24: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape6: TppShape;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText18: TppDBText;
    ppDBText21: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    rpExames: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppDBMemo3: TppDBMemo;
    ppDBText30: TppDBText;
    ppLine19: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppRegion1: TppRegion;
    ppLine36: TppLine;
    ppRegion2: TppRegion;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine45: TppLine;
    ppLine46: TppLine;
    ppLine47: TppLine;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLine29: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLabel25: TppLabel;
    ppLine75: TppLine;
    ppShape4: TppShape;
    ppLabel26: TppLabel;
    ppLabel75: TppLabel;
    ppLabel78: TppLabel;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine81: TppLine;
    ppLine80: TppLine;
    ppRegion3: TppRegion;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape8: TppShape;
    ppLine27: TppLine;
    ppShape9: TppShape;
    ppLine82: TppLine;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel1: TppLabel;
    ppLabel16: TppLabel;
    ppLine3: TppLine;
    ppLabel29: TppLabel;
    ppLine6: TppLine;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel62: TppLabel;
    ppLine9: TppLine;
    ppLine20: TppLine;
    ppDBText19: TppDBText;
    ppDBText32: TppDBText;
    ppLabel64: TppLabel;
    ppLabel76: TppLabel;
    ppShape2: TppShape;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLine21: TppLine;
    ppLabel40: TppLabel;
    ppLine24: TppLine;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppShape10: TppShape;
    ppLabel43: TppLabel;
    ppLine30: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel77: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine42: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppDBText5: TppDBText;
    ppDBText33: TppDBText;
    ppLine59: TppLine;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel84: TppLabel;
    ppLine67: TppLine;
    ppLabel85: TppLabel;
    ppLabel21: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel22: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppShape11: TppShape;
    ppLabel89: TppLabel;
    ppLine28: TppLine;
    ppLabel90: TppLabel;
    ppRegion4: TppRegion;
    rpMemoObservacao: TppMemo;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppDBText31: TppDBText;
    ppLine25: TppLine;
    ppLine68: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppDBText34: TppDBText;
    ppLine69: TppLine;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppLine70: TppLine;
    ppDBText35: TppDBText;
    lblCFM1715: TppLabel;
    ppDBText36: TppDBText;
    rpResponsavelExames: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLine87: TppLine;
    ppLine88: TppLine;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLine89: TppLine;
    ppRegion5: TppRegion;
    ppDBText37: TppDBText;
    ppDBText40: TppDBText;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLine90: TppLine;
    ppLine91: TppLine;
    ppLine92: TppLine;
    ppLine93: TppLine;
    ppDBText17: TppDBText;
    ppCAT: TppBDEPipeline;
    dsCAT: TwwDataSource;
    qryCAT: TwwQuery;
    rpCAT: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppLine18: TppLine;
    ppLine95: TppLine;
    ppLine96: TppLine;
    ppLine97: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure sqlPPPAfterScroll(DataSet: TDataSet);
  end;

var
  RptPPP: TRptPPP;

implementation

uses uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptPPP.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  lblCFM1715.Visible := not CmpRptCM.ParamByName('ImprimirSecao3').asBoolean;
  ppDetailBand6.Visible := CmpRptCM.ParamByName('ImprimirSecao3').asBoolean;
  
  rpMemoObservacao.Lines.Text := CmpRptCM.ParamByName('Observacao').asString;
  sqlPPP.Close;
  with (sqlPPP.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT F.IDPESSOA,');
    Add('  PJ.RAZAOSOCIAL AS EMPRESA, CN.DESCRICAO AS CNAE, FP.IDITEMCNAE AS CODCNAE,');
    Add('  PF.NOME AS EMPREGADO, F.DATAADMISSAO,  PFIS.DATANASC,');
    Add('  DECODE(PFIS.SEXO,''M'',''Masculino'',''Feminino'') AS SEXO,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeAssinante').asString)+ ') AS ASSINANTE,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('CargoAssinante').asString)+ ') AS CARGOASSINANTE,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString+ ' a '+
                         CmpRptCM.ParamByName('DataFinal').asString)+ ') AS PERIODO,');
    Add('  F.MATRICULA, F.IDEMPRESA, F.CODCENTROCUSTO, F.IDCARGO, F.IDESTAB, F.IDHORARIO,');
    Add('  CC.NOME AS NOMECENTROCUSTO,');
    Add('  ''0'' || TO_CHAR(NVL(F.IDSITRISCO,1)) AS GFIP,');
    Add('  C.TITULO, C.IDCARGO, F.DATACARGO,');
    Add('  PJ.NUMDOCUMENTO AS CGC,');
    Add('  TRIM(CIDADES.NOME) || '','' AS CIDADE,');
    Add('  RTRIM(END.LOGRADOURO) ||'', ''|| END.NUMERO || DECODE(END.COMPLEMENTO,NULL,NULL,'' - '' ||');
    Add('    RTRIM(END.COMPLEMENTO)) ||'' - ''|| RTRIM(END.BAIRRO) ||'' - ''|| RTRIM(CIDADES.NOME) ||');
    Add('    '' - CEP:'' || RTRIM(SUBSTR(END.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(END.CEP,6,3)) AS ENDERECO,');
    Add('  HT.JORNADAMENSAL,');
    Add('  CTPS.NUM AS CTPS, NIT.NUM AS NIT,');
    Add('  CASE WHEN PFIS.FLGDEFICIENTE IN (1,3,4,5,6,7) THEN ''PDH'' ');
    Add('       WHEN PFIS.FLGDEFICIENTE = 2 THEN ''BR'' ELSE ''NA'' END AS BRPDH,');
    Add('  CASE WHEN HT.FLGTIPOHORARIO = 1 THEN TO_CHAR(HORASSERVICO)||'' x ''||TO_CHAR(HORASFOLGA1+HORASFOLGA2)||'' horas''  ELSE ''NA'' END AS REGIME');
    Add('FROM');
    Add('  PESSOA PJ, PESSOA PF, ENDPESS END, PESSOAFISICA PFIS,');
    Add('  FUNCIONARIO F, CARGO C, CIDADES, HORATRAB HT, FILIALPESSOA FP,');
    Add('  CENTCUST CC, ITEMCNAE CN, SITFUNC S,');
    // -------------------------------------------------------------------- //
    // CTPS do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO || '' - '' || DP.UF AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''CTPS:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) CTPS,');
    // -------------------------------------------------------------------- //
    // NIT (PIS/PASEP) do Funcionário
    Add('  (SELECT F.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FUNCIONARIO F, TIPODOCOFICIAL TDO');
    Add('   WHERE (TDO.SIGLADOCUMENTO = ''PIS/PASEP:'') AND');
    Add('         (TDO.IDDOCUMENTO    = DP.IDDOCUMENTO) AND');
    Add('         (DP.IDPESSOA        = F.IDPESSOA)) NIT');
    // -------------------------------------------------------------------- //
    Add('WHERE');
    // Funcionário(s) selecionado(s) (para PESSOA)
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (F.IDPESSOA IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (F.IDPESSOA  = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
    begin
      // C. de Custo(s) habilitados para o usuário
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',', CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('  (F.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('  (F.CODCENTROCUSTO  = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');
    end;

    Add('  (PJ.IDPESSOA       = F.IDESTAB) AND');
    Add('  (PF.IDPESSOA       = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA       = PFIS.IDPESSOA) AND');
    Add('  (C.IDCARGO         = F.IDCARGO) AND');
    Add('  (HT.IDHORARIO      = F.IDHORARIO) AND');
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');
    Add('  (F.IDSITFUNC       = S.IDSITFUNC) AND');
    Add('  (F.DATAADMISSAO   <= TO_DATE('
           +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('  ((S.TIPOSIT <> ''D'') OR (F.DATADESLIGAMENTO >= TO_DATE('
           +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY''))) AND');
    Add('  (F.IDPESSOA        = CTPS.IDPESSOA(+)) AND');
    Add('  (F.IDPESSOA        = NIT.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = END.IDPESSOA(+)) AND');
    Add('  (PJ.IDENDCOMERCIAL = END.IDENDERECO(+)) AND');
    Add('  (END.IDCIDADES     = CIDADES.IDCIDADES(+)) AND');
    //Darivaldo Alencar  SIG.21755 -INICIO
    //Add('  (FP.CATCNAE        = CN.CATCNAE(+)) AND');
    Add('  (FP.IDCATCNAE        = CN.IDCATCNAE(+)) AND');
    //Darivaldo Alencar  SIG.21755 - FIM
    Add('  (FP.IDITEMCNAE     = CN.IDITEMCNAE(+)) AND');
    Add('  (F.IDEMPRESA       = CC.IDEMPRESA(+)) AND');
    Add('  (F.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))');
    Add('ORDER BY EMPRESA, EMPREGADO');
{    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  EMPRESA, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      1 : Add('  EMPRESA, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
      2 : Add('  EMPRESA, NOMECENTROCUSTO, EMPREGADO, TIPORUBRICA, CODRUBRICACLIENTE');
      3 : Add('  EMPRESA, NOMECENTROCUSTO, MATRICULA, TIPORUBRICA, CODRUBRICACLIENTE');
    end;
}
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlPPP.Open;
  sqlPPPAfterScroll(nil);
end;

procedure TRptPPP.sqlPPPAfterScroll(DataSet: TDataSet);
var
  sIdEmpresa, sIdEstab, sIdCargo, sCodCentroCusto, sIdHorario: string;
begin
  sIdEmpresa      := sqlPPP.FieldByName('IdEmpresa').asString;
  if (sIdEmpresa = '') then
    sIdEmpresa := '-1';

  sIdEstab := sqlPPP.FieldByName('IDESTAB').asString;
  if (sIdEstab = '') then
    sIdEstab := '-1';

  sCodCentroCusto := Trim(sqlPPP.FieldByName('CODCENTROCUSTO').asString);
  if (sCodCentroCusto = '') then
    sCodCentroCusto := '-1';

  sIdCargo := sqlPPP.FieldByName('IDCARGO').asString;
  if (sIdCargo = '') then
    sIdCargo := '-1';

  sIdHorario := sqlPPP.FieldByName('IDHORARIO').asString;
  if (sIdHorario = '') then
    sIdHorario := '-1';

{
  sqlCargos.Close;
  with (sqlCargos.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  DESCRICAO');
    Add('FROM');
    Add('  CARGO');
    Add('WHERE');
    Add('  (IDCARGO = ' +sIdCargo+ ')');
  end;
  sqlCargos.Open;

  sqlRequisitos.Close;
  with (sqlRequisitos.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  1 AS TIPO, ''Curso......: '' || C.DESCRICAO AS DESCRICAO');
    Add('FROM');
    Add('  CURSO C, CURSOREQ R');
    Add('WHERE');
    Add('  (R.IDCARGO = ' +sIdCargo+ ') AND');
    Add('  (C.IDCURSO = R.IDCURSO)');

    Add('UNION SELECT');
    Add('  2 AS TIPO, ''Experiência: '' || T.DESCRICAO ||');
    Add('  DECODE(TEMPOEXPER,NULL,'''','' '' || TO_CHAR(TEMPOEXPER) || '' Meses'') AS DESCRICAO');
    Add('FROM');
    Add('  TABEXPER T, EXPREQER R');
    Add('WHERE');
    Add('  (R.IDCARGO = ' +sIdCargo+ ') AND');
    Add('  (T.IDEXPER = R.IDEXPER)');

    Add('UNION SELECT');
    Add('  3 AS TIPO, ''Avaliação..: '' || T.DESCRTIPOAVAL AS DESCRICAO');
    Add('FROM');
    Add('  TIPOAVAL T, AVALCARGO R');
    Add('WHERE');
    Add('  (R.IDCARGO = ' +sIdCargo+ ') AND');
    Add('  (T.CODTIPOAVAL = R.CODTIPOAVAL)');

    Add('ORDER BY 1, 2');
  end;
  sqlRequisitos.Open;
}

  sqlPPRA.Close;
  with (sqlPPRA.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  RTRIM(P.DESCRICAO) || '' - '' ||');
    Add('    RTRIM(L.NOME) || '' - '' || RTRIM(L.ENDERECO) AS DESCRICAO,');
    Add('  PF.NOME AS RESPONSAVEL,');
    Add('  PF.NUMDOCUMENTO AS NIT,');
    Add('  P.TEXTOCOMPL,');
    Add('  P.DATAAVAL,');
    Add('  P.IDAVAL');
    Add('FROM');
    Add('  PPRAAVAL P, PESSOA PF, LOCALIZACAO L,');
    Add('  (SELECT');
    Add('     PA.IDAVAL');
    Add('   FROM');
    Add('     PPRAAVAL PA,');
    Add('     (SELECT IDLOCALIZACAO');
    Add('      FROM   LOCALIZACAO');
    Add('      WHERE (IDPESSOA       = ' +sIdEmpresa+ ') AND');
    Add('            (CODCENTROCUSTO = ' +QuotedStr(sCodCentroCusto)+ ')) LOCAL');
    Add('   WHERE');
    Add('     (PA.DATAAVAL >= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('     (PA.DATAAVAL <= TO_DATE(' +
      QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) AND');
    Add('     ((PA.IDEMPRESA     IS NULL) OR');
    Add('      (PA.IDEMPRESA      = ' +sIdEmpresa+ ')) AND');
    Add('     ((PA.IDESTAB       IS NULL) OR');
    Add('      (PA.IDESTAB        = ' +sIdEstab+ ')) AND');
    Add('     ((PA.IDHORARIO     IS NULL) OR');
    Add('      (PA.IDHORARIO      = ' +sIdHorario+ ')) AND');
    Add('     ((PA.IDCARGO       IS NULL) OR');
    Add('      (PA.IDCARGO        = ' +sIdCargo+ ')) AND');
    Add('     ((PA.IDLOCALIZACAO IS NULL) OR');
    Add('      (PA.IDLOCALIZACAO  = LOCAL.IDLOCALIZACAO))) AVAL');
    Add('WHERE');
    Add('  (P.IDAVAL        = AVAL.IDAVAL) AND');
    Add('  (P.IDLOCALIZACAO = L.IDLOCALIZACAO(+)) AND');
    Add('  (P.IDRESPONSAVEL = PF.IDPESSOA(+))');
    Add('ORDER BY');
    Add('  P.DATAAVAL DESC');
  end;
  sqlPPRA.Open;

  {sqlAgentes.Close;
  sqlAgentes.ParamByName('IDAVAL').AsInteger := sqlPPRA.FieldByName('IDAVAL').AsInteger;
  sqlAgentes.Open;}
end;

end.
