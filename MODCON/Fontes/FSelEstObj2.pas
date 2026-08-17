unit FSelEstObj2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, checklst, Buttons,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelEstObj2 = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstObj2: TfrmSelEstObj2;

implementation

uses FEstObjeto, FTelaAut;

{$R *.DFM}

procedure TfrmSelEstObj2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  AbrirForm{Modal}(frmEstObjeto, TfrmEstObjeto, False);
  //frmEstObjeto.Free;
end;

end.
