program Dxfview;

uses
  Forms,
  Dxfvmain in 'DXFVMAIN.PAS' {Form1},
  Dxfgrph in '..\Dxfgrph.PAS',
  Strlib in '..\Strlib.PAS';

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
