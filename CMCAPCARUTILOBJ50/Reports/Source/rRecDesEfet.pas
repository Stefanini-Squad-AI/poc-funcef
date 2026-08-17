unit rRecDesEfet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, uCtrlParamIntegra;

type
  TRptRecDesEfet = class(TFrmCmReport)
    PpRecDesEfet: TppBDEPipeline;
    DsRecDesEfet: TwwDataSource;
    RptRecDesEfet: TppReport;
    ppHeaderBand11: TppHeaderBand;
    LblTituloGraf: TppLabel;
    ppLine21: TppLine;
    ppLabel29: TppLabel;
    RptRecDesEfetLabel1: TppLabel;
    RptRecDesEfetLabel2: TppLabel;
    RptRecDesEfetLabel3: TppLabel;
    RptRecDesEfetPERIODO: TppLabel;
    ppDetailBand11: TppDetailBand;
    RptRecDesEfetDBText1: TppDBText;
    LblCodTipRecdes: TppDBText;
    RptRecDesEfetDBText3: TppDBText;
    ppFooterBand11: TppFooterBand;
    ppLine22: TppLine;
    ppLabel30: TppLabel;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    RptRecDesEfetSummaryBand1: TppSummaryBand;
    RptRecDesEfetDBCalc1: TppDBCalc;
    RptRecDesEfetLabel4: TppLabel;
    SqlRecDesEfet: TCMSqlParams;
    CdsRecDesEfet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure RptRecDesEfetBeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptRecDesEfet: TRptRecDesEfet;

implementation

{$R *.DFM}

procedure TRptRecDesEfet.FormCreate(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'R' then
  begin
    CmpRptCM.Caption := 'Recebimentos X Tipos de Recebimento';
    CmpRptCM.ParamValues[0].Caption := 'Lista os Recebimentos Data Inicial';
    CmpRptCM.ParamValues[1].Caption := 'Lista os Recebimentos Data Final';
  end
  else
  begin
    CmpRptCM.Caption := 'Pagamentos X Tipos de Desembolso';
    CmpRptCM.ParamValues[0].Caption := 'Lista os Pagamentos Data Inicial';
    CmpRptCM.ParamValues[1].Caption := 'Lista os Pagamentos Data Final';
  end
end;

procedure TRptRecDesEfet.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  RptRecDesEfetPERIODO.CAPTION := 'Período ' +
    TRIM(CmpRptCM.ParamValues[0].AsString) + ' ' +
    CmpRptCM.ParamValues[1].AsString;
  with SqlRecDesEfet do
  begin
    Prepare;
    Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
    Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
    Parambyname('dataini').AsString := CmpRptCM.ParamValues[0].AsString;
    Parambyname('datafim').AsString := CmpRptCM.ParamValues[1].AsString;
    open;
  end;
end;

procedure TRptRecDesEfet.RptRecDesEfetBeforePrint(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'R' then
    LblCodTipRecdes.DisplayFormat := ParamIntegra.MascaraReceb + ';0; '
  else
    LblCodTipRecdes.DisplayFormat := ParamIntegra.MascaraDesemb + ';0; ';
end;

end.

