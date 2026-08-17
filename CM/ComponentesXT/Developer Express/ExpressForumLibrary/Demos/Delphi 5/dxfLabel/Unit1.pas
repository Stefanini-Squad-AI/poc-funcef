unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, dxfLabel;

type
  TForm1 = class(TForm)
    dxfLabel1: TdxfLabel;
    Timer1: TTimer;
    dxfLabel2: TdxfLabel;
    dxfLabel3: TdxfLabel;
    dxfLabel4: TdxfLabel;
    dxfLabel5: TdxfLabel;
    dxfLabel6: TdxfLabel;
    dxfLabel7: TdxfLabel;
    dxfLabel9: TdxfLabel;
    dxfLabel8: TdxfLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  dxfLabel1.Angle := (dxfLabel1.Angle + 10) mod 360;
end;

end.
