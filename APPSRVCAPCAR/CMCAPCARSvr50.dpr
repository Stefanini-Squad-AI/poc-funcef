library CMCAPCARSvr50;

uses
  ComServ,
  CMCapCarSvr50_TLB in 'CMCapCarSvr50_TLB.pas',
  DtmCAPCAR in 'DtmCAPCAR.pas' {DmCapCarSrv50: TRemoteDataModule} {DmCFinanSrv50: CoClass};

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Aplicacao Servidora CAP CAR
================================================================================
CM$ALT}


