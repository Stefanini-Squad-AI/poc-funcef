program InvestImob;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroDetCS in '..\..\Cm\Forms\Source\FCadastroDetCS.pas' {frmCadastroDetCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  CRelCCImovelSint in 'CRelCCImovelSint.pas' {cfgRelCCImovelSint},
  CRelCCMestreAnal in 'CRelCCMestreAnal.pas' {cfgRelCCMestreAnal},
  CRelCCMestreSint in 'CRelCCMestreSint.pas' {cfgRelCCMestreSint},
  CRelListagemProposta in 'CRelListagemProposta.pas' {cfgRelListagemProposta},
  CRelMapaRC in 'CRelMapaRC.pas' {cfgRelMapaRC},
  CRelMapaRI in 'CRelMapaRI.pas' {cfgRelMapaRI},
  CRelMapaRM in 'CRelMapaRM.pas' {cfgRelMapaRM},
  CRelMapaTAXA in 'CRelMapaTAXA.pas' {cfgRelMapaTAXA},
  CRelCCImovelAnal in 'CRelCCImovelAnal.pas' {cfgRelCCImovelAnal},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  dRelInvestImob in 'dRelInvestImob.pas' {dtmRelInvestImob},
  dRelAdminImobRentab in 'dRelAdminImobRentab.pas' {dtmRelAdminImobRentab},
  dRelAdminImobContab in 'dRelAdminImobContab.pas' {dtmRelAdminImobContab},
  FCadImovelXBem in 'FCadImovelXBem.pas' {frmCadImovelXBem},
  FEstornaDesmembraObra in 'FEstornaDesmembraObra.pas' {frmEstornaDesmembraObra},
  FExecDesmembramento in 'FExecDesmembramento.pas' {frmExecDesmembramento},
  FParamInvestImob in 'FParamInvestImob.pas' {frmParamInvestImob},
  RCustoContabil in 'RCustoContabil.pas' {frmRelCustoContabil},
  FExecAquisicaoVista in 'FExecAquisicaoVista.pas' {frmExecAquisicaoVista},
  FCadParamRecDes in 'FCadParamRecDes.pas' {FrmCadParamRecDes},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FExecAcrescimoNovo in 'FExecAcrescimoNovo.pas' {frmExecAcrescimoNovo},
  fExecExcluiLanc in 'fExecExcluiLanc.pas' {frmExecExcluiLanc},
  FExecAlienacaoVista in 'FExecAlienacaoVista.pas' {frmExecAlienacaoVista},
  FCadObrasCAF in 'FCadObrasCAF.pas' {frmCadObraCAF},
  FExecEncerraObra in 'FExecEncerraObra.pas' {frmExecEncerraObra},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FEstornaEncerraObra in 'FEstornaEncerraObra.pas' {frmEstornaEncerraObra},
  FExecReavaliacao in 'FExecReavaliacao.pas' {frmExecReavaliacao},
  FEstornaReavaliacao in 'FEstornaReavaliacao.pas' {frmEstornaReavaliacao},
  RCustoFinanceiro in 'RCustoFinanceiro.pas' {frmRelCustoFinanceiro},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  dRelSaldoImovel in '..\FontesMT\dRelSaldoImovel.pas' {dtmRelSaldoImovel},
  uCtrlRptInvestImob in '..\CtrlObjects\uCtrlRptInvestImob.pas',
  uCtrlRelInvestImob in '..\CtrlObjects\uCtrlRelInvestImob.pas',
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  cRelSaldoImovel in '..\FontesMT\cRelSaldoImovel.pas' {cfgRelSaldoImovel},
  dRelBalCaf in 'dRelBalCaf.pas' {dtmRelBalCaf},
  fParamSldCtbImovel in 'fParamSldCtbImovel.pas' {frmParamSldCtbImovel},
  fParamSldCtbImoMestre in 'fParamSldCtbImoMestre.pas' {frmParamSldCtbImoMestre},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fAjustaImoRefer2 in 'fAjustaImoRefer2.pas' {frmAjustaImoRefer2},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fAjustaLancImplantacao in 'fAjustaLancImplantacao.pas' {frmAjustaLancImplantacao},
  FEstornaDesmembramento in 'FEstornaDesmembramento.pas' {frmEstornaDesmembramento},
  fExecDesmembraObra in 'fExecDesmembraObra.pas' {frmExecDesmembraObra},
  fConsultMovimCAF in 'fConsultMovimCAF.pas' {frmConsultMovimCAF},
  FCadObraLancDespesa in 'FCadObraLancDespesa.pas' {frmCadObraLancDespesa},
  FCadObraLancReceita in 'FCadObraLancReceita.pas' {frmCadObraLancReceita},
  cRelReavalia in '..\FontesMT\cRelReavalia.pas' {cfgRelReavalia},
  dRelReavalia in '..\FontesMT\dRelReavalia.pas' {dtmRelReavalia},
  dRelObra in '..\FontesMT\dRelObra.pas' {dtmRelObra},
  cRelObra in '..\FontesMT\cRelObra.pas' {cfgRelObra},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  CRelMapaSeg in 'CRelMapaSeg.pas' {cfgRelMapaSeg},
  cRelInvestPPatroPart in '..\FontesMT\cRelInvestPPatroPart.pas' {cfgRelInvestPPatroPart},
  dRelInvestPPatroPart in '..\FontesMT\dRelInvestPPatroPart.pas' {dtmRelInvestPPatroPart},
  CRelMapaTIR in '..\FontesMT\CRelMapaTIR.pas' {cfgRelMapaTIR},
  uCtrlMapaTIR in '..\CtrlObjects\uCtrlMapaTIR.pas',
  dRelMapaTIR in '..\FontesMT\dRelMapaTIR.pas' {dtmRelMapaTIR},
  fParamCtaMovGrp in 'fParamCtaMovGrp.pas' {frmParamCtaMovGrp},
  cRelTIRPorProjeto in '..\FontesMT\cRelTIRPorProjeto.pas' {cfgRelTIRPorProjeto},
  dRelTIRPorProjeto in '..\FontesMT\dRelTIRPorProjeto.pas' {dtmRelTIRPorProjeto},
  fMTReconstroiSaldoCAF in '..\FontesMT\fMTReconstroiSaldoCAF.pas' {frmMTReconstroiSaldoCAF},
  fMTCadGrupoContabCAF in '..\FontesMT\fMTCadGrupoContabCAF.pas' {frmMTCadGrupoContabCAF},
  uCtrlRemembramento in '..\CtrlObjects\uCtrlRemembramento.pas',
  FExecRemembramento in '..\FontesMT\FExecRemembramento.pas' {frmExecRemembramento},
  FEstornaRemembramentoMT in '..\FontesMT\FEstornaRemembramentoMT.pas' {frmEstornaRemembramentoMT},
  fParamSldCtbMestrePPatro in 'fParamSldCtbMestrePPatro.pas' {frmParamSldCtbMestrePPatro},
  FEstornaTransferencia in 'FEstornaTransferencia.pas' {frmEstornaTransferencia},
  fMTUtilAjustaImplantaImob in '..\FontesMT\fMTUtilAjustaImplantaImob.pas' {frmMTUtilAjustaImplantaImob},
  fMTConsultSaldoContabBemCAF in 'fMTConsultSaldoContabBemCAF.pas' {frmMTConsultSaldoContabBemCAF},
  rCAFCadBemImob in '..\FontesMT\rCAFCadBemImob.pas' {RptCAFCadBemImob},
  CRelMapaCota in '..\FontesMT\CRelMapaCota.pas' {cfgRelMapaCota},
  uCtrlMapaCota in '..\CtrlObjects\uCtrlMapaCota.pas',
  fExecIniDep in '..\FontesMT\fExecIniDep.pas' {frmExecIniDep},
  FEspera in 'FEspera.pas' {frmEspera},
  FExecAltAp in '..\FontesMT\FExecAltAp.pas' {frmExecAltAp},
  uDbRentabImob in '..\DbObjects\uDbRentabImob.pas',
  FExecBaixaBem in '..\FontesMT\FExecBaixaBem.pas' {frmExecBaixaBem},
  FWizardMT in '..\FontesMT\FWizardMT.pas' {frmWizardMT},
  FexecRetificaReaval in '..\FontesMT\FexecRetificaReaval.pas' {frmExecRetificaReaval},
  FExecDesfazRetificacao in '..\FontesMT\FExecDesfazRetificacao.pas' {frmExecDesfazRetificacao};

{$R *.RES}
{$R INVESTIMOB_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Investimentos Imobiliários';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmEspera, frmEspera);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TdtmRelBalCaf, dtmRelBalCaf);
  Application.CreateForm(TdtmRelInvestPPatroPart, dtmRelInvestPPatroPart);
  Application.CreateForm(TdtmRelTIRPorProjeto, dtmRelTIRPorProjeto);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Investimentos Imobiliários
================================================================================
CM$VER      3.02.18f    18/04/2008
--------------------------------------------------------------------------------
- Retificação de Reavaliação
  Melhoria da explicação da mensagem exibida no caso de exceção do processo.
================================================================================
CM$VER      3.02.18e    27/03/2008
--------------------------------------------------------------------------------
- Pendencia 27639: Desmembramento e Remembramento
  Ajuste na geração de placa nos processos de desmembramento e remembramento 
  de imóveis, para contemplar, de forma correta, quando não for obrigatório sua numeração
================================================================================
CM$VER      3.02.18d    17/03/2008
--------------------------------------------------------------------------------
- Pendência 27573: Ajuste dos Helps do sistema.
================================================================================
CM$VER      3.02.18c    12/03/2008
--------------------------------------------------------------------------------
- Pendência 27573: Ajuste dos Helps do sistema.
================================================================================
CM$VER      3.02.18b    04/03/2008
--------------------------------------------------------------------------------
- Pendência 27496: Relatório Patrimonial de Imóveis por Plano x Patro
  Aumento do tamanho das casas decimais do Fator.
- Pendência 27213: Encerramento de Obras e Relatórios
  Ajuste no processo de Encerramento de Obras para armazenar também o Tipo de
  Imóvel anterior.
================================================================================
CM$VER      3.02.18a    30/01/2008
--------------------------------------------------------------------------------
Relatório Patrimonial Analítico e Sintético
  Pendência: 27316 - Passa a desconsiderar obras encerradas no mesmo dia da emissão
                     do relatório.
Retificação de Reavaliação
  Pendencia: 22757 - Criação das telas para efetuar os processos de retificação
                     de reavaliação e desfazer retificação de reavaliação.
================================================================================
CM$VER      3.02.18     22/01/2008
--------------------------------------------------------------------------------
Relat. Patrimonial Sintético
  Pendência: 27187 - Ajuste do relatório passando a considerar os imóveis / conjuntos
                     alocados aos bens na data de emissão do relatório. Correção do valor de
                     obra, passando considerar valores de obras encerradas com data posterior
                     a emissão do relatório.
Desmembramento e Remenbramento de Imóveis
  Pendência: 27080 - Ajuste no processo de numeração de placas, respeitando o
                     parâmetro de tipo de numeração informado no grupo do imóvel.
Cadastro de Dados de Obras
  Pendência: 27014 - Ajuste no processo de associação de imóveis à obra passando
                     a considerar apenas os bens ainda vigentes.
Cadastro de Tipo de Evento
  Pendência: 26794 - Implementação do cadastro de Tipo de Evento.
Desfazer Encerramento de Obra
  Pendência: 26611 - Correção dos erros na tela para Desfazer Encerramento de
                     Obra.
Reavaliação de Imóveis
  Pendência: 24933 - Restrição do campo de observação do evento para 2000
                     caracteres.
================================================================================
CM$VER      3.02.17c    01/11/2007
--------------------------------------------------------------------------------
Reavaliação de imóveis
  - Ajuste do processo de importação da reavaliação, quando da
    reavaliação com valor zero para todos os bens do imóvel.
================================================================================
CM$VER      3.02.17b    29/10/2007
--------------------------------------------------------------------------------
Relatório Patrimonial Analítico
  Pendência: 26711 - Implementação de opção de ordenação dos dados exibidos por
                     Nome do Imóvel ou Código do Imóvel.
Tela Principal
  Pendência: 26639 - Passa a chamar a nova tela de Cadastro de Dados Complementares
                     por Imóvel.
Alteração de AP
  Pendência: 26625 - Correção do processo de gravação das alterações na tela de
                     Alteração de AP.
================================================================================
CM$VER      3.02.17a    24/10/2007
--------------------------------------------------------------------------------
- Pendencia 26681: Desmembramento e Remembramento
  Ajuste no processo de numeração de placa
================================================================================
CM$VER      3.02.17     15/08/2007
--------------------------------------------------------------------------------
- Liberação do padrão 17
================================================================================
CM$VER      3.02.16g    01/11/2007
--------------------------------------------------------------------------------
Reavaliação de imóveis
  Pendência: 24933 - Ajuste do processo de importação da reavaliação, quando da
                     reavaliação com valor zero para todos os bens do imóvel.
================================================================================
CM$VER      3.02.16f    26/10/2007
--------------------------------------------------------------------------------
Relatório Patrimonial Analítico
  Pendência: 26711 - Implementação de opção de ordenação dos dados exibidos por
                     Nome do Imóvel ou Código do Imóvel.
Tela Principal
  Pendência: 26639 - Passa a chamar a nova tela de Cadastro de Dados Complementares
                     por Imóvel.
Alteração de AP
  Pendência: 26625 - Correção do processo de gravação das alterações na tela de
                     Alteração de AP.
================================================================================
CM$VER      3.02.16e    24/10/2007
--------------------------------------------------------------------------------
- Pendencia 26681: Desmembramento e Remembramento
  Ajustado o processo de numeração de placa.
================================================================================
CM$VER      3.02.16d    12/09/2007
--------------------------------------------------------------------------------
Pendencia 26247: Consultas / Rentabilidade / TIR / Mapa Gerencial
   Acerto no relatório para demonstrar de forma correta as ultimas reavaliações.
================================================================================
CM$VER      3.02.16c    10/09/2007
--------------------------------------------------------------------------------
Pendencia 26230 - Relatorio de Rentabilidade - Cotas - Mapa Gerencial:
    Os valores de rcebimento passam a ser lançados nas datas respectivas as suas baixas.
    O valor recebido passa a ser abatido do valor do ativo
    Acerto nos totalizadores
    O relatório não permite selecionar periodo de emissão que não possua cotação cadas-
    trada para o índice selecionado.
================================================================================
CM$VER      3.02.16b    30/08/2007
--------------------------------------------------------------------------------
Configuração de Relatórios
  Pendência: 26239 - Disponibilização de relatórios em 3 camadas para parametrização
                     de layout pelo usuário.
================================================================================
CM$VER      3.02.16a    30/07/2007
--------------------------------------------------------------------------------
Sistema / Configuração / Parâmetros do Sistema
   Pendencia 25138:  Não permite gravar Forma de Cobrança desativada
================================================================================
CM$VER      3.02.16     23/07/2007
--------------------------------------------------------------------------------
Transferência de Tipos de Imóveis
  Pendência: 25935 - Correção na verificação da Data de Lançamento do(s) Imóvel(s)
                     selecionado(s) onde estava fazendo a verificação com base na Data de
                     Vencimento.
Relatorio de Rentabilidade por Cota
  Pendencia: 25600 - Ajuste na demonstração do valor da reavaliação buscando
                     o valor de aquisição para imoveis nunca reavaliados.
                   - Exclusão de imoveis relacionados a fundo imobiliário.
Relatorio de Reavaliações
  Pendencia: 25390 - Acerto no relatório para demonstrar as reavaliacoes dos imoveis
                     transferidos conforme o segmento do mesmo antes da transferencia.
Cadastros e Lançamentos
  Pendência: 25138 - Implementação de filtro para exibir apenas as formas de pagamento
                     ativas.
================================================================================
CM$VER      3.02.15a    21/05/2007
--------------------------------------------------------------------------------
Pendência: 24085 - Ajustes na tela de Desfazer Transferência de Tipo de Imóvel para
                   refletir também na Unidade.
================================================================================
CM$VER      3.02.15     04/04/2007
--------------------------------------------------------------------------------
- Liberação do padrão 15
- Pendencia 16989: Consulta Custo Contábil por Imóvel - Implementada a possibilidade de
   simulação do valor contábil para um período posterior ao último fechamento
- Pendencia 24706: Criacao de tela para baixa individual de bem
================================================================================
CM$VER      3.02.14d    23/04/2007
--------------------------------------------------------------------------------
Baixa Invidual de Bens - Correção do processo de busca do bem, quando não é utilizado placa para o bem
================================================================================
CM$VER      3.02.14c    19/04/2007
--------------------------------------------------------------------------------
- Pendencia 24706: Criacao do processo de baixa individual de bem
================================================================================
CM$VER      3.02.14b    18/04/2007
--------------------------------------------------------------------------------
Simulação de Saldo Contábil
  Pendencia: 16989 - Consulta Custo Contábil por Imóvel - Implementada a possibilidade
                     de simulação do valor contábil para um período posterior ao último
                     fechamento.
================================================================================
CM$VER      3.02.14a    13/03/2007
--------------------------------------------------------------------------------
Rentabilidade gerencial por Cotas
 - Correção na busca da movimentação quando não existir reavaliação para a unidade.
================================================================================
CM$VER      3.02.14     16/02/2007
--------------------------------------------------------------------------------
- Pendencia 24000: Reestruturação interna dos módulos do Imobiliário
- Pendencia 24038: Cadastro de Localizações - ajuste na visualização
                   do centro de custo cadastrado
- Pendencia 23821: Cadastro de Grupo de Imóveis - Ajuste no calculo do rateio
                   quando exclusão de algum imovel do grupo
- Pendencia 23178: Movimentações / Consultar - Excluir: O campo OBSERVACAO
                   passa a demonstrar todos os processos digitados no InvestImob
- Pendencia 22815: Alteração de AP - Permite alteração da AP gerada pelo InvestImob,
                   principalmente a data de vencimento.
================================================================================
CM$VER      3.02.13f    26/04/2007
--------------------------------------------------------------------------------
Relatório Patrimonial de Imoveis (Sintetico)
  Pendência: 25186 - Acerto no Relatorio patrimonial de Imoveis (Sintetico),
                     quando ocorre transferencia de bens.
================================================================================
CM$VER      3.02.13e    23/04/2007
--------------------------------------------------------------------------------
Baixa Individual de Bens
   - Correção do processo de busca do bem, quando não é utilizado placa para o bem.
================================================================================
CM$VER      3.02.13d    19/04/2007
--------------------------------------------------------------------------------
- Pendencia 24706: Criação do processo de baixa individual de bem
================================================================================
CM$VER      3.02.13c    28/03/2007
--------------------------------------------------------------------------------
Reavaliação Patrimonial
   - Ajuste no tratamento de abertura de transações quando da inclusão de novos bens.
================================================================================
CM$VER      3.02.13b    31/01/2007
--------------------------------------------------------------------------------
Reestruturação interna de bibliotecas para o padrão 5.10.14
================================================================================
CM$VER      3.02.13a    16/01/2007
--------------------------------------------------------------------------------
Acréscimo de Valores
  Pend 24206 - Envio do Centro de Custos definido na AP para o módulo de Contas a Pagar
================================================================================
CM$VER      3.02.13     07/12/2006
--------------------------------------------------------------------------------
Liberação do padrão 13.
Relatório de Rentabilidade
   Pend 23907 - Implementação de novo relatório de Rentabilidade pelo método de Cotas
================================================================================
CM$VER      3.02.12b    16/01/2007
--------------------------------------------------------------------------------
Acréscimo de Valores
  Pend 24206 - Envio do Centro de Custos definido na AP para o módulo de Contas a Pagar
================================================================================
CM$VER      3.02.12a    07/12/2006
--------------------------------------------------------------------------------
- Pendencia 23580: Acerto no relatório de patrimonial de imóveis (sintético) 
  para demonstrar de forma correta as transferências conforme o período informado
================================================================================
CM$VER      3.02.12     15/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 12.
================================================================================
CM$VER      3.02.11     28/07/2006
--------------------------------------------------------------------------------
Remembramento
   Pend.: 21124 - Correção na hora de carregar o filtro do MontaSelect.
Aquisição à Vista
   Pend.: 22290 - Implementação da opção para depreciar a partir da data de aquisição do imóvel;
                         Implementação da tela para definir a data de início da depreciação do imóvel.
================================================================================
CM$VER      3.02.10     12/07/2006
--------------------------------------------------------------------------------
Relatório Patrimonial de Imóveis - Analítico
   Pend. 21097 - Implementação do filtro por Imóvel além do Imóvel Mestre.
================================================================================
CM$VER      3.02.09c    30/06/2006
--------------------------------------------------------------------------------
Rentabilidade
   - Implementação de novo relatório gerencial de rentabilidade baseado no calculo de Cotas
================================================================================
CM$VER      3.02.09b    05/06/2006
--------------------------------------------------------------------------------
- Recompilação da versão no padrão 9 para contemplar a pendência 22291
================================================================================
CM$VER      3.02.09a    16/05/2006
--------------------------------------------------------------------------------
- Recompilação da versão no padrão 9 para contemplar a pendência 22334 
  liberada na versão 3.02.08f
================================================================================
CM$VER      3.02.09     16/05/2006
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.09
Reavaliação de Imóveis
    Pend 21509 - Correção do processo de contabilização da depreciação pro-rata quando
                         a reavaliação for efetuada no último dia do mês.
Depreciação Pro-Rata - Transferência de Imóveis
    Pend 21693 - Correção do arredondamento do rateio por centro de custos do valor
                        depreciado no momento da transferência do imóvel de segmento.
Consulta do TIR por projeto
    Pend 22126 - Passa a exibir na TIR por projeto também os imóveis inativos.
Rentabilidade por seguimento
    Pendência 22138 - Correção do valor da última reavaliação com base no valor
                                histórico.
================================================================================
CM$VER      3.02.08f    16/05/2006
--------------------------------------------------------------------------------
- Pendencia 22334: Acerto no relatório patrimonial de imóveis analítico, 
                             para que os filtros sejam inicializados a cada vez que entrar na tela 
                             de filtros do relatório
================================================================================
CM$VER      3.02.08e    11/05/2006
--------------------------------------------------------------------------------
- Pendencia 22291: Acerto no relatório Patrimonial de Imóveis Sintético, 
                             pois os totalizadores não estavam de acordo
================================================================================
CM$VER      3.02.08d    28/04/2006
--------------------------------------------------------------------------------
Rentabilidade por seguimento
    Pendência 22138 - Correção do valor da última reavaliação com base no valor
                                histórico.
================================================================================
CM$VER      3.02.08c    24/04/2006
--------------------------------------------------------------------------------
Pendencia 19884 - Acerto na implementação de numeração única e automática dos 
                            imóveis (IMOCODIGO), seguindo também a padronização nas placas 
                            dos bens.
================================================================================
CM$VER      3.02.08b    17/04/2006
--------------------------------------------------------------------------------
- Pendencia 22035: Acerto no Relatório Patrimonial de Imóveis - Sintético, 
  para contemplar transferência de grupo de imovel
================================================================================
CM$VER      3.02.08a    06/03/2006
--------------------------------------------------------------------------------
Compatibilização com CMRegraObj50.bpl
================================================================================
CM$VER      3.02.08     04/02/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 8
Pend 19014 - Correção de Coluna inválida ao gerar o relatório de rentabilidade
Pend 19167 - Criação do relatório de bens patrimoniais imobiliários
Pend 19936 - Cadastro de imóveis - Ao alterar o nome do imóvel ,alterar também o nome dos bens
Pend 20311 - Reavaliação Patrimonial - Permitir reavaliar com zero sem baixar o imovel
Pend 20483 - Relat. Patrimonial analítico - Inclusão do total geral da carteira
Pend 20629 - Relat. Patrimonial Analítico e Sintético - Correção da mensagem que falta parâmetro de data
Pend 20693 - Relat. Patrimonial - Inclusão do valor de aquisição quando imovel em obras
Pend 20830 - Relat. TIR - por Projeto - Correção da busca do valor de imóvel próprio
Pend 21055 - Relat. Patrimonial Analítico e Sintético - Inclusão de filtro de Apenas bens com Saldo
Pend 21056 - Alienação a Vista - Inclusão de check box permitindo selecionar os bens a serem baixados
Pend 21411 - Relat. Rentabilidade por Segmento - Alteração da formatação dos campos
                     numéricos negativos para sinal ao invés de ( )
================================================================================
CM$VER      3.02.07f    19/12/2005
--------------------------------------------------------------------------------
- Ajuste na tela de Ajuste de Implantação
================================================================================
CM$VER      3.02.07e    05/12/2005
--------------------------------------------------------------------------------
- Pendencia 20830: TIR do Projeto - Correção da busca do valor de desembolso inicial 
                                                      para imóveis de uso próprio
================================================================================
CM$VER      3.02.07d    22/11/2005
--------------------------------------------------------------------------------
- Pendencia 20693: Rel. patrimonial Sintetico-Inclusao do valor de custo de aquisicao para imoveis em construcao
================================================================================
CM$VER      3.02.07c    18/11/2005
--------------------------------------------------------------------------------
- Pendencia 20749: Alteração na rotina de ajuste de saldo, permitindo alterar bens baixados com saldo diferente de zero
================================================================================
CM$VER      3.02.07b    03/11/2005
--------------------------------------------------------------------------------
- Pendência 19936: Alterar o nome do imóvel ou mestre, nome dos bens e conjuntos relacionados. Relacionada a pendência 19903 do AdminImob
================================================================================
CM$VER      3.02.07a    11/10/2005
--------------------------------------------------------------------------------
Rentabilidade por imóvel mestre e por contrato
  - Correção da busca do valor contábil conforme nova estrutura do CAF.
================================================================================
CM$VER      3.02.07     05/09/2005
--------------------------------------------------------------------------------
Consulta Contábil por Bem
   - Alteração da sequência de exibição do Grupo Contábil no botão Procurar
Pendencia 19008
  - Consulta saldo contábil do Bem - Inclusão da procura pelo mestre, imovel e 
    código. 
================================================================================
CM$VER      3.02.03     05/08/2005
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.06
================================================================================
CM$VER      3.02.02c    12/05/2005
--------------------------------------------------------------------------------
Relatório de Reavaliação
  - Alteração do Relatório, incluindo valores de vida útil, saldo exitente antes
    da reavaliação com a devida variação.
  - Inclusão dos valores por individuais por bem e quebra por segmento
  - Relação dos imóveis não reavaliados no exercício 
================================================================================
CM$VER      3.02.02a    15/04/2005
--------------------------------------------------------------------------------
Relatório Patrimonial de Imóveis - Analítico e Sintético
  - Implementado o filtro por tipo de imóvel (segmento)
================================================================================
CM$VER      3.02.02     10/04/2005
--------------------------------------------------------------------------------
Imoveis - Desfazer Transferência
   - Implementada a operação para desfazer a transferência do imóvel
================================================================================
CM$VER      3.02.01b    05/04/2005
--------------------------------------------------------------------------------
Relatórios - TIR por projeto
   - Inclusão do indice de correção utilizado para calculo da VPL
================================================================================
CM$VER      3.02.01     01/04/2005
--------------------------------------------------------------------------------
Remembramento
   - Implementação do processo de remembramento de imóveis
================================================================================
CM$VER      3.02.00     25/02/2005
--------------------------------------------------------------------------------
Conversão do sistema conforme novo modelo do CAF
================================================================================
CM$VER      3.01.11e    26/02/2005
--------------------------------------------------------------------------------
Consulta - Rentabilidade - TIR por Projeto
  - Correção do valor da última reavaliação demonstrada no fluxo
================================================================================
CM$VER      3.01.11d    22/02/2005
--------------------------------------------------------------------------------
Consulta - Rentabilidade - TIR por Projeto
  - Alteração do Relatório, demonstrando o fluxo de valores utilizados para o
    calculo da TIR
================================================================================
CM$VER      3.01.11c    24/01/2005
--------------------------------------------------------------------------------
Movimentação - Imóveis - Desfazer Depreciação
  - Alteração do caminho do arquivo de log gerado, evitando a gravação no 
    diretório raiz.
    Novo caminho: C:\Documents and Settings\MaquinaUsuario\Configurações 
                     locais\Temp
================================================================================
CM$VER      3.01.11b    03/01/2005
--------------------------------------------------------------------------------
Consulta - Rentabilidade Gerencial
  - Inclusão das receitas de imóveis próprios sem registro financeiro
================================================================================
CM$VER      3.01.11a    19/12/2004
--------------------------------------------------------------------------------
Consulta - Rentabilidade por Projeto
  - Correção do calculo da TIR e VPL
================================================================================
CM$VER      3.01.11     15/12/2004
--------------------------------------------------------------------------------
Consulta - Rentabilidade
  - Implementação de Relatório de rentabilidade pelo método TIR, por segmento
    gerencial/SPC analítico por empreendimento e consolidado da carteira, de-
    monstrando a rentabilidade nominal, real e atuarial mensal e anual.
  - Implementação de Relatório de rentabilidade do Projeto pelo método TIR
    analítico por empreendimento, corrigido por 2 indices diferenciados, demonstrando
    também o Valor Presente Líquido e o Pay Back do projeto.
Relatórios
  - Implementação de Relatório de parametrização contábil
================================================================================
CM$VER      3.01.10     17/08/2004
--------------------------------------------------------------------------------
Parâmetros do Sistema
  - Inclusão de parâmetro indicador de impressão de logotipo nos relatórios
Relatórios
  - Implementação de Relatório de Bens Patrimoniais por Plano e Patrocinadora
================================================================================
CM$VER      3.01.09     22/06/2004
--------------------------------------------------------------------------------
Liberação do padrão 5.10.04
================================================================================
CM$VER      3.01.08c    27/05/2004
--------------------------------------------------------------------------------
Exclusão de Lançamentos
  - Correção do processo de exclusão utilizando o ID do lançamento
================================================================================
CM$VER      3.01.08b    20/05/2004
--------------------------------------------------------------------------------
Cadastros
  - Incorporação dos cadastros de parametrização do CAF relativo a Imóveis
================================================================================
CM$VER      3.01.08     14/04/2004
--------------------------------------------------------------------------------
Rentabilidade
  - Implementação da Consulta / Relatório de rentabilidade por segmento de imóvel
================================================================================
CM$VER      3.01.06b    01/12/2003
--------------------------------------------------------------------------------
Lançamentos de despesas em Obras
  - Inclusão do botão Alterar, permitindo a alteração do lançamento mantendo o mesmo nr. da AP.
================================================================================
CM$VER      3.01.06     24/11/2003
--------------------------------------------------------------------------------
Lançamentos em Obras
  - A data de emissão do documento financeiro passa a ser igual a data do lançamento
  - Inclusão no documento financeiro da referência da planilha contábil gerada pelo CAF 
Consulta Saldo Contábil por imóvel
  - Melhora de Performance
================================================================================
CM$VER      3.01.05c    05/09/2003
--------------------------------------------------------------------------------
Lançamentos de Receitas em Obras
  - Possibilidade de informar o grupo contábil para alocação do lançamento  
Lançamentos de Despesas em Obras
  - Possibilidade de informar o Nr. da AP
Reavaliação
  - Inclusão do processamento para reavaliação de imóveis em construção
Relatórios Patrimoniais
  - Inclusão do saldo de lançamento em obras
================================================================================
CM$VER      3.01.05     13/08/2003
--------------------------------------------------------------------------------
Utilização da BPL: CMImobiliarioObj50.bpl
Lançamentos de Despesas em Obras
  - Possibilidade de informar o grupo contábil para alocação do lançamento
================================================================================
CM$VER      3.01.04b    29/07/2003
--------------------------------------------------------------------------------
Reavaliação de imóveis
  - Possibilidade de criação e baixa de bens durante o processo, quando 
    definido nos parâmetros do sistema
Parâmetros do Sistema
  - Inclusão da guia "Processos", com parâmetros para a reavaliação
================================================================================
CM$VER      3.01.04     27/06/2003
--------------------------------------------------------------------------------
Relatórios
  - Implementação de Relatório de Variação entre Reavaliações
================================================================================
CM$VER      3.01.03f    30/05/2003
--------------------------------------------------------------------------------
Relatórios
  - Alteração do nome dos balancetes para relatórios
================================================================================
CM$VER      3.01.03e    28/05/2003
--------------------------------------------------------------------------------
Acréscimo de Valores
  - implementação de mult-seleção na inclusão de imóveis
  - Ajuste no processo, evitando que os imóveis já incluídos sejam excluídos ao retornar
    o processo na tela inicial
Acréscimo de Valores
  - Registro de Evento no cadastro de imóveis
================================================================================
CM$VER      3.01.03c    17/04/2003
--------------------------------------------------------------------------------
Implementação da funcionalidade de Lançamento de Receitas para Obras ( ex. devolução de Aportes )
Parâmetros do Sistema
  - Criação de tabela exclusiva de Parâmetros para o Módulo, separada do Adminimob
Acréscimo de Valores
  - Implementação do Rateio do valor do acréscimo pelo Saldo contábil dos bens relacionados,
    quando clicar no botão Atualizar.
Consulta / Exclusão de Lançamentos
  - Inclusão de consulta por imóvel e código do imóvel 
================================================================================
CM$VER      3.01.03b    14/04/2003
--------------------------------------------------------------------------------
Desmembramento de Obras
  - Incluida a possibilidade de alterar o nome do terreno desmembrado
Consulta de Movimentação de Bens
  - Inclusão de consulta por imóvel e código do imóvel  
================================================================================
CM$VER      3.01.03a    02/04/2003
--------------------------------------------------------------------------------
- Implementação de processo para Desmembramento de Obras
================================================================================
CM$VER      3.01.03     17/03/2003
--------------------------------------------------------------------------------
Liberação do arquivo de HELP do Sistema
Alienação a Vista
  - Agilidade no processo de baixa por Imovel Mestre
================================================================================
CM$VER      3.01.02f    23/12/2002
--------------------------------------------------------------------------------
- Atualização do processo de Depreciação conforme CAF
================================================================================
CM$VER      3.01.02e    07/11/2002
--------------------------------------------------------------------------------
Implementação em 3 camadas:
  - Cadastro de Imóveis
      Principais alterações: Layout
                             Manutenção de eventos e dados complementares na própria tela
                             Formatação de descrição e observações pelo menu PopUp
                             Auto-Detecção de URL na descrição e observação
                             Registro automático de evento na alteração de Valor de Mercado
                             Bloqueio de alteração da situação do imóvel, valor de compra e
                             última reavaliação, quando utilizar o Investimob ( definido no
                             parâmetro do módulo ).
================================================================================
CM$VER      3.01.02d    03/10/2002
--------------------------------------------------------------------------------
Integração de Lançamentos
  - Ignorar a integração contábil / financeira para os tipos de lançamento com a
    opção de integração com o contas a pagar desmacado na parametrização.
Rentabilidade - Taxa de Retorno
  - Correção para exibir os imóveis desocupados ( os que nunca tiveram contrato não estavam
    sendo exibidos ).  
Implementação em 3 camadas:
  - Cadastro de Administradoras
  - Cadastro de Cartórios
  - Cadastro de Compradores / Locatários
  - Cadastro de Fiadores
  - Cadastro de Proponentes / Proprietários
  - Cadastro de Responsáveis
  - Cadastro de Seguradoras
  - Cadastro de Grupo de Imóveis
================================================================================
CM$VER      3.01.02b    18/09/2002
--------------------------------------------------------------------------------
Alienação a Vista
  - Possibilidade de Seleção de alienação do imóvel mestre, rateado pelo  custo contábil
    de cada bem na data da alienação.
================================================================================
CM$VER      3.01.02a    16/09/2002
--------------------------------------------------------------------------------
Correção do rateio contábil por plano/patrocinadora.
================================================================================
CM$VER      3.01.02     12/08/2002
--------------------------------------------------------------------------------
Relatórios
  - Inclusão dos relatórios de Balancete Patrimonial de Imóveis - Sintético
  - Inclusão dos relatórios de Balancete Patrimonial de Imóveis - Analítico
Rentabilidade
  - Correção geral dos valores dos Mapas de Rentabilidade
  - Mapa de Rentabilidade por Contrato
     Inclusão da opção de exibir os imóveis desocupados
  - Taxa de Retorno
     Inclusão da opção de exibir apenas os imóveis locados
     Opção de utilizar o valor atual pela última reavaliação ou pelo valor de mercado
================================================================================
CM$VER      3.01.01d    20/06/2002
--------------------------------------------------------------------------------
--Correção do FrmProgresso
--Inclusão do default de Atividade/Projeto no cadastro de parâmetros de receitas e despesas
================================================================================
CM$VER      3.01.01c    18/06/2002
--------------------------------------------------------------------------------
Correções nos DBObjects para mudanças do padrão.
================================================================================
CM$ALT}




























































































































































