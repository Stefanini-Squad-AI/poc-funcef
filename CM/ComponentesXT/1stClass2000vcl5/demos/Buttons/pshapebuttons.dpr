program pshapebuttons;

uses
  Forms,
  Shapeu in 'Shapeu.pas' {ShapeBtnDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TShapeBtnDemoForm, ShapeBtnDemoForm);
  Application.Run;
end.
