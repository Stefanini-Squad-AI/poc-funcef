program ImgCombosDemo;

uses
  Forms,
  ImgCombos in 'ImgCombos.pas' {TreeComboDemoForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTreeComboDemoForm, TreeComboDemoForm);
  Application.Run;
end.
