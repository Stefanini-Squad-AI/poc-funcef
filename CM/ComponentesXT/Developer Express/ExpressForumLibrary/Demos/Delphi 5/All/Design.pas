unit Design;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxfDesigner, StdCtrls, ExtCtrls, Spin;

type
  TDesignerForm = class(TForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Button4: TButton;
    RadioButton1: TRadioButton;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Button5: TButton;
    RadioButton2: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DesignerForm: TDesignerForm;

implementation

uses main;

{$R *.DFM}

procedure TDesignerForm.FormCreate(Sender: TObject);
begin
  Parent := MainForm.DesignerPanel;
  Align := alClient;
end;

procedure TDesignerForm.CheckBox1Click(Sender: TObject);
begin
  MainForm.dxfDesigner.Active := TCheckBox(Sender).Checked;
end;

procedure TDesignerForm.Button1Click(Sender: TObject);
begin
   MainForm.dxfDesigner.SavePosition;
end;

procedure TDesignerForm.Button2Click(Sender: TObject);
begin
   MainForm.dxfDesigner.LoadPosition;
end;

end.
