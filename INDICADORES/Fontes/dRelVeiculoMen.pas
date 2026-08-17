unit dRelVeiculoMen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCMReportMTImob, Db, uCmSqlParams, DBClient, uCmRptManager, TXComp,
  CmParamReport, ppDB, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, ppBands, ppCache, ppVar, ppCtrls, ppPrnabl, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart, ppChrt, ppModule, raCodMod, uCtrlRelIndicadores,
  TXRB;

type
  TdtmRelVeiculoMen = class(TFrmCmReportImob)
    ppl: TppBDEPipeline;
    ppVeiculoMen: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblEmpresa: TppLabel;
    ppOrcamentoLabel42: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    vTotAno: TppVariable;
    ppDBText1: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    lblSistema: TppLabel;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoLine5: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppOrcamentoLine1: TppLine;
    ppOrcamentoLabel2: TppLabel;
    ppOrcamentoLabel3: TppLabel;
    ppOrcamentoLabel6: TppLabel;
    ppOrcamentoLabel7: TppLabel;
    ppOrcamentoLabel8: TppLabel;
    ppOrcamentoLabel9: TppLabel;
    ppOrcamentoLabel10: TppLabel;
    ppOrcamentoLine2: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine1: TppLine;
    ppTeeChart1: TppTeeChart;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppDetailBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlRelIndicadores : TCtrlRelIndicadores;
  public
    { Public declarations }
  end;

var
  dtmRelVeiculoMen: TdtmRelVeiculoMen;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TdtmRelVeiculoMen.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;

  // Cria e inicializa o CtrlObject do objeto de Relatórios...
  CtrlRelIndicadores := TCtrlRelIndicadores.Create;
  CtrlRelIndicadores.Initialize(DtmBaseDados.DbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True,
                                ComunsImobiliario.MensErroMT);

  // Carrega dados no Cds...
  cds.Data := CtrlRelIndicadores.BuscaRelVeiculoMen(3546,                               // idReport no SAD...
                                                    CmpRptCM.ParamValues[0].AsInteger,  // idImovel...
                                                    CmpRptCM.ParamValues[1].AsInteger,  // Ano inicial...
                                                    CmpRptCM.ParamValues[2].AsInteger); // Ano final...
end;

procedure TdtmRelVeiculoMen.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil( CtrlRelIndicadores );
end;

procedure TdtmRelVeiculoMen.ppDetailBand1AfterPrint(Sender: TObject);
var iPos : Integer;
begin
  inherited;

  iPos := cds.RecNo -1;

  // Só mostra no gráfico os 3 ultimos anos
  if iPos < 3 then begin

// Daniel - 23390 - Início -----------------------------------------------------
    ppTeeChart1.Chart.Series[iPos].Title := IntToStr(cds.FieldByName('ANOCOMPETENCIA').AsInteger) + '   ';
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRJAN').AsInteger,'Jan');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRFEV').AsInteger,'Fev');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRMAR').AsInteger,'Mar');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRABR').AsInteger,'Abr');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRMAI').AsInteger,'Mai');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRJUN').AsInteger,'Jun');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRJUL').AsInteger,'Jul');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRAGO').AsInteger,'Ago');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRSET').AsInteger,'Set');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLROUT').AsInteger,'Out');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRNOV').AsInteger,'Nov');
    ppTeeChart1.Chart.Series[iPos].Add(cds.FieldByName('VLRDEZ').AsInteger,'Dez');
  end;

  if cds.RecordCount = 1 then begin
    ppTeeChart1.Chart.Series[0].Active := False;
    ppTeeChart1.Chart.Series[1].Active := False;
    ppTeeChart1.Chart.Legend.Visible   := False;
  end;
  if cds.RecordCount = 2 then begin
    ppTeeChart1.Chart.Series[1].Active := False;
  end;
// Daniel - 23390 - Fim --------------------------------------------------------
end;

end.
