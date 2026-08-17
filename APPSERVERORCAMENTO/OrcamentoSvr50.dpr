library OrcamentoSvr50;

uses
  ComServ,
  OrcamentoSvr50_TLB in 'OrcamentoSvr50_TLB.pas',
  uDtmOrcamentoSvr50 in 'uDtmOrcamentoSvr50.pas' {dtmOrcamentoSrv50: TRemoteDataModule} {OrcamentoSrv50: CoClass},
  uCtrlAlterorcamento in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlAlterorcamento.pas',
  uCtrlCadCenario in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadCenario.pas',
  uCtrlCadContasOrc in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadContasOrc.pas',
  uCtrlCadGrupos in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadGrupos.pas',
  uCtrlCadLayOutOrc in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadLayoutOrc.Pas',
  uCtrlCadTipoCriterioRat in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadTipoCriterioRat.pas',
  uCtrlCadUsuxCResp in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadUsuxCResp.pas',
  uCtrlCadValCriterioRat in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadValCriterioRat.pas',
  uCtrlCenarioOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCenarioOrcamen.pas',
  uCtrlCompContasOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCompContasOrcamen.pas',
  uCtrlCompromisso in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCompromisso.pas',
  uCtrlContaOrcamentaria in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlContaOrcamentaria.pas',
  uCtrlCopiaContaOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCopiaContaOrcamen.pas',
  uCtrlCriaRelatorio in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCriaRelatorio.pas',
  uCtrlDocrecxcomp in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlDocrecxcomp.pas',
  uCtrlEfetivacao in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlEfetivacao.pas',
  uCtrlLancamentoOrc in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlLancamentoorc.pas',
  uCtrlLinhasRelatOrc in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlLinhasRelatOrc.pas',
  uCtrlPeriodoOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlPeriodoOrcamen.pas',
  uCtrlPlanilhaContabil in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlPlanilhaContabil.pas',
  uCtrlPlanoOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlPlanoOrcamen.pas',
  uCtrlPlanoTrabalho in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlPlanoTrabalho.pas',
  uCtrlRelatOrcamento in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlRelatOrcamento.pas',
  uDMCopiaContaOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\uDMCopiaContaOrcamen.pas' {dtmCopiaContaOrcamen: TDataModule},
  udtmCadContasOrcamen in '..\CMPlaneOrcObj50\CtrlObjects\udtmCadContasOrcamen.pas' {dtmCadContasOrcamen: TDataModule},
  uDtmCadLayOutOrc in '..\CMPlaneOrcObj50\CtrlObjects\uDtmCadLayOutOrc.pas' {DtmCadLayOutOrc: TDataModule},
  uDbCadCenario in '..\CMPlaneOrcObj50\DbObjects\uDbCadCenario.pas',
  uDbCenarioOrcamen in '..\CMPlaneOrcObj50\DbObjects\uDbCenarioorcamen.pas',
  uDbCompContasOrcamen in '..\CMPlaneOrcObj50\DbObjects\uDbCompContasOrcamen.pas',
  uDbContasOrcamen in '..\CMPlaneOrcObj50\DbObjects\uDbContasOrcamen.pas',
  uDbCriterioRatOrc in '..\CMPlaneOrcObj50\DbObjects\uDbCriterioRatOrc.pas',
  uDbDataView in '..\CMPlaneOrcObj50\DbObjects\uDbDataView.pas',
  uDbDesenhoOrc in '..\CMPlaneOrcObj50\DbObjects\uDbDesenhoOrc.pas',
  uDbDocrecxcomp in '..\CMPlaneOrcObj50\DbObjects\uDbDocrecxcomp.pas',
  uDbGrupoOrcamen in '..\CMPlaneOrcObj50\DbObjects\uDbGrupoorcamen.pas',
  uDbLancamentoorc in '..\CMPlaneOrcObj50\DbObjects\uDbLancamentoorc.pas',
  uDbLinhasrelatorc in '..\CMPlaneOrcObj50\DbObjects\uDbLinhasrelatorc.pas',
  uDbAlterorcamento in '..\CMPlaneOrcObj50\DbObjects\uDbAlterorcamento.pas',
  uDbPeriodoOrcamen in '..\CMPlaneOrcObj50\DbObjects\uDbPeriodoOrcamen.pas',
  uDbPessoaXCresp in '..\CMPlaneOrcObj50\DbObjects\uDbPessoaXCresp.pas',
  uDbPlanoOrcamen in '..\CMPlaneOrcObj50\DbObjects\uDbPlanoOrcamen.pas',
  uDbPlanotrabalhoorc in '..\CMPlaneOrcObj50\DbObjects\uDbPlanotrabalhoorc.pas',
  uDbRelatOrc in '..\CMPlaneOrcObj50\DbObjects\uDbRelatorc.pas',
  uDbValorCriRatOrc in '..\CMPlaneOrcObj50\DbObjects\uDbValorCriRatOrc.pas',
  uCtrlGeraDados in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlGeraDados.pas',
  uCtrlEntCadDadosEspecial in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlEntCadDadosEspecial.pas',
  uCtrlCadContasOrcPorGrupo in '..\CMPlaneOrcObj50\CtrlObjects\uCtrlCadContasOrcPorGrupo.Pas',
  uReccodigo in '..\Orcamento\FontesMT\uReccodigo.pas',
  uMidasUtil in '..\Cm\MIDAS\umidasutil.pas',
  uDtmGeraDados in '..\CMPlaneOrcObj50\CtrlObjects\uDtmGeraDados.pas' {dtmGeraDados: TDataModule},
  udtmEntCadDadosEspecial in '..\CMPlaneOrcObj50\CtrlObjects\udtmEntCadDadosEspecial.pas' {dtmEntCadDadosEspecial: TDataModule};

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
Histórico de alterações efetuadas no módulo Planejamento e Orçamento  - SVR
================================================================================
CM$VER      0.00.09     10/02/2003
--------------------------------------------------------------------------------
- Cadastro de Contas Orçamentárias
   . Correção da gravação de query genérica
================================================================================
CM$VER      0.00.08     22/01/2003
--------------------------------------------------------------------------------
- Incluídos métodos para suprir o novo Cadastro de Contas por Grupo
================================================================================
CM$VER      0.00.07     22/11/2002
--------------------------------------------------------------------------------
Incluidos novos métodos para Geração de Dados
================================================================================
CM$VER      0.00.06     11/11/2002
--------------------------------------------------------------------------------
Inclusão de método para gravação de Valores de Critério de Rateio
================================================================================
CM$VER      0.00.05     18/10/2002
--------------------------------------------------------------------------------
Alterações visando otimizações da bpl / liberação de versões
================================================================================
CM$VER      0.00.04     02/10/2002
--------------------------------------------------------------------------------
Foram realizadas alterações para atender a características do padrão 5.09.00
================================================================================
CM$VER      0.00.02     01/10/2002
--------------------------------------------------------------------------------
Correções em diversos métodos devido a erros apontados pela homologação
================================================================================
CM$VER      0.00.01     16/08/2002
--------------------------------------------------------------------------------
1a. versão
================================================================================
CM$ALT}


























