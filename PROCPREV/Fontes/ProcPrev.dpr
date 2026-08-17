program ProcPrev;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadTipObjeto in '..\..\Shared\ModComp\FontesMT\fCadTipObjeto.pas' {frmCadTipObjeto},
  fCadTipSent in '..\..\Shared\ModComp\FontesMT\fCadTipSent.pas' {frmCadTipSent},
  fCadTipRec in '..\..\Shared\ModComp\FontesMT\fCadTipRec.pas' {frmCadTipRec},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadAdvog in '..\..\Shared\ModComp\FontesMT\fCadAdvog.pas' {frmCadAdvog},
  fCadGrpObjeto in '..\..\Shared\ModComp\FontesMT\fCadGrpObjeto.pas' {frmCadGrpObjeto},
  fCadTipAcao in '..\..\Shared\ModComp\FontesMT\fCadTipAcao.pas' {frmCadTipAcao},
  fCadTipProc in '..\..\Shared\ModComp\FontesMT\fCadTipProc.pas' {frmCadTipProc},
  fCadVara in '..\..\Shared\ModComp\FontesMT\fCadVara.pas' {frmCadVara},
  fCadMotivoJur in '..\..\Shared\ModComp\FontesMT\fCadMotivoJur.pas' {frmCadMotivoJur},
  fUsuXProcJur in '..\..\Shared\ModComp\FontesMT\fUsuXProcJur.pas' {frmUsuXProcJur},
  fAdvogXProcJur in '..\..\Shared\ModComp\FontesMT\fAdvogXProcJur.pas' {frmAdvogXProcJur},
  fAcertaCusto in '..\..\Shared\ModComp\FontesMT\fAcertaCusto.pas' {frmAcertaCusto},
  fCadParam in '..\..\Shared\ModComp\FontesMT\fCadParam.pas' {frmCadParam},
  RVara in '..\..\Shared\ModComp\Reports\Source\RVara.pas' {RptVara},
  RMotivoJur in '..\..\Shared\ModComp\Reports\Source\RMotivoJur.pas' {RptMotivoJur},
  RTipAcao in '..\..\Shared\ModComp\Reports\Source\RTipAcao.pas' {RptTipAcao},
  RTipObjeto in '..\..\Shared\ModComp\Reports\Source\RTipObjeto.pas' {RptTipObjeto},
  RTipProc in '..\..\Shared\ModComp\Reports\Source\RTipProc.pas' {RptTipProc},
  RTipRec in '..\..\Shared\ModComp\Reports\Source\RTipRec.pas' {RptTipRec},
  RTipSent in '..\..\Shared\ModComp\Reports\Source\RTipSent.pas' {RptTipSent},
  RGrupoObjeto in '..\..\Shared\ModComp\Reports\Source\RGrupoObjeto.pas' {RptGrupoObjeto},
  uCmCtrlRptProcPrev in '..\CtrlObjetos\uCmCtrlRptProcPrev.pas',
  fCadContJurid in '..\..\Shared\ModComp\FontesMT\fCadContJurid.pas' {frmCadContJurid},
  fCadEmprAdq in '..\..\Shared\ModComp\FontesMT\fCadEmprAdq.pas' {frmCadEmprAdq},
  fValorRealMT in '..\..\Shared\ModComp\FontesMT\fValorRealMT.pas' {frmValorRealMT},
  fParcelaAcordoMT in '..\..\Shared\ModComp\FontesMT\fParcelaAcordoMT.pas' {frmParcelaAcordoMT},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  //Renan Cristiano Sol Nº 141647 Kintana 905096
//  fLancDocCapCar in '..\..\Shared\ModComp\FontesMT\fLancDocCapCar.pas' {frmLancDocCAPCAR},
  uModulo in '..\CtrlObjetos\uModulo.pas',
  fSelEstObj in '..\FontesMT\fSelEstObj.pas' {frmSelEstObj},
  fSelProcessoMT in '..\FontesMT\fSelProcessoMT.pas' {frmSelProcessoMT},
  fCustomSelProcesso in '..\..\Shared\ModComp\FontesMT\fCustomSelProcesso.pas' {frmCustomSelProcesso},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  frFollowUp in '..\..\Shared\ModComp\FontesMT\frFollowUp.pas' {frameFollowUp: TFrame},
  fSelFolUp in '..\FontesMT\fSelFolUp.pas' {frmSelFolUp},
  fConsultaProcesso in '..\..\Shared\ModComp\FontesMT\fConsultaProcesso.pas' {frmConsultaProcesso},
  fSelConProc in '..\FontesMT\fSelConProc.pas' {frmSelConProc},
  frGraficoProcesso in '..\..\Shared\ModComp\FontesMT\frGraficoProcesso.pas' {frameGraficoProcesso: TFrame},
  fSelEstProc in '..\FontesMT\fSelEstProc.pas' {frmSelEstProc},
  fAgenda in '..\..\Shared\ModComp\FontesMT\fAgenda.pas' {frmAgenda},
  fParamProcPrev in '..\Reports\Source\fParamProcPrev.pas' {frmParamProcPrev},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RProcPrev in '..\Reports\Source\RProcPrev.pas' {RptProcPrev},
  fCustomCadRegHon in '..\..\Shared\ModComp\FontesMT\fCustomCadRegHon.pas' {frmCustomCadRegHon},
  fCadRegHon in '..\FontesMT\fCadRegHon.pas' {frmCadRegHon},
  fCustomCadRegEtp in '..\..\Shared\ModComp\FontesMT\fCustomCadRegEtp.pas' {frmCustomCadRegEtp},
  fCadRegEtp in '..\FontesMT\fCadRegEtp.pas' {frmCadRegEtp},
  fParamAnalSintProc in '..\Reports\Source\fParamAnalSintProc.pas' {frmParamAnalSintProc},
  RAnalSintProc in '..\..\Shared\ModComp\Reports\Source\RAnalSintProc.pas' {RptAnalSintProc},
  fCustomCadProcesso in '..\..\Shared\ModComp\FontesMT\fCustomCadProcesso.pas' {frmCustomCadProcesso},
  fCustomParamFichaProc in '..\..\Shared\ModComp\Reports\Source\fCustomParamFichaProc.pas' {frmCustomParamFichaProc},
  fCadProcesso in '..\FontesMT\fCadProcesso.pas' {frmCadProcesso},
  RFichaProc_ProcPrev in '..\Reports\Source\RFichaProc_ProcPrev.pas' {RptFichaProc_ProcPrev},
  fParamFichaProc_ProcPrev in '..\Reports\Source\fParamFichaProc_ProcPrev.pas' {frmParamFichaProc_ProcPrev},
  fCadRegPenhora in '..\..\Shared\ModComp\FontesMT\fCadRegPenhora.pas' {frmCadRegPenhora},
  fCadRegContaBanc in '..\..\Shared\ModComp\FontesMT\fCadRegContaBanc.pas' {frmCadRegContaBanc},
  fCadRegMulta in '..\..\Shared\ModComp\FontesMT\fCadRegMulta.pas' {frmCadRegMulta},
  fCadRegCondenacao in '..\..\Shared\ModComp\FontesMT\fCadRegCondenacao.pas' {frmCadRegCondenacao},
  mImovelDB in '..\..\Shared\ModComp\FontesMT\mImovelDB.pas' {molImovelDB: TFrame},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fCadDesdobramento in '..\..\Shared\ModComp\FontesMT\fCadDesdobramento.pas' {frmCadDesdobramento},
  fCadHonorarioSucumbenciais in '..\..\SistJurCons\Fontes\fCadHonorarioSucumbenciais.pas' {frmCadHonorarioSucumbenciais},
  fCadCondenacoes in '..\..\SistJurCons\Fontes\fCadCondenacoes.pas' {frmCadCondenacoes},
  uModulo2 in '..\..\SHARED\ModComp\CtrlObjetos\uModulo2.pas';

{$R *.RES}
{$R PROCPREV_RES.RES}

Begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Contencioso Previdenciário';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmCadRegContaBanc, frmCadRegContaBanc);
  Application.CreateForm(TfrmCadRegMulta, frmCadRegMulta);
  Application.CreateForm(TfrmCadRegCondenacao, frmCadRegCondenacao);
  Application.CreateForm(TfrmCadDesdobramento, frmCadDesdobramento);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Contencioso Previdenciário
================================================================================
CM$VER      3.21.05     08/04/2008
--------------------------------------------------------------------------------
(Pendência 27722)
- Consultas / Relatórios / ... / Operacionais / Relação de Processos:
  * Acerto nas totalizações do relatório, que apresentavam diferenças quando
    a opção "Seleciona Contraparte" era marcada.
================================================================================
CM$VER      3.21.04     07/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.21.03     05/03/2008
--------------------------------------------------------------------------------
(Pendência 27518)
- Transações / Etapas do Processo:
  * Correção do erro que o sistema estava apresentando na abertura da tela.
================================================================================
CM$VER      3.21.02     21/02/2008
--------------------------------------------------------------------------------
(Pendência 27401)
- Sistema / Util. / Alteração de Escritórios/Advogados:
  * Inclusão da opção para filtrar os processos por UF e Cidade.
================================================================================
CM$VER      3.21.01     08/01/2008
--------------------------------------------------------------------------------
(Pendência 27178)
- Telas Diversas:
  * Em algumas caixas de seleção, havia uma limtação na quantidade de caracteres que o
    usuário podia digitar. Esse problema foi corrigido.
  * Na caixa de seleção de Cidades, quando era solicitada a "Seleção Negativa" com apenas
    uma cidade selecionada, o retorno vinha como se essa opção não estivesse marcada. Isto foi corrigido.
================================================================================
CM$VER      3.21.00     2/01/2008
--------------------------------------------------------------------------------
(Pendência 22100)
- Transações / Etapas do Processo:
  * Aba Contab. e CAP - inclusão dos campos Data Lançamento e Forma de Pagamento.
  * Aba CAR - inclusão dos campos Data Lançamento e Forma de Recebimento.
  * Inclusão da aba CAP/CAR, com Centro de responsabilidade, Centro de Custo e Programa.
  * Inclusão de alerta para o caso da penhora e/ou depósito for superior ao valor estimado
    atual (processo aberto) ou valor real da sentença (processo encerrado).
================================================================================
CM$VER      3.20.04     19/11/2007
--------------------------------------------------------------------------------
(Pendência 26887)
- Consultas / Relatórios / ... / Operacionais / Relação de Processos:
  * Alteração para aparecer a coluna Nome da Contraparte, mesmo quando é marcada a
     opção para Selecionar Contraparte e esta não é um participante.
================================================================================
CM$VER      3.20.03     08/11/2007
--------------------------------------------------------------------------------
(Pendência 26077)
- Transações / Processo Previdenciário
  * Correção do erro ("constraint" R_11253) que ocorria na exclusão de um processo
    que tivesse algum dado em seu histórico (tabela HSTPROCTRAB).
================================================================================
CM$VER      3.20.02     08/08/2007
--------------------------------------------------------------------------------
(Pendência 26059) 
- Sistema / Utilitários / Verificação e Acerto do Custo dos Processos:
  * Correção do erro "ERangeError - Range check error", que ocorria no início do processo.
================================================================================
CM$VER      3.20.01     11/06/2007
--------------------------------------------------------------------------------
(Pendência nº.25537)
- Transações / Processo / Aba Encerramento:
  * O sistema não mais permite a edição de dados na subtela "Parcelas de Acordo de
    Um Processo", sem que a tela "Cadastro de Processos" esteja no modo de alterar ou inserir.
================================================================================
CM$VER      3.20.00     11/04/2007
--------------------------------------------------------------------------------
- Cadastros / Tipos de Processo
  * Foi acresentado o campo "Haverá Contabilização por Centro de Custo ?"
- Cadastros / Parametrização Contábil:
  * Foram acresentados os campos: Tipos de Processo, Usa Plano/Patro Padrão,
    Centro de Custo e Tipo de Operação.
( Pendência 25034)
- Transações / Processo Previdenciário:
  * Correção na abertura da tela.
  * Foi acresentada a aba "Hist. de Alterações", que exibe o histórico de alteraçoes
    efetuadas em um destes campos: Tipo de Processo e/ou Vara de Justiça e/ou Somos Parte.
  * Foram acrescentados os campos: Centro de Custo da Contraparte e Centro de custo 
     dos Litisconsortes, ambos disponíveis apenas em processos do tipo que exige centro de custo.   
================================================================================
CM$VER      3.19.06     14/03/2007
--------------------------------------------------------------------------------
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
- Transações / Processo Prev. e Transações / Etapas do Processo  (Subtela Penhora):
  * A busca de um Bem do Ativo Permanente foi substituída de caixa de seleção ("combo box")
    para uma matriz de múltiplas seleções ("Monta Select"), nesta constando: número de
    patrimônio, descrição do bem, classe do bem e descrição do conjunto.
- Transações / Processo Prev. e Transações / Etapas do Processo  (Subtela Penhora):
  * A busca de um Imóvel foi substituída de caixa de seleção ("combo box")
    para uma matriz de múltiplas seleções ("Monta Select"), nesta constando: Imóvel Mestre,
    Nome do Imóvel, Status, Código, Tipo do Imóvel, Marca / Franquia, Nome Endereço,
    Logradouro, Bairro, Cidade, UF.
================================================================================
CM$VER      3.19.03     08/02/2007
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo  (Subtela Penhora):
  * Agora são exibidas apenas duas casas decimais no campo "Valor desta penhora", 
    quando a opção “Valor” for selecionada no campo “Classificação do Valor ao Lado”.
- Transações / Processo Prev. e Transações / Etapas do Processo (aba Etapas):
  * Inclusão das seguintes informações: Valor da Etapa, custas, a etapa vinculada, 
    tipo de penhora (Imóvel, Ativo Permanente, Investimento ou Numerário) e qual o bem
    penhorado.
================================================================================
CM$VER      3.19.02     07/12/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev.  e Transações / Etapas do Processo  (Subtela Multa):
  * Correção da integração contábil e financeira.
- Transações / Processo Prev. 
  * Correção na rotina de cálculo dos juros, para considerar a data de encerramento como
    base dos juros para os processos encerrados.
================================================================================
CM$VER      3.19.01     07/11/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. / aba Honorários e Transações / Honorários do Processo:
  * Inclusão do campo que permite a opção entre Pagamento e Provisão do honorário.
- Transações / Honorários do Processo:
  * Revisão e acerto da rotina de integração contábil e financeira do pagamento (ou
    provisão) do honorário.
 
 
================================================================================
CM$VER      3.18.03     06/11/2006
--------------------------------------------------------------------------------
- Transações / Etapas do Processo:
  * Alteração da opção para gerar lançamentos contábeis dos eventos de penhora
    de investimentos, no que diz respeito a considerar Plano e Patrocinadora
    associados ao título.
================================================================================
CM$VER      3.18.02     01/11/2006
--------------------------------------------------------------------------------
- Transações / Etapas do Processo:
  * Implementação da opção para gerar lançamentos contábeis dos eventos de penhora
    de investimentos.
(Pendência 23619):
- Consultas / Relatórios / ... / Operacionais / Relação de Processos:
  * O contador de processos não mais informa quantidade igual a 1, quando nenhum
    processo é listado.
================================================================================
CM$VER      3.18.01     16/10/2006
--------------------------------------------------------------------------------
(Ref. Pendência 20529)
- Transações / Etapas do Processo:
  * Ao criar uma etapa que coloca um processo aberto em fase de execução, o sistema
    alerta o usuário para, caso deseje usar a opção de alterar a estimativa atual
    para 100% e gerar o respectivo evento contábil, ele deve utilizar a tela
    Transações / Processo. Se, porém, não for fazer esse procedimento ou se quiser 
    apenas o ajuste da estimativa, sem a contabilização, pode fazer nesta tela.
================================================================================
CM$VER      3.18.00     05/10/2006
--------------------------------------------------------------------------------
- Cadastros / Tipos de Etapa (Andamento)
  * Inclusão de campo para indicar se esse tipo de etapa coloca o processo
    em fase de execução.
- Transações / Processo Previdenciário:
  * Ao criar uma etapa que coloca um processo aberto em fase de execução, o sistema
    oferece ao usuário a opção de alterar a estimativa atual para 100%, gerando o 
    respectivo evento contábil.
- Transações / Etapas do Processo:
  * Ao criar uma etapa que coloca um processo aberto em fase de execução, o sistema
    alerta o usuário para, caso deseje usar a opção de alterar a estimativa atual
    para 100% e gerar o respectivo evento contábil, ele deve utilizar a tela acima.
- Transações / Processo Previdenciário e Transações / Etapas do Processo:
  * Acertos nas rotinas de penhora e respectiva desconstituição de bens e imóveis,
    no tocante à marcação dos mesmos como penhorados ou liberados.
- Sistema / Configuração / Parâmetros do Sistema:
  * Foi retirada da tela a opção para integração contábil em "Lote ou Pontual", uma vez
    que ela já havia sido desativada do sistema (ambas as opções são agora possíveis,
    dependendo de escolha das respectivas funções pelo usuário).
================================================================================
CM$VER      3.17.06     19/09/2006
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário e Transações / Etapas do Processo:
  * Ao chamar a Subtela Penhora, o sistema agora verifica se a data da etapa já foi
    informada pelo usuário, obrigando o seu preenchimento.
================================================================================
CM$VER      3.17.05     15/08/2006
--------------------------------------------------------------------------------
(Pendência 23077)
- Transações / Processo Previdenciário:
  * Correção da rotina de exclusão de um processo, que exibia um erro e impedia a ação.
================================================================================
CM$VER      3.17.04     15/09/2006
--------------------------------------------------------------------------------
(Pendência 23077)
- Transações / Processo Previdenciário:
  * Correção da rotina de exclusão de um processo, que exibia um erro e impedia a ação.
================================================================================
CM$VER      3.17.03     09/08/2006
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Pequena alteração no desenho da tela, de forma a não ficar exposta uma minúscula
     parte do botão que aciona Contas Bancárias, o que possibilitava ao usuário incauto
    abrir essa tela, embora com esforço muito especial e intencional, quando a etapa não
    se encontrava em edição.
================================================================================
CM$VER      3.17.02     21/07/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo (Subtela Multa):
* Ao usuário alterar a data de pagamento (antes do pagamento efetuado), o sistema agora
recalcula o valor a pagar.
- Transações / Processo Prev. (Subtela Multa):
* O sistema agora inibe o pagamento de multa para um processo que esteja sendo inserido.
================================================================================
CM$VER      3.17.01     13/07/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo:
  * Alterações referentes aos campos Plano e Patrocinadora nas rotinas de integração.
================================================================================
CM$VER      3.17.00     16/06/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo  (Subtela Multa):
  * Inclusão das informações relativas ao pagamento da multa e sua integração contábil
    e financeira.
================================================================================
CM$VER      3.16.05     07/06/2006
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Correção na opção de gerar uma autorização de pagamento (AP), quando o
    valor da condenação for superior a soma dos valores de depósito recursal, judicial
    e penhora, ou uma guia de recebimento (GR) se for inferior.
    Permite, ainda, que o usuário possa gerar o evento contábil do valor real.
================================================================================
CM$VER      3.16.04     05/06/2006
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * O sistema oferece ao usuário opção gerar uma autorização de pagamento (AP), quando o
    valor da condenação for superior a soma dos valores de depósito recursal, judicial
    e penhora, ou uma guia de recebimento (GR) se for inferior.
    Permite, ainda, que o usuário possa gerar o evento contábil do valor real.
================================================================================
CM$VER      3.16.03     01/06/2006
--------------------------------------------------------------------------------
- Transações / Etapas do Processo:
  * Correção ref. ao alerta quando existir diferença entre os valores dos depósitos mais
    penhoras em numerário e o valor levantado ou convolado, para registro dessa diferença e,
    opcionalmente, geração de integração financeira (Contas a Receber) e/ou contábil.
- Transações / Processo e Transações / Etapas do Processo (Subtela Penhora):
  * Foi corrigida a exibição do número de patrimônio sem que se tenha escolhido um bem.
================================================================================
CM$VER      3.16.02     18/05/2006
--------------------------------------------------------------------------------
- Transações / Etapas do Processo:
  * O sistema emite um alerta quando existir diferença entre os valores dos depósitos mais
    penhoras em numerário e o valor levantado ou convolado, para registro dessa diferença e,
    opcionalmente, geração de integração financeira (Contas a Receber) e/ou contábil.
  * O sistema emite um alerta quando existir variação dos valores dos depósitos mais
    penhoras em numerário, para registro dessa diferença e, opcionalmente, geração de
    integração financeira (Contas a Pagar) e/ou contábil.
- Transações / Processo e Transações / Etapas do Processo (Subtela Penhora):
  * A tela exibia o número de patrimônio sem que se tivesse escolhido um bem. Isto foi
    corrigido.
================================================================================
CM$VER      3.16.01     28/04/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. / aba Honorários e Transações / Honorários do Processo:
  * A opção de sucumbência deixa novamente de ficar restrita a processos encerrados.
================================================================================
CM$VER      3.16.00     20/04/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev./ aba Honorários e Transações / Honorários do Processo:
  * Tratamento adicional nos casos de Honorários de Sucumbência: 1) opção para valor,
    como já era, ou % sobre o valor da condenação; 2) a opção de sucumbência fica
    agora restrita a processos encerrados.
- Transações / Processo Prev./ aba Etapas e Transações / Etapas do Processo:
  * Ao acessar o botão e tela auxiliar para registrar/consultar conta bancária, foi
    acrescentada a opção para conta de terceiros.
================================================================================
CM$VER      3.15.01     17/04/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev.:
  * Correção na busca do processo.
================================================================================
CM$VER      3.15.00     13/04/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo (Subtela Penhora):
  * Inclusão de campo para registro da avaliação realizada pelo oficial de justiça.
- Transações / Processo Prev. e Transações / Etapas do Processo:
  * Inclusão de botão e tela auxiliar para registrar/consultar a multa associada à etapa.
- Transações / Processo Prev./ aba Encerramento:
  * Inclusão de campo para registro do tipo de condenação: se solidária com um ou mais dos
    "nossos litisconsortes", se subsidiária em relação aos mesmos, ou nenhum destes casos.
    No caso de "solidária", é habilitado o botão que permite registrar/visualizar o valor
    de condenação correspondente a cada uma das partes numa tela auxiliar.
================================================================================
CM$VER      3.14.00     06/04/2006
--------------------------------------------------------------------------------
(Pendência 21991)
- Transações / Processo Prev.,  Transações / Etapas do Processo e Transações / Honorários:
  * Na tela de busca do processo, foi incluído o campo Situação (0 para aberto, 1 para
    encerrado).
- Transações / Processo Prev. e Transações / Etapas do Processo:
  * Inclusão de botão e tela auxiliar para registrar/consultar a conta bancária (da
    empresa proprietária) que está associada a esta etapa. A associação fica a critério do
    usuário, podendo significar de onde sai o valor de um depósito, para onde retorna o
    levantamento de um depósito, de onde sai uma penhora em numerário, etc.
- Transações / Processo:
  * Foi retirada a "dica" associada ao botão "Ver Histórico do Objeto Selecionado".
================================================================================
CM$VER      3.13.00     28/03/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo:
  * Inclusão das opções "Levantamento" e "Convolação" e exclusão da opção "Despesa" para o
    valor informado na etapa.
- Transações / Processo Prev. e Transações / Etapas do Processo:
  * Inclusão do campo "Custas Judiciais" em substituição à ooção "Despesa" antes existente.
  Obs.: estas duas implementações acima têm também reflexo no relatório "Relação de 
        Processos".
================================================================================
CM$VER      3.12.02     15/03/2006
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Implementação da verificação do Litisconsorte ao inserí-lo no processo. O sistema
    exibe outros processos em que o mesmo esteja envolvido.
================================================================================
CM$VER      3.12.01     24/02/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo / Subtela Penhora:
  *  No campo descrição do imóvel são agora mostrados os seguintes dados do imóvel:
     Nome do Imóvel + Código do Imóvel + Nome do Imóvel Mestre + Cidade do Imóvel
     + Estado (UF) do Imóvel.  Esses dados também ficam na tela, após a seleção do imóvel.
- Transações / Processo /Aba Outro Dados / Sub Aba Tipo e Localização:
* O Sistema não mais permite que a Cidade Onde Corre o Processo seja  informada
   textualmente (sem a busca pelo botão localizar cidade).
================================================================================
CM$VER      3.12.00     13/02/2006
--------------------------------------------------------------------------------
- Transações / Processos Previdenciários:
  * Foram incluídos campos para registrar a data da alteração da
    situação da contraparte e dos litisconsortes.
    O sistema registra essa data quando ocorre a alteração da situação
    de "NORMAL" para outra qualquer.
  * Na alteração da situação da contraparte de "NORMAL" para outra qualquer, quando
    o sistema pergunta se o usuário quer colocar uma das litisconsortes no lugar da contra-
    parte, ele agora muda a situação da "nova contraparte" para normal.
================================================================================
CM$VER      3.11.08     10/02/2006
--------------------------------------------------------------------------------
- Transações / Processo Prev. e Transações / Etapas do Processo / Subtela Penhora:
  * O texto "Bem do Ativo" foi alterado para "Ativo Permanente".
  * Ao escolher um conjunto, são listados apenas os bens pertencentes ao conjunto
    escolhido.
  * A tela lista apenas os bens do Ativo Fixo que não foram baixados.
  * A tela apresenta o número de patrimônio do bem.
================================================================================
CM$VER      3.11.07     27/01/2006
--------------------------------------------------------------------------------
(Pendência 21386)
- Transações / Processo Previdenciário / Outros Dados:
  * Foi alterada a denominação de Execução para Precatória.
- Consultas / Relatórios / ... / Operacionais / Relação de Processos:
  * Correção para aparecer a coluna Patrocinadora, quando é marcada a opção para
    Selecionar Contraparte.
================================================================================
CM$VER      3.11.06     11/11/2005
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário: (Pendência 20580)
  * Foi corrigido o erro que ocorria quando o usuário inseria e deletava um ou mais 
     objetos antes de dar o OK final.
================================================================================
CM$VER      3.11.05     10/10/2005
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Foi corrigida a rotina de mensagens na penhora.
- Transações / Etapas do Processo:
  * Foi corrigida a rotina de contabilização das etapas.
  * Foi corrigida a rotina de mensagens na penhora.
================================================================================
CM$VER      3.11.04     26/09/2005
--------------------------------------------------------------------------------
(Pendência 20304)
- Transações / Processo Previdenciário / aba Etapas / tela Informações sobre Penhora
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
CM$VER      3.11.03     23/09/2005
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário / aba Etapas / tela Informações sobre Penhora:
  * Correção da rotina de cálculo do Valor Contábil dos bens.
================================================================================
CM$VER      3.11.02     19/09/2005
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Na aba Litisconsortes, são agora exibidos Plano e Patrocinadora, se for o caso.
  * Na aba Litisconsortes, foi corrigida a inserção de novo registro.
- Transações / Etapas do Processo:
  * Foi incluída a opção de busca do processo "Procurar Incluindo Litisconsortes".
================================================================================
CM$VER      3.11.01     05/09/2005
--------------------------------------------------------------------------------
- Transações / Processo ... / aba Etapas:
  * Melhor visulização das etapas, ficando visível agora a barra de rolagem vertical.
================================================================================
CM$VER      3.11.00     01/12/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Foi introduzido o histórico dos objetos, que registra e exibe as alterações
    ocorridas (valores, percentuais, observação).
- Consultas/Relatórios/Operacionais/Análise Sintética de Processos:
  * Correção no erro ao tentar imprimir o relatório.
================================================================================
CM$VER      3.10.02     27/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Alteração do Valor permitido para os percentuais das Estimativas, de
    duas para quatro decimais.
================================================================================
CM$VER      3.10.01     15/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Correção do Valor permitido para os percentuais das Estimativas, quando
    estes superavam 999,99%.
================================================================================
CM$VER      3.10.00     14/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Ampliação do Valor permitido para o percentual da Estimativa Original;
  * Ampliação do Valor permitido para o percentual da Estimativa Atual; 
  * A informação relativa à Data da Avaliação do Valor da Estimativa Atual só
    será automaticamente alimentada com a data de hoje na inclusão do objeto.
================================================================================
CM$VER      3.09.00     06/09/2004
--------------------------------------------------------------------------------
- Transações / Processo / aba Objetos do Processo:
  * Inclusão da informação relativa ao Valor da Estimativa Original;
  * Inclusão da informação relativa à Data da Avaliação do Valor da Estimativa Atual;
  * Rearrumação das informações na tela, para melhor compreensão.
- Transações / Processo / aba Valores e Sua Atualização:
  * Inclusão das informações relativas à Taxa de Juros e respectiva Data.
================================================================================
CM$VER      3.08.00     20/08/2004
--------------------------------------------------------------------------------
- Aumento do tamanho do campo "ASSUNTO RESUMIDO" (de 40 para 120 posições)
  nas etapas dos processos, com consequente alteração nas seguintes telas
  e relatórios:
  * Transações / Processo / aba Etapas;
  * Transações / Etapas do Processo;
  * Consultas / Relatórios / ... / Cadastrais / Ficha do Processo;
  * Consultas / Relatórios / ... / Operacionais / Relação de Processos.
================================================================================
CM$VER      3.07.00     15/06/2004
--------------------------------------------------------------------------------
- Transações / Processo / Outros Dados / Advogados e Assistente:
  * Foi incluído na tela o Setor Responsável pelo processo.
================================================================================
CM$VER      3.06.04     09/06/2004
--------------------------------------------------------------------------------
- Transações / Processo / Outros Dados / Instâncias:
  * Foi reincluído na tela o campo Nº da Vara onde tramitam os processos.
================================================================================
CM$VER      3.06.03     30/04/2004
--------------------------------------------------------------------------------
- Transações / Processo e Etapas do Processo / Penhora:
  * Quando se escolher um imóvel a ser penhorado, o sistema valida o valor da
    penhora para não ultrapassar o valor de mercado menos o valor já penhorado.
  * Quando se escolher um bem do ativo fixo a ser penhorado, são mostrados na tela
    o valor contábil mais recente, sua data e o valor já penhorado.
  * Quando se escolher um bem do ativo fixo a ser penhorado, o sistema valida o
    valor da penhora para não ultrapassar o valor contábil menos o valor já penhorado.
  * Ao inserir uma Etapa, o botão de penhora não vem mais habilitado.
================================================================================
CM$VER      3.06.02     27/04/2004
--------------------------------------------------------------------------------
- Transações / Processo e Etapas do Processo / Penhora:
  * Quando se escolher um imóvel a ser penhorado, são mostradas na tela estas informações:
    Valor do imóvel, a data de avaliação e  valor já penhorado.
  * Quando se escolher um bem do ativo fixo a ser penhorado, é mostrado na tela o valor já
    penhorado.
- Transações / Processo / Substituição da Contraparte:
  * O sistema não deixa escolher na lista um Litisconsorte com situação diferente de Normal.
================================================================================
CM$VER      3.06.01     26/04/2004
--------------------------------------------------------------------------------
- Cadastros / Órgãos Jurisdicionais (Varas):
  * Acrescentada a UF na tela de busca.
- Consultas / Relatórios / ... / Cadastrais / Órgãos Jur. (Varas):
  * Acrescentada a UF.
- Transações / Processo Previdenciário:
  * Implementação da verificação da Contraparte ao inserir um processo. O sistema
  exibe outros processos em que a mesma esteja envolvida.
================================================================================
CM$VER      3.06.00     12/03/2004
--------------------------------------------------------------------------------
- Identificação da Instância:
  * Para permitir melhor caracterização e visualização das instâncias atingidas pelo
    processo, foi criada uma aba específica (Outros Dados / Instâncias) concentrando
    os números do processo em cada instância e os respectivos órgãos jurisdicionais.
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
- Sucumbência:
  * A tela Transações / Honorários foi alterada para poder dar suporte a esta
    funcionalidade, que implica em pagamento (de parte) dos honorários do
    advogado da contraparte, inclusive com a possibilidade de gerar AP a esse
    favorecido. No registro do honorário, consta agora uma caixa com o título
    de "Sucumbência" que, se marcada, permite esta alternativa.
  * Para que a funcionalidade seja viável, o  advogado da contraparte tem que estar
    cadastrado no sistema e, além disso, vinculado no processo como tal.
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
CM$VER      3.05.02     11/02/2004
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Acerto na procura de um processo quando era indicado o Número do Processo.
================================================================================
CM$VER      3.05.01     23/01/2004
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Reformulação da tela.
================================================================================
CM$VER      3.05.00     04/12/2003
--------------------------------------------------------------------------------
- Transações / Processo Previdenciário:
  * Inclusão das informações referentes a: Número do Processo em Execução,
     Órgão Jurisdicional na 2ª Instância e Órgão Jurisdicional na Instância Superior;
  * Reorganização das informações referentes a instâncias em uma nova subguia, 
     dentro da guia Outros Dados;
  * Inclusão de um botão, no alto da tela, para chamar a impressão da Ficha do Processo.
- Consultas e Relatórios diversos:
  * Na tela seletiva, na guia Instâncias, foi incluída a opção para filtrar processos que
     estejam em "execução", o que fica caracterizado, para o sistema, pelo preenchimento
     do campo Número do Processo em Execução acima referido.
================================================================================
CM$VER      3.04.06     29/10/2003
--------------------------------------------------------------------------------
- Relação de Processos:
  * Acerto no erro que era visto ao tentar imprimir um ou mais processos que não
  possuem a Data de Citação.
================================================================================
CM$VER      3.04.05     21/10/2003
--------------------------------------------------------------------------------
- Telas de Etapas do Processo e Honorários do Processo:
  * Alteração no Layout destas.
================================================================================
CM$VER      3.04.04     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.04.03     18/07/2003
--------------------------------------------------------------------------------
- Consulta Geral de Processos
  * Correção (não estava exibindo o resultado da consulta)
- Contraparte: acerto da escrita (estava Contra Parte)
================================================================================
CM$VER      3.04.02     10/07/2003
--------------------------------------------------------------------------------
- Manutenção de Documentos (AP/GR)
  * Correção na função de alteração, que estava indevidamente exigindo uma Conta 
     Contábil quando esta não existe.
================================================================================
CM$VER      3.04.01     30/06/2003
--------------------------------------------------------------------------------
- Consulta Geral de Processos, FollowUp das Etapas dos Processos,
  Consulta Processo de Qualquer Matéria, Estatística de Reclamações,
  Estatística de Processos:
  * Mudança no Layout das Telas.
================================================================================
CM$VER      3.04.00     02/06/2003
--------------------------------------------------------------------------------
- Transações / Processo:
  * Foi mudada a legenda do campo "Custo Histórico" para 
    "Custo Real Histórico" e do campo "Custo Atualizado" para
    "Custo Real Atualizado".
- Transações / Processo / Etapas:
  * Para indicar que um andamento poderá implicar em um valor a ser
    abatido do valor da causa, foi criado um novo campo no Registro 
    de Etapas, que conterá essa informação. Ela tem reflexo nos 
    cálculos de despesas do processo.
================================================================================
CM$VER      3.03.06     14/05/2003
--------------------------------------------------------------------------------
- Seleção de Processos (consulta e relatórios):
  * Foi introduzida a opção de seleção por cidades, incluindo cidades 
    desejadas e não desejadas.
  * Nas opções de filtro, ao escolher uma ou mais UFs específicas, 
    as cidades serão filtradas conforme tal seleção.
- Transações / Processo / Objetos Reclamados:
  * Foi acrescentado o % original de expectativa de ocorrência do valor
    reclamado. Com isto, o usuário pode obter: 
    1.valor da causa conforme reclamada pela contra-parte; 
    2.valor esperado na abertura do processo (agora introduzido);
    3.valor esperado ao longo do processo (que já existia).
- Transações / Processo / Encerramento:
  * Foi colocada como última aba.
- Transações / Processo / Etapas:
  * Foi eliminada a obrigatoriedade do campo "Assunto Resumido". Para 
    total efeito, é necessário que já tenha sido rodado o script que 
    tornou o campo ETAPAPROCTRAB->ASSUNTO não obrigatório.
  * Foi Mudada a legenda "Data e Hora Prevista ou Real" para "Data" 
    e "Hora".
  * A aba Obs.Etapa foi Incorporada na aba Etapas.
- Transações / Processo / Vinculações:
  * Foi Retirada a opção de incidência ou vinculação.
  * Foi alterada a legenda "Junta ou Vara" para "Orgão Jurisdicional".
================================================================================
CM$VER      3.03.05     30/04/2003
--------------------------------------------------------------------------------
- Critérios de Contabilização:
  * Na consulta, a matéria agora retorna a descrição.
- Cadastro de Advogados:
  * Pode-se informar que pertence a um determinado escritório.
- Cadastros de Tipos de Processo e Tipos de Ação:
  * Foi eliminada a entrada manual do código, passando a ser uma
  seqüência numérica.
- Transações / Processos:
  * A aba Listisconsortes permite a classificação de 4 categorias.
- A expressão "Vara de Justiça" foi mudada para
  "Órgão Jurisdicional (Vara)".
- A expressão "Motivo Exclusão de Pessoas" foi mudada para
  "Motivo Exclusão de Listisconsortes".
- A expressão "Requerentes/Requeridos" foi mudada para
  "Contra-Parte".
- A expressão "Advogado da Casa" foi mudada para
  "Advogado Interno".
================================================================================
CM$VER      3.03.04     17/04/2003
--------------------------------------------------------------------------------
- Manutenção de Documentos (AP):
  * Mudança no Layout da Tela.
================================================================================
CM$VER      3.03.03     21/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.16i
================================================================================
CM$VER      3.03.02     14/11/2002
--------------------------------------------------------------------------------
- Processo Previdenciário:
  * Implementação da limpeza da Lista de Objetos após uma inserção de um novo Processo.
- Inclusão do cadastro de Requerentes, Requeridos e Litisconsortes no menu de Cadastro.
================================================================================
CM$VER      3.03.01     07/11/2002
--------------------------------------------------------------------------------
- Mudança no Layout das Telas de Parâmetro dos Relatórios Cadastrais.
================================================================================
CM$VER      3.03.00     22/10/2002
--------------------------------------------------------------------------------
- A partir desta versão, este sistema necessitará de uma atualização no Banco de Dados
que se encontra no SCRIPT 200209047 para que a integração com o Contas a Pagar
funcione corretamente.
================================================================================
CM$VER      3.02.06     17/09/2002
--------------------------------------------------------------------------------
- Ficha do Processo:
  * Foi acrescentado o nome do Escritório / Advogado.
================================================================================
CM$VER      3.02.05     13/09/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.02.04     26/08/2002
--------------------------------------------------------------------------------
- Atualização do Help On-Line.
================================================================================
CM$VER      3.02.03     19/08/2002
--------------------------------------------------------------------------------
- Consultas / Relatórios / Operacionais / Relação de Processos:
  * Opção para imprimir o Número do Processo na Vara ou o Número Interno
================================================================================
CM$VER      3.02.02     24/07/2002
--------------------------------------------------------------------------------
- Estatística de Reclamações
  * Ampliadas as possibilidades de seleção por Tipo ou por Grupo de Objetos Reclamados.
  * Introduzida a opção de consolidar os objetos com menos de X% em valor.
================================================================================
CM$VER      3.02.01     15/07/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.02.00     04/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.01.08     07/05/2002
--------------------------------------------------------------------------------
- Implementação da Ajuda sensível ao contexto.
================================================================================
CM$VER      3.01.07     25/02/2002
--------------------------------------------------------------------------------
- Telas de Seleção de Processos:
  * Inclusão do filtro por Data de Inclusão do Processo.
================================================================================
CM$VER      3.01.06     04/02/2002
--------------------------------------------------------------------------------
- Processos Judiciais:
  * Foi eliminada a pergunta "Deseja Buscar Requerente por Nome, Incluindo Litisconsortes?"
  ao se procurar um processo e acrescentado um botão que possui a funcionalidade que antes
  era obtida quando o usuário respondia "Sim" e esta pergunta.
================================================================================
CM$VER      3.01.05     09/01/2002
--------------------------------------------------------------------------------
- A Relação de Processos se encontra agora em Consultas/Relatórios/Operacionais e não em Relatórios e Gráficos Fixos.
================================================================================
CM$VER      3.01.04     01/11/2001
--------------------------------------------------------------------------------
- Possibilidade de salvar a Relação de Processos em modo texto.
================================================================================
CM$VER      3.01.03     18/10/2001
--------------------------------------------------------------------------------
- Novas opções de seleção e exibição de dados nas consultas e relatórios.
================================================================================
CM$VER      3.01.02     27/09/2001
--------------------------------------------------------------------------------
- Consulta Geral de Processos:
  * Algumas colunas tiveram seus títulos alterados;
- Relatório Relação de Processos:
  * Opção para listar os Litisconsortes;
  * Implementado um Resumo por UF.
================================================================================
CM$VER      3.01.01     18/09/2001
--------------------------------------------------------------------------------
- Tela Transações / Processo Previdenciário: na lista de litisconsortes, foi acrescentada a situação dos mesmos.
- Tela Transações / Processo Previdenciário: foi ampliado o tamanho do campo para informar o objeto reclamado.
================================================================================
CM$VER      3.01.00     13/09/2001
--------------------------------------------------------------------------------
- Implementada a possibilidade de marcar um requerente/requerido ou um litiisconsorte como excluído do processo, com o respectivo motivo.
- Um requerente/requerido pode agora ser cadastrado no processo mesmo não estando ainda como participante ou seu beneficiário.
- Foi aumentado o campo DESCRIÇÃO do Cadastro de Tipos de Objeto Reclamado para 100 posições.
================================================================================
CM$VER      3.00.02     15/08/2001
--------------------------------------------------------------------------------
- Acrescentada uma opção para imprimir os honorários da Ficha do Processo;
- Adicionada a Tela de Manutenção de Documentos (AP) no menu Transações.
================================================================================
CM$VER      3.00.01     24/05/2001
--------------------------------------------------------------------------------
- Correção na tela de informação de valores no encerramento do Processo (mensagem "Class TRadioGroup not found").
================================================================================
CM$VER      3.00.00     09/04/2001
--------------------------------------------------------------------------------
- Versão Delphi 5.
================================================================================
CM$VER      2.01.11     12/03/2001
--------------------------------------------------------------------------------
- Cadastro de Processos: correção no cadastramento de Litisconsortes
================================================================================
CM$VER      2.01.10     22/02/2001
--------------------------------------------------------------------------------
- Integração com Contas a Pagar e/ou Contábil:  correção de erro que ocorria quando 
  um processo estava encerrado e o usuário alterava o valor real pela opção de rateio 
  de um valor total.
================================================================================
CM$VER      2.01.09     01/02/2001
--------------------------------------------------------------------------------
- Integração com Contas a Pagar e/ou Contábil:  correção de erro que ocorria quando 
  um processo era encerrado e as parametrizações não estavam preenchidas, pois o 
  sistema não dava o alerta para preenchê-las.
================================================================================
CM$VER      2.01.08     23/01/2001
--------------------------------------------------------------------------------
- Contabilização: será dada uma mensagem caso a planilha não possa ser gerada;
- Contas a Pagar: a conta bancária preferencial do favorecido é passada agora ao 
  documento (AP).
================================================================================
CM$VER      2.01.07     03/01/2001
--------------------------------------------------------------------------------
- Implementação das rotinas de Contabilização e Contas a Pagar para as transações de 
  Honorários e Etapas do Processo;
- Consultas / Consulta Geral de Processos : corrigida a visualização dos "Detalhes" do
  Processo selecionado
================================================================================
CM$VER      2.01.06     27/12/2000
--------------------------------------------------------------------------------
- Melhoria operacional das rotinas de Contabilização e Contas a Pagar implementadas, 
  na versão anterior, diretamente na tela do Processo Previdencário.
================================================================================
CM$VER      2.01.05     26/12/2000
--------------------------------------------------------------------------------
- Implementação das rotinas de Contabilização e Contas a Pagar diretamente na tela do 
  Processo Previdencário, sempre que seus valores se alterem e que as devidas 
  parametrizações indiquem a necessidade da integração.
================================================================================
CM$VER      2.01.04     04/12/2000
--------------------------------------------------------------------------------
- Opções adicionais para atualização monetária dos valores dos processos:
  1. Por índice monetário em cada processo (só existia um índice para todos)
  2. Por Regra de Cálculo
  3. Sem atualização
================================================================================
CM$VER      2.01.03     19/10/2000
--------------------------------------------------------------------------------
- Correção da inclusão de etapas na tela de cadastramento do Processo;
- Nova funcionalidade para transferir processos de um responsável para
  outro (disponível em  Sistema/Utilitários/Alteração de Responsável);
- Nova funcionalidade para transferir processos de um escritório/advogado para
  outro (disponível em  Sistema/Utilitários/Alteração de Escritório/...).
================================================================================
CM$VER      2.01.02     15/09/2000
--------------------------------------------------------------------------------
- Correção da emissão da Ficha do Processo.
================================================================================
CM$VER      2.01.01     04/09/2000
--------------------------------------------------------------------------------
- Implementação da Integração com a Contabilidade.
================================================================================
CM$VER      2.01.00     01/08/2000
--------------------------------------------------------------------------------
- Registro das etapas na tela do processo;
- Consulta a processos de qualquer matéria.
================================================================================
CM$VER      2.00.07     13/07/2000
--------------------------------------------------------------------------------
- Possibilidade de Cadastrar os Litisconsortes dos Processos.
================================================================================
CM$VER      2.00.06     09/06/2000
--------------------------------------------------------------------------------
- Acerto na tela de cadastro do Processo Previdenciário.
================================================================================
CM$VER      2.00.01     01/03/2000
--------------------------------------------------------------------------------
- Atualização com o Padrão CM.
================================================================================
CM$ALT}






































































































































































































































































































