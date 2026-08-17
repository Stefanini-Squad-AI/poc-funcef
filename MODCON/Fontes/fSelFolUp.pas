unit FSelFolUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelFolUp = class(TfrmSelProcesso)
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelFolUp: TfrmSelFolUp;

implementation

uses fTelaAut, fFolUpProc;

{$R *.DFM}

procedure TfrmSelFolUp.FormCreate(Sender: TObject);
begin
  inherited;
  edDataEnc1.Date     := Date;
  edDataEnc2.Date     := Date + 30;
  rgSitProc.ItemIndex := 0;
  gbxDataEnc.Visible  := True;
end;

procedure TfrmSelFolUp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmFolUpProc, TfrmFolUpProc, false);
end;

end.
