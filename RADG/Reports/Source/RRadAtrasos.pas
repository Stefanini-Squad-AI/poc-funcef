{===============================================================================
Analista : Marcus Oliveira
Pendência: 23870
Data: 05/12/2006
Descrição: Relatório de processos em atraso 
===============================================================================}

unit RRadAtrasos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppVar, ppCtrls,
  ppPrnabl, ppClass, ppBands, ppCache, Db, DBClient, uCMClientDataSet,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppChrt, ppChrtDP,
  uCtrlRadTipoProc, uCtrlPadroes, ppModule, raCodMod, ppParameter,
  TeEngine, TeeFunci, math, usistema, uCmSqlParams ;

type
  TrptRadAtrasos = class(TFrmCmReport)
    ppRelRadAtrasado: TppReport;
    ppDBPrincipal: TppDBPipeline;
    cdsPrincipal: TCMClientDataSet;
    dsPrincipal: TDataSource;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppTitulo: TppLabel;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    pplblGrpProc: TppLabel;
    pplblPerIni: TppLabel;
    pplblPerFim: TppLabel;
    ppLabel2: TppLabel;
    pplblSituacao: TppLabel;
    ppLabel7: TppLabel;
    ppLabel6: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    lblSistema: TppLabel;
    ppCalc5: TppSystemVariable;
    ppCalc6: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppDPTeeChart1: TppDPTeeChart;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    shpZebra: TppShape;
    ppLine1: TppLine;
    ppShape1: TppShape;
    lblPerc: TppLabel;
    ppLabel9: TppLabel;
    pplblProcessos: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    cdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    ppDBLogo: TppDBPipeline;
    ppDBImage3: TppDBImage;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBGrafico: TppDBPipeline;
    cdsGrafico: TCMClientDataSet;
    dsGrafico: TDataSource;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure shpZebraPrint(Sender: TObject);
    procedure lblPercPrint(Sender: TObject);
  private
    CtrlRadTipoProc : TCtrlRadTipoProc;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptRadAtrasos: TrptRadAtrasos;

implementation

{$R *.DFM}

procedure TrptRadAtrasos.CrmRptCMBeforePrint(Sender: TObject);
    var
    iCalcTotal : integer;

begin
  inherited;
    //Título do Relatório.
    ppTitulo.Caption := 'Relatório de Processos em Atraso';

    //Logo do Gráfico
    cdsLogo.data := CtrlRadTipoProc.ListaImagem(Sistema.IdEmpresa);


       // Grupo de processos
    if CmpRptCM.ParamValues[0].AsInteger = 0 then
         pplblGrpProc.Caption := 'Todos os processos'
       else
         pplblGrpProc.Caption := CmpRptCM.ParamValues[5].AsString;

       // Situação
    if CmpRptCM.ParamValues[1].AsString = '' then
         pplblSituacao.Caption  := 'Todas'
       else
         pplblSituacao.Caption  := CmpRptCM.ParamValues[7].AsString;

       // Processos
    if (CmpRptCM.ParamValues[2].AsInteger = 0) or (CmpRptCM.ParamValues[2].AsInteger = -1) then
         pplblProcessos.Caption := 'Todos'
       else
         pplblProcessos.Caption := CmpRptCM.ParamValues[6].AsString;

       // Data Inicial
    if CmpRptCM.ParamValues[3].AsString = '30/12/1899' then
         pplblPerIni.Caption  := 'Data inicial não informada'
       else
         pplblPerIni.Caption  := CmpRptCM.ParamValues[3].AsString;

       // Data Final
    if CmpRptCM.ParamValues[4].AsString = '30/12/1899' then
         pplblPerFim.Caption  :=  'Data final não informada'
       else
         pplblPerFim.Caption  := CmpRptCM.ParamValues[4].AsString;


    cdsPrincipal.data := CtrlRadTipoProc.ProcessosEmAtraso( CmpRptCM.ParamValues[0].AsInteger ,
                                                            CmpRptCM.ParamValues[2].AsInteger ,
                                                            CmpRptCM.ParamValues[3].AsString  ,
                                                            CmpRptCM.ParamValues[4].AsString  ,
                                                            CmpRptCM.ParamValues[1].AsString );

  cdsGrafico.Data := cdsPrincipal.Data;
  cdsGrafico.First;
  while not cdsGrafico.Eof do
  begin
    if cdsGrafico.FieldByName('QTDEATRASOS').AsInteger = 0 then
    begin
      cdsGrafico.Delete;
      cdsGrafico.First;
    end
    else
      cdsGrafico.Next;
  end;
  cdsGrafico.First;


end;

procedure TrptRadAtrasos.FormCreate(Sender: TObject);
begin
  inherited;
    CtrlRadTipoProc := TCtrlRadTipoProc.Create;
    CtrlRadTipoProc.InitializeAs(Padroes);

end;

procedure TrptRadAtrasos.shpZebraPrint(Sender: TObject);
begin
  inherited;

    if (cdsPrincipal.RecNo > 1) and (shpZebra.Brush.Color = clWhite) then
       shpZebra.Brush.Color := clSilver
       else
       shpZebra.Brush.Color := clWhite;

end;

procedure TrptRadAtrasos.lblPercPrint(Sender: TObject);
var
cal1, cal2, cal3: Double;
begin
  inherited;
    if cdsPrincipal.RecordCount > 0 then
    begin
       cal3 := StrToInt (ppDBCalc2.Text) / StrToInt (ppDBCalc1.Text);
       cal3 := (cal3*100);
       lblPerc.Caption := '( ' + FormatFloat('0.0', cal3) +' %'+ ')';
    end
    else
       lblPerc.Caption := '(0.0 %)';

end;

end.
