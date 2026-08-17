program Paint;

uses
  Forms,
  PaintUnit in 'PaintUnit.pas' {PaintForm},
  InfoUnit in 'InfoUnit.pas' {InfoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TPaintForm, PaintForm);
  Application.Run;
end.
