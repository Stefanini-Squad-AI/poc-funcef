program PrjTreeDemo;

uses
  Forms,
  treedemo in 'treedemo.pas' {TreeViewDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTreeViewDemoForm, TreeViewDemoForm);
  Application.Run;
end.
