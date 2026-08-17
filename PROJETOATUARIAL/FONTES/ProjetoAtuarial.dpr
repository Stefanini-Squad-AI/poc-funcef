program ProjetoAtuarial;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  UFiltraTabela in 'UFiltraTabela.pas' {FrmFiltraTabela},
  UGrupobiometrica in 'UGrupobiometrica.pas' {FrmGrupoBiometrica},
  UGrupoRegra in 'UGrupoRegra.pas' {FrmGrupoRegra},
  UGrupoHipotese in 'UGrupoHipotese.pas' {FrmGrupoHipotese},
  FSelecaoTabs in 'FSelecaoTabs.pas' {frmSelecaoTabs},
  FCadRelatorios in 'FCadRelatorios.pas' {FrmCadRelatorios},
  uModeloRelatCM in 'uModeloRelatCM.pas',
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  UCalculo in 'UCalculo.pas' {FrmCalculo},
  UCriaEstruturaTXT in 'UCriaEstruturaTXT.pas' {FrmCriaEstruturaTXT},
  URelatoriosAtuariais in 'URelatoriosAtuariais.pas' {DmRelatoriosAtuariais: TDataModule},
  excelbio in 'excelbio.pas' {FrmExcelBio},
  RelatErro in 'RelatErro.pas' {RelatorioErro: TQuickRep},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  UBibliotecaAtuarial in 'UBibliotecaAtuarial.pas',
  FGeraValores in 'FGeraValores.pas' {frmGeraValores},
  UTXTAfericoesPart in 'utxtafericoespart.pas' {frmTXTdeAfericaoPart},
  FCadTabela in 'FCadTabela.pas' {frmCadTbCampos},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  dBaseDados in '..\..\Cm\Forms\Source\dBaseDados.pas' {dtmBaseDados: TDataModule},
  FCadTbEstadoCivil in 'FCadTbEstadoCivil.pas' {frmCadTbEstadoCivil},
  FCadTbGrauDependencia in 'FCadTbGrauDependencia.pas' {frmCadTbGrauDependencia},
  FCadTbGrauInstrucao in 'FCadTbGrauInstrucao.pas' {frmCadTbGrauInstrucao},
  FCadTbTipoBeneficio in 'FCadTbTipoBeneficio.pas' {frmCadTbTipoBeneficio},
  FCadTbTipoCategoriaPro in 'FCadTbTipoCategoriaPro.pas' {frmCadTbTipoCategoriaPro},
  FCadTbTipoValor in 'FCadTbTipoValor.pas' {frmCadTbTipoValor},
  FCadTbUnidadeFederacao in 'FCadTbUnidadeFederacao.pas' {frmCadTbUnidadeFederacao},
  FCadTbTipoTabua in 'FCadTbTipoTabua.pas' {frmCadTbTipoTabua},
  FCadLayoutArquivo in 'FCadLayoutArquivo.pas' {frmCadLayoutArquivo},
  uGlobal in 'uGlobal.pas',
  FCadTabelaSistema in 'FCadTabelaSistema.pas' {frmCadTabelaSistema},
  FCadTbTipoGrupoDado in 'FCadTbTipoGrupoDado.pas' {frmCadTbTipoGrupoDado},
  uImportarEstruturaBanco in 'uImportarEstruturaBanco.pas',
  uCategoriaPro in 'uCategoriaPro.pas' {frmCategoriaPro},
  uEndereco in 'uEndereco.pas' {frmEndereco},
  uEntidadePrevidencia in 'uEntidadePrevidencia.pas' {frmEntidadePrevidencia},
  uContatos in 'uContatos.pas' {frmContatos},
  uImportarTabua in 'uImportarTabua.pas' {frmImportarTabua},
  uPatrocinadora in 'uPatrocinadora.pas' {frmPatrocinadora},
  uPlanoBeneficio in 'uPlanoBeneficio.pas' {frmPlanoBeneficio},
  uTabua in 'uTabua.pas' {frmTabua},
  uVariavel in 'uVariavel.pas' {frmVariavel},
  uFormula in 'uFormula.pas' {frmFormula},
  FAnimacao in 'FAnimacao.pas' {frmAnimacao},
  uListaVariaveis in 'uListaVariaveis.pas' {frmListaVariaveis},
  uExpressao in 'uExpressao.pas' {frmExpressao},
  uExpresCalc in 'uExpresCalc.pas',
  uVarCalc in 'uVarCalc.pas',
  uRotinaCalculo in 'uRotinaCalculo.pas' {frmRotinaCalculo},
  uVersaoBase in 'uVersaoBase.pas' {frmVersaoBase},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadCamposVincValores in 'FCadCamposVincValores.pas' {frmCadCamposVincValores},
  fParticipante in 'fParticipante.pas' {frmParticipante},
  uBeneficiario in 'uBeneficiario.pas' {frmBeneficiario},
  uValidaValorCampo in 'uValidaValorCampo.pas',
  uValidaLayout in 'uValidaLayout.pas',
  FImportaArquivo in 'FImportaArquivo.pas' {frmImportaArquivo},
  uImporta in 'uImporta.pas',
  FmxUtils in 'fmxutils.pas',
  uMensagem in 'uMensagem.pas',
  FExportaArquivo in 'FExportaArquivo.pas' {frmExportaArquivo},
  FCadGrdTempo in 'FCadGrdTempo.pas' {frmCadGrdTempo},
  FCadGrdBeneficio in 'FCadGrdBeneficio.pas' {frmCadGrdBeneficio},
  FCadGrdValor in 'FCadGrdValor.pas' {frmCadGrdValor},
  UGrupoParticipante in 'UGrupoParticipante.pas' {frmGrupoParticipante},
  uComposicaoCalculo in 'uComposicaoCalculo.pas' {frmComposicaoCalculo},
  uSelecCampoVar in 'uSelecCampoVar.pas' {frmSelecCampoVar},
  uItemHipotese in 'uItemHipotese.pas' {frmItemHipotese},
  uHipotese in 'uHipotese.pas' {frmHipotese},
  uBuilderQuery in 'uBuilderQuery.pas',
  uGeraTabuaServico in 'uGeraTabuaServico.pas' {frmGeraTabuaServico},
  uCalculaTabuaServico in 'uCalculaTabuaServico.pas',
  uRegArquivo in 'uRegArquivo.pas',
  uRegTabela in 'uRegTabela.pas',
  uRegArquivoVinc in 'uRegArquivoVinc.pas',
  uExporta in 'uExporta.pas',
  uRegDados in 'uRegDados.pas',
  uEnquadraParticipante in 'uEnquadraParticipante.pas',
  uOkCriticaParticipante in 'uOkCriticaParticipante.pas' {frmOkCriticaParticipante},
  uGrupoCritica in 'uGrupoCritica.pas' {frmGrupoCritica},
  uQueryCondicao in 'uQueryCondicao.pas' {frmQueryCondicao},
  uOkEnquadraParticipante in 'uOkEnquadraParticipante.pas' {frmOkEnquadraParticipante},
  uProcura in 'uProcura.pas' {frmProcura},
  uMemoriaCalculo in 'uMemoriaCalculo.pas' {frmMemoriaCalculo},
  uCuboAtivo in 'uCuboAtivo.pas' {frmCuboAtivo},
  UOLE in 'UOLE.PAS',
  uFuncGerais in 'uFuncGerais.pas',
  uDtMdlSat in 'uDtMdlSat.pas' {DtMdlSat: TDataModule},
  uEfetivaCalculo in 'uEfetivaCalculo.pas' {frmEfetivaCalculo},
  UnitTestRel in 'UnitTestRel.pas' {Formtesterel},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  DRelatsAtuarial in 'DRelatsAtuarial.pas' {DtmRelatsAtuarial: TDataModule},
  fParamRel in 'fParamRel.pas' {frmParamRel},
  uCubo in 'uCubo.pas' {frmCubo},
  uParticipanteHist in 'uParticipanteHist.pas' {frmParticipanteHist},
  uMemoriaCalculoHist in 'uMemoriaCalculoHist.pas' {frmMemoriaCalculoHist},
  uDependenteHist in 'uDependenteHist.pas' {frmDependenteHist},
  FCadGrdBeneficioHist in 'FCadGrdBeneficioHist.pas' {frmCadGrdBeneficioHist},
  FCadGrdTempoHist in 'FCadGrdTempoHist.pas' {frmCadGrdTempoHist},
  FCadGrdValorHist in 'FCadGrdValorHist.pas' {frmCadGrdValorHist},
  uVersaoBaseHist in 'uVersaoBaseHist.pas' {frmVersaoBaseHist},
  FCadTbSituacaoFund in 'FCadTbSituacaoFund.pas' {frmCadTbSituacaoFund},
  FCadTbSituacaoPatroc in 'FCadTbSituacaoPatroc.pas' {frmCadTbSituacaoPatroc},
  uComparaVersoes in 'uComparaVersoes.pas' {frmComparaVersoes},
  uImportarVersaoBase in 'uImportarVersaoBase.pas',
  uDtmImportacaoBase in 'uDtmImportacaoBase.pas' {DtmImportacaoBase: TDataModule},
  uDtmImportacao in 'uDtmImportacao.pas' {DtmImportacao: TDataModule},
  uOkImportaTotalPrev_Old in 'uOkImportaTotalPrev_Old.pas' {frmOkImportaTotalPrev_Old},
  uConsultaCalculo in 'uConsultaCalculo.pas' {frmConsultaCalculo},
  uConsultaCalculoAtivo in 'uConsultaCalculoAtivo.pas' {frmConsultaCalculoAtivo},
  uConsultaCalculoAtivoHist in 'uConsultaCalculoAtivoHist.pas' {frmConsultaCalculoAtivoHist},
  uConsultaCalculoHist in 'uConsultaCalculoHist.pas' {frmConsultaCalculoHist},
  FCadTbTipoTempo in 'FCadTbTipoTempo.pas' {frmCadTbTipoTempo},
  FCadGrdGrupoExportacao in 'FCadGrdGrupoExportacao.pas' {frmCadGrdGrupoExportacao},
  uDependente in 'uDependente.pas' {frmDependente},
  FCadVersaoBase in 'FCadVersaoBase.pas' {frmCadVersaoBase},
  FCadValorRegra in 'FCadValorRegra.pas' {frmCadValorRegra},
  FCadTempoRegra in 'FCadTempoRegra.pas' {frmCadTempoRegra},
  FOkImportaTotalPrev in 'FOkImportaTotalPrev.pas' {frmOkImportaTotalPrev},
  dImportaTotalPrev in 'dImportaTotalPrev.pas' {DtmImportaTotalPrev: TDataModule},
  uImportaTotalPrev in 'uImportaTotalPrev.pas',
  uInterfaceAtuarial in 'uInterfaceAtuarial.pas',
  dInterfaceAtuarial in 'dInterfaceAtuarial.pas' {DtmInterfaceAtuarial: TDataModule},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadVariaveisIntegracaoContabil in 'FCadVariaveisIntegracaoContabil.pas' {frmCadVariaveisIntegracaoContabil},
  FCadIntegracaoContabil in 'FCadIntegracaoContabil.pas' {frmCadIntegracaoContabil},
  FCadGrupoContabil in 'FCadGrupoContabil.pas' {frmCadGrupoContabil},
  FOkAtualizarLancamentosContabeis in 'FOkAtualizarLancamentosContabeis.pas' {frmOkAtualizarLancamentosContabeis},
  FCadGrdValorBeneficiario in 'FCadGrdValorBeneficiario.pas' {frmCadGrdValorBeneficiario},
  FOkCalculoTabuaServicoPensao in 'FOkCalculoTabuaServicoPensao.pas' {frmOkCalculoTabuaServicoPensao},
  FExecutaQuery in 'FExecutaQuery.pas' {frmExecutaQuery},
  uCalculoTabuaServico in 'uCalculoTabuaServico.pas',
  FOkConsultaTabuaServico in 'FOkConsultaTabuaServico.pas' {frmOkConsultaTabuaServico},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCadRegrasTabuaServico in 'FCadRegrasTabuaServico.pas' {frmCadRegrasTabuaServico},
  FOkSelecionaVariavel in 'FOkSelecionaVariavel.pas' {frmOkSelecionaVariavel},
  uCalculoTabuaServicoPensao in 'uCalculoTabuaServicoPensao.pas',
  FOkCalculoTabuaServico in 'FOkCalculoTabuaServico.pas' {frmOkCalculoTabuaServico},
  FOkListaAdvertencias in 'FOkListaAdvertencias.pas' {frmOkListaAdvertencias},
  FVerHipoteses in 'FVerHipoteses.pas' {FrmVerHipoteses},
  FSimulacaoCalcAtuarial in 'FSimulacaoCalcAtuarial.pas' {FrmSimulacaoCalcAtuarial},
  TreeFunc in 'TreeFunc.pas',
  fImportaVersao in 'fImportaVersao.pas' {frmImportaVersao},
  FDuplicaRegrasTabuaServico in 'FDuplicaRegrasTabuaServico.pas' {FrmDuplicaRegrasTabuaServico};

{$R *.RES}
{$R PROJETOATUARIAL_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;    
  Application.Initialize;
  Application.Title := 'Projeto Atuarial';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TDtmRelatsAtuarial, DtmRelatsAtuarial);
  Application.CreateForm(TDtMdlSat, DtMdlSat);
  Application.CreateForm(TDtmImportacaoBase, DtmImportacaoBase);
  Application.CreateForm(TDtmImportacao, DtmImportacao);
  Application.CreateForm(TDtmImportaTotalPrev, DtmImportaTotalPrev);
  Application.CreateForm(TDtmInterfaceAtuarial, DtmInterfaceAtuarial);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Projeto Atuarial
================================================================================
CM$VER      3.01.03     19/03/2008
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.18
================================================================================
CM$VER      3.01.02     24/07/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.17.
================================================================================
CM$VER      3.01.00     21/05/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.16.
================================================================================
CM$VER      3.00.11     22/03/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.15.
================================================================================
CM$VER      3.00.10     23/01/2007
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.14.
================================================================================
CM$VER      3.00.09     27/11/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.13.
- Resolução da Pendência Nº 21525 (Reabertura)
  Tela\Opçao No Sistema: Regras de Ajuste da Tábua de Serviço
  Funcionalidade de duplicação de regras da tábua de serviço por versão
================================================================================
CM$VER      3.00.08     15/09/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.12.
================================================================================
CM$VER      3.00.07b    28/07/200
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 23071 (Reabertura)
  Tela\Opçao No Sistema: Arquivo \ Importação TotalPREV \ Exportação
  Correção da importação e exportação de valores do participante
================================================================================
CM$VER      3.00.07a    28/07/200
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 23071
  Tela\Opçao No Sistema: Arquivo \ Importação TotalPREV
  Correção da importação de valores do participante
- Resolução da Pendência Nº 22956
  Tela\Opçao No Sistema: Arquivo \ Importação TotalPREV
  Correção da Importação TotalPREV
================================================================================
CM$VER      3.00.07     28/07/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.11.
================================================================================
CM$VER      3.00.06     12/07/2006
--------------------------------------------------------------------------------
Liberação de versão para o padrão 5.10.10.
- Resolução da Pendência Nº 21524
  Tela\Opçao No Sistema: Arquivo \ Importa da versção anterior
  Duplicação de uma versão da base já gerada. Nº do chamado no SOL:  40525
- Resolução da Pendência Nº 21526
  Tela\Opçao No Sistema: Cadastro \ Associação de versão a processo
  Adicionar as funcionalidades de inclusão e exclusão no Grupo de Cálculo e no
  Grupo de Exportação no formulário Enquadramento de Participantes. Nº 40527
- Resolução da Pendência Nº 21451
  Tela\Opçao No Sistema: Rotina de Cálculo Atuarial
  Permitir que o módulo "Cálculo Atuarial" use as funcionalidades do módulo
  "Regra", para cálculo das avaliações atuariais. SOL 40246
- Resolução da Pendência Nº 21489
  Tela\Opçao No Sistema: Cálculo Atuarial
  Opção na rotina de cálculo da avaliação atuarial para que recalcule uma
  avaliação, calculada anteriormente, com o mesmo número que tenha sido
  utilizado, com a possibilidade de alteração em algumas premissas, bem como no
  cadastro.
- Resolução da Pendência Nº 21491
  Tela\Opçao No Sistema: Cálculo Atuarial
  Na rotina de cálculo atuarial permitir que várias avaliações sejam programadas
  para execução automática, ou seja, inclusão das premissas de várias avaliações
  e logo após a inclusão de todas a execução automática e em seqüência das
  mesmas. SOL40294
- Resolução da Pendência Nº 21525
  Tela\Opçao No Sistema: Regras de Ajuste da Tábua de Serviço
  Funcionalidade de duplicação de regras da tábua de serviço por versão
  cadastrada. Nº do chamado no SOL:  40526
- Resolução da Pendência Nº 21523
  Tela\Opçao No Sistema: Cadastros - Participante
  Classificar nomes no resultado de pesquisa no cadastro de Participantes e nos
  demais conforme padrão do TotalPrev. Nº do chamado no SOL:  40524
- Resolução da Pendência Nº 21453
  Tela\Opçao No Sistema: Regra da Tábua de Serviço
  Customização da tela: Regras da Tábua de Serviço, para organizar as regras de
  ajuste, conforme layout em anexo. SOL:  40240
- Resolução da Pendência Nº 21454
  Tela\Opçao No Sistema: Cálculo da Tábua de Serviço
  Customização da tela: Cálculo da Tábua de Serviço para selecionar por tipo de
  tábuas, conforme layout em anexo. SOL 40238
================================================================================
CM$VER      3.00.05a    16/05/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 22245
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Correção do problema do botão "Gerar Planilha" que desaparece após o erro
================================================================================
CM$VER      3.00.05     11/05/2006
--------------------------------------------------------------------------------
- Liberação para o padrão 9
================================================================================
CM$VER      3.00.04e    02/06/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 22517
  Tela\Opçao No Sistema: Rotina de Cálculo Atuarial
  Ajustar o relatório de memória de cálculo para a estrutura de cálculo
  atuarial utilizando o Regra.
================================================================================
CM$VER      3.00.04d    02/06/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 21456
  Tela\Opçao No Sistema: Rotina de Cálculo Atuarial
  Permitir que o módulo "Cálculo Atuarial" use as funcionalidades do módulo
  "Regra", para cálculo das avaliações atuariais. (SOL 40246)
================================================================================
CM$VER      3.00.04c    16/05/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 22245
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Correção do problema do botão "Gerar Planilha" que desaparece após o erro
================================================================================
CM$VER      3.00.04b    08/05/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 22124
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Quando abrir janela para a escolha da variável que será gerada a planilha no
  Excel, mostrar apenas as variáveis que foram usadas na tábua   (SOL. 42411)
- Resolução da Pendência Nº 22245
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Alterado o eixo de gravação das Tabuas de Pensão
  Aumentar a visualização da Barra de Progreso
  Incluido identificação dos passos que geram o cálculo
  Ativar o Cursor do Mouse na forma "Ampuleta" durante o cálculo
  Desabilitar os botões e os campos de opções durante o cálculo
  incluir a funcionabilidade do botão "Cancelar"  (SOL. 40244)
================================================================================
CM$VER      3.00.04a    28/04/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 21527
  Tela\Opçao No Sistema: Cadastro / Enquadramento de Participante
  Alterar o nome da opção de menu de "Incluir/Excluir Participante em grupo"
  para "Associação de versão a processo" (SOL. 40528)
================================================================================
CM$VER      3.00.04     27/04/2006
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 21455
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Conclusão da funcionabilidade de cálculo da comutação das tábuas (SOL. 40244)
- Resolução da Pendência Nº 21457
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Ajuste na rotina de geração das tábuas de serviço de pensão
- Resolução da Pendência Nº 21563
  Tela\Opçao No Sistema: Fórmulas / Rotinas de Cálculo
  Aumentar a capacidade do campo "Observações" para 1400 caracteres (SOL. 40618)
- Resolução da Pendência Nº 22152
  Tela\Opçao No Sistema: Tabela Biométrica / Cálculo de Tábua de Serviço
  Incluir na Planilha gerada o nome da variavel escolhida (SOL. 42412)
================================================================================
CM$VER      3.00.03     16/03/2006
--------------------------------------------------------------------------------
- Compilação para liberação do padrão 5.10.09
================================================================================
CM$VER      3.00.02b    20/04/2004
--------------------------------------------------------------------------------
Atualização de Padrão
================================================================================
CM$VER      3.00.02a    04/12/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15697
  Tela\Opçao No Sistema: Rotina de Importação do TotalPrev
  Permitir importar sem utilização da tabela de eventos.
================================================================================
CM$VER      3.00.01a    03/11/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15541
  Tela\Opçao No Sistema: Login
  O sistema só estava se conectando a instancia CM.
- Alteração do número da versão para padronização geral da CM no número 3.xx.xx
================================================================================
CM$VER      2.00.10b    31/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15541
  > Tela\Opçao No Sistema: Login
     O sistema só estava se conectando a instancia CM.
================================================================================
CM$ALT}












































































