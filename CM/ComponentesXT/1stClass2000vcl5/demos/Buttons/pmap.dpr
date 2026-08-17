program pmap;

uses
  Forms,
  mapu in 'mapu.pas' {MapForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMapForm, MapForm);
  Application.Run;
end.
