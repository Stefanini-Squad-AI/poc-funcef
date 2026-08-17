// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit ROcorrPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB, USistema;

type
  TRptOcorrPess = class(TFrmCmReport)
    rpOcorrPess: TppReport;
    rpOcorrPessHdrBnd: TppHeaderBand;
    ppLabel1: TppLabel;
    rpOcorrPessLbl2: TppLabel;
    rpOcorrPessLbl3: TppLabel;
    rpOcorrPessDBTxt1: TppDBText;
    rpOcorrPessSysVar1: TppSystemVariable;
    rpOcorrPessSysVar2: TppSystemVariable;
    rpOcorrPessLbl4: TppLabel;
    rpOcorrPessLblDATAINI: TppLabel;
    rpOcorrPessLbl5: TppLabel;
    rpOcorrPessLblDATAFINAL: TppLabel;
    rpOcorrPessDtlBnd: TppDetailBand;
    rpOcorrPessDBTxt6: TppDBText;
    rpOcorrPessDBTxt9: TppDBText;
    rpOcorrPessDBTxt8: TppDBText;
    rpOcorrPessDBTxt10: TppDBText;
    rpOcorrPessDBTxt7: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    rpOcorrPessSmryBnd: TppSummaryBand;
    rpOcorrPessGrp1: TppGroup;
    rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrPessGrpFootBnd1: TppGroupFooterBand;
    rpOcorrPessLbl14: TppLabel;
    rpOcorrPessLbl15: TppLabel;
    rpOcorrPessLbl16: TppLabel;
    ppDBCalc1: TppDBCalc;
    rpOcorrPessLblNumPessoas: TppLabel;
    rpOcorrPessdbCalcLicenca: TppDBCalc;
    rpOcorrPessLblAbsenteismo: TppLabel;
    ppLabel3: TppLabel;
    rpOcorrPessGrp2: TppGroup;
    rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand;
    rpOcorrPessLbl6: TppLabel;
    rpOcorrPessLbl7: TppLabel;
    rpOcorrPessLbl8: TppLabel;
    ppShape1: TppShape;
    rpOcorrPessDBTxt3: TppDBText;
    rpOcorrPessDBTxt4: TppDBText;
    rpOcorrPessDBTxt5: TppDBText;
    rpOcorrPessLbl9: TppLabel;
    rpOcorrPessLbl10: TppLabel;
    rpOcorrPessLbl11: TppLabel;
    rpOcorrPessLbl12: TppLabel;
    rpOcorrPessLbl13: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    rpOcorrPessGrpFootBnd2: TppGroupFooterBand;
    ppOcorrPess: TppBDEPipeline;
    ppOcorrPessppField1: TppField;
    ppOcorrPessppField2: TppField;
    ppOcorrPessppField3: TppField;
    ppOcorrPessppField4: TppField;
    ppOcorrPessppField5: TppField;
    ppOcorrPessppField6: TppField;
    ppOcorrPessppField7: TppField;
    ppOcorrPessppField8: TppField;
    ppOcorrPessppField9: TppField;
    ppOcorrPessppField10: TppField;
    ppOcorrPessppField11: TppField;
    ppOcorrPessppField12: TppField;
    ppOcorrPessppField13: TppField;
    dsOcorrPess: TwwDataSource;
    sqlOcorrPess: TCMSqlParams;
    CdsOcorrPess: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsOcorrPessAfterOpen(DataSet: TDataSet);
    procedure CdsOcorrPessAfterScroll(DataSet: TDataSet);
    procedure rpOcorrPessGrpFootBnd2AfterPrint(Sender: TObject);
    procedure rpOcorrPessGrpFootBnd1BeforePrint(Sender: TObject);
    procedure rpOcorrPessSmryBndAfterPrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    lstPessoa: TStringList;

    iNumPessoas, iDiasMes, iNumAnos, iNumMeses, iNumDias: integer;
  end;

var
  RptOcorrPess: TRptOcorrPess;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptOcorrPess.FormCreate(Sender: TObject);
begin
  inherited;
  lstPessoa := TStringList.Create;
end;

procedure TRptOcorrPess.FormDestroy(Sender: TObject);
begin
  FreeAndNil(lstPessoa);
  inherited;
end;

procedure TRptOcorrPess.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlOcorrPess.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  F.IDPESSOA, F.MATRICULA, RTRIM(PF.NOME) AS NOME,');
    Add('  C.TITULO AS CARGO, TM.DESCRTIPOOCMED, HM.DATAREAL, HM.EXAMINADOR, HM.LICENCA,');
    Add('  HM.DATAPLAN, HM.CODCID,');
    Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',HM.AVALIACAO) AS AVALIACAO,');
    Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',DECODE(HM.AVALIACAO,');
    Add('    GREATEST(TM.AVALMIN,HM.AVALIACAO),''Apt'',''Inapt'') ||');
    Add('    DECODE(PEFIS.SEXO,''M'',''o'',''F'',''a'',''o(a)'')) AS RESULTADO');
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, FUNCIONARIO F, HSTASMED HM, TIPOCMED TM, CARGO C');
    // -------------------------------------------------------------------- //
    Add('WHERE');

    // Tipos de Ocorrência selecionados
    if (CmpRptCM.ParamByName('ListaCodTipOcMed').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaCodTipOcMed').asString) > 0) then
        Add('  (TM.CODTIPOOCMED IN (' +CmpRptCM.ParamByName('ListaCodTipOcMed').asString+ ')) AND')
      else
        Add('  (TM.CODTIPOOCMED = ' +CmpRptCM.ParamByName('ListaCodTipOcMed').asString+ ') AND');

    // Funcionários/Candidatos selecionados
    if (CmpRptCM.ParamByName('ListaIdFunc').asString <> '') then
    begin
      if (Pos(',', CmpRptCM.ParamByName('ListaIdFunc').asString) > 0) then
        Add('  (PF.IDPESSOA    IN (' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ')) AND')
      else
        Add('  (PF.IDPESSOA     = ' +CmpRptCM.ParamByName('ListaIdFunc').asString+ ') AND');
    end
    else
      Add('  (PF.IDPESSOA     = -1) AND');

    Add('  (HM.DATAREAL BETWEEN TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataInicial').asString)+ ',''DD/MM/YYYY'') AND '+
      'TO_DATE(' +QuotedStr(CmpRptCM.ParamByName('DataFinal').asString)+ ',''DD/MM/YYYY'')) AND');

    if (CmpRptCM.ParamByName('CodCID').asString <> '') then
      if (CmpRptCM.ParamByName('BuscaCodCIDCompleto').asBoolean) then
        Add('  (TRIM(HM.CODCID) = ' +QuotedStr(Trim(CmpRptCM.ParamByName('CodCID').asString))+ ') AND')
      else
        Add('  (HM.CODCID    LIKE ' +QuotedStr(Trim(CmpRptCM.ParamByName('CodCID').asString)+'%')+ ') AND');

    Add('  (PF.IDPESSOA     = F.IDPESSOA) AND');
    Add('  (PF.IDPESSOA     = PEFIS.IDPESSOA) AND');
    Add('  (PF.IDPESSOA     = HM.IDPESSOA) AND');
    Add('  (HM.CODTIPOOCMED = TM.CODTIPOOCMED) AND');
    Add('  (F.IDCARGO       = C.IDCARGO(+))');
    Add('ORDER BY');
    Add('  UPPER(NOME), UPPER(DESCRTIPOOCMED)');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlOcorrPess.Open;

  rpOcorrPessLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpOcorrPessLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;
end;

procedure TRptOcorrPess.CdsOcorrPessAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;

  rpOcorrPessGrpHdrBnd2.Visible := CmpRptCM.ParamByName('RelatorioAnalitico').asBoolean;
  rpOcorrPessDtlBnd.Visible := CmpRptCM.ParamByName('RelatorioAnalitico').asBoolean;
  rpOcorrPessGrpFootBnd2.Visible := CmpRptCM.ParamByName('RelatorioAnalitico').asBoolean;

  iNumPessoas := 0;
  iDiasMes := 0;
  FU.CalculaDifData(rpOcorrPessLblDATAINI.Caption, rpOcorrPessLblDATAFINAL.Caption,
    iNumDias, iNumMeses, iNumAnos);
end;

procedure TRptOcorrPess.CdsOcorrPessAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptOcorrPess.rpOcorrPessGrpFootBnd2AfterPrint(Sender: TObject);
begin
  if not(CdsOcorrPess.IsEmpty) and
    (lstPessoa.IndexOf(CdsOcorrPess.FieldByName('IDPESSOA').asString) = -1) then
  begin
    lstPessoa.Add(CdsOcorrPess.FieldByName('IDPESSOA').asString);
    Inc(iNumPessoas);
    dmCds.sql.SQL.Text :=
      'SELECT'+CR_LF+
      '  ROUND(COUNT(T.IDDIASEMANA)*30/7,0) AS DIASMES'+CR_LF+
      'FROM'+CR_LF+
      '  TURNOSEM T, FUNCIONARIO F'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA  = ' +CdsOcorrPess.FieldByName('IDPESSOA').asString+ ') AND'+CR_LF+
      '  (F.IDHORARIO = T.IDHORARIO)';
    dmCds.sql.Open;

    iDiasMes := iDiasMes + dmCds.Cds.FieldByName('DIASMES').asInteger;
  end;
end;

procedure TRptOcorrPess.rpOcorrPessGrpFootBnd1BeforePrint(Sender: TObject);
var
  sDiasLicenca: string;
begin
  rpOcorrPessLblNumPessoas.Caption := IntToStr(iNumPessoas);
  sDiasLicenca := rpOcorrPessdbCalcLicenca.GetText;

  if (iNumMeses = 0) then
    iNumMeses := 1;

  if (iDiasMes = 0) then
    iDiasMes := 1;

  rpOcorrPessLblAbsenteismo.Caption := FloatToStrF(StrToInt(sDiasLicenca) * 100 /
    iDiasMes / iNumMeses, ffFixed, 5, 2);
end;

procedure TRptOcorrPess.rpOcorrPessSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
