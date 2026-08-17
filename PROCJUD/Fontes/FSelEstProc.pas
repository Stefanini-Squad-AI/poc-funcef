unit FSelEstProc;
              
interface       

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, ComCtrls, Buttons,
  wwdbdatetimepicker, CMDateTimePicker, CheckLst;

type
  TfrmSelEstProc = class(TfrmSelProcesso)
    rgDataEncer: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEstProc: TfrmSelEstProc;

implementation


uses fTelaAut, fEstProcesso;

{$R *.DFM}

procedure TfrmSelEstProc.FormCreate(Sender: TObject);
begin
  inherited;
  EdDataAju1.Date := (Date - round(365.25*10));
  EdDataNot1.Date := (Date - round(365.25*10));
  EdDataEnc1.Date := (Date - round(365.25*10));
end;

procedure TfrmSelEstProc.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  AbrirForm(frmEstProcesso, TfrmEstProcesso, False);
end;

end.
