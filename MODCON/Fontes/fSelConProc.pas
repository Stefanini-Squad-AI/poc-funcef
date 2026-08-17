unit FSelConProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, checklst, TB97,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelConProc = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelConProc: TfrmSelConProc;

implementation

uses FConProc, FTelaAut;

{$R *.DFM}

procedure TfrmSelConProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmConProc, TfrmConProc, False);
end;

end.
