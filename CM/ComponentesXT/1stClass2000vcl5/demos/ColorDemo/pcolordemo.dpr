program pcolordemo;

uses
  Forms,
  colordemou in 'colordemou.pas' {ColorDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TColorDemoForm, ColorDemoForm);
  Application.Run;
end.
