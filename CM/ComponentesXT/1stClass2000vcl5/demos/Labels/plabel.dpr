program plabel;

uses
  Forms,
  labelu in 'labelu.pas' {LabelForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TLabelForm, LabelForm);
  Application.Run;
end.
