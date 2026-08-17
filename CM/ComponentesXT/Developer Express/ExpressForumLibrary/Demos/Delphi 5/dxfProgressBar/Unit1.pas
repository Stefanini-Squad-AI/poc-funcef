unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, dxfProgressBar;

type
  TForm1 = class(TForm)
    PB1: TdxfProgressBar;
    PB2: TdxfProgressBar;
    PB3: TdxfProgressBar;
    PB4: TdxfProgressBar;
    PB7: TdxfProgressBar;
    PB8: TdxfProgressBar;
    PB9: TdxfProgressBar;
    PB10: TdxfProgressBar;
    PB11: TdxfProgressBar;
    Timer: TTimer;
    PB12: TdxfProgressBar;
    StatusBar: TStatusBar;
    PB5: TdxfProgressBar;
    PB6: TdxfProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  d : integer;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  PB12.Parent := StatusBar;
  PB12.Top := 4;
  PB12.Left := 2;
  PB12.Height := StatusBar.Height - 6;
  PB12.Width := StatusBar.Panels[0].Width - 4;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  if PB1.Position = 0   then d := 1;
  if PB1.Position = 100 then d := -1;
  PB1.StepBy(d);
  PB2.StepBy(d);
  PB3.StepBy(d);
  PB4.StepBy(d);
  PB5.StepBy(d);
  PB6.StepBy(d);
  PB7.StepBy(d);
  PB8.StepBy(d);
  PB9.StepBy(d);
  PB10.StepBy(d);
  PB11.StepBy(d);
  PB12.StepBy(d);
end;

end.
