unit fSelEstProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db,
  Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, ComCtrls, checklst, Buttons, wwdbdatetimepicker, CMDateTimePicker,
  FSelProcesso, Wwquery, Wwtable;

type
  TfrmSelEstProc = class(TfrmSelProcesso)
    rgDataEncer: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
  private
  end;

var
  frmSelEstProc: TfrmSelEstProc;

implementation

uses fEstProcesso, fTelaAut;

{$R *.DFM}

procedure TfrmSelEstProc.FormCreate(Sender: TObject);
begin
  inherited;
  edDataAju1.Date := (Date - round(365.25*10));
  edDataNot1.Date := (Date - round(365.25*10));
  edDataEnc1.Date := (Date - round(365.25*10));
end;

procedure TfrmSelEstProc.rgSitProcClick(Sender: TObject);
begin
  rgDataEncer.Visible := (rgSitProc.ItemIndex > 0);
end;

procedure TfrmSelEstProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  AbrirForm(frmEstProcesso, TfrmEstProcesso, False);
end;

end.
