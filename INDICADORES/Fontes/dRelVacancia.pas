unit dRelVacancia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, TeEngine, Series, ExtCtrls, TeeProcs, Chart, ppChrt,
  ppBands, ppReport, ppStrtch, ppSubRpt, ppVar, ppCtrls, ppPrnabl, ppClass,
  ppCache, ppProd, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCtrlRelIndicadores,
  TXRB;

type
  TdtmRelVacancia = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppVacancia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    pplSeparador: TppLine;
    ppsCor: TppShape;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
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
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLogoTipo: TppImage;
    ppLine1: TppLine;
    pplCompetencia: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText2: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
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
  public
    { Public declarations }
  end;

var
  dtmRelVacancia: TdtmRelVacancia;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uModuloIndicadores,
     uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelVacancia.CrmRptCMBeforePrint(Sender: TObject);
var iPosCor : Integer;
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de Relatórios
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                      ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds
  cds.Data := CtrlRelIndicadores.BuscaRelVacancia(CmpRptCM.ParamValues[0].AsInteger,    // iMes
                                                  CmpRptCM.ParamValues[1].AsInteger,    // iAno
                                                  Sistema.IdEmpresa, 2, 1,
                                                  CmpRptCM.ParamValues[2].AsString);    // Segmento

  // Carrega variáveis com os parametros de cores de linha e separadores
  bSeparador := CmpRptCM.ParamValues[3].AsBoolean;
  bCorLinha  := CmpRptCM.ParamValues[4].AsBoolean;
  iPosCor    := CmpRptCM.ParamValues[5].AsInteger;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  // Carrega o Logotipo
  if ModuloIndicadores.bFlgLogoRelat then
       ppLogotipo.Picture := ModuloIndicadores.LogoTipo.Picture
  else ppLogotipo.Picture := nil;

  pplCompetencia.Caption := ComunsImobiliario.Competencia(CmpRptCM.ParamValues[0].AsInteger,
                                                          CmpRptCM.ParamValues[1].AsInteger);

  PreencheGrafico;
end;

procedure TdtmRelVacancia.PreencheGrafico;
begin
  cds.IndexName := 'TOTAL';
  cds.First;

// Daniel - 23390 - Início -----------------------------------------------------
  ppTeeChart1.Chart.Series[0].Clear;
  ppTeeChart1.Chart.Series[1].Clear;

  while not cds.Eof do begin
    ppTeeChart1.Chart.Series[0].Add( (cds.FieldByName('VLRTOTAL').AsFloat-cds.FieldByName('VLRVAGO').AsFloat)/1000000,
                                      cds.FieldByName('IMOCODIGO').AsString );
    ppTeeChart1.Chart.Series[1].Add(cds.FieldByName('VLRVAGO').AsFloat/1000000,cds.FieldByName('IMOCODIGO').AsString);

    cds.Next;
  end;

  cds.IndexName := 'NOME';
  cds.First;
//  Daniel - 23390 - Fim --------------------------------------------------------

end;

procedure TdtmRelVacancia.ppsCorPrint(Sender: TObject);
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

procedure TdtmRelVacancia.pplSeparadorPrint(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelVacancia.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlRelIndicadores);
  inherited;
end;

end.
