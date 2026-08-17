program Person;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  Child in 'Child.pas' {ChildForm},
  MultForm in 'MultForm.pas' {MultilingualForm},
  Details in 'Details.pas' {DetailsDialog},
  About in 'About.pas' {AboutDialog};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
