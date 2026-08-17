unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, Buttons, dxfQuickTyp;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    RadioButton1: TRadioButton;
    Edit3: TEdit;
    Edit4: TEdit;
    dxfQuickTyper1: TdxfQuickTyper;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses dbform;

{$R *.DFM}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  DBForm_.ShowModal;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  dxfQuickTyper1.MessageBeep := CheckBox1.Checked;
end;

end.
