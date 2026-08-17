unit Statdlg;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Meter;

type
  TFormStatus = class(TForm)
    GroupBoxTableStats: TGroupBox;
    LabelStatus: TLabel;
    GroupBoxVerify: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    LabelZeroOf: TLabel;
    Label6: TLabel;
    LabelOfZero: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBoxRebuild: TGroupBox;
    LabelNumPacked: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    LabelNumRecs: TLabel;
    LabelNumFields: TLabel;
    LabelRecSize: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    LabelPasswordTF: TLabel;
    LabelNumAuxPasswords: TLabel;
    Label17: TLabel;
    LabelTableOf: TLabel;
    Label19: TLabel;
    LabelOfTable: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GaugeHeader: TMeter;
    GaugeIndex: TMeter;
    GaugeData: TMeter;
    GaugeHeaderIdx: TMeter;
    GaugeIndexIdx: TMeter;
    GaugeDataIdx: TMeter;
    GaugeIntegrity: TMeter;
    GaugeRebuild: TMeter;
  end;

var
  FormStatus: TFormStatus;

implementation

{$R *.DFM}

procedure TFormStatus.FormCreate(Sender: TObject);
  function CreateMeter(L,T,W,H : Integer; Rent : TWinControl) : TMeter;
  begin
    result := TMeter.Create(Self);
    result.parent := Rent;
    result.Left := L;
    result.Top := T;
    result.Width := W;
    result.Height := H;
    result.Color := clBtnFace;
    result.Kind := gkPie;
    result.ForeColor := clBlue;
    result.Font.Color := clBlack;
    result.Font.Height := -11;
    result.Font.Name := 'MS Sans Serif';
    result.Font.Style := [];
    result.ParentColor := False;
    result.ParentFont := False;
    result.Progress := 0;
  end;
begin
  GaugeHeader := CreateMeter(6,22,40,41,GroupBoxVerify);
  GaugeIndex:=  CreateMeter(51,22,40,41,GroupBoxVerify);
  GaugeData:=  CreateMeter(96,22,40,41,GroupBoxVerify);
  GaugeHeaderIdx:=  CreateMeter(156,22,41,41,GroupBoxVerify);
  GaugeIndexIdx:=  CreateMeter(202,22,41,41,GroupBoxVerify);
  GaugeDataIdx:=  CreateMeter(247,22,41,41,GroupBoxVerify);
  GaugeIntegrity:=  CreateMeter(293,22,41,41,GroupBoxVerify);
  GaugeRebuild:=  CreateMeter(60,16,41,42,GroupBoxRebuild);
end;

end.



