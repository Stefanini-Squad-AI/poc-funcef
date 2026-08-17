library CmModBenSvr50;

uses
  ComServ,
  CmModBenSvr50_TLB in 'CmModBenSvr50_TLB.pas',
  DCmModBenSvr50 in 'DCmModBenSvr50.pas' {DmCmModBenSvr50: TRemoteDataModule} {DmCmModBenSvr50: CoClass};

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
Histórico de alterações efetuadas no módulo CmModBenSvr50
================================================================================
CM$VER      4.00.00i    14/11/2002
--------------------------------------------------------------------------------
- Versão Inicial da Aplicação Servidora do Módulo RH - Benefícios Sociais.
================================================================================
CM$ALT}






