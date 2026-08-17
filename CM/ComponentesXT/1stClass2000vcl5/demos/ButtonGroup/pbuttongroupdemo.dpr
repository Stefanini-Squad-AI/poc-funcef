program pbuttongroupdemo;

uses
  Forms,
  buttongroupdemo in 'buttongroupdemo.pas' {ButtonGroupDemo2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TButtonGroupDemo2, ButtonGroupDemo2);
  Application.Run;
end.
