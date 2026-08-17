unit dParamRelGraficoAcessos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, fParamRelGraficoAcessos, Provider, DBClient, TeEngine,
  Series, ExtCtrls, TeeProcs, Chart, ppChrtDP, ppChrt;

type
  TdtmParamRelGraficoAcessos = class(TdtmReports)
    ppReport: TppReport;
    ppBDEPipeline: TppBDEPipeline;
    cds: TClientDataSet;
    ds: TDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    tcBarras: TppDPTeeChart;
    ppLabel1: TppLabel;
    cdsDESCPAGINA: TStringField;
    cdsQTDEACESSOS: TFloatField;
    cdsFundacao: TClientDataSet;
    cdsFundacaoNOME: TStringField;
    cdsFundacaoRAZAOSOCIAL: TStringField;
    cdsFundacaoLOGRADOURO: TStringField;
    cdsFundacaoNUMERO: TStringField;
    cdsFundacaoCOMPLEMENTO: TStringField;
    cdsFundacaoBAIRRO: TStringField;
    cdsFundacaoCIDADE: TStringField;
    cdsFundacaoCODESTADO: TStringField;
    cdsFundacaoCEP: TStringField;
    cdsFundacaoIMAGEM: TBlobField;
    ppBDEPipelineFund: TppBDEPipeline;
    dsFundacao: TDataSource;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    lblPeriodo: TppLabel;
    ppLabel4: TppLabel;
    lblInterface: TppLabel;
    ppLabel6: TppLabel;
    lblUsuario: TppLabel;
    lblMesmaSessao: TppLabel;
    ppLabel5: TppLabel;
    lblTotal: TppLabel;
  private
    { Private declarations }
  public
    function MostraParam( form : string ) : boolean; override;
  end;

var
  dtmParamRelGraficoAcessos: TdtmParamRelGraficoAcessos;

implementation

{$R *.DFM}

{ TdtmParamRelGraficoAcessos }

function TdtmParamRelGraficoAcessos.MostraParam(form: string): boolean;
var
  frm : TForm;
begin
  if uppercase( form ) = 'FRMPARAMRELGRAFICOACESSOS' then
    frm := TfrmParamRelGraficoAcessos.Create( Application )
  else
    frm := nil;

  if frm = nil then
    Result := True
  else
  begin
    Result := ( frm.ShowModal = mrOk );
    frm.Free;
  end;       
end;

end.
