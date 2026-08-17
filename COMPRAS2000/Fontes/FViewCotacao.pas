unit FViewCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TFrmViewCotacao = class(TfrmSairAjuda)
    plnItem: TPanel;
    Splitter1: TSplitter;
    PgItem: TPageControl;
    TabPrazoEnt: TTabSheet;
    GrdPrazoEnt: TwwDBGrid;
    TabPrazoPag: TTabSheet;
    GrdPrazoPag: TwwDBGrid;
    TabAgreg: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    TabObsItem: TTabSheet;
    memObsItem: TDBMemo;
    GrdItem: TwwDBGrid;
    PlnDescProd: TPanel;
    qryCotacao: TwwQuery;
    qryCotacaoCODPROCESSO: TFloatField;
    qryCotacaoIDPROCXART: TFloatField;
    qryCotacaoIDFORCLI: TFloatField;
    qryCotacaoPROPOSTA: TFloatField;
    qryCotacaoQTDEFORNECIDA: TFloatField;
    qryCotacaoPRECO: TFloatField;
    qryCotacaoCODMEDIDA: TStringField;
    qryCotacaoNUMCOT: TFloatField;
    qryCotacaoDATACOT: TDateTimeField;
    qryCotacaoOBS: TStringField;
    qryCotacaoMOECODIGO: TFloatField;
    qryCotacaoTXJUROS: TFloatField;
    qryPrazoEntrega: TwwQuery;
    qryPrazoEntregaCODPROCESSO: TFloatField;
    qryPrazoEntregaIDPROCXART: TFloatField;
    qryPrazoEntregaIDFORCLI: TFloatField;
    qryPrazoEntregaPROPOSTA: TFloatField;
    qryPrazoEntregaIDPRAZOENT: TFloatField;
    qryPrazoEntregaQTDEENT: TFloatField;
    qryPrazoEntregaCODMEDIDA: TStringField;
    qryPrazoEntregaPERIODOPRAZO: TStringField;
    qryPrazoEntregaDATAENT: TDateTimeField;
    qryImpostos: TwwQuery;
    qryImpostosCODPROCESSO: TFloatField;
    qryImpostosIDPROCXART: TFloatField;
    qryImpostosIDFORCLI: TFloatField;
    qryImpostosPROPOSTA: TFloatField;
    qryImpostosCODTIPOCUSTAGREG: TFloatField;
    qryImpostosBASECALCULO: TFloatField;
    qryImpostosPERCENT: TFloatField;
    qryImpostosVALOR: TFloatField;
    qryPrazoPgto: TwwQuery;
    qryPrazoPgtoCODPROCESSO: TFloatField;
    qryPrazoPgtoIDPROCXART: TFloatField;
    qryPrazoPgtoIDFORCLI: TFloatField;
    qryPrazoPgtoPROPOSTA: TFloatField;
    qryPrazoPgtoIDPRAZOPGTO: TFloatField;
    qryPrazoPgtoPRAZOPGTO: TFloatField;
    qryPrazoPgtoPERIODOPRAZO: TStringField;
    qryPrazoPgtoDATAPGTO: TDateTimeField;
    qryPrazoPgtoPERCENT: TFloatField;
    dsCotacao: TwwDataSource;
    dsPrazoPgto: TwwDataSource;
    dsPrazoEntrega: TwwDataSource;
    dsImpostos: TwwDataSource;
    qryCotacaoRAZAOSOCIAL: TStringField;
    qryCotacaoVENCEDOR: TStringField;
    qryImpostosDESCCUSTAGREG: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodProcesso : Int64;
    IdProcxArt  : Int64;
    DescProduto : String;

  end;

var
  FrmViewCotacao: TFrmViewCotacao;

implementation

{$R *.DFM}

Uses uModulo,uSistema;

procedure TFrmViewCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  qryCotacao.Close;
  If Not qryCotacao.Prepared Then qryCotacao.Prepare;
  qryPrazoPgto.Close;
  If Not qryPrazoPgto.Prepared Then qryPrazoPgto.Prepare;
  qryPrazoEntrega.Close;
  If Not qryPrazoEntrega.Prepared Then qryPrazoEntrega.Prepare;
  qryImpostos.Close;
  If Not qryImpostos.Prepared Then qryImpostos.Prepare;
end;

procedure TFrmViewCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCotacao.Close;
  If qryCotacao.Prepared Then qryCotacao.UnPrepare;
  qryPrazoPgto.Close;
  If qryPrazoPgto.Prepared Then qryPrazoPgto.UnPrepare;
  qryPrazoEntrega.Close;
  If qryPrazoEntrega.Prepared Then qryPrazoEntrega.UnPrepare;
  qryImpostos.Close;
  If qryImpostos.Prepared Then qryImpostos.UnPrepare;
end;

procedure TFrmViewCotacao.FormShow(Sender: TObject);
begin
  inherited;
  PlnDescProd.Caption := '  '+ DescProduto;
  //
  qryCotacao.Close;
  qryCotacao.ParamByName('CODPROCESSO').AsInteger := CodProcesso;
  qryCotacao.ParamByName('IDPROCXART').AsInteger  := IdProcxArt;
  qryCotacao.Open;
  //
  qryPrazoPgto.Open;
  qryPrazoEntrega.Open;
  qryImpostos.Open;
end;

end.
