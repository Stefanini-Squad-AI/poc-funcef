unit fSelEstObj2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook,
  ExtCtrls, TB97, IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelEstObj2 = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmSelEstObj2: TfrmSelEstObj2;

implementation

uses fTelaAut, fEstObjeto;

{$R *.DFM}

procedure TfrmSelEstObj2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  AbrirForm(frmEstObjeto, TfrmEstObjeto, false);
end;

end.
