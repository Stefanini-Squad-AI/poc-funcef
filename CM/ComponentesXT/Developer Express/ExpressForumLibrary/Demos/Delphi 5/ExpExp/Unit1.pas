unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, ComCtrls, ExtCtrls, dxfExplorer;

type
  TForm1 = class(TForm)
    Exp: TdxfExpressionExplorer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    seA: TSpinEdit;
    Label2: TLabel;
    seB: TSpinEdit;
    Label3: TLabel;
    seC: TSpinEdit;
    Label4: TLabel;
    seD: TSpinEdit;
    Label5: TLabel;
    seE: TSpinEdit;
    Button1: TButton;
    Memo2: TMemo;
    PaintBox: TPaintBox;
    Button2: TButton;
    procedure ExpFunctionPerforming(Sender: TObject;
      FunctionName: String; var Parameter: Double);
    procedure ExpConvertWord(Sender: TObject;
      var CurrentWord: String);
    procedure Button1Click(Sender: TObject);
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

procedure TForm1.ExpFunctionPerforming(Sender: TObject;
  FunctionName: String; var Parameter: Double);
begin
   if FunctionName = 'ROUND' then Parameter := Round(Parameter);
end;

procedure TForm1.ExpConvertWord(Sender: TObject;
  var CurrentWord: String);
begin
  if CurrentWord = 'A' then CurrentWord := IntToStr(seA.Value);
  if CurrentWord = 'B' then CurrentWord := IntToStr(seB.Value);
  if CurrentWord = 'C' then CurrentWord := IntToStr(seC.Value);
  if CurrentWord = 'D' then CurrentWord := IntToStr(seD.Value);
  if CurrentWord = 'E' then CurrentWord := IntToStr(seE.Value);
  if CurrentWord = 'PAINTBOX.WIDTH' then CurrentWord := IntToStr(PaintBox.Width);
  if CurrentWord = 'PAINTBOX.HEIGHT' then CurrentWord := IntToStr(PaintBox.Height);
  if CurrentWord = 'PAINTPIXEL' then begin
     CurrentWord := '0';
     if Exp.VariableIsPresent('X') and
        Exp.VariableIsPresent('Y') and
        Exp.VariableIsPresent('COLOR') then
          PaintBox.Canvas.Pixels[Trunc(Exp.VariableByName('X')),
                                 Trunc(Exp.VariableByName('Y'))] :=
                                 Trunc(Exp.VariableByName('COLOR'));
  end;
  if CurrentWord = 'CLAQUA'   then CurrentWord := IntToStr(clAqua);
  if CurrentWord = 'CLBLACK'  then CurrentWord := IntToStr(clBlack);
  if CurrentWord = 'CLBLUE'   then CurrentWord := IntToStr(clBlue);
  if CurrentWord = 'CLGRAY'   then CurrentWord := IntToStr(clGray);
  if CurrentWord = 'CLGREEN'  then CurrentWord := IntToStr(clGreen);
  if CurrentWord = 'CLLIME'   then CurrentWord := IntToStr(clLime);
  if CurrentWord = 'CLMAROON' then CurrentWord := IntToStr(clMaroon);
  if CurrentWord = 'CLNAVY'   then CurrentWord := IntToStr(clNavy);
  if CurrentWord = 'CLOLIVE'  then CurrentWord := IntToStr(clOlive);
  if CurrentWord = 'CLPURPLE' then CurrentWord := IntToStr(clPurple);
  if CurrentWord = 'CLRED'    then CurrentWord := IntToStr(clRed);
  if CurrentWord = 'CLSILVER' then CurrentWord := IntToStr(clSilver);
  if CurrentWord = 'CLTEAL'   then CurrentWord := IntToStr(clTeal);
  if CurrentWord = 'CLWHITE'  then CurrentWord := IntToStr(clWhite);
  if CurrentWord = 'CLYELLOW' then CurrentWord := IntToStr(clYellow);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Exp.Expressions.Text := Memo1.Lines.Text;
  Exp.Execute;
  MessageDlg('Result = '+FloatToStr(Exp.Value), mtInformation, [mbOk], 0);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  PaintBox.Canvas.Brush.Color := Color;
  PaintBox.Canvas.FillRect(Rect(0, 0, PaintBox.Width, PaintBox.Height));
  Exp.Expressions.Text := Memo2.Lines.Text;
  Exp.Execute;
end;

end.
