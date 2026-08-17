unit RListagemDeEmpresas;
      
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, Db, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, DBTables, ppCtrls, ppPrnabl,
  ppBands, ppCache, DBClient, Provider, ADODB, uSistema
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TRptListagemDeEmpresas = class(TFrmCmReport)
    QryEmpresa: TQuery;
    RptEmpresa: TppReport;
    ppEmpresa: TppDBPipeline;
    DsEmpresa: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    LblEmpresa: TppLabel;
    LblSistema: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    QryAdo: TADOQuery;
    Dsp: TDataSetProvider;
    Cds: TClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeConnectionType(Sender: TObject;
      ConnectionType: TDbConnectionType);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
    procedure CrmRptCMChangeConnection(Sender: TObject;
      Connection: TADOConnection);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptListagemDeEmpresas: TRptListagemDeEmpresas;

implementation

{$R *.DFM}

procedure TRptListagemDeEmpresas.CrmRptCMBeforePrint(Sender: TObject);
Var
  sSql, sFiltro: String;
begin
  inherited;

  sSql := 'SELECT * FROM EMPRESAPROP ';
  sFiltro := '';

  If (CmpRptCM.ParamByName('Id Empresa').AsInteger <> 0) Then
    sFiltro := ' WHERE IDPESSOA = ' + CmpRptCM.ParamByName('Id Empresa').AsString;


  If (CmpRptCM.ParamByName('Nome Empresa').AsString <> '') Then
    If sFiltro = '' Then
       sFiltro := ' WHERE NOMEEMPRESA = ' + QuotedStr(CmpRptCM.ParamByName('Nome Empresa').AsString)
    Else
       sFiltro := sFiltro + ' AND NOMEEMPRESA = ' + QuotedStr(CmpRptCM.ParamByName('Nome Empresa').AsString);


  QryEmpresa.Sql.Text := sSql + sFiltro;
  QryAdo.Sql.Assign(QryEmpresa.Sql);
end;

procedure TRptListagemDeEmpresas.CrmRptCMChangeConnectionType(
  Sender: TObject; ConnectionType: TDbConnectionType);
begin
  inherited;
  Case ConnectionType of
    cntBde: Dsp.DataSet := QryEmpresa;
    cntAdo: Dsp.DataSet := QryADO;
  End;
end;

procedure TRptListagemDeEmpresas.CrmRptCMChangeDataBaseName(
  Sender: TObject; sDataBaseName: String);
begin
  inherited;
  QryEmpresa.DatabaseName := sDataBaseName;
end;

procedure TRptListagemDeEmpresas.CrmRptCMChangeConnection(Sender: TObject;
  Connection: TADOConnection);
begin
  inherited;
  QryAdo.Connection := Connection;
end;

end.
