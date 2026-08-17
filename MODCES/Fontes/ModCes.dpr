program ModCes;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FCuboOcorr in 'FCuboOcorr.pas' {frmCuboOcorr},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  UModulo in 'UModulo.pas',
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadGrupoFunc in '..\..\Shared\ModComp\FontesMT\fCadGrupoFunc.pas' {frmCadGrupoFunc},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadPesqui in '..\FontesMT\fCadPesqui.pas' {frmCadPesqui},
  fCadAjuste in '..\FontesMT\fCadAjuste.pas' {frmCadAjuste},
  fCadEncar in '..\FontesMT\fCadEncar.pas' {frmCadEncar},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadSindi in '..\..\Shared\ModComp\FontesMT\fCadSindi.pas' {frmCadSindi},
  fCadEntid in '..\..\Shared\ModComp\FontesMT\fCadEntid.pas' {frmCadEntid},
  fCadPeso in '..\..\Shared\ModComp\FontesMT\fCadPeso.pas' {frmCadPeso},
  fHstEvol in '..\..\Shared\ModComp\FontesMT\fHstEvol.pas' {frmHstEvol},
  fCadFator in '..\..\Shared\ModComp\FontesMT\fCadFator.pas' {frmCadFator},
  fCadCargo in '..\..\Shared\ModComp\FontesMT\fCadCargo.pas' {frmCadCargo},
  fElimPesq in '..\FontesMT\fElimPesq.pas' {frmElimPesq},
  fDistrFaixa in '..\FontesMT\fDistrFaixa.pas' {frmDistrFaixa},
  fDistrPont in '..\FontesMT\fDistrPont.pas' {frmDistrPont},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  fCadFaixa in '..\..\Shared\ModComp\FontesMT\fCadFaixa.pas' {frmCadFaixa},
  fCadRegEvol in '..\..\Shared\ModComp\FontesMT\fCadRegEvol.pas' {frmCadRegEvol},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  REtiquetaAlteracaoCTPS in '..\..\Shared\ModComp\Reports\Source\REtiquetaAlteracaoCTPS.pas' {RptEtiquetaAlteracaoCTPS},
  uCmCtrlRptModCes in '..\CtrlObjetos\uCmCtrlRptModCes.pas',
  fCadGrau in '..\FontesMT\fCadGrau.pas' {frmCadGrau},
  fCadClasse in '..\FontesMT\fCadClasse.pas' {frmCadClasse},
  fCorrFaixa in '..\FontesMT\fCorrFaixa.pas' {frmCorrFaixa},
  fSelSimul in '..\..\Shared\ModComp\FontesMT\fSelSimul.pas' {frmSelSimul},
  fEfetivaSimul in '..\..\Shared\ModComp\FontesMT\fEfetivaSimul.pas' {frmEfetivaSimul},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fColetaSal in '..\FontesMT\fColetaSal.pas' {frmColetaSal},
  fCadPesqTend in '..\FontesMT\fCadPesqTend.pas' {frmCadPesqTend},
  fChartDado in '..\FontesMT\fChartDado.pas' {frmChartDado},
  fCadPesqEmpr in '..\FontesMT\fCadPesqEmpr.pas' {frmCadPesqEmpr},
  RFaixaSal in '..\Reports\Source\RFaixaSal.pas' {RptFaixaSal},
  fSelOrcam in '..\FontesMT\fSelOrcam.pas' {frmSelOrcam},
  fLancaOrcam in '..\FontesMT\fLancaOrcam.pas' {frmLancaOrcam},
  fChartOrca in '..\FontesMT\fChartOrca.pas' {frmChartOrca},
  fTabPesqui in '..\FontesMT\fTabPesqui.pas' {frmTabPesqui},
  FChartPesq in '..\FontesMT\fChartPesq.pas' {frmChartPesq},
  fCadHay in '..\FontesMT\fCadHay.pas' {frmCadHay},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  fParamAlterFuncional in '..\..\Shared\ModComp\Reports\Source\fParamAlterFuncional.pas' {frmParamAlterFuncional},
  RAlterFuncional in '..\..\Shared\ModComp\Reports\Source\RAlterFuncional.pas' {RptAlterFuncional},
  fParamInconsistSal in '..\Reports\Source\fParamInconsistSal.pas' {frmParamInconsistSal},
  fParamPesqSal in '..\Reports\Source\fParamPesqSal.pas' {frmParamPesqSal},
  RInconsistSal in '..\Reports\Source\RInconsistSal.pas' {RptInconsistSal},
  RPesqSal in '..\Reports\Source\RPesqSal.pas' {RptPesqSal},
  fSelSolic in '..\..\Shared\ModComp\FontesMT\fSelSolic.pas' {frmSelSolic},
  fBaseComp in '..\..\Shared\ModComp\FontesMT\fBaseComp.pas' {frmBaseComp},
  fCadRegSolic in '..\..\Shared\ModComp\FontesMT\fCadRegSolic.pas' {frmCadRegSolic},
  fAnalSolic in '..\..\Shared\ModComp\FontesMT\fAnalSolic.pas' {frmAnalSolic},
  RCartaComunicado in '..\..\Shared\ModComp\Reports\Source\RCartaComunicado.pas' {RptCartaComunicado},
  fParamCartaComunicadoAux in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicadoAux.pas' {frmParamCartaComunicadoAux},
  fParamCartaComunicado in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicado.pas' {frmParamCartaComunicado},
  fCadOrcamPessoal in '..\FontesMT\fCadOrcamPessoal.pas' {frmCadOrcamPessoal},
  fConsOrcamPessoal in '..\FontesMT\fConsOrcamPessoal.pas' {frmConsOrcamPessoal},
  ROrcamQuantPess in '..\Reports\Source\ROrcamQuantPess.pas' {RptOrcamQuantPess};

{$R *.RES}
{$R MODCES_RES.RES}

Begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'RH - Cargos e Salários';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Cargos e Salários
================================================================================
CM$VER      3.04.08     26/06/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.04.07     05/03/2008
--------------------------------------------------------------------------------
Pendência: 27521
Tela: Cadastros/Cargos
Descrição: Retirada do campo 'CBO 1994' que encontra-se em desuso desde março de 2003.
================================================================================
CM$VER      3.04.06     17/07/2007
--------------------------------------------------------------------------------
(Pendência 25828)
- Transações / Registro de Alteração Funcional  e  Simulação e Implementação de Aumentos:
  * Inclusão da matícula e correção do CBO na etiqueta para CTPS.
================================================================================
CM$VER      3.04.05     03/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.08
- Consultas / Tabulação Pontual de Pesquisa:
  * Inclusão da alternativa de corte, que permite excluir dos cálculos do mercado
    os valores com desvio da média acima do percentual especificado.
- Consultas / Relatórios / RH - ... / Oper... / Tabulação de Pesquisa:
  * Inclusão da alternativa de corte, que permite excluir dos cálculos do mercado
    os valores com desvio da média acima do percentual especificado.
  * Inclusão da opção para as empresas constarem com seus nomes ou códigos.
================================================================================
CM$VER      3.04.04     09/05/2005
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Operacionais / Alterações Funcionais:
  * Foi alterado para não exibir mais uma mensagem de erro quando não há dados.
================================================================================
CM$VER      3.04.03     01/02/2005
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Correção na inclusão de mais de um registro por vez.
================================================================================
CM$VER      3.04.02     07/01/2005
--------------------------------------------------------------------------------
- Sincronização de funções liberadas pela Folha de Pagamento (Versão 4.11.05).
================================================================================
CM$VER      3.04.01     02/12/2004
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional:
  * Correção do erro   >    '' is not a valid floating point value
================================================================================
CM$VER      3.04.00     01/10/2004
--------------------------------------------------------------------------------
- Transações / Registro de Alteração Funcional / Opção de Cargo Alternativo:
  * Foram inseridos campos para seleção do salário do cargo alternativo.
================================================================================
CM$VER      3.03.01     28/06/2004
--------------------------------------------------------------------------------
- Transações / Simulação/Implementação de Aumentos:
  * Implementada a possibilidade de fazer o reajuste de pessoas demitidas.
================================================================================
CM$VER      3.03.00     14/06/2004
--------------------------------------------------------------------------------
- Transações / Simulação/Implementação de Aumentos:
  * Correção na geração dos aumentos quando existia ao menos uma pessoa que
    estivesse com o salário zerado.
- Introdução do Orçamento do Quadro de Pessoal (Manpower), composto
  dos itens abaixo listados e que possibilita estabelecer-se uma previsão
  para cada mês, de cada ano, da quantidade de pessoas a ocupar cada posto
  de trabalho, entendendo-se como tal a combinação: Empresa, Estabelecimento,
  Centro de Custo, Cargo. O sistema também tem recursos para exibir a
  comparação Orçado x Real.
- Cadastros / Orçamento da Quantidade de Pessoal (Manpower):
  * Nesta tela, registra-se o orçamento de cada posto, para cada mês, de
    cada ano desejado.
- Consultas / Orçamento do Custo de Pessoal / Botão Orçamento / Integração ...:
  * Nesta tela, agora é possível optar-se por integrar o resultado do Número de
    Pessoas neste próprio módulo e não com o Módulo de Orçamento. Com isto,
    pode-se alimentar o Orçamento do Quadro de Pessoal para o ano todo, de
    acordo com o resultado aqui obtido.
- Consultas / Orçamento da Quantidade de Pessoal:
  * Esta tela exibe a comparação Orçado x Real para as condições selecionadas
    e permite, também, emitir um relatório desse comparativo.
================================================================================
CM$VER      3.02.22     20/05/2004
--------------------------------------------------------------------------------
- Transações / Simulação/Implementação de Aumentos:
  * Para o Percentual de Aumento Único não é mas necessário que somente um dos valores sejam
    informados. Ex: O usuário pode agora fazer um aumento de 20% junto junto com a especificação
    de um piso de R$600,00;
  * Correção do problema que fazia com que fosse obrigado a pressionar duas vezes o botão OK após
    a digitar algum valor de faixa;
  * Correção da efetivação de Aumentos Salariais quando era utilizada a opção percentual por faixa.
    Era gerado um Histórico de Evolução Funcional mesmo para quem não teve aumento.
================================================================================
CM$VER      3.02.21     10/05/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / ... / Alterações Funcionais:
  * A escolha de um único estabelecimento foi substituída pela escolha de múltiplos
    estabelecimentos da empresa proprietária que está "logada". Mesmo que esta tenha
    apenas um estabelecimento, este já vem marcado na abertura da tela, facilitando
    a operação ao usuário.
================================================================================
CM$VER      3.02.20     14/04/2004
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
================================================================================
CM$VER      3.02.19     28/10/2003
--------------------------------------------------------------------------------
- Simulação / Implementação de Aumentos:
  * Acerto na gravação da identificação da Empresa e Estabelacimento da Pessoa
  no Registro de Alterações Funcionais.
================================================================================
CM$VER      3.02.18     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.02.17     25/08/2003
--------------------------------------------------------------------------------
- Análise das Solicitações de Alteração Funcional e Solicitação de Alteração Funcional:
  * Ajuste nas margens de impressão de uma Carta ou Comunicado.
================================================================================
CM$VER      3.02.16     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Registro de Alteração Funcional;
  * Histórico da Evolução Funcional.
================================================================================
CM$VER      3.02.15     06/06/2003
--------------------------------------------------------------------------------
- Solicitação de Alteração Funcional:
  * Alteração no layout da tela.
- Análise das Solicitações de Alteração:
  * Alteração no layout da tela;
  * Exclusão dos botões de Alteração e Restauração do Layout da Carta/Comunicado.
================================================================================
CM$VER      3.02.14     02/06/2003
--------------------------------------------------------------------------------
- Relatório Alterações Funcionais:
  * Retirado o campo de seleção dos Tipos de Papel.
================================================================================
CM$VER      3.02.13     28/03/2003
--------------------------------------------------------------------------------
- Cadastro de Cargos:
  * Agora é permitida a seleção dos CBOs (1994 e 2002) a partir
  de uma tela de seleção Padrão.
================================================================================
CM$VER      3.02.12     10/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      3.02.11     21/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.16i
================================================================================
CM$VER      3.02.10     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.02.09     10/02/2003
--------------------------------------------------------------------------------
- Tela de Parâmetros do Sistema:
  * Inclusão da opção para dois Cargos.
================================================================================
CM$VER      3.02.08     04/12/2002
--------------------------------------------------------------------------------
- Implementação da Metodologia Hay, com reflexo em:
  * Sistema / Configurção / Parâmetros
    onde o usuário opta pelo seu uso ou não.
  * Cadastros / Cargos
    onde se informa os Pontos Hay do cargo e o sistema calcula
  e exibe o Valor Referência Hay.
  * Cadastros / Tabela Hay
    onde se alimentam as faixas de pontuação e seus respectivos
  parâmetros de cálculo.
  * Transações / Registro de Alteração Funcional e Solicitação
  de Alteração Funcional onde, se estiver usando Hay, o valor de
  referência será exibido nas alterações de salário.
  * Consultas / Relatórios / RH - Cargos ... / Operacionais /
  Inconsistências Salariais onde, se estiver usando Hay, as
  inconsistências serão calculadas em torno do valor de
  referência de cada cargo, utilizando-se fatores (minimo e máximo)
  especificados na hora.
================================================================================
CM$VER      3.02.07     14/11/2002
--------------------------------------------------------------------------------
- Orçamento de Custo de Pessoal:
  * Unificação das Telas (até então existia uma tela para o Usuário indicar os parâmetros
  gerais do Orçamento e outra para a seleção das Pessoas);
- Tabulação Pontual de Pesquisa:
  * O Gráfico é exibido em duas páginas (Real e Nominal) ao contrário de antes que era
  necessário fechar a tela do primeiro Gráfico para que fosse visualizado o segundo.
================================================================================
CM$VER      3.02.06     31/10/2002
--------------------------------------------------------------------------------
- Correção Coletiva de Faixas Salariais:
  * Remodelagem no Layout da Tela;
  * A pergunta: "Atualiza os Salários dos Empregados?" foi incluída como uma opção na tela.
- Simulação/Implementação de Aumentos:
  * Unificação das Telas (até então existia uma tela para o Usuário indicar os valores das
  Faixas e outra para a seleção das Pessoas);
  * A pergunta: "Deseja imprimir Etiquetas de Atualização?" foi incluída como uma opção na
  Tela de Efetivação;
  * Os botões de Configuração e Restauração do Layout da Etiqueta de Atualização foram
  retirados da Tela de Efetivação. Caso o usuário queira fazer uma destas ações, deverá
  utilizar o procedimento Padrão para Configuração de Relatórios.
================================================================================
CM$VER      3.02.05     22/10/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.02.04     03/10/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.02.03     29/08/2002
--------------------------------------------------------------------------------
- Distribuição de Cargos por Faixa Salarial (e por Grupo Funcional)
  * A tela foi revista e renomeada (antes constava como Pontuação por Faixa Salarial).
================================================================================
CM$VER      3.02.02     16/07/2002
--------------------------------------------------------------------------------
- Solicitação de Alteração Funcional
  * Se houver alteração de cargo, vai buscar o Nível 1 da Faixa
    automaticamente.
================================================================================
CM$VER      3.02.01     13/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.02.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.01.03     23/05/2002
--------------------------------------------------------------------------------
- Consultas / Orçamento do Custo de Pessoal
  * Foi implementada a opção para integrar o resultado apurado com o Módulo de 
    Planejamento e Orçamento, alimentando o Valor Orçado das contas que forem 
    indicadas.
- Transações / Dados para Pesquisa Salarial
  * Ambas as telas foram reformuladas para ficar mais eficientes e de uso mais fácil.
================================================================================
CM$VER      3.01.02     03/05/2002
--------------------------------------------------------------------------------
- Histórico das Faixas Salariais (para empresas do tipo "Fundo de Pensão")
  * Esse histórico é atualizado quando alguma faixa é modificada, seja individualmente em
     Cadastros / Faixas Salariais, ou coletivamente em Transações / Correção Coletiva...
  * Esse histórico pode ser visualizado em Cadastros / Faixas Salariais, através do botão 
     Histórico das Faixas Salariais.
- Solicitação de Alteração Funcional
  * Passou a criar um processo RAD;
  * Novas alternativas de mudança no salário.
================================================================================
CM$VER      3.01.01     25/04/2002
--------------------------------------------------------------------------------
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de
    Usuários, o que até então não era permitido.
================================================================================
CM$VER      3.01.00     08/04/2002
--------------------------------------------------------------------------------
- Registro de Alteração Funcional e Consulta do Histórico da Evolução Funcional
 * Foi acrescentada a informação referente ao Cargo Alternativo / Função, válido para as 
    empresas que tenham optado por "Dois Cargos".
================================================================================
CM$VER      3.00.03     25/02/2002
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.00.02     08/08/2001
--------------------------------------------------------------------------------
- Acerto no Relatório Inconsistências Salariais,
================================================================================
CM$VER      3.00.01     18/06/2001
--------------------------------------------------------------------------------
- Acerto no erro da Análise das Solicitações de Alteração quando era pressionado o botão Ok (mensagem: "BDE 10768 - Table does not support this operation because it is not uniquely indexed").
================================================================================
CM$VER      3.00.00     24/05/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5.
================================================================================
CM$VER      2.02.06     07/03/2001
--------------------------------------------------------------------------------
- Os relatórios: Emissão das Faixas Salariais e Inconsistências Salariais foram retirados do menu Relatórios e Gráficos Fixos e incluídos no menu Consultas/Relatórios, item RH - Cargos e Salários / Operacionais;
- Melhorias internas em algumas telas;
- Incluído a capacidade de Imprimir, Configurar e Restaurar o formato de Cartas ou Comunicados nas opções: Solicitação de Alteração Funcional e Análize das Solicitações de Alteração;
- Incluído a capacidade de Imprimir, Configurar e Restaurar o formato de Etiquetas para a Atualização da CTPS nas opções: Simulação / Implementação de Aumentos e Registro de Alteração Funcional.
================================================================================
CM$VER      2.02.05     29/01/2001
--------------------------------------------------------------------------------
- Melhorias nas telas de Registro e Consulta ao Histórico da Evolução Funcional
================================================================================
CM$VER      2.02.04     01/12/2000
--------------------------------------------------------------------------------
- Alteração no tratamento dos Benefícios que constam na Folha de Pagamento,
para efeito de Orçamento e Pesquisa Salarial.
================================================================================
CM$VER      2.02.03     15/09/2000
--------------------------------------------------------------------------------
- Correção no Registro de Alteração Funcional.
================================================================================
CM$VER      2.02.02     05/09/2000
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.02.01     22/08/2000
--------------------------------------------------------------------------------
- Compatibilização com o Padrão;
- Alguns acertos internos.
================================================================================
CM$VER      2.02.00     07/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor).
================================================================================
CM$VER      2.01.08     19/07/2000
--------------------------------------------------------------------------------
- Correção na seleção de pessoas por faixa etária.
================================================================================
CM$VER      2.01.07     31/05/2000
--------------------------------------------------------------------------------
- Alteração na tela de Solicitação de Alteração Funcional, para fazer a sua
abertura mais rápida.
================================================================================
CM$VER      2.01.06     23/03/2000
--------------------------------------------------------------------------------
- Nova Atualização com o Padrão CM.
================================================================================
CM$VER      2.01.05     02/03/2000
--------------------------------------------------------------------------------
- Acerto das telas de Simulação de Aumento Salarial e Orçamento do Custo de
Pessoal, que apresentavam uma mensagem de erro na versão 2.1.4.
================================================================================
CM$VER      2.01.04     01/03/2000
--------------------------------------------------------------------------------
- Novas opções de seleção de demitidos (por data e por motivo) nas consultas e
relatórios do módulo, onde isto se aplica.
================================================================================
CM$VER      2.01.01     16/11/1999
--------------------------------------------------------------------------------
- Ampliação das opções de sequência na seleção de pessoas.
================================================================================
CM$VER      2.01.00     13/10/1999
--------------------------------------------------------------------------------
- Compatibilização com o Padrão Pós 4.25.
================================================================================
CM$VER      2.00.07     13/09/1999
--------------------------------------------------------------------------------
- Correção na seleção de empregados por Centro de Custo.
================================================================================
CM$VER      2.00.06     16/08/1999
--------------------------------------------------------------------------------
- Melhoria no desempenho de algumas telas de consulta e relatórios.
================================================================================
CM$VER      2.00.05     29/05/1999
--------------------------------------------------------------------------------
- Correção do Título do Módulo.
================================================================================
CM$VER      2.00.04     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.00.03     05/04/1999
--------------------------------------------------------------------------------
- Alterações feitas pelo Sr. Eugênio.
================================================================================
CM$VER      2.00.02     31/03/1999
--------------------------------------------------------------------------------
- Alterações feitas pelo Sr. Eugênio.
================================================================================
CM$VER      2.00.01     25/03/1999
--------------------------------------------------------------------------------
- Foi retirado do projeto o FCMSobre e o FSobre, e todas as sua referências.
================================================================================
CM$ALT}
























































































































































































