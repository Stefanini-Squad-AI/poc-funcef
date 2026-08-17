unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, dxfDesigner;

type
  TForm1 = class(TForm)
    dxfDesigner1: TdxfDesigner;
    Panel1: TPanel;
    Button2: TButton;
    Button4: TButton;
    MainMenu1: TMainMenu;
    Active: TMenuItem;
    Load1: TMenuItem;
    Button1: TButton;
    Exit1: TMenuItem;
    Active1: TMenuItem;
    Saveposition1: TMenuItem;
    LoadPosition1: TMenuItem;
    Memo1: TMemo;
    procedure Active1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Saveposition1Click(Sender: TObject);
    procedure LoadPosition1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Active1Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
  dxfDesigner1.Active := TMenuItem(Sender).Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dxfDesigner1.IniFile := ExtractFilePath(Application.ExeName)+'Position.ini';
end;

procedure TForm1.Saveposition1Click(Sender: TObject);
begin
  dxfDesigner1.SavePosition;
end;

procedure TForm1.LoadPosition1Click(Sender: TObject);
begin
  dxfDesigner1.LoadPosition;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

end.
