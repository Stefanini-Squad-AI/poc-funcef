unit FSelRelProc2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Spin, wwdblook, ExtCtrls, TEdNum,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, checklst, Buttons,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelProc2 = class(TfrmSelProcesso)
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelProc2: TfrmSelRelProc2;
  Imprime2 : Boolean;
  PercEnc  : Double;
     
implementation

uses fTelaAut, fSelRelProc, rProcesso, rProcesso2;

{$R *.DFM}

procedure TfrmSelRelProc2.FormCreate(Sender: TObject);
begin
  inherited;
  Imprime2 := Imprime;
  if (frmSelRelProc.rgTipoRel.ItemIndex = 1) then
  begin
    rgSitProc.ItemIndex := 1;
    rgSitProc.Enabled   := false;
    PercEnc             := frmSelRelProc.redEncargos.Value;
  end;
end;

procedure TfrmSelRelProc2.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (frmSelRelProc.rgTipoRel.ItemIndex = 0) then
    AbrirForm(RelProcesso, TRelProcesso, false)
  else
    AbrirForm(RelProcesso2, TRelProcesso2, false);
end;

end.
