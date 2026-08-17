unit FSelRelFicha2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelPessoal, Db, DBTables, Wwquery, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdblook, Spin, TEdNum, ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelFicha2 = class(TfrmSelPessoal)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelFicha2: TfrmSelRelFicha2;

implementation

uses rFichaFun, fSelRelFicha;

{$R *.DFM}

procedure TfrmSelRelFicha2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  relFichaFun := TrelFichaFun.Create(Self);

  if (Imprime) then
    relFichaFun.qr.Print
  else
    relFichaFun.qr.Preview;

  Self.WindowState := wsNormal;
end;

end.
