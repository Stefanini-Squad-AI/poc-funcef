program ModRes;

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
  UModulo in 'uModulo.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadTipAval in '..\..\Shared\ModComp\FontesMT\fCadTipAval.pas' {frmCadTipAval},
  fCadExper in '..\FontesMT\fCadExper.pas' {frmCadExper},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadAvalReq in '..\FontesMT\fCadAvalReq.pas' {frmCadAvalReq},
  fCadFonte in '..\FontesMT\fCadFonte.pas' {frmCadFonte},
  fHstAval in '..\FontesMT\fHstAval.pas' {frmHstAval},
  fCadRegAval in '..\..\Shared\ModComp\FontesMT\fCadRegAval.pas' {frmCadRegAval},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  fParamRotat in '..\Reports\Source\fParamRotat.pas' {frmParamRotat},
  fParamRequi in '..\Reports\Source\fParamRequi.pas' {frmParamRequi},
  RRequi in '..\Reports\Source\RRequi.pas' {RptRequi},
  uCmCtrlRptModRes in '..\CtrlObjetos\uCmCtrlRptModRes.pas',
  RRotat in '..\Reports\Source\RRotat.pas' {RptRotat},
  fElimCand in '..\FontesMT\fElimCand.pas' {frmElimCand},
  fCadRegTreinCand in '..\FontesMT\fCadRegTreinCand.pas' {frmCadRegTreinCand},
  fElimReq in '..\FontesMT\fElimReq.pas' {frmElimReq},
  fCadExpReq in '..\FontesMT\fCadExpReq.pas' {frmCadExpReq},
  fCadRegExp in '..\FontesMT\fCadRegExp.pas' {frmCadRegExp},
  fSelEstRecr in '..\FontesMT\fSelEstRecr.pas' {frmSelEstRecr},
  fSelEstDem in '..\FontesMT\fSelEstDem.pas' {frmSelEstDem},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadRequi in '..\FontesMT\fCadRequi.pas' {frmCadRequi},
  RReqPessoal in '..\..\Shared\ModComp\Reports\Source\RReqPessoal.pas' {RptReqPessoal},
  fImportaCand in '..\FontesMT\fImportaCand.pas' {frmImportaCand},
  fCadFunc in '..\..\Shared\ModComp\FontesMT\fCadFunc.pas' {frmCadFunc},
  fCadCand in '..\..\Shared\ModComp\FontesMT\fCadCand.pas' {frmCadCand},
  RDossieCand in '..\Reports\Source\RDossieCand.pas' {RptDossieCand},
  fParamDossieCand in '..\Reports\Source\fParamDossieCand.pas' {frmParamDossieCand},
  RFichaFunc in '..\..\Shared\ModComp\Reports\Source\RFichaFunc.pas' {RptFichaFunc},
  fParamFichaFunc in '..\..\Shared\ModComp\Reports\Source\fParamFichaFunc.pas' {frmParamFichaFunc},
  fSelPess in '..\FontesMT\fSelPess.pas' {frmSelPess},
  fPreSelec in '..\FontesMT\fPreSelec.pas' {frmPreSelec},
  RPotencCandReq in '..\Reports\Source\RPotencCandReq.pas' {RptPotencCandReq},
  fParamContrat in '..\Reports\Source\fParamContrat.pas' {frmParamContrat},
  RContrat in '..\Reports\Source\RContrat.pas' {RptContrat},
  fRegistraOcorr in '..\..\Shared\ModComp\FontesMT\fRegistraOcorr.pas' {frmRegistraOcorr},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fCadInstituicaoEnsino in '..\FontesMT\fCadInstituicaoEnsino.pas' {frmCadInstituicaoEnsino},
  fCadAgenteIntegracao in '..\FontesMT\fCadAgenteIntegracao.pas' {frmCadAgenteIntregracao},
  FObservacaoCTemp in '..\..\Shared\ModComp\FontesMT\FObservacaoCTemp.pas' {frmObservacaoCTemp};

{$R *.RES}
{$R MODRES_RES.RES}

Begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'RH - Recrutamento e Seleção';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Recrutamento e Seleção
================================================================================
CM$VER      3.05.06     26/06/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.05.05     17/07/2007
--------------------------------------------------------------------------------
(Pendência 25853)
- Consultas / Relatórios / RH ... / Operacionais / Rotatividade (Turnover) de Pessoal:
  * Acerto da inclusão do nome do Centro de Custo no cabeçalho, nos casos aplicáveis.
================================================================================
CM$VER      3.05.04     18/05/2007
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH - ... / Oper... / Rotatividade (Turnover):
  * Agora consta o C.Custo no cabeçalho, caso este filtro seja usado
================================================================================
CM$VER      3.05.03     15/12/2005
--------------------------------------------------------------------------------
- Cadastros / Candidato:
  * Correção da abetura da tela (vinha com a aba dos Dados Pessoais).
================================================================================
CM$VER      3.05.02     20/05/2004
--------------------------------------------------------------------------------
- Transações / Requisição de Pessoal:
  * Implementada a limitação dos campos de observação ao máximo possível.
================================================================================
CM$VER      3.05.01     18/05/2004
--------------------------------------------------------------------------------
- Transações / Requisição de Pessoal:
  * Correção na inclusão de um candidato. O botão de Ok do candidato não inseria o mesmo.
- Consultas / Relatórios / RH... / Requisição de Pessoal:
  * Correção na contagem do número de requisições quando esta possuía mais de um candidato.
================================================================================
CM$VER      3.05.00     26/04/2004
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
- Transações / Requisição de Pessoal:
  * Foi incluído um campo texto para se escrever a formação e especialização requeridas 
    para o cargo;
  * Foi incluído um campo texto para preenchimento das principais atividades a serem 
    realizadas;
  * Foi implementado um botão que permite fazer uma cópia da requisição que está na tela.
================================================================================
CM$VER      3.04.07     16/03/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH - ... / Dossiê do Candidato:
  * Acerto na seleção do endereço.
================================================================================
CM$VER      3.04.06     05/12/2003
--------------------------------------------------------------------------------
- Cadastros / Candidatos:
  * O sistema não obriga mais o CPF, mesmo que a nível global assim seja definido.
- Transações / Requisição de Pessoal:
  * Inclusão da informação "Salário a Pagar".
================================================================================
CM$VER      3.04.05     16/09/2003
--------------------------------------------------------------------------------
- Ficha Funcional:
  * A caixa de seleção relaciona todas as pessoas e não somente as Ativas e Afastadas
  como era feito até então.
================================================================================
CM$VER      3.04.04     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.04.03     03/09/2003
--------------------------------------------------------------------------------
- Seleção de Candidatos:
  * Acerto na chamada da Lista e Ficha.
================================================================================
CM$VER      3.04.02     07/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Operacionais / Requisições de Pessoal:
  * Impressão do Nome Fantasia do Estabelecimento ao invés da Razão Social.
================================================================================
CM$VER      3.04.01     21/07/2003
--------------------------------------------------------------------------------
- Consultas / Seleção de Candidatos / Exibição de Candidatos Internos / Ficha Funcional
  * Inclusão da opção para Avaliação Hay, disponível para as empresas que utilizam
     a Metodologia Hay em sua administração de Cargos e Salários.
================================================================================
CM$VER      3.04.00     04/07/2003
--------------------------------------------------------------------------------
- Transações / Requisição de Pessoal - Inclusão dos campos:
  * Responsável do RH pela seleção;
  * Motivo da substituição;
  * Supervisor imediato (exibido pelo sistema, com base em dados cadastrados);
  * Outros gestores envolvidos (idem acima).
================================================================================
CM$VER      3.03.19     12/06/2003
--------------------------------------------------------------------------------
- Inclusão do Relatório de Contratações por Tipo de Contrato / Mês que se encontra em
  Consultas / Relatórios / RH ... / Operacionais.
================================================================================
CM$VER      3.03.18     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Registro de Outras Avaliações e Entrevistas;
  * Registro e Histórico de Experiências;
  * Requisições de Pessoal;
  * Histórico de Testes e Entrevistas.
- Relatório de Rotatividade (Turnover) de Pessoal:
  * Inclusão de um Resumo no final do mesmo que só é impresso quando o
  relatório for gerado com mais de um estabelecimento.
================================================================================
CM$VER      3.03.17     02/06/2003
--------------------------------------------------------------------------------
- Seleção de Pessoal:
  * Mudança no Layout da tela.
================================================================================
CM$VER      3.03.16     14/05/2003
--------------------------------------------------------------------------------
- Requisição de Pessoal:
  * Ampliação do campo de observação do RAD.
================================================================================
CM$VER      3.03.15     17/04/2003
--------------------------------------------------------------------------------
- Cadastro de Requisições:
  * Mudança na forma de selecionar o Centro de Custo. Na caixa de
  seleção do mesmo, poderá ser digitado o nome e na caixa de edição
  acima virá o código.
================================================================================
CM$VER      3.03.14     10/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      3.03.13     21/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.16i
================================================================================
CM$VER      3.03.12     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.03.11     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.03.10     05/02/2003
--------------------------------------------------------------------------------
- Importação de Candidatos:
  * Mudancas no Layout da tela.
================================================================================
CM$VER      3.03.09     30/01/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.12i.
================================================================================
CM$VER      3.03.08     16/01/2003
--------------------------------------------------------------------------------
- Requisição de Pessoal:
  * Número será gerado sequencialmente.
================================================================================
CM$VER      3.03.07     14/11/2002
--------------------------------------------------------------------------------
- Seleção de Candidatos:
  * Permite especificar maior ou igual, igual ou menor que os valores especificados;
  * Possibilidade de associar os Candidatos selecionados a uma Requisição.
================================================================================
CM$VER      3.03.06     31/10/2002
--------------------------------------------------------------------------------
- Estatística de Demissões e Estatística por Fonte de Recrutamento:
  * Unificação das Telas (até então existia uma tela para o Usuário indicar as
  Opções do Gráfico e outra para a seleção das Pessoas).
================================================================================
CM$VER      3.03.05     29/10/2002
--------------------------------------------------------------------------------
- Registro de Outras Avaliações e Entrevistas:
  * Acerto na Lista dos Tipos de Avaliação para somente os que forem do Tipo:
  "Outros Tipos de Avaliação".
- Remodelagem no Layou das Telas: Eliminação da Candidatos e Eliminação de
  Requisições de Candidatos.
================================================================================
CM$VER      3.03.04     11/10/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.03.03     11/10/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.03.02     19/08/2002
--------------------------------------------------------------------------------
- Requisição de Pessoal
  * Pode-se agora associar Candidatos (externos) e Empregados (internos)
    como possíveis candidatos a atender uma requisição.
================================================================================
CM$VER      3.03.01     13/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.03.00     04/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.02.00     03/05/2002
--------------------------------------------------------------------------------
- Requisição de Pessoal
  * Foi criado um check-box para o usuário indicar o candidato aprovado.
================================================================================
CM$VER      3.01.07     25/04/2002
--------------------------------------------------------------------------------
- Cadastro de Candidatos
  * O registro de cursos para candidatos foi acrescentado nesta tela.
- Requisição de Pessoal
  * Possibilita que o usuário chame o cadastro do(s) candidato(s) 
    associado(s) à requisição que está na tela.
- Arquivo TXT para Importação de Candidatos
  * Foram retirados os campos referentes a quantidades de dependentes
    e acrescentados (até) dois cursos de formação (código e ano de
    conclusão) e o parecer da consultoria (código, pontuação e observações).
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de Usuários,
    o que até então não era permitido.
- Registro de Testes, Entrevistas e Outras Avaliações
  * Opção de busca do avaliador no Cadastro de Empregados.
================================================================================
CM$VER      3.01.06     25/03/2002
--------------------------------------------------------------------------------
- Alteração da Integração com o processo RAD, de forma a passar o Centro de Custo.
================================================================================
CM$VER      3.01.05     25/02/2002
--------------------------------------------------------------------------------
- Inclusão da opção Importação de Candidatos que se encontra em Sistema / Utilitários /
  Importa TXT Candidatos.
================================================================================
CM$VER      3.01.04     26/12/2001
--------------------------------------------------------------------------------
- Cadastro de Candidatos:
  * Corrigida a chamada da tela
================================================================================
CM$VER      3.01.03     05/11/2001
--------------------------------------------------------------------------------
- Cadastro de Candidatos:
  * Inclusão dos Campos: Cidade de Nascimento e Cor/Raça que se
     encontram na Pasta Dados Pessoais.
================================================================================
CM$VER      3.01.02     18/10/2001
--------------------------------------------------------------------------------
- Acerto na inserção de um Candidato.
================================================================================
CM$VER      3.01.01     05/10/2001
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.01.00     27/09/2001
--------------------------------------------------------------------------------
- Implementada a possibilidade de associar Candidatos a Requisições de Pessoal:
  * Cadastro de Candidatos: Indicam-se as Requisições
  * Cadastro de Requisições: Indicam-se os Candidatos
  * Consulta Seleção de Candidatos:
     * Pode ser vinculada a uma requisição, levando dados desta
     * Se houver esta vinculação, a seleção de candidatos externos pode se restringir aos associados à requisição
  * Relatório de Requisições de Pessoal: Opção para listar os candidatos associados
================================================================================
CM$VER      3.00.01     19/07/2001
--------------------------------------------------------------------------------
- Correção na abertura da Tela de Cadastro de Candidatos.
================================================================================
CM$VER      3.00.00     18/06/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5.
================================================================================
CM$VER      2.02.02     16/02/2001
--------------------------------------------------------------------------------
- Menu Transações / Requisição de Pessoal
  A tela foi reformatada e foram acrescentadas as seguintes informações:
    * Data Desejada (para o preenchimento da vaga);
    * Conhecimentos Necessários (texto livre);
    * Conhecimentos Desejáveis (texto livre);
- Relatório de Requisições de Pessoal: foi acresentado o campo Data Desejada.
- Relatório de Rotatividade: correção na contagem do Efetivo e opção para selecionar pelo Tipo de Contrato.
================================================================================
CM$VER      2.02.01     29/01/2001
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.02.00     04/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor).
================================================================================
CM$VER      2.01.09     19/07/2000
--------------------------------------------------------------------------------
- Correção na seleção de pessoas por faixa etária.
================================================================================
CM$VER      2.01.05     01/03/2000
--------------------------------------------------------------------------------
- Novas opções de seleção de demitidos (por data e por motivo) nas consultas e 
relatórios do módulo, onde isto se aplica.
================================================================================
CM$VER      2.01.04     25/02/2000
--------------------------------------------------------------------------------
- Opção de imprimir observações registradas sobre os cursos, as avaliações e
  as ocorrências médicas na Ficha Funcional do empregado e no Dossiê do 
  candidato.
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
- Alteração na forma de busca de empregados / candidatos nas telas de 
  transações e consultas;
- Correção na seleção de empregados por Centro de Custo
================================================================================
CM$VER      2.00.04     17/08/1999
--------------------------------------------------------------------------------
- Melhoria no desempenho de algumas telas de consulta e relatórios.
================================================================================
CM$VER      2.00.03     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.00.02     31/03/1999
--------------------------------------------------------------------------------
- Alterações feitas pelo Sr. Eugênio.
================================================================================
CM$VER      2.00.01     25/03/1999
--------------------------------------------------------------------------------
- Foi retirado do projeto o FCMSobre e o FSobre, e todas as suas referências.
================================================================================
CM$ALT}












































































































































































