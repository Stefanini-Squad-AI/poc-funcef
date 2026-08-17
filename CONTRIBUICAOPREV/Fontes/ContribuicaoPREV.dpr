// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Alteração  : Adicionado novo Form 
//Nº SIG.....: 99932
//Data.......: 15/05/2020
//Responsável: Rafael Vasconcelos
//Descrição..: Adicionado novo form: FAlteraHistMovReserva
//------------------------------------------------------------------------------
//Alteração  : Adicionado novo Form 
//Nº SIG.....: 88874
//Data.......: 15/05/2020
//Responsável: Rafael Vasconcelos
//Descrição..: Adicionado novo form: FrmAlteracaoHistoricoContrib
//------------------------------------------------------------------------------
//Alteração  : Adicionado novo form  
//Nº SIG.....: 99102
//Data.......: 16/03/2020
//Responsável: Ewerton Beltramini
//Descrição..: Adicionado novo form: FrmAlteracaoHistoricoContrib
//------------------------------------------------------------------------------
//Alteração  : Adicionado fonte
//Nº SIG.....: 41789
//Data.......: 13/03/2018
//Responsável: Taffarel
//Descrição..: Adicionado fonte FAlteraSalario
//------------------------------------------------------------------------------
//Alteração  : funcionalidade renomeada
//Nº SIG.....: 33372
//Data.......: 29/11/2016
//Responsável: Edilaine Ferraresi
//Descrição..: Ajustes para Equacionamento - Recebimento Contrib via Folha
//------------------------------------------------------------------------------
// Autor(a)    : Darivaldo Alencar
// SOL.253577/18061 ppm.1238748
// Data        : 15.02.2016
// Alteração   : Inclusão dos forms desenvolvidos ParamRelMovContrib,
//               ParamRelFinanc,dtmParamRelMovContrib,dtmParamRelFinanc
// -----------------------------------------------------------------------------
Program ContribuicaoPREV;

uses
  Forms,
  UModulo in 'UModulo.pas',
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FConsultar in '..\..\Cm\Forms\Source\FConsultar.pas' {frmConsultar},
  USistema in '..\..\Cm\Forms\Source\USistema.pas',
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao'},
  FPreparaEnvia in 'FPreparaEnvia.pas' {frmPreparaEnvia},
  DPreparaContrib in 'DPreparaContrib.pas' {dtmPreparaContrib: TDataModule},
  FProgressoBatch in 'FProgressoBatch.pas' {frmProgressoBatch},
  dRelExtratoDeslig in '..\Relatorios\dRelExtratoDeslig.pas' {dtmRelExtratoDeslig},
  FCadContribNucleoFamiliar in 'FCadContribNucleoFamiliar.pas' {frmCadContribNucleoFamiliar},
  FCadAlteraPdv in 'FCadAlteraPdv.pas' {frmCadAlteraPdv},
  DAPrevIntegraBack in '..\..\Cm\CMAdmPrev\Fontes\DAPrevIntegraBack.pas' {dtmAPrevIntegraBack: TDataModule},
  DAPrev in '..\..\Cm\CMAdmPrev\Fontes\DAPrev.pas' {dtmAPrev: TDataModule},
  FMostraAux in '..\..\Cm\CMAdmPrev\Fontes\FMostraAux.pas' {frmMostraAux},
  FMostraContribuicoes in '..\..\Cm\CMAdmPrev\Fontes\FMostraContribuicoes.pas' {frmMostraContribuicoes},
  FPedeInfAux in '..\..\Cm\CMAdmPrev\Fontes\FPedeInfAux.pas' {frmPedeInfAux},
  DIntegraCAPCAR in '..\..\Cm\CMAdmPrev\Fontes\DIntegraCAPCAR.pas' {dtmIntegraCAPCAR: TDataModule},
  dRetroativoLote in '..\..\Cm\CMAdmPrev\Fontes\dRetroativoLote.pas' {dmRetroativoLote: TDataModule},
  FDivergContrib in 'FDivergContrib.pas' {frmDivergContrib},
  FCtrlInterface in '..\Relatorios\FCtrlInterface.pas' {frmCtrlinterface},
  FConsRubricas in '..\Relatorios\FConsRubricas.pas' {frmConsRubricas},
  FParamRelExtratoDeslig in '..\Relatorios\FParamRelExtratoDeslig.pas' {FrmParamRelExtratoDeslig},
  FPRelHisFuncionalMT in '..\Relatorios\FPRelHisFuncionalMT.pas',
  DRelatGerencial in '..\Relatorios\dRelatGerencial.pas' {dtmRelatorioGerencial},
  dRelRetroRegional in '..\Relatorios\dRelRetroRegional.pas' {dtmRelRetroRegional},
  FCfgEtiqueta in '..\Relatorios\FCfgEtiqueta.pas',
  FConfSimulaDeslig in '..\Relatorios\FConfSimulaDeslig.pas' {FrmConfSimulaDeslig},
  FConsEventosPrev in '..\Relatorios\FConsEventosPrev.pas' {frmConsEventosPrev},
  FConsHistMovReserva in '..\Relatorios\FConsHistMovReserva.pas' {frmConsHistMovReserva},
  FConsLogTotalPREV in '..\Relatorios\FConsLogTotalPREV.pas' {frmConsLogTotalPREV},
  fEmisEtiq in '..\Relatorios\fEmisEtiq.pas' {FrmEmisEtiq},
  fParamRelGerencial02 in '..\Relatorios\fParamRelGerencial02.pas' {frmParamRelGerencial02},
  fParamRelGerencial03 in '..\Relatorios\fParamRelGerencial03.pas' {frmParamRelGerencial03},
  fParamRelGerencial04 in '..\Relatorios\fParamRelGerencial04.pas' {frmParamRelGerencial04},
  FParamRelGerencial in '..\Relatorios\fParamRelGerencial.pas' {frmParamRelGerencial},
  fPRelConsolidaMovRes in '..\Relatorios\fPRelConsolidaMovRes.pas' {frmPRelConsolidaMovRes},
  FPRelExtPoup in '..\Relatorios\FPRelExtPoup.pas' {frmPRelExtPoup},
  FAtualizaPorIndice in 'fAtualizaPorIndice.pas' {frmAtualizaPorIndice},
  FCadHstContribuicao in 'FCadHstContribuicao.pas' {frmCadHstContribuicao},
  FControleIndivContrib in 'FControleIndivContrib.pas' {frmControleIndivContrib},
  FTransferenciaSaldoCota in 'FTransferenciaSaldoCota.pas' {frmTransferenciaSaldoCota},
  fSolicitaDataAlimentacao in 'fSolicitaDataAlimentacao.pas' {frmSolicitaDataAlimentacao},
  FPedeDataVencimento in 'FPedeDataVencimento.pas' {frmPedeDataVencimento},
  FCalcSalContr in 'FCalcSalContr.pas' {FrmCalcSalContr},
  fCalculoIRRF in 'fCalculoIRRF.pas' {FrmCalculoIRRF},
  FAlimReservasReplan in 'FAlimReservasReplan.pas' {frmAlimReservasReplan},
  fCargaArquivo in 'fCargaArquivo.pas' {frmCargaArquivo},
  FAlteracaoBeneficioSaldadoFAB in 'FAlteracaoBeneficioSaldadoFAB.pas' {frmAlteracaoBeneficioSaldadoFAB},
  FBeneficioSaldadoFAB in 'FBeneficioSaldadoFAB.pas' {frmBeneficioSaldadoFAB},
  FRevisaoIndice in 'FRevisaoIndice.pas' {frmRevisaoIndice},
  FDesfazerCarga in 'FDesfazerCarga.pas' {frmDesfazerCarga},
  FProgresso in '..\..\CM\Forms\Source\FProgresso.pas' {frmProgresso},
  FCadHstContribuicaoBeneficiario in 'FCadHstContribuicaoBeneficiario.pas' {frmCadHstContribuicaoBeneficiario},
  FMesInicioRelSaldoFab in 'FMesInicioRelSaldoFab.pas' {frmMesInicioRelSaldoFab},
  FProvPerdasIndiv in 'FProvPerdasIndiv.pas' {FrmProvPerdasIndiv},
  FProvPerdasLote in 'FProvPerdasLote.pas' {FrmProvPerdasLote},
  FFRelProvPerdas in 'FFRelProvPerdas.pas' {FrmFRelProvPerdas},
  dRelProvPerdas in '..\Relatorios\dRelProvPerdas.pas' {RptProvPerdas},
  FPreviewExpEx in '..\Relatorios\FPreviewExpEx.pas' {FrmPreviewExpEx},
  //Darivaldo Alencar - SOL.253577/18061 ppm.1238748 - inicio
  dParamRelFinanc in '..\Relatorios\dParamRelFinanc.pas' {dtmParamRelFinanc},
  dParamRelMovContrib in '..\Relatorios\dParamRelMovContrib.pas' {dtmParamRelMovContrib},
  FParamRelFinanc in '..\Relatorios\FParamRelFinanc.pas' {ParamRelFinanc},
  FParamRelMovContrib in '..\Relatorios\FParamRelMovContrib.pas' {ParamRelMovContrib},
  //Darivaldo Alencar - SOL.253577/18061 ppm.1238748 - fim
  //edilaine - SIG33372 - inicio  
  FRecebeContribuicaoNovo in 'FRecebeContribuicaoNovo.pas' {frmRecebeContribuicaoNovo},
  FDesfDocContribuicao in 'FDesfDocContribuicao.pas' {frmDesfDocContribuicao},
  //edilaine - SIG33372 - fim
  //Andre Imakawa - SIG 73590 - Inicio
  fConciliaInstResgPort in '..\..\Cm\CMAdmPrev\Relatorios\fConciliaInstResgPort.pas' {frmConciliaInstResgPort},
  dConciliaInstResgPort in '..\..\Cm\CMAdmPrev\Relatorios\dConciliaInstResgPort.pas' {dtmConciliaInstResgPort},
  //Andre Imakawa - SIG 73590 - Fim
  FRelProvConst in '..\Relatorios\FRelProvConst.pas' {RelProvConst},
  FAlteraSalario in 'FAlteraSalario.pas' {FrmAlteraSalario},
  FAlteracaoHistoricoContrib in 'FAlteracaoHistoricoContrib.pas' {FrmAlteracaoHistoricoContrib},
  FAlteraSalPart in 'FAlteraSalPart.pas' {FrmAlteraSalPart},
  FCadContribuicaoLote in 'FCadContribuicaoLote.pas' {FrmCadContribuicaoLote},
  FAlteraHistMovReserva in 'FAlteraHistMovReserva.pas' {FrmAlteraHistMovReserva},
  FHistoricoDeContribuicaoEmAtraso in 'FHistoricoDeContribuicaoEmAtraso.pas' {FrmHistoricoDeContribuicaoEmAtraso};


{$R *.RES}
{$R CONTRIBUICAOPREV_RES.RES}
begin

  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Manutenção e Cobrança de Contribuição';
  Application.CreateForm(TdtmAPrev, dtmAPrev);
  Application.CreateForm(TdtmIntegraCAPCAR, dtmIntegraCAPCAR);
  Application.CreateForm(TdtmAPrevIntegraBack, dtmAPrevIntegraBack);
  Application.CreateForm(TdtmPreparaContrib, dtmPreparaContrib);
  Application.CreateForm(TdmRetroativoLote, dmRetroativoLote);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmRelatorioGerencial, dtmRelatorioGerencial);
  Application.CreateForm(TdtmRelRetroRegional, dtmRelRetroRegional);
  Application.CreateForm(TfrmMostraAux, frmMostraAux);
  Application.CreateForm(TfrmPedeInfAux, frmPedeInfAux);
  Application.CreateForm(TFrmCalcSalContr, FrmCalcSalContr);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmMesInicioRelSaldoFab, frmMesInicioRelSaldoFab);
  Application.CreateForm(TRptProvPerdas, RptProvPerdas);
  //Darivaldo Alencar - SOL.253577/18061 ppm.1238748 --inicio
  Application.CreateForm(TdtmParamRelFinanc, dtmParamRelFinanc);
  Application.CreateForm(TdtmParamRelMovContrib, dtmParamRelMovContrib);
  //Darivaldo Alencar - SOL.253577/18061 ppm.1238748 --fim
  //Andre Imakawa - SIG 73590 - Inicio
  Application.CreateForm(TdtmConciliaInstResgPort, dtmConciliaInstResgPort);
  Application.CreateForm(TfrmConciliaInstResgPort, frmConciliaInstResgPort);
  //Andre Imakawa - SIG 73590 - Fim
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Contribuições Previdenciárias
================================================================================
CM$VER      3.00.06c    14/03/2008
--------------------------------------------------------------------------------
- Pendência : 26613 (reabertura)
  Tela/Opção: Controle individual de contribuições
  Descrição : Correção da consulta de contribuições 
================================================================================
CM$VER      3.00.06b    15/01/2008
--------------------------------------------------------------------------------
- Pendência : 26613
  Tela/Opção: Controle individual de contribuições
  Descrição : Alterações no layout para evidenciar devoluções, mais restrições a desfazer através de verificação da situação dos documentos
- Pendência : 27138
  Tela/Opção: Preparo e envio de contribuições
  Descrição : Correção da query de entrada para cálculo de contribuições sobre 13º, em caso de manutenção recente
- Pendência : 25604
  Tela/Opção: Preparo e envio de contribuições
  Descrição : Criada opção para ignorar contribições de planos desativados
================================================================================
CM$VER      3.00.06a    07/12/2007
--------------------------------------------------------------------------------
- Pendência : 27013
  Tela/Opção: Preparo e envio de contribuições
  Descrição : Aplicação de filtro por Plano Previdencial em todos os casos (inclusive Folha de Benefícios)
================================================================================
CM$VER      3.00.06     03/12/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.18
- Resolução da Pendência nº 26474
  Tela/Opção no Sistema: Contribuições | Tratamento de Divergências
  Descrição: Inclusão de teste antes do tratamento de divergências para verificar se
             o registro possui documento CAP/CAR
- Resolução da Pendência nº 26572
  Tela/Opção no Sistema: Contribuições | Entrada Manual de Rubricas
  Descrição: Habilitando tela de Entrada Manual de Rubricas no ContribuiçãoPrev             
- Pendência : 26656
  Tela/Opção: Contribuições | Entrada manual de Contribuições
  Descrição : Correção do preenchimento da data de recebimento com a data prevista.
- Pendência : 25044
  Tela/Opção: Recebimento de Contribuições via Folha
  Descrição : Geração de documentos para CaR por Data de Recebimento gravada, em vez de pela data indicada na tela
              Só ocorrerá dessa forma se se as opções "Efetuar apenas integração" e "Documentos distintos por dia" estiverem marcadas ao mesmo tempo
- Pendência : 26750 (reabertura) / 26928
  Tela/Opção: Tratamento de divergencias
  Descrição : Ajustes na verificação de recebimento de documentos do CaR, para contemplar casos de baixa (do documento) com valor zero
- Pendência : 23663 (reabertura)
  Tela/Opção: Preparo e envio de contribuições
  Descrição : Ajustes no processo de verificação de documentos já enviados, para que não ocorra erro quando houver muitos (mais de 1000)
================================================================================
CM$VER      3.00.05     16/08/2007
--------------------------------------------------------------------------------
* Liberação Padrão 5.10.17
- Resolução da Pendência nº 25173
  Tela/Opção no Sistema: Contribuições | Tratamento de Divergências
  Descrição: Ajuste no tratamento de divergências para verificar se o registro
             já foi baixado no CAP/CAR  
- Resolução da Pendência nº 25700
  Tela/Opção no Sistema: Reservas | Atualização de Reservas por Índices
  Descrição: Inclusão da rotina de atualizar reservas por lista de arquivos.
- Resolução da Pendência nº 24778
  Tela/Opção no Sistema: Reservas | Atualização de Reservas por Índices
  Descrição: Inclusão de seleção por reserva e situação do participante
- Resolução da Pendência nº 22570
  Tela/Opção no Sistema: Consultas|relatórios|participantes|PARTICIPANTES EM DÉBITO
  Descrição: Alteração para permitir a escolha de um determinado período
             para gerar o relatório. Mudanças no layout do relatório
             - O mês referência e o mês cobrança passam a ficar na grade de informações.
             - Retirado o mês cobrança do cabeçalho do relatório
             - Retirado o mês cobrança do critério de agrupamento
             - Mudada a ordenação por mês cobrança e mês referência.
================================================================================
CM$VER      3.00.02e    06/08/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25903
  Tela/Opção no Sistema: Contribuições | Cadastro de Histórico de Contribuições
  Descrição: Alteração para verificar corretamente a parametrização que permita
             alterar o cadastro de histórico de contribuição.
================================================================================
CM$VER      3.00.02d    30/07/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25974
  Tela/Opção no Sistema: Contribuições | Controle Individual de Contribuições
  Descrição: Inclusão de crítica para proibir alteração de registro recebido
             ou enviado para a folha/contas a receber.
================================================================================
CM$VER      3.00.02c    27/07/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 22081
  Tela/Opção no Sistema: Preparo e envio de contribuições
  Descrição: Correção da pendência e inclusão do parâmetro FLGCONCESSAO.
================================================================================
CM$VER      3.00.02a    27/06/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25696
  Tela/Opção no Sistema: Contribuições | Entrada Manual de Contribuições
  Descrição            : Alteração para não verificar a existência de registro
                         na TMPDESC se na HSTCONTRIBPREV estiver com
                         SITRECEBIMENTO = 0
================================================================================
CM$VER      3.00.02     17/05/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.16
- Resolução da Pendência nº 20368
  Tela/Opção no Sistema: Reservas / Movimentação de Reservas
  Descrição: Retirada a janela de movimentação de reserva, pois a alimentação é
             feita durante a concessão do benefício.
- Resolução da Pendência nº 25264
  Tela/Opção no Sistema: Tela Principal
  Descrição: Retirado o botão de Atalho para Cadastros de Pessoa.
================================================================================
CM$VER      3.00.01c    09/05/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25264
  Tela/Opção no Sistema: Atalho para Cadastros de Pessoa
  Descrição: Retirar o botão de atalho para o Cadastros de Pessoa
================================================================================
CM$VER      3.00.01b    09/05/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25145
  Tela/Opção no Sistema: Contribuições | Preparo e Envio de Contribuições
  Descrição: Alteração na query para quando efetuar o envio de contribuições
             parametrizadas como ENVIA BASE (FLGTPVLR='B') considerar também
             o envio de contribuições em atraso com valor.
- Resolução da Pendência nº 24961
  Tela/Opção no Sistema: Participantes | Contribuições do Participante
  Descrição: Acerto no alias das tabelas na query de delete.
================================================================================
CM$VER      3.00.01a    24/04/2007
--------------------------------------------------------------------------------
- Resolução da Pendência nº 25095
  Tela/Opção no Sistema: Contribuições | Preparo e Envio de Contribuições | Desfazer
  Descrição: Correção na rotina de desfazer preparo para não buscar o campo CODDOCUMENTOPREV.
- Resolução da Pendência nº 25159
  Tela/Opção no Sistema: Alimentação Mensal de Reservas
  Descrição: Passar para a regra de calculo da Reserva um identificador da contribuição.
================================================================================
CM$VER      3.00.01     27/03/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.15
- Resolução da Pendência nº 21555
  Tela/Opção no Sistema: Cadastro de Contribuições do Participante
  Descrição: Atualização de dados relativos a forma de pagamento de cobrança
             sobre o 13º no cadastro de contribuições do participante.
- Resolução da Pendência nº 24383
  Tela/Opção no Sistema: Relatórios | Cobrança de contribuição (via banco)
  Descrição: Acerto na Consulta de abertura do relatório para não filtrar por
             plano e otimização da consulta.
- Resolução da Pendência nº 24516
  Tela/Opção no Sistema: Contribuições | Envio de Cobrança
  Descrição: Correção que irá identificar se o plano contábil previdenciário
             é o mesmo previdenciário. Caso não seja é questionado ao usuário
             se deseja alterar.
- Resolução da Pendência nº 22081
  Tela/Opção no Sistema: Contribuições | Envio de Cobrança | Desfazer
  Descrição: Filtro na consulta para buscar apenas as contribuições oriundas
             de evento, caso tenha marcado a opção "Enviar apenas as calculadas
             por evento ou novas inscrições".
================================================================================
CM$VER      3.00.00     16/02/2007
--------------------------------------------------------------------------------
Versão para liberação no padrão 5.10.14
- Resolução da Pendência nº 24903
  Tela/Opção no Sistema: Recebimento de Contribuição
  Descrição: Correção para se nao houve recebimento de NENUM TIPO DE contribuição
             para a Patrocinadora só então dar mensagem e passar para o próximo.
- Resolução da Pendência nº 24401
  Tela/Opção no Sistema: Controle Individual de Contribuição
  Descrição: Correção para buscar corretamente os parametros financeiros.
- Resolução da Pendência nº 24007
  Tela/Opção no Sistema: Contribuições | Controle Individual de contribuições
  Descrição: Ajuste para pergar corretamente o Código do Centro de Responsabilidade.
- Resolução da Pendência nº 23812
  Tela/Opção no Sistema: Contribuições | Recebimento de Contribuição Via Folha
  Descrição: Ajuste na busca das contribuições a serem enviadas.
- Resolução da Pendência nº 24010
  Tela/Opção no Sistema: Contribuições | Recebimento de Contribuição Via Folha
  Descrição: Ajuste para considerar corretamente o desconto via folha.
- Resolução da Pendência nº 23783
  Tela/Opção no Sistema: Contribuições | Cálculo Retroativo de Contribuições
  Descrição: Filtrar o plano escolhido na pesquisa de contribuições para revisar.
- Resolução da Pendência nº 24007
  Tela/Opção no Sistema: Contribuições | Controle Individual de Contribuições | Envio
  Descrição: Acerto para pegar corretamente o CODCENTRORESPON.
- Resolução da Pendência nº 22679
  Tela/Opçao No Sistema: Reservas | Acerto do Histórico de Reservas
  Descrição: Implementada a possibilidade de ajustar reservas em planos/patrocinadoras anteriores
  - Resolução da Pendência nº 22053
  Tela/Opção no Sistema: Contribuições | Análise de Divergências | Tratamento de divergências
  Descrição: Implementação de rotina para gravar no LOGTOTALPREV os filtros selecionados.
- Resolução da Pendência nº 20774
  Tela/Opção no Sistema: Contribuições | Preparo e Envio de contribuição
  Descrição: Mudança no filtro de contribuições (outras opçoes) para visualizar o nome todo da contribuição.
- Resolução da Pendência nº 23996
  Tela/Opção no Sistema: Envio de contribuição
  Descrição: Não atualiza a ULTMESPREPARO para 13º
================================================================================
CM$ALT}










