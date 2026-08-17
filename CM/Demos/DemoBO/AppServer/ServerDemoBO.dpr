program ServerDemoBO;

uses
  Forms,
  fprincipal in 'fprincipal.pas' {FrmPrincipal},
  ServerDemoBO_TLB in 'ServerDemoBO_TLB.pas',
  DDemoBO in 'DDemoBO.pas' {DmDemoBO: TRemoteDataModule} {DmDemoBO: CoClass},
  uCtrlCliente in '..\CtrlObjects\uCtrlCliente.pas',
  uDbDm_tipocliente in '..\DbObjects\uDbDm_tipocliente.pas',
  uDbDm_clientextipo in '..\DbObjects\uDbDm_clientextipo.pas',
  uDbDm_cliente in '..\DbObjects\uDbDm_cliente.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
