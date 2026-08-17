program Project1;



uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dxBarCustForm in '..\..\..\..\lib\DevEx\ExpressBars\Sources\Delphi 5\dxBarCustForm.pas' {dxBarCustomizingForm},
  dxBarStrs in '..\..\..\..\lib\DevEx\ExpressBars\Sources\Delphi 5\dxBarStrs.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
