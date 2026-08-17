program ImagerProj;

uses
  Forms,
  ImagerMain in 'ImagerMain.pas' {ImagerForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TImagerForm, ImagerForm);
  Application.Run;
end.
