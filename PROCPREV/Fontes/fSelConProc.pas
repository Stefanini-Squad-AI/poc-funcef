unit FSelConProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin,
  wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, TB97, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelConProc = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmSelConProc: TfrmSelConProc;

implementation

uses fTelaAut, fConProc;

{$R *.DFM}

procedure TfrmSelConProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConProc, TfrmConProc, false);
end;

end.
