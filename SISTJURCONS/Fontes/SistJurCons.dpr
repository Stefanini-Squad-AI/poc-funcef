program SistJurCons;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\cm\forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fCadParam in '..\..\Shared\ModComp\FontesMT\fCadParam.pas' {frmCadParam},
  fAcertaCusto in '..\..\Shared\ModComp\FontesMT\fAcertaCusto.pas' {frmAcertaCusto},
  fAdvogXProcJur in '..\..\Shared\ModComp\FontesMT\fAdvogXProcJur.pas' {frmAdvogXProcJur},
  fUsuXProcJur in '..\..\Shared\ModComp\FontesMT\fUsuXProcJur.pas' {frmUsuXProcJur},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadAdvog in '..\..\Shared\ModComp\FontesMT\fCadAdvog.pas' {frmCadAdvog},
  fCadEmprAdq in '..\..\Shared\ModComp\FontesMT\fCadEmprAdq.pas' {frmCadEmprAdq},
  fCadVara in '..\..\Shared\ModComp\FontesMT\fCadVara.pas' {frmCadVara},
  fCadTipProc in '..\..\Shared\ModComp\FontesMT\fCadTipProc.pas' {frmCadTipProc},
  fCadTipAcao in '..\..\Shared\ModComp\FontesMT\fCadTipAcao.pas' {frmCadTipAcao},
  fCadMotivoJur in '..\..\Shared\ModComp\FontesMT\fCadMotivoJur.pas' {frmCadMotivoJur},
  fCadGrpObjeto in '..\..\Shared\ModComp\FontesMT\fCadGrpObjeto.pas' {frmCadGrpObjeto},
  fCadTipObjeto in '..\..\Shared\ModComp\FontesMT\fCadTipObjeto.pas' {frmCadTipObjeto},
  fCadTipSent in '..\..\Shared\ModComp\FontesMT\fCadTipSent.pas' {frmCadTipSent},
  fCadTipRec in '..\..\Shared\ModComp\FontesMT\fCadTipRec.pas' {frmCadTipRec},
  fCadRateio in '..\..\Shared\ModComp\FontesMT\fCadRateio.pas' {frmCadRateio},
  fCadContJurid in '..\..\Shared\ModComp\FontesMT\fCadContJurid.pas' {frmCadContJurid},
  fCadRegEtp in '..\FontesMT\fCadRegEtp.pas' {frmCadRegEtp},
  fCustomCadRegHon in '..\..\Shared\ModComp\FontesMT\fCustomCadRegHon.pas' {frmCustomCadRegHon},
  fCadRegHon in '..\FontesMT\fCadRegHon.pas' {frmCadRegHon},
  fCustomSelProcesso in '..\..\Shared\ModComp\FontesMT\fCustomSelProcesso.pas' {frmCustomSelProcesso},
  fSelProcessoCons in '..\FontesMT\fSelProcessoCons.pas' {frmSelProcessoCons},
  fSelConProc in '..\FontesMT\fSelConProc.pas' {frmSelConProc},
  frFollowUp in '..\..\Shared\ModComp\FontesMT\frFollowUp.pas' {frameFollowUp: TFrame},
  fSelFolUp in '..\FontesMT\fSelFolUp.pas' {frmSelFolUp},
  fSelEstObj in '..\FontesMT\fSelEstObj.pas' {frmSelEstObj},
  frGraficoProcesso in '..\..\Shared\ModComp\FontesMT\frGraficoProcesso.pas' {frameGraficoProcesso: TFrame},
  fSelEstProc in '..\FontesMT\fSelEstProc.pas' {frmSelEstProc},
  fParamAnalSintProc in '..\Reports\Source\fParamAnalSintProc.pas' {frmParamAnalSintProc},
  RAnalSintProc in '..\..\Shared\ModComp\Reports\Source\RAnalSintProc.pas' {RptAnalSintProc},
  fParamProcJud in '..\Reports\Source\fParamProcJud.pas' {frmParamProcJud},
  RProcJud in '..\..\Shared\ModComp\Reports\Source\RProcJud.pas' {RptProcJud},
  RVara in '..\..\Shared\ModComp\Reports\Source\RVara.pas' {RptVara},
  RMotivoJur in '..\..\Shared\ModComp\Reports\Source\RMotivoJur.pas' {RptMotivoJur},
  RTipAcao in '..\..\Shared\ModComp\Reports\Source\RTipAcao.pas' {RptTipAcao},
  RTipObjeto in '..\..\Shared\ModComp\Reports\Source\RTipObjeto.pas' {RptTipObjeto},
  RTipProc in '..\..\Shared\ModComp\Reports\Source\RTipProc.pas' {RptTipProc},
  RTipRec in '..\..\Shared\ModComp\Reports\Source\RTipRec.pas' {RptTipRec},
  RTipSent in '..\..\Shared\ModComp\Reports\Source\RTipSent.pas' {RptTipSent},
  RGrupoObjeto in '..\..\Shared\ModComp\Reports\Source\RGrupoObjeto.pas' {RptGrupoObjeto},
  fParamFichaProc in '..\Reports\Source\fParamFichaProc.pas' {frmParamFichaProc},
  RFichaProc in '..\Reports\Source\RFichaProc.pas' {RptFichaProc},
  uCmCtrlRptSistJurCons in '..\CtrlObjetos\uCmCtrlRptSistJurCons.pas',
  fSelProcessoMT in '..\..\Shared\ModComp\FontesMT\fSelProcessoMT.pas' {frmSelProcessoMT},
  fSelEstDistr in '..\..\Shared\ModComp\FontesMT\fSelEstDistr.pas' {frmSelEstDistr},
  fCustomCadProcesso in '..\..\Shared\ModComp\FontesMT\fCustomCadProcesso.pas' {frmCustomCadProcesso},
  fCadProcesso in '..\FontesMT\fCadProcesso.pas' {frmCadProcesso},
  fValorRealMT in '..\..\Shared\ModComp\FontesMT\fValorRealMT.pas' {frmValorRealMT},
  fParcelaAcordoMT in '..\..\Shared\ModComp\FontesMT\fParcelaAcordoMT.pas' {frmParcelaAcordoMT},
  fAgenda in '..\..\Shared\ModComp\FontesMT\fAgenda.pas' {frmAgenda},
  fCustomParamFichaProc in '..\..\Shared\ModComp\Reports\Source\fCustomParamFichaProc.pas' {frmCustomParamFichaProc},
  fCadRegPenhora in '..\..\Shared\ModComp\FontesMT\fCadRegPenhora.pas' {frmCadRegPenhora},
  fCadHonorAdvog in '..\..\Shared\ModComp\FontesMT\fCadHonorAdvog.pas' {frmCadHonorAdvog},
  fParamReciboAdvogados in '..\..\Shared\ModComp\Reports\Source\fParamReciboAdvogados.pas' {frmParamReciboAdvogados},
  RReciboAdvogados in '..\..\Shared\ModComp\Reports\Source\RReciboAdvogados.pas' {RptReciboAdvogados},
  fRateioDespesas in '..\..\Shared\ModComp\FontesMT\fRateioDespesas.pas' {frmRateioDespesas},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  fCorrecaoMonet in '..\..\Shared\ModComp\FontesMT\fCorrecaoMonet.pas' {frmCorrecaoMonet},
  FConsultaLogAltExcMT in '..\FontesMT\FConsultaLogAltExcMT.pas' {FrmConsultaLogAltExc},
  fMostraLogExcMT in '..\FontesMT\fMostraLogExcMT.pas' {FrmMostraLogExcMT},
  RPenhora in '..\Reports\Source\RPenhora.pas' {RptPenhora},
  fParamPenhora in '..\Reports\Source\fParamPenhora.pas' {frmParamPenhora},
  fCadRegContaBanc in '..\..\Shared\ModComp\FontesMT\fCadRegContaBanc.pas' {frmCadRegContaBanc},
  fCadRegMulta in '..\..\Shared\ModComp\FontesMT\fCadRegMulta.pas' {frmCadRegMulta},
  fCadRegCondenacao in '..\..\Shared\ModComp\FontesMT\fCadRegCondenacao.pas' {frmCadRegCondenacao},
  fAjusteOriginal in '..\..\Shared\ModComp\FontesMT\fAjusteOriginal.pas' {frmAjusteOriginal},
  mImovelDB in '..\..\Shared\ModComp\FontesMT\mImovelDB.pas' {molImovelDB: TFrame},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  fCadDesdobramento in '..\..\Shared\ModComp\FontesMT\fCadDesdobramento.pas' {frmCadDesdobramento},
  fCadOrdemJudicial in 'fCadOrdemJudicial.pas' {frmCadOrdemJudicial},
  fCadReembolsoHonorariosAdvocaExDirigentes in 'fCadReembolsoHonorariosAdvocaExDirigentes.pas' {frmReembolsoHonorariosAdvocaExDirigentes},
  fCadDespesasAdministrativas in 'fCadDespesasAdministrativas.pas' {frmCadDespesasAdministrativas},
  fImportaDespesasAdministrativas in 'fImportaDespesasAdministrativas.pas' {frmImportaDespesasAdministrativas},
  fCadHonorariosContratuais in 'fCadHonorariosContratuais.pas' {frmCadHonorariosContratuais},
  FCadMovimentoHonorariosContratuais in 'FCadMovimentoHonorariosContratuais.pas' {FrmMovimentoHonorariosContratuais},
  fCadHonorarioSucumbenciais in 'fCadHonorarioSucumbenciais.pas' {frmCadHonorarioSucumbenciais},
  fCadCondenacoes in 'fCadCondenacoes.pas' {frmCadCondenacoes},
  fCustomCadRegEtp in '..\..\SHARED\ModComp\FontesMT\fCustomCadRegEtp.pas',
  uModulo2 in '..\..\SHARED\ModComp\CtrlObjetos\uModulo2.pas',
  fCadMovArrematacao in 'fCadMovArrematacao.pas' {frmCadMovArrematacao};

{$R *.RES}
{$R SISTJURCONS_RES.RES}
begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Sistema Jurídico Consolidado';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Sistema Jurídico Consolidado
================================================================================
CM$VER      3.21.07     26/06/2008
--------------------------------------------------------------------------------
(Pendência 27713)
- Consultas / Relatórios / ... / Cadastrais / Ficha do Processo: 
 * Correção do erro que ocorria se 1000 ou mais processos fossem selecionados.
(Pendência 27714)
- Consultas / Relatórios / ... / Operacionais / Excesso ou Insuficiência de Penhora: 
 * Correção de erro que poderia ocorrer em certas situações dos dados.
================================================================================
CM$VER      3.21.06     19/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.21.05     26/02/2008
--------------------------------------------------------------------------------
(Pendência 27401)
- Sistema / Util. / Alteração de Escritórios/Advogados:
  * Inclusão da opção para filtrar os processos por UF e Cidade.
================================================================================
CM$VER      3.21.04     22/01/2008
--------------------------------------------------------------------------------
(Pendência 22443 - Complementação)
- Cadastros / Parametrização Contábil:
  * Correção do tratamento do campo "Usa Plano/Patro Padrão".
- Transações / Processo:
  * Inclusão dos campos: Tipo de Processo, Centro de Custo e Tipo de Operação na chamada
    para a integração contábil.
================================================================================
CM$VER      3.21.03     15/01/2008
--------------------------------------------------------------------------------
(Pendência 23903 - Complementação)
- Transações / Correção Monetária dos Processos Selecionados
- Transações / Ajuste da Estimativa Original às Penhoras e Depósitos
  * Alteração na função de contabilização, para considerar Plano e Patro de cada processo.
(Pendência 22100 - Complementação)
- Transações / Etapas do Processo:
  * Na aba CAP/CAR, inclusão do campo Ativo na caixa Centro de Responsabilidade
    (OBS: só são exibidos os centros resp. associados ao usuário).
  * Na aba CAP/CAR, inclusão do campo Ativo na caixa Centro de Custo e alteração
    no critério de sua exibição.
(Pendência 27069 - Complementação)
- Transações / Processo:
  * O usuário agora, mesmo que execute uma operação indevida para alimentar os campos
    “Escritório/Advogado da Contraparte” e “Nosso Escritório/Advogado” será alertado para o
    fato.
================================================================================
CM$VER      3.21.02     10/01/2008
--------------------------------------------------------------------------------
(Pendência 27223)
- Cadastros / Parametrização Contábil:
  * Foi corrigida a gravação do campo Usa Plano/Patro Padrão.
================================================================================
CM$VER      3.21.01     08/01/2008
--------------------------------------------------------------------------------
(Pendência 23903)
- Transações / Correção Monetária dos Processos Selecionados
- Transações / Ajuste da Estimativa Original às Penhoras e Depósitos
  * Geração de planilha contábil consolidada (por Conta, Tipo de Processo e Tipo de Objeto).
(Pendência 27176) 
- Telas Diversas:
  * Em algumas caixas de seleção, havia uma limtação na quantidade de caracteres que o
    usuário podia digitar. Esse problema foi corrigido.
  * Na caixa de seleção de Cidades, quando era solicitada a "Seleção Negativa" com apenas uma cidade selecionada, o retorno vinha como se essa opção não estivesse marcada. Isto foi corrigido.
================================================================================
CM$VER      3.21.00     02/01/2008
--------------------------------------------------------------------------------
(Pendência 22100)
- Transações / Etapas do Processo:
  * Aba Contab. e CAP - inclusão dos campos Data Lançamento e Forma de Pagamento.
  * Aba CAR - inclusão dos campos Data Lançamento e Forma de Recebimento.
  * Inclusão da aba CAP/CAR, com Centro de responsabilidade, Centro de Custo e Programa.
  * Inclusão de alerta para o caso da penhora e/ou depósito for superior ao valor estimado
    atual (processo aberto) ou valor real da sentença (processo encerrado).
================================================================================
CM$VER      3.20.07a    21/12/2007
--------------------------------------------------------------------------------
Pendência 24922
- Transações / Correção Monetária dos Processos:
  * Inclusão da opção "Desfazer" que permite ao usuário solicitar a reversão dos cálculos
   de juros e correção monetária  (OBS. IMPORTANTE: a solicitação de excluir uma eventual
   planilha contábil que tenha sido gerada no procedimento original de cálculo, é inviável de
   ser realizada de forma automática pelo sistema, uma vez que não há como estabelecer
   vinculação entre um fato e outro. Esta ação tem que ser operacional, e não sistêmica).
================================================================================
CM$VER      3.20.07     18/12/2007
--------------------------------------------------------------------------------
Pendência 27069
- Transações / Processo:
  * Os campos "Escritório/Advogado da Contraparte" e "Nosso Escritório/Advogado"
    passam a ser de preenchimento obrigatório.
================================================================================
CM$VER      3.20.06     26/11/2007
--------------------------------------------------------------------------------
(Pendência 24171 - Correção)
- Transações / Processo / Aba Encerramento:
  * A inclusão de etapas foi reativada.
================================================================================
CM$VER      3.20.05     20/11/2007
--------------------------------------------------------------------------------
(Pendência 23799)
- Transações / Processo / aba Litisconsortes:
  * Inclusão de um botão que habilita importar litisconsortes através de um arquivo texto
     contendo suas matrículas como "elegíveis". O arquivo deverá conter uma matrícula
     por linha, escrita da mesma forma como está registrada no sistema previdenciário.
(Pendência 24171)
- Transações / Processo / Aba Encerramento:
  * A caixa "Tipo de Condenação" passa a ficar visível se o processo contiver uma etapa
    que o deixa em fase de execução, mesmo que esteja ainda aberto.
================================================================================
CM$VER      3.20.04     08/11/2007
--------------------------------------------------------------------------------
(Pendência 26077)
- Transações / Processo
  * Correção do erro ("constraint" R_11253) que ocorria na exclusão de um processo
    que tivesse algum dado em seu histórico (tabela HSTPROCTRAB).
================================================================================
CM$VER      3.20.03     08/08/2007
--------------------------------------------------------------------------------
(Pendência 26059) 
- Sistema / Utilitários / Verificação e Acerto do Custo dos Processos:
  * Correção do erro "ERangeError - Range check error", que ocorria no início do processo.
================================================================================
CM$VER      3.20.02     26/06/2007
--------------------------------------------------------------------------------
(Pendência nº.24749)
- Consultas \ Geral de Pessoa
  * Habilitada a Consulta Geral de Pessoa.
================================================================================
CM$VER      3.20.01     11/06/2007
--------------------------------------------------------------------------------
(Pendência nº.25537)
- Transações / Processo / Aba Encerramento:
  * O sistema não mais permite a edição de dados na subtela "Parcelas de Acordo de
    Um Processo", sem que a tela "Cadastro de Processos" esteja no modo de alterar ou inserir.
================================================================================
CM$VER      3.20.00     02/04/2007
--------------------------------------------------------------------------------
(Todos para Pendência 22443 - Primeira Etapa)
- Cadastros / Tipos de Processo
  * Foi acresentado o campo "Haverá Contabilização por Centro de Custo ?"
- Cadastros / Parametrização Contábil:
  * Foram acresentados os campos: Tipos de Processo, Usa Plano/Patro Padrão,
    Centro de Custo e Tipo de Operação.
- Transações / Processo:
  * Foi acresentada a aba "Hist. de Alterações", que exibe o histórico de alteraçoes
    efetuadas em um destes campos: Tipo de Processo e/ou Vara de Justiça e/ou Somos Parte.
  * Foram acrescentados os campos: Centro de Custo da Contraparte e Centro de custo 
     dos Litisconsortes, ambos disponíveis apenas em processos do tipo que exige centro de custo.   
================================================================================
CM$VER      3.19.06     14/03/2007
--------------------------------------------------------------------------------
(Pendência 24683) 
- Transações / Manutenção de Documentos (AP / GR):
  * O sistema limpa a tela ao alternar entre Contas a Pagar e Contas a Receber.
================================================================================
CM$VER      3.19.05     26/02/2007
--------------------------------------------------------------------------------
- Transações / Manutenção / Manutenção de APs e GRs:
  * Acertos diversos nas funcionalidades do botão "Procurar" desta tela.
================================================================================
CM$VER      3.19.04     14/02/2007
--------------------------------------------------------------------------------
(Pendência 24399)
- Transações / Processo e Transações / Etapas do Processo  (Subtela Penhora):
  * A busca de um Bem do Ativo Permanente foi substituída de caixa de seleção ("combo box")
    para uma matriz de múltiplas seleções ("Monta Select"), nesta constando: número de
    patrimônio, descrição do bem, classe do bem e descrição do conjunto.
(Implementação Espontânea)
- Transações / Processo e Transações / Etapas do Processo  (Subtela Penhora):
  * A busca de um Imóvel foi substituída de caixa de seleção ("combo box")
    para uma matriz de múltiplas seleções ("Monta Select"), nesta constando: Imóvel Mestre,
    Nome do Imóvel, Status, Código, Tipo do Imóvel, Marca / Franquia, Nome Endereço,
    Logradouro, Bairro, Cidade, UF.
================================================================================
CM$VER      3.19.03     08/02/2007
--------------------------------------------------------------------------------
(Pendência 24398)
- Transações / Processo e Transações / Etapas do Processo  (Subtela Penhora):
  * Agora são exibidas apenas duas casas decimais no campo "Valor desta penhora", 
    quando a opção “Valor” for selecionada no campo “Classificação do Valor ao Lado”.
(Pendência 24400)
- Transações / Processo e Transações / Etapas do Processo (aba Etapas):
  * Inclusão das seguintes informações: Valor da Etapa, custas, a etapa vinculada, 
    tipo de penhora (Imóvel, Ativo Permanente, Investimento ou Numerário) e qual o bem
    penhorado.
================================================================================
CM$VER      3.19.02     03/01/2007
--------------------------------------------------------------------------------
- Transações / Processo e Transações / Etapas do Processo  (Subtela Multa):
  * Correção da integração contábil e financeira.
- Transações / Manutenção de Documentos (AP/GR):
  * Correção para exibição do botão que permite visualizar AP ou GR.
- Transações / Processos:
  * Correção na rotina de cálculo dos juros, para considerar a data de encerramento como
    base dos juros para os processos encerrados.
(Ref. Pendência 23352)
- Transações / Correção Monetária ...:
  * Alteração no método de seleção de processos, para minimizar o impacto de longas listas.
  * Ajuste da barra de rolagem.
- Transações / Ajuste da Estimativa ...:
  * Alteração no método de seleção de processos, para minimizar o impacto de longas listas.
================================================================================
CM$VER      3.19.01     07/11/2006
--------------------------------------------------------------------------------
(Pendência 22886)
- Transações / Processo / aba Honorários e Transações / Honorários do Processo:
  * Inclusão do campo que permite a opção entre Pagamento e Provisão do honorário.
- Transações / Honorários do Processo:
  * Revisão e acerto da rotina de integração contábil e financeira do pagamento (ou
    provisão) do honorário.
================================================================================
CM$VER      3.18.05     06/11/2006
--------------------------------------------------------------------------------
(Ref. Complementação à Pendência 22572)
- Transações / Etapas do Processo:
  * Alteração da opção para gerar lançamentos contábeis dos eventos de penhora
    de investimentos, no que diz respeito a considerar Plano e Patrocinadora
    associados ao título.
================================================================================
CM$VER      3.18.04     01/11/2006
--------------------------------------------------------------------------------
(Complementação à Pendência 22572)
- Transações / Etapas do Processo:
  * Implementação da opção para gerar lançamentos contábeis dos eventos de penhora
    de investimentos.
- Consultas / Relatórios / ... / Operacionais / Relação de Processos:
  * O contador de processos não mais informa quantidade igual a 1, quando nenhum
    processo é listado.
================================================================================
CM$VER      3.18.03     31/10/2006
--------------------------------------------------------------------------------
(Ref. Pendência 22906)
- Transações / Etapas do Processo:
  Implementação da segregação da subtela Multa na aba Pagamento. 
================================================================================
CM$VER      3.18.02     16/10/2006
--------------------------------------------------------------------------------
(Ref. Pendência 20529)
- Transações / Etapas do Processo:
  * Ao criar uma etapa que coloca um processo aberto em fase de execução, o sistema
    alerta o usuário para, caso deseje usar a opção de alterar a estimativa atual
    para 100% e gerar o respectivo evento contábil, ele deve utilizar a tela
    Transações / Processo. Se, porém, não for fazer esse procedimento ou se quiser 
    apenas o ajuste da estimativa, sem a contabilização, pode fazer nesta tela.
================================================================================
CM$VER      3.18.01     05/10/2006
--------------------------------------------------------------------------------
- Transações / Correção Monetária dos Processos e
  Transações / Ajuste da Estimativa Original às Penhoras e Depósitos:
  * Opção "técnica" na forma como o comando de seleção dos processos é executado.
    Caso o usuário faça uma "segunda seleção" (marcando, desmarcando, selecionando
    todos e invertendo a seleção), que resulte num subconjunto dos processos
    inicialmente selecionados, o sistema dá um alerta, pois este procedimento induz
    o sistema a utilizar a metodologia até então vigente, que pode causar problemas
    no Banco de Dados caso um número muito grande de processos resulte da seleção.
    Por outro lado, se o usuário mantiver a seleção original (que resulta do aciona-
    mento do botão OK), o sistema utiliza uma nova metodologia, que (espera-se)
    evita o problema técnico reportado.
================================================================================
CM$VER      3.18.00     03/10/2006
--------------------------------------------------------------------------------
(Pendência 20529)
- Cadastros / Tipos de Etapa (Andamento)
  * Inclusão de campo para indicar se esse tipo de etapa coloca o processo
    em fase de execução.
- Transações / Processo:
  * Ao criar uma etapa que coloca um processo aberto em fase de execução, o sistema
    oferece ao usuário a opção de alterar a estimativa atual para 100%, gerando o 
    respectivo evento contábil.
- Transações / Etapas do Processo:
  * Ao criar uma etapa que coloca um processo aberto em fase de execução, o sistema
    alerta o usuário para, caso deseje usar a opção de alterar a estimativa atual
    para 100% e gerar o respectivo evento contábil, ele deve utilizar a tela acima.
(Ref. Pendência 20304)
- Transações / Processo e Transações / Etapas do Processo:
  * Acertos nas rotinas de penhora e respectiva desconstituição de bens e imóveis,
    no tocante à marcação dos mesmos como penhorados ou liberados.
(Espontâneo)
- Sistema / Configuração / Parâmetros do Sistema:
  * Foi retirada da tela a opção para integração contábil em "Lote ou Pontual", uma vez
    que ela já havia sido desativada do sistema (ambas as opções são agora possíveis,
    dependendo de escolha das respectivas funções pelo usuário).
================================================================================
CM$VER      3.17.05     20/09/2006
--------------------------------------------------------------------------------
(Ref. Pendência 22572)
- Transações / Processo e Transações / Etapas do Processo:
  * Ao chamar a Subtela Penhora, o sistema agora verifica se a data da etapa já foi
    informada pelo usuário, obrigando o seu preenchimento.
(Espontâneo)
- Cadastros / Tipos de Objeto Reclamado:
  * Correção do erro que era exibido ao selecionar a caixa "Rubrica Selecionada".
(Espontâneo)
- Consultas/Relatórios/Sistema Jurídico Consolidado/Cadastrais/Ficha do Processo:
  * Inclusão do CPF (ou CNPJ, cf o caso) dos litisconsortes.
================================================================================
CM$VER      3.17.04     14/09/2006
--------------------------------------------------------------------------------
(Pendência 22572)
- Transações / Processo e Transações / Etapas do Processo (Subtela Penhora):
* Ao marcar que a penhora se fará com Investimento, o sistema agora habilita as
informações deste sistema, para que o usuário possa buscar o título / aplicação
que é o objeto da penhora.
* Nesta liberação, não está ainda implementada a integração contábil e financeira.
(Pendência 21671)
- Transações / Processo:
* Ao finalizar o cadastramento de um processo, o sistema emite mensagem perguntando se
o usuário deseja que seja gerada a ficha do processo.
================================================================================
CM$VER      3.17.03     25/08/2006
--------------------------------------------------------------------------------
- Transações / Processo :
  * Correção da rotina de exclusão de um processo, que exibia um erro e impedia a ação.
================================================================================
CM$VER      3.17.01     15/08/2006
--------------------------------------------------------------------------------
- Transações / Processo :
  * Correção da rotina de exclusão de um processo, que exibia um erro e impedia a ação..
================================================================================
CM$VER      3.17.00     09/08/2006
--------------------------------------------------------------------------------
(Ref. Pendência 20720)
- Cadastros / Tipos de Etapas (Andamentos):
  * Inclusão dos campos Taxa de Juros, Incidência dos Juros e Indice de Correção
    Monetária. 
- Transações / Correção Monetária dos Processos:
  * Na correção monetária e juros de Recursos, o usuário pode optar pelas condições
    já registradas no tipo de etapa, ou especificar outras no momento do cálculo.
================================================================================
CM$VER      3.16.01     07/08/2006
--------------------------------------------------------------------------------
(Ref. Pendência 20720)
- Cadastros / Tipos de Etapas (Andamentos):
  * Inclusão dos campos Taxa de Juros, Incidência dos Juros e Indice de Correção
    Monetária. 
- Transações / Correção Monetária dos Processos:
  * Na correção monetária e juros de Recursos, o usuário pode optar pelas condições
    já registradas no tipo de etapa, ou especificar outras no momento do cálculo.
********************************************************
(Ref. Pendência 20720)
- TCtrlHstObjProcTrab:
  * Alterações no método Corrigir, para dar supórte aos cálculos de correção monetária
    e juros de Recursos pelas condições já registradas no tipo de etapa.
- TDbTipoRecTrab e TCtrlTipRec:
  * Inclusão e tratamento dos campos TAXAJUROS, INDJUROS e MOECODIGO da tabela TIPORECTRAB.bela TIPORECTRAB.
================================================================================
CM$VER      3.16.00     01/08/2006
--------------------------------------------------------------------------------
(Pendência 21546)
- Consultas/Relatórios/Sistema Jurídico Consolidado/Cadastrais/Ficha do Processo:
  * Inclusão dos campos:
    1) Número Interno do processo;
    2) Plano da contraparte e litisconsortes;
    3) Data de ajuizamento;
    4) Tipo de processo;
    5) Cidade/Estado onde ocorre o processo;
    6) Índice de atualização monetária do processo.
(Ref. Pendência 20720)
- Transações / Correção Monetária dos Processos:
  * Na correção monetária e juros de Custas Judiciais, o usuário pode optar pelas
     condições  já registradas no processo, ou especificar outras no momento do
     cálculo.
(Pendência 22945)
- Transações / Processo:
  * Pequena alteração no desenho da tela, de forma a não ficar exposta uma minúscula
     parte do botão que aciona Contas Bancárias, o que possibilitava ao usuário incauto
    abrir essa tela, embora com esforço muito especial e intencional, quando a etapa não
    se encontrava em edição.
================================================================================
CM$VER      3.15.02     26/07/2006
--------------------------------------------------------------------------------
(Pendências 20719 e 20720)
- Transações / Correção Monetária dos Processos:
* Implementação de opções na tela, para dar suporte aos cálculos de correção monetária
e juros de Recursos e Custas Judiciais.
(Ref. Pendência 20624)
- Transações / Processo e Transações / Etapas do Processo (Subtela Multa):
* Ao usuário alterar a data de pagamento (antes do pagamento efetuado), o sistema agora
recalcula o valor a pagar.
- Transações / Processo (Subtela Multa):
* O sistema agora inibe o pagamento de multa para um processo que esteja sendo inserido.
================================================================================
CM$VER      3.15.01     26/06/2006
--------------------------------------------------------------------------------
- Consultas / Relatórios / ... / Operacionais / Relação de Processos (Pendência 20620):
  * Inclusão de uma identificação de a que se refere o valor (depósito, penhora,
    levantamento ou convolação).
- Transações / Processo e Transações / Etapas do Processo:
  * Alterações referentes aos campos Plano e Patrocinadora nas rotinas de integração.
- Várias Telas:
  * Introdução da Ajuda "OnLine" (requer o arquivo SistJurCons.chm na pasta Help).
================================================================================
CM$VER      3.15.00     16/06/2006
--------------------------------------------------------------------------------
(Pendências 20617 e 20624)
- Transações / Processo e Transações / Etapas do Processo  (Subtela Multa):
  * Inclusão das informações relativas ao pagamento da multa e sua integração contábil
    e financeira.
================================================================================
CM$VER      3.14.05     07/06/2006
--------------------------------------------------------------------------------
(Alterações ref. Pendência 20613)
- Transações / Processo:
  * Correção na opção de gerar uma autorização de pagamento (AP), quando o
    valor da condenação for superior a soma dos valores de depósito recursal, judicial
    e penhora, ou uma guia de recebimento (GR) se for inferior.
    Permite, ainda, que o usuário possa gerar o evento contábil do valor real.
================================================================================
CM$VER      3.14.04     05/06/2006
--------------------------------------------------------------------------------
(Pendência 20613)
- Transações / Processo:
  * O sistema oferece ao usuário opção gerar uma autorização de pagamento (AP), quando o
    valor da condenação for superior a soma dos valores de depósito recursal, judicial
    e penhora, ou uma guia de recebimento (GR) se for inferior.
    Permite, ainda, que o usuário possa gerar o evento contábil do valor real.
================================================================================
CM$VER      3.14.03     01/06/2006
--------------------------------------------------------------------------------
(Pendência 20533)
- Transações / Ajuste da Estimativa Original aos Depósitos e Penhoras:
  * Inclusão dessa nova tela, que permite ao usuário solicitar que a estimativa
    original dos valores reclamados nos processos selecionados seja ajustada ao
    valor dos depósitos e penhoras.
(Ref. à Pendência 20609)
- Sistema / Configuração / Parâmetros:
  * Corrigido o texto "Faz Integração com Contas a Pagar?" para
    "Faz Integração com Contas a Pagar/Receber?".
(Ref. ás Pendências 20524 e 20609)
- Transações / Etapas do Processo:
  * Correção ref. ao alerta quando existir diferença entre os valores dos depósitos mais
    penhoras em numerário e o valor levantado ou convolado, para registro dessa diferença e,
    opcionalmente, geração de integração financeira (Contas a Receber) e/ou contábil.
(Ref. à Pendência 21291)
- Transações / Processo e Transações / Etapas do Processo (Subtela Penhora):
  * Foi corrigida a exibição do número de patrimônio sem que se tenha escolhido um bem.
================================================================================
CM$VER      3.14.02     18/05/2006
--------------------------------------------------------------------------------
(Ref. à Pendência 20609)
- Sistema / Configuração / Parâmetros:
  * Alterado o texto "Faz Integração com Contas a Pagar?" para
    "Faz Integração com Contas a Pagar/Receber?".
- Transações / Etapas do Processo:
  (Pendências 20524 e 20609)
  * O sistema emite um alerta quando existir diferença entre os valores dos depósitos mais
    penhoras em numerário e o valor levantado ou convolado, para registro dessa diferença e,
    opcionalmente, geração de integração financeira (Contas a Receber) e/ou contábil.
  (Espontânea, sem pendência) 
  * O sistema emite um alerta quando existir variação dos valores dos depósitos mais
    penhoras em numerário, para registro dessa diferença e, opcionalmente, geração de
    integração financeira (Contas a Pagar) e/ou contábil.
(Ref. à Pendência 21291)
- Transações / Processo e Transações / Etapas do Processo (Subtela Penhora):
  * A tela exibia o número de patrimônio sem que se tivesse escolhido um bem. Isto foi
    corrigido.
================================================================================
CM$VER      3.14.01     28/04/2006
--------------------------------------------------------------------------------
(Alterações ref. Pendências 20547 e 20658)
- Transações / Processo / aba Honorários e Transações / Honorários do Processo:
  * A opção de sucumbência deixa novamente de ficar restrita a processos encerrados.
(Pendência 21965)
- Transações / Processo / Aba Litisconsortes:
  * Foi criada a categoria "Parte Ré". Esta categoria só fica habilitada para a escolha
    quando no campo "Somos a Parte" estiver selecionada a opção "Não é parte".
================================================================================
CM$VER      3.14.00     20/04/2006
--------------------------------------------------------------------------------
(Pendências 20547 e 20658)
- Transações / Processo / aba Honorários e Transações / Honorários do Processo:
  * Tratamento adicional nos casos de Honorários de Sucumbência: 1) opção para valor,
    como já era, ou % sobre o valor da condenação; 2) a opção de sucumbência fica
    agora restrita a processos encerrados.
(Complementação Espontânea à Pendência 20521)
- Transações / Processo / aba Etapas e Transações / Etapas do Processo:
  * Ao acessar o botão e tela auxiliar para registrar/consultar conta bancária, foi
    acrescentada a opção para conta de terceiros.
================================================================================
CM$VER      3.13.01     17/04/2006
--------------------------------------------------------------------------------
- Transações / Processo:
  * Correção na busca do processo.
================================================================================
CM$VER      3.13.00     13/04/2006
--------------------------------------------------------------------------------
(Pendência 20549)
- Transações / Processo e Transações / Etapas do Processo (Subtela Penhora):
  * Inclusão de campo para registro da avaliação realizada pelo oficial de justiça.
(Pendências 20526 e 20528)
- Transações / Processo e Transações / Etapas do Processo:
  * Inclusão de botão e tela auxiliar para registrar/consultar a multa associada à etapa.
(Pendências 20534 e 20659)
- Transações / Processo / aba Encerramento:
  * Inclusão de campo para registro do tipo de condenação: se solidária com um ou mais dos
    "nossos litisconsortes", se subsidiária em relação aos mesmos, ou nenhum destes casos.
    No caso de "solidária", é habilitado o botão que permite registrar/visualizar o valor
    de condenação correspondente a cada uma das partes numa tela auxiliar.
================================================================================
CM$VER      3.12.00     06/04/2006
--------------------------------------------------------------------------------
(Pendência 20521)
- Transações / Processo e Transações / Etapas do Processo:
  * Inclusão de botão e tela auxiliar para registrar/consultar a conta bancária (da
    empresa proprietária) que está associada a esta etapa. A associação fica a critério do
    usuário, podendo significar de onde sai o valor de um depósito, para onde retorna o
    levantamento de um depósito, de onde sai uma penhora em numerário, etc.
(Pendência 22002)
- Transações / Processo:
  * Foi retirada a "dica" associada ao botão "Ver Histórico do Objeto Selecionado".
================================================================================
CM$VER      3.11.01     29/03/2006
--------------------------------------------------------------------------------
(Pendência 21927)
- Consultas/Relatórios/Sistema Jurídico Consolidado/Cadastrais/Ficha do Processo:
  * Acerto da quebra de página.
================================================================================
CM$VER      3.11.00     28/03/2006
--------------------------------------------------------------------------------
(Pendência 20532)
- Consultas/Relatórios/Sistema Jurídico Consolidado/Operacionais:
  * Inclusão do relatório "Excesso ou Insuficência de Penhora".
(Pendência 20535)
- Transações / Processo:
  * Implementação da opção "Não é Parte" (SIC) no campo "Somos Parte", para dar a conotação 
    de que a empresa proprietária do sistema não é a parte que move o processo (ativa) e nem
    a que é acionada (passiva), mas apenas interessada no mesmo. Cabe ao usuário discernir e
    definir de que forma irá registrar as duas partes efetivamente ativa e passiva do processo.
  Obs.: esta implementação tem também reflexo nas telas de filtro de consultas e relatórios,
        de forma a considerar essa nova opção.
(Pendências 20520 e 20525)
- Transações / Processo e Transações / Etapas do Processo:
  * Inclusão das opções "Levantamento" e "Convolação" e exclusão da opção "Despesa" para o
    valor informado na etapa.
(Pendências 20523)
- Transações / Processo e Transações / Etapas do Processo:
  * Inclusão do campo "Custas Judiciais" em substituição à ooção "Despesa" antes existente.
  Obs.: estas duas implementações acima têm também reflexo nos relatórios "Relação de 
        Processos" e "Ficha do Processo".
================================================================================
CM$VER      3.10.07     15/03/2006
--------------------------------------------------------------------------------
(Pendência 20578)
- Transações / Processo:
  * Implementação da verificação do Litisconsorte ao inserí-lo no processo. O sistema
    exibe outros processos em que o mesmo esteja envolvido.
================================================================================
CM$VER      3.10.06     03/03/2006
--------------------------------------------------------------------------------
(Pendência 20522)
- Consultas/Relatórios/Sistema Jurídico Consolidado/Cadastrais/Ficha do Processo:
  * A tela de solicitação da Ficha foi tranformada, de forma a poder selecionar um só
    processo (como era antes) ou especifcar filtros de várias maneiras, à semelhança do
    que existe em outros relatórios do módulo (pendência atendida com ganho de qualidade).
================================================================================
CM$VER      3.10.05     24/02/2006
--------------------------------------------------------------------------------
(Pendência 21278)
- Transações / Processo e Transações / Etapas do Processo / Subtela Penhora:
  *  No campo descrição do imóvel são agora mostrados os seguintes dados do imóvel:
     Nome do Imóvel + Código do Imóvel + Nome do Imóvel Mestre + Cidade do Imóvel
     + Estado (UF) do Imóvel.  Esses dados também ficam na tela, após a seleção do imóvel.
(Pendência 21615)
- Transações / Processo /Aba Outro Dados / Sub Aba Datas Tipo e Localização:
* O Sistema não mais permite que a Cidade Onde Corre o Processo seja  informada
   textualmente (sem a busca pelo botão localizar cidade).
================================================================================
CM$VER      3.10.04     17/02/2006
--------------------------------------------------------------------------------
- Transações / Processo:
  (Pendência 21194)
  * Ao buscar contraparte restrita a participantes, o sistema exibe mais de um plano, se
    for o caso, mas agora mantém o plano escolhido vinculado ao processo.
  (Extensão da Pendência 20803)
  * Quando ocorre a substituição da contraparte por um litisconsorte, o sistema mantém agora
    para a situação da contraparte que passa a ser litisconsorte a que o usuário escolheu.
================================================================================
CM$VER      3.10.03     13/02/2006
--------------------------------------------------------------------------------
- Transações / Processos (Complem. Pendência 21290):
  * O sistema agora não permite que o usuário digite a data sem que haja a alteração da
     situação de “NORMAL” para outra qualquer.
  * O campo data de alteração das litisconsortes agora possui um rótulo.
- Transações / Processos (Pendência 21058):
  * Na inserção de um processo, o sistema deixa o campo taxa de juros marcado em 1%
    como padrão, porém permite a sua alteração pelo usuário.
- Transações / Processos (Pendência 20803):
  * Na alteração da situação da contraparte de "NORMAL" para outra qualquer, quando
    o sistema pergunta se o usuário quer colocar uma das litisconsortes no lugar da contra-
    parte, ele agora muda a situação da "nova contraparte" para normal.
================================================================================
CM$VER      3.10.02     10/02/2006
--------------------------------------------------------------------------------
(Pendência 21291)
- Transações / Processo e Transações / Etapas do Processo / Subtela Penhora:
  * O texto "Bem do Ativo" foi alterado para "Ativo Permanente".
  * Ao escolher um conjunto, são listados apenas os bens pertencentes ao conjunto
    escolhido.
  * A tela lista apenas os bens do Ativo Fixo que não foram baixados.
  * A tela apresenta o número de patrimônio do bem.
================================================================================
CM$VER      3.10.01     08/02/2006
--------------------------------------------------------------------------------
- Consultas / Realatórios / ... / Operacionais / Relação de Processos (Pendência 21315):
  * Foram incluídos os valores das etapas.
================================================================================
CM$VER      3.10.00     27/01/2006
--------------------------------------------------------------------------------
- Transações / Processos (Pendência 21290):
  * Foram incluídos campos para registrar a data da alteração da
    situação da contraparte e dos litisconsortes.
    O sistema registra essa data quando ocorre a alteração da situação
    de "NORMAL" para outra qualquer.
================================================================================
CM$VER      3.09.07     28/12/2005
--------------------------------------------------------------------------------
- Consultas / Alterações e Exclusões dos Processos (Pendência 21072):
  * Inclusão desta nova tela, que permite consultar o histórico de alterações e exclusões
    dos processos, estando estes eventos registrados na estrutura LOGTABELAS.
    Opcionalmente, permite também a consulta da inserção dos processos, sendo que neste
    caso a informação é obtida no próprio processo.
================================================================================
CM$VER      3.09.06     11/11/2005
--------------------------------------------------------------------------------
- Transações / Processo: (Pendência 20580)
  * Foi corrigido o erro que ocorria quando o usuário inseria e deletava um ou mais 
     objetos antes de dar o OK final.
================================================================================
CM$VER      3.09.05     14/10/2005
--------------------------------------------------------------------------------
- Transações / Etapas do Processo:
  * Foi corrigida a rotina de integração com contas a pagar das etapas.
================================================================================
CM$VER      3.09.04     10/10/2005
--------------------------------------------------------------------------------
- Transações / Processo:
  * Foi corrigida a rotina de mensagens na penhora.
- Transações / Etapas do Processo:
  * Foi corrigida a rotina de contabilização das etapas.
  * Foi corrigida a rotina de mensagens na penhora.
- Transações / Correção Monetária dos Processos:
  * Foi corrigida a situação que gerava correção negativa ou divisão por zero.
- Consultas / Relatórios / Sist... / Cadastrais / Ficha do Processo:
  * Foi corrigida a exibição dos valores dos objetos (Pendência 20405).
================================================================================
CM$VER      3.09.03     26/09/2005
--------------------------------------------------------------------------------
(Pendência 20304)
- Transações / Processo / aba Etapas / tela Informações sobre Penhora
 e
- Transações / Etapas do Processo / tela Informações sobre Penhora:
  * Possibilidade de informar um valor negativo, significando uma "desconstituição da
    penhora".  Se a penhora for de um imóvel ou bem do ativo, o sistema avisa e
    impede um valor maior que o já penhorado.  Nos casos de investimento ou numerário,
    o usuário é responsável por este controle.
    A sugestão é, no Cadastro de Tipos de Etapa, criar uma "Desconstituição de
    Penhora" (ou algo similar), informando tratar-se também daquelas do tipo que
    "Envolve Penhora".
================================================================================
CM$VER      3.09.02     23/09/2005
--------------------------------------------------------------------------------
- Transações / Processo / aba Etapas / tela Informações sobre Penhora:
  * Correção da rotina de cálculo do Valor Contábil dos bens.
================================================================================
CM$VER      3.09.01     19/09/2005
--------------------------------------------------------------------------------
- Transações / Processo:
  * Na aba Litisconsortes, são agora exibidos Plano e Patrocinadora, se for o caso.
  * Na aba Litisconsortes, foi corrigida a inserção de novo registro.
- Transações / Etapas do Processo:
  * Foi incluída a opção de busca do processo "Procurar Incluindo Litisconsortes".
================================================================================
CM$VER      3.09.00     15/09/2005
--------------------------------------------------------------------------------
- Transações / Processo:
  * No histórico dos objetos, são agora exibidos Juros e Correção Monetátia.
- Transações / Correção Monetária dos Processos:
  * No histórico dos objetos, são agora gravados Juros e Correção Monetátia.
================================================================================
CM$VER      3.08.11     13/09/2005
--------------------------------------------------------------------------------
- Transações / Processo / Tela Principal e aba Litisconsortes:
  * Opção para restringir a busca da contraparte e dos litisconsortes a empregados 
    (nos processos trabalhistas) ou participantes (nos processos previdenciários).
    Se o usuário optar por "Sim", a tela de busca conterá dados específicos destes
    respectivos contextos.
================================================================================
CM$VER      3.08.10     05/09/2005
--------------------------------------------------------------------------------
- Transações / Processo / aba Etapas:
  * Melhor visulização das etapas, ficando visível agora a barra de rolagem vertical.
================================================================================
CM$VER      3.08.09     24/08/2005
--------------------------------------------------------------------------------
- Transações/Processo/Outros Dados/ Tipos ... :
  * O sistema rejeita o cadastramento do processo, se o tipo de processo estiver omitido.
================================================================================
CM$VER      3.08.08     10/08/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / Ficha do Processo:
  * Foi corrigido o problema que causava um erro quando a contraparte não possui
     endereço ou este não está marcado como "Residencial" ou "Comercial". 
================================================================================
CM$VER      3.08.07     04/08/2005
--------------------------------------------------------------------------------
- Transações/Processo/Outros Dados/Datas ...:
  * Inclusão de campo para visualizar a data de cadastramento do processo.
- Transações/Processo/Objetos: 
  * O sistema agora não permite retroagir a data de avaliação.
- Transações/Processo/Geral:
  * O sistema rejeita o cadastramento do processo, se algum destes dados estiver omitido:
    numero do processo, nome da contraparte, vara , cidade onde corre o processo, 
   data do ajuizamento, data da notificação, data do inicio dos juros (se houver taxa),
   taxa de juros (se houver data de início), pelo menos um objeto com valor,
   indice de correção monetária (se for o caso), regra (se for ocaso).
- Transações/Correção Monetária dos Processos:
  * Alteração no método de cálculo de juros;
  * Introdução do cálculo Pro Rata Die na atualização monetária.
================================================================================
CM$VER      3.08.06     01/08/2005
--------------------------------------------------------------------------------
- Transações / Processo:
  * Acertos na gravação e exclusão do histórico dos objetos.
================================================================================
CM$VER      3.08.05     23/05/2005
--------------------------------------------------------------------------------
- Várias telas de Transções e Consultas:
  * Correção de erro de comando de acesso ao Banco de Dados, que ocorria quando se
    selecionava um tipo de objeto.
- Transações / Correção Monetária dos Processos:
  * Revisão do critério de cálculo.
================================================================================
CM$VER      3.08.04     21/02/2005
--------------------------------------------------------------------------------
- Consultas / Realatórios / ... / Operacionais / Relação de Processos:
  * Alteração na Exibição dos Valores dos Objetos.
================================================================================
CM$VER      3.08.03     18/01/2005
--------------------------------------------------------------------------------
- Transações / Processo:
  * Correção na exclusão de processos.
================================================================================
CM$VER      3.08.02     14/01/2005
--------------------------------------------------------------------------------
- Transações / Processos:
  * Correção do erro que era gerado mediante a tentativa de mudar a matéria do
  processo para Trabalhista e o Contraparte não tinha a Data de Demissão informada
  em seu cadastro.
================================================================================
CM$VER      3.08.01     07/01/2005
--------------------------------------------------------------------------------
- Consultas/Relatórios/Operacionais/Relação de Processos:
  * Inclusão das casas decimais para os campos de valores no relatório principal;
  * Acerto das colunas do relatório de resumo.
================================================================================
CM$VER      3.08.00     29/12/2004
--------------------------------------------------------------------------------
- Sistema / Configuração / Parâmetros:
  * Opção para que a contabilização dos processos seja feita por lote ("batch"),
    juntamente com o processo de correção monetária, ou pontual (processo a 
    processo, como já era), sempre que algum valor se alterar.
- Transações / Correção Monetária dos Processos:
  * Foi introduzida a opção de contabilização, caso a opção acima seja Lote.
================================================================================
CM$VER      3.07.00     01/12/2004
--------------------------------------------------------------------------------
- Sistema / Configuração / Parâmetros:
  * Opção para que a Estimativa Atual seja expressa em relação ao Valor Reclamado
    (como já era) ou à Estimativa Original, com reflexo na tela do Processo e nos
    relatórios correspondentes.
- Transações / Correção Monetária dos Processos:
  * Foi introduzida esta nova funcionalidade, que faz a atualização monetária dos
    processos que possuam um índice ou uma regra de correção.
- Transações / Processo / aba Objetos do Processo:
  * Foi introduzido o histórico dos objetos, que registra e exibe as alterações
    ocorridas (valores, percentuais, observação).
- Consultas/Relatórios/Operacionais/Análise Sintética de Processos:
  * Correção no erro ao tentar imprimir o relatório.
================================================================================
CM$VER      3.06.01     15/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Correção do Valor permitido para os percentuais das Estimativas, quando
    estes superavam 999,99%.
================================================================================
CM$VER      3.06.00     14/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Ampliação do Valor permitido para o percentual da Estimativa Original;
  * Ampliação do Valor permitido para o percentual da Estimativa Atual; 
  * A informação relativa à Data da Avaliação do Valor da Estimativa Atual só
    será automaticamente alimentada com a data de hoje na inclusão do objeto.
================================================================================
CM$VER      3.05.00     06/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Inclusão da informação relativa ao Valor da Estimativa Original;
  * Inclusão da informação relativa à Data da Avaliação do Valor da Estimativa Atual;
  * Rearrumação das informações na tela, para melhor compreensão.
- Transações / Processo / aba Valores e Sua Atualização:
  * Inclusão das informações relativas à Taxa de Juros e respectiva Data.
================================================================================
CM$VER      3.04.00     20/08/2004
--------------------------------------------------------------------------------
- Aumento do tamanho do campo "ASSUNTO RESUMIDO" (de 40 para 120 posições)
  nas etapas dos processos, com consequente alteração nas seguintes telas
  e relatórios:
  * Transações / Processo / aba Etapas;
  * Transações / Etapas do Processo;
  * Consultas / Relatórios / ... / Cadastrais / Ficha do Processo;
  * Consultas / Relatórios / ... / Operacionais / Relação de Processos.
================================================================================
CM$VER      3.03.00     15/06/2004
--------------------------------------------------------------------------------
- Transações / Processo / Outros Dados / Advogados e Assistente:
  * Foi incluído na tela o Setor Responsável pelo processo.
================================================================================
CM$VER      3.02.06     14/06/2004
--------------------------------------------------------------------------------
- Transações / Processo / Outros Dados / Instâncias:
  * Foi reincluído na tela o campo Nº da Vara onde tramitam os processos.
================================================================================
CM$VER      3.02.05     30/04/2004
--------------------------------------------------------------------------------
- Transações / Processo e Etapas do Processo / Penhora:
  * Quando se escolher um imóvel a ser penhorado, o sistema valida o valor da
    penhora para não ultrapassar o valor de mercado menos o valor já penhorado.
  * Quando se escolher um bem do ativo fixo a ser penhorado, são mostrados na tela
    o valor contábil mais recente, sua data e o valor já penhorado.
  * Quando se escolher um bem do ativo fixo a ser penhorado, o sistema valida o
    valor da penhora para não ultrapassar o valor contábil menos o valor já penhorado.
  * Ao inserir uma Etapa, o botão de penhora não vem mais habilitado.
- Transações / Processo:
  * Foi corrigida a busca do Processo pelo Número Proc. na 1a Instância.
================================================================================
CM$VER      3.02.04     27/04/2004
--------------------------------------------------------------------------------
- Transações / Processo e Etapas do Processo / Penhora:
  * Quando se escolher um imóvel a ser penhorado, são mostradas na tela estas informações:
    Valor do imóvel, a data de avaliação e  valor já penhorado.
  * Quando se escolher um bem do ativo fixo a ser penhorado, é mostrado na tela o valor já
    penhorado.
- Transações / Processo / Substituição da Contraparte:
  * O sistema não deixa escolher na lista um Litisconsorte com situação diferente de Normal.
- Transações / Rateio de Despesas Judiciais e Administrativas:
  * Depois de efetuado o rateio, esses valores podem ficar vinculados ao processo. Para
    tanto, deve-se especificar um tipo de etapa.
- Consultas / Relatórios / ... / Ficha do Processo:
  * Foi acrescentado o valor da penhora.
================================================================================
CM$VER      3.02.03     26/04/2004
--------------------------------------------------------------------------------
- Transações / Rateio de Despesas Judiciais e
  Consultas / Relatórios / ... / Recibo de Pagamento de Honorários Advocatícios:
  * A seleção dos Tipos de Desembolso passa a listar somente os da Empresa
  Proprietária atual.
================================================================================
CM$VER      3.02.02     17/03/2004
--------------------------------------------------------------------------------
- Cadastros / Órgãos Jurisdicionais (Varas):
  * Acrescentada a UF na tela de busca.
- Consultas / Relatórios / ... / Cadastrais / Órgãos Jur. (Varas):
  * Acrescentada a UF.
- Transações / Processo Trabalhista:
  * Implementação da verificação da Contraparte ao inserir um processo. O sistema
  exibe outros processos em que a mesma esteja envolvida.
================================================================================
CM$VER      3.02.01     15/03/2004
--------------------------------------------------------------------------------
- Acerto na autorização dos itens de menu na tela principal.
================================================================================
CM$VER      3.02.00     12/03/2004
--------------------------------------------------------------------------------
- Substituição da Contraparte:
  * Se a Contraparte for excluída do processo por algum motivo (que deve ser
    indicado na caixa "Situação da Contraparte"), o sistema pergunta se algum
    litisconsorte deve assumir como a Contraparte principal.
  * Se for o caso, o usuário é orientado a indicar qual deles, dentro da lista,
    assumirá como Contraparte, e também se esta deve ser levada para a lista de
    litisconsortes.
- Associação de UF's aos Órgãos Jurisdicionais:
  * Na tela do Cadastro de Órgãos Jurisdicionais, foi acrescentado um campo para ser
    indicada a UF de cada órgão.
  * Na seleção de um Órgão Jurisdicional, tanto na tela do Processo, quanto nas
    telas de seleção para consultas e relatórios, nas listas em que são exibidos os
    Órgãos Jurisdicionais para escolha, agora aparecem também suas respectivas UF's.
- Encerramento de Processos:
  * No cadastro dos Tipos de Etapa, foi criado um campo para indicar se a etapa,
    uma vez registrada, implica em encerramento do processo.
  * Quando uma etapa assim identificada for inserida em um processo, será
    perguntado se o processo deve ser encerrado e, em caso afirmativo,
    a aba de encerramento será aberta, para a devida complementação de informações
    sobre o mesmo, como já ocorre quando explicitamente se altera o processo para
    encerrado.
================================================================================
CM$VER      3.01.00     12/03/2004
--------------------------------------------------------------------------------
- Penhora:
  * Quando, em um processo, ocorrer a penhora de um bem (i)mobiliário qualquer, este
    evento será registrado como uma etapa do processo. Para tanto, deverá ser cadastrado
    um tipo de etapa a ser identificado para o sistema como sendo de Penhora
    (Cadastros / Tipos de Etapa).
  * Dependendo do tipo de bem penhorado (a ser identificado no registro da etapa),
    o sistema fará o tratamento adequado, incluindo a integração com outros módulos.
    No caso de imóveis penhorados como garantia, o Sistema Jurídico muda o status do
    imóvel para "Penhorado" e lança um registro de evento.
  * As penhoras podem ainda ser realizadas com títulos, ficando este fato registrado
    no Sistema Jurídico.
  * As penhoras podem também ser realizadas com Ativo Permanente e isto faz com que
    o Bem fique bloqueado para venda no módulo CAF.
    As penhoras em dinheiro podem gerar AP's, possibilitando o pagamento a terceiros.
- Sub-Tipo para Advogados e Assistentes:
  * Ao se cadastrar Advogados e Assitentes, o sistema passou a colocá-los em um
    sub-tipo específico, ao invés de inserí-los como Forncedores, como fazia antes.
    Com isto, apenas este tipo de pessoas (físicas ou jurídicas) será exibido para
    seleção ao se cadastrar um processo.
    Como primeiro passo, deve-se inserir na nova categoria todos os advogados e
    assistentes que, hoje, estejam vinculados aos processos (foi criado um script).
- Honorários Fixos:
  * São definidos como contratos com os escritórios de advocacia, que estabelecem
    pagamento de honorários mensais segundo uma tabela que fixa o valor a ser pago
    em função da quantidade de processos ativos de cada escritório.
  * O primeiro passo é alimentar a tabela dos honorários, contendo: identificação
    da faixa (gerada pelo sistema), o limite de quantidade da faixa, o valor do
    honorário e a data de vigência. A tabela se encontra em Cadastros / Honorários
    Advocatícios.
  * O segundo passo é alimentar, no Cadastro de Advogados, o campo que vai indicar
    o fator de aplicação da tabela de honorários para cada escritório ou advogado,
    indicando o uso dos valores da tabela. Por exemplo: fator 1,00, sem alteração;
    fator 1,25 vai siginificar 25% a mais; fator 0,90 implicará em 10% a menos e
    fator zero será sem honorário fixo. O fator está em Cadastros / Advogados / 
    Honorário Fixo.
  * O terceiro passo (operacional) se encontra em Consultas / Relatórios /
    Sistema Jur.../ Operacionais / Recibo de Pagamento de  Honorários Fixos,
    que pode ser usado para emissão de recibos e/ou geração de AP's.
- Registro de Honorários do Processo:
  * Esta função foi incorporada como nova aba na tela do Processo, porém sem a
    função de gerar integração contábil e/ou financeira, devido à complexidade
    operacional que esta situação pode gerar para o usuário (o mesmo se aplica
    à aba Etapas, já existente no Processo).
  * Desta forma, em ambos os casos (Honorários e Etapas), as abas na tela do
    Processo servem para consulta e alimentação de informações (inclusão,
    alteração ou exclusão) em que não haja a necessidade de gear esse tipo de
    integração. Quando este for o caso, o usuário deverá utilizar as telas
    específicas para o registro de Honorários e Etapas.
  * Este alerta é dado, em destaque, na tela do Processo.
- Rateio de Despesas Judiciais e Administrativas:
  * O sistema permite o rateio de uma despesa ou reembolso em diversos processos.
  * Esse rateio obedece a um critério de seleção de processos, com base na tela
    seletiva já  existente (como por exemplo os de uma determinada UF, exceto uma
    cidade específica). Os processos selecionados são exibidos, para que o usuário
    marque a quais se aplicará o rateio (um, alguns ou todos).
  * Deverá ser informado um valor para esse rateio, que será dividido em partes
    iguais pelo número de processos resultantes da seleção e marcação.
  * Esse rateio pode gerar uma AP, para o favorecido a ser indicado.
  * Encontra-se em: Transações / Rateio de Despesas Judiciais.
- Sucumbência:
  * A tela Transações / Honorários foi alterada para poder dar suporte a esta
    funcionalidade, que implica em pagamento (de parte) dos honorários do
    advogado da contraparte, inclusive com a possibilidade de gerar AP a esse
    favorecido. No registro do honorário, consta agora uma caixa com o título
    de "Sucumbência" que, se marcada, permite esta alternativa.
  * Para que a funcionalidade seja viável, o  advogado da contraparte tem que estar
    cadastrado no sistema e, além disso, vinculado no processo como tal.
================================================================================
CM$VER      3.00.00     12/03/2004
--------------------------------------------------------------------------------
- Fusão dos Módulos:
  * Este novo sistema é o resultado da fusão dos três módulos hoje existentes:
    Contencioso Trabalhista, Contenciososo Previdenciário e Processos Judiciais.
- Verificação do Número do Processo:
  * Ao inserir um novo processo e após identificar seu número, o sistema dá um alerta
    caso já exista outro processo com esse mesmo número.
- Identificação da Instância:
  * Para permitir melhor caracterização e visualização das instâncias atingidas pelo
    processo, foi criada uma aba específica (Outros Dados / Instâncias) concentrando
    os números do processo em cada instância e os respectivos órgãos jurisdicionais.
- Ficha do Processo:
  * Este relatório foi transferido para o item de menu Consultas / Relatórios e passou
    a ter os mesmos recursos de visualização, salva e impressão comuns aos relatórios
    desta categoria.
================================================================================
CM$ALT}






















































































































































































































































































