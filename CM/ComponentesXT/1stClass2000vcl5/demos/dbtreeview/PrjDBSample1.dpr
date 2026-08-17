program PrjDBSample1;

uses
  Forms,
  DBTreeSample1 in 'DBTreeSample1.pas' {DMTreeViewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDMTreeViewForm, DMTreeViewForm);
  Application.Run;
end.
