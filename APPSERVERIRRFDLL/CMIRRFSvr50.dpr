library CMIRRFSvr50;

uses
  ComServ,
  CMIRRFSvr50_TLB in 'CMIRRFSvr50_TLB.pas',
  DmIRRF in 'DmIRRF.pas' {DIRRF: TRemoteDataModule} {IRRF: CoClass},
  uCtrUtilLancIRRF in '..\IRRF\CtrlObjects\uCtrUtilLancIRRF.pas',
  uCtrlBuscaIOFEmprestimo in '..\IRRF\CtrlObjects\uCtrlBuscaIOFEmprestimo.pas',
  uCtrlBuscaIRCARCAR in '..\IRRF\CtrlObjects\uCtrlBuscaIRCARCAR.pas',
  uCtrlDARF in '..\IRRF\CtrlObjects\uCtrlDARF.pas',
  uCtrlDCTF in '..\IRRF\CtrlObjects\uCtrlDCTF.pas',
  uCtrlExcluirCapINSS in '..\IRRF\CtrlObjects\uCtrlExcluirCapINSS.pas',
  uCtrlGeraCapINSS in '..\IRRF\CtrlObjects\uCtrlGeraCapINSS.pas',
  uCtrlGeraDarf in '..\IRRF\CtrlObjects\uCtrlGeraDarf.pas',
  uCtrlGeraDirf in '..\IRRF\CtrlObjects\uCtrlGeraDirf.pas',
  uCtrlGeraFolha in '..\IRRF\CtrlObjects\uCtrlGeraFolha.pas',
  uCtrlGfip in '..\IRRF\CtrlObjects\uCtrlGfip.pas',
  uCtrlInforme in '..\IRRF\CtrlObjects\uCtrlInforme.pas',
  uCtrlIRRFPF in '..\IRRF\CtrlObjects\uCtrlIRRFPF.pas',
  uCtrllConfigRelatInforme in '..\IRRF\CtrlObjects\uCtrllConfigRelatInforme.pas',
  uCtrlModuloIRRF in '..\IRRF\CtrlObjects\uCtrlModuloIRRF.pas',
  uCtrlNatuRendimento in '..\IRRF\CtrlObjects\uCtrlNatuRendimento.pas',
  uCtrlParamIRRF in '..\IRRF\CtrlObjects\uCtrlParamIRRF.pas',
  uCtrlRubricaxInforme in '..\IRRF\CtrlObjects\uCtrlRubricaxInforme.pas',
  uCtrlTipoAltxImpostos in '..\IRRF\CtrlObjects\uCtrlTipoAltxImpostos.pas',
  uCtrlUtil in '..\IRRF\CtrlObjects\uCtrlUtil.pas',
  uCtrLancIRRF in '..\IRRF\CtrlObjects\uCtrLancIRRF.pas',
  uCtrlRptGPS in '..\IRRF\Reports\Source\uCtrlRptGPS.pas',
  uFuncoesUteis in '..\IRRF\Fontes\UFuncoesUteis.pas',
  uDbRubricaxinforme in '..\IRRF\DbObjects\uDbRubricaxinforme.pas',
  uDbDarf in '..\IRRF\DbObjects\uDbDarf.pas',
  uDbInforme in '..\IRRF\DbObjects\uDbInforme.pas',
  uDbIrrf in '..\IRRF\DbObjects\uDbIrrf.pas',
  uDbLancirrf in '..\IRRF\DbObjects\uDbLancirrf.pas',
  uDbLancxinforme in '..\IRRF\DbObjects\uDbLancxinforme.pas',
  uDbNaturendimento in '..\IRRF\DbObjects\uDbNaturendimento.pas',
  uDbParamirrf in '..\IRRF\DbObjects\uDbParamirrf.pas',
  uDbAltximposto in '..\IRRF\DbObjects\uDbAltximposto.pas',
  rptGPSMT in '..\IRRF\Reports\Source\rptGPSMT.pas' {rptGPS};

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
Histórico de alterações efetuadas no módulo Aplicação servidora do IRRF
================================================================================
CM$VER      3.00.05     28/01/2003
--------------------------------------------------------------------------------
Inclusão da unit uFuncoesUteis no path 
================================================================================
CM$VER      3.00.04     25/10/2002
--------------------------------------------------------------------------------
Correção no ImpostoXAlterador
================================================================================
CM$VER      3.00.03     11/09/2002
--------------------------------------------------------------------------------
Inclusão da Bpl do IRRF
================================================================================
CM$VER      3.00.02     30/08/2002
--------------------------------------------------------------------------------
* Acerto na geração da DIRF
================================================================================
CM$ALT}


















































