unit fSelOrcam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, TEdNum, Db, DBTables, Wwtable, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Spin, TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti;

type
  TfrmSelOrcam = class(TfrmSairAjuda)
    dbgrEncargo: TwwDBGrid;
    ds: TwwDataSource;
    super: TGroupBox;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    EditNum1: TEditNum;
    EditNum2: TEditNum;
    EditNum3: TEditNum;
    EditNum4: TEditNum;
    EditNum5: TEditNum;
    EditNum6: TEditNum;
    EditNum7: TEditNum;
    EditNum8: TEditNum;
    EditNum9: TEditNum;
    EditNum10: TEditNum;
    gbxEfetivo: TGroupBox;
    EditNum11: TEditNum;
    EditNum12: TEditNum;
    EditNum13: TEditNum;
    EditNum14: TEditNum;
    EditNum15: TEditNum;
    EditNum16: TEditNum;
    EditNum17: TEditNum;
    EditNum18: TEditNum;
    EditNum19: TEditNum;
    EditNum20: TEditNum;
    EditNum21: TEditNum;
    EditNum22: TEditNum;
    ednPerc2: TEditNum;
    tblEncargo: TwwTable;
    tblEncargoDESCRENCARGO: TStringField;
    tblEncargoPERCENCARGO: TFloatField;
    Label1: TLabel;
    spedMeses: TSpinEdit;
    rgBenef: TRadioGroup;
    rgEncargo: TRadioGroup;
    ednPerc1: TEditNum;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormShow(Sender: TObject);
    procedure rgEncargoClick(Sender: TObject);
    procedure spedMesesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmSelOrcam: TfrmSelOrcam;
  VetEdit: array[1..24] of TEditNum;
  Ind, NumVez: Integer;

implementation

uses fOrcam, fTelaAut;

{$R *.DFM}

procedure TfrmSelOrcam.FormCreate(Sender: TObject);
begin
  inherited;
  tblEncargo.Open;
  NumVez := 0;
end;

procedure TfrmSelOrcam.FormShow(Sender: TObject);
var
  TotPerc: double;
begin
  inherited;
  for Ind := 1 to ComponentCount do
    if (Components[Ind - 1] is TEditNum) and
       (Components[Ind - 1].Tag > 0) and
       (Components[Ind - 1].Tag <= ComponentCount) then
      VetEdit[Components[Ind - 1].Tag] := TEditNum(Components[Ind - 1]);

  TotPerc := 0;
  tblEncargo.First;
  while not(tblEncargo.EOF) do
  begin
    TotPerc := TotPerc + tblEncargo.FieldByName('PERCENCARGO').Value;
    tblEncargo.Next;
  end;
  ednPerc2.Text := FloatToStr(TotPerc);
  tblEncargo.First;
end;

procedure TfrmSelOrcam.rgEncargoClick(Sender: TObject);
begin
  ednPerc1.Visible    := (rgEncargo.ItemIndex = 0);
  ednPerc2.Visible    := (rgEncargo.ItemIndex = 1);
  dbgrEncargo.Visible := (rgEncargo.ItemIndex = 1);
end;

procedure TfrmSelOrcam.spedMesesChange(Sender: TObject);
begin
  for Ind:=1 to 12 do
    VetEdit[Ind].Visible := (Ind <= spedMeses.Value);

  for Ind:=1 to 12 do
    VetEdit[Ind+12].Visible := (Ind <= spedMeses.Value);
end;

procedure TfrmSelOrcam.bbtnConfirmarClick(Sender: TObject);
begin
  AbrirForm(frmOrcam, TfrmOrcam, false);
end;

end.
