unit RDemonsRealxContabxFluxo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppCtrls, ppBands, ppPrnabl, ppStrtch,
  ppSubRpt, ppCache, ppVar, uCtrlTransacoesPorGrupo, uCtrlPadroes, uSistema,
  ppModule, raCodMod, ppParameter,uModulo, MontaSelect, uDiasUteis;

type
  TRptDemonsRealxContabxFluxo = class(TFrmCmReport)
    ppReport: TppReport;
    pplGrupos: TppDBPipeline;
    CdsGrupos: TCMClientDataSet;
    CdsContas: TCMClientDataSet;
    pplContas: TppDBPipeline;
    dsGrupos: TDataSource;
    dsContas: TDataSource;
    CdsLogo: TCMClientDataSet;
    pplLogo: TppDBPipeline;
    dsLogo: TDataSource;
    CdsCompContas: TCMClientDataSet;
    dsCompContas: TDataSource;
    pplCompContas: TppDBPipeline;
    ppParameterList1: TppParameterList;
    MontaSelect: TMontaSelect;
    ppHeaderBand1: TppHeaderBand;
    lbEmpresa: TppLabel;
    ppLabel2: TppLabel;
    lbPeriodo: TppLabel;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBImage1: TppDBImage;
    lbDescGrupo: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpGrupo: TppShape;
    ppSubReport: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLine3: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand2: TppDetailBand;
    linDrilDrawCompContas: TppLine;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    subCompContas: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText5: TppDBText;
    ppDBText19: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine5: TppLine;
    raCodeModule1: TraCodeModule;
    ppSummaryBand1: TppSummaryBand;
    ppLine4: TppLine;
    ppLabel15: TppLabel;
    ppDBCalc2: TppDBCalc;
    raCodeModule2: TraCodeModule;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    lbSistema: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    raCodeModule3: TraCodeModule;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppSubReportPrint(Sender: TObject);
    procedure subCompContasPrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo: TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  RptDemonsRealxContabxFluxo: TRptDemonsRealxContabxFluxo;

implementation

{$R *.DFM}




procedure TRptDemonsRealxContabxFluxo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  MontaSelect.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
end;




procedure TRptDemonsRealxContabxFluxo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CtrlTransacoesPorGrupo);
end;




procedure TRptDemonsRealxContabxFluxo.CrmRptCMBeforePrint(Sender: TObject);
var
   iIdGrupo: integer;
begin
  inherited;
  iIdGrupo          := 0;
  lbPeriodo.Caption := 'Período ' + CmpRptCM.ParamValues[1].AsString + ' de ' + CmpRptCM.ParamValues[2].AsString;

  if CmpRptCM.ParamValues[0].AsInteger <> 0 then
  begin
     iIdGrupo            := StrToInt(MontaSelect.ValoresChave[1]);
     lbDescGrupo.Caption := 'Grupo Orçamentário: ' + MontaSelect.ValoresChave[2];
  end;

  CdsLogo.Data   := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);
  CdsGrupos.Data := CtrlTransacoesPorGrupo.ListaGrupoRealxContabxFluxo('P',
                                                                       Sistema.IdEmpresa,
                                                                       CmpRptCM.ParamValues[1].AsInteger,
                                                                       CmpRptCM.ParamValues[2].AsInteger,
                                                                       Modulo.iPlanoOrc,
                                                                       iIdGrupo);
  CdsContas.Data := CtrlTransacoesPorGrupo.ListaContasRealxContabxFluxo('P',
                                                                       Sistema.IdEmpresa,
                                                                       CmpRptCM.ParamValues[1].AsInteger,
                                                                       CmpRptCM.ParamValues[2].AsInteger,
                                                                       Modulo.iPlanoOrc,
                                                                       iIdGrupo);
  CdsCompContas.Data := CtrlTransacoesPorGrupo.ListaCompContasRealxContabxFluxo(CmpRptCM.ParamValues[1].AsInteger,
                                                                                CmpRptCM.ParamValues[2].AsInteger,
                                                                                Sistema.IdEmpresa,
                                                                                Modulo.iPlanoOrc,
                                                                                iIdGrupo);
end;




procedure TRptDemonsRealxContabxFluxo.ppSubReportPrint(Sender: TObject);
begin
  inherited;
  CdsContas.Filtered := False;
  CdsContas.Filter   := 'IDGRUPOORCAMEN = ' + CdsGrupos.FieldByName('IDGRUPOORCAMEN').AsString;
  CdsContas.Filtered := True;
end;




procedure TRptDemonsRealxContabxFluxo.subCompContasPrint(Sender: TObject);
begin
  inherited;
  CdsCompContas.Filtered := False;
  CdsCompContas.Filter   := 'IDCONTAORCAMEN = ' + QuotedStr(CdsContas.FieldByName('IDCONTAORCAMEN').AsString);
  CdsCompContas.Filtered := True;
end;




procedure TRptDemonsRealxContabxFluxo.CmpRptCMBeforeExecute(
  var CanExecute: Boolean);
begin
  inherited;

  with TDiasUteis.Create do
  try
     CmpRptCM.ParamValues[1].AsInteger   := ExtraiMes(now);
     CmpRptCM.ParamValues[1].TextDefault := IntToStr(ExtraiMes(now));
     CmpRptCM.ParamValues[2].AsInteger   := ExtraiAno(now);
     CmpRptCM.ParamValues[2].TextDefault := IntToStr(ExtraiAno(now));
  finally
     Free;
  end;

end;

end.
