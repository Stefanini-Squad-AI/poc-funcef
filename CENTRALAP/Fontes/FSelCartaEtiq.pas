unit FSelCartaEtiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBTables,
  Wwquery, uMensErro;

type
  {Form para seleção dos modelos de Carta Padrão e etiquetas para emissão de RUBS.
   A seleção uma vez confirmada fica gravada na tabela de parâmetros do sistema
   "PARAMCENTRALAP" trazendo como default o valor da última seleção.}
  TFrmSelCartaEtiq = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    CmbModeloCarta: TCMDBLookupCombo;
    CmbModeloEtiqueta: TCMDBLookupCombo;
    QryModeloCarta: TwwQuery;
    QryModeloEtiqueta: TwwQuery;
    QryModeloCartaIDCONFIGRUBS: TFloatField;
    QryModeloCartaDESCRUB: TStringField;
    QryModeloEtiquetaIDCONFIGRUBS: TFloatField;
    QryModeloEtiquetaDESCRUB: TStringField;
    QryParam: TwwQuery;
    UpdParam: TUpdateSQL;
    DsParam: TDataSource;
    QryParamIDCARTAPADRAO: TFloatField;
    QryParamIDETIQPADRAO: TFloatField;
    QryParamIDPESSOA: TFloatField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelCartaEtiq: TFrmSelCartaEtiq;

implementation

Uses uSistema, uDataBase, FPrincipal;
{$R *.DFM}

procedure TFrmSelCartaEtiq.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If QryParam.State In [DsEdit, DsInsert] Then
     QryParam.Cancel;

  If QryParam.UpdatesPending Then QryParam.CancelUpdates;;
end;

procedure TFrmSelCartaEtiq.FormCreate(Sender: TObject);
begin
  inherited;
  If QryParam.Active Then Close;
  QryParam.Params[0].AsInteger := Sistema.IdEmpresa;
  QryParam.Open;

  If QryParam.IsEmpty Then
  Begin
     QryParam.Append;
     QryParamIDPESSOA.AsFloat := Sistema.IdEmpresa;
     QryParam.Post;
  End;

  If QryModeloCarta.Active Then QryModeloCarta.Close;
  QryModeloCarta.Open;

  If QryModeloEtiqueta.Active Then QryModeloEtiqueta.Close;
  QryModeloEtiqueta.Open;
end;

procedure TFrmSelCartaEtiq.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If QryParam.State In [DsEdit, DsInsert] Then
     QryParam.Post;

  If QryParam.UpdatesPending Then AplicaAlteracoes([QryParam]);
end;

procedure TFrmSelCartaEtiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryParam.Close;
  QryModeloCarta.Close;
  QryModeloEtiqueta.Close;
end;

end.
