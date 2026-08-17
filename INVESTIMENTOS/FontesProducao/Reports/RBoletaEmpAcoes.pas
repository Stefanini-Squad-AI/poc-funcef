//******************************************************************************
// Autor     : Marco Turon
// Data      : 28/05/2008
// Código    : AL_1
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Novo relatório
//******************************************************************************
unit RBoletaEmpAcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, ppVar, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, uCmSqlParams, DBClient, uCMClientDataSet,
  uCtrlParamInvest, MontaSelect;

type
  TRelBoletaEmpAcoes = class(TFrmCmReport)
    cds: TCMClientDataSet;
    spr: TCMSqlParams;
    ds: TDataSource;
    ppl: TppBDEPipeline;
    rptBoletaEmpAcoes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    lblEmpresa: TppLabel;
    lblDataOperacao: TppLabel;
    lblOperacao: TppLabel;
    lblDataVencto: TppLabel;
    lblDPreco: TppLabel;
    lblPreco: TppLabel;
    lblInvestimento: TppLabel;
    lblCustodiante: TppLabel;
    ppDBText1: TppDBText;
    dbeDataVencto: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    lblQuantidade: TppLabel;
    lblTaxa: TppLabel;
    lblVlrMaxResgate: TppLabel;
    lblVlrJuros: TppLabel;
    lblVlrEmprestimo: TppLabel;
    lblVlrResgDia: TppLabel;
    lblVlrIR: TppLabel;
    lblFlgReversao: TppLabel;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    dbeVlrMaxResgate: TppDBText;
    dbeVlrIr: TppDBText;
    dbeVlrResgDia: TppDBText;
    dbeQuantidade: TppDBText;
    dbeVlrJuros: TppDBText;
    ppLine3: TppLine;
    lblDiaPreco: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDBText6: TppDBText;
    MontaSelect: TMontaSelect;
    procedure PrintFundacao(Sender: TObject);
    procedure PrintModulo(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelBoletaEmpAcoes: TRelBoletaEmpAcoes;


implementation

{$R *.DFM}

{ TFrmCmReportInv }

procedure TRelBoletaEmpAcoes.PrintFundacao(Sender: TObject);
begin
   if Sender is TppLabel then
      TppLabel(Sender).Caption := CtrlPInv.NomeEmpresa;
end;

procedure TRelBoletaEmpAcoes.PrintModulo(Sender: TObject);
begin
   if Sender is TppLabel then
      TppLabel(Sender).Caption := CtrlPInv.NomeModulo + ' ' + CtrlPInv.VersaoModulo;
end;

procedure TRelBoletaEmpAcoes.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(lblEmpresa.OnPrint) then
     lblEmpresa.OnPrint := PrintFundacao;
  if not Assigned(lblSistema.OnPrint) then
     lblSistema.OnPrint := PrintModulo;
end;


end.
