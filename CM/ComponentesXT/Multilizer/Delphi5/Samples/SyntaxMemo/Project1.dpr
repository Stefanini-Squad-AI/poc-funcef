program Project1;







uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  SynElemF in '..\..\..\..\lib\SyntaxMemo\Source\SynElemF.pas' {OptionsDialog};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TOptionsDialog, OptionsDialog);
  Application.Run;
end.
