{===============================================================================
Analista : Marcus Oliveira
Pendência: 22023
Data     : 25/01/2007
Descrição: Relatório de movimentação financeira
}
unit RMovimFinanc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, TXRB, CmParamReport, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppVar, ppCtrls, ppPrnabl, ppBands, ppCache, Wwdatsrc,
  uSistema, uCtrlParamIntegra;

type
  TFrmMovimFinanc = class(TFrmCmReport)
    ppRptMovimFinanc: TppReport;
    ppMovimFinanc: TppDBPipeline;
    sqlMovimFinanc: TCMSqlParams;
    cdsMovimFinanc: TCMClientDataSet;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    dbLogo: TppDBImage;
    lblSubTitulo: TppLabel;
    lblStatus: TppLabel;
    lblPeriodo: TppLabel;
    ppDBText20: TppDBText;
    ppLine5: TppLine;
    ppSystemVariable2: TppSystemVariable;
    lblSistema: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    CdsDadosEmpresa: TCMClientDataSet;
    SqlDadosEmpresa: TCMSqlParams;
    dsDadosEmpresa: TwwDataSource;
    ppLDadosEmpresa: TppDBPipeline;
    procedure ppRptMovimFinancBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimFinanc: TFrmMovimFinanc;

implementation

{$R *.DFM}

procedure TFrmMovimFinanc.ppRptMovimFinancBeforePrint(Sender: TObject);
begin
  inherited;

  CmpRptCM.ParamValues[1].LookupSettings.SQL.Text:= 'SELECT                     ' +
                                                    '  CODTIPRECDES, DESCRICAO  ' +
                                                    'FROM                       ' +
                                                    '  TIPORECEBDESEMB          ' +
                                                    'WHERE RECPAG = '+ParamIntegra.RecPag;

  SqlDadosEmpresa.Prepare;
  SqlDadosEmpresa.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  SqlDadosEmpresa.Open;

end;

end.
