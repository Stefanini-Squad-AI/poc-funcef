program DemoBo;

uses
  Forms,
  uDbDm_tipocliente in '..\DbObjects\uDbDm_tipocliente.pas',
  uDbDm_clientextipo in '..\DbObjects\uDbDm_clientextipo.pas',
  uDbDm_cliente in '..\DbObjects\uDbDm_cliente.pas',
  uCtrlCliente in '..\CtrlObjects\uCtrlCliente.pas',
  fAcessoADados in 'fAcessoADados.pas' {FrmAcessoaDados};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Demo Bussines Object';
  Application.CreateForm(TFrmAcessoaDados, FrmAcessoaDados);
  Application.Run;
end.
