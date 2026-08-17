program SaveData;

uses
  Forms,
  fPrincipal in 'fPrincipal.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
