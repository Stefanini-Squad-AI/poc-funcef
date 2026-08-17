// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RRelTransporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppStrtch, ppRichTx, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppSubRpt, uCtrlPadroes,
  uCtrlRelTransporte, TXRB, USistema;

type
  TRptRelTransporte = class(TFrmCmReport)
    rpRelTransporte: TppReport;
    HdrBnd: TppHeaderBand;
    Lbl1: TppLabel;
    Lbl5: TppLabel;
    Lbl7: TppLabel;
    Lbl6: TppLabel;
    DBTxt1: TppDBText;
    LblPeriodoDe: TppLabel;
    LblPeriodoAte: TppLabel;
    Lbl4: TppLabel;
    Calc1: TppCalc;
    Lbl2: TppLabel;
    DBTxt2: TppDBText;
    Calc2: TppCalc;
    Lbl3: TppLabel;
    DBTxt3: TppDBText;
    DtlBnd: TppDetailBand;
    Shape30: TppShape;
    Shape12: TppShape;
    Shape10: TppShape;
    Shape9: TppShape;
    Shape8: TppShape;
    Shape2: TppShape;
    Lbl10: TppLabel;
    Shape16: TppShape;
    Shape3: TppShape;
    Shape15: TppShape;
    Shape4: TppShape;
    Lbl11: TppLabel;
    Shape17: TppShape;
    Shape6: TppShape;
    Lbl12: TppLabel;
    Shape19: TppShape;
    Shape14: TppShape;
    Lbl16: TppLabel;
    Shape18: TppShape;
    Shape5: TppShape;
    Shape20: TppShape;
    Shape7: TppShape;
    Shape21: TppShape;
    Shape22: TppShape;
    Shape23: TppShape;
    Shape24: TppShape;
    Shape25: TppShape;
    Shape26: TppShape;
    Shape13: TppShape;
    Lbl15: TppLabel;
    Shape11: TppShape;
    Lbl14: TppLabel;
    Lbl13: TppLabel;
    Shape27: TppShape;
    Lbl17: TppLabel;
    Shape29: TppShape;
    Shape28: TppShape;
    Lbl18: TppLabel;
    Line1: TppLine;
    Lbl20: TppLabel;
    DBTxt24: TppDBText;
    DBTxt25: TppDBText;
    DBTxt27: TppDBText;
    DBTxt26: TppDBText;
    Lbl19: TppLabel;
    DBTxt5: TppDBText;
    DBTxt6: TppDBText;
    DBTxt7: TppDBText;
    DBTxt8: TppDBText;
    DBTxt9: TppDBText;
    DBTxt10: TppDBText;
    DBTxt11: TppDBText;
    DBTxt12: TppDBText;
    DBTxt13: TppDBText;
    DBTxt14: TppDBText;
    DBTxt15: TppDBText;
    DBTxt16: TppDBText;
    DBTxt17: TppDBText;
    DBTxt18: TppDBText;
    DBTxt19: TppDBText;
    DBTxt20: TppDBText;
    DBTxt21: TppDBText;
    DBTxt22: TppDBText;
    DBTxt23: TppDBText;
    FootBnd: TppFooterBand;
    RichText1: TppRichText;
    SmryBnd: TppSummaryBand;
    Group1: TppGroup;
    GrpHdrBnd1: TppGroupHeaderBand;
    GrpFootBnd1: TppGroupFooterBand;
    Group2: TppGroup;
    GrpHdrBnd2: TppGroupHeaderBand;
    GrpFootBnd2: TppGroupFooterBand;
    ppRelTransporte: TppBDEPipeline;
    dsRelTransporte: TwwDataSource;
    sqlRelTransporte: TCMSqlParams;
    CdsRelTransporte: TCMClientDataSet;
    ppRelTransporte1: TppBDEPipeline;
    dsRelTransporte1: TwwDataSource;
    sqlRelTransporte1: TCMSqlParams;
    CdsRelTransporte1: TCMClientDataSet;
    Lbl8: TppLabel;
    LblNumFunc: TppLabel;
    DBCalcNumFunc: TppDBCalc;
    Lbl22: TppLabel;
    DBCalc2: TppDBCalc;
    Lbl23: TppLabel;
    DBCalc3: TppDBCalc;
    SubRep1: TppSubReport;
    ChildReport1: TppChildReport;
    SubRep1DtlBnd: TppDetailBand;
    SubRep1Shape2: TppShape;
    SubRep1DBTxt2: TppDBText;
    SubRep1DBTxt3: TppDBText;
    SubRep1DBTxt4: TppDBText;
    SubRep1DBTxt5: TppDBText;
    SubRep1Line4: TppLine;
    SubRep1Line5: TppLine;
    SubRep1Line6: TppLine;
    SubRep1FootBnd: TppFooterBand;
    SubRep1Grp1: TppGroup;
    SubRep1GrpHdrBnd: TppGroupHeaderBand;
    SubRep1Shape1: TppShape;
    SubRep1Lbl9: TppLabel;
    SubRep1Lbl10: TppLabel;
    SubRep1Lbl11: TppLabel;
    SubRep1Lbl12: TppLabel;
    SubRep1Lbl1: TppLabel;
    SubRep1Lbl6: TppLabel;
    ppDBText1: TppDBText;
    SubRep1Lbl2: TppLabel;
    ppDBText2: TppDBText;
    SubRep1Lbl5: TppLabel;
    SubRep1Lbl4: TppLabel;
    ppCalc1: TppCalc;
    ppCalc2: TppCalc;
    SubRep1Lbl3: TppLabel;
    SubRep1DBTxt1: TppDBText;
    SubRep1Lbl7: TppLabel;
    SubRep1LblPeriodoDe: TppLabel;
    SubRep1LblPeriodoAte: TppLabel;
    SubRep1Line1: TppLine;
    SubRep1Line2: TppLine;
    SubRep1Line3: TppLine;
    SubRep1Lbl8: TppLabel;
    SubRep1GrpFootBnd: TppGroupFooterBand;
    Group3: TppGroup;
    GrpHdrBnd3: TppGroupHeaderBand;
    GrpFootBnd3: TppGroupFooterBand;
    Shape1: TppShape;
    Lbl9: TppLabel;
    DBTxt4: TppDBText;
    Lbl21: TppLabel;
    DBCalc1: TppDBCalc;
    DBTxt28: TppDBText;
    Line2: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    CtrlRelTransporte: TCtrlRelTransporte;

    procedure ConfigurarLayoutRelat;
    procedure Progresso(Args: array of variant);
  end;

var
  RptRelTransporte: TRptRelTransporte;

implementation

uses fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptRelTransporte.CrmRptCMBeforePrint(Sender: TObject);
var
  bOk: boolean;
  sMsg: string;
begin
  inherited;
  CtrlRelTransporte := TCtrlRelTransporte.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  try
    CtrlRelTransporte.InitializeAs(Padroes);
    CtrlRelTransporte.CdsRelTransporte := CdsRelTransporte;
    CtrlRelTransporte.CdsRelResumo := CdsRelTransporte1;
    CtrlRelTransporte.Progresso := Progresso;
    CtrlRelTransporte.CreateThreadProgresso;

    bOk := CtrlRelTransporte.Gerar_Dados(
      true,
      CmpRptCM.ParamByName('ImprimirNumEmpregados').asBoolean,
      CmpRptCM.ParamByName('IdEstab').asFloat,
      CmpRptCM.ParamByName('ListaIdFunc').asString,
      CmpRptCM.ParamByName('SitFunc').asString,
      CmpRptCM.ParamByName('TipoContrato').asString,
      CmpRptCM.ParamByName('DataInicial').asDateTime,
      CmpRptCM.ParamByName('DataFinal').asDateTime,
      CmpRptCM.ParamByName('DescontaFeriados').asBoolean,
      CmpRptCM.ParamByName('DescontaFerias').asBoolean,
      CmpRptCM.ParamByName('DescontaFaltas').asBoolean,
      CmpRptCM.ParamByName('QuantDias').asInteger,
      CmpRptCM.ParamByName('QuantDiasMinimo').asInteger,
      CmpRptCM.ParamByName('IdEmpresa').asInteger,
      CmpRptCM.ParamByName('IdContraCheque').asInteger,
      CmpRptCM.ParamByName('GravarRubricaIncid').asBoolean,
      CmpRptCM.ParamByName('MesRef').asInteger,
      CmpRptCM.ParamByName('AnoRef').asInteger,
      CmpRptCM.ParamByName('MesRef_Faltas').asInteger,
      CmpRptCM.ParamByName('AnoRef_Faltas').asInteger,
      CmpRptCM.ParamByName('IdRubricaIncid').asFloat,
      CmpRptCM.ParamByName('IdRegraRubricaIncid').asFloat,
      CmpRptCM.ParamByName('Ordenacao').asInteger,
      CmpRptCM.ParamByName('Agrupar').asInteger);
    //CtrlRelTransporte.SQL.SaveToFile('c:\qry.txt');
    CtrlRelTransporte.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    CtrlRelTransporte.FreeThreadProgresso;
  finally
    sMsg := CtrlRelTransporte.MessageInfo;
    CtrlRelTransporte.Free;
  end;

  if (bOk) then
  begin
    CdsRelTransporte.First;
    ConfigurarLayoutRelat;
  end
  else
  begin
    CdsRelTransporte.EmptyDataSet;
    CdsRelTransporte.Insert;
    CdsRelTransporte.Post;
    MessageDlg(sMsg, mtError, [mbOK, mbHelp], 0);
  end;  
end;

procedure TRptRelTransporte.Progresso(Args: array of variant);
begin
  if (Args[0] > 0) then
  begin
    frmAguarde.Max := Args[0];
    frmAguarde.Min := 0;
    frmAguarde.Update;
  end;

  if (Args[1] > 0) then
  begin
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  if (Args[2] > 0) then
    frmAguarde.Apaga;
end;

procedure TRptRelTransporte.ConfigurarLayoutRelat;
begin
  case (CmpRptCM.ParamByName('Agrupar').asInteger) of
    1,2 : // Agrupar por Tipo de Linha de Transporte ou Agrupar por Tipo (Cartão x Outros)
    begin
      GrpHdrBnd2.Visible := true;
      GrpFootBnd2.Visible := true;
      Group2.BreakName := 'TIPOLINHA';
    end;
    else // Não Agrupar
    begin
      GrpHdrBnd2.Visible := false;
      GrpFootBnd2.Visible := false;
      Group2.BreakName := '';
    end;
  end;

  LblPeriodoDe.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  LblPeriodoAte.Caption := CmpRptCM.ParamByName('DataFinal').asString;

  SubRep1LblPeriodoDe.Caption := CmpRptCM.ParamByName('DataInicial').asString;
  SubRep1LblPeriodoAte.Caption := CmpRptCM.ParamByName('DataFinal').asString;

  LblNumFunc.Visible := CmpRptCM.ParamByName('ImprimirNumEmpregados').asBoolean;
  DBCalcNumFunc.Visible := CmpRptCM.ParamByName('ImprimirNumEmpregados').asBoolean;

  frmAguarde.Max := CdsRelTransporte.RecordCount;
  frmAguarde.Min := 0;
end;

end.
