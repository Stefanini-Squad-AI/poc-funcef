unit FMTViewCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBCtrls, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, uCtrlConsultaCotacao, DBClient, uCMClientDataSet;

type
  TFrmMTViewCotacao = class(TfrmSairAjuda)
    dsCotacao: TwwDataSource;
    dsPrazoEntrega: TwwDataSource;
    dsImpostos: TwwDataSource;
    dsPrazoPgto: TwwDataSource;
    Panel1: TPanel;
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
    cdsCotacao: TCMClientDataSet;
    cdsPrazoEntrega: TCMClientDataSet;
    cdsImpostos: TCMClientDataSet;
    cdsPrazoPgto: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dsCotacaoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    Cotacao : TCtrlConsultaCotacao;
  public
    { Public declarations }
    CodProcesso : Double;
    IdProcxArt  : Double;
    Procedure SelFilhos;
  end;

var
  FrmMTViewCotacao: TFrmMTViewCotacao;

implementation

{$R *.DFM}

Uses DBaseDados, uSIstema;

procedure TFrmMTViewCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  Cotacao := TCtrlConsultaCotacao.Create;
  Cotacao.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
end;

procedure TFrmMTViewCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Cotacao.Free;
end;

procedure TFrmMTViewCotacao.FormShow(Sender: TObject);
begin
  inherited;
  cdsCotacao.Data := Cotacao.ListSumario( CodProcesso, IdProcxArt);
end;

procedure TFrmMTViewCotacao.SelFilhos;
begin
   cdsPrazoEntrega.Data := Cotacao.GetPrazoEntrega(cdsCotacao.FieldByName('CODPROCESSO').asFloat,
                                                   cdsCotacao.FieldByName('IDPROCXART').asFloat,
                                                   cdsCotacao.FieldByName('PROPOSTA').asFloat,
                                                   cdsCotacao.FieldByName('IDFORCLI').asFloat);

   cdsPrazoPgto.Data    := Cotacao.GetPrazoPgto(cdsCotacao.FieldByName('CODPROCESSO').asFloat,
                                                cdsCotacao.FieldByName('IDPROCXART').asFloat,
                                                cdsCotacao.FieldByName('PROPOSTA').asFloat,
                                                cdsCotacao.FieldByName('IDFORCLI').asFloat);

   cdsImpostos.Data    := Cotacao.GetAgregados(cdsCotacao.FieldByName('CODPROCESSO').asFloat,
                                                cdsCotacao.FieldByName('IDPROCXART').asFloat,
                                                cdsCotacao.FieldByName('PROPOSTA').asFloat,
                                                cdsCotacao.FieldByName('IDFORCLI').asFloat);

end;

procedure TFrmMTViewCotacao.dsCotacaoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If cdsCotacao.State = dsBrowse Then
     SelFilhos;
End;

end.
