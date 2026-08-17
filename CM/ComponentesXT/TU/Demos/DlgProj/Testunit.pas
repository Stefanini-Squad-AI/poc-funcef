unit Testunit;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, TRepDlg, DB, DBTables;

type
  TForm1 = class(TForm)
    Button1: TButton;
    RepairDialog1: TRepairDialog;
    GroupBox1: TGroupBox;
    rdDBCombosEnabled: TCheckBox;
    rdDBCombosVisible: TCheckBox;
    rdCheckBoxEnabled: TCheckBox;
    rdCheckBoxVisible: TCheckBox;
    rdSourceListEnabled: TCheckBox;
    rdSourceListVisible: TCheckBox;
    rdSelectBtnsVisible: TCheckBox;
    rdExceptListVisible: TCheckBox;
    rdVerifyOnlyBtnVisible: TCheckBox;
    rdViewErrosBtnVisible: TCheckBox;
    rdVerRebBtnVisible: TCheckBox;
    rdRebuildOnlyVisible: TCheckBox;
    rdSaveBatchVisible: TCheckBox;
    rdFileInfoVIsible: TCheckBox;
    rdGuagesVisible: TCheckBox;
    rdLogVisible: TCheckBox;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure rdDBCombosEnabledClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  { First update the TableList property in the Dialog component to reflect any
  changes the user made in the TMemo }
  RepairDialog1.TableList.Clear;
  RepairDialog1.TableList.AddStrings(Memo1.Lines);
  {Now Execute the dialog }
  RepairDialog1.Execute;
end;

procedure TForm1.rdDBCombosEnabledClick(Sender: TObject);
{Generally speaking I hate it when peoply write code like the following cause
 its so cryptic. In this case I did it anyway cause it saves writing two
 huge case statements.}
begin
  If TCheckBox(Sender).Checked then
    RepairDialog1.DlgOptions :=
      RepairDialog1.DlgOptions + [TRDOption(TCheckBox(Sender).Tag)]
  else
    RepairDialog1.DlgOptions :=
      RepairDialog1.DlgOptions - [TRDOption(TCheckBox(Sender).Tag)];
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    RepairDialog1.CallbackActive := True
  else
    RepairDialog1.CallBackActive := False;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    RepairDialog1.BorrowRebuildOnly := True
  else
    RepairDialog1.BorrowRebuildOnly := False;
end;


procedure TForm1.FormCreate(Sender: TObject);
var
 I : Integer;
begin
  { This For loop saves setting each checkbox individually for the
    DlgOptions Property}
  For I := 0 to GroupBox1.ControlCount - 1 do
  begin
    If GroupBox1.Controls[I] is TCheckBox then
    begin
      If TRDOption(I) in RepairDialog1.DlgOptions then
        TCheckBox(GroupBox1.Controls[I]).Checked := True
      else
        TCheckBox(GroupBox1.Controls[I]).Checked := False;
    end;
  end;
  { Set CheckBox1 acording to the CallBackActive Property}
  If RepairDialog1.CallbackActive then
    CheckBox1.Checked := True
  else
    CheckBox1.Checked := False;
  { Set CheckBox2 acording to the BorrowRebuildOnly Property}
  If RepairDialog1.BorrowRebuildOnly then
    CheckBox2.Checked := True
  else
    CheckBox2.Checked := False;
  {Show the list of tables in the TableList Property}
   Memo1.Lines.Clear;
   Memo1.Lines.AddStrings(RepairDialog1.TableList);
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

end.


