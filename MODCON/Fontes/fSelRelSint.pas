unit FSelRelSint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSelProcesso, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, MAHlpBtn,
  StdCtrls, Spin, wwdblook, ExtCtrls, TEdNum,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, checklst, Buttons,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmSelRelSint = class(TfrmSelProcesso)
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelSint: TfrmSelRelSint;
  Ano, Mes, Dia : Word;

implementation

uses fTelaAut, rProcSint;

{$R *.DFM}

procedure TfrmSelRelSint.FormCreate(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, Ano, Mes, Dia);
  cmbMes.ItemIndex := Mes - 1;
  spedAno.Value    := Ano;

  EdDataAju1.Date := (Date - Round(365.25*10));
  EdDataNot1.Date := (Date - Round(365.25*10));
  EdDataEnc1.Date := (Date - Round(365.25*10));
end;

procedure TfrmSelRelSint.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  with (TRelProcSint.Create(Application)) do
    Free;
end;

end.
