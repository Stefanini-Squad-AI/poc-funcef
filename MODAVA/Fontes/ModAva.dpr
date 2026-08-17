program ModAva;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada},
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  UModulo in 'UModulo.pas',
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fParamFormAvalBranco in '..\Reports\Source\fParamFormAvalBranco.pas' {frmParamFormAvalBranco},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadGrupoFunc in '..\..\Shared\ModComp\FontesMT\fCadGrupoFunc.pas' {frmCadGrupoFunc},
  fCadGrupoFator in '..\FontesMT\fCadGrupoFator.pas' {frmCadGrupoFator},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fCadPeso in '..\..\Shared\ModComp\FontesMT\fCadPeso.pas' {frmCadPeso},
  fHstAval in '..\FontesMT\fHstAval.pas' {frmHstAval},
  fCadFator in '..\..\Shared\ModComp\FontesMT\fCadFator.pas' {frmCadFator},
  fCadCargo in '..\..\Shared\ModComp\FontesMT\fCadCargo.pas' {frmCadCargo},
  fCadRegAval in '..\..\Shared\ModComp\FontesMT\fCadRegAval.pas' {frmCadRegAval},
  fCadTipAval in '..\..\Shared\ModComp\FontesMT\fCadTipAval.pas' {frmCadTipAval},
  fParamRelAvalPre in '..\Reports\Source\fParamRelAvalPre.pas' {frmParamRelAvalPre},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RAvalPre in '..\Reports\Source\RAvalPre.pas' {rptAvalPre},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  uCmCtrlRptModAva in '..\CtrlObjetos\uCmCtrlRptModAva.pas',
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fParamRelAval in '..\Reports\Source\fParamRelAval.pas' {frmParamRelAval},
  RAval3C in '..\Reports\Source\RAval3C.pas' {RptAval3C},
  RProgAval in '..\Reports\Source\RProgAval.pas' {RptProgAval},
  fParamProgAval in '..\Reports\Source\fParamProgAval.pas' {frmParamProgAval},
  RFormAvalBranco in '..\Reports\Source\RFormAvalBranco.pas' {RptFormAvalBranco},
  fPotencAval in '..\FontesMT\fPotencAval.pas' {frmPotencAval},
  fCadRegDesemp in '..\FontesMT\fCadRegDesemp.pas' {frmCadRegDesemp},
  fSelEstAval in '..\FontesMT\fSelEstAval.pas' {frmSelEstAval},
  fCadRegTrein in '..\..\Shared\ModComp\FontesMT\fCadRegTrein.pas' {frmCadRegTrein},
  RAvalCurso in '..\..\Shared\ModComp\Reports\Source\RAvalCurso.pas' {RptAvalCurso},
  FCadastroPai in '..\..\Cm\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  fParamRelDesemp in '..\Reports\Source\fParamRelDesemp.pas' {frmParamRelDesemp},
  RAvalDesemp in '..\Reports\Source\RAvalDesemp.pas' {RptAvalDesemp},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  fRegTreinMetaAtuarial in '..\..\Shared\ModComp\FontesMT\fRegTreinMetaAtuarial.pas' {frmRegTreinMetaAtuarial};

{$R *.RES}
{$R MODAVA_RES.RES}
Begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'RH - Administração de Desempenho';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmRegTreinMetaAtuarial, frmRegTreinMetaAtuarial);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Administração de Desempenho
================================================================================
CM$VER      3.05.05     26/06/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.05.04     05/03/2008
--------------------------------------------------------------------------------
Pendência: 27519
Tela: Cadastros/Cargos
Descrição: Retirada do campo 'CBO 1994' que encontra-se em desuso desde março de 2003.
================================================================================
CM$VER      3.05.03     26/03/2007
--------------------------------------------------------------------------------
(Complementação Pendência 22490)
- Transações / Registro de Avaliação de Desempenho:
  * A alteração do grau de avaliação pode agora ser feita pelo "grid" no momento
   da inserção do registro e não somente na alteração.
================================================================================
CM$VER      3.05.02     21/11/2006
--------------------------------------------------------------------------------
Pendência : 22490
Tela: Transações\Registro de Avaliação de Desempenho
Descrição :Implementação da forma de pontuação de cada Fator de Avaliação.
 Fazer com que seja possível preencher o campo Grau Atribuído para todos os fatores
 em uma  única tela, sem que seja necessário entrar ("alterar") .
================================================================================
CM$VER      3.05.01     03/07/2006
--------------------------------------------------------------------------------
- Transações / Registro de Avaliação de Desempenho:
  * Correção de erro que ocorria ao se inserir os fatores junto com a inserção da própria
     avaliação.
  * Alteração na inserção dos fatores: todos são agora inseridos a priori, sem nota, de modo
     que o usuário de imediato visualize todos eles e registre as notas por alteração em cada
     um deles.
================================================================================
CM$VER      3.05.00     13/10/2005
--------------------------------------------------------------------------------
- Cadastros / Grupos de Fatores de Avaliação:
  * Inclusão de um campo para observações (Pendência 20447).
- Transações / Registro de Avaliações de Desempenho:
  * Inclusão de um botão para exibir a observação de um fator de avaliação, quando este
    estiver sendo inserido ou alterado.
- Consultas / Relatórios / RH ... / Operacionais / Avaliação de Desempenho Preenchida e 
  Formulário de Avaliação em Branco:
  * Inclusão das observações dos Grupos de Fatores de Avaliação (Pendência 20447). 
================================================================================
CM$VER      3.04.03     14/04/2004
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
================================================================================
CM$VER      3.04.02     16/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.04.01     03/09/2003
--------------------------------------------------------------------------------
- Transações / Registro de Avaliação de Desempenho:
  * Compatibilização com as alterações feitas no Módulo RH - Treinamento.
================================================================================
CM$VER      3.04.00     28/07/2003
--------------------------------------------------------------------------------
- Sistema / Configuração / Parâmetros do Sistema:
  * Foi acrescentada a tela que permite ao usuário definir seu critério de filtragem dos
     Fatores de Avaliação.
- Transações / Registro de Avaliações de Desempenho:
  * Reflexo desse parâmetro.
- Consultas / Relatórios / RH ... / Operacionais / Avaliação de Desempenho Preenchida e 
  Formulário de Avaliação em Branco:
  * Reflexo desse parâmetro.
================================================================================
CM$VER      3.03.00     30/06/2003
--------------------------------------------------------------------------------
- Transações / Registro de Avaliação de Desempenho
  * O sistema passou a registrar o módulo originador do registro de trinamento. Isto 
    ocorre quando o usuário inclui, por esta tela, algum curso como ação recomendada.
- Consultas / Relatórios / RH - ... / Operacionais
  * Avaliações de Empregados no Período: foi acrescentada a opção "Inclui Avaliações 
     Pendentes?", que, se marcada, irá incluir no relatório, além das avaliações já realizadas,
     também aquelas que deveriam ter sido, mas não foram.
  * Inclusão do relatório "Avaliações por Fator de Avaliação", que permite a listagem e 
     estatística das avaliações de desempenho analisadas individualmente pelos fatores de 
     avaliação.
================================================================================
CM$VER      3.02.14     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Registro de Outras Avaliações e Entrevistas;
  * Registro de Avaliação de Desempenho;
  * Histórico de Avaliações;
  * Relatório de Avaliação Preenchida;
  * Evolução do Desempenho e Simulação de Potencial.
- Relatório de Avaliação de Desempenho Preenchida:
  * Correção na impressão dos campos de observações.
================================================================================
CM$VER      3.02.13     02/06/2003
--------------------------------------------------------------------------------
- Cadastro de Cargos:
  * Agora é permitida a seleção dos CBOs (1994 e 2002) a partir de uma tela de seleção Padrão.
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
CM$VER      3.02.09     14/01/2003
--------------------------------------------------------------------------------
- Registro de Avaliação de Desempenho:
  * Correção na seleção dos Tipos de Avaliação.
================================================================================
CM$VER      3.02.08     04/12/2002
--------------------------------------------------------------------------------
- Registro de Avaliações de Desempenho:
  * Acrescentado um botão na Pasta Metas e Medidas que chama o Registro Individual
  de Treinamento da Pessoa Selecionada.
================================================================================
CM$VER      3.02.07     31/10/2002
--------------------------------------------------------------------------------
- Relatório de Programações e Avaliações:
  * Incluída a possibilidade de filtrar as Pessoas pelo mês de admissão.
- Cadastro dos Fatores de Avaliação:
  * Foi aumentado tamanho da Descrição para 60 caracteres.
================================================================================
CM$VER      3.02.06     18/10/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.02.05     03/10/2002
--------------------------------------------------------------------------------
- Os Relatórios Avaliação Preenchida, Relatório de Avaliações e
  Programação de Avaliações, que se encontravam no menu Relatórios
  e Gráficos Fixos, foram transferidos para Consultas/Relatórios/
  Operacionais.
- O menu Relatórios e Gráficos Fixos passou a se chamar Gráficos
  Fixos.
================================================================================
CM$VER      3.02.04     13/09/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.02.03     30/08/2002
--------------------------------------------------------------------------------
- Registro Coletivo de Treinamento
  * Correção de erro no Banco de Dados ao inserir registros.
================================================================================
CM$VER      3.02.02     30/08/2002
--------------------------------------------------------------------------------
- Possibilidade de usar o campo Observações dos Fatores de Avaliação, como 
  complementação do nome, nos relatórios:
  * Formulário de Avaliação em Branco
  * Avaliação Preenchida
================================================================================
CM$VER      3.02.01     13/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.02.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.01.00     25/04/2002
--------------------------------------------------------------------------------
- Cadastros / Grupos de Fatores de Avaliação
  * Foi introduzida esta nova tabela, segundo a qual os Fatores de Avaliação podem ser 
    "agrupados" conforme a sua natureza (p.ex. Pessoais, Profissionais, etc.).
- Cadastros / Fatores de Avaliação
  * Nesta tela, pode-se indicar a que Grupo o fator pertence.
- Consultas / Relatórios / RH - ... / Operacionais / Formulário de Avaliação em Branco
  * Considera agora os Grupos de Fatores de Avaliação.
- Relatórios e Gráficos Fixos / Avaliação Preenchida
  * Considera agora os Grupos de Fatores de Avaliação.
================================================================================
CM$VER      3.00.04     17/04/2002
--------------------------------------------------------------------------------
- Registros de Avaliação de Desempenho e Outras Avaliações
  * Opção de busca do avaliador no Cadastro de Empregados.
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de Usuários, o que até
     então não era permitido.
================================================================================
CM$VER      3.00.03     25/03/2002
--------------------------------------------------------------------------------
- Emissão do Formulário de Avaliação em Branco:
  * Possibilidade de imprimir mais de uma pessoa por vez.
  * Foram acrescentados os campos Data de Admissão, Centro de Custo e Nome da
  pessoa a quem o empregado está subordinado.
================================================================================
CM$VER      3.00.02     26/12/2001
--------------------------------------------------------------------------------
- Correção na Consulta Evolução e Potencial.
================================================================================
CM$VER      3.00.01     26/12/2001
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.00.00     18/06/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5.
- Agora o relatório em "Formulário em Branco" se localiza em Consultas / Relatórios /
  Operacionais com o Nome de Formulário de Avaliação em Branco e não em Relatórios e
  Gráficos Fixos.
================================================================================
CM$VER      2.02.01     29/01/2001
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.02.00     04/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor).
================================================================================
CM$VER      2.01.06     19/07/2000
--------------------------------------------------------------------------------
- Correção na seleção de pessoas por faixa etária.
================================================================================
CM$VER      2.01.05     31/05/2000
--------------------------------------------------------------------------------
- Correção na função Inserir da tela Registro de Avaliação de Desempenho.
================================================================================
CM$VER      2.01.03     01/03/2000
--------------------------------------------------------------------------------
- Novas opções de seleção de demitidos (por data e por motivo) nas consultas e 
relatórios do módulo, onde isto se aplica.
================================================================================
CM$VER      2.01.02     25/02/2000
--------------------------------------------------------------------------------
- Revisão da tela de registro de avaliações de desempenho.
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
CM$VER      2.00.05     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.00.04     09/04/1999
--------------------------------------------------------------------------------
- Foi renomeado o Label do quickreport para LabelFixo.
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




























































































































































