unit dRelEvolVacancia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrt,
  ppBands, ppReport, ppStrtch, ppSubRpt, ppVar, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCtrlRelIndicadores,
  TXRB;

type
  TdtmRelEvolVacancia = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppEvolVacancia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppOrcamentoLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppTeeChart1: TppTeeChart;
    ppSummaryBand2: TppSummaryBand;
    ppLabel2: TppLabel;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLogoTipo: TppImage;
    ppLine1: TppLine;
    pplCompetencia: TppLabel;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppMes1: TppLabel;
    ppMes2: TppLabel;
    ppMes10: TppLabel;
    ppMes3: TppLabel;
    ppMes4: TppLabel;
    ppMes5: TppLabel;
    ppMes6: TppLabel;
    ppMes7: TppLabel;
    ppMes8: TppLabel;
    ppMes9: TppLabel;
    ppMes11: TppLabel;
    ppMes12: TppLabel;
    ppOrcamentoDBText4: TppDBText;
    ppOrcamentoDBText6: TppDBText;
    ppOrcamentoDBText7: TppDBText;
    ppOrcamentoDBText8: TppDBText;
    ppOrcamentoDBText5: TppDBText;
    ppOrcamentoDBText9: TppDBText;
    ppOrcamentoDBText11: TppDBText;
    ppOrcamentoDBText12: TppDBText;
    ppOrcamentoDBText10: TppDBText;
    ppOrcamentoDBText13: TppDBText;
    ppOrcamentoDBText14: TppDBText;
    ppOrcamentoDBText15: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure pplSeparadorPrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores    : TCtrlRelIndicadores;
    bSeparador, bCorLinha : boolean;
    CorLinha, CorAtual    : TColor;

    procedure PreencheGrafico;
    procedure PreencheCabecalhoColuna;
  public
    { Public declarations }
  end;

var
  dtmRelEvolVacancia: TdtmRelEvolVacancia;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uModuloIndicadores,
     uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelEvolVacancia.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelEvolVacancia(CmpRptCM.ParamValues[0].AsInteger,    // iMes
                                                      CmpRptCM.ParamValues[1].AsInteger);   // iAno

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[2].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[3].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[4].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega o Logotipo
  if ModuloIndicadores.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloIndicadores.LogoTipo.Picture
  else ppLogotipo.Picture := nil;

  pplCompetencia.Caption  := IntToStr(CmpRptCM.ParamValues[1].AsInteger);

  PreencheCabecalhoColuna;
  PreencheGrafico;

end;

procedure TdtmRelEvolVacancia.PreencheCabecalhoColuna;
var iMes : Integer;
begin
   iMes := CmpRptCM.ParamValues[0].AsInteger;
   ppMes1.Caption  := ComunsImobiliario.SiglaMes(iMes);
   ppMes2.Caption  := ComunsImobiliario.SiglaMes(iMes+1);
   ppMes3.Caption  := ComunsImobiliario.SiglaMes(iMes+2);
   ppMes4.Caption  := ComunsImobiliario.SiglaMes(iMes+3);
   ppMes5.Caption  := ComunsImobiliario.SiglaMes(iMes+4);
   ppMes6.Caption  := ComunsImobiliario.SiglaMes(iMes+5);
   ppMes7.Caption  := ComunsImobiliario.SiglaMes(iMes+6);
   ppMes8.Caption  := ComunsImobiliario.SiglaMes(iMes+7);
   ppMes9.Caption  := ComunsImobiliario.SiglaMes(iMes+8);
   ppMes10.Caption := ComunsImobiliario.SiglaMes(iMes+9);
   ppMes11.Caption := ComunsImobiliario.SiglaMes(iMes+10);
   ppMes12.Caption := ComunsImobiliario.SiglaMes(iMes+11);
end;

procedure TdtmRelEvolVacancia.PreencheGrafico;
var vSeries  : array of TBarSeries;
    vCores   : array[0..10] of TColor;
    vTotVago : array[1..12] of Extended;
    fAreaTot : Extended;
    i : Integer;
begin
   fAreaTot  := 0;
   vSeries   := nil;
   vCores[0] := clBlue;
   vCores[1] := clRed;
   vCores[2] := clGreen;
   vCores[3] := clMaroon;
   vCores[4] := clFuchsia;
   vCores[5] := clGreen;
   vCores[6] := clYellow;
   vCores[7] := clTeal;
   vCores[8] := clOlive;
   vCores[9] := clNavy;
   vCores[10]:= clLime;

   cds.First;
   while not cds.Eof do begin
      SetLength(vSeries,(Length(vSeries)+1) );
      i := High(vSeries);

      vSeries[i] := TBarSeries.Create( Self );

      // Pend 23390 - Vinicius - 26/09/2006 - ajuste em função do ReportBuilder novo
      vSeries[i].ParentChart   := ppTeeChart1.Chart;

      vSeries[i].BarStyle      := bsRectGradient;
      vSeries[i].Marks.Visible := False;
      vSeries[i].Title         := cds.FieldByName('IMOCODIGO').AsString;

      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA01').AsFloat,ppMes1.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA02').AsFloat,ppMes2.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA03').AsFloat,ppMes3.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA04').AsFloat,ppMes4.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA05').AsFloat,ppMes5.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA06').AsFloat,ppMes6.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA07').AsFloat,ppMes7.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA08').AsFloat,ppMes8.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA09').AsFloat,ppMes9.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA10').AsFloat,ppMes10.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA11').AsFloat,ppMes11.Caption, vSeries[i].LegendItemColor(i));
      vSeries[i].AddBar(cds.FieldByName('PERCVACANCIA12').AsFloat,ppMes12.Caption, vSeries[i].LegendItemColor(i));

      fAreaTot     := fAreaTot     + cds.FieldByName('AREATOTAL').AsFloat;
      vTotVago[1]  := vTotVago[1]  + cds.FieldByName('AREAVAGA01').AsFloat;
      vTotVago[2]  := vTotVago[2]  + cds.FieldByName('AREAVAGA02').AsFloat;
      vTotVago[3]  := vTotVago[3]  + cds.FieldByName('AREAVAGA03').AsFloat;
      vTotVago[4]  := vTotVago[4]  + cds.FieldByName('AREAVAGA04').AsFloat;
      vTotVago[5]  := vTotVago[5]  + cds.FieldByName('AREAVAGA05').AsFloat;
      vTotVago[6]  := vTotVago[6]  + cds.FieldByName('AREAVAGA06').AsFloat;
      vTotVago[7]  := vTotVago[7]  + cds.FieldByName('AREAVAGA07').AsFloat;
      vTotVago[8]  := vTotVago[8]  + cds.FieldByName('AREAVAGA08').AsFloat;
      vTotVago[9]  := vTotVago[9]  + cds.FieldByName('AREAVAGA09').AsFloat;
      vTotVago[10] := vTotVago[10] + cds.FieldByName('AREAVAGA10').AsFloat;
      vTotVago[11] := vTotVago[11] + cds.FieldByName('AREAVAGA11').AsFloat;
      vTotVago[12] := vTotVago[12] + cds.FieldByName('AREAVAGA12').AsFloat;

      cds.Next;
   end;
   cds.First;

   // Preenche série da média
   // Pend 23390 - Vinicius - 26/09/2006 - ajuste em função do ReportBuilder novo
   ppTeeChart1.Chart.Series[0].Clear;

   for i := 1 to 12 do begin
    // Pend 23390 - Vinicius - 26/09/2006 - ajuste em função do ReportBuilder novo
       ppTeeChart1.Chart.Series[0].Add(ComunsImobiliario.Arredonda((vTotVago[i]*100)/fAreaTot,2), ppMes1.Caption);
   end;

   // Move a série de média para a frente
   // Pend 23390 - Vinicius - 26/09/2006 - ajuste em função do ReportBuilder novo
   ppTeeChart1.Chart.SeriesList.Move(0,ppTeeChart1.Chart.SeriesList.IndexOf(ppTeeChart1.Chart.SeriesList.Last));

end;

procedure TdtmRelEvolVacancia.ppsCorPrint(Sender: TObject);
begin
  inherited;
  if bCorLinha then begin
     if CorAtual = clWhite then begin
        CorAtual := CorLinha;
     end else begin
        CorAtual := clWhite;
     end;
  end else begin
     CorAtual := clWhite;
  end;
  (Sender as TppShape).Brush.Color := CorAtual;
end;

procedure TdtmRelEvolVacancia.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelEvolVacancia.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;


end.
