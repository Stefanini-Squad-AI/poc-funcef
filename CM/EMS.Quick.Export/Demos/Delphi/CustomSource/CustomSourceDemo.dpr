program CustomSourceDemo;

uses
  Forms,
  fuCustomSourceDemo in 'fuCustomSourceDemo.pas' {fmCustomSourceDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmCustomSourceDemo, fmCustomSourceDemo);
  Application.Run;
end.
