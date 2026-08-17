library CMAlmoxComprasSrvr50;

uses
  ComServ,
  CMAlmoxComprasSrvr50_TLB in 'CMAlmoxComprasSrvr50_TLB.pas',
  DAlmoxComprasSrvr50 in 'DAlmoxComprasSrvr50.pas' {DtmAlmoxComprasSrvr50: TRemoteDataModule} {DtmAlmoxComprasSrvr50: CoClass};

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
Histórico de alterações efetuadas no módulo CMAlmoxComprasSrvr50
================================================================================
CM$VER      3.00.01     16/10/2002
--------------------------------------------------------------------------------
- Corrigidos erros na declaração dos métodos :  GravaRecebMerc, AtualizaDataRepresa
================================================================================
CM$VER      3.00.00     28/08/2002
--------------------------------------------------------------------------------
- Primeira Versão
================================================================================
CM$ALT}








