program EQGridReportLink;

uses
  Forms,
  main in 'main.pas' {MainForm},
  preview in 'preview.pas' {PreviewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TPreviewForm, PreviewForm);
  Application.Run;
end.
