unit rExemplo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBClient,
  uCMClientDataSet, TXRB, uCtrlTransacoesPorGrupo, uCtrlPadroes, uSistema;

type
  TrptExemplo = class(TFrmCmReport)
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    ppl: TppBDEPipeline;
    rpt: TppReport;
    HeaderBand1: TppHeaderBand;
    Label11: TppLabel;
    Line1: TppLine;
    LblEmpresa: TppLabel;
    DetailBand1: TppDetailBand;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    LblSistema: TppLabel;
    CdsLogo: TCMClientDataSet;
    dsLogo: TDataSource;
    pplLogo: TppBDEPipeline;
    imgLogo: TppDBImage;
    LbAdicionais: TppLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlTransacoesPorGrupo: TCtrlTransacoesPorGrupo;
  public
    { Public declarations }
  end;

var
  rptExemplo: TrptExemplo;

implementation

{$R *.DFM}




procedure TrptExemplo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CdsLogo.Data := CtrlTransacoesPorGrupo.ListaImagem(Sistema.IdEmpresa);
end;




procedure TrptExemplo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTransacoesPorGrupo);
  inherited;
end;

end.
