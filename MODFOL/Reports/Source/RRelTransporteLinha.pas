// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RRelTransporteLinha;
                                 
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppClass, ppCtrls, ppStrtch, ppRichTx, ppVar,
  ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCtrlPadroes, uCtrlRelTransporte,
  TXRB, USistema;

type
  TRptRelTransporteLinha = class(TFrmCmReport)
    rpRelTransporteLinha: TppReport;
    HdrBnd: TppHeaderBand;
    Lbl1: TppLabel;
    Lbl5: TppLabel;
    Lbl7: TppLabel;
    Lbl6: TppLabel;
    DBTxt12: TppDBText;
    LblPeriodoDe: TppLabel;
    LblPeriodoAte: TppLabel;
    Lbl4: TppLabel;
    Calc1: TppCalc;
    Lbl2: TppLabel;
    DBTxt13: TppDBText;
    Calc2: TppCalc;
    Lbl3: TppLabel;
    DBTxt1: TppDBText;
    DtlBnd: TppDetailBand;
    DBTxt8: TppDBText;
    DBTxt9: TppDBText;
    DBTxt10: TppDBText;
    DBTxt11: TppDBText;
    SmryBnd: TppSummaryBand;
    Lbl20: TppLabel;
    Lbl21: TppLabel;
    Line4: TppLine;
    DBCalc2: TppDBCalc;
    DBCalc3: TppDBCalc;
    LblNumFunc: TppLabel;
    Group1: TppGroup;
    GrpHdrBnd1: TppGroupHeaderBand;
    GrpFootBnd1: TppGroupFooterBand;
    Group2: TppGroup;
    GrpHdrBnd2: TppGroupHeaderBand;
    Lbl10: TppLabel;
    DBTxt3: TppDBText;
    Lbl11: TppLabel;
    Lbl12: TppLabel;
    DBTxt5: TppDBText;
    DBTxt6: TppDBText;
    DBTxt4: TppDBText;
    Line1: TppLine;
    Line2: TppLine;
    Lbl13: TppLabel;
    GrpFootBnd2: TppGroupFooterBand;
    Lbl19: TppLabel;
    DBCalc1: TppDBCalc;
    Group3: TppGroup;
    GrpHdrBnd3: TppGroupHeaderBand;
    Line3: TppLine;
    Lbl15: TppLabel;
    Lbl16: TppLabel;
    Lbl17: TppLabel;
    Lbl18: TppLabel;
    DBTxt7: TppDBText;
    Lbl14: TppLabel;
    GrpFootBnd3: TppGroupFooterBand;
    ppRelTransporteLinha: TppBDEPipeline;
    dsRelTransporteLinha: TwwDataSource;
    sqlRelTransporteLinha: TCMSqlParams;
    CdsRelTransporteLinha: TCMClientDataSet;
    Lbl8: TppLabel;
    DBCalcNum_Func: TppDBCalc;
    Group4: TppGroup;
    GrpHdrBnd4: TppGroupHeaderBand;
    GrpFootBnd4: TppGroupFooterBand;
    Lbl9: TppLabel;
    DBTxt2: TppDBText;
    Shape1: TppShape;
    Lbl22: TppLabel;
    DBCalc4: TppDBCalc;
    DBTxt14: TppDBText;
    Line5: TppLine;
    FootBnd: TppFooterBand;
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    CtrlRelTransporte: TCtrlRelTransporte;

    procedure ConfigurarLayoutRelat;
    procedure Progresso(Args: array of variant);
  end;

var
  RptRelTransporteLinha: TRptRelTransporteLinha;

implementation

uses fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TRptRelTransporteLinha.CrmRptCMBeforePrint(Sender: TObject);
var
  bOk: boolean;
  sMsg: string;
begin
  inherited;
  CtrlRelTransporte := TCtrlRelTransporte.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  try
    CtrlRelTransporte.InitializeAs(Padroes);
    CtrlRelTransporte.CdsRelTransporte := CdsRelTransporteLinha;
    CtrlRelTransporte.Progresso := Progresso;
    CtrlRelTransporte.CreateThreadProgresso;

    bOk := CtrlRelTransporte.Gerar_Dados(
      false,
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
    CdsRelTransporteLinha.First;
    ConfigurarLayoutRelat;
  end
  else
  begin
    CdsRelTransporteLinha.EmptyDataSet;
    CdsRelTransporteLinha.Insert;
    CdsRelTransporteLinha.Post;
    MessageDlg(sMsg, mtError, [mbOK, mbHelp], 0);
  end;  
end;

procedure TRptRelTransporteLinha.Progresso(Args: array of variant);
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

procedure TRptRelTransporteLinha.ConfigurarLayoutRelat;
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
  LblNumFunc.Visible := CmpRptCM.ParamByName('ImprimirNumEmpregados').asBoolean;
  DBCalcNum_Func.Visible := CmpRptCM.ParamByName('ImprimirNumEmpregados').asBoolean;

  frmAguarde.Max := CdsRelTransporteLinha.RecordCount;
  frmAguarde.Min := 0;
end;

end.
