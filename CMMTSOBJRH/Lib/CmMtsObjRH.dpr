library CmMtsObjRH;

uses
  ComServ,
  CmMtsObjRH_TLB in 'CmMtsObjRH_TLB.pas',
  uObjRubricaIndiv in '..\Source\uObjRubricaIndiv.pas' {ObjRubricaIndiv: CoClass},
  uCtrlRubricaIndiv in '..\..\CmRHObj50\CtrlObjetos\uCtrlRubricaIndiv.pas',
  uDbRubricaIndiv in '..\..\CmRHObj50\DbObjetos\uDbRubricaIndiv.pas',
  uFuncoesUteisRH in '..\..\CmRhObj50\Package\uFuncoesUteisRH.pas',
  UsoGeralRH in '..\..\CmRHObj50\Package\UsoGeralRH.pas';

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
Histórico de alterações efetuadas no módulo CmMtsObjRH
================================================================================
CM$VER      4.00.01i    24/01/2003
--------------------------------------------------------------------------------
- Inclusão do método GetProximoNumSeq que retorna o próximo número sequencial para
  a chave primária.
================================================================================
CM$VER      4.00.00i    22/01/2003
--------------------------------------------------------------------------------
- Versão inicial do Objeto COM+ de integração com as rotinas dos Sistemas de RH CM.
================================================================================
CM$ALT}








