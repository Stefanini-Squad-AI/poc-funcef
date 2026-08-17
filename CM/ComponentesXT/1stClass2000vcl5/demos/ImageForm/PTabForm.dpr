program PTabForm;

uses
  Forms,
  imagetabformu in 'imagetabformu.pas' {ImageTabForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TImageTabForm, ImageTabForm);
  Application.Run;
end.
