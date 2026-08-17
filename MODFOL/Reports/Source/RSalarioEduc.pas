// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RSalarioEduc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBarCod,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, DBClient, uCMClientDataSet, uCmSqlParams, TXRB, USistema;

type
  TRptSalarioEduc = class(TFrmCmReport)
    rpSalarioEduc: TppReport;
    ppDetailBand11: TppDetailBand;
    rpSalarioEducSmryBnd: TppSummaryBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    rpSalarioEducGroupFootBnd: TppGroupFooterBand;
    rpSalarioEducShape37: TppShape;
    rpSalarioEducShape18: TppShape;
    rpSalarioEducShape6: TppShape;
    rpSalarioEducShape9: TppShape;
    rpSalarioEducShape10: TppShape;
    rpSalarioEducShape3: TppShape;
    rpSalarioEducLbl4: TppLabel;
    rpSalarioEducShape2: TppShape;
    rpSalarioEducShape4: TppShape;
    rpSalarioEducLabel9: TppLabel;
    rpSalarioEducLbl6: TppLabel;
    rpSalarioEducShape1: TppShape;
    rpSalarioEducImage1: TppImage;
    rpSalarioEducLine33: TppLine;
    rpSalarioEducLbl5: TppLabel;
    rpSalarioEducShape17: TppShape;
    rpSalarioEducShape16: TppShape;
    rpSalarioEducShape15: TppShape;
    rpSalarioEducShape14: TppShape;
    rpSalarioEducShape13: TppShape;
    rpSalarioEducShape12: TppShape;
    rpSalarioEducDBCalc1: TppDBCalc;
    rpSalarioEducDBTxt13: TppDBText;
    rpSalarioEducLbl23: TppLabel;
    rpSalarioEducLbl24: TppLabel;
    rpSalarioEducLbl25: TppLabel;
    rpSalarioEducLbl26: TppLabel;
    rpSalarioEducLbl27: TppLabel;
    rpSalarioEducLbl28: TppLabel;
    rpSalarioEducLbl29: TppLabel;
    rpSalarioEducDBTxt14: TppDBText;
    rpSalarioEducDBTxt15: TppDBText;
    rpSalarioEducDBTxt16: TppDBText;
    rpSalarioEducMemo1: TppMemo;
    rpSalarioEducLbl17: TppLabel;
    rpSalarioEducDBTxt10: TppDBText;
    rpSalarioEducLbl30: TppLabel;
    rpSalarioEducLbl21: TppLabel;
    rpSalarioEducDBTxtINSCRICAO1: TppDBText;
    rpSalarioEducLbl9: TppLabel;
    rpSalarioEducDBTxt3: TppDBText;
    rpSalarioEducLbl16: TppLabel;
    rpSalarioEducDBTxt9: TppDBText;
    rpSalarioEducLine6: TppLine;
    rpSalarioEducLine5: TppLine;
    rpSalarioEducLine4: TppLine;
    rpSalarioEducLbl14: TppLabel;
    rpSalarioEducLbl18: TppLabel;
    rpSalarioEducLbl19: TppLabel;
    rpSalarioEducLine7: TppLine;
    rpSalarioEducLbl2: TppLabel;
    rpSalarioEducLbl3: TppLabel;
    rpSalarioEducDBTxt12: TppDBText;
    rpSalarioEducDBTxt17: TppDBText;
    rpSalarioEducLbl1: TppLabel;
    rpSalarioEducShape7: TppShape;
    rpSalarioEducShape8: TppShape;
    rpSalarioEducLbl10: TppLabel;
    rpSalarioEducLine1: TppLine;
    rpSalarioEducLine2: TppLine;
    rpSalarioEducLbl11: TppLabel;
    rpSalarioEducDBTxt4: TppDBText;
    rpSalarioEducDBTxt5: TppDBText;
    rpSalarioEducDBTxt6: TppDBText;
    rpSalarioEducDBTxt7: TppDBText;
    rpSalarioEducLbl7: TppLabel;
    rpSalarioEducDBTxt1: TppDBText;
    rpSalarioEducLbl8: TppLabel;
    rpSalarioEducDBTxt2: TppDBText;
    rpSalarioEducLbl12: TppLabel;
    rpSalarioEducLbl15: TppLabel;
    rpSalarioEducDBTxt8: TppDBText;
    rpSalarioEducLine3: TppLine;
    rpSalarioEducShape11: TppShape;
    rpSalarioEducLbl22: TppLabel;
    rpSalarioEducDBTxt11: TppDBText;
    rpSalarioEducLine9: TppLine;
    rpSalarioEducLine8: TppLine;
    rpSalarioEducShape19: TppShape;
    rpSalarioEducShape20: TppShape;
    rpSalarioEducShape28: TppShape;
    rpSalarioEducShape27: TppShape;
    rpSalarioEducShape26: TppShape;
    rpSalarioEducShape25: TppShape;
    rpSalarioEducShape24: TppShape;
    rpSalarioEducShape23: TppShape;
    rpSalarioEducShape22: TppShape;
    rpSalarioEducDBCalc2: TppDBCalc;
    rpSalarioEducDBTxt24: TppDBText;
    rpSalarioEducLbl40: TppLabel;
    rpSalarioEducLbl41: TppLabel;
    rpSalarioEducLbl42: TppLabel;
    rpSalarioEducLbl43: TppLabel;
    rpSalarioEducLbl44: TppLabel;
    rpSalarioEducLbl45: TppLabel;
    rpSalarioEducLbl46: TppLabel;
    rpSalarioEducDBTxt25: TppDBText;
    rpSalarioEducDBTxt26: TppDBText;
    rpSalarioEducDBTxt27: TppDBText;
    ppMemo1: TppMemo;
    rpSalarioEducLbl34: TppLabel;
    rpSalarioEducDBTxt20: TppDBText;
    rpSalarioEducLbl47: TppLabel;
    rpSalarioEducLbl38: TppLabel;
    rpSalarioEducDBTxtINSCRICAO2: TppDBText;
    rpSalarioEducLbl33: TppLabel;
    rpSalarioEducDBTxt19: TppDBText;
    rpSalarioEducLine13: TppLine;
    rpSalarioEducLine12: TppLine;
    rpSalarioEducLine11: TppLine;
    rpSalarioEducLbl31: TppLabel;
    rpSalarioEducLbl35: TppLabel;
    rpSalarioEducLbl36: TppLabel;
    rpSalarioEducLine14: TppLine;
    rpSalarioEducDBTxt23: TppDBText;
    rpSalarioEducDBTxt28: TppDBText;
    rpSalarioEducLbl32: TppLabel;
    rpSalarioEducDBTxt18: TppDBText;
    rpSalarioEducLine10: TppLine;
    rpSalarioEducShape21: TppShape;
    rpSalarioEducLbl39: TppLabel;
    rpSalarioEducDBTxt22: TppDBText;
    rpSalarioEducLine16: TppLine;
    rpSalarioEducLine15: TppLine;
    rpSalarioEducLbl13: TppLabel;
    rpSalarioEducShape33: TppShape;
    rpSalarioEducShape31: TppShape;
    rpSalarioEducLbl51: TppLabel;
    rpSalarioEducShape30: TppShape;
    rpSalarioEducShape32: TppShape;
    ppLabel65: TppLabel;
    rpSalarioEducLbl53: TppLabel;
    rpSalarioEducShape29: TppShape;
    rpSalarioEducImage2: TppImage;
    rpSalarioEducLbl52: TppLabel;
    ppMemo3: TppMemo;
    rpSalarioEducLbl56: TppLabel;
    rpSalarioEducDBTxt31: TppDBText;
    rpSalarioEducLbl49: TppLabel;
    rpSalarioEducLbl50: TppLabel;
    rpSalarioEducLbl48: TppLabel;
    rpSalarioEducDBTxt36: TppShape;
    rpSalarioEducShape35: TppShape;
    rpSalarioEducLbl57: TppLabel;
    rpSalarioEducLine17: TppLine;
    rpSalarioEducLine18: TppLine;
    rpSalarioEducLbl58: TppLabel;
    rpSalarioEducDBTxt32: TppDBText;
    rpSalarioEducDBTxt33: TppDBText;
    rpSalarioEducDBTxt34: TppDBText;
    rpSalarioEducDBTxt35: TppDBText;
    rpSalarioEducLbl54: TppLabel;
    rpSalarioEducDBTxt29: TppDBText;
    rpSalarioEducLbl55: TppLabel;
    rpSalarioEducDBTxt30: TppDBText;
    rpSalarioEducLbl59: TppLabel;
    rpSalarioEducLbl60: TppLabel;
    rpSalarioEducShape36: TppShape;
    rpSalarioEducShape45: TppShape;
    rpSalarioEducShape44: TppShape;
    rpSalarioEducShape43: TppShape;
    rpSalarioEducShape42: TppShape;
    rpSalarioEducShape41: TppShape;
    rpSalarioEducShape40: TppShape;
    rpSalarioEducShape39: TppShape;
    rpSalarioEducDBCalc3: TppDBCalc;
    rpSalarioEducDBTxt42: TppDBText;
    rpSalarioEducLbl70: TppLabel;
    rpSalarioEducLbl71: TppLabel;
    rpSalarioEducLbl72: TppLabel;
    rpSalarioEducLbl73: TppLabel;
    rpSalarioEducLbl74: TppLabel;
    rpSalarioEducLbl75: TppLabel;
    rpSalarioEducLbl76: TppLabel;
    rpSalarioEducDBTxt43: TppDBText;
    rpSalarioEducDBTxt44: TppDBText;
    rpSalarioEducDBTxt45: TppDBText;
    rpSalarioEducLbl64: TppLabel;
    rpSalarioEducDBTxt39: TppDBText;
    rpSalarioEducLbl77: TppLabel;
    rpSalarioEducLbl68: TppLabel;
    rpSalarioEducDBTxtINSCRICAO3: TppDBText;
    rpSalarioEducLbl63: TppLabel;
    rpSalarioEducDBTxt38: TppDBText;
    rpSalarioEducLine22: TppLine;
    rpSalarioEducLine21: TppLine;
    rpSalarioEducLine20: TppLine;
    rpSalarioEducLbl61: TppLabel;
    rpSalarioEducLbl65: TppLabel;
    rpSalarioEducLbl66: TppLabel;
    rpSalarioEducLine23: TppLine;
    rpSalarioEducDBTxt41: TppDBText;
    rpSalarioEducDBTxt46: TppDBText;
    rpSalarioEducLbl62: TppLabel;
    rpSalarioEducDBTxt37: TppDBText;
    rpSalarioEducLine19: TppLine;
    rpSalarioEducShape38: TppShape;
    rpSalarioEducLbl69: TppLabel;
    rpSalarioEducDBTxt40: TppDBText;
    rpSalarioEducLine25: TppLine;
    rpSalarioEducLine24: TppLine;
    rpSalarioEducShape46: TppShape;
    rpSalarioEducShape47: TppShape;
    rpSalarioEducShape55: TppShape;
    rpSalarioEducShape54: TppShape;
    rpSalarioEducShape53: TppShape;
    rpSalarioEducShape52: TppShape;
    rpSalarioEducShape51: TppShape;
    rpSalarioEducShape50: TppShape;
    rpSalarioEducShape49: TppShape;
    rpSalarioEducDBCalc4: TppDBCalc;
    rpSalarioEducDBTxt52: TppDBText;
    rpSalarioEducLbl87: TppLabel;
    rpSalarioEducLbl88: TppLabel;
    rpSalarioEducLbl89: TppLabel;
    rpSalarioEducLbl90: TppLabel;
    rpSalarioEducLbl91: TppLabel;
    rpSalarioEducLbl92: TppLabel;
    rpSalarioEducLbl93: TppLabel;
    rpSalarioEducDBTxt53: TppDBText;
    rpSalarioEducDBTxt54: TppDBText;
    rpSalarioEducDBTxt55: TppDBText;
    ppMemo4: TppMemo;
    rpSalarioEducLbl81: TppLabel;
    rpSalarioEducDBTxt49: TppDBText;
    ppLabel125: TppLabel;
    rpSalarioEducLbl85: TppLabel;
    rpSalarioEducDBTxtINSCRICAO4: TppDBText;
    rpSalarioEducLbl80: TppLabel;
    rpSalarioEducDBTxt48: TppDBText;
    rpSalarioEducLine29: TppLine;
    rpSalarioEducLine28: TppLine;
    rpSalarioEducLine27: TppLine;
    rpSalarioEducLbl78: TppLabel;
    rpSalarioEducLbl82: TppLabel;
    rpSalarioEducLbl83: TppLabel;
    rpSalarioEducLine30: TppLine;
    rpSalarioEducDBTxt51: TppDBText;
    rpSalarioEducDBTxt56: TppDBText;
    rpSalarioEducLbl79: TppLabel;
    rpSalarioEducDBTxt47: TppDBText;
    rpSalarioEducLine26: TppLine;
    rpSalarioEducShape48: TppShape;
    rpSalarioEducLbl86: TppLabel;
    rpSalarioEducDBTxt50: TppDBText;
    rpSalarioEducLine32: TppLine;
    rpSalarioEducLine31: TppLine;
    rpSalarioEducLine34: TppLine;
    rpSalarioEducBarCode1: TppBarCode;
    rpSalarioEducLblCodBarras1: TppLabel;
    rpSalarioEducLblCodBarras2: TppLabel;
    rpSalarioEducBarCode2: TppBarCode;
    ppSalarioEduc: TppBDEPipeline;
    dsSalarioEduc: TwwDataSource;
    sqlSalarioEduc: TCMSqlParams;
    CdsSalarioEduc: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsSalarioEducAfterScroll(DataSet: TDataSet);
    procedure rpSalarioEducSmryBndAfterPrint(Sender: TObject);
  private
    function CalcDAC(var Valor: string): string;
    function FormatarCodBarras(Valor: string): string;
    function Formatar_RepNum_CodBarras(Valor: string): string;
  end;

var
  RptSalarioEduc: TRptSalarioEduc;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptSalarioEduc.CrmRptCMBeforePrint(Sender: TObject);
var
  sMascaraDoc, sCodigoBarras, sMes, sCompetencia: string;
  DocID: array [1..2] of integer;
begin
  inherited;
  DocID[1] := 0;
  DocID[2] := 0;
  sMascaraDoc := '';

  sMes := QuotedStr(CmpRptCM.ParamByName('AnoRef').asString +'/'+
    FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger));

  // Documentos
  with (dmCds.sql) do
  begin
    SQL.Clear;
    SQL.Add('SELECT TDO.IDDOCUMENTO, TDO.SIGLADOCUMENTO, TDP.MASCARA');
    SQL.Add('FROM   TIPODOCPESSOA TDP, TIPODOCOFICIAL TDO');
    SQL.Add('WHERE ((TDO.SIGLADOCUMENTO = ''CNPJ:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CGC:'') OR');
    SQL.Add('       (TDO.SIGLADOCUMENTO = ''CEI:'')) AND');
    SQL.Add('      (TDO.IDDOCUMENTO     = TDP.IDDOCUMENTO)');
    Open;
  end;

  with (dmCds.Cds) do
  begin
    while not(EOF) do
    begin
      if (FieldByName('SIGLADOCUMENTO').asString = 'CNPJ:') or
         (FieldByName('SIGLADOCUMENTO').asString = 'CGC:') then
      begin
        DocID[1] := FieldByName('IDDOCUMENTO').asInteger;
        sMascaraDoc := Trim(FieldByName('MASCARA').asString);
      end
      else
      if (FieldByName('SIGLADOCUMENTO').asString = 'CEI:') then
      begin
        DocID[2] := FieldByName('IDDOCUMENTO').asInteger;
        if (DocID[1] = 0) then
          sMascaraDoc := Trim(FieldByName('MASCARA').asString);
      end;
      Next;
    end;
  end;

  with (sqlSalarioEduc.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  RTRIM(PJ.RAZAOSOCIAL) AS ESTAB,');
    Add('  DECODE(CNPJ.NUM,NULL,''0'',''1'') AS TIPO_INSCRICAO,');
    Add('  RTRIM(DECODE(CNPJ.NUM,NULL,CEI.NUM,CNPJ.NUM)) AS INSCRICAO,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NumConvRec').asString)+ ') AS NUMCONVREC,');
    Add('  (' +QuotedStr(FU.IFF(CmpRptCM.ParamByName('DataVencimento').asDateTime > 0,
      CmpRptCM.ParamByName('DataVencimento').asString, 'IDÊNTICO INSS'))+ ') AS VENCIMENTO,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('AgenciaCentralizadora').asString)+ ') AS AG_CENTRALIZ,');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NumeroConta').asString)+ ') AS NUM_CONTA,');
    Add('  ('' '') AS NUMPROC_EXECFISC,');
    Add('  (0) AS VALOR_ATUALIZADO,');
    Add('  (0) AS COMPENSACAO,');
    Add('  (0) AS ATUALIZ_MONET,');
    Add('  (0) AS MULTA_JUROS,');
    Add('  RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO || DECODE(E.COMPLEMENTO,'' '','' - '' ||');
    Add('    RTRIM(E.COMPLEMENTO)) ||'' - ''|| RTRIM(E.BAIRRO) AS ENDERECO,');
    Add('  RTRIM(CIDADES.NOME) ||''-''|| CIDADES.CODESTADO AS CIDADE,');
    Add('  RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP,');

    if (CmpRptCM.ParamByName('Competencia13').asBoolean) then
      Add('  '+QuotedStr('13/'+ CmpRptCM.ParamByName('AnoRef').asString)+' AS REFERENCIA,')
    else
      Add('  '+QuotedStr(FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger) +'/'+
        CmpRptCM.ParamByName('AnoRef').asString)+' AS REFERENCIA,');

    Add('  NVL(VLR_DED_SME.VALOR,0) AS DEDUCAO_SME,');
    Add('  (VLR_BASE_CONTRIB.VALOR) AS BASE_CONTRIB,');

    if (CmpRptCM.ParamByName('PercentualContribFPAS').asFloat = 0) then
    begin
      Add('  (VLR_BASE_CONTRIB.VALOR * (CP.PERCCONVPREVID / 100)) AS SAL_EDUCACAO,');
      Add('  ((VLR_BASE_CONTRIB.VALOR * (CP.PERCCONVPREVID / 100)) -'+
          '  NVL(VLR_DED_SME.VALOR,0)) AS VALOR_TOTAL');
    end
    else
    begin
      Add('  (VLR_BASE_CONTRIB.VALOR  * (' + FU.Float2String(
        CmpRptCM.ParamByName('PercentualContribFPAS').asFloat)+' / 100)) AS SAL_EDUCACAO,');
      Add('  ((VLR_BASE_CONTRIB.VALOR * (' + FU.Float2String(
        CmpRptCM.ParamByName('PercentualContribFPAS').asFloat)+' / 100)) -'+
        '  NVL(VLR_DED_SME.VALOR,0)) AS VALOR_TOTAL');
    end;

    Add('FROM');

    if (CmpRptCM.ParamByName('PercentualContribFPAS').asFloat = 0) then
      Add('  PESSOA PJ, ENDPESS E, CIDADES, CONVPREVID CP, FILIALPESSOA FP,')
    else
      Add('  PESSOA PJ, ENDPESS E, CIDADES, FILIALPESSOA FP,');
    // -------------------------------------------------------------------------- //
    // CNPJ da Empresa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FILIALPESSOA FP');
    Add('   WHERE  (DP.IDDOCUMENTO = ' +IntToStr(DocID[1])+ ') AND');
    Add('          (DP.IDPESSOA    = FP.IDFILIALPESSOA)) CNPJ,');
    // -------------------------------------------------------------------------- //
    // CEI da Empresa
    Add('  (SELECT DP.IDPESSOA, DP.NUMDOCUMENTO AS NUM');
    Add('   FROM   DOCPESSOA DP, FILIALPESSOA FP');
    Add('   WHERE  (DP.IDDOCUMENTO = ' +IntToStr(DocID[2])+ ') AND');
    Add('          (DP.IDPESSOA    = FP.IDFILIALPESSOA)) CEI,');
    // -------------------------------------------------------------------------- //
    // Valor da Dedução para o SME
    Add('  (SELECT F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P, FUNCIONARIO F');
    Add('   WHERE (P.CODRUBCLT  = ''40460'') AND');
    Add('         (H.MES        = '+sMes+') AND');

    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (H.IDMOTIVO',CmpRptCM.ParamByName('ListaTipoFolha').asString,2));

    Add('         (P.IDPROVENTO = H.IDRUBRICA) AND');
    Add('         (H.IDPESSOA   = F.IDPESSOA)');
    Add('   GROUP BY F.IDESTAB) VLR_DED_SME,');
    // -------------------------------------------------------------------------- //
    // Valor do Salário Educação
    Add('  (SELECT F.IDESTAB, SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM   ' +CmpRptCM.ParamByName('NomeTabela').asString+ ' H, PROVDESC P, FUNCIONARIO F');
    // 60014 -> Valor da base do INSS
    // 60025 -> valor da base do inss
    // 62016 -> Valor da base do INSS do 13 salario
    // 60017 -> Valor da base do INSS (ad. de ferias)
    // 60035 -> Valor da base do INSS-diferenca salarial
    Add('   WHERE (P.CODRUBCLT IN (''60014'',''60025'',''62016'',''60017'',''60035'')) AND');
    Add('         (H.MES        = ' +sMes+ ') AND');

    if (CmpRptCM.ParamByName('ListaTipoFolha').asString <> '') then
      Add(FU.MontaLinhaSelSQL('         (H.IDMOTIVO',CmpRptCM.ParamByName('ListaTipoFolha').asString,2));

    Add('         (P.IDPROVENTO = H.IDRUBRICA) AND');
    Add('         (F.IDPESSOA   = H.IDPESSOA)');
    Add('   GROUP BY F.IDESTAB) VLR_BASE_CONTRIB');
    // -------------------------------------------------------------------------- //
    Add('WHERE');
    Add(FU.MontaLinhaSelSQL('  (PJ.IDPESSOA',CmpRptCM.ParamByName('ListaIdEstab').asString, 6));
    Add('  (PJ.IDPESSOA       = FP.IDFILIALPESSOA) AND');

    if (CmpRptCM.ParamByName('PercentualContribFPAS').asFloat = 0) then
    begin
      Add('  (FP.IDFPAS         = CP.IDFPAS) AND');
      Add('  (FP.IDCONVPREVID   = CP.IDCONVPREVID) AND');
    end;

    Add('  (PJ.IDENDCOMERCIAL = E.IDENDERECO) AND');
    Add('  (PJ.IDPESSOA       = E.IDPESSOA) AND');
    Add('  (E.IDCIDADES       = CIDADES.IDCIDADES) AND');
    Add('  (PJ.IDPESSOA       = VLR_BASE_CONTRIB.IDESTAB) AND');
    Add('  (PJ.IDPESSOA       = VLR_DED_SME.IDESTAB(+)) AND');
    Add('  (PJ.IDPESSOA       = CNPJ.IDPESSOA(+)) AND');
    Add('  (PJ.IDPESSOA       = CEI.IDPESSOA(+))');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlSalarioEduc.Open;
  frmAguarde.Max := CdsSalarioEduc.RecordCount;
  frmAguarde.Min := 0;

  if not(CdsSalarioEduc.IsEmpty) then
  begin
    if (CmpRptCM.ParamByName('DataVencimento').asDateTime > 0) then
      sCompetencia := FormatDateTime('YYMMDD', CmpRptCM.ParamByName('DataVencimento').asDateTime)
    else
    begin
      sCompetencia := FU.IncDataAM(FU.TiraCaracter(sMes,''''),1);
      sCompetencia := Copy(sCompetencia,3,2) +Copy(sCompetencia,6,2)+ '02';
    end;

    // Calculo o Código de Barras
    sCodigoBarras :=
      // 01-Identificação do Produto
      '8'+
      // 02-Identificação do Segmento
      '5'+
      // 03-Valor Referência
      '7'+
      // 04-DAC (no momento não é inserido)
      // 05-Valor da Guia
      '00000000000'+
      // 06-Código do FNDE (Febraban)
      '0155'+
      // 07-Tipo de receita/convênio
      // 1001 - corresponderá ao número "01".
      // 1002 - corresponderá ao número "02".
      // 1006 - corresponderá ao número "06".
      // 1009 - corresponderá ao número "09".
      FU.IFF(CmpRptCM.ParamByName('NumConvRec').asString='1001','01',
        FU.IFF(CmpRptCM.ParamByName('NumConvRec').asString='1002','02',
      FU.IFF(CmpRptCM.ParamByName('NumConvRec').asString='1006','06',
        FU.IFF(CmpRptCM.ParamByName('NumConvRec').asString='1009','09','00'))))+
      // 08-Validade da Guia
      sCompetencia+
      // 09-Competência
      FU.UltimosCaracteres(CmpRptCM.ParamByName('AnoRef').asString,2) +
      FU.IFF(CmpRptCM.ParamByName('Competencia13').asBoolean,
        '13', FU.PoeZero(CmpRptCM.ParamByName('MesRef').asInteger))+
      // 10-Tipo de identificação - 0 ou 1
      // Para identificação de empresa com CNPJ, igual a "1".
      // Para identificação de empresa com CEI, igual a "0".
      CdsSalarioEduc.FieldByName('TIPO_INSCRICAO').asString+
      // 11-Identificação do Contribuinte
      Copy(CdsSalarioEduc.FieldByName('INSCRICAO').asString,1,12);

    sCodigoBarras := FormatarCodBarras(sCodigoBarras);
    rpSalarioEducBarCode1.Data := sCodigoBarras;
    rpSalarioEducBarCode2.Data := sCodigoBarras;
                    
    sCodigoBarras := Formatar_RepNum_CodBarras(sCodigoBarras);
    rpSalarioEducLblCodBarras1.Caption := sCodigoBarras;
    rpSalarioEducLblCodBarras2.Caption := sCodigoBarras;

    // Máscara da Inscrição
    if (sMascaraDoc <> '') then
    begin
      rpSalarioEducDBTxtINSCRICAO1.DisplayFormat := sMascaraDoc + ';0;_';
      rpSalarioEducDBTxtINSCRICAO2.DisplayFormat := sMascaraDoc + ';0;_';
      rpSalarioEducDBTxtINSCRICAO3.DisplayFormat := sMascaraDoc + ';0;_';
      rpSalarioEducDBTxtINSCRICAO4.DisplayFormat := sMascaraDoc + ';0;_';
    end;
  end;
end;

procedure TRptSalarioEduc.CdsSalarioEducAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptSalarioEduc.rpSalarioEducSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// Cálculo do DAC
function TRptSalarioEduc.CalcDAC(var Valor: string): string;
var
  c: byte;
  iSoma, iResto: integer;
  bPrimeiro: boolean;

{-->}function SomaDigitos(Num: integer): integer;
     var
       sNum: string;
       c: byte;
     begin
       sNum := IntToStr(Num);
       Result := 0;
       for c:=1 to Length(sNum) do
         Result := Result + StrToInt(sNum[c]);
{-->}end;
begin
  try
    // Multiplicar cada algarismo do grupo atual à sequência de multiplicadores
    // 2,1,2,1,2,1... posicionados da direita para a esquerda e somar cada resultado
    iSoma := 0;
    bPrimeiro := true;
    for c:=Length(Valor) DownTo 1 do
    begin
      if (bPrimeiro) then
        iSoma := iSoma + SomaDigitos(StrToInt(Valor[c]) * 2)
      else
        iSoma := iSoma + SomaDigitos(StrToInt(Valor[c]) * 1);
        
      bPrimeiro := not(bPrimeiro);
    end;

    // O valor do DAC será 10 menos o resto da divisão da soma feita acima caso
    // o resto seja maior que zero; caso contrário o DAC é zero.
    iResto := (iSoma mod 10);
    if (iResto = 0) then
      Valor := '0'
    else
      Valor := IntToStr(10 - iResto);

    Result := '';
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

// Geração do DAC (Dígito de Auto-Conferência) Geral
function TRptSalarioEduc.FormatarCodBarras(Valor: string): string;
var
  sErro: string;
begin
  Result := Valor;
  // O DAC será calculado com base nos 43 algarismos que já estão montados.
  try
    sErro := CalcDAC(Valor);
    if (sErro <> '') then
      raise Exception.Create(sErro);

    Insert(Valor, Result, 4);
  except
    on E: Exception do
      MessageDlg('Erro ao tentar criar o DAC do Código de Barras'+CR_LF+
                 'Erro: ' +E.Message, mtError, [mbOK, mbHelp], 0);
  end;
end;

// Geração do DAC (Dígito de Auto-Conferência) da Representação Numérica do Código de Barras
function TRptSalarioEduc.Formatar_RepNum_CodBarras(Valor: string): string;
var
  c: byte;
  sGrupo, sDAC, sErro: string;
begin
  // Cada grupo de dígitos deve ter 11 posições. Como o tamanho do código de barras é de
  // 44 posições, serão criados 4 grupos.
  Result := '';
  try
    for c:=0 to 3 do
  begin
      sGrupo := Copy(Valor, 11*c+1, 11);
      sDAC := sGrupo;
      sErro := CalcDAC(sDAC);
      if (sErro <> '') then
        raise Exception.Create(sErro);

      if (Result = '') then
        Result := sGrupo +' '+ sDAC
      else
        Result := Result +' '+ sGrupo +' '+ sDAC;
    end;
  except
    on E: Exception do
      MessageDlg('Erro ao tentar criar o DAC da'+CR_LF+
                 'Representação Numérica do Código de Barras.'+CR_LF+
                 'Erro: ' +E.Message, mtError, [mbOK, mbHelp], 0);
  end;
end;

end.
