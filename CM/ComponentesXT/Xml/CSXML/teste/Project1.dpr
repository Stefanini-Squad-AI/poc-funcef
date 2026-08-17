program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  XMLReader in '..\XMLReader.pas',
  XMLWriter in '..\XMLWriter.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
