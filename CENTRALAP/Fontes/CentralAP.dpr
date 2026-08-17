program CentralAP;

uses
  Forms,
  fcmEntrada,
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FGrafAtend in 'FGrafAtend.pas' {frmGrafAtend},
  FCadSitBenef in 'FCadSitBenef.pas' {FrmCadSitBenef},
  fformaatend in 'fformaatend.pas' {FrmFormaAtend},
  FCadServicos in 'FCadServicos.pas' {FrmCadServicos},
  FCadDocumentos in 'FCadDocumentos.pas' {FrmCadDocumentos},
  dRelCentralAP in 'dRelCentralAP.pas' {dtmRelCentralAP},
  FParamRelDocServ in 'FParamRelDocServ.pas' {frmParamRelDocServ},
  FParamRelDocBenef in 'FParamRelDocBenef.pas' {frmParamRelDocBenef},
  FCadRecebimento in 'FCadRecebimento.pas' {FrmCadTpRecebXCancelamento},
  datend in 'datend.pas' {dtmAtend: TDataModule},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FBenefxSituacao in 'FBenefxSituacao.pas' {FrmBenefxSituacao},
  FTermosxBenef in 'FTermosxBenef.pas' {FrmTermosxBenef},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  umoduloCap in 'umoduloCap.pas',
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  fCadAssunto in 'fCadAssunto.pas' {frmCadAssunto},
  FCadRespostaPadrao in 'FCadRespostaPadrao.pas' {FrmCadRespostaPadrao},
  FCadRubNew in 'FCadRubNew.pas' {FrmCadRubNew},
  FCadModeloRub in 'FCadModeloRub.pas' {FrmCadModeloRub},
  FParamRelHistAtend in 'fParamRelHistAtend.pas' {frmParamRelHistAtend},
  uRubs in 'uRubs.pas',
  fConfSituacaoAtend in 'fConfSituacaoAtend.pas' {frmConfSituacaoAtend},
  fCadGrupoAssunto in 'fCadGrupoAssunto.pas' {frmCadGrupoAssunto},
  Fconsatend in 'Fconsatend.pas' {frmConsAtend},
  fManutRubs in 'fManutRubs.pas' {frmManutRubs},
  FReplicaPatro in 'FReplicaPatro.pas' {FrmReplicaPatro},
  fConfigCartaAviso in 'fConfigCartaAviso.pas' {frmConfigCartaAviso},
  fSelMotivoBaixa in 'fSelMotivoBaixa.pas' {frmSelMotivoBaixa},
  DRubs in 'DRubs.pas' {DtmRubs: TDataModule},
  uAtendimento in 'uAtendimento.pas',
  DAtendimento in 'DAtendimento.pas' {DtmAtendimento: TDataModule},
  FDocxBenef in 'FDocxBenef.pas' {FrmDocxBenef},
  FSelCartaEtiq in 'FSelCartaEtiq.pas' {FrmSelCartaEtiq},
  FConsHistRecEmp in 'FConsHistRecEmp.pas' {frmConsHistRecEmp},
  ftermoxdoc1 in 'ftermoxdoc1.pas' {frmtermoxdco1},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  FCADCOMPASSUNTO in 'FCADCOMPASSUNTO.pas' {FRMCADCOMPLASSUNTO},
  fconsultafiario in 'fconsultafiario.pas' {Frmconsultafiario},
  fsenha in 'fsenha.pas' {frmsenha},
  UBeneficio in 'UBeneficio.pas',
  FParamCentralAP in 'FParamCentralAP.pas' {frmParamCentralAP},
  FCpuAtend in 'FCpuAtend.pas' {frmIdCpuAtend},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FMOVFIARIO in 'FMOVFIARIO.pas' {FRMMOVFIARIO},
  FAtend in 'FAtend.pas' {frmAtend},
  FRubsRecad in 'FRubsRecad.pas' {frmRubsRecad},
  fBenefRubs in 'fBenefRubs.pas' {frmBenefRub},
  FRecebDocs in 'FRecebDocs.pas' {FrmRecebDocs},
  fEmisEtiq in '..\FontesComuns\fEmisEtiq.pas' {FrmEmisEtiq},
  FInformaData in '..\FontesComuns\FInformaData.pas' {FrmInformaData},
  FPedeInfAux in '..\FontesComuns\FPedeInfAux.pas' {frmPedeInfAux},
  UFuncoesUteis in '..\FontesComuns\UFuncoesUteis.pas',
  UMascaras in '..\FontesComuns\UMascaras.pas',
  UModulo in '..\FontesComuns\UModulo.pas',
  uSincronismo in '..\FontesComuns\uSincronismo.pas',
  fConfigRelatCM in '..\..\Cm\Forms\Source\fConfigRelatCM.pas' {FrmConfigRelatCM},
  FFiltroRelaDocs in 'FFiltroRelaDocs.pas' {FrmFiltroRelaDocs},
  FConfigRelRubs in 'FConfigRelRubs.pas' {frmConfigRelRubs},
  fFiltroRelaProtocolo in 'fFiltroRelaProtocolo.pas' {frmFiltroRelaProtocolo},
  fMudaLocalAtend in 'fMudaLocalAtend.pas' {frmMudaLocalAtend},
  FConfigRelatorio in '..\..\Cm\Forms\Source\FConfigRelatorio.pas' {FrmConfigRelatorio},
  fDataHora in 'fDataHora.pas' {frmDataHora},
  FParamRelEst in 'FParamRelEst.pas' {FrmParamRelEst},
  fConfigRubs in 'fConfigRubs.pas' {frmConfigRubs},
  FTelaAuxRegra in '..\AllForms\FTelaAuxRegra.pas' {frmTelaAuxRegra},
  FPRelEstatDetalhada in 'FPRelEstatDetalhada.pas' {frmPRelEstatDetalhada},
  DRelEstatDetalhada in 'DRelEstatDetalhada.pas' {dtmRelEstatDetalhada},
  fcadCpuAtend in 'fcadCpuAtend.PAS' {frmCadCpuAtend},
  fCadLocalAtend in 'fCadLocalAtend.pas' {frmCadLocalAtend},
  UAdmPrev in '..\FontesComuns\UAdmPrev.pas',
  FPRel2ViaCChequeMT in '..\FontesComuns\FPRel2ViaCChequeMT.pas' {frmPRel2ViaCChequeMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  uCmCtrlRptCentralAP in 'uCmCtrlRptCentralAP.pas',
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  dRel2ViaCChequeMT in '..\FontesComuns\dRel2ViaCChequeMT.pas' {DtmRel2ViaCChequeMT},
  FPRelHisFuncionalMT in '..\FontesComuns\FPRelHisFuncionalMT.pas' {frmPRelHisFuncionalMT},
  dRelTempoServicoMT in '..\FontesComuns\dRelTempoServicoMT.pas' {dtmRelTempoServicoMT},
  fConfigRubsMT in 'fConfigRubsMT.pas' {FrmConfigRelatorioMT2},
  FConfigRelatorioMT in '..\..\Cm\Forms\SourceMT\FConfigRelatorioMT.pas' {FrmConfigRelatorioMT},
  FCadGrupoProtocolo in 'FCadGrupoProtocolo.pas' {frmCadGrupoProtocolo},
  FExtratoINSS in '..\..\Cm\CMADMPREV\Fontes\FExtratoINSS.pas' ;

{$R *.RES}
{$R CENTRALAP_RES.RES}

begin
  frmcmEntrada:= TfrmcmEntrada.Create(Application);
  frmcmEntrada.Show;
  frmcmEntrada.Update;

  Application.Initialize;

  Application.Title := 'Central de Atendimento ao Público';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdtmAtend, dtmAtend);
  Application.CreateForm(TDtmAtendimento, DtmAtendimento);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmReports, dtmReports);
  Application.CreateForm(TfrmTelaAuxRegra, frmTelaAuxRegra);
  frmcmEntrada.Hide;
  frmPrincipal.show;   //Andre Imakawa - SIG 52331
  frmPrincipal.Update; //Andre Imakawa - SIG 52331
  frmcmEntrada.Free;

  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Central de Atendimentos
================================================================================
CM$VER      3.02.18f    11/06/2008
--------------------------------------------------------------------------------
- Pendência 28168: Relatórios Estatístico de Atendimento e Estatístico Detalhado
  Otimização das querys de consulta dos relatórios.
- Pendência 27752: Operações / Protocolo
  Otimização na query de busca do protocolo.
================================================================================
CM$VER      3.02.18e    13/05/2008
--------------------------------------------------------------------------------
- Pendência 27846: Atendimento
  Ajuste no botão excluir nas sub-abas pertencentes a aba Dados do Participante para
  excluir os registros corretamente somente quando clicar no botão adequado.
- Pendência 27845: Atendimento
  Ajuste no 'click' dos botões inserir/alterar nas sub-abas pertencentes a aba Dados do
  Participante. Onde ao mudar de aba os botões permaneciam "pressionados" e em modo
  de inclusão/edição.
================================================================================
CM$VER      3.02.18d    29/04/2008
--------------------------------------------------------------------------------
- Pendência 27751: Atendimento
  Correção do erro apresentado ao alternar entre as guias de conta-corrente e demais
  durante o atendimento.
================================================================================
CM$VER      3.02.18c    25/04/2008
--------------------------------------------------------------------------------
- Pendência 27753: Relatório de Protocolos Emitidos
  Correção no filtro da tela onde estava trazendo dados duplicados.
================================================================================
CM$VER      3.02.18b    17/03/2008
--------------------------------------------------------------------------------
- Pendencia 27574: 
   Ajuste do Help nas telas do Sistema para contemplar os relatórios.
================================================================================
CM$VER      3.02.18a    11/03/2008
--------------------------------------------------------------------------------
- Pendencia 27574: Ajuste do Help nas telas do Sistema
================================================================================
CM$VER      3.02.18     15/01/2008
--------------------------------------------------------------------------------
Atendimento
  Pendência: 27033 - Adaptação da tela para poder ser visualizada na resolução
                     800x600.
  Pendência: 26706 - Passa a trazer os assuntos corretamente de acordo com o
                     atendimento pendente selecionado.
Conculta Geral de Pessoas
  Pendência: 26764 - Ajuste na tela para poder exibir o plano corretamente de acordo
                     com a matrícula do participante selecionada.
Operações / Atendimento
  Pendência: 26645 - Correção de erro de restrição de gravação a tentar fechar um
                     atendimento.
Atendimento / Empréstimo / Quitação Antecipada
  Pendência: 26149 - Implementação do bloqueio da opção "Excepcional" na parte de
                     amortização e quitação de empréstimos.
Consulta Geral de Pessoa / Vida Funcional / Evolução Funcional
  Pendencia: 25802 - Criação de Página com a informação de Adicional de Confiança.
Aendimento
  Pendência: 23929 - Não deixa cadastrar e-mail se não for escrito corretamente.
================================================================================
CM$VER      3.02.17e    10/12/2007
--------------------------------------------------------------------------------
- Pendencia 26947: Cadastro de Histórico de Suspensões
  Não existe mais filtro para exibir somente os tipos de suspensão por férias
================================================================================
CM$VER      3.02.17d    07/12/2007
--------------------------------------------------------------------------------
Atendimento
  Pendência: 27033 - Adaptação da tela para poder ser visualizada na resolução
                     800x600.
================================================================================
CM$VER      3.02.17c    28/11/2007
--------------------------------------------------------------------------------
Atendimento / Assunto / Consulta Contratos
  Pendência: 26886 - Recompilação do projeto para correção da tela de Consulta
                     Contratos.
Atendimento
  Pendência: 26645 - Correção do erro ao ajustar o assunto.
================================================================================
CM$VER      3.02.17b    01/11/2007
--------------------------------------------------------------------------------
- Recompilação do executável para compatibilidade com as bibliotecas do
  empréstimo.
================================================================================
CM$VER      3.02.17a    28/09/2007
--------------------------------------------------------------------------------
- Recompilação do executável para compatibilidade com as bibliotecas do
  empréstimo.
================================================================================
CM$VER      3.02.17     14/08/2007
--------------------------------------------------------------------------------
- Liberação do padrão 17
================================================================================
CM$VER      3.02.16g    01/11/2007
--------------------------------------------------------------------------------
- Recompilação do executável para compatibilidade com as bibliotecas do
  empréstimo.
================================================================================
CM$VER      3.02.16f    31/10/2007
--------------------------------------------------------------------------------
- Recompilação do executável para compatibilidade com as bibliotecas do
  empréstimo.
================================================================================
CM$VER      3.02.16e    19/09/2007
--------------------------------------------------------------------------------
Empréstimo / Inscrição / Concessão / Renovação
  Pendencia: 26318 - Quando concessão for excepcional, permite concessão mesmo
                     quando o tipo de contrato estiver na lista interna de
                     impedimentos.
================================================================================
CM$VER      3.02.16d    17/09/2007
--------------------------------------------------------------------------------
  Pendencia: 26266 - Seleção de contratos de Emprestimo atendidos pela
                     CentralAP, para evitar mostrar contratos duplicados
                     diferenciados pela migração de plano.
================================================================================
CM$VER      3.02.16c    30/08/2007
--------------------------------------------------------------------------------
Histórico de Suspensão
  Pendencia: 26208 - Novos ajustes na tela de histórico de suspensão quando a
                     mesma é chamada pela Central de Atendimento.
================================================================================
CM$VER      3.02.16b    28/08/2007
--------------------------------------------------------------------------------
Histórico de Suspensão
  Pendencia: 26208 - Ajustes na tela de histórico de suspensão quando a mesma é
                     chamada pela Central de Atendimento.
================================================================================
CM$VER      3.02.16a    27/08/2007
--------------------------------------------------------------------------------
Atendimento
  Pendencia: 26208 - Ajustes na chamada e nos campos da tela de Histórico de
                     Suspensão de Cobrança de Empréstimo.
  Pendencia: 26205 - Ajuste na chamada da tela de amorrização de empréstimo.
================================================================================
CM$VER      3.02.16     25/05/2007
--------------------------------------------------------------------------------
- Liberação do padrão 16
Operações / Protocolo
  Pendência: 25827 - Ajustes na hora de habilitar botões de alterar e excluir e na consulta
                     de participantes.
================================================================================
CM$VER      3.02.15     05/04/2007
--------------------------------------------------------------------------------
- Liberação para Padrão 15
- Pendencia 22046: Relacionamento de assunto com evento de empréstimo
   Implementada a opção de relacionar evento de empréstimo no cadastro de assuntos.
   Desta forma, os eventos referentes ao Empréstimo somente estarão disponiveis quando
   efetuado este relacionamento.
- Pendencia 22042: Atendimento
  Implementado o relacionamento do Assunto ao Contrato de Empréstimo, quando este
  for relacionado a um evento de empréstimo, conforme explicitado na pendencia 22046.
  O menu de eventos de empréstimo foi transferido para a guia de assuntos.
  A transferencia de informações entre o Emprestimo e a Central inclui também os campos
  Valor Solicitado e Numero de Parcelas, para o caso de evento de concessão.
  Todos os eventos, com excessão de Assinatura de Contrato padrão, retornam 
  automaticamente o numero do contrato selecionado.
  Não é mais permitido a seleção de outro mutuário no emprestimo senão o mutuário que
  está sendo atendido.
- Pendencia 21370: Cadastro de Arquivo de RUBS
  Disponibilização dos campos: Numero de Contrato de Empréstimo, Valor Solicitado e 
  Numero de Parcelas para a elaboração de Modelo de RUBS.
================================================================================
CM$VER      3.02.14a    23/03/2007
--------------------------------------------------------------------------------
- Pendencia 24759: Acerto no relatório de Protocolos Emitidos
================================================================================
CM$VER      3.02.14     16/02/2007
--------------------------------------------------------------------------------
Configurações de Relatórios
  Pendência: 24343 - Atualização para três camadas.
Protocolo
  Pendência: 21394 - Implementação do botão de Consulta Geral de Pessoa de dentro
                               da tela.
Gráfico de Atendimento
  Pendência: 21752 - Contador para as opções de assunto e grupo de assunto que será
                               exibida na tela passa a ter valor padrão de 15, e o usuário tem
                               livre escolha para alterar esse quantidade.
Atendimento
  Pendência: 23998 - Passa a exibir a RUBs no grid Assunto.
================================================================================
CM$VER      3.02.13c    23/03/2007
--------------------------------------------------------------------------------
- Pendencia 24759: Acerto no relatório de Protocolos Emitidos
================================================================================
CM$VER      3.02.13b    16/02/2007
--------------------------------------------------------------------------------
Atendimento
  Pendência: 23998 - Passa a exibir a RUBs no grid Assunto.
================================================================================
CM$VER      3.02.13a    20/12/2006
--------------------------------------------------------------------------------
Atendimento
  Pend.: 23988 - Correção na hora de abrir um atendimento pela tela de Consulta Geral de
                        Pessoa, ao desistir de realizar o atendimento e fechar a tela de busca.
  Pend.: 23991 - Correção no procedimento de busca de participante.
  Pend.: 23992 - Correção na exibição da Situação do Plano do participante na hora de
                         realizar o atendimento.
================================================================================
CM$VER      3.02.13     12/12/2006
--------------------------------------------------------------------------------
Atendimento
  Pend.: 23775 - Acerto na busca por de atendimentos por matrícula.
================================================================================
CM$VER      3.02.12e    16/02/2007
--------------------------------------------------------------------------------
Atendimento
  Pendência: 23998 - Passa a exibir a RUBs no grid Assunto.
================================================================================
CM$VER      3.02.12d    20/12/2006
--------------------------------------------------------------------------------
Atendimento
  Pend.: 23988 - Correção na hora de abrir um atendimento pela tela de Consulta Geral de
                        Pessoa, ao desistir de realizar o atendimento e fechar a tela de busca.
  Pend.: 23991 - Correção no procedimento de busca de participante.
  Pend.: 23992 - Correção na exibição da Situação do Plano do participante na hora de
                         realizar o atendimento.
================================================================================
CM$VER      3.02.12c    05/12/2006
--------------------------------------------------------------------------------
Atendimento
  Pend.: 23775 - Acerto na busca por de atendimentos por matrícula.
================================================================================
CM$VER      3.02.12b    30/11/2006
--------------------------------------------------------------------------------
- Pendência 23767 - Verificação de parâmetro para crítica de dígito verificador
  de conta corrente
================================================================================
CM$VER      3.02.12a    30/10/2006
--------------------------------------------------------------------------------
Consulta Estatística de Atendimentos
  Pend.: 23612 - Acerto no relatório para Consultar Gráficos de Estatísticas de
                        Atendimento.
================================================================================
CM$VER      3.02.12     27/09/2006
--------------------------------------------------------------------------------
Atendimento
  Pend.: 21784 - Implementação de uma mensagem avisando que não existe
                        endereço para o participante selecionado ou nenhum tipo de
                        endereço está selecionado.
  Pend.: 21551 - Mudança na forma de busca de participante/dependente na hora de
                        realizar o atendimento.
  Pend.: 21663 - Implementação do Contato na Barra "Dados do Participante" seguindo o
                        modelo implementado no AdmPrev.
  Pend.: 22898 - Implementação do campo CONTATOTEL, que trata do nome do
                        contato caso o telefone seja de recado.
================================================================================
CM$VER      3.02.11c    01/12/2006
--------------------------------------------------------------------------------
- Pendência 23767 - Verificação de parâmetro para crítica de dígito verificador de conta corrente
================================================================================
CM$VER      3.02.11b    30/10/2006
--------------------------------------------------------------------------------
Consulta Estatística de Atendimentos
  Pend.: 23612 - Acerto no relatório para Consultar Gráficos de Estatísticas de
                        Atendimento.
================================================================================
CM$VER      3.02.11a    17/08/2006
--------------------------------------------------------------------------------
- Compilação para contemplar pendencia 22897
================================================================================
CM$VER      3.02.11     28/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 11.
================================================================================
CM$VER      3.02.10a    17/08/2006
--------------------------------------------------------------------------------
- Pendencia 22897: 
    Acerto na funcionalidade Pessoa/Outro participante. O sistema pergunta se o usuário
    deseja ou não cancelar o atendimento antes de selecionar outro participante.
================================================================================
CM$VER      3.02.10     12/07/2006
--------------------------------------------------------------------------------
- Pendencia 21256: A impressão da RUB no momento do atendimento, reflete os dados
  alterados na tela de Dados do Participante, sem precisar sair e entrar novamente na tela
  de atendimento
- Correção do preenchimento dos parâmetros contábeis na abertura do sistema.
================================================================================
CM$VER      3.01.77     10/04/2006
--------------------------------------------------------------------------------
Pendência 21629 - Atendimento
- Ao alterar a cidade do endereço de um participante e retornar à tela de atendimento principal (F3), o sistema exibia o IDCIDADES, no campo cidade.
Pendência 21682 - Atendimento
- Desabilitar validações de preenchimento quando o atendimento for cancelado.
Pendência 21748 - Atendimento
- Não gerava RUB para benefícios.
Pendência 20464 - RUBS
- Implementado detalhes no relatório contendo dados de dependentes e beneficiários.
Pendência 21430 - Consulta Atendimento
- Implementação de busca por matrícula parcialmente preenchida.
Pendência 21665 - Consulta Atendimento
- Incluída coluna "Grupo de Assuntos", na pasta "Assuntos".
Pendência 21387 - Protocolo
- Alterada a capacidade máxima de caracteres do campo "DESCRICAO" .
Pendência - 22040
- Correção do Item DESCRIÇÃO no Botão Procurar no campo Memo.
================================================================================
CM$VER      3.01.76     20/02/2006
--------------------------------------------------------------------------------
Pendência 21574 - Atendimento
- O campo "Cidade" não estava sendo salvo corretamente.
================================================================================
CM$VER      3.01.75     23/01/2006
--------------------------------------------------------------------------------
Pendência 21300 - Atendimento
- Implementar mensagem de aviso ao usuário ao cancelar de que as operações realizadas durante o atendimento não serão canceladas.
================================================================================
CM$VER      3.01.74     10/01/2006
--------------------------------------------------------------------------------
Pendência 20015 - Registro de Atendimento
- Ao alterar dados de endereços e telefones na guia Dados do Participante, permitir alteração automática destes dados no atendimento.
Pendência 21203 - Relatório Estatístico Detalhado
- Ocorria erro de "access violation" na emissão do relatório em algumas fundações.
================================================================================
CM$VER      3.01.73     02/12/2005
--------------------------------------------------------------------------------
Correções no relatório estatístico de atendimento.
================================================================================
CM$VER      3.01.72     29/11/2005
--------------------------------------------------------------------------------
Integração com o sistema de Agendamentos.
================================================================================
CM$VER      3.01.71     29/09/2005
--------------------------------------------------------------------------------
Pendências 20226 - Gráfico Estatístico de Atendimento
-  Permitir exibição de tempos no formato "hms".
Pendência 20211 - Atendimento
- Tempo de atendimento sendo gravado com inconsistência.
================================================================================
CM$VER      3.01.70     22/09/2005
--------------------------------------------------------------------------------
Pendências 20213, 20227 - Relatório Estatístico de Atendimento
-  Criar Total Geral para o tempo médio e para o tempo total e permitir excibição de tempos no formato hms.
================================================================================
CM$VER      3.01.69     01/09/2005
--------------------------------------------------------------------------------
- Pendência 19663 - Gráfico de Atendimentos
Corrigido diferenças no cálculo de atendimentos pelo Auto-Atendimento.
================================================================================
CM$VER      3.01.68b    18/08/2005
--------------------------------------------------------------------------------
- Pendencia 19520: 
  - Inclusão de campo para observação no Cadastro de Documentos a serem solicitados pela RUBS
  - Inclusão de campo para visualização da observação dos documentos para RUBS na tela de Atendimento
  - Inclusão de campo observação no relatório que demonstra os documentos necessários para RUBS na tela de atendimento
================================================================================
CM$VER      3.01.68a    06/07/2005
--------------------------------------------------------------------------------
- Pendencia 19501: Aumentada a área da legenda do gráfico para ilustrar o máximo de linhas possível.
================================================================================
CM$VER      3.01.68     19/05/2005
--------------------------------------------------------------------------------
Versão para padrão 5.10.06
================================================================================
CM$VER      3.01.67     03/05/2005
--------------------------------------------------------------------------------
Pendência 18425 - Cadastro de Assuntos, Gráfico de Atendimento, Relatório Estatístico de Atendimento
- Incluídos dados de atendimentos pelo Auto-Atendimento.
Pendência 18845
- Relatório de Extrato de Movimentações por Contrato pode agora ser chamado no CentralAP, pela árvore de relatórios;
================================================================================
CM$VER      3.01.66r    20/04/2005
--------------------------------------------------------------------------------
- Pendencia 19053 - Acerto no relatório de estatística detalhada.
================================================================================
CM$VER      3.01.66q    28/03/2005
--------------------------------------------------------------------------------
Pendência: 18884
Tela: Operações\Atendimento
Descrição do erro: Ao chamar a tela de inscrição / concessão de empréstimo está 
preenchendo incorretamente o plano previdenciário atual do pensionista no caso de 
pensionista e migrou de plano previdenciário.
Pendência: 18424
Tela: Cadastro\Rubs\Cadastro de Arquivos
Descrição: Disponibilizar todos os tipos de telefone (residencial/celular/comercial) para montagem das RUBS.
 
Pendência: 18732
Tela: Operações\Atendimento\Cadastro de RUBS
Descrição: Erro de constraint 5582 ao gerar um atendimento com RUBS.
Pendência: 18511
Tela: Operações\RUBS\Configuração do Modelo de RUBS.
Descrição: Permitir inserir subrelatório com todos os dados do dopendentes.
Pendência: 18578
Tela Operações\Atendimento\Consulta atendimentos
Descrição do Erro: Ao consultar o atendimento da inscrição CBS: 14911 - Delcia Maria da Silva Pacheco, não está aparecendo os atendimentos realizados. O titular é falecido.
Pendência: 18073
Tela Configuração do Modelo de RUBS.
Descrição: Disponibilizar um subrelatório que liste todos os documentos relacionados ao benefício/serviço.
Pendência: 17981
Tela: Operacoes\Atendimento\Dados do participante\Conta Corrente
Descrição: Alterar o layout da aba de alteração de dados bancários 
de modo que fique igual ao do AdmPrev.
Pendência: 18045
Tela: Operacoes\Protocolo
Descrição do Erro: O MontaSelect não está buscando a matrícula como 
na consulta geral de pesssoas. Não seleciona a matrícula de pensionistas.
Pendência: 18072
Tela: Todas que utilizem Benefícios + Serviço
Descrição : Não trazer os registros da tabela benefícios com o campo descrubs = nulo.
Pendência: 18074
Tela: Operacoes\Atendimento
Descrição : Ao Final de um atendimento se o assunto estiver vinculado a somente um benefício ou serviço,
não apresentar a tela seguinte de seleção de Benefício ou Serviço X Situação.
Pendência: 18075
Tela: Cadastro\Assunto
Descrição : Acrescentar um campo na tela para relacionar um assunto a um Benefício ou Serviço..
================================================================================
CM$VER      3.01.65q    03/01/2005
--------------------------------------------------------------------------------
Pendência: 18399
Tela: Operações\Receb. Documentos
descrição: Ao selecionar a Rubs gerada, a tela está preenchendo os 2 grids dificultando assim o encaminhamento dos documentos da RUBS.
Pendência: 18251
Tela : Consultas\Relatórios\RUBS\Relatório de documentos recebidos por seção
descricao: Problema na emissão de (Rubs) Atualização de Conta Bancária de Pensionista. Envio em anexo o arquivo com os exemplos. Seguimos os passos para emissão de Rubs em nome do beneficiário e quando vamos imprimir o mesmo aparece a Rubs no nome do titular
Pendência: 18147
Tela : Operação\Rubs\Manutenção
Descrição: Quando geramos RUB para beneficiário, o mesmo está vindo em branco. Pois buscam os dados do ex participante.
Pendência: 18068
Tela : Cadastros\Rubs\Cadastro de Arquivos
Descrição: não obrigar o preenchimento no cadastro.
Pendência: 18141
Tela : Consulta\Relatorios\Rubs\Relatório de Documentos Recebidos por Seção
Descrição: alguns dados estão saindo duplicados no relatório com as seções intercaladas.
Pendência: 17224
Tela : Operação\Atendimento
Descrição: gravar a data e hora do atendimento após a saída da tela geração de RUBS, 
para não deturpar a estatística de atendimento.
================================================================================
CM$VER      3.01.65p    16/12/2004
--------------------------------------------------------------------------------
Pendência: 18251
Tela : Consultas\Relatórios\RUBS\Relatório de documentos recebidos por seção
descricao: Problema na emissão de (Rubs) Atualização de Conta Bancária de Pensionista. Envio em anexo o arquivo com os exemplos. Seguimos os passos para emissão de Rubs em nome do beneficiário e quando vamos imprimir o mesmo aparece a Rubs no nome do titular
Pendência: 18147
Tela : Operação\Rubs\Manutenção
Descrição: Quando geramos RUB para beneficiário, o mesmo está vindo em branco. Pois buscam os dados do ex participante.
Pendência: 18068
Tela : Cadastros\Rubs\Cadastro de Arquivos
Descrição: não obrigar o preenchimento no cadastro.
Pendência: 18141
Tela : Consulta\Relatorios\Rubs\Relatório de Documentos Recebidos por Seção
Descrição: alguns dados estão saindo duplicados no relatório com as seções intercaladas.
Pendência: 17224
Tela : Operação\Atendimento
Descrição: gravar a data e hora do atendimento após a saída da tela geração de RUBS, 
para não deturpar a estatística de atendimento.
================================================================================
CM$VER      3.01.65o    06/10/2004
--------------------------------------------------------------------------------
Pendência: 17476
Tela: Operações\Protocolo
Descrição: Criar um checkBox  (marcar se exibe mensagem de texto do protocolo na consulta geral de pessoa) e 
um campo data de expiração para que seja possível expirar a mensagem cadastrada.
================================================================================
CM$VER      3.01.65n    01/10/2004
--------------------------------------------------------------------------------
Pendência: 17433
Tela Cadastro\Rubs\Arquivos\Combo de colunas.
Descricao: disponibilizar os campos abaixo para montar os modelos de rubs.
Data de desligamento da empresa
Cidade da Agência bancária
UF da agência bancária
Parentesco
Data início do benefício
Data de afastamento
Beneficiários 
================================================================================
CM$VER      3.01.65m    14/09/2004
--------------------------------------------------------------------------------
Pendência 17378
Tela : Operaçôes\Rubs\Manutenção
Descrição: Ocorre um erro de sql quando se seleciona uma rubs de atendimento.
================================================================================
CM$VER      3.01.65l    06/08/2004
--------------------------------------------------------------------------------
Pendência: 17122
Tela: Auto-Atendimento\Exportação de Senhas
Descrição: Incluir tela de exportaçõa de senhas do autoatendimento.
================================================================================
CM$VER      3.01.65k    02/08/2004
--------------------------------------------------------------------------------
Pendência: 17224
Tela : Operação\Atendimento
Descrição: gravar a data e hora do atendimento após a saída da tela geração de RUBS, 
para não deturpar a estatística de atendimento.
Pendência: 17225
Tela: Operação\RUBS\Manutenção
Descrição: o sistema está sobrescrevendo o arquivo texto de RUBS do mesmo modelo. Isso não pode ocorrer para as RUBS 
emitidas no mesmo dia.
================================================================================
CM$VER      3.01.65j    07/05/2004
--------------------------------------------------------------------------------
Pendência 16343
Tela: Operações\Atendimento
Descrição: Ao alterar atendimento, na guia Geral F7, o campo resposta no CentralAP 
aparece uma mensagem de erro.
Pendência: 16676
Tela: Operações Receb. Documentos
Descrição: Ocorre um erro ao inserir consecutivamente mais de uma RUBs após 
clicar no botão de OK. Eo o sistema não permite fazer mais nada na tela após esse erro.
================================================================================
CM$VER      3.01.65i    15/04/2004
--------------------------------------------------------------------------------
Pendência 16516
Tela: AutoAtendimento\Alteração de senhas
descrição: implementar alterações para uso do novo modelo de form
================================================================================
CM$VER      3.01.65h    08/04/2004
--------------------------------------------------------------------------------
Pendência 16226
Tela: Operações\Registro de Atendimento
Descrição: Não está sendo possível atender a um dependente cujo titular ainda não é um 
participante.
================================================================================
CM$VER      3.01.65g    26/03/2004
--------------------------------------------------------------------------------
Pendência 15635
Tela: Consultas\Informe de Rendimentos
Utilizar a mesma de informe de rendimentos do sistema IRRF.
================================================================================
CM$VER      3.01.65f    27/02/2004
--------------------------------------------------------------------------------
Pendência 16144
tela: Consulta\Informe de rendimentos
Descrição: atualização da funcionalidade de emissão de informe de rendimentos IRRF.
================================================================================
CM$VER      3.01.65e    20/02/2004
--------------------------------------------------------------------------------
pendência 15718 do CentralAP
descrição: criação um atalho na tela de registro de atendimento para acessar a conta de 
contra-cheques diretamente.
================================================================================
CM$VER      3.01.65d    03/02/2004
--------------------------------------------------------------------------------
Pendência: 16050
tela          : Consulta\Relatórios\Estatístico de Atendimentos.
Descrição: Otimização das queries dos relatórios de estatística estatística.
 
================================================================================
CM$VER      3.01.65c    16/01/2004
--------------------------------------------------------------------------------
Pendência 15922
tela: consultas\Relatórios\CentraAp\Oficiais\Relatório de tempo de serviço
descrição: Acertos no cálculo d tempo de serviço.
Pendência 15946
tela: OPERAÇÕES/RUBS/MANUTENÇÃO
descrição: acerto do problema de impressão de RUBS.
================================================================================
CM$VER      3.01.65b    08/01/2004
--------------------------------------------------------------------------------
Pendência  15882
Tela : Consultas/Segunda via de contracheque 
Descrição: Implementação de um botão que possibilita marcar todos os históricos de 2 via de contra-cheque.
Pendência  15883
Tela : Consultas/relatórios/central de atendimentos/oficiais/segunda via de contracheque
Descrição: Implementação de um botão que possibilita marcar todos os históricos de 2 via de contra-cheque.
================================================================================
CM$VER      3.01.65a    06/01/2004
--------------------------------------------------------------------------------
Pendência  15870
Tela : \operações\Atendimento
Descrição: Não está aparecendo nos gráficos e relatórios, o TEMPO MÉDIO  e TEMPO TOTAL de atendimentos.
Análise: a hora de término do atendimento não estava sendo gravada corretamente, causando problema no cálculo de 
tempos médios de atendimento.
 
================================================================================
CM$VER      3.01.65     29/12/2003
--------------------------------------------------------------------------------
Pendência: 15696
Tela: Consultas\Relatórios\Estatísticos\Relatório Estattístico de Atendimento e Estatístico Detalhado
Descrição: Comparar o campo de filtro 'Atendente', entre os dois relatórios, 
pois em cada relatório aparece informações diferentes.
Pendência: 15660
Tela: Consultas/Segunda via de contracheque 
Descrição: Inserir a possibilidade de selecionar mais de um histórico da folha (mês) para emitir 
a 2ª via de contracheques.
 
================================================================================
CM$VER      3.01.64e    25/11/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15701:
Ao confirmar Inscrição e tentar imprimir, apresenta o erro:
Access violation at address 0172F70E in module 'CMExecEP50.bpl'. Read of address 00000310
================================================================================
CM$VER      3.01.64d    19/11/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15654:
Ao encerrar o atendimento continuado, o sistema traz a mensagem de 'Data Inicial maior 
que Data Final' , e mesmo alterando a data, ao gravar novamente, apresenta que não foi 
possível gravar o log mas conclui o atendimento.
>> Atualização do relatório de Informe de Rendomentos.
================================================================================
CM$VER      3.01.64c    17/11/2003
--------------------------------------------------------------------------------
>>Resoluçãoda pendência 15638: Cadastrar no SAD, permissão para os itens do menu Empréstimo:
                               Inscrição/Contratação, Contratação, Consulta Contrato
>>Resoluçãoda pendência 15639: Cadastrar no SAD, permissão para os botões do menu Inscrição em 
                               Empréstimo: Simulação, Contratar EP
================================================================================
CM$VER      3.01.64b    03/11/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15531:
**Na gravação do assunto, onde clicamos e selecionamos busca por plano, o assunto é informado várias vezes, como se não tivéssemos optado busca por plano e está dando erro de "LOOKUP TABLE IS NOT ACTIVE", somente para matricula 15000028-6 
** tive que alterar a query qryTitular
================================================================================
CM$VER      3.01.64a    16/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15243
  > Tela\Opçao No Sistema: Atendimento
  Ao tentar concluir um atendimento pendente, está dando constraint.
================================================================================
CM$VER      3.01.64     29/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15116
  > Tela\Opçao No Sistema: Principal
  Cadastrar no SAD todos os botões de atalho que aparecem na tela principal,  mesmo que o usuário não tenha acesso ao menu, consegue entrar na tela pelo atalho. 
================================================================================
CM$VER      3.01.63     19/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15065
  > Tela\Opçao No Sistema: Consultas
  Disponibilizar no CentralAp no menu Consultas\Extrato de Movimentação de Reserva o relatório de extrato de movimentação financeira.
- Resolução da Pendência Nº 15048
  > Tela\Opçao No Sistema: Operações\Atendimento
  Criar o campo idusuário na tabela ATEND com constraint referencial com a tabela USUSARIOSISTEMA PARA QUE NÃO SEJA POSSÍVEL A EXCLUSÃO DE UM USUÁRIO QUE JÁ TEMHA FEITO UM ATENDIMENTO, GARANTIDO ASSIM, A INTEGRIDADE DOS DADOS PARA FINS ESTATÍSTICOS, ETC. ESTE CAMPO DEVERÁ SER PREENCHIDO DURANTE O ATENDIMENTO.
- Resolução da Pendência Nº 15045
  > Tela\Opçao No Sistema: Cadastro\CPU de atendimento
  Criar uma constraint referencial na tabela ATEND relacionando-a com a tabela LOCALATENDXCPU. Antes de criar essa constraint deve-se criar um script para inserir os registros correspondentes na tabela LOCALATENDXCPU para que seja possível a criação da constraint.
================================================================================
CM$VER      3.01.62b    15/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15025
  > Tela\Opçao No Sistema: Cadastro/ CPU
  Quando entra no sistema está gravando várias vezes no cadastro de CPU.
================================================================================
CM$VER      3.01.62a    21/08/2003
--------------------------------------------------------------------------------
> Pequeno ajuste da pendência 14879
================================================================================
CM$VER      3.01.62     20/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14880
  > Tela\Opçao No Sistema: Consultas/Relatórios/Central de Atendimentos/RUB
  Incluir nas TELAS o  campo  "Obs." igual ao menu: Operações/Receb. Documentos.
- Resolução da Pendência Nº 14879
  > Tela\Opçao No Sistema: Menu: Consultas/R.U.B.S
  Incluir nas TELAS o  campo  "Obs." igual ao menu: Operações/Receb. Documentos.
================================================================================
CM$VER      3.01.61a    13/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14498
  > Tela\Opçao No Sistema: Relatórios/Rub/Relatório de Documentos Recebidos por Seção
  Inserir no filtro no relatório a consulta por: Matrícula do participante, Atendente e tipo de benefíco/serviço
- Resolução da Pendência Nº 14497
  > Tela\Opçao No Sistema: Relatórios/Rub/Relatório de Documentos Recebidos por Seção
  Ordenar o relatório por ordem alafabética
================================================================================
CM$VER      3.01.60b    15/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14558
  > Tela\Opçao No Sistema: Operações/Receb. Documentos 
  No menu Operações/Receb. Documentos, Foi cadastrado o recebimento do Resgate Direitos do Plano e Solicitação de Informação para o participante ALFREDO ROBERTO FLORES FONSECA. O relatório do caminho: cental de atendimento\rub\relatório de documentos recebidos por seção está "misturando" estes 02 cadastramentos.
================================================================================
CM$VER      3.01.60a    14/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14533
  > Tela\Opçao No Sistema: Operações/Receb. Documentos 
  O nome que foi selecionado no filtro para ser inserido é Maria Joaquina Fontoura Luiz, só que na tela aparece o nome do falecido Adao Valdir Luiz.
- Resolução da Pendência Nº 14531
  > Tela\Opçao No Sistema: Operações/Receb. Documentos 
  Foi cadastrado o recebimento da Reversão em Pensão do Benefício Saldado da beneficiária Maria Joaquina Fontoura Luiz  (rubs nº 439) , porém o relatório não está exibindo este cadastramento.
================================================================================
CM$VER      3.01.60     11/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14504
  > Tela\Opçao No Sistema: principal
  PessoALL,
como devem saber estaremos fazendo a apresentação do TotalPREV para a
SERCONPREV (Estados e Municipios) na 2a. e 3a. da proxima semana.
Estas instituições utilizam uma nomenclatura diferente das EFPPs.
Assim, para adequar nossos sistemas a esta nomenclatura, gostaria que todos
vocês implementassem (criem uma pendencia para isso) o seguinte em seus
sistemas :
1. No TfrmPrincipal.FormCreate adicionar a seguinte linha de código :
Screen.OnActiveFormChange := MudaCaptionFundacao;
2. Declarar a rotina procedure MudaCaptionFundacao(Sender: TObject); no
public do FPrincipal ;
3. No TfrmPrincipal.AppPadraoAfterLogin adicionar a seguinte linha de código
:
MudaCaptionFundacao(Sender);
4. Adicionar no FPrincipal a rotina MudaCaptionFundacao como arquivo em
anexo.
Obrigada,
================================================================================
CM$VER      3.01.59o    11/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14496
  > Tela\Opçao No Sistema: Operações/Receb. Documentos 
  Foi cadastrado o recebimento do Resgate de Reserva de Poupança de Ariele Romagna, matric. 502351-00, porém no relatório de documentos recebidos por seção está 02 vezes, 01 com a matrícula 502351-00 e outra com a 104901-01 que não foi cadastrada.
 
================================================================================
CM$VER      3.01.59m    09/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14466
  > Tela\Opçao No Sistema: RECEB. DOCUMENTOS
  No relatório de documentos recebidos por seção (rubs) não está visualizando o cadastramento de atualização de conta bancária de 02 pensionistas por morte:  Andreza Leao Carvalho e Carmem Lucia Leao Carvalho
================================================================================
CM$VER      3.01.58l    02/07/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14351
  > Tela\Opçao No Sistema: configuração do modelo de RUBS
  
Tela : CONFIGURAÇÃO DO MODELO DE RUBS
 Descrição: Não está sendo possível visualizar a RUBS configurada, nem mesmo quando se faz a emissão efetiva. O nome da RUBS é Solicitação de Empréstimo.
 
- Resolução da Pendência Nº 14341
  > Tela\Opçao No Sistema: CONFIGURAÇÃO DO MODELO DE RUBS
  Não está sendo possível visualizar a RUBS configurada, nem mesmo quando se faz a emissão efetiva. O nome da RUBS é Solicitação de Empréstimo
================================================================================
CM$VER      3.01.58k    24/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14326
  > Tela\Opçao No Sistema: Atendimento/Cadastro de Conta Corrente
  Não obrigar o preenchimento do número da conta ao cadastrar conta corrente.
- Resolução da Pendência Nº 14301
  > Tela\Opçao No Sistema: ATENDER >> ASSUNTO(S)-F6
  Ao gravar o assunto, o mesmo fica pendente.  Porém, quando atendimento vai concluir o assunto, surge a tela de erro com a mensagem : Restricao de Integridade - R_6887 - chave mãe não localidada.
O caso ocorreu para as seguintes matrículas: 
55003404 - Maria Alice Alves Moreira;
21060003 - Antonina de Lourdes Dezzem;
63025930 - Jaire Tapia;
32015438 - Maria de Lourdes dos Santos;
01000144 - José Ambrósio da Silva Filho;
================================================================================
CM$VER      3.01.58j    06/06/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14219
  > Tela\Opçao No Sistema: Atendimento/Dados do Participante/Endereços
  Quando se escolhe a Cidade não visualizamos o Estado. Isto ocasiona cadastramento errado.
 
================================================================================
CM$VER      3.01.58i    23/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14054
  > Tela\Opçao No Sistema: Cadastro / Protocolo / Grupo
  O grid com os nomes dos grupos não está sendo atualizado após a gravação da operação feita.
================================================================================
CM$VER      3.01.58h    21/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14045
  > Tela\Opçao No Sistema: Cadastro/RUBS/Cadastro de Arquivos
  Ao entrar na tela de Cadastro de arquivo de RUBS o sistema está exibindo a
mensagem "Não foi possível montar a query".
================================================================================
CM$VER      3.01.58g    20/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13991
  > Tela\Opçao No Sistema: Cadastro / RUBS / Tipo de arquivo
  Após procurar um nov arquivo, o grip com os campos associados ao arquivo está com o cabeçalho trocado. Na coluna onde constam os nomes dos campos está aparecendo como Descrição do header e vice-versa.
================================================================================
CM$VER      3.01.58f    12/05/2003
--------------------------------------------------------------------------------
> Resolução da pendência 13947.
================================================================================
CM$VER      3.01.58e    25/04/2003
--------------------------------------------------------------------------------
> Resolução das pendências 13842, 13817, 13818
================================================================================
CM$VER      3.01.58d    09/04/2003
--------------------------------------------------------------------------------
> Resolução da pendência 13719 - CBS - Invalid Blob handle in record buffer.
================================================================================
CM$VER      3.01.58c    08/04/2003
--------------------------------------------------------------------------------
> Resolução da pendência 13712 
erro ao gravar o log de segurança.
================================================================================
CM$VER      3.01.58b    01/04/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13594
  > Tela\Opçao No Sistema: OPERAÇÕES / RUBS/MANUTENÇÃO
  Não está sendo possível visualizar as rubs que já foram geradas e impressas e que necessitam de manutenção. 
================================================================================
CM$VER      3.01.58a    31/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12998
  > Tela\Opçao No Sistema: CONSULTAS/GRÁFICOS/ESTATÍSTICA DE ATENDIMENTOS  
  INCLUIR NAS OPÇÕES O TEMPO MÉDIO DE ATENDIMENTO
- Resolução da Pendência Nº 12999
  > Tela\Opçao No Sistema: CONSULTAS/RELATÓRIOS/CENTRAL DE ATENDIMENTOS/ESTATÍSTICOS/RELATÓRIO ESTATÍSTICO DE ATENDIMENTOS e RE
  INCLUIR O TEMPO UTILIZADO PARA CADA ATENDIMENTO REALIZADO
- Resolução da Pendência Nº 13281
  > Tela\Opçao No Sistema: Atendimento
  Precisamos criar um campo para registrarmos a hora da entrada na USE-Vila das pessoas. A hora do início do atendimento já existe, assim como a do final.
================================================================================
CM$VER      3.01.57y    25/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12237
  > Tela\Opçao No Sistema: REGISTRO DE ATENDIMENTO/EMPRÉSTIMO
  Ao clicar no botão empréstimo, o sistema já carregue o participante que foi selecionado para o atendimento sobre empréstimo, sendo assim desnecessário digitar novamente a matrícula
- Resolução da Pendência Nº 12237
  > Tela\Opçao No Sistema: REGISTRO DE ATENDIMENTO/EMPRÉSTIMO
  Ao clicar no botão empréstimo, o sistema já carregue o participante que foi selecionado para o atendimento sobre empréstimo, sendo assim desnecessário digitar novamente a matrícula
================================================================================
CM$VER      3.01.57a    28/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12998
  > Tela\Opçao No Sistema: CONSULTAS/GRÁFICOS/ESTATÍSTICA DE ATENDIMENTOS  
  INCLUIR NAS OPÇÕES O TEMPO MÉDIO DE ATENDIMENTO
- Resolução da Pendência Nº 12999
  > Tela\Opçao No Sistema: CONSULTAS/RELATÓRIOS/CENTRAL DE ATENDIMENTOS/ESTATÍSTICOS/RELATÓRIO ESTATÍSTICO DE ATENDIMENTOS e RE
  INCLUIR O TEMPO UTILIZADO PARA CADA ATENDIMENTO REALIZADO
- Resolução da Pendência Nº 13281
  > Tela\Opçao No Sistema: Atendimento
  Precisamos criar um campo para registrarmos a hora da entrada na USE-Vila das pessoas. A hora do início do atendimento já existe, assim como a do final.
================================================================================
CM$VER      3.01.56f    07/05/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13419
  > Tela\Opçao No Sistema: Dados do participante -F8/Endereços
  Não está sendo possível fazer a exclusão de um endereço desatualizado do participante.
- Resolução da Pendência Nº 13442
  > Tela\Opçao No Sistema: Registro de Atendimento/Dados do Participante/Endereço
  O campo Cidade só comporta 20 caracteres, e existe algumas cidades que possuem 23 caracteres.
================================================================================
CM$VER      3.01.56e    20/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12528
  > Tela\Opçao No Sistema: CentralAp
  Incorporar ao CentralAP as funcionalidades de Consulta de Contratos
- Resolução da Pendência Nº 12529
  > Tela\Opçao No Sistema: CentralAP
  Incorporar ao CentralAP as funcionalidades de Quitação
- Resolução da Pendência Nº 12531
  > Tela\Opçao No Sistema: CentralAp
  Incorporar ao CentralAP as funcionalidades de Cancelamento de Quitação
- Resolução da Pendência Nº 12532
  > Tela\Opçao No Sistema: CentralAp
  Incorporar ao CentralAP as funcionalidades de Amortização
- Resolução da Pendência Nº 12534
  > Tela\Opçao No Sistema: CentralAp
  Incorporar ao CentralAP as funcionalidades de Cancelamento de Amortização
- Resolução da Pendência Nº 12535
  > Tela\Opçao No Sistema: CentralAp
  Incorporar ao CentralAP as funcionalidades de Tratamento Individual de Parcelas
- Resolução da Pendência Nº 13163
  > Tela\Opçao No Sistema: Consulta\gráficos\estatistica
  Adaptar a query para a versão do Oracle.
================================================================================
CM$VER      3.01.56d    19/03/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 13163
  > Tela\Opçao No Sistema: Consulta\gráficos\estatistica
  Adaptar a query para a versão do Oracle.
================================================================================
CM$VER      3.01.56c    19/03/2003
--------------------------------------------------------------------------------
* ACERTO NA PASSAGEM DE PARÂMETROS PARA O EMPRÉSTIMO
================================================================================
CM$VER      3.01.56a    11/03/2003
--------------------------------------------------------------------------------
* Acerto no parâmetro do form do empréstimo.
================================================================================
CM$VER      3.01.55z    11/03/2003
--------------------------------------------------------------------------------
* Atualização do relatório de Informe de Rendimentos PF
================================================================================
CM$VER      3.01.55y    25/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12237
  > Tela\Opçao No Sistema: REGISTRO DE ATENDIMENTO/EMPRÉSTIMO
  Ao clicar no botão empréstimo, o sistema já carregue o participante que foi selecionado para o atendimento sobre empréstimo, sendo assim desnecessário digitar novamente a matrícula
================================================================================
CM$VER      3.01.55x    21/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12134
  > Tela\Opçao No Sistema: CADASTROS/RUBS/CADASTRO DE ARQUIVOS
  Inserir no item "nome de coluna" os seguintes campos:
- NOME ATENDENTE
- OPÇÃO DE MIGRAÇÃO 
- MÊS (NOMINAL)
-NOME DEPENDENTES IMPOSTO DE RENDA
-NOME BENEFICIÁRIOS LEGAIS
-SITUAÇÃO NA FUNDAÇÃO
-SITUAÇÃO NO PLANO
 
================================================================================
CM$VER      3.01.55v    19/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12133
  > Tela\Opçao No Sistema: CADASTRO DE REQUISIÇÃO ÚNICA DE BENEFÍCIOS E SERVIÇOS
  Erro ao selecionar o Benefício
- Resolução da Pendência Nº 12264
  > Tela\Opçao No Sistema: OPERAÇÕES/RUBS/MANUTENÇÃO
  Não está sendo possível fazer o cancelamento da RUBS.
- Resolução da Pendência Nº 12133
  > Tela\Opçao No Sistema: CADASTRO DE REQUISIÇÃO ÚNICA DE BENEFÍCIOS E SERVIÇOS
  Erro ao selecionar o Benefício
- Resolução da Pendência Nº 12264
  > Tela\Opçao No Sistema: OPERAÇÕES/RUBS/MANUTENÇÃO
  Não está sendo possível fazer o cancelamento da RUBS.
================================================================================
CM$VER      3.01.55u    12/02/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 12133
  > Tela\Opçao No Sistema: CADASTRO DE REQUISIÇÃO ÚNICA DE BENEFÍCIOS E SERVIÇOS
  Erro ao selecionar o Benefício
================================================================================
CM$VER      3.01.55t    10/02/2003
--------------------------------------------------------------------------------
*Averto no botão de consulta Participante <f4>
================================================================================
CM$VER      3.01.55s    07/02/2003
--------------------------------------------------------------------------------
* Nesta Versão:
- Acerto no erro que estava ocorrendo na tela de configuração de RUBS;
- Acerto na tela de atendimento que estava ocorrendo com a validação de número de cpf.
================================================================================
CM$VER      3.01.55r    06/02/2003
--------------------------------------------------------------------------------
* Implementação de função para permitir ao usuário Excluir um relatório de RUB Cadastrado.
* Ajuste no Form de cadastro de arquivos de Rubs para não permitir que o usuário altere o nome do campo de RUBS
porque se o usuário digitar qualquer coisa diferente do nome da coluna de tabela, irá fazer ocorrer o erro de "nome de coluna inválido"
no momento em que o usuário desenhar o relatório.
================================================================================
CM$VER      3.01.55q    04/02/2003
--------------------------------------------------------------------------------
* acerto na tela de configuração de rubs "nome de coluna inválido". O problema era na montagem da query dinâmica.
================================================================================
CM$VER      3.01.55p    31/01/2003
--------------------------------------------------------------------------------
* acerto na tela de configuração de rubs "nome de coluna inválido". O problema era na montagem da query dinâmica.
================================================================================
CM$VER      3.01.55o    31/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11816
  > Tela\Opçao No Sistema: Abertura de atendimento ao Participante
  Conforme mostra o .txt anexo, no momento em que o usuário do módulo central de atendimento estava com a tela de atendimento aberta ele "lockou" a tabela Logopcao e outros usuários de outros sistemas ficaram esperando a liberação da mesma para continuar o trabalho.
================================================================================
CM$VER      3.01.55n    31/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11812
  > Tela\Opçao No Sistema: Sistema/Configuração/ RELATÓRIO DE TEMPOS DE SERVIÇO 
  Preciso incluir algumas observações no relatório de tempos de serviço no centralap, mas não localizei este relatório no Gerador e pelo Menu: Sistema/Configuração/Relatórios também não é possível.
 
================================================================================
CM$VER      3.01.55m    29/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11744
  > Tela\Opçao No Sistema: CONSULTA DE ATENDIMENTO
  Está dando erro: ' Mensagem não traduzida - BDE 11830 Missing right quote.' .
================================================================================
CM$VER      3.01.55l    27/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11665
  > Tela\Opçao No Sistema: Consultas / Relatórios / RUB / Relatório recebidos por seção
  Incluir no relatório o campo com o benefício ou serviço solicitado na RUBS emitida no relatório.
- Resolução da Pendência Nº 11742
  > Tela\Opçao No Sistema: CONFIGURAÇÃO DO MODELO DE RUBS
  Quando aperta o alterar da erro de Coluna Inválida.
================================================================================
CM$VER      3.01.55k    27/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11665
  > Tela\Opçao No Sistema: Consultas / Relatórios / RUB / Relatório recebidos por seção
  Incluir no relatório o campo com o benefício ou serviço solicitado na RUBS emitida no relatório.
- Resolução da Pendência Nº 11742
  > Tela\Opçao No Sistema: CONFIGURAÇÃO DO MODELO DE RUBS
  Quando aperta o alterar da erro de Coluna Inválida.
================================================================================
CM$VER      3.01.55i    24/01/2003
--------------------------------------------------------------------------------
*Acerto no form de configuração de RUBS.
(problema do arquivo Temporário do gerador de relatórios).
================================================================================
CM$VER      3.01.55h    23/01/2003
--------------------------------------------------------------------------------
- Acerto do form de confecção do modelo de RUBS que apresentava problemas 
de acesso a arquivos temporários.
================================================================================
CM$VER      3.01.55g    21/01/2003
--------------------------------------------------------------------------------
-Acerto no form de filtro do Relatório de 2 via contra-cheque.
================================================================================
CM$VER      3.01.55f    17/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11562
  > Tela/ Registro de Atendimentos : Ao registrar um atendimento e clicar no botão 
de consulta atendimentos, o sistema não traz os dados do atendido. 
================================================================================
CM$VER      3.01.55e    17/01/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 11521
  > Tela\Opçao No Sistema: Relatórios - Central de Atendimento - Estatístico de Atendimento
  Está dando erro na geração do relatório. O erro é inserted value too large for column
- Resolução da Pendência Nº 11522
  > Tela\Opçao No Sistema: Consulta - Relatórios - Central de Atendimento - Estatístico de Atendimento Detalhado
  Quando gera o relatório está dando o seguite erro 'valor inserido grande demais para a coluna.'
================================================================================
CM$VER      3.01.55d    15/01/2003
--------------------------------------------------------------------------------
* Correção na query do montaselect do item de Recebimento de Documentos
================================================================================
CM$VER      3.01.55c    09/01/2003
--------------------------------------------------------------------------------
*Correção na tela de atendimento no campo Situação na Fundação. (estava errado).
================================================================================
CM$VER      3.01.55b    09/01/2003
--------------------------------------------------------------------------------
*Atualização do Control Object do Cáuculo de tempo de Serviço.
================================================================================
CM$VER      3.01.55a    30/12/2002
--------------------------------------------------------------------------------
*Alteração no FORM de Filtro para se pesquisar pela Matrícula do Titular (ElegPatro) ou pela Matrícula do Dependente (Depentit);
*Alteração na View VwParticipDepen.
================================================================================
CM$VER      3.01.54e    26/12/2002
--------------------------------------------------------------------------------
*Inclusão de gravação de Logs de segurança em todas as telas de consulta e cadastros solicitados pela CBS.
================================================================================
CM$VER      3.01.54d    13/12/2002
--------------------------------------------------------------------------------
*Acerto nas rotinas de impressão de RUBS.
================================================================================
CM$VER      3.01.54c    10/12/2002
--------------------------------------------------------------------------------
*Acerto nas queries geração de rubs com produto cartesiano.
*Acerto nas rotinas de impressão de RUBS
================================================================================
CM$VER      3.01.54b    05/12/2002
--------------------------------------------------------------------------------
* Adaptação na consulta elegível no form de atendimento.
================================================================================
CM$VER      3.01.54a    05/12/2002
--------------------------------------------------------------------------------
* Conserto do Messagebox que indica dá mensagem quando a CPU não está autenticada para atendimento.
================================================================================
CM$VER      3.01.54     04/12/2002
--------------------------------------------------------------------------------
*Remoção do campo PlnCodigoPrev da query qryBenef do datamodulo DtmAtend.
================================================================================
CM$VER      3.01.53     27/11/2002
--------------------------------------------------------------------------------
*Implementação do relatório de Tempo de serviço em 3 camadas.
*Atençâo!!! Rodar o TranfRelatório
================================================================================
CM$VER      3.01.52     26/11/2002
--------------------------------------------------------------------------------
* Conserto de preoblema na confecção de RUBS.
================================================================================
CM$VER      3.01.51     31/10/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 10004
  > Tela\Opçao No Sistema: Atendimento
  Incluir o campo local na pasta de endereços, conforme tela de cadastro de participantes.
- Resolução da Pendência Nº 10004
  > Tela\Opçao No Sistema: Atendimento
  Incluir o campo local na pasta de endereços, conforme tela de cadastro de participantes.
================================================================================
CM$VER      3.01.50     22/10/2002
--------------------------------------------------------------------------------
*Implementação da tela de Cadastro de Local de Atendimento;
*Implementação da tela de Cadastro de CPU de Atendimento.
================================================================================
CM$VER      3.01.49     17/10/2002
--------------------------------------------------------------------------------
Atualização do relatório de tempo de serviço
================================================================================
CM$VER      3.01.48     10/10/2002
--------------------------------------------------------------------------------
Com as devidas alterações partir do novo padrão 5.09.00.
================================================================================
CM$VER      3.01.47     03/10/2002
--------------------------------------------------------------------------------
******************************************************************
****** Atenção  Suporte!  Execute o TranfRelatório e o ZSQ**************
******************************************************************
- Resolução da Pendência Nº 8335
  > Tela\Opçao No Sistema: Simulações e Concessões
  Inserir simulações e concessões de empréstimo no Central.  Módulo empréstimoe disponibiliza uma BPL para integrar ao módulo Central.
- Resolução da Pendência Nº 9429
  > Tela\Opçao No Sistema: Atendimento
  Implementar que ao selecionarmos um assunto (sobre empréstimo) o mesmo traga 
automaticamente a tela do empréstimo.
- Resolução da Pendência Nº 8335
  > Tela\Opçao No Sistema: Simulações e Concessões
  Inserir simulações e concessões de empréstimo no Central.  Módulo empréstimoe disponibiliza uma BPL para integrar ao módulo Central.
- Resolução da Pendência Nº 9429
  > Tela\Opçao No Sistema: Atendimento
  Implementar que ao selecionarmos um assunto (sobre empréstimo) o mesmo traga 
automaticamente a tela do empréstimo.
================================================================================
CM$VER      3.01.46     24/09/2002
--------------------------------------------------------------------------------
***************************************************************  
*****                  Atenção!!!  execute o TranfRelatorio                    *****
***************************************************************
- Resolução da Pendência Nº 9296
  > Tela\Opçao No Sistema: Operações/ Atendimento 
  Para encerrar um atendimento pendente, o sistema exige que um novo assunto seja informado, sendo que este já havia sido informado anteriormente. Sendo assim, permitir encerrar um atendimento pendente, sem precisar associá-lo a  um novo assunto.
- Resolução da Pendência Nº 9298
  > Tela\Opçao No Sistema: Operações/ Atendimento 
  Inserir controle de acesso na pasta Gerais da tela de Atendimento. Esta implementação tem a finalidade de controlar os campos Pergunta, Resposta e Observação, de acordo com usuário, ele quer que somente algumas pessoas tenham acesso a manipular estes campos.
 
- Resolução da Pendência Nº 9342
  > Tela\Opçao No Sistema: Relatório Estatístico de Atendimento
  Inserir no filtro deste relatório mais duas opções de ordenação: "Matrícula" e "Código de Atendimento".
 
================================================================================
CM$VER      3.01.45     13/09/2002
--------------------------------------------------------------------------------
Implementaçaõ da pendência Num. 9207 que consiste em : Implementar um Relatório Estatístico detalhado por Cidades 
**** Importante **** O suporte deve executar o TransfRelatorio *****
- Resolução da Pendência Nº 8337
  > Tela\Opçao No Sistema: Impressão de Rubs
  Fazer a impressão de rubs via relatório do sistema e não via word. Agregaria valor ao produto.
 
- Resolução da Pendência Nº 9206
  > Tela\Opçao No Sistema: Relatório  Gráfico Estatístic
  Limitar o Número de Cidades no Gráfico Estatístico por parametrização 
================================================================================
CM$VER      3.01.44     10/09/2002
--------------------------------------------------------------------------------
**********************************************************************
Obs.: É imprescindível que se execute o TransfRelatório para que as novas funcionalidades funcionem.
**********************************************************************
- Resolução da Pendência Nº 8337
  > Tela\Opçao No Sistema: Impressão de Rubs
  Fazer a impressão de rubs via relatório do sistema e não via word. Agregaria valor ao produto.
 
- Resolução da Pendência Nº 9021
  > Tela\Opçao No Sistema: Consulta/ Relatório Estatístico de Atendimento
  Implementação dos campos PERGUNTA, RESPOSTA e OBSERVAÇÃO no Relatório Estatístico de Atendimento. 
Obs: Podera abrir o relatorio no Consulta Relatório, no disco D/Meus Documentos/Relatório Estatístico.
- Resolução da Pendência Nº 9055
  > Tela\Opçao No Sistema: Operações/ Atendimento
  Implementar um montaselect que informe os atendimentos com status de pendente para aquele determinado participante na tela do Atendimento. 
- Resolução da Pendência Nº 9099
  > Tela\Opçao No Sistema: Segunda via do Demonstrativo de Pagamento
  Criar um ícone que permita acessar o relatório de 2ª via de Contra-Cheque automaticamente. Foi solicitado que este ícone fique localizado na barra de ferramentas do sistema CentralAP
================================================================================
CM$VER      3.01.43     10/09/2002
--------------------------------------------------------------------------------
Deu erro de complilacao na versao anterior
================================================================================
CM$VER      3.01.42     10/09/2002
--------------------------------------------------------------------------------
Resolucao da pendência 9113 que consiste em otimizar a query do MontaSelect.
- Resolução da Pendência Nº 8337
  > Tela\Opçao No Sistema: Impressão de Rubs
  Fazer a impressão de rubs via relatório do sistema e não via word. Agregaria valor ao produto.
 
================================================================================
CM$VER      3.01.41     29/08/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8860
  > Tela\Opçao No Sistema: ALTERAÇÃO FILTRO GRÁFICO E RELATÓRIO
  O filtro do gráfico não está Ok. Faltou a inclusão da CIDADE nas OPÇÕES do filtro. 
- Resolução da Pendência Nº 8860
  > Tela\Opçao No Sistema: ALTERAÇÃO FILTRO GRÁFICO E RELATÓRIO
  O filtro do gráfico não está Ok. Faltou a inclusão da CIDADE nas OPÇÕES do filtro. 
================================================================================
CM$VER      3.01.40     28/08/2002
--------------------------------------------------------------------------------
Resolução da pendência 8333
================================================================================
CM$VER      3.01.39     22/08/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8334
  > Tela\Opçao No Sistema: Consulta/ Relatório
  Implementar os gráficos.
- Resolução da Pendência Nº 8597
  > Tela\Opçao No Sistema: Estatística de Atendimentos
  Consertar as barras sobrepostas do gráfico.
- Resolução da Pendência Nº 8598
  > Tela\Opçao No Sistema: Eatatística de Atendimentos
  -Colocar as informações dos hints numa legenda, pois os hints ficam sobrepostos.
- Resolução da Pendência Nº 8599
  > Tela\Opçao No Sistema: Estatística de Atendimentos
  Faltam 11 atendimentos para encerrar o mês de Junho. Fazer uma aferição e consertar caso haja algum erro de contagem.
- Resolução da Pendência Nº 8600
  > Tela\Opçao No Sistema: Estatística de Atendimentos
  Excluir do Cabeçalho o título (gráfico de barras)
- Resolução da Pendência Nº 8602
  > Tela\Opçao No Sistema: Estatística de atendimentos
  Centralizar e aumentar o fonte do texto (estatística de atendimentos)
- Resolução da Pendência Nº 8603
  > Tela\Opçao No Sistema: Estatística de atendimentos
  Incluir na legenda o total de atendimentos realizados.
- Resolução da Pendência Nº 8605
  > Tela\Opçao No Sistema: Estatística de Atendimentos
  Retirar o nome do assunto e colocar a quantidade, pois o nome já está na legenda.
================================================================================
CM$VER      3.01.38     02/08/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8309
  > Tela\Opçao No Sistema: Movimento no protocolo
  Mostra a mensagem de erro "transação do usuário já está em processo"
- Resolução da Pendência Nº 8310
  > Tela\Opçao No Sistema: Carta de Aviso de Pendência de RUBS
  Ao emitir a carta e clicar no botão replicar dá a mensagem de erro Access Violation.
================================================================================
CM$VER      3.01.37     29/07/2002
--------------------------------------------------------------------------------
(REFER) Conserto do BUG  no campo de número do Telefone na tela de atendimento, onde o usuário podia digitar um texto maior que o tamanho do campo, causando assim um erro de atualização de Dados.
================================================================================
CM$VER      3.01.36     23/07/2002
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 8062
  > Tela\Opçao No Sistema: Forma de Atendimento
  Implementar que o  Sistema exiba mensagem de alerta quando não for selecionada a forma de atendimento.
- Resolução da Pendência Nº 8063
  > Tela\Opçao No Sistema: Atendimento
  Implementar quanda se logar no sistema, exiba mensagem de alerta para confirmar o  dia, mês, ano e hora do atendimento, e a forma do atendimento.
- Resolução da Pendência Nº 8105
  > Tela\Opçao No Sistema: Atendimento / Contas Bancárias
  Implementar a busca da agência pelo nº e não pelo nome.
- Resolução da Pendência Nº 8168
  > Tela\Opçao No Sistema: Consultas / Etiquetas / Imprime 
  Retirar do campo Matrícula, na tela de filtro, o dígito verificador
================================================================================
CM$VER      3.01.35     19/07/2002
--------------------------------------------------------------------------------
-Acerto no relatório 2 Via do contra-cheque.
Obs: Para se utilizar as funções abaixo, é necessário que o gestor do sistema marque na tela de parâmetros do sistema a opção 
"Confirmar Data, Hora e Tipo de Atendimento no LogOn"
-Implementar quanda se logar no sistema, exiba mensagem de alerta para confirmar o  dia, mês, ano e hora do atendimento, e a forma do atendimento.
-Implementar que o  Sistema exiba mensagem de alerta quando não for selecionada a forma de atendimento.
- Resolução da Pendência Nº 8063
  > Tela\Opçao No Sistema: Atendimento
  Implementar quanda se logar no sistema, exiba mensagem de alerta para confirmar o  dia, mês, ano e hora do atendimento, e a forma do atendimento.
- Resolução da Pendência Nº 8062
  > Tela\Opçao No Sistema: Forma de Atendimento
  Implementar que o  Sistema exiba mensagem de alerta quando não for selecionada a forma de atendimento.
- Resolução da Pendência Nº 8062
  > Tela\Opçao No Sistema: Forma de Atendimento
  Implementar que o  Sistema exiba mensagem de alerta quando não for selecionada a forma de atendimento.
- Resolução da Pendência Nº 8063
  > Tela\Opçao No Sistema: Atendimento
  Implementar quanda se logar no sistema, exiba mensagem de alerta para confirmar o  dia, mês, ano e hora do atendimento, e a forma do atendimento.
================================================================================
CM$VER      3.01.34     15/07/2002
--------------------------------------------------------------------------------
Nesta versão estão incluídos todos os Help Contexts de todos os Forms e ítens de Menu.
================================================================================
CM$VER      3.01.33     02/07/2002
--------------------------------------------------------------------------------
Resolucao das pendências 7124, 7326, 7327, 7091 e 7121
- Resolução da Pendência Nº 7091
  > Tela\Opçao No Sistema: Recebimento de Documentos
  Conforme conversado hoje (28.05) segue uma pendência em relação ao assunto
"Protocolo de documentos através de RUBS":
. para implementarmos a figura do destinatário, podemos utilizar duas
estruturas hoje existentes:
  . Grupo de Usuário - relacionado a acesso de menus
  . Centro de Responsabilidade - relacionado a montagem do Orçamento;
ocorre que a 1a estrutura pode ter subdivisões de um mesmo setor, como por
exemplo:
  . DEABE / SEBEC / AUXDOENCA
  . DEABE / SEBEC / APOS_PENSAO
Neste caso, não temos o organograma da empresa e sim uma estrutura de
funções.
A segunda alternativa é a que se aproxima mais do organograma, no entanto,
ela não é de utilização obrigatória dentro de nossa solução e, mesmo quando
utilizada, não teremos como garantir que reflita o que desejamos como
"destinatário".
A questão é: utilizamos a estrutura "Centro de Responsabilidade" e o cliente
só terá a opção de "Protocolo de Documentos" na Central de Atendimento
quando utilizá-la, ou criam
- Resolução da Pendência Nº 7121
  > Tela\Opçao No Sistema: Relatório de Recebimento de Documentos
  -Solicitado po Flávio Dias para FCRT
Implementar relatório de documentos recebidos por seção, com filtro de data e de seção, com quebra por seção, contendo os campos Matrícula, Nome, Documento, Data de Recebimento, Seção e Responsável.
- Resolução da Pendência Nº 7091
  > Tela\Opçao No Sistema: Recebimento de Documentos
  Conforme conversado hoje (28.05) segue uma pendência em relação ao assunto
"Protocolo de documentos através de RUBS":
. para implementarmos a figura do destinatário, podemos utilizar duas
estruturas hoje existentes:
  . Grupo de Usuário - relacionado a acesso de menus
  . Centro de Responsabilidade - relacionado a montagem do Orçamento;
ocorre que a 1a estrutura pode ter subdivisões de um mesmo setor, como por
exemplo:
  . DEABE / SEBEC / AUXDOENCA
  . DEABE / SEBEC / APOS_PENSAO
Neste caso, não temos o organograma da empresa e sim uma estrutura de
funções.
A segunda alternativa é a que se aproxima mais do organograma, no entanto,
ela não é de utilização obrigatória dentro de nossa solução e, mesmo quando
utilizada, não teremos como garantir que reflita o que desejamos como
"destinatário".
A questão é: utilizamos a estrutura "Centro de Responsabilidade" e o cliente
só terá a opção de "Protocolo de Documentos" na Central de Atendimento
quando utilizá-la, ou criam
- Resolução da Pendência Nº 7121
  > Tela\Opçao No Sistema: Relatório de Recebimento de Documentos
  -Solicitado po Flávio Dias para FCRT
Implementar relatório de documentos recebidos por seção, com filtro de data e de seção, com quebra por seção, contendo os campos Matrícula, Nome, Documento, Data de Recebimento, Seção e Responsável.
- Resolução da Pendência Nº 7091
  > Tela\Opçao No Sistema: Recebimento de Documentos
  Conforme conversado hoje (28.05) segue uma pendência em relação ao assunto
"Protocolo de documentos através de RUBS":
. para implementarmos a figura do destinatário, podemos utilizar duas
estruturas hoje existentes:
  . Grupo de Usuário - relacionado a acesso de menus
  . Centro de Responsabilidade - relacionado a montagem do Orçamento;
ocorre que a 1a estrutura pode ter subdivisões de um mesmo setor, como por
exemplo:
  . DEABE / SEBEC / AUXDOENCA
  . DEABE / SEBEC / APOS_PENSAO
Neste caso, não temos o organograma da empresa e sim uma estrutura de
funções.
A segunda alternativa é a que se aproxima mais do organograma, no entanto,
ela não é de utilização obrigatória dentro de nossa solução e, mesmo quando
utilizada, não teremos como garantir que reflita o que desejamos como
"destinatário".
A questão é: utilizamos a estrutura "Centro de Responsabilidade" e o cliente
só terá a opção de "Protocolo de Documentos" na Central de Atendimento
quando utilizá-la, ou criam
- Resolução da Pendência Nº 7121
  > Tela\Opçao No Sistema: Relatório de Recebimento de Documentos
  -Solicitado po Flávio Dias para FCRT
Implementar relatório de documentos recebidos por seção, com filtro de data e de seção, com quebra por seção, contendo os campos Matrícula, Nome, Documento, Data de Recebimento, Seção e Responsável.
================================================================================
CM$VER      3.01.32     21/06/2002
--------------------------------------------------------------------------------
* Implementaçao da pendência 5267 que consiste em apresentar uma tela que possibilita a
alteração do local de atendimento do terminal no momento do login, o que atendende a estrutura de rede
utilizada na |CBS.
================================================================================
CM$VER      3.01.31     20/06/2002
--------------------------------------------------------------------------------
-Retirado o erro I/O ERROR 103 ma tela de Manutenção de RUBS que consistia na tentativa de 
criar um arquivo texto num caminho que não existia ou estava inacessível, foi colocado uma mensagem
para que o usuário verifique o caminho cadastrado para o arquivo se está acessível ou se a unidade de disco
do mesmo existe.
-Atualizado Por Paulo Ramos os fontes do Relatório de segunda via de Contra-Cheque
================================================================================
CM$VER      3.01.30     22/05/2002
--------------------------------------------------------------------------------
-Conserto de um erro de access violation na tela de atendimento no momento da conclusão do atendimento;
-Criação da pasta de alteração de documentos nos dados do participante;
-Incorporado ao projeto os relatórios comuns a outros módulos (esses relatórios foram retirados da BPL CMTotalPrev.bpl).
-OS BOTOES DE INCLUSÃO, EXCLUSÃO E ALTERAÇÃO DOS DADOS DO PARTICIPANTE NA TELA DE 
ATENDIMENTO FORAM CADASTRADOS NO SAD PARA QUE O GESTOR DÊ AS DEVIDAS PERMISSOES 
DE USO PARA OS USUÁRIOS.
================================================================================
CM$VER      3.01.23     27/03/2002
--------------------------------------------------------------------------------
Inclusão de nova funcionalidade solicitada pela fundação CRT que consiste em gerar RUBS de RECADASTRAMENTO.
Resolução das pendências nums. 5587, 5588, 5589
auterações e resolução de BUGS diversos.
  
================================================================================
CM$VER      3.01.22     12/03/2002
--------------------------------------------------------------------------------
Deu algum problema da última ves que liberei uma versão, or arquivos simplesmente não foram atualizados.
================================================================================
CM$VER      3.01.21     07/03/2002
--------------------------------------------------------------------------------
-Conserto dos campos Estado, Cidade e Telefone do solicitante que não estavam corretos e não estavam sendo gravados devidamente na tabela ATEND;
-Retirada a condição ( PARTPREVPLAN.FLGDESATIVADO = 0 ) do montaselect msParticipDepen que não deixava buscar um participante desativado e portanto não conseguia ser atendido;
-Inclusão do campo na Tela de atendimento que indica se o Participante está bloqueado, esse campo só fica visível se o participante estiver bloqueado e se a Fundação utiliza 
a funcionalidade de Bloqueio e Besbloqueio da tela do item de menu(Operações/Protocolo);
-Retiradas algumas constraints erradamente colocadas na criação das novas colunas criadas na tabela ParamCentralAp na versão anterior.
================================================================================
CM$VER      3.01.20     28/02/2002
--------------------------------------------------------------------------------
-Criada uma view (vwparticipdepen) que seleciona em qualquer função do módulo um participante ou um dependente em um único MontaSelect;
-Reformulação da tela de parâmetros gerais onde foram incluídos os parâmetros : Documento de Identidade Padão, Controle de alteração e exclusão
  de protocolos e configuração de geração de protocolos automáticos por operação.
-Na tela de Cadastro de Protocolo foi criada a opção de Bloqueio e Liberação de participantes no ato de inclusão de protocolos.
-Na tela de Atendimento foram incluídos os campos CPF e RG do solicitante, na parte de inclusão de assuntos o assunto ou 
  grupo de assuntos são selecionados através de combos e a inclusão resposta padrão é automática e criada uma parte 
  (tabsheet) onde o usuário pode consultar a relação de documentos requeridos por benefício.
-Em todo o módulo foram retiados inúmeros erros de constraints;
-Conserto do BUG que não permitia que se contiuasse um atendimento pendente.
================================================================================
CM$VER      3.01.14     08/10/2001
--------------------------------------------------------------------------------
·	Retirado do menu a opção de Complemento do Assunto do Protocolo, pois o Assunto já tinha 100 caracteres, que adicionados aos 100 deste complemento, já davam os 200 caracteres possíveis do Protocolo.
·	Alterados os nomes:
Cadastros \ Protocolos \ Assunto è Cadastros \ Protocolo \ Grupo
·	Na Tela de Operações\Protocolo:
o	Retirado o botão de busca Assunto
o	Acrescentado o combo de Grupo
o	Gravando o Id do Grupo no Protocolo
o	Alterado o campo do Assunto para Memo e alterado o label para “Texto”
·	Inserida a Consulta ao Participante padrão (TotalPrev.bpl) no menu “Consulta”.
·	Tela de Atendimento:
o	A alteração do endereço na tela de atendimento não altera mais o endereço do participante
o	Retiradas todas as orelhas de consultas da tela, que já existem na Consulta ao Participante Padrão
o	Acrescentada orelha para visualização de Endereços / Telefones / Contas Bancárias.
o	Alteração de UF e Cidade para combo ao invés de digitação livre
o	Acrescentado os tipos de telefones por Check ao invés de apresentar somente as letras relativas a cada tipo
o	Acerto nas teclas de atalho para possibilitar a operação de atendimento sem utilização do mouse. Ex.: <CTRL><I> | <CTRL><A> e <CTRL><E> ativam as inclusões|alterações|exclusões de Assunto / Endereço/Telefone e Conta Bancária, de acordo com a orelha posicionada.
o	Utilização de default para “Forma de Atendimento”, conforme parametrização.
o	Habilitada a opção de informar um atendimento como “Pendente”
o	Acerto no Sistema para complementar e encerrar atendimentos pendentes, criando um novo atendimento em seqüência para o anterior.
·	Criado parâmetro do Sistema para “Forma de Atendimento Padrão” em Sistema\Configuração\Parâmetros.
================================================================================
CM$VER      3.01.08     22/08/2001
--------------------------------------------------------------------------------
Inclusão das telas de consultas do admprev
================================================================================
CM$VER      3.01.07     27/06/2001
--------------------------------------------------------------------------------
Acerto da consulta de Pagamento ,
Inclusão das criticas de elegividade, na geração das Rubs de benefícios
================================================================================
CM$VER      3.01.05     13/06/2001
--------------------------------------------------------------------------------
Inclusão do campo estado do solicitante na gerações das Rubs
================================================================================
CM$VER      3.01.04     11/06/2001
--------------------------------------------------------------------------------
Descrição de termo e beneficio sair no termo
================================================================================
CM$VER      3.01.01     01/06/2001
--------------------------------------------------------------------------------
Inclusão do Modulo do Fiário
================================================================================
CM$VER      3.01.00     03/05/2001
--------------------------------------------------------------------------------
- Customizações Diversas
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
Liberação de Versão Delphi 5
================================================================================
CM$VER      2.15.00     19/02/2001
--------------------------------------------------------------------------------
- Atendimento
  Correção da seleção de Barticipantes\Beneficiários de acordo como a 
  sitiação do mesmo na fundação: PARTPREVPLAN.FLGDESATIVADO = '0'
- Login
  Correção do erro 'unknow database alias' no login do sistema.
================================================================================
CM$VER      2.14.01     12/02/2001
--------------------------------------------------------------------------------
- Atendimento
  Correção do erro "Field 'Descrição' is not of expected type" ao acessar os 
  dados funcionais no atendimento;
================================================================================
CM$VER      2.14.00     23/01/2001
--------------------------------------------------------------------------------
- Cadastro de Modelos de RUBS
  Inclusão das colubas NUMERO_DOCUMENTO_PARTICIPANTE e NOME_DOCUMENTO_PARTICIPANTE ;
- Tela Principal
  Correção na chamada do Gráfico Estatístico de Atendimento;
================================================================================
CM$VER      2.13.01     11/01/2001
--------------------------------------------------------------------------------
- Tela de Atendimento
  Correção na seleção de assuntos para atendimento
================================================================================
CM$VER      2.13.00     04/01/2001
--------------------------------------------------------------------------------
- Tela de Consulta de Atendimento
  Verificar os combos permitindo limpar conteúdo da seleção;
  Alterar display de dados para um controles;
- Tela de Atendimento
  Cencelar obrigatoriedade do campo telefone;
  Permitir atualização de endereço do atendimento (RUB) e do participante (PESSOA);
  Verificar autorização do atendimento de acordo com autorização do menu;
  Na indicação de assundo, qdo filtrados por plano, exibir também os não associados
  a plano;
- Geração da RUBS
  Colocar Zeros a Esquerda do IDRUBS (indicar na configração do arquivo a largura da coluna);
  Verificar a geração da descrição dos documentos (Os documentos são impressos de acordo com o número de colunas 'NOMEDOCUMENTO' definidas no cadastro do arquivo);
- Cadastro de Assunto
  Incluir na procura filtro por Grupo de Asssunto; 
- Cadastro de Resposta Padrão
  Erro na exclusão: Encontrado um registro filho;
================================================================================
CM$VER      2.12.02     20/11/2000
--------------------------------------------------------------------------------
- Benefícios X Situação
- Benefícios X Documentos
- Benefícios X Termos
- Cadastro de RUBS
  > Correção no display do nome do benefício: Passou a ser exibido o conteúdo da
     coluna DESCRUB da tabela de benefícios.
  > Inclusão da confirmação da inclusão/Exclusão de todos os itens da lista.
  > Correção nda inclusão/exclusão do último item da lista.
  
================================================================================
CM$VER      2.12.01     09/10/2000
--------------------------------------------------------------------------------
Manutenção de RUBS: 
Implementação da efetivação de alterações para todos as RUBS selecionadas para manutenção;
Implementação do filtro por situações distintas da RUBS.
Cadastro de Tipos de Arquivos:
Implementação dos Cadastros de Cartas de Rosto, Termos e Etiquetas a serem emitidas com a RUBS;
Exclusão da obrigatoriedade da indicação do tamanho do campo no Cadastro do Tipo de Arquivo a fim de que o arquivo possa ser gerado levando em consideração apenas a largura das colunas na base;
Cadastro Termos X Benefícios:
Implementação do Relacionamento;
Parâmetros de Emissão de RUBS:
Implementação da gravação da Carta de Rosto e Etiqueta para emissão de RUBS;
Emissão de RUBS:
Implementação da emissão de Carta, Etiqueta e Termos de RUBS automaticamente de acordo com parametrização do "Cadastro Termos X Benefícios" e "Parâmetros de Emissão de RUBS".
Implementação da criação automática do diretório de destino dos arquivos caso não exista;
Correção da geração dos arquivos de RUBS, Carta,  Etiqueta e Termos para sempre sobrescrever o arquivo gerado;
Relatório de Posição de RUBS:
Implementação do Relatório com estrutura de Filtro/Seleção semelhante a Tela de Manutenção de RUBS;
Tela de Seleção de Motivo de Cancelamento\Recebimento:
Correção na seleção dos Motivos de acordo com a situação (Cancelamento ou Recebimento);
Montagem da RUBS:
Correção na duplicidade dos registros na seleção da Situação do Benfício/Serviço;
Histórico de Movimentação de RUBS:
Implementação de gravação do Histórico para todos os eventos da RUBS: Geração, Emissão, Cancelamento, Geração e Emissão de Segunda Via, Recebimento de RUBS, Recebimento de Documentos, Cancelamento de Documentos, Emissão de Cartas, Termos e Etiquetas.
Cadastro de Arquivos
Incluir as colunas: Dia de Emissão, Mês de Emissão, Ano de Emissão, Número da RUBS, Documento Do Participante, Telefone Do Participante, Dados Gerais do Solicitante.
================================================================================
CM$VER      2.08.00     18/09/2000
--------------------------------------------------------------------------------
- Implementações Gerais para o controle de RUBS
- Resolução da Pendência Nº 1933
  > Tela\Opçao No Sistema: Atendimento
  Incluir no page control empréstimo o saldo devedor, parcelas pagas e números de parcelas
================================================================================
CM$VER      2.07.04     04/09/2000
--------------------------------------------------------------------------------
- Central de Atendimento
  * Tela de Atendimento
    Correção na validação da data final do atendimento não é indicada;
    Correção na gravação do Id do Processo do RAD gerado resultante de uma atendimento;
    Otimização das consultas da tela de atendimento;
    Atualização da resposta selecionada para um determindado assunto ao se trocar para um outro assunto;
================================================================================
CM$VER      2.07.02     14/08/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
   Correção na largura do campo descrição da tabela SITIFUNC
================================================================================
CM$VER      2.07.01     08/08/2000
--------------------------------------------------------------------------------
- Atualização do projeto para compatiblização com o novo padrão
================================================================================
CM$VER      2.07.00     14/07/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
  Otimização: Alteração na busca da Forma de  Atendimento e do Assunto  
  (permitindo pesquisar pelo grupo de assunto);
  Visualização completa da resposta associada ao assunto;
- Cadastro de Assunto
- Cadastro de Resposta Padrão
- Consulta Atendimento
- Relatório Estatístico  
  Alteração da largura do campo da Resposta Padrão
- Tela de Atendimento
- Cadastro de Assunto
- Resposta Padrão
  Correção na edição de resposta padrão pelo 'Editor Default' do controle;
================================================================================
CM$VER      2.06.00     05/06/2000
--------------------------------------------------------------------------------
- Cadastro de Grupos de Assuntos
  Impementação da Tela;
- Cadastro de Assuntos
  Inclusão da Indicação do Grupo de Assunto ( Obrigatório )
- Gráfico Estatístico de Atendimentos
  Implementação da contagem por grupo de assunto;
  Implementação da Filtragem por grupo de assunto;
  Correção nas contagens envolvendo atendimentos com vários assuntos
- Relatório Estatístico de Atendimentos
  Implementação da contagem por grupo de assunto;
  Implementação da Filtragem por grupo de assunto;
- Login do Sistema
  Correção na seleção da forma de atendimento padrão;
- Cadastro de Resposta Padrão
  Implementação da barra de rolagem horizontal no cadastro de resposta padrão
================================================================================
CM$VER      2.04.09     11/05/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 1492
  > Tela\Opçao No Sistema: 
  Testar padrão e a funcionalidade com o novo ambiente Oracle 8.
- Resolução da Pendência Nº 1929
  > Tela\Opçao No Sistema: Atendimento
  Possibilitar um atendimento ter vários assuntos
- Resolução da Pendência Nº 1934
  > Tela\Opçao No Sistema: Atendimento
  Ao sair da tela de atendimento e retorna pelo botão "Atendimento" ou opção de menu/arquivo/atendimento e selecionar um participante os dados do participante não estão aparecendo
- Resolução da Pendência Nº 1935
  > Tela\Opçao No Sistema: Atendimento
  Melhorar a performance da tela de atendimento
- Resolução da Pendência Nº 1936
  > Tela\Opçao No Sistema: Atendimento
  Acertar a altura da tela de atendimento para 800x600
- Resolução da Pendência Nº 1937
  > Tela\Opçao No Sistema: Atendimento
  Ao iniciar um atendimento o sistema coloca o atendimento da situação  ao gravar a situação é gravada em branco e as opções de situação são  Pendente, Cancelado, Concluído.
Ao reabrir este atendimento e gravar, o sistema solicita que se informe a situação do atendimento. As opções são Pendente, Cancelado, Concluído.
- Resolução da Pendência Nº 1938
  > Tela\Opçao No Sistema: Atendimento
  Aparecer a situação cadastral do Participante fazendo a contagem para efeito de estatísticas de atendimento
- Resolução da Pendência Nº 1939
  > Tela\Opçao No Sistema: Atendimento
  Criar contagem de atendimento por assunto e por atendimento
- Resolução da Pendência Nº 1940
  > Tela\Opçao No Sistema: Atendimento
  Verificar consulta dos processos RAD
- Resolução da Pendência Nº 1941
  > Tela\Opçao No Sistema: Atendimento
  Alterar mensagem de Tipo de Atendimento para Forma de Atendimento
- Resolução da Pendência Nº 1942
  > Tela\Opçao No Sistema: Atendimento
  Ordenar os combos "Forma de Atrendimento" e "Assunto"
- Resolução da Pendência Nº 1943
  > Tela\Opçao No Sistema: Atendimento
  Aumentar o campo de visualização da resposta padrão
- Resolução da Pendência Nº 1944
  > Tela\Opçao No Sistema: Atendimento
  Na pasta assunto alterar a sequeência do cursos para a seguinte ordem Assunto, PErgunta, Resposta Padrão, Resposta e Observações
- Resolução da Pendência Nº 1945
  > Tela\Opçao No Sistema: Cadastro de Assunto
  Quando se insere uma resposta padrão a um assunto e se dá ok no detalhe ele retoma a consulta de resposta padrão como se fosse selecionar outra resposta. NÃO EXIBIR O MONTASELECT.
- Resolução da Pendência Nº 1946
  > Tela\Opçao No Sistema: Consulta/Gráficos/Estatística de Atendimentos
  Fazer seleção por plano previdenciário.
Fazer Seleção por situação cadastral.
- Resolução da Pendência Nº 1947
  > Tela\Opçao No Sistema: Consulta/Atendimentos
  Separar consulta por plano previdenciário;
Separar consulta por situação cadastral;
Separar consulta por Local de Atendimento;
- Resolução da Pendência Nº 1948
  > Tela\Opçao No Sistema: Relatório/Estatísticos
  Apresentar no relatório a hora início e fim do atendimento;
Constar na consulta o local de atendimento;
Acrescentar nos parâmetros, estatísticas por plano previdenciário;
Acrescentar nos parâmetros estatísticas por situação cadastral;
Acrescentar nos parâmetros estatísticas por local de atendimento.
- Resolução da Pendência Nº 1949
  > Tela\Opçao No Sistema: Cadastro de respostas padrão
  Aumentar o campo resposta padrão de forma que o usuário visualiza toda resposta cadastrada
================================================================================
CM$VER      2.04.08     05/05/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
  Correção no erro de contraint ao encerrar o atendimento sem informa a forma ou deixando 
  a grade de assuntos sem confirmação;
================================================================================
CM$VER      2.04.07     28/04/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
   Otimização da Abertura da Tela
================================================================================
CM$VER      2.04.06     20/04/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
  * Correção na consulta de procura do participante para buscar o beneficiário;
  * Consulta de Processos: 
     > Inclusão do IDPROCESSO;
     > Disponibilizada com um 'Duplo Click' a consulta detalhada ao processo do RAD;
  * Dados do Funcionário: Correção no display do 'SEXO';
  * Implementação da indicação da situação do atendimento na finalização do mesmo;
  * Correção na procura do atendimento para trazer somente atendimento com situação <> de 'Concluído';
  * Encerrar atendimento quando o mesmo for continuado;
  * Implementação da visualização dos assuntos do atendimento anterior no ato da continuação do mesmo;
  * Correção no 'Click' do botão do participante quando o atendimento não está em andamento;
- Gráfico Estatísticas de Atendimento
  * Otimização nas consultas na abertura da tela;
  * Inclusão da seleção e contagem por local de atendimento;
- Consulta de Atendimento
  * Correção no 'Display' do nome do computador; 
- Tela de Atendimento, Consulta, Gráfico e Parâmentro de Relatórios
  * Correção no 'Display' de 'Situação Cadastral' Para 'Situação do Participante'; 
- Relatórios Estatísticos
  * Correção no nome do relatório;   
================================================================================
CM$VER      2.04.05     19/04/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
  Implementação da consulta geral ao processo do RAD gerado pelo atendimento com 
  um duplo click no registro do Processo na Pasta da tela de atendimento;
================================================================================
CM$VER      2.04.04     18/04/2000
--------------------------------------------------------------------------------
- Tela de Atendimento 
  * Correção no Loop no momento do OK final do atendimento;
  * A Informação relativa ao SEXO do funcionário está aparecendo, favor verificar o registro na base;
  * Limpar a resposta padrão quando da escolha de outro assunto;
- Parâmetro do relatório de atendimento
  * Otimização nas consultas;
================================================================================
CM$VER      2.04.03     17/04/2000
--------------------------------------------------------------------------------
- Tela de Atendimento 
  * Selecionar os beneficiários na consulta do participante para o atendimento;
  * Informar a situação do participante no momento do atendimento;
  * No cadastro de Assunto os Check Box ( RUB e RAD ) são 'infomativos' da parametrização do cadastro, não podendo ser    
    modificados;
  * A resposta padrão so pode ser selecionada após a seleção do assunto do atendimento;
  * Consulta detalhada do processo do RAD pelo central ( Não Implementado )
  * Exibir 'SEXO' na tela de dados do funcionário;
  * Inclusão dos Títulos de todos os Grid's na tela de atendimento;
- Consulta / Gráficos /  Estatísticos 
  * Opções Assunto 
    Inclusão do JOIN ASS.IDASSUNTO = AST.IDASSUNTO
  * Opções Patrocinadora  
    Correção da consulta para contagem dos dados
  * Filtragem 
    Correção dos filtros por Assunto / Patrocinadora / Situação
- Relatório Estatístico 
  * Inclusão do tempo de atendimento 
  * Obs.: Com relação a formatação solicito o layout antigo para alterações no formato atual;
- Geração do arquivo texto da RUBS
  Implementação na Geração do arquivo baseado no cadastro de Modelos de RUBS;
================================================================================
CM$VER      2.04.02     15/04/2000
--------------------------------------------------------------------------------
- Correção do Cadastro de Modelos de RUBS;
- Tela de Atendimento
  Correção na abertura das consultas ao retornar a tela de atendimento
================================================================================
CM$VER      2.04.01     14/04/2000
--------------------------------------------------------------------------------
- Implementação do Cadastro de Modelos de RUBS;
- Alteração na Largura dos campos para o cadastro e associação das respostas padrão;
- Correção da Tela de Parâmetro do Relatório de Documento X Rubs;
================================================================================
CM$VER      2.04.00     13/04/2000
--------------------------------------------------------------------------------
- Alterções diversas
  Alteradas todos as telas, realtórios e consultas para contemplar o novo
  modelo de dados onde temos vários assuntos para o mesmo atendimento;
- Tela de Atendimento
  Inclusão da situação cadastral do participante;
  Correção da consulta de processos do rad;
  Correção da mensagemde Tipo de Atendimento Para Forma de Atendimento;
  Ordenação dos Combos de 'Forma de Atendimento' e 'Assunto';
  Implementação da associação de vários assuntos ao mesmo atendimento;
  Alteração na visualização do campo 'Resposta Padrão';
- Cadastro de Assunto
  Alteração na visualização do campo 'Resposta Padrão';
  Correção na exibição da caixa de procura de resposta ao associá-la a um assunto;
- Gráfico de Atendimento
  Implementação da Pesquisa Por Plano Previdenciário;
  Implementação da Pesquisa Por Situação Cadastral;
- Consulta de Atendimentos
  Implementação da Pesquisa Por Plano Previdenciário;
  Implementação da Pesquisa Por Situação Cadastral;
  Implementação da Pesquisa Por Local de Atendimento;
- Relatórios Estatísticos
  Inclusão da Data/hora do Atendimento;
  Implementação da Pesquisa Por Plano Previdenciário;
  Implementação da Pesquisa Por Situação Cadastral;
  Implementação da Pesquisa Por Local de Atendimento;
================================================================================
CM$VER      2.03.02     24/03/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
  Implementação da Geração do Processo no RAD;
  Correção na consulta de Processos do RAD;
================================================================================
CM$VER      2.03.01     21/03/2000
--------------------------------------------------------------------------------
- Tela de Atendimento
  * Verificação da Obrigatoriedade da indicação do atendimento;
  * Correção na procura pela consulta de atendimentos;
  * Correção da mensagem 'Cannot focus a disabled or invisible window' ao verificar campos obrigatórios;
  * Limpar os campos Hora Inicial, Hora Final e Dados do Atendimento Anterior ao finalizar o atendimento;
  * Correção na abertura das consultas da tela do atendimento;
  * Correção na descrição da situação na Pasta de Contribuições Previdenciárias;
- Consulta de Atendimentos 
  * Alterção na ordem dos campos Hora Inicial e Hora Final
- Relacionamento de Situação X Beneficio
  * Correção do 'Constraint' com a tabela PARTPREVPLAN;
  * Inibido acesso ao relacionamento antes de selecionar a operação de relacionar;
================================================================================
CM$VER      2.03.00     10/03/2000
--------------------------------------------------------------------------------
- Inclusão da Consulta de Atendimentos na tela de atendimento;
- Inclusão do registro de pergunta e resposta do atendimento;
- Preenchimento dos campos de endereço do solicitante;
- Alteração na cor dos campos do endereço e telefone;
- Alteração na gravação dos dados do campo observação;
- Inclusão do campo local do atendimento e registro do mesmo;
- Implementação do Cadastro de Respostas Padão para atendimento;
- Alteração no cadastro de assuntos para associar a uma ou mais resposta padrão;
- Alteração na consulta de atendimentos para inclusão do tempo do atendimento e da hora incial e final do mesmo e local de atendimento;
- Alteração na estrutura da tabela ATEND (i) para implementar a continuação do atendimento; 
- Alterações diversas nas telas de cadastro;
================================================================================
CM$VER      2.02.00     24/02/2000
--------------------------------------------------------------------------------
- Atualizações Diversas
================================================================================
CM$ALT}
















































































































































































































































































































































































































































































































































































































































































































































































