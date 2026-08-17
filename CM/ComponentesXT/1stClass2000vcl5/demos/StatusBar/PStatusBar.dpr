program PStatusBar;

uses
  Forms,
  StatusBars in 'StatusBars.pas' {StatusBarDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TStatusBarDemoForm, StatusBarDemoForm);
  Application.Run;
end.
