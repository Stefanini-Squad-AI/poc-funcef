unit FSelFolUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst;

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

uses FFolUpProc, FTelaAut;

{$R *.DFM}

procedure TfrmSelFolUp.FormCreate(Sender: TObject);
begin
  inherited;
  EdDataEnc1.Date := (Date);
  EdDataEnc2.Date := (Date + 30);
  rgSitProc.ItemIndex := 0;
  gbxDataEnc.Visible  := True;  
end;

procedure TfrmSelFolUp.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  AbrirForm{Modal}(frmFolUpProc, TfrmFolUpProc, False);
end;

end.
