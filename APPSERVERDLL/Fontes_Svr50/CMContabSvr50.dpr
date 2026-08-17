library CMContabSvr50;

uses
  ComServ,
  CMContabSvr50_TLB in 'CMContabSvr50_TLB.pas',
  dContabSvr50 in 'dContabSvr50.pas' {DtmContabSvr50: TRemoteDataModule},
  uDbCampodepara in '..\..\CMContabObj50\DbObjects\uDbCampodepara.pas',
  uDbCompoelemdem in '..\..\CMContabObj50\DbObjects\uDbCompoelemdem.pas',
  uDbComporateioap in '..\..\CMContabObj50\DbObjects\uDbComporateioap.pas',
  uDbDemcolunas in '..\..\CMContabObj50\DbObjects\uDbDemcolunas.pas',
  uDbDemcolxlin in '..\..\CMContabObj50\DbObjects\uDbDemcolxlin.pas',
  uDbDemlinha in '..\..\CMContabObj50\DbObjects\uDbDemlinha.pas',
  uDbDemonstrativo in '..\..\CMContabObj50\DbObjects\uDbDemonstrativo.pas',
  uDbDesenhodemo in '..\..\CMContabObj50\DbObjects\uDbDesenhodemo.pas',
  uDbElembalpatr in '..\..\CMContabObj50\DbObjects\uDbElembalpatr.pas',
  uDbElemdemonstrativo in '..\..\CMContabObj50\DbObjects\uDbElemdemonstrativo.pas',
  uDbEventoSRH in '..\..\CMContabObj50\DbObjects\uDbEventoSRH.pas',
  uDbPlano in '..\..\CMContabObj50\DbObjects\uDbPlano.pas',
  uDbPlanocontaper in '..\..\CMContabObj50\DbObjects\uDbPlanocontaper.pas',
  uDbPlanodata in '..\..\CMContabObj50\DbObjects\uDbPlanodata.pas',
  uDbPlanodepara in '..\..\CMContabObj50\DbObjects\uDbPlanodepara.pas',
  uDbPredetalhe in '..\..\CMContabObj50\DbObjects\uDbPredetalhe.pas',
  uDbPreplanilha in '..\..\CMContabObj50\DbObjects\uDbPreplanilha.pas',
  uDbRataddetplanpatro in '..\..\CMContabObj50\DbObjects\uDbRataddetplanpatro.pas',
  uDbRatadmplanpatro in '..\..\CMContabObj50\DbObjects\uDbRatadmplanpatro.pas',
  uDbRateioapextra in '..\..\CMContabObj50\DbObjects\uDbRateioapextra.pas',
  uDbRateioativproj in '..\..\CMContabObj50\DbObjects\uDbRateioativproj.pas',
  uDbRateioplanpatro in '..\..\CMContabObj50\DbObjects\uDbRateioplanpatro.pas',
  uDbRegrascontab in '..\..\CMContabObj50\DbObjects\uDbRegrasContab.pas',
  uDbSubgrupo in '..\..\CMContabObj50\DbObjects\uDbSubgrupo.pas',
  uDbTabeladepara in '..\..\CMContabObj50\DbObjects\uDbTabeladepara.pas',
  uDbTermodiario in '..\..\CMContabObj50\DbObjects\uDbTermoDiario.pas',
  uCtrlDemColuna in '..\..\CMContabObj50\CtrlObjects\uCtrlDemColuna.pas',
  uCtrlDemLinha in '..\..\CMContabObj50\CtrlObjects\uCtrlDemLinha.pas',
  uCtrlDemonstrativo in '..\..\CMContabObj50\CtrlObjects\uCtrlDemonstrativo.pas',
  uCtrlDesenhoDemo in '..\..\CMContabObj50\CtrlObjects\uCtrlDesenhoDemo.pas',
  uCtrlElemBalPatr in '..\..\CMContabObj50\CtrlObjects\uCtrlElemBalPatr.pas',
  uCtrlElemDemonstrativo in '..\..\CMContabObj50\CtrlObjects\uCtrlElemDemonstrativo.pas',
  uCtrlEventoSRH in '..\..\CMContabObj50\CtrlObjects\uCtrlEventoSRH.pas',
  uCtrlListTerceiros in '..\..\CMContabObj50\CtrlObjects\uCtrlListTerceiros.pas',
  uCtrlParamContab in '..\..\CMContabObj50\CtrlObjects\uCtrlParamContab.pas',
  uCtrlPlanilha in '..\..\CMContabObj50\CtrlObjects\uCtrlPlanilha.pas',
  uCtrlPlano in '..\..\CMContabObj50\CtrlObjects\uCtrlPlano.pas',
  uCtrlPlanoContaPer in '..\..\CMContabObj50\CtrlObjects\uCtrlPlanoContaPer.pas',
  uCtrlPlanoData in '..\..\CMContabObj50\CtrlObjects\uCtrlPlanoData.pas',
  uCtrlPlanoDePara in '..\..\CMContabObj50\CtrlObjects\uCtrlPlanoDePara.pas',
  uCtrlPlanoSaldo in '..\..\CMContabObj50\CtrlObjects\uCtrlPlanoSaldo.pas',
  uCtrlPosadasExpBalancete in '..\..\CMContabObj50\CtrlObjects\uCtrlPosadasExpBalancete.pas',
  uCtrlPrePlanilha in '..\..\CMContabObj50\CtrlObjects\uCtrlPrePlanilha.pas',
  uCtrlPrePlanilhaLA in '..\..\CMContabObj50\CtrlObjects\uCtrlPrePlanilhaLA.pas',
  uCtrlPrePlanilhaPP in '..\..\CMContabObj50\CtrlObjects\uCtrlPrePlanilhaPP.pas',
  uCtrlPrePlanilhaRA in '..\..\CMContabObj50\CtrlObjects\uCtrlPrePlanilhaRA.pas',
  uCtrlPrePlanilhaRP in '..\..\CMContabObj50\CtrlObjects\uCtrlPrePlanilhaRP.pas',
  uCtrlPrePlanilhaRPP in '..\..\CMContabObj50\CtrlObjects\uCtrlPrePlanilhaRPP.pas',
  uCtrlProcessaContab in '..\..\CMContabObj50\CtrlObjects\uCtrlProcessaContab.pas',
  uCtrlProcessaTotalPrev in '..\..\CMContabObj50\CtrlObjects\uCtrlProcessaTotalPrev.pas',
  uCtrlRateioApExtra in '..\..\CMContabObj50\CtrlObjects\uCtrlRateioApExtra.pas',
  uCtrlRateioAtivProj in '..\..\CMContabObj50\CtrlObjects\uCtrlRateioAtivProj.pas',
  uCtrlRegrasContab in '..\..\CMContabObj50\CtrlObjects\uCtrlRegrasContab.pas',
  uCtrlRptAvisoLan in '..\..\CMContabObj50\CtrlObjects\uCtrlRptAvisoLan.pas',
  uCtrlCampoDePara in '..\..\CMContabObj50\CtrlObjects\uCtrlCampoDePara.pas',
  uCtrlSubGrupo in '..\..\CMContabObj50\CtrlObjects\uCtrlSubGrupo.pas',
  uCtrlTabelaDePara in '..\..\CMContabObj50\CtrlObjects\uCtrlTabelaDePara.pas',
  uCtrlTermoDiario in '..\..\CMContabObj50\CtrlObjects\uCtrlTermoDiario.pas',
  Midas_TLB in 'Midas_TLB.pas';

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
Histórico de alterações efetuadas no módulo CMContabSvr50
================================================================================
CM$VER      3.02.00     27/01/2003
--------------------------------------------------------------------------------
Alteração da função Desmembramento/Agrupamento de contas
================================================================================
CM$VER      3.01.00     06/01/2003
--------------------------------------------------------------------------------
1) Função ExcluiLancaContab ( inclusão do parametro idmodulo)
2) Função TestaDataBloqueada ( inclusão do parametro idmodulo)
================================================================================
CM$VER      3.00.31     19/12/2002
--------------------------------------------------------------------------------
Colocar Grava Log de acordo com o pedido via Email :
Verifica Lanaçamentos
a) ArredondaValores - Tela alterada, uCtrlProcessaContab alterada e Aplic.Servidora alterada.
b) AcertaTipoSaldopeloTipoConta - Tela alterada, uCtrlProcessaContab alterada e Aplic.Servidora alterada.
c) Testa Consistencia dos Lancamentos -  Tela alterada, uCtrlProcessaContab alterada e Aplic.Servidora alterada.
Atualiza Saldo das Contas Analíticas
Atualiza Saldo das Contas Sintéticas
Atualiza Códigos Reduzidos
Atualiza Numeração das Planilhas
Lançamentos
Plano de Contas
Saldo Anterior
Conta Correspondente
Planilhas/Lançamentos 
Planilhas/Pré - Prontas
Planilhas/Rateio
Planilhas/Automático
Planilhas/Alteração de Data
Planilhas/Exclusão de Planilhas por Faixa
Atualiza Moeda
Integração \ Por dia
Apuração do Resultado do Período
Consiste Regras
Encerra Período
Gera Arquivo SPC_CAP
Gera Saldo Calculado por Período
Rateio por Programa
Saldo Anterior
Gera Rateio por Período
Lançamentos do Rateio
Percentuais do  Rateio Administrativo
Cadastro do Saldo de Contas
Rateio por Programa
Regras
Saldo Anterior
================================================================================
CM$VER      3.00.30     10/12/2002
--------------------------------------------------------------------------------
Esta versao esta sendo liberada apenas porque ela estava apontando para DCUs nos lugares
indevidos. É importante saber que nenhuma alteração de código foi feita.
================================================================================
CM$VER      3.00.29     04/12/2002
--------------------------------------------------------------------------------
Alteração da CtrlPlanoSaldo e atualização do padrao 9.06
================================================================================
CM$VER      3.00.28     20/11/2002
--------------------------------------------------------------------------------
Criação da nova função :AtualizaParamContab, usada na tela de lancamento
================================================================================
CM$VER      3.00.07     30/08/2002
--------------------------------------------------------------------------------
Criação de novas rotinas dos rateios, importações em geral e rotinas que controlam De-Para de contas
================================================================================
CM$VER      3.00.05     19/08/2002
--------------------------------------------------------------------------------
* Otimização de processamentos internos.
================================================================================
CM$VER      3.00.04     16/08/2002
--------------------------------------------------------------------------------
- Customizações com o Padrão 05.07.00
================================================================================
CM$VER      3.00.03     11/06/2002
--------------------------------------------------------------------------------
- Customizações com o Padrão 05.07.00
================================================================================
CM$ALT}
































































