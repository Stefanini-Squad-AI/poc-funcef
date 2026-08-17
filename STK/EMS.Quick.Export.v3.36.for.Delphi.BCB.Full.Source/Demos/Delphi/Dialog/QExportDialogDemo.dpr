program QExportDialogDemo;

uses
  Forms,
  fuQExportDialogDemo in 'fuQExportDialogDemo.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
