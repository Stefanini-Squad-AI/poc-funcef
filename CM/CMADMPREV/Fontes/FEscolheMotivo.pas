//------------------------------------------------------------------
// Sistema  .: ADMPREV
//------------------------------------------------------------------
// Formulário para pedir um novo Motivo.
// 19/09/00
// Alexandre Ramos 
//------------------------------------------------------------------------------
unit FEscolheMotivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TFrmEscolheMotivo = class(TfrmOkCancelar)
    Label8: TLabel;
    DbLkcNovoMotivo: TwwDBLookupCombo;
    QryMotivo: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wIdMotivo : Integer;
  end;

var
  FrmEscolheMotivo: TFrmEscolheMotivo;

implementation

{$R *.DFM}
 
procedure TFrmEscolheMotivo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  wIdMotivo := QryMotivo.FieldByName('IDMOTIVO').AsInteger;
end;

procedure TFrmEscolheMotivo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  wIdMotivo := -1;
end;

procedure TFrmEscolheMotivo.FormShow(Sender: TObject);
begin
  inherited;
  QryMotivo.Close;
  QryMotivo.ParamByName('IDMOTIVO').AsInteger:=wIdMotivo;
  QryMotivo.Open;
  wIdMotivo := -1;
end;

end.
