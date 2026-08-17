program Demo1stClassMDI;

uses
  Forms,
  Main in 'MAIN.PAS' {MainMDIForm},
  Childwin in 'CHILDWIN.PAS' {MDIChild},
  About in 'about.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainMDIForm, MainMDIForm);
  Application.Run;
end.
