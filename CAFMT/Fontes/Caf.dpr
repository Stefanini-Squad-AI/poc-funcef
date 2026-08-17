program Caf;





uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  Fpessoa in '..\..\Cm\Forms\Source\fPessoa.pas' {frmPessoa},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  UAtivoFixo in 'UAtivoFixo.pas',
  dAtivoFixo in 'dAtivoFixo.pas' {dtmAtivoFixo},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fConsultSldContab in 'fConsultSldContab.pas' {frmConsultSldContab},
  fConsultMovim in 'fConsultMovim.pas' {frmConsultMovim},
  fMovControleTotal in 'fMovControleTotal.pas' {frmMovControleTotal},
  fMovBaixa in 'fMovBaixa.pas' {frmMovBaixa},
  fMovReavaliacao in 'fMovReavaliacao.pas' {frmMovReavaliacao},
  fMovAcrescimo in 'fMovAcrescimo.pas' {frmMovAcrescimo},
  fMovDesmembramento in 'fMovDesmembramento.pas' {frmMovDesmembramento},
  FCadastroDetalhe in 'FCadastroDetalhe.pas' {frmCadastroDetalhe},
  UVerificaPreenchimento in 'UVerificaPreenchimento.pas',
  fConsultBens in 'fConsultBens.pas' {frmConsultBens},
  fConsultSldGrp in 'fConsultSldGrp.pas' {frmConsultSldGrp},
  fMovBensPendentes in 'fMovBensPendentes.pas' {frmMovBensPendentes},
  fCadBemPendente in 'fCadBemPendente.pas' {frmCadBemPendente},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  fInvCadResultado in 'fInvCadResultado.pas' {frmInvCadResultado},
  fMovSelBaixa in 'fMovSelBaixa.pas' {frmMovSelBaixa},
  dRelCadCaf in 'dRelCadCaf.pas' {dtmRelCadCaf},
  dRelOperCaf in 'dRelOperCaf.pas' {dtmRelOperCaf},
  fMovTransfPlaca in 'fMovTransfPlaca.pas' {frmMovTransfPlaca},
  fMovSaidaTemp in 'fMovSaidaTemp.pas' {frmMovSaidaTemp},
  fMovExeSaidaTemp in 'fMovExeSaidaTemp.pas' {frmMovExeSaidaTemp},
  fMovRetSaidaTemp in 'fMovRetSaidaTemp.pas' {frmMovRetSaidaTemp},
  fConsultInvLevant in 'fConsultInvLevant.pas' {frmConsultInvLevant},
  fSelBem in 'fSelBem.pas' {frmSelBem},
  fMovSelTransf in 'fMovSelTransf.pas' {frmMovSelTransf},
  fMovTransfBem in 'fMovTransfBem.pas' {frmMovTransfBem},
  fInvProcessar in 'fInvProcessar.pas' {frmInvProcessar},
  fInvProcSelTermo in 'fInvProcSelTermo.pas' {frmInvProcSelTermo},
  fInvColPDT3100 in 'fInvColPDT3100.pas' {frmInvColPDT3100},
  fInvGeracao in 'fInvGeracao.pas' {frmInvGeracao},
  fInvColScwLucas7000 in 'fInvColScwLucas7000.pas' {frmInvColScwLucas7000},
  dRelBalCaf in 'dRelBalCaf.pas' {dtmRelBalCaf},
  fConsParamContab in 'fConsParamContab.pas' {frmConsParamContab},
  fAcertaSaldo in 'fAcertaSaldo.pas' {frmAcertaSaldo},
  fUtilExpPlacas in 'fUtilExpPlacas.pas' {frmUtilExpPlacas},
  fReconDeprecBem in 'fReconDeprecBem.pas' {frmReconDeprecBem},
  fEstornaMovimentacao in 'fEstornaMovimentacao.pas' {frmEstornaMovimentacao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fCadObra in 'fCadObra.pas' {frmCadObra},
  fMovObraLanc in 'fMovObraLanc.pas' {frmMovObraLanc},
  fEstornaObraLanc in 'fEstornaObraLanc.pas' {frmEstornaObraLanc},
  fConsultCafObra in 'fConsultCafObra.pas' {frmConsultCafObra},
  fReconDeprec in 'fReconDeprec.pas' {frmReconDeprec},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fMTCadSituacoes in '..\FontesMT\fMTCadSituacoes.pas' {frmMTCadSituacoes},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  fMTCadTipoArea in '..\FontesMT\fMTCadTipoArea.pas' {frmMTCadTipoArea},
  fMTCadTipoDespAV in '..\FontesMT\fMTCadTipoDespAV.pas' {frmMTCadTipoDespAV},
  fMTCadMotivoBaixa in '..\FontesMT\fMTCadMotivoBaixa.pas' {frmMTCadMotivoBaixa},
  fMTCadTipoSaidaTemp in '..\FontesMT\fMTCadTipoSaidaTemp.pas' {frmMTCadTipoSaidaTemp},
  fMTCadObraTipoEtapa in '..\FontesMT\fMTCadObraTipoEtapa.pas' {frmMTCadObraTipoEtapa},
  fMTCadLocalizacao in '..\FontesMT\fMTCadLocalizacao.pas' {frmMTCadLocalizacao},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fMTCadGrupoContab in '..\FontesMT\fMTCadGrupoContab.pas' {frmMTCadGrupoContab},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fMTCadResponsavel in '..\FontesMT\fMTCadResponsavel.pas' {frmMTCadResponsavel},
  fMTCadTerceiro in '..\FontesMT\fMTCadTerceiro.pas' {frmMTCadTerceiro},
  fMTCadDestinatBaixa in '..\FontesMT\fMTCadDestinatBaixa.pas' {frmMTCadDestinatBaixa},
  fMTCadClassedeBem in '..\FontesMT\fMTCadClassedeBem.pas' {frmMTCadClassedeBem},
  fMTCadParamCAFxContab in '..\FontesMT\fMTCadParamCAFxContab.pas' {frmMTCadParamCAFxContab},
  fMTCadConjunto in '..\FontesMT\fMTCadConjunto.pas' {frmMTCadConjunto},
  fMTCadParamCAF in '..\FontesMT\fMTCadParamCAF.pas' {frmMTCadParamCAF},
  fMTCadBem in '..\FontesMT\fMTCadBem.pas' {frmMTCadBem},
  fMTMovFechamento in '..\FontesMT\fMTMovFechamento.pas' {frmMTMovFechamento},
  fMTEstornaFechamento in '..\FontesMT\fMTEstornaFechamento.pas' {frmMTEstornaFechamento},
  fMovEncerrarObra in 'fMovEncerrarObra.pas' {frmMovEncerrarObra},
  DBaseDados in '..\..\Cm\Forms\Source\dBaseDados.pas' {dtmBaseDados: TDataModule},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FParamBalPatCC in '..\Reports\Source\FParamBalPatCC.pas' {frmParamBalPatCC},
  FParamBalPatClas in '..\Reports\Source\FParamBalPatClas.pas' {frmParamBalPatClas},
  FParamBalPatGrp in '..\Reports\Source\FParamBalPatGrp.pas' {frmParamBalPatGrp},
  FParamBalPatGrpAnal2 in '..\Reports\Source\FParamBalPatGrpAnal2.pas' {frmParamBalPatGrpAnal2},
  FParamBalPatGrpBx in '..\Reports\Source\FParamBalPatGrpBx.pas' {frmParamBalPatGrpBx},
  FParamCadBem in '..\Reports\Source\FParamCadBem.pas' {frmParamCadBem},
  fParamCadConjxBens in '..\Reports\Source\fParamCadConjxBens.pas' {frmParamCadConjxBens},
  fParamCafBalPatBem in '..\Reports\Source\fParamCafBalPatBem.pas' {frmParamCafBalPatBem},
  FParamCAFCadConjxRatCC in '..\Reports\Source\FParamCAFCadConjxRatCC.pas' {frmParamCAFCadConjxRatCC},
  FParamCAFInvPat in '..\Reports\Source\FParamCAFInvPat.pas' {frmParamCAFInvPat},
  rBalPatGrpAnal2 in '..\Reports\Source\rBalPatGrpAnal2.pas' {RptBalPatGrpAnal2},
  rCAFBalCC in '..\Reports\Source\rCAFBalCC.pas' {RptCAFBalCC},
  rCAFBalClasse in '..\Reports\Source\rCAFBalClasse.pas' {RptCAFBalClasse},
  rCAFBalPatBem in '..\Reports\Source\rCAFBalPatBem.pas' {RptCAFBalPatBem},
  rCAFBalPatGrp in '..\Reports\Source\rCAFBalPatGrp.pas' {RptCAFBalPatGrp},
  rCAFBalPatGrpBx in '..\Reports\Source\rCAFBalPatGrpBx.pas' {rptCAFBalPatGrpBx},
  rCAFCadBem in '..\Reports\Source\rCAFCadBem.pas' {RptCAFCadBem},
  rCAFCadClasse in '..\Reports\Source\rCAFCadClasse.pas' {RptCAFCadClasse},
  rCAFCadConjunto in '..\Reports\Source\rCAFCadConjunto.pas' {RptCAFCadConjunto},
  rCAFCadConjxBens in '..\Reports\Source\rCAFCadConjxBens.pas' {RptCAFCadConjxBens},
  rCAFCadConjxRatCC in '..\Reports\Source\rCAFCadConjxRatCC.pas' {RptCAFCadConjxRatCC},
  rCAFCadGrupo in '..\Reports\Source\rCAFCadGrupo.pas' {RptCAFCadGrupo},
  rCAFCadLocal in '..\Reports\Source\rCAFCadLocal.pas' {RptCAFCadLocal},
  rCAFInvPat in '..\Reports\Source\rCAFInvPat.pas' {rptCAFInPat},
  rCAFMovPatBem in '..\Reports\Source\rCAFMovPatBem.pas' {RptCAFMovPatBem},
  rCAFMovPatGrp in '..\Reports\Source\rCAFMovPatGrp.pas' {rptCAFMovPatGrp},
  rCAFSelBxBens in '..\Reports\Source\rCAFSelBxBens.pas' {RptCAFSelBxBens};

{$R *.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  //----------------------------------------------------------------------------
  Application.Initialize;
  Application.Title := 'Ativo Fixo';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  //----------------------------------------------------------------------------
  Application.Run;
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Controle do Ativo Fixo
================================================================================
CM$VER      3.04.01     15/01/2003
--------------------------------------------------------------------------------
Implementação da opção de remover dos bens pendentes de entrada oriundos do 
Almoxarifado os bens que foram cadastrados diretamente no Cadastro de 
Bens, por erro de procedimento.
================================================================================
CM$VER      3.04.00     14/01/2003
--------------------------------------------------------------------------------
. Implementação da contabilização por partida simples ou dobrada em todas as 
movimentações de bens, fechamento de periodo e seus respectivos estornos, de 
acordo com o parâmetro estabelecido no sistema Contabilidade.
. Implementação de metodologia mais eficiente de processamento de mensagens de erro.
. Implementação da opção de depreciação pró-rata no mesmo dia do fato gerador
na movimentação Baixa de Bens.
. Implementação das mudanças solicitadas na contabilização no submódulo de Obras,
com a seleção do Grupo Contábil sendo feita nos lançamentos e o Encerramento de Obra 
agora gera tantos bens quanto forem os Grupos Contábeis dos Lançamentos, incluindo
alterações nas consultas e relatórios.
. Implementação do parâmetro Grupo Contábil nos Bens Resultantes na movimentação
Desmembramento de Bens.
. Implementação do Parâmetro de Sistema TipoConjunto, que permite manipular
as transferências de bens de modo a evitar inconsistências.
================================================================================
CM$VER      3.03.25     17/12/2002
--------------------------------------------------------------------------------
Inclusão em todas os Cadastros e Movimentações do Sistema da
funçao de Registro de Evento na tabela que registra o Log de Operações 
de Sistemas. (CBS)
================================================================================
CM$VER      3.03.24     26/11/2002
--------------------------------------------------------------------------------
Correção do processamento das transferências no relatório 
Movimentação Analítica por Periodo.
================================================================================
CM$VER      3.03.23     13/11/2002
--------------------------------------------------------------------------------
Modificação da rotina de manipulação do Coletor de Dados SEAL PDT3100
para execução de inventário sobre WIN9x / WIN2K / WINXP. 
================================================================================
CM$VER      3.03.22     12/11/2002
--------------------------------------------------------------------------------
Correção do modo de inclusão do Cadastro de Obras
Ajuste de desempenho no Fechamento de Periodo
================================================================================
CM$VER      3.03.21     05/11/2002
--------------------------------------------------------------------------------
Alteração no Balancete Patrimonial por Bem, com a inclusão da localização,
responsável e grupo contábil, levando em consideração a data base solicitada.
Alteração no Cadastro de Rateio de Plano/Patrocinadora, com o objetivo de
melhorar a interface com o usuário.
Correção do procedimento de Remoção do Cadastro de Classes de Bens.
================================================================================
CM$VER      3.03.20     23/10/2002
--------------------------------------------------------------------------------
Inclusão do filtro de bens baixados no BALANCETE PATRIMONIAL POR
GRUPO CONTÁBIL, para compatibilizá-lo com o BALANCETE POR CLASSE.
================================================================================
CM$VER      3.03.19     22/10/2002
--------------------------------------------------------------------------------
Retificação da filtragem da tela Três Camadas de Responsáveis
================================================================================
CM$VER      3.03.18     18/10/2002
--------------------------------------------------------------------------------
Correção da rotina de calculo do saldo contábil de bem do estorno de entrada de bens.
================================================================================
CM$VER      3.03.17     17/10/2002
--------------------------------------------------------------------------------
Colocação das versões três camadas dos cadastros herdados do cadastro de
pessoa (RESPONSÁVEL, TERCEIROS e DESTINATÁRIOS DE BENS
BAIXADOS), pois o cadastro de pessoa no formato cliente/servidor não está
mais sendo atualizado e/ou corrigido.
================================================================================
CM$VER      3.03.16     11/10/2002
--------------------------------------------------------------------------------
Inclusão de opção de contabilização sintética no fechamento de periodo. A opção
anterior está na opção analítica. Implementação solicitada pela CBS como
obrigatória pela SPC (?!?).
================================================================================
CM$VER      3.03.15     04/10/2002
--------------------------------------------------------------------------------
Ajuste dos forms que usam a unit udiasuteis por causa do padrão 5.09.00
================================================================================
CM$VER      3.03.14     01/10/2002
--------------------------------------------------------------------------------
Alteração dos cadastros de pessoa, para contornar uma falha no processamento do
evento Excluir, conforme solicitação da homologação.
================================================================================
CM$VER      3.03.13     27/09/2002
--------------------------------------------------------------------------------
Acerto no processamento de moedas de depreciação ANUAL, apurado
pela homologação.
================================================================================
CM$VER      3.03.12     25/09/2002
--------------------------------------------------------------------------------
Incremento no tratamento de erro de todas as funções internas do sistema.
Inclusão do procedimento de exportação do cadastro de bens para envio a
Receita Federal segundo resolução IN86.
================================================================================
CM$VER      3.03.11     03/09/2002
--------------------------------------------------------------------------------
Inclusão do relatório BALANCETE PATRIMONIAL POR GRUPO
CONTÁBIL - ANALÍTICO, que inclui uma subtotalização das classes de bens 
associadas aos grupos contábeis.
Correção do tratamento de multi-empresas no cadastro de grupos contábeis.
================================================================================
CM$VER      3.03.10     27/08/2002
--------------------------------------------------------------------------------
Correção na rotina de calculo do rateio contábil de plano/patrocinadora nas
movimentações de bens.
================================================================================
CM$VER      3.03.09     07/08/2002
--------------------------------------------------------------------------------
Inclusão de parâmetro que retorna o id da movimentação gerada por transferência
de grupo na função EXECUTATRANSFGRUPO.
Remoção dos relatórios POSIÇÃO CONTÁBIL DE BENS IMÓVEIS - 
ANALITICO e POSIÇÃO CONTÁBIL DE BENS IMÓVEIS - SINTÉTICO,
pois eles agoram pertencem ao sistema INVESTIMOB - TOTALPREV.
================================================================================
CM$VER      3.03.08     30/07/2002
--------------------------------------------------------------------------------
Modificação da função de Reconstrução de Saldo Contábil
================================================================================
CM$VER      3.03.07     23/07/2002
--------------------------------------------------------------------------------
Ajuste na ligação com o Help On-Line
================================================================================
CM$VER      3.03.06     10/07/2002
--------------------------------------------------------------------------------
Alteração na função que executa a RECONTRUÇÃO DE SALDO CONTÁBIL
Alteração na função que executa a BAIXA de bens.
Alteração nos parâmetros do relatório BALANCETE PATRIMONIAL POR CLASSE.
================================================================================
CM$VER      3.03.05     05/07/2002
--------------------------------------------------------------------------------
Inclusão de Totalizador no BALANCETE PATRIMONIAL POR CLASSE
DE BEM.
================================================================================
CM$VER      3.03.04     27/06/2002
--------------------------------------------------------------------------------
Contorno de falha no cadastro pai (frmCadastroCS) do cadastro de conjuntos,
qdo chamado pelo cadastro de bens.
Registro dos links com o Help Online.
Ajustes de diversos relatórios para trabalharem em multi-empresa
Correção no estorno de depreciação (depreciações de acréscimos de valor)
================================================================================
CM$VER      3.03.03     18/06/2002
--------------------------------------------------------------------------------
Geração do Relatório TRANFERENCIA PATRIMONIAL POR GRUPO -
ANALÍTICO
================================================================================
CM$VER      3.03.02     17/06/2002
--------------------------------------------------------------------------------
Geração do Relatório TRANFERENCIA PATRIMONIAL POR GRUPO
================================================================================
CM$VER      3.03.01     10/06/2002
--------------------------------------------------------------------------------
Alteração do Balancete Patrimonial por Grupo
Alteração do Cadastro do Termo de Transferência
Correção da atualização do saldo contábil nas transferências
================================================================================
CM$VER      3.03.00     29/05/2002
--------------------------------------------------------------------------------
Alteração no controle do histórico das transferências de bens, envolvendo alteração
no procedimento de atualização de saldo contábil local (DELPHI) e remoto
(Oracle - Stored Procedure)
Alteração nos relatórios que possuem cálculos do saldo contábil dos bens.
================================================================================
CM$VER      3.02.25     15/05/2002
--------------------------------------------------------------------------------
Acerto na contabilização da transferência de bens
Ajuste no relatório BALANCETE PATRIMONIAL POR GRUPO - BENS BAIXADOS
================================================================================
CM$VER      3.02.24     10/05/2002
--------------------------------------------------------------------------------
Ajuste na critica de datas no processo de fechamento
Ajuste na tela de acompanhamento de progresso de transferência de bens.
Ajuste na critica a data de entrada no cadastramento de bens.
================================================================================
CM$VER      3.02.23     03/05/2002
--------------------------------------------------------------------------------
Correção na crítica aos bens baixados nas movimentações Transferência de Bens e
Baixa de Bens.
================================================================================
CM$VER      3.02.22     30/04/2002
--------------------------------------------------------------------------------
Alterações para compatibilização com o PadrãoCM 05.06.00
================================================================================
CM$VER      3.02.21     29/04/2002
--------------------------------------------------------------------------------
Ajuste na critica das datas de execução do fechamento e estorno.
================================================================================
CM$VER      3.02.20     24/04/2002
--------------------------------------------------------------------------------
Correção na critica aos módulos na movimentação CONTROLE TOTAL.
================================================================================
CM$VER      3.02.19     16/04/2002
--------------------------------------------------------------------------------
Acerto da carga de bens nos forms da Seleção para Transferência e
Seleção para Baixa.
================================================================================
CM$VER      3.02.18     09/04/2002
--------------------------------------------------------------------------------
Ajuste na critica a data de inclusão do bem no patrimônio nos casos de
cadastramento sem contabilização.
================================================================================
CM$VER      3.02.17b    05/04/2002
--------------------------------------------------------------------------------
Inclusão de critica a data de inclusão do bem no patrimônio nos casos de
cadastramento sem contabilização.
================================================================================
CM$VER      3.02.17     04/04/2002
--------------------------------------------------------------------------------
Acerto da rotina de contabilização da depreciacao da reavaliação negativa.
================================================================================
CM$VER      3.02.16     02/04/2002
--------------------------------------------------------------------------------
Ajuste na rotina de verificação de duplicidade de placas patrimoniais no
cadastro de bens
================================================================================
CM$VER      3.02.15     20/03/2002
--------------------------------------------------------------------------------
Inclusão da filtragem por grupo em Reconstroi Saldo Contábil.
================================================================================
CM$VER      3.02.14     14/03/2002
--------------------------------------------------------------------------------
Ajuste na rotina de leitura de dados de coletores de dados de levantamento de 
inventário. Ajuste na rotina de encerramento de inventário, para melhoria de 
desempenho.
================================================================================
CM$VER      3.02.12     28/02/2002
--------------------------------------------------------------------------------
Inclusão do relatório BALANCETE PATRIMONIAL POR GRUPO CONTÁBIL -
BENS BAIXADOS. (FunCEF)
Ajuste na Consulta ao Saldo Contábil dos Bens.
Ajuste na inclusão de bens mo Cadastra Resultado de Inventário.
================================================================================
CM$VER      3.02.11     20/02/2002
--------------------------------------------------------------------------------
Inclusão da opção de exportar os dados contábeis para uma tabela dbf, que pode ser
importada pelo sistema de contabilidade DOS.
================================================================================
CM$VER      3.02.10     19/02/2002
--------------------------------------------------------------------------------
Correção da rotina de alteração restrita do Cadastro de Bens.
================================================================================
CM$VER      3.02.09     05/02/2002
--------------------------------------------------------------------------------
. Inclusão de um botão no cadastrar resultado de inventário, que permite preencher a 
localização dos bens não encontrados com uma localização a parte, com a finalidade 
de facilitar a investigação das causas do desaparecimento;
. Correção dos MontaSelects do cadastro de bens para a situação de multi-empresa.
================================================================================
CM$VER      3.02.08     31/01/2002
--------------------------------------------------------------------------------
Alteração na subrotina de contabilização da depreciação, com a inclusão de
tratamento diferenciado da depreciação das reavaliações positivas e negativas,
com a criação da movimentação DEPRECIAÇÃO DA REAVALIAÇÃO
NEGATIVA. Os clientes deverão cadastrar as contas contábeis para essa
movimentação, mesmo que usem as mesmas contas para reavaliações positivas
e negativas.
================================================================================
CM$VER      3.02.07     29/01/2002
--------------------------------------------------------------------------------
Alteração na tela de Baixa de Bens
Alteração na Função de Baixa de Bens (Baixa Parcial por Valor)
Correção na Função de Estorno de Baixa de Bens (Baixa Parcial por Valor)
Correção na integração contábil das transferências de bens (Reavaliação Negativa)
================================================================================
CM$VER      3.02.06     18/01/2002
--------------------------------------------------------------------------------
Ajuste na inicialização do controle da Depreciação PróRata, com um campo 
especifico no Histórico de Movimentações.
================================================================================
CM$VER      3.02.05     10/01/2002
--------------------------------------------------------------------------------
Ajuste no Desmembramento.
Ajuste na no controle da Depreciação PróRata, com um campo especifico no
Historico de Movimentações.
================================================================================
CM$VER      3.02.04     03/01/2002
--------------------------------------------------------------------------------
. Inclusão de opção de datas da depreciação pró-rata na Reavaliação Patrimonial.
. Inclusão dos conjuntos na geração de bens no Desmembramento.
================================================================================
CM$VER      3.02.03     28/12/2001
--------------------------------------------------------------------------------
Ajuste do Relatório CADASTRO DE BENS
Ajuste do CADASTRO DE GRUPOS CONTÁBEIS 
================================================================================
CM$VER      3.02.02     21/12/2001
--------------------------------------------------------------------------------
Ajuste na Contabilização do Desmembramento
Ajuste na Contabilização do Acréscimo de Valor
Ajuste no estorno da transferencia de bens (LOCALIZACAO)
Ajuste na querie do relatório SELEÇÃO DE BENS PARA BAIXA
================================================================================
CM$VER      3.02.01     20/12/2001
--------------------------------------------------------------------------------
Ajuste na Contabilização do Desmembramento
================================================================================
CM$VER      3.02.00     16/12/2001
--------------------------------------------------------------------------------
Inclusão do controle de obras
. Cadastro de Etapas de Obras
. Cadastramento
. Lançamento de Custos
. Estorno de Lançamento de Custos
. Encerramento de Obra (com a geração de bem com o resultado)
. Consulta de Obras
. Relatório de Obras
Alteração no Reconstroi Saldo Contábil
================================================================================
CM$VER      3.01.06     11/12/2001
--------------------------------------------------------------------------------
Ajuste na função de execução de baixa de bens
Ajuste na função de estorno de acréscimo de valor em bens
================================================================================
CM$VER      3.01.05     10/12/2001
--------------------------------------------------------------------------------
Ajuste em Reconstruir Saldo Contábil, para eliminar o problema com áreas de
rollback deficientes;
Ajuste no filtragem da consulta e do relatório de resultado de levantamento de 
inventário, onde não aparecia o código 5 (Placas não Cadastradas).
================================================================================
CM$VER      3.01.04     10/12/2001
--------------------------------------------------------------------------------
Ajuste no estorno das planilhas contábeis do estorno da depreciação
================================================================================
CM$VER      3.01.03     06/12/2001
--------------------------------------------------------------------------------
Ajuste no desmembramento de bens já totalmente depreciados
================================================================================
CM$VER      3.01.02     04/12/2001
--------------------------------------------------------------------------------
Correção da subquerie de apuração de depreciação no periodo dos balancetes
patrimoniais. Ajuste na rotina de crítica a data de movimentação de bens totalmente
depreciados.
================================================================================
CM$VER      3.01.01     23/11/2001
--------------------------------------------------------------------------------
Acerto do Stored Procedure e da função cliente de atualização de Saldo Contábil;
Acerto da movimentação BAIXA DE BENS;
Acerto da movimentação DESMEMBRAMENTO;
Alteração da função de contabilização da movimentação DESMEMBRAMENTO;
Acerto do relatório CADASTRO de BENS.
================================================================================
CM$VER      3.01.00     14/11/2001
--------------------------------------------------------------------------------
Versão com a implementação das mudanças na modelagem de dados do histórico
de movimentações, com a consequente mudança em todas os procedimentos e funções
internas do núcleo do sistema, telas e relatórios. Após a execução desta versão, as
versões anteriores serão desabilitadas, por questões de incompatibilidade.
- Resolução da Pendência Nº 2777
  > Tela\Opçao No Sistema: AtivoFixo
  Alteração dos procedimentos de manipulação do histórico de movimentação,
  decorrente da alteração na modelagem de dados, com o objetivo de otimizar o
  desempenho do sistema.
================================================================================
CM$VER      3.01.00ß    13/11/2001
--------------------------------------------------------------------------------
Versão beta teste do CAF com as mudanças na modelagem de dados
================================================================================
CM$VER      3.00.23     31/10/2001
--------------------------------------------------------------------------------
Correção do relatório Conciliação entre Ativo Fixo e Contabilidade
Alteração na histórico contábil dos lançamentos de tranferência de bens
Correção no processamento de resultado de levantamento de inventário
================================================================================
CM$VER      3.00.22     11/10/2001
--------------------------------------------------------------------------------
Alteração do relatório Cadastro Patrimonial de Bens
Acerto da associação dos centros de custo aos grupos no Cadastro de Grupos Contábeis
Acerto da associação dos grupos contábeis as classes no Cadastro de Classes de Bens
================================================================================
CM$VER      3.00.21     27/09/2001
--------------------------------------------------------------------------------
Alteração do relatório Cadastro Patrimonial de Bens, com o desmembramento dos
valores contábeis de Aquisição e Reavaliação e inclusão da data da baixa do bem,
segundo solicitação da CBS.
================================================================================
CM$VER      3.00.20     25/09/2001
--------------------------------------------------------------------------------
. Acerto na Geração Automática de Placas de Patrimonio (Cadastro de Bens)
. Acerto na manipulação das datas de cadastramento de bens (Cadastro de Bens)
================================================================================
CM$VER      3.00.19     22/09/2001
--------------------------------------------------------------------------------
Ajuste nos relatórios do Imobiliario
================================================================================
CM$VER      3.00.18     27/08/2001
--------------------------------------------------------------------------------
Inclusão do relatório Movimentação Analítica no Periodo II, com layout
diferenciado.
================================================================================
CM$VER      3.00.17     17/08/2001
--------------------------------------------------------------------------------
Correção do tratamento de contabilização na tela de Cadastro de Bens
================================================================================
CM$VER      3.00.16     10/08/2001
--------------------------------------------------------------------------------
Correção do tratamento dos valores em moedas Fiscais e Gerenciais na
função de alteração no cadastro de bens.
================================================================================
CM$VER      3.00.15     06/08/2001
--------------------------------------------------------------------------------
Acerto da função que verifica se as datas de movimentação fornecidas são válidas.
================================================================================
CM$VER      3.00.14     31/07/2001
--------------------------------------------------------------------------------
Correção da forma de calculo da depreciação pro-rata. 
Correção da querie de pesquisa do ultimo fechamento realizado.
================================================================================
CM$VER      3.00.12     30/07/2001
--------------------------------------------------------------------------------
Correção na gravação dos bens do form de geração de inventário.
Mudança da querie de pesquisa do ultimo fechamento na consulta de bens.
Correção dos tratamentos de pesquisa das movimentações Acrescimo de Valor,
Reavaliação, Baixa, Controle Total, Transferencia de bens e Transferencia de Placa
Patrimonial.
Correção do tratamento do parametro SISTEMAS INSTALADOS no form de 
Parâmetros de Sistema.
Mudança no tratamento de excessões do form ESTORNA DEPRECIAÇÃO
================================================================================
CM$VER      3.00.11     18/07/2001
--------------------------------------------------------------------------------
Ajuste no retorno de erro na tela de estorno de movimentação
Ajuste no tratamento de placas grandes na geração de inventário
Ajuste das telas de RESPONSAVEIS, TERCEIROS e DESTINO DE 
BENS ALIENADOS (Mudanças no PadrãoCM - Pessoa)
Ajuste na Geração de Inventários
================================================================================
CM$VER      3.00.10     16/07/2001
--------------------------------------------------------------------------------
Ajuste no retorno de erro na tela de estorno de movimentação
Ajuste no tratamento de placas grandes na geração de inventário
================================================================================
CM$VER      3.00.09     13/07/2001
--------------------------------------------------------------------------------
Ajuste no estorno da transferencia de bens
Ajuste no estorno da baixa de bens (Seleção de Bens)
================================================================================
CM$VER      3.00.08a    05/07/2001
--------------------------------------------------------------------------------
Ajustes nas mensagens de tratamento de excessões das movimentações
================================================================================
CM$VER      3.00.08     04/07/2001
--------------------------------------------------------------------------------
Ajuste no calculo pró-rata da depreciação de bens novos.
Ajuste no estorno da transferencia de bens.
================================================================================
CM$VER      3.00.07     29/06/2001
--------------------------------------------------------------------------------
Inclusão do form RECONSTROI SALDO CONTÁBIL, que permite recalcular o 
os valores componentes do saldo contábil baseado nos valores registrados no 
Histórico de Movimentações.
Inclusão de função que alerta o usuário quando é executada uma movimentação em
periodo diferente do corrente. 
Ajuste das mensagens gravadas nas planilhas contábeis na movimentação de
transferência de bens.
Ajuste na geração automática de número de placa de patrimônio na tela de 
Cadastro de Bens.
Ajuste no método de cálculo dos valores depreciados no periodo nos balancetes 
patrimoniais.
================================================================================
CM$VER      3.00.06     21/06/2001
--------------------------------------------------------------------------------
Inclusão do relatório de bens customizável, que permite selecionar bens de 
maneira aleatória e imprimi-los. A querie do relatório permite que o layout seja 
customizado pelo cliente.
================================================================================
CM$VER      3.00.05     19/06/2001
--------------------------------------------------------------------------------
Acerto da função de estorno de lançamento contábil do form de
Cadastro de Bens.
================================================================================
CM$VER      3.00.04a    15/06/2001
--------------------------------------------------------------------------------
Modificação no processo de depreciação de bens, para melhoria no
tratamento de excessões.
Modificação no processo de estorno de depreciação de bens, para melhoria no
tratamento de excessões.
================================================================================
CM$VER      3.00.04     07/06/2001
--------------------------------------------------------------------------------
Ajuste nos relatórios contábeis de imóveis.
Ajuste dos parâmetros do form principal, para a correção do 'deslizamento' que
ocorria quando o CAF era executado em Windows 9x.
Ajuste no Estorno de Transferência de Bens.
================================================================================
CM$VER      3.00.03     21/05/2001
--------------------------------------------------------------------------------
Inclusão dos campos INTEGRAÇÃO CONTÁBIL e DATA CONTABILIZAÇÃO,
com o objetivo de permitir uma maior flexibilidade na contabilização da entrada de bens.
================================================================================
CM$VER      3.00.02     09/05/2001
--------------------------------------------------------------------------------
- Ajuste no estorno da movimentação TRANSFERÊNCIA DE BENS.
================================================================================
CM$VER      3.00.01     03/05/2001
--------------------------------------------------------------------------------
. Alteração na tela de geração de levantamento de inventários
. Correção no procedimento de Importação e Exportação de dados de inventário do
coletor de dados PDT 3100
. Inclusão de form de exportação de dados - Placas de Patrimônio
================================================================================
CM$VER      3.00.00     03/04/2001
--------------------------------------------------------------------------------
.Primeira versão do Controle do Ativo Fixo em DELPHI 5
================================================================================
CM$VER      2.07.03     16/03/2001
--------------------------------------------------------------------------------
. Melhoria na precisão do cálculo de depreciação de bens de valor baixo e
tempo de vida alto.
. Correção na filtragem do balancete patrimonial por centro de custo.
. Inclusão de crítica de data no movimento de reavaliação.
================================================================================
CM$VER      2.07.02     05/03/2001
--------------------------------------------------------------------------------
. Aumento da segurança na execução dos processos de depreciação e estorno de 
depreciação;
. Inclusão do relatório de Parametrização Contábil, para auxiliar na conferência dos 
parâmetros de integração com a contabilidade;
. Inclusão de novo parâmetro no relatório Balancete Patrimonial por Grupo Contábil,
que permite selecionar se serão processados os grupos do imobiliário ou dos bens 
patrimoniais.
================================================================================
CM$VER      2.07.01a    23/02/2001
--------------------------------------------------------------------------------
Alteração nas rotinas de contabilização das movimentações, na função de rateio de 
plano/patrocinadora, incluindo dois campos na tabela de parâmetros, que conterão o
plano/patrocinadora padrão, que será usada caso a contabilização por plano/patrocinadora
esteja ativa e os rateios ainda não tenham sido cadastrados.
Alteração no cadastro de parâmetros, com a inclusão do tratamento dos campos 
acima citados.
================================================================================
CM$VER      2.07.01     21/02/2001
--------------------------------------------------------------------------------
Inclusão da Consulta Prévia de Parametrização Contábil
Inclusão do Relatório de Posição Contábil por Imóvel Mestre
Correção no calculo do fator de depreciação em anos com 28 dias em Fevereiro
================================================================================
CM$VER      2.07.00a    08/02/2001
--------------------------------------------------------------------------------
Ajuste na rotina de depreciação, para melhoria no tempo de resposta
================================================================================
CM$VER      2.07.00     07/02/2001
--------------------------------------------------------------------------------
Mudança de todas as rotinas de contabilização, com a inclusão do rateio
 por plano/patrocinadora. O rateio é realizado por BEM.
================================================================================
CM$VER      2.06.20a    05/02/2001
--------------------------------------------------------------------------------
Alteração na rotina de fechamento de inventário, para ficar compatível com a nova 
Transferência de Bens.
================================================================================
CM$VER      2.06.20     03/02/2001
--------------------------------------------------------------------------------
Inclusão de funções de tratamento de integração com os sistemas de Administração
Imobiliária e Manutenção.
================================================================================
CM$VER      2.06.19     15/01/2001
--------------------------------------------------------------------------------
. Inclusão do relatório de Movimentação Analítica por Periodo, que lista os bens
movimentados em um determinado periodo.
. Correção na contabilização da transferência de bens.
. Remoção da movimentação Transferência de Localizacao de Conjunto. Esta
movimentação foi incorporada a Transferência de Bens, com as devidas adaptações nas
telas que envolvem a movimentação.
. Inclusão do tratamento do coletor de dados modelo SCW LUCAS 7000 no 
levantamento de inventário.
================================================================================
CM$VER      2.06.18a    29/12/2000
--------------------------------------------------------------------------------
Inclusão do Cadastro do Rateio de Custos por Plano/Patrocinadora, que será realizado 
por Bem. O cadastro permite o cadastramento dos rateios por seleção arbitrária de bens.
================================================================================
CM$VER      2.06.18     22/12/2000
--------------------------------------------------------------------------------
Inclusão do Cadastro de Destinatários de Bens Alienados
Alteração nos Processos de Baixa de bens com a inclusão do Destinatário de bens
alienados.
Alteração do Balancete Patrimonial por Grupo e por Centro de Custo, com a inclusão do
valor depreciado no periodo.
Alterações diversas nas funções de integração com o Almoxarifado
================================================================================
CM$VER      2.06.17f    13/11/2000
--------------------------------------------------------------------------------
Alteração na rotina de contabilização da transferência de bens
================================================================================
CM$VER      2.06.17e    25/10/2000
--------------------------------------------------------------------------------
Alteração no rotina de busca das contas contábeis e centros de custos no movimento
de Transferência de Bens.
================================================================================
CM$VER      2.06.17d    23/10/2000
--------------------------------------------------------------------------------
Alteração na SubRotina de Apuração de Resultado de Alienação de Bens (BAIXA)
Inclusão da data do último fechamento na tela de consulta de bens
Inclusão da opção de não exibir os bens baixados no relatório BALANCETE 
PATRIMONIAL POR BEM.
================================================================================
CM$VER      2.06.17c    20/10/2000
--------------------------------------------------------------------------------
Correção do método de contabilização da transferência de bens (CMDEP)
================================================================================
CM$VER      2.06.17b    20/10/2000
--------------------------------------------------------------------------------
Correção na função de montagem da planilha contábil da Transferência de Bens.
================================================================================
CM$VER      2.06.17a    20/10/2000
--------------------------------------------------------------------------------
Correção na função de leitura de contas contábeis por grupo no rotina de 
DEPRECIAÇÃO.
================================================================================
CM$VER      2.06.17     13/10/2000
--------------------------------------------------------------------------------
.Inclusão do relatório BALANCETE PATRIMONIAL POR CENTRO DE CUSTO;
.Alteração do tratamento dos digitos de identificação de Bem mestre / Bem escravo, com
a inclusão de um campo na tela de PARAMETROS que armazena a quantidade de 
digitos e consequente tratamento no Cadastro de Bens e nas rotinas de geração
automática de número de placa patrimonial;
.Alteração das rotinas de INVENTÁRIO, que refletem a alteração anterior.
================================================================================
CM$VER      2.06.16b    10/10/2000
--------------------------------------------------------------------------------
Alteração no Cadastro de Bens
Alteração no Balancete Patrimonial por Bem
Alteração na Seleção de Bens para Transferência
================================================================================
CM$VER      2.06.16a    09/10/2000
--------------------------------------------------------------------------------
Alteração do cadastro de classes, com a assimilação do cadastro de grupos associados as
classes, a pedido dos usuarios. 
================================================================================
CM$VER      2.06.16     03/10/2000
--------------------------------------------------------------------------------
Alteração da Depreciação e Estorno de Depreciação (Melhoria de Performance)
Alteração no Cadastro de Bens
Alteração no Cadastro de Grupos
Alteração no relatório do Cadastro de Classes (Inclusão dos Grupos Associados)
Alteração no relatório do Cadastro de Grupos (Inclusão dos Centros de Custo Assoc.)
Alteração no processo de pesquisa de bens na Seleção de Bens para Transferência e
na Seleção de Bens para Baixa.
================================================================================
CM$VER      2.06.15d    22/09/2000
--------------------------------------------------------------------------------
Correção na rotina de apuração de resultado do Movimento de Baixa.
Correção do Estorno de Depreciação (Estorno/Remoção da Planilha Contábil)
Correção no form de estorno de movimentações, que não permitia selecionar o acréscimo
de valor que seria estornado.
Correção na ordem de exibição dos campos nas pesquisas de bens.
================================================================================
CM$VER      2.06.15c    18/09/2000
--------------------------------------------------------------------------------
Alteração no Cadastro de Grupos, com a inclusão do cadastramento de Centros de
Custos associados aos grupos, com a retirada deste cadastramento do form de
Classes x Grupos.
================================================================================
CM$VER      2.06.15b    18/09/2000
--------------------------------------------------------------------------------
Alterações diversas nos módulos de processamento de inventário
================================================================================
CM$VER      2.06.15a    13/09/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 2653
  > Tela\Opçao No Sistema: Cadastros
  Incluir uma máscara para o campo IDOPCIONAL, que será cadastrada por CLASSE DE BEM.
  Alterar a tabela CLASSEDEBEM, incluindo um campo que irá armazenar a máscara.
- Resolução da Pendência Nº 2654
  > Tela\Opçao No Sistema: Cadastros
  Modificar a crítica de preenchimento do campo PLACA, verificando o preenchimento por
  grupo contábil. Para isso, incluir um flag na tabela GRUPO que indique se o preenchimento
  da placa é obrigatório ou não.
================================================================================
CM$VER      2.06.15     11/09/2000
--------------------------------------------------------------------------------
. Implementação da nova metodologia de processamento de inventário no qual o resultado
do inventário gera termos de transferência para processamento via transferência de bens.
. Alterações no módulo de integração com o Almoxarifado (uAlmoxCaf)
================================================================================
CM$VER      2.06.14a    06/09/2000
--------------------------------------------------------------------------------
Inclusão do Relatório GUIA DE TRANSFERÊNCIA DE BENS
Acerto do Cadastro de Classes
================================================================================
CM$VER      2.06.14     05/09/2000
--------------------------------------------------------------------------------
. Alteração no form de Estorno de Movimentações, com a inclusão da opção de
estornar um termo de seleção de bens para transferência.
. Correção de erro na transferência de grupo (uAtivoFixo)
================================================================================
CM$VER      2.06.13     04/09/2000
--------------------------------------------------------------------------------
Alteração da Seleção de Bens para Transferência, com a inclusão de críticas a 
transferência de conjuntos que acarretem transferência de grupos e vice-versa.
Inclusão do Módulo de Transferência de Bens que permite transferir bens entre conjuntos
e grupos contábeis e uma só tela. Como consequência, os forms de Tranferência de
Conjunto e Transferência de Grupo deixam de existir.
Correção no módulo de estorno da tela de Cadastro de Bens.
================================================================================
CM$VER      2.06.12     30/08/2000
--------------------------------------------------------------------------------
. Inclusão da Seleção de Bens para Transferência de Conjunto/Grupo, com a consequente 
alteração do formulário de transferência de conjunto, ficando pendente a alteração no
formulário de transferência de grupo;
. Inclusão do Estorno de Baixa de Seleção de Bens;
. Alteração no método de relacionamento de Classes x Grupo x Centro de Custo, que
permite que o usuário ao selecionar o conjunto e a classe o grupo seja automaticamente 
selecionado. Foram feitas alterações no tela de cadastro de GRUPOS DE BENS 
ASSOCIADOS AS CLASSES;
. Alteração do Módulo de Depreciação, para melhoria de performance;
. Acerto na Rotina de Estorno de Acréscimo de Valor;
. Acerto na Rotina de Registro de Retorno de Saída Temporária;
. Acerto na Rotina de Estorno de Baixa de Bens (Planilha Contábil)
================================================================================
CM$VER      2.06.11     18/08/2000
--------------------------------------------------------------------------------
Modificação na rotina de Depreciação, para melhorar o desempenho.
Inclusão de pesquisa com multiseleção na movimentação Seleção para Baixa.
================================================================================
CM$VER      2.06.10a    12/08/2000
--------------------------------------------------------------------------------
Ajuste na função de arredondamento de valores calculados na biblioteca uAtivoFixo
================================================================================
CM$VER      2.06.10     11/08/2000
--------------------------------------------------------------------------------
Alteração nas Rotinas de Contabilização para incluir o tratamento de plano/patrocinadora
Alteração nas telas de cadastro de bens, com a alteração de tipo dos campos Processo e 
Empenho.
Inclusão de pesquisa de bens com multiseleção no form de Seleção de Bens para Baixa
================================================================================
CM$VER      2.06.09     24/07/2000
--------------------------------------------------------------------------------
Inclusão das Movimentações :
SAÍDA TEMPORÁRIA
Controle dos bens que saem do espaço físico da empresa.
SELEÇÃO PARA BAIXA 
Permite a seleção de bens para baixa em grupo (para leilões, por exemplo).
INVENTÁRIO
Controle de levantamento de inventário, com geração, cadastramento de resultado, 
processamento de resultado, com tranferencia de conjunto/local integrado. Inclui 
consultas, relatórios e estorno de processamento de resultado. 
Alteração na Movimentação de BAIXA, para incluir a opção de Seleção de Baixa.
Alteração no cadastramento de Localizações, incluindo Locais para Saida Temporária
Alteração do cadastro de bens, incluindo dados específicos de livros
Alteração nos cadastros de Responsáveis e Terceiros, incluindo um botão de pesquisa
de Responsáveis/Terceiros já cadastrados para alteração e remoção
================================================================================
CM$VER      2.06.08     07/07/2000
--------------------------------------------------------------------------------
Correção da contabilização da Entrada de Bens (Data da Planilha Gerada)
Inclusão do relatório de CONCILIAÇÃO ENTRE CONTABILIDADE E ATIVO FIXO
Inclusão da Movimentação TROCA DA PLACA DE TOMBAMENTO.
================================================================================
CM$VER      2.06.07b    05/07/2000
--------------------------------------------------------------------------------
Correção dos forms que manipulavam de alguma forma o campo RESPONSÁVEL.
Correção na tela de cadastro de Localizações e Conjuntos, para corrigir um problema no
componente da árvore de centro de custo.
Inclusão dos campos Localização e Responsavel no form da movimentação Controle
Total
================================================================================
CM$VER      2.06.07a    30/06/2000
--------------------------------------------------------------------------------
Alteração nos relatorios BALANCETE PATRIMONIAL POR GRUPO e BALANCETE PATRIMONIAL
POR BEM, com a colocação da opção de incluir os bens com controle físico
================================================================================
CM$VER      2.06.07     27/06/2000
--------------------------------------------------------------------------------
Inclusão da movimentação SELEÇÃO PARA BAIXA, que permite selecionar diversos
bens que serão baixados juntos, como em Leilões.
Alteração na tela de BAIXA, para o tratamento de Termos de Seleção de Bens para
Baixa. A opção de baixar por continua a mesma.
Inclusão dos relatórios RELAÇÃO DE BENS PARA INVENTÁRIO e SELEÇÃO DE
BENS PARA BAIXA
================================================================================
CM$VER      2.06.06     16/06/2000
--------------------------------------------------------------------------------
Inclusão do Estorno de Transferência de Grupo / Conjunto
Ajustes na Contabilização da Baixa de Bens
================================================================================
CM$VER      2.06.05     12/06/2000
--------------------------------------------------------------------------------
Criação de uma tela que captura os bens que entraram pelo almoxarifado, e permite a
complementação dos dados específicos de patrimonio, lançando-os no CAF. O sistema
verifica automáticamente se houve alguma nova entrada e alerta o usuário.
Alterações nos seguintes cadastros:
Localizações
Conjuntos
Alterações nas seguintes movimentações:
Acréscimo de Valor
Reavaliação
Transferência de Conjunto
Baixa de Bens
Estorno de Movimentações
================================================================================
CM$VER      2.06.04a    18/05/2000
--------------------------------------------------------------------------------
Correção na crítica do ESTORNO DE DEPRECIAÇÃO sobre a data da última 
depreciação.
Alteração da CONSULTA AO CADASTRO DE BENS, com a inclusão da opção de
se pesquisar por bem além de conjunto.
Alteração do CADASTRO DE BENS, permitindo que a alteração do campo Valor
Total de Entrada da paleta Documento de Entrada do Bem alimente o campo
Valor em Moeda Atual - Aquisição da paleta Valores Iniciais do Bem
================================================================================
CM$VER      2.06.04     15/05/2000
--------------------------------------------------------------------------------
Inclusão da Consulta de SALDO CONTÁBIL POR GRUPO
Alteração no tratamento de exceções do ESTORNO DE DEPRECIAÇÃO
Alteração da Consulta ao CADASTRO DE BENS, com a inclusão da opção de se
classificar o grid de bens por placa, descrição ou data de aquisição, através do botão
do cabeçalho do grid
================================================================================
CM$VER      2.06.03     12/05/2000
--------------------------------------------------------------------------------
Correção do módulo contábil do estorno de entrada de bens
Correção do módulo contábil da baixa de bens sem taxa de depreicação
================================================================================
CM$VER      2.06.02b    09/05/2000
--------------------------------------------------------------------------------
Ajuste na tela de Cadastro de Bens e nas telas de parâmetros dos relatórios. Ajuste na
tela de Cadastro de Localizações (Endereço Maior)
================================================================================
CM$VER      2.06.02a    08/05/2000
--------------------------------------------------------------------------------
. Acerto da rotina de geração de número sequencial de placas
. Acerto da rotina de contabilização do estorno de entrada de bens
. Inclusão da Consulta ao Cadastro de Bens / Conjuntos
. Acerto na rotina de contabilização da baixa de bens
================================================================================
CM$VER      2.06.02     29/04/2000
--------------------------------------------------------------------------------
Inclusão dos relatórios CADASTRO DE GRUPOS - RATEIO DE CUSTOS e
CADASTRO DE GRUPOS - BENS
================================================================================
CM$VER      2.06.01     28/04/2000
--------------------------------------------------------------------------------
Inclusão de nova opção para geração de número de placa de patrimônio nas telas
de parâmetros e cadastro de bem. Inclusão da nova tela de cadastro de 
conjuntos. Ajustes na contabilização da Transferência de Grupo / Conjunto
================================================================================
CM$VER      2.06.00     25/04/2000
--------------------------------------------------------------------------------
Inclusão da Nova Tela de Cadastro de Bens
Alteração na contabilização da Transferencia de Grupo / Conjunto
================================================================================
CM$VER      2.05.23a    18/04/2000
--------------------------------------------------------------------------------
Inclusão da Transferência de Conjunto na tela de Transferencia de Grupo, com 
o consequente ajuste na contabilização. Alteração no processamento do 
estorno de depreciação, para ganho de desempenho. Alteração na referencia 
aos fornecedores.
================================================================================
CM$VER      2.05.23     18/04/2000
--------------------------------------------------------------------------------
Inclusão da Transferência de Conjunto na tela de Transferencia de Grupo, com 
o consequente ajuste na contabilização.
================================================================================
CM$VER      2.05.22     12/04/2000
--------------------------------------------------------------------------------
Criação da Tela de Cadastro de Grupos associados a Classes de Bens. 
Alteração da tela de Cadastro de Classes a nova metodologia.
================================================================================
CM$VER      2.05.21     10/04/2000
--------------------------------------------------------------------------------
Ajuste da rotina de contabilização da Transferência de Grupo e Transferência
de Conjunto. Inclusão de botão de chamada da tela de cadastro de conjuntos na
tela de cadastro de bens. Mudança na classificação dos dados na combo do 
cadastro de classes de bens na tela de cadastro de bens.
================================================================================
CM$VER      2.05.20     06/04/2000
--------------------------------------------------------------------------------
Atualizacao dos Relatórios que contem os campos de descrição das tabelas
GRUPO, CLASSEDEBEM e LOCALIZACAO que foram aumentados por
solicitacao de clientes. Inclusão do tratamento da movimentacao
ATUALIZACAO MONETARIA nas consultas e relatórios, necessária após a
necessidade de clientes importarem movimentações antigas (com valores em 
outras moedas, como Cr$, CZ$ ou CR$).
================================================================================
CM$VER      2.05.19a    05/04/2000
--------------------------------------------------------------------------------
Ajuste das consultas para a adequação aos campos de descrição das tabelas
GRUPO, CLASSEDEBEM e LOCALIZACAO que foram aumentados por
solicitacao de clientes.
================================================================================
CM$VER      2.05.19     04/04/2000
--------------------------------------------------------------------------------
Atualizacao dos modulos que contem os campos de descrição das tabelas
GRUPO, CLASSEDEBEM e LOCALIZACAO que foram aumentados por
solicitacao de clientes. Inclusão da movimentacao ATUALIZACAO 
MONETARIA na tabela de tipos de movimentacao.
================================================================================
CM$VER      2.05.18     27/03/2000
--------------------------------------------------------------------------------
Alteração na contabilização do estorno de ACRÉSCIMO de VALOR e 
REAVALIAÇÃO
================================================================================
CM$VER      2.05.17     23/03/2000
--------------------------------------------------------------------------------
Inclusão das movimentações REAVALIAÇÃO e ACRÉSCIMO DE VALOR
no novo formato de Telas para as movimentações. Remoção definitiva da tela
Outras Movimentações
================================================================================
CM$VER      2.05.16     23/03/2000
--------------------------------------------------------------------------------
Inclusão da Movimentação TRANSFERÊNCIA DE GRUPO, que permite
transferir um bem de grupo, incluindo os saldos contábeis. Inclusão da
Movimentação BAIXA no novo formato de Telas para as movimentações
================================================================================
CM$VER      2.05.15     22/03/2000
--------------------------------------------------------------------------------
Inclusão do campo ENDERECO na tela do cadastro de LOCALIZAÇÕES
================================================================================
CM$VER      2.05.14a    22/03/2000
--------------------------------------------------------------------------------
Correção no tratamento do código hierarquico de classe de bens na respectiva
tela de cadastro.
================================================================================
CM$VER      2.05.14     21/03/2000
--------------------------------------------------------------------------------
Inclusão da movimentação TRANSFERÊNCIA DE CONJUNTO, que permite
transferir bens de um conjunto para outro. Correção na função que pesquisa as
contas contábeis da depreciação das reavaliações e acréscimos de valor.
================================================================================
CM$VER      2.05.13     21/03/2000
--------------------------------------------------------------------------------
Correção na função que pesquisa as contas contábeis da depreciação das
reavaliações e acréscimos de valor.
================================================================================
CM$VER      2.05.12     17/03/2000
--------------------------------------------------------------------------------
Alteração nas rotinas de Controle Total e Transferência de Local, com a 
inclusão do novo formato de telas para as movimentações.
================================================================================
CM$VER      2.05.11     15/03/2000
--------------------------------------------------------------------------------
Alteração da rotina de Contabilização da Reavaliação, contida em uAtivoFixo.
Alteração nos Relatórios CADASTRO DE BENS, CADASTRO DE GRUPOS e
MOVIMENTAÇÃO PATRIMONIAL DE BENS.
================================================================================
CM$VER      2.05.10     14/03/2000
--------------------------------------------------------------------------------
Inclusão da Atividade/Projeto associado aos bens, com alterações na tela de
cadastro de bens e nas rotinas de contabilização de todos as movimentações de
bens. Alterações nos relatórios BALANCETE PATRIMONIAL POR BEM e 
BALANCETE PATRIMONIAL POR GRUPO.
================================================================================
CM$VER      2.05.09     03/03/2000
--------------------------------------------------------------------------------
Inclusão do relacionamento entre classes de bens e grupos contábeis de bens, 
com a respectiva alteração no cadastro de classes de bens
================================================================================
CM$VER      2.05.08a    02/03/2000
--------------------------------------------------------------------------------
Ajustes na rotina de Importação do Cadastro de Bens para Importação
================================================================================
CM$VER      2.05.08     01/03/2000
--------------------------------------------------------------------------------
Alteração na rotina de Contabilização da Depreciação e da Baixa de Bens
Ajustes na rotina de Importação do Cadastro de Bens para Importação
Acertos na tela de Cadastro de Conjuntos e Cadastro de Localização
Alteração na tela de Outras Movimentações
Alteração no Relatório de Termo de Responsabilidade
Alteração no Estorno de Baixa de Bem
================================================================================
CM$VER      2.05.07a    22/02/2000
--------------------------------------------------------------------------------
Correção das Rotinas de Contabilização de Centro de Custo do uAtivoFixo.
Correção do relatório Termo de Responsabilidade.  
================================================================================
CM$VER      2.05.07     21/02/2000
--------------------------------------------------------------------------------
Ajustes nas telas de Cadastro de Conjunto, Localização, Responsável,Terceiros e
Parâmetros. Correção do Relatório Balancete Patrimonial por Grupo
Correção das Rotinas de Contabilização
================================================================================
CM$VER      2.05.06     11/02/2000
--------------------------------------------------------------------------------
Ajuste na contabilização das movimentações. Alteração da remoção no
cadastro de grupos
================================================================================
CM$VER      2.05.05     08/02/2000
--------------------------------------------------------------------------------
Inclusão da opção de estorno ou remoção de planilha contábil nos estornos 
de movimentação nos PARÂMETROS e consequente inclusão da rotina de 
remoção de planilhas nas funções de estorno do uAtivoFixo. Inclusão do 
parâmetro ATIVPROJETO em PARÂMETROS.
================================================================================
CM$VER      2.05.04a    04/02/2000
--------------------------------------------------------------------------------
Correções nas pesquisas de cadastro de grupos e classes e ajustes de margens
em diversos relatórios
================================================================================
CM$VER      2.05.04     01/02/2000
--------------------------------------------------------------------------------
Alterações relativas a mudanças no PESSOA e correções no relatório
de Termo de Responsabilidade
================================================================================
CM$VER      2.05.03     19/01/2000
--------------------------------------------------------------------------------
Correção na rotina de contabilização da depreciação
================================================================================
CM$VER      2.05.02     18/01/2000
--------------------------------------------------------------------------------
Inclusão do relatório MOVIMENTO PATRIMONIAL POR BEM e remoção 
de relatórios antigos que não funcionavam ou estavam no padrão antigo e foram
refeitos no Report Builder
================================================================================
CM$VER      2.05.01     17/01/2000
--------------------------------------------------------------------------------
Inclusão dos relatórios CADASTRO DE GRUPOS, CADASTRO DE CLASSES,
CADASTRO DE LOCALIZAÇÕES, CADASTRO DE TIPOS DE ÁREAS e
CADASTRO DE TIPOS DE MOVIMENTAÇÃO.
================================================================================
CM$VER      2.04.20     17/01/2000
--------------------------------------------------------------------------------
Inclusão dos relatórios RELAÇÃO DE CONTAS CONTÁBEIS DE
MOVIMENTAÇÃO POR GRUPO, CADASTRO PATRIMONIAL DE
BENS e BALANCETE PATRIMONIAL POR BENS.
================================================================================
CM$VER      2.04.19     13/01/2000
--------------------------------------------------------------------------------
Inclusão do estorno de Entrada de Bens e estorno de Acréscimo de Valor
no uAtivoFixo e na tela de Estorno de Movimentações.
================================================================================
CM$VER      2.04.18a    11/01/2000
--------------------------------------------------------------------------------
Inclui o tratamento ao novo campo da tabela RESPONSAVEL e conserto do
erro na gravação da paleta Responsabilidade da tela de cadastro de responsáveis.
Alteração nas rotinas de integração com a contabilidade do uAtivoFixo, para
realizar uma critica mais eficiente quanto as SubContas.
================================================================================
CM$VER      2.04.18     10/01/2000
--------------------------------------------------------------------------------
Criação do Balancete Patrimonial por Classe de Bens,
com totalização quantitativa
================================================================================
CM$VER      2.04.17c    10/01/2000
--------------------------------------------------------------------------------
Correção de código nas telas de cadastro de grupos e bens
================================================================================
CM$VER      2.04.17b    07/01/2000
--------------------------------------------------------------------------------
Alteração na tela de entrada de bens, para ajustar o módulo de alteração 
Inclusão do Relatório de Termo de Responsabilidade
================================================================================
CM$VER      2.04.17a    06/01/2000
--------------------------------------------------------------------------------
Acréscimo do parâmetro PLANOVIGENTE, na tela de PARÂMETROS, e
consequente alteração nas rotinas contábeis e na tela  CONTA MOVIMENTO 
POR GRUPO. Correção na gravação do parâmetro de tipo de reavaliação na
tela de PARÂMETROS
================================================================================
CM$VER      2.04.17     05/01/2000
--------------------------------------------------------------------------------
Adição do Módulo ExecutaEntradaBens, que grava uma quantidade de bens
determinada, gerando numero de placa de tombamento de forma automática,
partindo do numero dado como inicial. Esta função é utilizada tanto pelo ativo
fixo como pelo almoxarifado.
================================================================================
CM$VER      2.04.16     03/01/2000
--------------------------------------------------------------------------------
Adição do Módulo de Transferencia de Local ao uAtivoFixo e na movimentação
do Ativo Fixo. Adição dos Relatórios de Movimento Patrimonial por Grupo e
Balancete Patrimonial por Grupo
================================================================================
CM$VER      2.04.15     24/12/1999
--------------------------------------------------------------------------------
Ajuste no Cadastro de Grupos e criação da função de arredondamento das
movimentações no uAtivoFixo.
================================================================================
CM$VER      2.04.14     17/12/1999
--------------------------------------------------------------------------------
Alteração da tela de cadastro de bens, com a inclusao de um campo de
identificação opcional (Placas de Veiculos, Marcas, Modelos, etc ..)
Inclusão do Estorno de Baixa  no uAtivoFixo. Alteração da função
ExecutaReavaliação para melhorar desempenho. Remoção de relatórios
antigos, feitos em quickreport, que não funcionavam e só ocupavam espaço.
Remoção dos módulos uGlobal e uCafFunc, que não eram mais utilizados.
================================================================================
CM$VER      2.04.12b    16/12/1999
--------------------------------------------------------------------------------
Alteracao da tela de cadastro de bens, com a inclusao de um campo de
identificação opcional (Placas de Veiculos, Marcas, Modelos, etc ...)
================================================================================
CM$VER      2.04.12a    16/12/1999
--------------------------------------------------------------------------------
Inclusão do Estorno de Reavaliação e Estorno de Depreciação PróRata no
uAtivoFixo. Melhoria no Desempenho do Relatório de Bens Imóveis.
Alteração na Tela de Parametros do Sistema
================================================================================
CM$VER      2.04.11a    06/12/1999
--------------------------------------------------------------------------------
Atualização da Tela de Parametros do Sistema
Atualização da Tela de Cadastro de Classes de Bens
Atualização da Tela de Cadastro de Grupos de Bens
================================================================================
CM$VER      2.04.11     02/12/1999
--------------------------------------------------------------------------------
Atualização do uAtivoFixo
Correção de Erro na Tela de Cadastramento de Bens
Melhora do Desempenho no Relatório Contábil de Bens Imóveis
Atualização da Tela de Cadastro de Classes de Bem
Atualização da Tela de Parametros do Sistema
================================================================================
CM$VER      2.04.10     25/11/1999
--------------------------------------------------------------------------------
Atualização do uAtivo Fixo
Criação da Consulta da Movimentação
Correção do Gerador de Código de Número de Tombamento
================================================================================
CM$VER      2.04.09     22/11/1999
--------------------------------------------------------------------------------
Atualização do uAtivoFixo
Atualização do Form Principal
Atualização da Função de Estorno
================================================================================
CM$VER      2.04.08     08/11/1999
--------------------------------------------------------------------------------
Atualização do uAtivoFixo
Criação da Consulta de Saldo Contabil
Criação do Relatório Contábil de Imóveis
Criação da Depreciação PróRata na Baixa e Reavaliação
================================================================================
CM$VER      2.04.07     25/10/1999
--------------------------------------------------------------------------------
Atualização da Tela de Entrada de Dados, que reflete as alterações no método
de depreciação de bens reavaliados.
Atualização da reavaliação de bens
================================================================================
CM$VER      2.04.06     14/10/1999
--------------------------------------------------------------------------------
Atualização da função de reavaliação incluindo acréscimo de valor
Atualização da função de baixa incluindo acréscimo de valor
Atualização da função de estorno de depreciação, incluindo acréscimo de valor
Atualização da função de estorno de baixa, incluindo acréscimo de valor
================================================================================
CM$VER      2.04.05     14/10/1999
--------------------------------------------------------------------------------
Inclusão das funções de acréscimo de valor e entrada total
Atualização da função de depreciação incluindo acréscimo de valor
Atualização da função de estorno de depreciação
Compatibilizar com o novo padrão
================================================================================
CM$VER      2.04.04     14/10/1999
--------------------------------------------------------------------------------
Inclusão das funções de acréscimo de valor e entrada total
Atualização da função de depreciação incluindo acréscimo de valor
Atualização da função de estorno de depreciação
Compatibilizar com o novo padrão
================================================================================
CM$VER      2.04.03     24/09/1999
--------------------------------------------------------------------------------
Alteração nas funções de Baixa, Reavaliação e Entrada de Bens do
Objeto AtivoFixo. Alteração no calculo pró-rata da depreciação
Alteração no Cadastramento de Bens
================================================================================
CM$VER      2.04.02     21/09/1999
--------------------------------------------------------------------------------
Implantação das funções de Baixa, Reavaliação e Entrada de Bens do
Objeto AtivoFixo
Alteração no calculo pró-rata da depreciação
================================================================================
CM$VER      2.04.01     06/09/1999
--------------------------------------------------------------------------------
Inclusão da Tabela DEPRECIACAOREAVAL e Alterações nas Tabelas
REAVALIACAO e BAIXABEM para permitir que o estorno seja realizado
com sucesso.
Atualização do sistema decorrente das mudanças no LancaContab e Pessoa
Alteração do método de calculo das reavaliações, como resultado de reunião 
com os clientes Serpros e FunCef.
Ativação do Módulo de Estorno de Depreciação c/ Reavaliação
Ativação do Módulo de Estorno de Baixa de Bem c/ Reavaliacao
================================================================================
CM$VER      2.03.17     26/08/1999
--------------------------------------------------------------------------------
Ativação parcial do Estorno de Movimentação de Bens (Depreciação e C.M.)
Correção da Query do Relatório de Conferencia de Depreciação
Alteração no Reavaliação de Bens
================================================================================
CM$VER      2.03.16     20/08/1999
--------------------------------------------------------------------------------
Adaptações ao novo padrão
================================================================================
CM$VER      2.03.15     19/08/1999
--------------------------------------------------------------------------------
Alteração nos Parâmetros de Integração e Instalação para adequação ao novo
modelo. Alteração no Cadastro de Bens, para permitir a entrada dos valores
correção monetária e situação de implantação. Alteração de todos os programas
que envolvem contabilização, para adequação aos novos parametros de
verificação de integração. Correção de rotinas que envolvem datas das tabelas
de bens e historico de movimentações.
================================================================================
CM$VER      2.03.14     16/08/1999
--------------------------------------------------------------------------------
Alteração nos Parâmetros de Integração
Alteração na Contabilização da Entrada de Bens
================================================================================
CM$VER      2.03.13     13/08/1999
--------------------------------------------------------------------------------
Atualização na Entrada de Bens e no Cadastro de Conjuntos
================================================================================
CM$VER      2.03.12     10/08/1999
--------------------------------------------------------------------------------
Adaptação ao Novo LANCACONTAB
Correção das Movimentações de Baixas e Reavaliações
Correção da Tela de Entrada de Bens (Eliminição de SPR's)
================================================================================
CM$VER      2.03.11     04/08/1999
--------------------------------------------------------------------------------
Colocação de todas as rotinas de cadastro para o padrão atual
Eliminação de diversas Stored Procedures
Correção e implementação das Movimentações de Baixas e Reavaliações
Adaptação ao novo LANCACONTAB
Otimização de codigo na Geração de Movimentações
Criação do Relatório de Conferencia Contábil de Depreciação
================================================================================
CM$VER      2.03.10     23/06/1999
--------------------------------------------------------------------------------
Inserção da Tela de Cadastro de Classes de Bens
Alteração da Tela de Parametros, com a inclusão da mascara de Classe de Bens
Alteração da Tela de Inclusão de Bens, com a inclusão da entrada da Classe de Bens
Inserção do Relatorio de Bens para Conferencia de Bens
================================================================================
CM$VER      2.03.09     17/06/1999
--------------------------------------------------------------------------------
Refeito o Modulo de Importação
================================================================================
CM$VER      2.03.08     12/06/1999
--------------------------------------------------------------------------------
Correções em campos select desatualizadas com o banco atual
================================================================================
CM$VER      2.03.07     11/06/1999
--------------------------------------------------------------------------------
Correções em Nomes de Campos
Criação de Rotina Inexistente (TestaContaContabil)
================================================================================
CM$ALT}
end.
