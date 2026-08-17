// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit ROcorrTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB, USistema;

type
  TRptOcorrTipo = class(TFrmCmReport)
    rpOcorrTipo: TppReport;
    rpOcorrTipoHdrBnd: TppHeaderBand;
    rpOcorrTipoLbl1: TppLabel;
    rpOcorrTipoLbl2: TppLabel;
    rpOcorrTipoLbl3: TppLabel;
    rpOcorrTipoDBTxt1: TppDBText;
    rpOcorrTipoSysVar1: TppSystemVariable;
    rpOcorrTipoSysVar2: TppSystemVariable;
    rpOcorrTipoLbl4: TppLabel;
    rpOcorrTipoLblDATAINI: TppLabel;
    rpOcorrTipoLbl5: TppLabel;
    rpOcorrTipoLblDATAFINAL: TppLabel;
    rpOcorrTipoDtlBnd: TppDetailBand;
    rpOcorrTipoDBTxt3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel15: TppLabel;
    rpOcorrTipoSmryBnd: TppSummaryBand;
    rpOcorrTipoGrp1: TppGroup;
    rpOcorrTipoGrpHdrBnd1: TppGroupHeaderBand;
    rpOcorrTipoGrpFootBnd1: TppGroupFooterBand;
    rpOcorrTipoLbl13: TppLabel;
    rpOcorrTipoLbl14: TppLabel;
    rpOcorrTipoLbl15: TppLabel;
    rpOcorrTipoLblNumTipos: TppLabel;
    rpOcorrTipodbCalcLicenca: TppDBCalc;
    rpOcorrTipoLine2: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel2: TppLabel;
    rpOcorrTipoLblAbsenteismo: TppLabel;
    rpOcorrTipoGrp2: TppGroup;
    rpOcorrTipoGrpHdrBnd2: TppGroupHeaderBand;
    rpOcorrTipoLbl6: TppLabel;
    rpOcorrTipoDBTxt2: TppDBText;
    rpOcorrTipoLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    rpOcorrTipoGrpFootBnd2: TppGroupFooterBand;
    rpOcorrTipoLbl11: TppLabel;
    rpOcorrTipoLbl12: TppLabel;
    rpOcorrTipoDBCalc1: TppDBCalc;
    rpOcorrTipoLblAvalMedia: TppLabel;
    ppOcorrTipo: TppBDEPipeline;
    ppOcorrTipoppField1: TppField;
    ppOcorrTipoppField2: TppField;
    ppOcorrTipoppField3: TppField;
    ppOcorrTipoppField4: TppField;
    ppOcorrTipoppField5: TppField;
    ppOcorrTipoppField6: TppField;
    ppOcorrTipoppField7: TppField;
    ppOcorrTipoppField8: TppField;
    ppOcorrTipoppField9: TppField;
    ppOcorrTipoppField10: TppField;
    ppOcorrTipoppField11: TppField;
    dsOcorrTipo: TwwDataSource;
    sqlOcorrTipo: TCMSqlParams;
    CdsOcorrTipo: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsOcorrTipoAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rpOcorrTipoGrpHdrBnd2BeforePrint(Sender: TObject);
    procedure rpOcorrTipoDtlBndAfterPrint(Sender: TObject);
    procedure rpOcorrTipoGrpFootBnd2BeforePrint(Sender: TObject);
    procedure rpOcorrTipoGrpFootBnd2AfterPrint(Sender: TObject);
    procedure rpOcorrTipoGrpFootBnd1BeforePrint(Sender: TObject);
    procedure CdsOcorrTipoAfterScroll(DataSet: TDataSet);
    procedure rpOcorrTipoSmryBndAfterPrint(Sender: TObject);
  private
    lstPessoa: TStringList;

    bPrimeiraVez: boolean;
    iQuociente, iDivisor, iDiasMes, iNumAnos, iNumMeses, iNumDias, iNumTipos: integer;
  end;

var
  RptOcorrTipo: TRptOcorrTipo;

implementation

uses uCtrlFuncoesRH, fAguarde, dCds;

{$R *.DFM}

procedure TRptOcorrTipo.FormCreate(Sender: TObject);
begin
  inherited;
  lstPessoa := TStringList.Create;
end;

procedure TRptOcorrTipo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(lstPessoa);
  inherited;
end;

procedure TRptOcorrTipo.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlOcorrTipo.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  RTRIM(PF.NOME) AS NOME, PF.IDPESSOA,');
    Add('  TM.DESCRTIPOOCMED, HM.DATAREAL, HM.EXAMINADOR, HM.LICENCA,');
    Add('  HM.DATAPLAN, HM.CODCID,');
    Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',HM.AVALIACAO) AS AVALIACAO,');
    Add('  DECODE(HM.AVALIACAO,NULL,''N/A'',DECODE(HM.AVALIACAO,');
    Add('    GREATEST(TM.AVALMIN,HM.AVALIACAO),''Apt'',''Inapt'') ||');
    Add('    DECODE(PEFIS.SEXO,''M'',''o'',''F'',''a'',''o(a)'')) AS RESULTADO');
    Add('FROM');
    Add('  PESSOA PF, PESSOAFISICA PEFIS, HSTASMED HM, TIPOCMED TM');
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

    Add('  (TM.CODTIPOOCMED = HM.CODTIPOOCMED) AND');
    Add('  (HM.IDPESSOA     = PF.IDPESSOA) AND');
    Add('  (PF.IDPESSOA     = PEFIS.IDPESSOA)');
    Add('ORDER BY');
    Add('  UPPER(DESCRTIPOOCMED), UPPER(NOME)');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlOcorrTipo.Open;

  rpOcorrTipoLblDATAINI.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  rpOcorrTipoLblDATAFINAL.Caption := CmpRptCM.ParamByName('DataFinal').asString;
end;

procedure TRptOcorrTipo.CdsOcorrTipoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;

  rpOcorrTipoGrpHdrBnd2.Visible := CmpRptCM.ParamByName('RelatorioAnalitico').asBoolean;
  rpOcorrTipoDtlBnd.Visible := CmpRptCM.ParamByName('RelatorioAnalitico').asBoolean;
  rpOcorrTipoGrpFootBnd2.Visible := CmpRptCM.ParamByName('RelatorioAnalitico').asBoolean;

  iNumTipos := 0;
  bPrimeiraVez := true;
  iDiasMes := 0;
  FU.CalculaDifData(rpOcorrTipoLblDATAINI.Caption, rpOcorrTipoLblDATAFINAL.Caption,
    iNumDias, iNumMeses, iNumAnos);
end;

procedure TRptOcorrTipo.CdsOcorrTipoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;

  if (bPrimeiraVez) and not(CdsOcorrTipo.IsEmpty) and
     (lstPessoa.IndexOf(CdsOcorrTipo.FieldByName('IDPESSOA').asString) = -1) then
  begin
    lstPessoa.Add(CdsOcorrTipo.FieldByName('IDPESSOA').asString);
    dmCds.sql.SQL.Text :=
      'SELECT'+CR_LF+
      '  ROUND(COUNT(T.IDDIASEMANA)*30/7,0) AS DIASMES'+CR_LF+
      'FROM'+CR_LF+
      '  TURNOSEM T, FUNCIONARIO F'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA  = ' +CdsOcorrTipo.FieldByName('IDPESSOA').asString+ ') AND'+CR_LF+
      '  (F.IDHORARIO = T.IDHORARIO)';
    dmCds.sql.Open;

    iDiasMes := iDiasMes + dmCds.Cds.FieldByName('DIASMES').asInteger;
  end;
end;

procedure TRptOcorrTipo.rpOcorrTipoGrpHdrBnd2BeforePrint(Sender: TObject);
begin
  iQuociente := 0;
  iDivisor := 0;
end;

procedure TRptOcorrTipo.rpOcorrTipoDtlBndAfterPrint(Sender: TObject);
begin
  if not(CdsOcorrTipo.IsEmpty) and
    (StrToIntDef(CdsOcorrTipo.FieldByName('AVALIACAO').asString,-777) <> -777) then
  begin
    Inc(iQuociente);
    iDivisor := iDivisor + CdsOcorrTipo.FieldByName('AVALIACAO').asInteger;
  end;
end;

procedure TRptOcorrTipo.rpOcorrTipoGrpFootBnd2BeforePrint(Sender: TObject);
begin
  if (iQuociente > 0) then
    rpOcorrTipoLblAvalMedia.Caption := FloatToStrF(iDivisor / iQuociente,ffFixed,10,0)
  else
    rpOcorrTipoLblAvalMedia.Caption := '0';
end;

procedure TRptOcorrTipo.rpOcorrTipoGrpFootBnd2AfterPrint(Sender: TObject);
begin
  if (bPrimeiraVez) then
    Inc(iNumTipos);
end;

procedure TRptOcorrTipo.rpOcorrTipoGrpFootBnd1BeforePrint(Sender: TObject);
var
  sDiasLicenca: string;
begin
  rpOcorrTipoLblNumTipos.Caption := IntToStr(iNumTipos);
  sDiasLicenca := rpOcorrTipodbCalcLicenca.GetText;

  if (iNumMeses = 0) then
    iNumMeses := 1;

  if (iDiasMes = 0) then
    iDiasMes := 1;

  rpOcorrTipoLblAbsenteismo.Caption := FloatToStrF(StrToInt(sDiasLicenca) * 100 /
    iDiasMes / iNumMeses, ffFixed, 5, 2);
end;

procedure TRptOcorrTipo.rpOcorrTipoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
  bPrimeiraVez := false;
end;

end.
