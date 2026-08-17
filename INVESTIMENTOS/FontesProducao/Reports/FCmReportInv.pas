//******************************************************************************
// Autor     : Marco Turon
// Data      : 12/11/2007
// Código    : AL_1
// Pendencia :
// SOL       :
// Motivo    : Modelo de Relatório de Investimentos 3 camadas
//             Já tem implementada as rotinas que imprimem o nome da Fundação
//               e o nome do módulo com a versão atual.
//******************************************************************************
unit FCmReportInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlParamInvest;

type
  TFrmCmReportInv = class(TFrmCmReport)
    cds: TCMClientDataSet;
    spr: TCMSqlParams;
    ds: TDataSource;
    ppl: TppBDEPipeline;
    rpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblCabDireito: TppLabel;
    lblTituloRelatorio: TppLabel;
    lblEmpresa: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    linCabecalho: TppLine;
    shpCustodiante: TppShape;
    lblCapInvestimento: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    ppFooterBand1: TppFooterBand;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    pplRodape: TppLine;
    ppSystemVariable2: TppSystemVariable;
    procedure PrintFundacao(Sender: TObject);
    procedure PrintModulo(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCmReportInv: TFrmCmReportInv;

implementation

{$R *.DFM}

{ TFrmCmReportInv }

procedure TFrmCmReportInv.PrintFundacao(Sender: TObject);
begin
   if Sender is TppLabel then
      TppLabel(Sender).Caption := CtrlPInv.NomeEmpresa;
end;

procedure TFrmCmReportInv.PrintModulo(Sender: TObject);
begin
   if Sender is TppLabel then
      TppLabel(Sender).Caption := CtrlPInv.NomeModulo + ' ' + CtrlPInv.VersaoModulo;
end;

procedure TFrmCmReportInv.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(lblEmpresa.OnPrint) then
     lblEmpresa.OnPrint := PrintFundacao;
  if not Assigned(lblSistema.OnPrint) then
     lblSistema.OnPrint := PrintModulo;
end;

end.
