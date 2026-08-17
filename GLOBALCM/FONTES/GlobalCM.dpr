{-------------------------------------------------------------------------------
------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------------
--------------------------------------------------------------------------------
 Nº SIG......: 127396
 Data........: 20/07/2022
 Responsável.: Everson Cunha
 Descrição...: FCadForm, uCtrlForm, uDbForm
               FCadOperacao, uCtrlOperacao, uDbOperacao
               FCadObjeto, uCtrlObjeto, uDbObjeto
               FCadFuncaoOperacao, uCtrlFuncaoOperacao, uDbFuncao
               FCadUsuarioLiberado, uCtrlUsuarioLiberado, uDbUsuarioLiberado
--------------------------------------------------------------------------------
Rotina......: FCadIntegraOrcFDO
Nº SIG......: 94320
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação de Tela de parametrizacao da Integração Orçamentária
--------------------------------------------------------------------------------}

program GlobalCM;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  UModulo in 'UModulo.pas',
  fLeArqReports in 'fLeArqReports.pas' {frmLeArqReports},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FPai in '..\..\Cm\Forms\Source\FPAI.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTELAAUT.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOKCANCELAR.pas' {frmOkCancelar},
  FCadastroCS in '..\..\Cm\Forms\Source\FCADASTROCS.pas' {frmCadastroCS},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  dGlobal in 'dGlobal.pas' {dtmGlobal: TDataModule},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FCadPaisMT in '..\FontesMT\FCadPaisMT.pas' {FrmCadPais},
  FCadMoedaMT in '..\FontesMT\FCadMoedaMT.pas' {frmCadMoeda},
  FCadEstadoMT in '..\FontesMT\FCadEstadoMT.pas' {frmCadUF},
  FCadCidadeMT in '..\FontesMT\FCadCidadeMT.pas' {FrmCadCidade},
  FCotacaoMoedaMT in '..\FontesMT\FCotacaoMoedaMT.pas' {frmCotacaoMoeda},
  FCadTipOperMT in '..\FontesMT\FCadTipOperMT.pas' {frmCadTipOper},
  FCadProgramaMT in '..\FontesMT\FCadProgramaMT.pas' {frmCadPrograma},
  FCadPlanPrevContabilMT in '..\FontesMT\FCadPlanPrevContabilMT.pas' {FrmCadPlanPrevContabil},
  FCadCReponMT in '..\FontesMT\FCadCReponMT.pas' {frmCadCRespon},
  FCadTipoClixHotelxCCMT in '..\FontesMT\FCadTipoClixHotelxCCMT.pas' {FrmCadTipoClixHotelxCC},
  FCadFeriadoMT in '..\FontesMT\FCadFeriadoMT.pas' {FrmCadFeriados},
  FCadAbcMT in '..\FontesMT\FCadAbcMT.pas' {frmCadABC},
  fParamGlobalMT in '..\FontesMT\fParamGlobalMT.pas' {frmParamGlobal},
  FConsultaLogAltExcMT in '..\FontesMT\FConsultaLogAltExcMT.pas' {FrmConsultaLogAltExc},
  fMostraLogExcMT in '..\FontesMT\fMostraLogExcMT.pas' {FrmMostraLogExcMT},
  FExcluiLogTabelasMT in '..\FontesMT\FExcluiLogTabelasMT.pas' {FrmExcluiLogTabelas},
  FCadPracaCompMT in '..\FontesMT\FCadPracaCompMT.pas' {FrmCadPracaComp},
  FPessoaXModuloResponMT in '..\FontesMT\FPessoaXModuloResponMT.pas' {FrmPessoaXModuloRespon},
  uCtrlSindicato in '..\FontesOutros\uCtrlSindicato.pas',
  uDbSindicato in '..\FontesOutros\uDbSindicato.pas',
  rAcessos in '..\Reports\Source\rAcessos.pas' {RptAcessos},
  uCtrlRptGlobal in '..\Reports\Source\uCtrlRptGlobal.pas',
  FCadUsuxCRespMT in '..\FontesMT\FCadUsuxCRespMT.pas' {FrmCadUsuxCResp},
  RListagemDeEmpresas in '..\Reports\Source\RListagemDeEmpresas.pas' {RptListagemDeEmpresas},
  FCadUsrxMoedaMT in '..\FontesMT\FCadUsrxMoedaMT.pas' {FrmCadUsrxMoeda},
  FCadUsrxCCustoMT in '..\FontesMT\FCadUsrxCCustoMT.pas' {FrmUsuxCCusto},
  FCadCRespxUsu in '..\FONTESMT\FCadCRespxUsu.pas' {FrmCadCRespxUsuMT},
  FCadCcustoxUsu in '..\FONTESMT\FCadCcustoxUsu.pas' {FrmCadCcustoxUsu},
  FCadPlanCRespon in '..\FONTESMT\FCadPlanCRespon.pas' {frmCadPlanCRespon},
  FCadPlanCCust in '..\FONTESMT\FCadPlanCCust.pas' {frmCadPlanCCust},
  fCadDeParaCRMT in '..\FONTESMT\fCadDeParaCRMT.pas' {frmCadDeParaCRMT},
  fCadDeParaCCMT in '..\FONTESMT\fCadDeParaCCMT.pas' {frmCadDeParaCCMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadTabelaDeParaCC in '..\FONTESMT\FCadTabelaDeParaCC.pas' {frmCadTabelaDeParaCC},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadPlanPrevContabPatro in '..\FONTESMT\FCadPlanPrevContabPatro.pas' {FrmCadPlanPrevContabPatro},
  uCtrlTabelaDeParaCR in '..\CtrlObjects\uCtrlTabelaDeParaCR.pas',
  uCtrlCampoDeParaCR in '..\CtrlObjects\uCtrlCampoDeParaCR.pas',
  uCtrlTabelaDeParaCC in '..\CtrlObjects\uCtrlTabelaDeParaCC.pas',
  uCtrlCampoDeParaCC in '..\CtrlObjects\uCtrlCampoDeParaCC.pas',
  uDbCampodeparaCC in '..\DbObjects\uDbCampodeparaCC.pas',
  uDbCampodeparaCR in '..\DbObjects\uDbCampodeparaCR.pas',
  uDbTabeladeparaCR in '..\DbObjects\uDbTabeladeparaCR.pas',
  uDbTabeladeparaCC in '..\DbObjects\uDbTabelaDeParaCC.pas',
  FCadTabelaDeParaCR in '..\FONTESMT\FCadTabelaDeParaCR.pas' {frmCadTabelaDeParaCR},
  fCadDeParaCCMultiMT in '..\FONTESMT\fCadDeParaCCMultiMT.pas' {frmCadDeParaCCMultiMT},
  FCadDeParaCRMultiMT in '..\FONTESMT\FCadDeParaCRMultiMT.pas' {frmCadDeParaCRMultiMT},
  FExecDeParaCC in 'FExecDeParaCC.pas' {frmExecDeParaCC},
  FExecDeParaCR in 'FExecDeParaCR.pas' {frmExecDeParaCR},
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT},
  FWizImportaCotacao in '..\FONTESMT\FWizImportaCotacao.pas' {frmWizImportaCotacao},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  uDbDeparaexterno in '..\DbObjects\uDbDeparaexterno.pas',
  uCtrlDeparaexterno in '..\CtrlObjects\uCtrlDeparaexterno.pas',
  FCadDeparaExternoMT in '..\FONTESMT\FCadDeparaExternoMT.pas' {FrmCadDeparaExternoMT},
  FCadBackAutoriza in '..\FONTESMT\FCadBackAutoriza.pas' {frmCadBackAutoriza},
  rAutorizacao in '..\REPORTS\SOURCE\rAutorizacao.pas' {rptParamAutoriza},
  FCadPlanPrevMT in '..\FONTESMT\FCadPlanPrevMT.pas' {FrmCadPlanPrev},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  FCadPatroMT in '..\FONTESMT\FCadPatroMT.pas' {frmCadPatroMT},
  dRelExtratoDesligamento in 'dRelExtratoDesligamento.pas' {dtmRelExtratoDesligamento},
  UctrlExtratoDesligamento in 'UctrlExtratoDesligamento.pas',
  uPextratoDesligamento in 'uPextratoDesligamento.pas' {frmPExtratoDesligamento},
  FNaturezaContrato in 'FNaturezaContrato.pas' {frmNaturezaContrato},
  fCadTipoDocPessoaMT in '..\FontesMT\fCadTipoDocPessoaMT.pas' {frmCadTipoDocPessoa},
  uTipoExtratoInstitutos in 'uTipoExtratoInstitutos.pas' {frmTipoExtratoInstitutos},
  dExtratoInstitutos in 'dExtratoInstitutos.pas' {dtmRelExtratoInstitutos},
  FCadIntegraOrcFDO in '..\FONTESMT\FCadIntegraOrcFDO.pas' {FrmCadIntegraOrcFDO},
  FCadForm in '..\FONTESMT\FCadForm.pas' {FrmCadForm},
  uCtrlForm in '..\CtrlObjects\uCtrlForm.pas',
  uDbForm in '..\DbObjects\uDbForm.pas',
  FCadOperacao in '..\FONTESMT\FCadOperacao.pas' {FrmCadOperacao},
  uCtrlOperacao in '..\CtrlObjects\uCtrlOperacao.pas',
  uDbOperacao in '..\DbObjects\uDbOperacao.pas',
  FCadObjeto in '..\FONTESMT\FCadObjeto.pas' {FrmCadObjeto},
  uCtrlObjeto in '..\CtrlObjects\uCtrlObjeto.pas',
  uDbObjeto in '..\DbObjects\uDbObjeto.pas',
  FCadFuncaoOperacao in '..\FONTESMT\FCadFuncaoOperacao.pas' {FrmCadFuncaoOperacao},
  uCtrlFuncaoOperacao in '..\CtrlObjects\uCtrlFuncaoOperacao.pas',
  uDbFuncao in '..\DbObjects\uDbFuncao.pas',
  FCadUsuarioLiberado in '..\FONTESMT\FCadUsuarioLiberado.pas' {FrmCadUsuarioLiberado},
  uCtrlUsuarioLiberado in '..\CtrlObjects\uCtrlUsuarioLiberado.pas',
  uDbUsuarioLiberado in '..\DbObjects\uDbUsuarioLiberado.pas';

{$R *.RES}
{$R GLOBALCM_RES.RES}

begin

  frmCMEntrada:= TfrmCmEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'GlobalCM';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmGlobal, dtmGlobal);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TdtmRelExtratoInstitutos, dtmRelExtratoInstitutos);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;

  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Global
================================================================================
CM$VER      3.09.16b    16/06/2008
--------------------------------------------------------------------------------
Pendência: 26902
Telas: Importar definições de dados.
Descrição: Após transf, se horver diferenças de autorizações, emite um txt no C:/,
           e emite o relatório de diferenças de autorizações.
================================================================================
CM$VER      3.09.16a    24/03/2008
--------------------------------------------------------------------------------
Pendência: 26607
Telas: Executar De/Para CC e CR
Descrição: Criar um parâmetro para que o usuário possa escolher o plano orçametário pra o qual se deseja fazer o depara,
(afetará as tabelas CONTASORCAMEN e COMPCONTASORCAMEN);
Criar um parâmetro que indicará o motivo da alteração do centro de custo da tabela EVOLFUNC.
================================================================================
CM$VER      3.09.16     29/01/2008
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
Pendencia: 26902
Tela: Ferramentas / Importa definições de dados CM Soluções
Descrição: Se houver diferenças na importação do transf, será mostrado o relatório comparativo de Autorizações.
================================================================================
CM$VER      3.09.15a    29/08/2007
--------------------------------------------------------------------------------
Pendência: 26229 
Tela: Cadastros / Moeda / Cotação
Descrição: Permitir valor negativo, no campo valor.
================================================================================
CM$VER      3.09.15     31/07/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
================================================================================
CM$VER      3.09.14     15/06/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.16
================================================================================
CM$VER      3.09.13     02/04/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.15
================================================================================
CM$VER      3.09.12     22/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
Pendência 24489 - Cadastros / Patrocinadora
- Removido campos que não estavam no modelo.
Pendência 24363 - Ferramentas \ Restaura Autorização
- Removido o owner CM.
Pendência 23894 - Contabilidade
- Implementação da memória de cálculo de segregação.
================================================================================
CM$VER      3.09.11a    05/02/2007
--------------------------------------------------------------------------------
Pendência: 24394
Tela: Cadastro \ Centro de Custo \ Centro de custo por usuários
Descrição: O código e nome do centro de custo não aparecia na pesquisa.
================================================================================
CM$VER      3.09.11     09/11/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.13
================================================================================
CM$VER      3.09.10c    09/11/2006
--------------------------------------------------------------------------------
Pendência: 22217 (Reabertura)
Tela: Cadastro / Cadastro / Plano Previdênciario
Descrição: Ajuste no cadastro de Plano Previdênciario.
================================================================================
CM$VER      3.09.10b    08/11/2006
--------------------------------------------------------------------------------
Pendência: 23688
Tela: Cadastros|centro de Custo\centro de Custo
Descrição: Inclusão do Programa na tela de centro de custo
================================================================================
CM$VER      3.09.10a    07/11/2006
--------------------------------------------------------------------------------
Pendência: 22217 (Reabertura)
Tela: Cadastro / Patrocinadora
Descrição: Ajuste no cadastro de patrocinadora.
================================================================================
CM$VER      3.09.10     10/10/2006
--------------------------------------------------------------------------------
Padrão 5.10.12
Pendência: 22217
Tela: Cadastro / Patrocinadora ; Cadastro / Plano Previdênciario
Descrição: Premite o cadastro de Plano Previdênciario e Patrocinadora.
Pendência: 19573
Tela: Sistema/Configurações/Parãmetros/Senha
Descrição: Só obrigar a mudança da senha do SUPER se o checkbox estiver marcado.
Pendência: 17382
Tela     : Importa Definição de Dados CM Soluções
Descrição: Correção do problema encontrado na importação dos relatórios
Pendência: 20974
Tela     : Consulta/Relatórios/Comparativo de Autorizações
Descrição: Correção do truncamento dos labels no header do cabeçalho
Pendência: 22416
Tela: Cadastro de Bancos
Descrição: Correção da validação do nro do banco.
Pendência: 22551
Tela: Cadastro de Planos e patros
Descrição: Inclusão da tela de cadastro de Planos e Patros conforme AdmPrev
================================================================================
CM$VER      3.09.09a    17/08/2006
--------------------------------------------------------------------------------
Pendência: 20974
Tela: Consulta/Relatórios
Descrição: Refinamento do relatório Comparativo de Autorizações
================================================================================
CM$VER      3.09.09     10/08/2006
--------------------------------------------------------------------------------
Pendência: 17382
Tela: Consulta/Relatórios
Descrição: Criação do Relatório Comparativo de Autorizações
Pendência: 22649
Tela: Consulta/Variação de Indíces
Descrição: Ajuste de cores na tela de consulta de variação de índices
Liberado no padrão 5.10.11
================================================================================
CM$VER      3.09.08     13/07/2006
--------------------------------------------------------------------------------
 Liberação do Padrão  5.10.10
================================================================================
CM$VER      3.09.07c    11/07/2006
--------------------------------------------------------------------------------
Pendência: 19923
Tela: sistema\utilitários\Importação de Cotação de Moedas
Descrição do erro: Não está importando os valores da cotação corretamente.
================================================================================
CM$VER      3.09.07b    19/05/2006
--------------------------------------------------------------------------------
Pendência: 22146
Tela: Cadastro\Centro Responsabilidade\Usuários por Centro de Responsabilidade
Descrição ; A acerto da seleção do usuário pelo Centro de Responsabilidade
================================================================================
CM$VER      3.09.07a    16/05/2006
--------------------------------------------------------------------------------
Pendência: 19923 (ajuste)
Tela: Sistema\Utilitários\Importação de Cotação
Descrição otimização do  cadastro de moedas para importar dados do excel
no intuito de alimentar o sistema com as informações necessárias (cadastro de indicadores projetados).
================================================================================
CM$VER      3.09.07     20/04/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09
================================================================================
CM$VER      3.09.06a    20/04/2006
--------------------------------------------------------------------------------
Pendência: 22055  Sistema/Configuração/Parâmetros de Sistema
Descrição: Corrigido o erro em que em alguns casos específicos não mostrava
           algumas moedas disponíveis na seleção "Moeda Corrente"
================================================================================
CM$VER      3.09.06     20/01/2006
--------------------------------------------------------------------------------
Liberação no padrão 5.10.08
Pendência: 18097
Tela Sistema\Utilitários\Consultar Log Tabelas
Descrição: Criar a funcionalidade de filtrar as atividades do usuário SUPER.
Pendência: 18946 
Tela : Sistema\Utilitários\De/Para de Exportações
Descrição da tela Sistema\Utilitários\De/Para de Exportações
Pendência: 19923
Tela: Sistema\Utilitários\Importação de Cotação
Descrição otimização do  cadastro de moedas para importar dados do excel 
no intuito de alimentar o sistema com as informações necessárias (cadastro de indicadores projetados). 
De acordo com a solicitação número: 35337
Pendência: 18776
Tela: Cadastro\Moeda\Usuário por qualificação de Moeda
Descrição: Inclusão  da opção "sigla" na tela de cadastro de usuário por qualificação de moeda.
Pendência: 18778 / 19455
Tela: Cadastros\Moeda\Cotação
Descrição: Inverter a ordenação da tela de cadastro de cotação de moedas Hoje é ordenado
pela descrição, solicito  a ordenação seja pela sigla.
Descrição: Colocar um campo "Observação" para preenchimento no momento de alteração da cota.
Motivo: Permitir o usuário registrar as possíveis alterações que porventura vierem a acontecer nos valores já cadastrados.
Pendência: 20380
Tela: Cadastro\Moeda\Qualificação
Descrição: Inclusão da opção "quinzenal" no componente de periodicidade
================================================================================
CM$VER      3.09.05     25/08/2005
--------------------------------------------------------------------------------
Liberação do padrão 5.10.07
================================================================================
CM$VER      3.09.04a    13/01/2005
--------------------------------------------------------------------------------
- Pendência 18474
  Incluido o campo Data Inicial na tela de Parâmetros do sistema, aba Previdência,
  Segregação de recursos
================================================================================
CM$VER      3.09.04     20/12/2004
--------------------------------------------------------------------------------
Pendência: 17193 - Parâmetros do Sistema
Criado os parâmetros:
 Plano Previdenciário - "ADMINISTRATIVO" - para indicar o plano de operações Administrativas
 Segrega o Plano "COMUM" na origem - indica que a segregação de recursos para lançamentos do
    plano "COMUM" se darão na origem, inclusive o financeiro
 Segrega o Plano "ADMINISTRATIVO" na origem - indica que a segregação de recursos para lançamentos do
    plano "ADMINISTRATIVO" se darão na origem, inclusive o financeiro
Pendência: 17239 - Cadastros\Moeda\Cotação
Descrição: Fazer a validação do campo "referência".
Pendência: 17346 - Cadastro de Planos Previdenciários Contábeis
Criar a possibilidade de se desabilitar um plano previdenciário contábil.
================================================================================
CM$VER      3.09.03     19/07/2004
--------------------------------------------------------------------------------
- Liberação do Processo de De/Para de Centro de Custo e Centro de Responsabilidade
================================================================================
CM$VER      3.09.02a    27/05/2004
--------------------------------------------------------------------------------
*** Pendencia 16205 - Cotação de Moeda
> Cadastro de moeda pela sigla.
*** Pendência 15166 - Cadastros de Centros de Custo e de Responsabilidade
> Implementação do cadastro de responsáveis por centros de custo e de responsabilida e suas respectivas vigências.
================================================================================
CM$VER      3.09.02     21/05/2004
--------------------------------------------------------------------------------
*** Pendência 15860 - Cadastro de Centro de Custo
> Não permitir cadastro de códigos com zeros à direita.
*** Pendência 16784 - Cadastro de Centro de Custo
> Não permitir cadastro de filhos sem pai.
> Correções de diversos problemas na janela.
================================================================================
CM$VER      3.09.01b    19/05/2004
--------------------------------------------------------------------------------
Pendência: 16814
Tela: Parâmetros do Sistema
Descrição: Na pasta Previdência, corrigir o lookupCombo patrocinadora.
================================================================================
CM$VER      3.09.01a    10/05/2004
--------------------------------------------------------------------------------
Pendência 16751
Tela: Cadastros\Plano Previdenciário Contábil
Descrição: Inclusão do Campo CODSPC para ser utilizado na exportação do balancete para 
o sistema da SPC.
================================================================================
CM$VER      3.09.01     15/04/2004
--------------------------------------------------------------------------------
Pendencia 15457: Criado cadastro de Tabelas e Campos de De/Para de Centros de Responsabilidade, análogo ao da Contabilidade.
Pendencia 15458: Criado cadastro de Tabelas e Campos de De/Para de Centros de Custo, análogo ao da Contabilidade.
================================================================================
CM$VER      3.09.00e    02/04/2004
--------------------------------------------------------------------------------
Tela: Cadastros\Plano Previdenciário X Patrocinadora
Pendência 15729 - Criação de Cadastro para relacionamento de Plano Previdenciário com Patrocinadora.
Este cadastro se torna obrigatório, a partir do padrão 5.10.03
================================================================================
CM$VER      3.09.00d    27/02/2004
--------------------------------------------------------------------------------
Pendência 14933
Telas: Cadastro\Usuário por Centro de Responsabilidade e 
Cadastro\Centro de Responsabilidade por Usuário
Descrição Caso a fundação utilize a estrutura de centro de responsabilidade, 
não listar o centro de responsabilidade padão código 9999999999 para 
relacionamento de usuários.
================================================================================
CM$VER      3.09.00c    26/12/2003
--------------------------------------------------------------------------------
- Pendência 15150: Cadastros \ Centros de Responsabilidade por Usuário
  Correções diversas na tela, o identificador da tabela CentRespon, estava sendo 
  tratado como Inteiro.
================================================================================
CM$VER      3.09.00b    17/12/2003
--------------------------------------------------------------------------------
- Pendência 14802: Cadastros \ Centros de Responsabilidade
  - Alterado cadastro para permitir processo de De/Para;
- Pendência 14804: Cadastros \ Centros de Custo
  - Alterado cadastro para permitir processo de De/Para;
================================================================================
CM$VER      3.09.00a    15/12/2003
--------------------------------------------------------------------------------
- Pendência 14801: Cadastros \ Planos de Centros de Responsabilidade
  - Criado novo cadastro;
- Pendência 14803: Cadastros \ Planos de Centros de Custo
  - Criado novo cadastro;
- Pendência 15453: Sistema \ Configuração \ Parâmetros do Sistema
  - Criados campos para indicar Plano de Centros de Custo e Responsabilidade vigentes;
- Pendência 15455: De/Para \ Centros de Responsabilidade \ De/Para 
  - Criado cadastro de De/Para de Centros de Responsabilidade;
- Pendência 15456: De/Para \ Centros de Custo \ De/Para 
  - Criado cadastro de De/Para de Centros de Custo;
================================================================================
CM$VER      3.09.00     15/12/2003
--------------------------------------------------------------------------------
- Pendência 15453: Cadastro \ Centro de Custo por Usuários
  - Gravação dos Planos (vigentes) de Centros de Responsabilidade e Custo;
- Pendência 15772: Cadastro \ Centro de Custo por Usuários
  - Corrigido erro ao fazer o relacionamento;
- Pendência 15773: Sistema \ Configuração \ Parâmetros do Sistema
  - Criado parâmetro Segregação Virtual que indica se a fundação uso da segregação virtual;
- Pendência 14891: Sistema \ Configuração \ Parâmetros do Sistema
  - Criação do parâmetro "Obriga CGC de agência bancária"
- Pendência 14624: Cadastro \ Usuarios por Centro de Custo
  - Exibição do código do centro de custo;
================================================================================
CM$VER      3.08.08     04/12/2003
--------------------------------------------------------------------------------
>> Resolução da pendência 15149:
*** Na lista dos usuários disponíveis, ao selecionar um usuário e clicar na setinha para direita, o mesmo é transferido.  Se continuar clicando, não é o usuário da linha selecionada que está sendo transferido e sim o primeiro da lista, onde o "ponteiro" está marcado. (3S = 22827)
>> Resolução da pendência 15150:
*** Na lista dos usuários disponíveis, ao selecionar um usuário e clicar na setinha para direita, o mesmo é transferido.  Se continuar clicando, não é o usuário da linha selecionada que está sendo transferido e sim o primeiro da lista, onde o "ponteiro" está marcado. (3S = 22827)
>> Resolução da pendência 15151:
*** Possibilidade de listar ao lado do nome do usuário (login), o respectivo nome completo do mesmo (como acontece na tela de autorização de acessos por usuários).  (3S = 22830)
================================================================================
CM$VER      3.08.07     13/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14449
  > Tela\Opçao No Sistema: Cadastro Usuário x Centro de Custo e Centro de Responsabilidade
  Favor verificar as alterações no cadastro de usuário por centro de responsabilidade e usuário por centro de custo. Em ambos ser possível a alteração na forma de cadastro, ou seja, ao invés de selecionar um usuário e associa-lo ao centro de reponsabilidade ou centro de custo, poder selecionar o cc ou cr e associar os usuários a eles, e apresentar em tela o código do centro de custo.
 
================================================================================
CM$VER      3.08.06     17/04/2003
--------------------------------------------------------------------------------
- Alteração do nome de todos os forms para o nome antigo, antes da conversão para 3 camadas, de forma a respeitar as autorizações.
================================================================================
CM$VER      3.08.05     08/04/2003
--------------------------------------------------------------------------------
- Alteração na tela de Cotação de Moeda que não respeitava adequadamente os direitos atribuidos ao usuário logado no sistema.
================================================================================
CM$VER      3.08.04     03/04/2003
--------------------------------------------------------------------------------
- Incluido campo Centro de Custo na Tela Tipo de Cliente X Hotel X Conta Contabil
- Alteração do nome de todos os forms para o nome antigo, antes da conversão para 3 camadas, de forma a respeitar as autorizações.
================================================================================
CM$VER      3.08.03     28/03/2003
--------------------------------------------------------------------------------
- Adicionada opção de indicar o Centro de Responsabilidade Padrão através da tela de Parametros Globais.
================================================================================
CM$VER      3.08.02     13/03/2003
--------------------------------------------------------------------------------
- Alteração na telas dos cadastros de Atividade/Projeto, Centro de Custo e Centro de Responsabilidade para corrigir o teste de inserção de filho com pai analítico.
- Adicionada opção de indicar a Atividade/Projeto Padrão através da tela de Parametros Globais.
- Adicionado teste de conclusão bem sucedida do cadastro de parametros globais.
- Acerto do Relatorio de Acessos que não aparecia o Grupo do Usuário/Usuários do Grupo.
================================================================================
CM$VER      3.08.01     19/02/2003
--------------------------------------------------------------------------------
- Inclusão do campo FLGTESTADATASCOT na tabela Moeda e na tela.
  Este campo informa se deve haver teste quanto a periodos sobrepostos para as cotações da moeda.
- Correção na tela de Cotação de Moeda que permitia que um usuário sem acesso a uma determinada moeda fizesse alterações na mesma.
================================================================================
CM$VER      3.08.00     18/02/2003
--------------------------------------------------------------------------------
- Criação das Telas para manutenção das tabelas TipoClientexHotelxCC e UsuarioxMoeda
- Alteração da tela de Cotação de Moeda para contemplar a tabela UsuarioxMoeda.
================================================================================
CM$VER      3.07.00     13/01/2003
--------------------------------------------------------------------------------
- Inclusão dos campos FLGSUBCONTAFORN e FLGSUBCONTACLIE na tela PARAMGLOBAL.
================================================================================
CM$VER      3.06.13     07/01/2003
--------------------------------------------------------------------------------
- Retiradas das telas de Ramos de Fornecedores e Tipos de Clientes, colocadas na BPL.
================================================================================
CM$VER      3.06.12     19/12/2002
--------------------------------------------------------------------------------
- Inclusão do campo DiasTrocaSenha na tela ParamGlobal;
================================================================================
CM$VER      3.06.11     06/12/2002
--------------------------------------------------------------------------------
- Alteração na tela de Cotação de Moeda tratar valores iguais a zero e exibir mensagens adequadamente.
================================================================================
CM$VER      3.06.10     28/11/2002
--------------------------------------------------------------------------------
- Inclusão da tela de Cadastro de Usuarios por Centro de Responsabilidade.
================================================================================
CM$VER      3.06.09     14/11/2002
--------------------------------------------------------------------------------
- Alteração na tela de Cotação de Moedas para permitir cadastrar cotação para moeda corrente e verificar se o período informado durante uma alteração não contém outras cotações.
================================================================================
CM$VER      3.06.08     13/11/2002
--------------------------------------------------------------------------------
- Alteração na tela de Cotação de Moedas corrigindo diversos probleminhas.
- Correção na tela de Cadastro de Centro de Custo que estava mostrando somente os centros de custos ativos.
================================================================================
CM$VER      3.06.07     04/11/2002
--------------------------------------------------------------------------------
- Alteração na tela de Parametros Globais para aceitar IDPESSOA menor que zero.
================================================================================
CM$VER      3.06.06     01/11/2002
--------------------------------------------------------------------------------
- Inclusão de um método na classe TCtrlCotacaoMoeda para testar se uma cotação pode ser incluída.
- Alteração da tela de Cotação de Moedas para se escolher uma moeda e mostrar as cotações da mesma.
================================================================================
CM$VER      3.06.05     30/10/2002
--------------------------------------------------------------------------------
- Criação de um botão, na tela de Consulta do Log Tabelas, para imprimir o resultado da pesquisa.
- Correção da tela de Cadastro de Paises que apresentava o erro "valor maior que a precisão especificada".
- Correção da tela de Cadastro de Cotação de Moedas que apresentava o erro "Field 'CodData' not found".
================================================================================
CM$VER      3.06.04     28/10/2002
--------------------------------------------------------------------------------
- Correção na classe de persistencia de País alterando o campo CodReceitaFederal de Float para Integer, pois o mesmo estava estorando.
================================================================================
CM$VER      3.06.03     28/10/2002
--------------------------------------------------------------------------------
- Correção da classe de controle TCtrlParamGlobal, que utilizava objetos da uSistema.
- Bloqueio de cadastramento de mais de uma cotação para a mesma moeda no mesmo período.
================================================================================
CM$VER      3.06.02     17/10/2002
--------------------------------------------------------------------------------
- Correção do Setfocus na alteração errada da senha do usuário Super.
- Correção do relatorio de acessos para gerar um erro quando não seleciona nem usuário nem grupo.
================================================================================
CM$VER      3.06.01     25/09/2002
--------------------------------------------------------------------------------
- Alteração nas telas de Cadastro de Centro de Responsabilidade e Atividade/Projetos onde agora é utilizado um ClienteDataset separado para realizar inclusão/alteração/exclusão.
================================================================================
CM$VER      3.06.00     19/09/2002
--------------------------------------------------------------------------------
- Correção do campo Obriga Centro de Custo que estava apontando para o campo "USACRESPON" da tabela PARAMGLOBAL.
- Quando cofirma-se as alterações do ParamGlobal o programa, agora, passa a recarregar as configurações.
- Alteração da rotina de gravação dos dados do Cadastro de Usuários por centro de Custo.
================================================================================
CM$VER      3.05.12     13/09/2002
--------------------------------------------------------------------------------
- Inclusão, na tela de Parametros Globais, os campos Inscrição Estadual e Inscrição Municipal.
================================================================================
CM$VER      3.05.11     11/09/2002
--------------------------------------------------------------------------------
- Alteração do Cadastro de Moedas incluindo a periodicidade Trimestral.
- Correção no Cadastro de Moedas: não apareceia a mascara do campo de referencia antes da digitação, na inclusão.
- Correção no Cadastro de Atividade/Projetos: não trazia dados no combo responsável.
- Correção no Cadastro de Atividade/Projetos: não desabilitava botão excluir quando pressionava-se o Alterar.
- Correção no Cadastro de Centro de Responsabilidade: não desabilitava botão excluir quando pressionava-se o Alterar.
- Correção na tela de Parametros Globais: Não desmarcava campo que obriga letras na senha.
================================================================================
CM$VER      3.05.10     04/09/2002
--------------------------------------------------------------------------------
- Correção da tela de Parâmetros, a qual não gravava quando não existia nenhuma linha na tabela ParamGlobal.
================================================================================
CM$VER      3.05.09     29/08/2002
--------------------------------------------------------------------------------
- Inclusão do campo Código IBGE no cadastro de Cidades.
================================================================================
CM$VER      3.05.08     13/08/2002
--------------------------------------------------------------------------------
- Correção do Cadastro de Moeda para não aceitar uma sigla caso ela já esteja cadastrada.
================================================================================
CM$VER      3.05.07     30/07/2002
--------------------------------------------------------------------------------
- Conversão do Relatório de Acessos para funcionar em tres camadas.
- Correção da tela de Cadastro de Centro de Custo onde, não listava os Programas de Previdência. (Somente para empresas de previdência)
================================================================================
CM$VER      3.05.06     18/07/2002
--------------------------------------------------------------------------------
- Correção da tela Cadastro de Centro de Responsabilidade, não gravava o campo Analítico/Sintético nem o IdUsuarioInclusao.
================================================================================
CM$VER      3.05.05     12/07/2002
--------------------------------------------------------------------------------
- Correção da tela Cadastro de Moedas, a tela de pesquisa não aparecia a descrição do terceiro campo de filtro (Codigo).
================================================================================
CM$VER      3.05.04     18/06/2002
--------------------------------------------------------------------------------
- Alteração das telas de Moeda e Cotação de Moeda para gravar o campo IdUsuarioInclusao.
- Obriga o preenchimento do campo CotMesRef da Cotação de Moedas.
================================================================================
CM$VER      3.05.03     12/06/2002
--------------------------------------------------------------------------------
- Adequação ao Padrão 5.07.00.
- Alteração no campo Tempo de Travamento da tela de Paramâmetros Globais para que o menor valor permitido seja 60 segundos ou então 0 (zero = desativado).
================================================================================
CM$VER      3.05.01     04/06/2002
--------------------------------------------------------------------------------
- Inclusão da cláusula Try...Except nas procedures da Aplicação Servidora.
================================================================================
CM$VER      3.05.00     24/05/2002
--------------------------------------------------------------------------------
Foi criada a coluna FLGCONTABPARTDOB no PARAMGLOBAL para indicar 
a obrigatoriedade dos lançamentos na contabilidade serem feitos 
em Partida Dobrada.
Foi criada na tela de Parametros Globais a opção
"[  ] Lança na contabilidade em Partida Dobrada"
================================================================================
CM$VER      3.04.02     22/05/2002
--------------------------------------------------------------------------------
- Correção dos botões da Integração com o Orçamento, que em alguns casos não 
gravava o novo estado.
================================================================================
CM$VER      3.04.01     20/05/2002
--------------------------------------------------------------------------------
- Alteração da consulta o LogTabelas para poder trazer somente as linhas de inclusão, 
alteração ou exclusão, reduzindo o trafego de rede.
================================================================================
CM$VER      3.04.00     03/05/2002
--------------------------------------------------------------------------------
- Funcionamento do Global.exe com Aplicação Servidora e BPL Global.
================================================================================
CM$VER      3.03.10     09/04/2002
--------------------------------------------------------------------------------
- Desenvolvimento das telas ParamGlobal, Consulta do Log Tabelas e 
  Pessoa X Módulo Responsável, já para tres camadas.
- Alteração das telas de País, Estado, Cidade, Plano Previdenciário Contabil, Moeda,
 Cotação de Moeda, Programa, Ramo do Fornecedor, Tipo de Cliente, Tipo Doc Pessoa e
 TipOper para a nova forma de desenvolvimento em tres camadas, utilizando ApplyCds.
================================================================================
CM$VER      3.03.09     05/04/2002
--------------------------------------------------------------------------------
- Alteração das telas dos cadastros de Feriados, Tipo de Documentação, Usuário por 
   Centro de Custo e Atividades/Projetos (ABC) para funcionar em três camadas.
- Criação de tela para manutenção do Praça de Compensação, já para três camadas.
- Atribuição dos códigos de ajuda (Help) as opções de menu e telas.
================================================================================
CM$VER      3.03.08     19/03/2002
--------------------------------------------------------------------------------
- No cadastro de Moedas não é mais obrigatório a especificação da moeda de referência.
- Corrigida a ordem do Tab nos campos na tela de cotação da moeda.
- No combo de Moeda na tela de cotação da moeda mostra a Unidade de Taxa.
- Na procura, em ambas as telas, pode-se pesquisar pela Sigla e Unidade de Taxa.
- Alteração das telas dos cadastros de Centro de Responsabilidade para funcionar em
   três camadas.
================================================================================
CM$VER      3.03.07     21/02/2002
--------------------------------------------------------------------------------
- Alteração das telas dos cadastros de País, Estado, Cidade, Moeda, Cotação, 
   Programa Previdenciário, Tipo de Cliente e Tipo de Operação para funcionar em 
   três camadas.
- Criação de tela para manutenção do Plano Previdenciário Contábil, já para três camadas.
================================================================================
CM$VER      3.03.05     22/11/2001
--------------------------------------------------------------------------------
- Cadastro de Moedas Cotação e Qualificação
  Inclusão de campo para indicar a Descrição da Unidade da Taxa.
- Parâmetros
  Inclusão de parâmetro para verificação da senha de acordo com o Nome\Sobrenome do usuário.
================================================================================
CM$VER      3.03.02     10/10/2001
--------------------------------------------------------------------------------
- Correção na Verificação da senha do usuário quando o parâmetro "Pode repetir senha" 
está ativado.
================================================================================
CM$VER      3.03.01     08/10/2001
--------------------------------------------------------------------------------
- Prametros do Sistema
  Correçãna na verificação da senha do usuário super na alteração dos Parâmetros
================================================================================
CM$VER      3.03.00     25/09/2001
--------------------------------------------------------------------------------
- Implementação da autorização da pasta "Senha" no Casdatro de Parâmetros do Global com 
  a função de "PARÂMETROS DE SEGURANÇA"
- Implementação da gravação da Operação de "Atualização" do Cadastro de Parâmetros do Global e
  autorização da Consulta de Log de Operações no sistema Global. 
- Parâmetros do Global
  Implementação do parâmetro "Vincula Modulo X Pessoa". 
  Este parâmetro está diretamente vinculado a parametrização do subtipo para gravar o módulo responsãvel no pessoa. O valor defaul é "Não Vincula".
- Tipo de Documento
  Implementação do cadastro da Data de Validade do documento de acordo com o parâmetro
  do tipo de documento "Obriga data de Validade"
================================================================================
CM$VER      3.02.05     19/09/2001
--------------------------------------------------------------------------------
- Parametros Globais
  Correção na gravação dos parâmetros referentes ao controle de Log-Out.
================================================================================
CM$VER      3.02.04     13/09/2001
--------------------------------------------------------------------------------
- Cadastro de Moedas
  Correção no teste da obrigatoriedade da data final da cotação
================================================================================
CM$VER      3.02.03     06/09/2001
--------------------------------------------------------------------------------
- Cotação de MOEDA
  Inclusão de exibição da sigla da moeda do combo de seleção da mesma
- Parâmetros Globais 
   Inclusão dos atributos para controle de senhas:
·	Tamanho da Senha ( Default 6 );
·	Tipo de Caracteres: Letras, Números ou Alfa-Numérico ( Default Letras );
·	Sensível a Caixa ( Default Não );
·	Permite Repetição de Senhas Do Usuário na troca de Senhas ( Default Sim - Aconselho criar uma tabela para armazenar as senhas alteradas no caso de Não Permitir Repetição de Senhas. Solicitar nesse caso uma quantidade limite de armazenamento de senhas, eliminando sempre a mais antiga ou um período para limpar o banco de senhas );
·	Permitir alteração da senha do usuário SUPER, solicitando nessa tela a senha e a confirmação da mesma, gravando Encriptada com o mesmo algoritimo de gravação da senha do usuário do sistema;
================================================================================
CM$VER      3.02.02     29/08/2001
--------------------------------------------------------------------------------
- Cadastro de Moedas
  Alteração no comprimento do campo da SIGLA da moeda para 10 Caracteres
================================================================================
CM$VER      3.02.01     06/08/2001
--------------------------------------------------------------------------------
* Acertada a tela de consulta log.
================================================================================
CM$VER      3.02.00     10/07/2001
--------------------------------------------------------------------------------
- Manutenção e Consulta do LogTabelas
  Impementação dos utilitários de manutenção e consulta do logtabelas.
================================================================================
CM$VER      3.01.00     10/07/2001
--------------------------------------------------------------------------------
- Cadastro de Centro de Custo
  Implementação da replicação dos relacionamentos de Tipo de Desembolso X Programa X Conta Contábi
  para o Centro de Custo Cadatrado\Alterado a partir de um já relacionado
================================================================================
CM$VER      3.00.04     27/06/2001
--------------------------------------------------------------------------------
- Correções no acesso ao DB2
================================================================================
CM$VER      3.00.03     25/06/2001
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Implementação dos parâmetros "Obriga Centro de Custo" e "Mascára do Cliente"
================================================================================
CM$VER      3.00.02     25/06/2001
--------------------------------------------------------------------------------
- Implementação dos parâmetros para Máscara de Código de Cliente e Obriga centro de custo.
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
Liberação de Versão Delphi 5
================================================================================
CM$VER      2.10.05     21/02/2001
--------------------------------------------------------------------------------
- Cadastro de Moeda - Qualificação
  Correção na exclusão de moeda\indice.
================================================================================
CM$VER      2.10.04     22/01/2001
--------------------------------------------------------------------------------
* Importação de definição de dados
   Otimização da importaçào de dados e ultilização do componente CmDatatransf;
================================================================================
CM$VER      2.10.03     18/01/2001
--------------------------------------------------------------------------------
- Parâmetros Globais
  Inclusão dos FLAG'S para:
  >Obrigatoriedade da indicação do número do documento no pessoa
  >Permissão de repetição de cadastros de pessoa com número de documento iguais
================================================================================
CM$VER      2.10.02     13/12/2000
--------------------------------------------------------------------------------
- Importa Definição de Dados
  Alteração no menu de importação de dados para o estado de sempre acessível.
================================================================================
CM$VER      2.10.00     28/11/2000
--------------------------------------------------------------------------------
- Importação de Arquivo de Transferencia de Definição de Dados
  A importação de Relatórios passos a se chamar de importação de definição de dados.
  Além dos Relatórios e Consultas Manuais, passaram a ser transferidos e atalizados
  pelo procedimento as tabelas das Consultas Gerais e toda a parte de Autorização, não
  sendo mais nescessário gerar o script de autorização.
  O Procedimento de atualização da autorização insere 
  novas autorizasções, verifica duplicidades e apaga autorizações
  sem objetos correspondentes.
================================================================================
CM$VER      2.09.01     20/11/2000
--------------------------------------------------------------------------------
- Cadastro de Centro de Responsabilidade
  Correção na alteração do Status de Ativo\Inativo;
================================================================================
CM$VER      2.09.00     13/10/2000
--------------------------------------------------------------------------------
- Importação de Definição de Relatórios
  Alterações para contemplar a importação de Gráficos (FLGTIPO = 'G') gerados na
  cm soluções.
================================================================================
CM$VER      2.08.08     15/09/2000
--------------------------------------------------------------------------------
- Cadastro de Moedas
  Correção na gravação da referência da cotação;
  Correção na exibição da 'Grade' com as cotações
================================================================================
CM$VER      2.08.07     04/09/2000
--------------------------------------------------------------------------------
- Global
  * Parâmetros
    Inclusão da pasta Previdência para indicação do Plano e Patrocinadoras defaul dos sistemas;
  * Cadastro de Codação de Moedas
    Alteração na gravação e validação do acadastro para compatiblizar com nova
    estrutura de 'Períodos' da cotação;
================================================================================
CM$VER      2.08.05     29/08/2000
--------------------------------------------------------------------------------
  * Parâmetros:
    Inclusão da pasta Previdência para indicação do Plano e Patrocinadoras default dos sistemas;
  * Cadastro de Centro de Custo:
    Inclusão do programa padrão para este centro de custo
================================================================================
CM$VER      2.08.03     16/08/2000
--------------------------------------------------------------------------------
- Atualização Via FTP do CENTRALIZA
  Implementação da opção no módulo
================================================================================
CM$VER      2.08.01     08/08/2000
--------------------------------------------------------------------------------
- Cadastro de Grupo
  Atualização do Cadastro para o padrão novo.
================================================================================
CM$VER      2.08.00     14/07/2000
--------------------------------------------------------------------------------
- Cadastro de Centro de Custo
  Inclusão da coluna código correspondente;
  Inclusào de opção de replicação do relacionamento ContasXCentrodeCusto para os centros de custos cadastrados
- Cadastro de Centros de Responsabilidade
  Alteração na largura do campo 'Responsável'
- Cadastro de Moedas
  Inclusão da Identificação ('Hints') para os campos "Fator de Conversão" e "Moeda Referência"
- Programas Previdenciários
  Inclusão do Cadastro de Programas Previdenciários;
  Validação do Cadastro de acordo com a empresa proprietária: só é visível   para previdências
- Geral 
  Otimização na seleção de parâmetros de Integração com o BacOffice
  Cadastro de Grupos de Usuários
  Inclusão do nome completo do usuário ao lado do seu login (Passar para o padrão ao retornar para a CM.   
Implementação disponível apenas no Global.)
================================================================================
CM$VER      2.07.03     14/06/2000
--------------------------------------------------------------------------------
- Cadastro de Centro de Custo
  Correção na Gravação da Alteração\Exclusão: Não tinha o código do centro de custo na  chave para alteração 
================================================================================
CM$VER      2.07.02     09/05/2000
--------------------------------------------------------------------------------
- Cadastro de Cotação de Moeda
   Alteração na disposição das colunas no grid;
================================================================================
CM$VER      2.07.01     09/05/2000
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 440
  - Cadastros / Centro de responsabilidade. Se existir algum cadastro, deveria desabilitar a alteração deste parâmetro, assim como faz  no centro de custo.
- Resolução da Pendência Nº 447
  Não estou conseguindo cadastrar pessoa fisica, em clientes e fornecedor. 
- Resolução da Pendência Nº 448
  Ao tentar alterar uma atividade/projeto, está dando a msg de erro "Cannot focus a disable or invisable window" e sai do sistema. Mas grava.
- Resolução da Pendência Nº 861
  Procurar em todos os forms a palavra rollback e acrescentar a palavra RAISE para além de dar a mensagem de ALTERAÇÃO NÃO EFETUADA, dar também a mensagem de erro interna do delphi para ficar mais fácil identificarmos o problema.
- Resolução da Pendência Nº 1022
  Falta a possibilidade de imprimir em impressoras matriciais.
- Resolução da Pendência Nº 1030
  Cadastro de feriados - erro de constrait.(CM.R_4826)
================================================================================
CM$VER      2.07.00     02/05/2000
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Inclusão do Prâmetro para indicação da ultilização de Maíusculas nos cadastros de Pessoa para os
  campos NOME e RAZAOSOCIAL.
================================================================================
CM$VER      2.06.01     20/04/2000
--------------------------------------------------------------------------------
- Cadastro de Feriados
  Gravação do CODESTADO na tabela de fariados;
================================================================================
CM$VER      2.06.00     29/03/2000
--------------------------------------------------------------------------------
- Parâmetros Globais
  Inclusão dos parâmetros de máscara do número da agência bancária e da Indicação
  de criação automática de agência bancária no cadastro de fornecedores;
- Cadastro de Centro de Custo
  Inclusão do cadastro do Código Reduzido Do Centro de Custo;
================================================================================
CM$VER      2.05.10     09/03/2000
--------------------------------------------------------------------------------
- Cotação de Moeda
  Inclusão dos atributos para indicação de Data Final da Cotação e Prazo Para Cotação
================================================================================
CM$VER      2.05.09     22/02/2000
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Implementação do Teste do Comprimento da Mácara do Centro de Custo.
================================================================================
CM$VER      2.05.08     03/02/2000
--------------------------------------------------------------------------------
- Retirada a opção de receber arquivos da CM que a partir de agora será efetuada pelo Mensageiro
================================================================================
CM$VER      2.05.07     25/01/2000
--------------------------------------------------------------------------------
- Importa Defiições de Relatório
  A atualização de relatórios passou a verificar a existência de registros filhos
  de relatórios vindos no arquivo de transferência passando a alterar o registro
  existente ao invés de inserir um novo com a mesma chave
================================================================================
CM$VER      2.05.06     18/01/2000
--------------------------------------------------------------------------------
- Correção no gerenciamento de ftp
================================================================================
CM$VER      2.05.05     13/01/2000
--------------------------------------------------------------------------------
- Implementações no recebimento de arquivos
================================================================================
CM$VER      2.05.04     30/12/1999
--------------------------------------------------------------------------------
- Implementado um atualizador de scripts
================================================================================
CM$VER      2.05.03     27/12/1999
--------------------------------------------------------------------------------
- Melhoria da performance na tela de Download de arquivos via FTP
================================================================================
CM$VER      2.05.02     16/12/1999
--------------------------------------------------------------------------------
- No cadastro de feriados permite não repetir uma feriado (Repetir por 0 anos)
================================================================================
CM$VER      2.05.01     09/12/1999
--------------------------------------------------------------------------------
- Correção na apresentação das datas dos arquivos disponiveis para download via FTP
================================================================================
CM$VER      2.05.00     25/11/1999
--------------------------------------------------------------------------------
- No cadastro de cidades, na confirmação da alteração, testa a existencia de cidades com o mesmo nome
================================================================================
CM$VER      2.04.02     24/11/1999
--------------------------------------------------------------------------------
- Pequenas alterações
================================================================================
CM$VER      2.04.01     21/10/1999
--------------------------------------------------------------------------------
- Na tela de cadastro de feriados não é mais obrigatório o preenchimento do Pais e Estado para que se possa preencher a cidade
================================================================================
CM$VER      2.04.00     30/09/1999
--------------------------------------------------------------------------------
- Incluida a opção de Download de arquivos do servidor FTP da CM Soluções
================================================================================
CM$VER      2.03.05     09/09/1999
--------------------------------------------------------------------------------
O padrão para criação de Centro de Responsabilidade e Unidade de Negocios defaul passa a ser Conta Analítica ao invés de sintética
================================================================================
CM$VER      2.03.04     31/08/1999
--------------------------------------------------------------------------------
- Alteração nos cadastros para aceitar o campo IDCIDADES da tabela CIDADES
================================================================================
CM$VER      2.03.03     10/08/1999
--------------------------------------------------------------------------------
- No Cadastro de cotação de moedas não permite que sejam alteradas as cotações da moeda corrente e ao inserir assume o valor 1,00
================================================================================
CM$VER      2.03.02     16/07/1999
--------------------------------------------------------------------------------
- Cadastro de Feriados
  Alterações gerais no cadastro, englobando tipos de feriados e outras estruturas
  para controle dos mesmos;
- Importa definições de relatórios 
  Implementação de controle de transação para eventual erro na importação dos
  relatórios;
================================================================================
CM$VER      2.03.01     17/06/1999
--------------------------------------------------------------------------------
- O cadastro de feriados não estava inserindo corretamente
================================================================================
CM$VER      2.03.00     14/06/1999
--------------------------------------------------------------------------------
- Criação de Parâmetro para indicar integração com Sistema de Planejamento\Orçamento;
================================================================================
CM$VER      2.02.02     02/06/1999
--------------------------------------------------------------------------------
- Adequação à nova DPL CMBack
================================================================================
CM$VER      2.02.01     01/06/1999
--------------------------------------------------------------------------------
- Atualizações dos cadastros
================================================================================
CM$VER      2.02.00     05/05/1999
--------------------------------------------------------------------------------
* A tela de leitura de arquivos de transferencia de relatorios foi alterada para se adaptar à nova estrutura de dados
================================================================================
CM$VER      2.01.03     30/04/1999
--------------------------------------------------------------------------------
* Correção de erros no cadastro de Clientes e de Fornecedores
================================================================================
CM$VER      2.01.02     16/04/1999
--------------------------------------------------------------------------------
* O cadastro de cotação de moedas permite cadastrar um valor = 0 quando o tipo de cotação for "percentual"
================================================================================
CM$VER      2.01.01     15/04/1999
--------------------------------------------------------------------------------
- Revisão no cadastro de cotação de moedas
- Revisão no cadastro de feriados
================================================================================
CM$VER      2.01.00     06/04/1999
--------------------------------------------------------------------------------
- Criados os cadastros de CIDADES e de FERIADOS no menu cadastros
================================================================================
CM$VER      2.00.21     26/03/1999
--------------------------------------------------------------------------------
- Alterados comandos SQL que usavam a função RTRIM para poder acessar o DB2
- Retirados os campos da trigger da query DataView na importação de relatórios
- Incluida a DPL CMSQL na compilação
- Alterada a posição do campo OBS no cadastro de bancos
================================================================================
CM$VER      2.00.20     09/03/1999
--------------------------------------------------------------------------------
- Deleta os arquivos temporarios antes de descompactar o arquivo de transferencia de Relatorios
================================================================================
CM$VER      2.00.19     09/02/1999
--------------------------------------------------------------------------------
- LookupTable não definida no Combo regra do cadastro de Tipo de Documento - Corrigido
================================================================================
CM$VER      2.00.18     05/02/1999
--------------------------------------------------------------------------------
- Não permitia inserir Estado no Cadastro de Estado - Corrigido
================================================================================
CM$VER      2.00.17     29/01/1999
--------------------------------------------------------------------------------
- Obriga a cadastrar o Tipo de Empresa no Cadastro de clientes
================================================================================
CM$VER      2.00.16     25/01/1999
--------------------------------------------------------------------------------
- Na Tela de Cadastro de Moeda-Qualificação dava erro quando clicava no combo moeda de referencia
================================================================================
CM$VER      2.00.15     07/01/1999
--------------------------------------------------------------------------------
- Tela de Fornecedor
  1. Dar refresh na tabela de subconta (combobox) no activate pois = quando se=20 cadastra uma subconta na Contabilidade, a mesma não aparece = em=20 Fornecedor\Favorecido; somente saindo da tela.
  2. Ordenar a qry de Tipo de Desembolso na orelha 'Tipos de = Desembolso'=20 por código; não está ordenado por campo = algum
  3. ????? Não foi possível repetir ??????
     'Cannot insert NULL into (CM.FORNXDESEMB.RECPAG) ao tentar-se = alterar um=20 fornecedor e associar-se um tipo de desembolso na orelha 'Tipo de=20 Desembolso'
================================================================================
CM$VER      2.00.14     05/01/1999
--------------------------------------------------------------------------------
- Corrigido no Cadastro de Centro de responsabilidades erros de UpdateFailure e Invalid VariantType
================================================================================
CM$VER      2.00.13     22/12/1998
--------------------------------------------------------------------------------
- Melhoria no algoritmo de importação de relatorios;
================================================================================
CM$VER      2.00.12     18/12/1998
--------------------------------------------------------------------------------
- Correção da ordem de apresentação da cotação de moeda;
================================================================================
CM$VER      2.00.11     04/12/1998
--------------------------------------------------------------------------------
- Pequenas correções na tela de Atividades / Projetos;
================================================================================
CM$ALT}























































































































































































































































































































































































































































































































































































































