program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  IvFiMult in '..\..\..\..\pas32\Multi\IvFiMult.pas',
  IvBinDic in '..\..\..\..\pas32\Multi\IvBinDic.pas',
  IvMlRead in '..\..\..\..\pas32\Multi\IvMlRead.pas',
  IvMLDDic in '..\..\..\..\pas32\Multi\IvMLDDic.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
