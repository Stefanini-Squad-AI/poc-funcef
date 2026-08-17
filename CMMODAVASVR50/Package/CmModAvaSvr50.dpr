library CmModAvaSvr50;

uses
  ComServ,
  CmModAvaSvr50_TLB in 'CmModAvaSvr50_TLB.pas',
  DCmModAvaSvr50 in 'DCmModAvaSvr50.pas' {DmCmModAvaSvr50: TRemoteDataModule} {DmCmModAvaSvr50: CoClass};

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
Histórico de alterações efetuadas no módulo CmModAvaSvr50
================================================================================
CM$VER      4.00.00i    14/11/2002
--------------------------------------------------------------------------------
- Versão Inicial da Aplicação Servidora do Módulo RH - Administração de Desempenho.
================================================================================
CM$ALT}








