program memdemo;

uses
  Forms,
  main in 'main.pas' {Form1},
  stdbctrl in 'stdbctrl.pas' {Form2},
  tellmore in 'tellmore.pas' {Form4};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
