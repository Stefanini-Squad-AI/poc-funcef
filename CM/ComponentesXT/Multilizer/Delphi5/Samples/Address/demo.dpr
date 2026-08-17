program demo;

uses
  Forms,
  main in 'main.pas' {MainForm},
  ListDlg in 'ListDlg.pas' {ListDialog};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
