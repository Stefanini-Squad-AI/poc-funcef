program test;

uses
  Forms,
  main in 'main.pas' {Form1},
  IvMulti in '..\..\..\..\pas32\Multi\IvMulti.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
