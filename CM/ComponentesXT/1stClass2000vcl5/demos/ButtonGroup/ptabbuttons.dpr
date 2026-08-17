program ptabbuttons;

uses
  Forms,
  tabbuttons in 'tabbuttons.pas' {TabBtnGroupForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTabBtnGroupForm, TabBtnGroupForm);
  Application.Run;
end.
