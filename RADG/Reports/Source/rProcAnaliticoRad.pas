{===============================================================================
Analista : Marcus Oliveira
Pendência: 23848
Data: 27/11/2006
Descrição: Relatório analítico do processos RADG
===============================================================================}


unit rProcAnaliticoRad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  ppCtrls, ppPrnabl, ppBands, ppCache, ppStrtch, ppMemo, ppDB, ppDBPipe,
  FConsultaRAD, uCtrlPadroes, uSistema, ppSubRpt, ppVar, uCtrlRadEtapa,
  ppModule, raCodMod, ppParameter, ppRegion, uCtrlRadTipoProc;

type
  TrptProcAnaliticoRAD = class(TFrmCmReport)
    DsPrincipal: TDataSource;
    cdsPrincipal: TCMClientDataSet;
    ppPrincipal: TppReport;
    ppDBPrincipal: TppDBPipeline;
    cdsFluxo: TCMClientDataSet;
    dsFluxo: TDataSource;
    ppDBFluxo: TppDBPipeline;
    ppParameterList1: TppParameterList;
    cdsAutoriza: TCMClientDataSet;
    dsAutoriza: TDataSource;
    ppDBAutoriza: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppSubRptFluxo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel15: TppLabel;
    ppLine1: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppShape2: TppShape;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShapeEtapa: TppShape;
    ppShapeDrillDown: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppSubAutoriza: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine2: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel24: TppLabel;
    ppDBText21: TppDBText;
    ppLabel25: TppLabel;
    ppDBText22: TppDBText;
    ppLabel26: TppLabel;
    ppDBText23: TppDBText;
    ppLabel27: TppLabel;
    ppDBText24: TppDBText;
    ppLabel28: TppLabel;
    ppDBText25: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    lblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppLblTitulo: TppLabel;
    ppDBImage3: TppDBImage;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    cdsLogo: TCMClientDataSet;
    DsLogo: TDataSource;
    ppLogo: TppDBPipeline;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppSubRptFluxoPrint(Sender: TObject);
    procedure ppSubAutorizaPrint(Sender: TObject);
    procedure ppShapeEtapaPrint(Sender: TObject);
  private
    frmConsultaRad : TfrmConsultaRad;
    CtrlRadEtapa   : TCtrlRadEtapa;
    CtrlRadTipoProc : TCtrlRadTipoProc;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptProcAnaliticoRAD: TrptProcAnaliticoRAD;

implementation

{$R *.DFM}

procedure TrptProcAnaliticoRAD.CrmRptCMBeforePrint(Sender: TObject);
var
sIdProcessos : String;
begin
  inherited;
    //Logo
  CtrlRadTipoProc := TCtrlRadTipoProc.Create;
  CtrlRadTipoProc.InitializeAs( Padroes );
  cdsLogo.Data := CtrlRadTipoProc.ListaImagem ( Sistema.IdEmpresa ) ;

  CtrlRadEtapa:= TCtrlRadEtapa.Create;
  CtrlRadEtapa.InitializeAs(Padroes);

  ppLblTitulo.Caption := 'Relatório Analítico de Processos RAD';
  cdsPrincipal.Data := oUltimoResultado;
  //Ordenação
  case iOrdem of
    1 : cdsPrincipal.IndexFieldNames := 'IDPROCESSO';
    2 : cdsPrincipal.IndexFieldNames := 'SITUACAO';
    3 : cdsPrincipal.IndexFieldNames := 'DATAINIPROCESSO';
  end;
  sIdProcessos := '';
  cdsPrincipal.First;

  while not cdsPrincipal.Eof do
  begin

    if sIdProcessos <> '' then sIdProcessos := sIdProcessos + ', ';
    sIdProcessos := sIdProcessos + cdsPrincipal.FieldByName('IDPROCESSO').AsString;
    cdsPrincipal.Next;

  end;
  if sIdProcessos = '' then
     sIdProcessos := IntToStr(0);

    cdsPrincipal.First; //Retorna o CDS ao ponto inicial
    cdsFluxo.Data := CtrlRadEtapa.SelecionaEtapasDeProcessos(sIdProcessos);
    cdsAutoriza.Data := CtrlRadEtapa.SelecionaAutorizacoesDeProcessos(sIdProcessos);

end;

procedure TrptProcAnaliticoRAD.FormDestroy(Sender: TObject);
begin
  inherited;
  frmConsultaRad.Free;
end;

procedure TrptProcAnaliticoRAD.ppSubRptFluxoPrint(Sender: TObject);
begin
  inherited;
  //Sub Relatorio Fluxo (Filtros)
  //Se pesquisa retornar vazia não passa filtro.
  if cdsPrincipal.FieldByName('IDPROCESSO').AsString <> '' then
  begin
    cdsFluxo.Filtered := False;
    cdsFluxo.Filter := 'IDPROCESSO = ' + cdsPrincipal.FieldByName('IDPROCESSO').AsString;
    cdsFluxo.Filtered := True;
  end;
end;

procedure TrptProcAnaliticoRAD.ppSubAutorizaPrint(Sender: TObject);
begin
  inherited;
  if cdsPrincipal.FieldByName('IDPROCESSO').AsString <> '' then
  begin
    //Sub Relatorio Autorizações (Filtros)
    cdsAutoriza.Filtered := False;
    cdsAutoriza.Filter := 'IDRADETAPAPROC = ' + cdsFluxo.FieldByName('IDRADETAPAPROC').AsString;
    cdsAutoriza.Filtered := True;
  end;
  //Expandir as autorizações.
  if bExpande then
    ppSubAutoriza.ExpandAll := True;
end;

procedure TrptProcAnaliticoRAD.ppShapeEtapaPrint(Sender: TObject);
begin
  inherited;
  if ppShapeEtapa.Brush.Color = clWhite then
    ppShapeEtapa.Brush.Color := $00E0E0E0
  else
    ppShapeEtapa.Brush.Color := clWhite;
  ppShapeDrillDown.Brush.Color := ppShapeEtapa.Brush.Color;
end;

end.
