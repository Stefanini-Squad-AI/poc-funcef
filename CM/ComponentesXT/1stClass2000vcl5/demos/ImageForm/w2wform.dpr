program w2wform;

uses
  Forms,
  orderformu in 'orderformu.pas' {OrderForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TOrderForm, OrderForm);
  Application.Run;
end.
