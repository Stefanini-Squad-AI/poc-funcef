unit FSelHotel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, Wwdatsrc, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, IvDictio, IvMulti, IvEMulti;

type
  TFrmSelHotel = class(TfrmOkCancelar)
    qryHotel: TwwQuery;
    dblcSelHotel: TwwDBLookupCombo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelHotel: TFrmSelHotel;
  Saida: Longint;
function SelecionaHotel: Longint;
implementation

{$R *.DFM}
Uses UModulo,USistema;

function SelecionaHotel: Longint;
begin
  with TFrmSelHotel.Create(Application) do
  begin
    Result := -1;
    if ShowModal = mrOk then
      Result := saida;
  end;
end;

procedure TFrmSelHotel.FormShow(Sender: TObject);
begin
  inherited;
  qryHotel.Close;
  qryHotel.ParamByName('PESSOA').AsFloat := Sistema.idEmpresa;
  qryHotel.Open;
  dblcSelHotel.DropDown;
end;

procedure TFrmSelHotel.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
//  Modulo.IHotel := qryHotel.FieldByName('IdHotel').AsInteger;
//  bbtnSairClick( Self );
  if dblcSelHotel.Text <> '' then
    Saida := qryHotel.FieldByName('IDHOTEL').AsInteger
  else Saida := -1;

end;

procedure TFrmSelHotel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryHotel.Close;
end;

end.
