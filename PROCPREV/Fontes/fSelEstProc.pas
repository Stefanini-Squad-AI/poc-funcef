unit fSelEstProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcesso,
  DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook,
  ExtCtrls, TB97, IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelEstProc = class(TfrmSelProcesso)
    rgDataEncer: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmSelEstProc: TfrmSelEstProc;

implementation

uses fEstProcesso, fTelaAut;

{$R *.DFM}

procedure TfrmSelEstProc.FormCreate(Sender: TObject);
begin
  inherited;
  edDataAju1.Date := (Date - Round(365.25*10));
  edDataNot1.Date := (Date - Round(365.25*10));
  edDataEnc1.Date := (Date - Round(365.25*10));
  EdDataNot2.Date := Date;
  EdDataAju2.Date := Date;
  EdDataEnc2.Date := Date;
end;

procedure TfrmSelEstProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  AbrirForm(frmEstProcesso, TfrmEstProcesso, false);
end;

end.
