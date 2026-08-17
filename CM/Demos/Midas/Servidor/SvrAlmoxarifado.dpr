program SvrAlmoxarifado;

uses
  Forms,
  FPrincipal in 'FPrincipal.pas' {FrmPrincipal},
  SvrAlmoxarifado_TLB in 'SvrAlmoxarifado_TLB.pas',
  RdAlmoxarifado in 'RdAlmoxarifado.pas' {RdmAlmoxarifado: TRemoteDataModule} {RdmAlmoxarifado: CoClass},
  udbAlmox in '..\DbObjetos\udbAlmox.pas',
  uCtrlAlmox in '..\CtrlObjetos\uCtrlAlmox.pas';

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Almoxarifado Server';
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
