program ModAsm;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  fCuboOcorr in 'fCuboOcorr.pas' {frmCuboOcorr},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  UModulo in 'uModulo.pas',
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fParamPCMSO in '..\Reports\Source\fParamPCMSO.pas' {frmParamPCMSO},
  fParamTabPer in '..\Reports\Source\fParamTabPer.pas' {frmParamTabPer},
  fParamTabCID in '..\Reports\Source\fParamTabCID.pas' {frmParamTabCID},
  fParamOcorrExames in '..\Reports\Source\fParamOcorrExames.pas' {frmParamOcorrExames},
  fParamOcorrPess in '..\Reports\Source\fParamOcorrPess.pas' {frmParamOcorrPess},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadPeriodo in '..\FontesMT\fCadPeriodo.pas' {frmCadPeriodo},
  fCadOcorr in '..\FontesMT\fCadOcorr.pas' {frmCadOcorr},
  fHstOcorr in '..\FontesMT\fHstOcorr.pas' {frmHstOcorr},
  fCadCID in '..\FontesMT\fCadCID.pas' {frmCadCID},
  uCmCtrlRptModAsm in '..\CtrlObjetos\uCmCtrlRptModAsm.pas',
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fParamProgTipo in '..\Reports\Source\fParamProgTipo.pas' {frmParamProgTipo},
  fParamProgPess in '..\Reports\Source\fParamProgPess.pas' {frmParamProgPess},
  RProgTipo in '..\Reports\Source\RProgTipo.pas' {RptProgTipo},
  RProgPess in '..\Reports\Source\RProgPess.pas' {RptProgPess},
  RPCMSO in '..\Reports\Source\RPCMSO.pas' {RptPCMSO},
  RTabCID in '..\Reports\Source\RTabCID.pas' {RptTabCID},
  ROcorrExames in '..\Reports\Source\ROcorrExames.pas' {RptOcorrExames},
  RTabPer in '..\Reports\Source\RTabPer.pas' {RptTabPer},
  ROcorrPess in '..\Reports\Source\ROcorrPess.pas' {RptOcorrPess},
  ROcorrTipo in '..\Reports\Source\ROcorrTipo.pas' {RptOcorrTipo},
  fSelEstOcorr in '..\FontesMT\fSelEstOcorr.pas' {frmSelEstOcorr},
  fParamRelCAT in '..\Reports\Source\fParamRelCAT.pas' {frmParamRelCAT},
  RCAT in '..\Reports\Source\RCAT.pas' {RptCAT},
  fLancaFalta in '..\FontesMT\fLancaFalta.pas' {frmLancaFalta},
  fCadRegOcorr in '..\FontesMT\fCadRegOcorr.pas' {frmCadRegOcorr},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  fCadPpraMeio in '..\FontesMT\fCadPpraMeio.pas' {frmCadPpraMeio},
  fCadPpraAcoes in '..\FontesMT\fCadPpraAcoes.pas' {frmCadPpraAcoes},
  fCadPpraAgenteRisco in '..\FontesMT\fCadPpraAgenteRisco.pas' {frmCadPpraAgenteRisco},
  fCadPpraAval in '..\FontesMT\fCadPpraAval.pas' {frmCadPpraAval},
  fCadPpraCipa in '..\FontesMT\fCadPpraCipa.pas' {frmCadPpraCipa},
  fCadPpraCipaFuncao in '..\FontesMT\fCadPpraCipaFuncao.pas' {frmCadPpraCipaFuncao},
  fCadBemEPI in '..\FontesMT\fCadBemEPI.pas' {frmCadBemEPI},
  RPPP in '..\Reports\Source\RPPP.pas' {RptPPP},
  RFichaAvalPPRA in '..\Reports\Source\RFichaAvalPPRA.pas' {RptFichaAvalPPRA},
  fParamPPP in '..\Reports\Source\fParamPPP.pas' {frmParamPPP},
  fCadClasseBem in '..\FontesMT\fCadClasseBem.pas' {frmCadClasseBem},
  fCadLocalizacao in '..\..\Shared\ModComp\FontesMT\fCadLocalizacao.pas' {frmCadLocalizacao},
  fCondicaoDifTrab in '..\FontesMT\fCondicaoDifTrab.pas' {frmCondicaoDifTrab};

{$R *.RES}
{$R MODASM_RES.RES}


Begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'RH - Medicina de Trabalho';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Medicina do Trabalho
================================================================================
CM$VER      3.04.02     26/06/2008
--------------------------------------------------------------------------------
Pendencia : 27569.
Inserindo Help nas telas do padrão.
================================================================================
CM$VER      3.04.01     07/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.04.00     18/12/2007
--------------------------------------------------------------------------------
- Inclusão de um campo, no Cadastro de Tipos de Ocorrências e Exames Médicos,
  para identificar se a ocorrência se refere a Acidente de Trabalho. Esta 
  alteração tem reflexo nas seguintes telas e relatórios:
- Cadastros / Ocorrências e Exames Médicos:
  * Foi incluída uma caixa para ser feita essa indicação, que só fica visível
    se a ocorrência for do tipo "Aleatória".
- Transações / Registro de Ocorrência Médica:
  * O botão que aciona a impressão do CAT (Comunicado de Acidente de Trabalho) 
    só fica habilitado se a ocorrência estiver identificada como tal.
- Consultas / Relatórios / RH ... / Operacionais / PPP:
  * O sistema agora imprime as informações relativas a CAT's.
================================================================================
CM$VER      3.03.12     25/08/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Operacionais / PPP:
  * Adequação do layout à Instrução Normativa INSS/DC Nº 99/2003;
  * Opção para não imprimir o Item 17, conforme resolução do CFM Nº 1715/2004.
================================================================================
CM$VER      3.03.11     27/04/2004
--------------------------------------------------------------------------------
* Registro de Ocorrência Médica:
  Ao selecionar um examinador através do botão de procura correspondente,
  passa a filtrar somente os Fornecedores.
================================================================================
CM$VER      3.03.10     14/04/2004
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
================================================================================
CM$VER      3.03.09     28/01/2004
--------------------------------------------------------------------------------
- Cadastros / PPRA - Agentes de Risco:
  * Acréscimo das categorias "Ergonômico" e "Mecânico" na tela de busca.
================================================================================
CM$VER      3.03.08     27/01/2004
--------------------------------------------------------------------------------
- Transações / Avaliação PPRA:
  * Acerto na inserção de uma avaliação.
================================================================================
CM$VER      3.03.07     27/01/2004
--------------------------------------------------------------------------------
- Cadastros / PPRA - Agentes de Risco:
  * Acréscimo das categorias "Ergonômico" e "Mecânico" na caixa "Tipo de Agente".
- Consultas / Relatórios / RH... / Operacionais / PPP:
  * Inclusão da Opção para emitir o PPP para uma só pessoa;
  * Adequação do desenho à INSTRUÇÃO NORMATIVA INSS/DC Nº /2003 (como consta no site da
    Previdência Social, datada de 02/12/2003).
================================================================================
CM$VER      3.03.06     16/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.03.05     04/08/2003
--------------------------------------------------------------------------------
- Transações / PPRA - Avaliações:
  * Correção na gravação das abas referentes a Agentes e Medidas, quando estas eram
     inseridas na mesma operação de inserção da avaliação.
- Consultas / Relatórios / RH ... / Operacionais / Programação de Testes/Exames /
   Por Pessoa e Por Tipo:
  * Para evitar confusão ao usuário, se ele optar por Seleciona Período = Não, agora a 
     caixa para especificação das datas fica invisível.
================================================================================
CM$VER      3.03.04     08/07/2003
--------------------------------------------------------------------------------
- Cadastros:
  - Acertos nas telas de CIPA e PPRA - Bens ...
================================================================================
CM$VER      3.03.03     20/06/2003
--------------------------------------------------------------------------------
- PPP - Perfil Proffissiográfico Previdenciário
  * Revisão do formato e informações contidas, de forma a se
    adequar à Instrução Normativa INSS/DC Nº 84/2002.
================================================================================
CM$VER      3.03.02     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Cadastro de CIPA (Comissão Interna de Prevenção de Acidentes);
  * Registro de Ocorrências, Testes e Exames;
  * Histórico de Ocorrências Médicas.
================================================================================
CM$VER      3.03.01     02/06/2003
--------------------------------------------------------------------------------
- Registro Ocorrências Médicas:
  * Acerto na gravação da hora.
================================================================================
CM$VER      3.03.00     17/04/2003
--------------------------------------------------------------------------------
- Incorporação do PPRA - Programa de Prevenção de Riscos Ambientais:
  * Em Cadastros, alimentam-se as tabelas requeridas pelo PPRA e CIPA.
  * Em Transações, registram-se as Avaliações PPRA e seu desdobramento, e pode-se 
     imprimir a Ficha da Avaliação PPRA.
- Incorporação do PPP - Perfil Profissiográfico (para o INSS):
  * Em Consultas/Relatórios/RH - Medic../Operacionais, obtém-se esta ficha que passa a
    ser uma exigência do INSS para determinadas atividades que envolvem risco para o 
    segurado da Previdência. Algumas informações nela constantes são provenientes das
   Avaliações PPRA, portanto a implantação destas funcionalidades deve correr em paralelo.
================================================================================
CM$VER      3.02.12     10/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      3.02.11     21/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.16i
================================================================================
CM$VER      3.02.10     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.02.09     10/02/2003
--------------------------------------------------------------------------------
- Registro Ocorrências Médicas:
  * Acerto na visualização do campo Data Retorno;
  * Acerto na mudança automática entre os campos Data Retorno e Número de Dias de Licença.
================================================================================
CM$VER      3.02.08     03/12/2002
--------------------------------------------------------------------------------
- Programação de Testes / Exames por Pessoa:
  * Correção na Seleção dos Tipos de Ocorrência.
================================================================================
CM$VER      3.02.07     22/10/2002
--------------------------------------------------------------------------------
- Estatística de Ocorrências Médicas:
  * Agora apresenta todos os parâmetros de seleção na mesma tela (Seleção de Pessoal e
  Dados do Gráfico).
================================================================================
CM$VER      3.02.06     18/10/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.02.05     11/10/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.02.04     29/08/2002
--------------------------------------------------------------------------------
- Relatórios de Programação de Exames / Testes:
  * Reformulação e transferência para Consultas / Relatórios / Operacionais.
================================================================================
CM$VER      3.02.03     29/07/2002
--------------------------------------------------------------------------------
- Emissão da Ficha PCMSO
  * Foi acrescentada opção para exibir Avaliação e Observações no resultado.
- Cadastro CID
  * Coorreção na busca de um registro.
- Cadastro de Periodicidades
  * Busca apenas os eventos cadastrados como programáveis.
================================================================================
CM$VER      3.02.02     15/07/2002
--------------------------------------------------------------------------------
- Registro de Ocorrência
  * Foi corrigida a exibição do Botão que aciona a impressão da Ficha
    (ou Guia) PCMSO;
  * O formato da Ficha foi bastante alterado, para adequar-se a um
    modelo mais usual.
================================================================================
CM$VER      3.02.01     13/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.02.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.01.00     10/05/2002
--------------------------------------------------------------------------------
- Transações / Registro de Ocorrência Médica
  * Na Data Planejada, é possível agora marcar a Hora, que vai constar também na Ficha.
  * Se for encontrado o Médico / Entidade pelo Botão de Busca, a sua identificação fica 
    registrada, e o seu endereço completo vai constar na Ficha.
  * A busca de empregados ou candidatos agora é feita por botões diferenciados.
  * Quando o registro for para candidato, o campo Licença não é mais exibido.
- Cadastros / CID
  * A tabela foi reestruturada, de forma a permitir o Código alfanumérico e descrições 
     bem mais longas do que antes. A tabela anterior foi / será apagada por "scripts" de 
     atualização do Banco de Dados. Nova tabela TXT está disponível para ser importada
     através do RH - Módulo Básico (em Sistema / Utilitários / Importação Direta).
     Nesta importação, deve-se especificar tamanho 7 para o campo CODCID e 1020 
     para o campo DESCRCID.
- Consultas / Relatórios / RH - ... / Operacionais / Ocorrências Médicas
  * Em ambos os relatórios, pode-se agora filtrar Pessoas, Tipos de Ocorrência e CID.
  * Nas informações listadas, foram acrescentadas: Data Planejada, CID e Licença.
  * No rodapé, foi acrescentada informação sobre o % de absenteísmo.
================================================================================
CM$VER      3.00.06     17/04/2002
--------------------------------------------------------------------------------
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de
    Usuários, o que até então não era permitido.
================================================================================
CM$VER      3.00.05     01/04/2002
--------------------------------------------------------------------------------
- Registro de Ocorrências
  * Ao se inserir ou alterar um exame de candidato, com avaliação correspondente a 
     "Apto", o sistema agora pergunta se o usuário deseja efetivar esse candidato.
================================================================================
CM$VER      3.00.04     25/02/2002
--------------------------------------------------------------------------------
- Alterações na emissão da Ficha de PCMSO.
================================================================================
CM$VER      3.00.03     26/12/2001
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.00.02     18/06/2001
--------------------------------------------------------------------------------
- O relatório Tabela de Ocorrências e Exames foi retirado da opção de menu Relatórios e Gráficos Fixos e está em Consulta / Relatórios / Cadastrais / Ocorrências e Exames;
- O relatório Periodicidades dos Exames foi retirado da opção de menu Relatórios e Gráficos Fixos e está em Consulta / Relatórios / Cadastrais / Tabela de Periodicidades dos Exames.
================================================================================
CM$VER      3.00.01     09/05/2001
--------------------------------------------------------------------------------
- Acerto na Tela de Registro de Ocorrências Médicas:
  * Quando era inserido uma nova ocorrência e indicado que esta será registrada como Falta ocorria o erro "Field 'NORMALINI' not found".
================================================================================
CM$VER      3.00.00     09/04/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5;
- Agora o relatório em "Tabela CID" se localiza em Consultas / Relatórios / Cadastrais e não em Relatórios e Gráficos Fixos / Tabelas / CID.
================================================================================
CM$VER      2.03.01     29/01/2001
--------------------------------------------------------------------------------
- Cadastro de Ocorrências e Exames
  Criação do campo Tipo de Ocorrência, para indicar se é Programável ou Aleatória;
- Registro de Ocorrência Médica
  Em função do tipo acima, esta tela agora oferece opções diferenciadas de campos a 
  serem informados e/ou exibidos.
================================================================================
CM$VER      2.02.03     19/12/2000
--------------------------------------------------------------------------------
- Cadastro de Ocorrências e Exames
  Criação do campo Tipo de Ocorrência, para indicar se é Programável ou Aleatória;
- Registro de Ocorrência Médica
  Em função do tipo acima, esta tela agora oferece opções diferenciadas de campos a 
  serem informados e/ou exibidos.
================================================================================
CM$VER      2.02.02     23/10/2000
--------------------------------------------------------------------------------
- Foi implementada a opção para lançar os dias de licença como Faltas.
  Pré-requisito: ter a Folha de Pagamento operacional e, nela, haver indicado qual a rubrica 
  utilizada para lançar as faltas (em Sistema/Configuração/Parâmetros do Sistema).
================================================================================
CM$VER      2.02.01     05/09/2000
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.02.00     01/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor);
- Reformulação da tela de Registro de Ocorrências.
================================================================================
CM$VER      2.01.07     19/07/2000
--------------------------------------------------------------------------------
- Correção na seleção de pessoas por faixa etária.
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
CM$VER      2.00.05     13/09/1999
--------------------------------------------------------------------------------
- Correção na seleção de empregados por Centro de Custo.
================================================================================
CM$VER      2.00.04     16/08/1999
--------------------------------------------------------------------------------
- Melhoria no desempenho de algumas telas de consulta e relatórios.
================================================================================
CM$VER      2.00.03     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.00.02     09/04/1999
--------------------------------------------------------------------------------
- Foi renomeado o Label do quickreport para LabelFixo.
================================================================================
CM$VER      2.00.01     25/03/1999
--------------------------------------------------------------------------------
- Foi retirado do projeto o FCMSobre e o FSobre, e todas as suas referências.
================================================================================
CM$ALT}
































































































































































