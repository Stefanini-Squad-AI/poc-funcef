program Indxproj;

uses
  Forms,
  Indxmain in 'INDXMAIN.PAS' {FormIndxProjMain};

{$R *.RES}

begin
  Application.CreateForm(TFormIndxProjMain, FormIndxProjMain);
  Application.Run;
end.
