unit FSelRelProc2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Spin, wwdblook, ExtCtrls, TEdNum,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, Buttons,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst;

type
  TfrmSelRelProc2 = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProc2: TfrmSelRelProc2;


implementation

uses FTelaAut, rProcesso;

{$R *.DFM}

procedure TfrmSelRelProc2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(RelProcesso, TRelProcesso, false);
  RelProcesso.Free;
end;

end.
