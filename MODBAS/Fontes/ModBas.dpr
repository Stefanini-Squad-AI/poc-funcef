program ModBas;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\fPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\fTelaAut.pas' {frmTelaAutorizacao},
  FCadastroPai in '..\..\CM\Forms\Source\fCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\Source\fCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'fPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\fSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\fOkCancelar.pas' {frmOkCancelar},
  UModulo in 'uModulo.pas',
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  fParamProfis in '..\Reports\Source\fParamProfis.pas' {frmParamProfis},
  fParamCargos in '..\Reports\Source\fParamCargos.pas' {frmParamCargos},
  FCMEntrada in '..\..\Cm\Forms\Source\fCMEntrada.pas' {frmCMEntrada},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadProfi in '..\FontesMT\fCadProfi.pas' {frmCadProfi},
  fCadGrauInstr in '..\FontesMT\fCadGrauInstr.pas' {frmCadGrauInstr},
  fCadRamo in '..\FontesMT\fCadRamo.pas' {frmCadRamo},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  fpessoaMT in '..\..\Cm\Forms\SourceMT\fpessoaMT.pas' {FrmPessoaMT},
  fCadFilial in '..\FontesMT\fCadFilial.pas' {frmCadFilial},
  fCadSindi in '..\FontesMT\fCadSindi.pas' {frmCadSindi},
  fCadHstAlterCad in '..\FontesMT\fCadHstAlterCad.pas' {frmCadHstAlterCad},
  fCadCargo in '..\FontesMT\fCadCargo.pas' {frmCadCargo},
  fCadSit in '..\FontesMT\fCadSit.pas' {frmCadSit},
  fCadMotivo in '..\FontesMT\fCadMotivo.pas' {frmCadMotivo},
  fUsuxCCusto in '..\FontesMT\fUsuxCCusto.pas' {FrmUsuxCCusto},
  fUsuxEstab in '..\FontesMT\fUsuxEstab.pas' {frmUsuxEstab},
  fQryPess in '..\FontesMT\fQryPess.pas' {frmQryPess},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  fBrwPess in '..\FontesMT\fBrwPess.pas' {frmBrwPess},
  fSelEstat in '..\FontesMT\fSelEstat.pas' {frmSelEstat},
  fEstatCad in '..\FontesMT\fEstatCad.pas' {frmEstatCad},
  fCadCarta in '..\FontesMT\fCadCarta.pas' {frmCadCarta},
  fParamCartaComunicadoAux in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicadoAux.pas' {frmParamCartaComunicadoAux},
  fParamCartaComunicado in '..\..\Shared\ModComp\Reports\Source\fParamCartaComunicado.pas' {frmParamCartaComunicado},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RCartaComunicado in '..\..\Shared\ModComp\Reports\Source\RCartaComunicado.pas' {RptCartaComunicado},
  fCadParam in '..\FontesMT\fCadParam.pas' {frmCadParam},
  RCadPessoal in '..\Reports\Source\RCadPessoal.pas' {RptCadPessoal},
  fParamCadPessoal in '..\Reports\Source\fParamCadPessoal.pas' {frmParamCadPessoal},
  REtiquetas in '..\Reports\Source\REtiquetas.pas' {RptEtiquetas},
  fParamEtiquetas in '..\Reports\Source\fParamEtiquetas.pas' {frmParamEtiquetas},
  fImportacaoDireta in '..\FontesMT\fImportacaoDireta.pas' {frmImportacaoDireta},
  RCargos in '..\Reports\Source\RCargos.pas' {RptCargos},
  RCCusto in '..\Reports\Source\RCCusto.pas' {RptCCusto},
  RMotivo in '..\Reports\Source\RMotivo.pas' {RptMotivo},
  RSindi in '..\Reports\Source\RSindi.pas' {RptSindi},
  RProfis in '..\Reports\Source\RProfis.pas' {RptProfis},
  uCmCtrlRptModBas in '..\CtrlObjetos\uCmCtrlRptModBas.pas',
  fParamCracha in '..\Reports\Source\fParamCracha.pas' {frmParamCracha},
  RCracha in '..\Reports\Source\RCracha.pas' {RptCracha},
  RFichaFunc in '..\..\Shared\ModComp\Reports\Source\RFichaFunc.pas' {RptFichaFunc},
  fParamFichaFunc in '..\..\Shared\ModComp\Reports\Source\fParamFichaFunc.pas' {frmParamFichaFunc},
  fCadFunc in '..\..\Shared\ModComp\FontesMT\fCadFunc.pas' {frmCadFunc},
  fRegistraOcorr in '..\..\Shared\ModComp\FontesMT\fRegistraOcorr.pas' {frmRegistraOcorr},
  fProcuraPessoaDoc in '..\..\Shared\ModComp\FontesMT\fProcuraPessoaDoc.pas' {frmProcuraPessoaDoc},
  FObservacaoCTemp in '..\..\SHARED\ModComp\FontesMT\FObservacaoCTemp.pas' {frmObservacaoCTemp};

{$R *.RES}
{$R MODBAS_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;
  Application.Initialize;
  Application.Title := 'RH - Módulo Básico';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Módulo Básico
================================================================================
CM$VER      3.05.08     26/06/2008
--------------------------------------------------------------------------------
(Pendência 27400)
- Sistema / Configuração / Centros de Custo por Usuário:
  * Na janela dos Centros de Custo não habilitados, o sistema agora está exibindo
    os centros de custo do plano padrão (GLOBAL).
================================================================================
CM$VER      3.05.07     07/03/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      3.05.06     05/03/2008
--------------------------------------------------------------------------------
Pendência: 27520
Tela: Cadastros/Cargos
Descrição: Retirada do campo 'CBO 1994' que encontra-se em desuso desde março de 2003.
================================================================================
CM$VER      3.05.05     25/06/2007
--------------------------------------------------------------------------------
- Transações / Cartas e Comunicados:
  * Adequação da rotina que trata o campo "Deficiente" ao seu novo escopo 
    (vários tipos de deficiência)
================================================================================
CM$VER      3.05.04     18/06/2007
--------------------------------------------------------------------------------
(Pendência 25009 - Parte)
- Cadastros / Pessoal / aba Dados Pessoais:
  * O campo Deficiente Físico (Sim ou Não) foi substituído por uma caixa de múltipla
    escolha, onde constam os vários tipos de deficiência que a RAIS exige.
================================================================================
CM$VER      3.05.03     03/07/2006
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Cadastrais / Ficha Funcional:
  * Foi alterado o critério de ordenação, de forma a exibir corretamente mais de uma
     alteração funcional com a mesma data de efetivação.
- Consultas / Relatórios / RH ... / Operacionais / Alterações Funcionais:
  * Foi alterado para não exibir mais uma mensagem de erro quando não há dados.
- Consultas / Relatórios Especiais / Demonstrativo de Pagamento:
  * Foi acresentado este relatório.
================================================================================
CM$VER      3.05.02     07/03/2006
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH ... / Cadastrais / Ficha Funcional:
  * Foi alterado o critério de ordenação, de forma a exibir corretamente mais de uma
     alteração funcional com a mesma data de efetivação.
================================================================================
CM$VER      3.05.01     07/01/2005
--------------------------------------------------------------------------------
- Sincronização de funções liberadas pela Folha de Pagamento (Versão 4.11.05).
================================================================================
CM$VER      3.05.00     01/10/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / Folha de Pagamento / Cadastrais / Pessoal:
  * Foi incluída a opção para exibir, ao invés do salário contratual, o salário
    alternativo de quem o tiver.
================================================================================
CM$VER      3.04.14     25/08/2004
--------------------------------------------------------------------------------
- Transações / Cartas e Comunicados:
  * Exibição do salário passa a ser com duas casas decimais.
================================================================================
CM$VER      3.04.13     23/06/2004
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Emissão de Crachá:
  * Correção na alteração do Layout.
================================================================================
CM$VER      3.04.12     26/04/2004
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
================================================================================
CM$VER      3.04.11     06/04/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * Inclusão do campo Marca Ponto na aba Situação Funcional, grupo Identificação.
================================================================================
CM$VER      3.04.10     31/03/2004
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * Apartir de agora, a verificação se a matrícula digitada já exite
  no cadastro abrange somente as matrículas da mesma empresa.
================================================================================
CM$VER      3.04.09     14/11/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Cadastrais / Relação de Cargos:
  * O campo CBO agora imprime o CBO 2002.
================================================================================
CM$VER      3.04.08     06/11/2003
--------------------------------------------------------------------------------
- Relatórios / Cadastrais / Etiquetas para Ponto:
  * Opção para colocar o mês de referência ou a CTPS.
================================================================================
CM$VER      3.04.07     30/10/2003
--------------------------------------------------------------------------------
- Sistema / Utilitários / Importação Direta de Dados:
  * Acerto na abertura de uma Configuração de Importação.
================================================================================
CM$VER      3.04.06     16/09/2003
--------------------------------------------------------------------------------
- Ficha Funcional:
  * A caixa de seleção relaciona todas as pessoas e não somente as Ativas e Afastadas
  como era feito até então.
================================================================================
CM$VER      3.04.05     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      3.04.04     25/08/2003
--------------------------------------------------------------------------------
- Cartas ou Comunicados:
  * Ajuste nas margens de impressão.
================================================================================
CM$VER      3.04.03     20/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Cadastrais / Pessoal:
  * Inclusão da coluna "Sit" que exibe a situação funcional do empregado, de forma
     abreviada (Ativ, Afas ou Desl);
  * A coluna "Data Dem." passa agora a ser "Data Dem.ou Afast.", de modo a exibir
     a Data de Desligamento ou de Afastamento, conforme o caso.
================================================================================
CM$VER      3.04.02     21/07/2003
--------------------------------------------------------------------------------
- Relatórios / Cadastrais / Ficha Funcional
  * Inclusão da opção para Avaliação Hay, disponível para as empresas que utilizam
     a Metodologia Hay em sua administração de Cargos e Salários.
================================================================================
CM$VER      3.04.01     08/07/2003
--------------------------------------------------------------------------------
- Cadastros / Pessoal:
  * A procura do empregado pelo nome voltou a trazer a opção "Não Sensível a Caixa",
     isto é, fica indiferente escrever em caixa alta ou baixa.
  * Acerto da gravação dos dados ao teclar o botão OK Final.
================================================================================
CM$VER      3.04.00     20/06/2003
--------------------------------------------------------------------------------
- Sistema / Configuração / Centros de Custo por Usuário:
  * Inclusão da indicação se o Usuário é supervisor de quais Centros de Custo.
================================================================================
CM$VER      3.03.11     16/06/2003
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * O CBO do cargo que é visualizado refere-se agora ao CBO 2002.
================================================================================
CM$VER      3.03.10     10/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Cadastro de Pessoal;
  * Cadastro do Histórico de Alterações Cadastrais;
  * Cartas ou Comunicados.
================================================================================
CM$VER      3.03.09     02/06/2003
--------------------------------------------------------------------------------
- Cadastro de Cargos:
  * Agora é permitida a seleção dos CBOs (1994 e 2002) a partir de uma tela de seleção Padrão.
================================================================================
CM$VER      3.03.08     20/03/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      3.03.07     21/02/2003
--------------------------------------------------------------------------------
- Cadastro de Empregados:
  * Implementação da gravação do histórico no momento da inserção de uma pessoa.
================================================================================
CM$VER      3.03.06     11/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRHObj50.bpl versão 4.01.15i
================================================================================
CM$VER      3.03.05     26/12/2002
--------------------------------------------------------------------------------
- Acerto na impressão das Cartas e Comunicados.
================================================================================
CM$VER      3.03.04     14/11/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.03.03     03/10/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.03.02     29/08/2002
--------------------------------------------------------------------------------
- Emissão de etiquetas
  * Opção para atualização da CTPS (de férias e de alterações
    funcionais) de forma coletiva.
================================================================================
CM$VER      3.03.01     13/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00.
================================================================================
CM$VER      3.03.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.02.01     16/05/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Inclusão da Situação Funcional na Busca do Empregado;
- Ficha Funcional:
  * Inclusão da opção para imprimir a Descrição do Cargo.
================================================================================
CM$VER      3.02.00     06/05/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Implementado a visualização do CBO para o Cargo Oficial.
  * Gravação das alterações cadastrais (opcional para o usuário). Que são:
    --> Matrícula;
    --> Nome;
    --> CPF;
    --> CTPS;
    --> PIS/PASEP;
    --> Data de Nascimento;
    --> Data de Admissão;
    --> Horário de Trabalho;
    --> Nome do Chefe;
    --> Grau de Instrução;
    --> Estado Civil;
    --> Sindicato;
    --> Profissão;
    --> Qtde. Dependentes I. Renda;
    --> Qtde. Dependentes Sal. Fam.
- Implementação do Histórico de Alterações Cadastrais situado em:
  Cadastros / Histórico de Alterações Cadastrais.
================================================================================
CM$VER      3.01.02     25/04/2002
--------------------------------------------------------------------------------
- Cadastro de Cartas ou Comunicados:
  * Acrescentadas novas opções de substituição para os Dados da Empresa atualmente
     logada.
================================================================================
CM$VER      3.01.01     17/04/2002
--------------------------------------------------------------------------------
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de
    Usuários, o que até então não era permitido.
- Transações / Cartas e Comunicados:
  * O texto pode ser formatado para se adequar ao documento que se quer reproduzir,
    permitindo a substituição de uma grande quantidade de informações segundo uma
    legenda apresentada na tela. Com isto, pode-se agora criar praticamente qualquer
    tipo de documento que necessite dados dos empregados. Pode-se colar um texto 
    editado por editor de texto, de preferência no formato RTF.
================================================================================
CM$VER      3.01.00     08/04/2002
--------------------------------------------------------------------------------
- Foi implementada a opção para o sistema numerar a Matrícula sequencialmente:
  * Esta opção é exercida na tela Sistema / Configuração / Parâmetros, indicando se 
     deseja a numeração automática e, se sim, o tamanho do Número da Matrícula.
  * Tendo optado pela numeração, seu efeito será notado no Cadastro de Pessoal, ao se
     inserir um novo empregado. O sistema irá gerar a Matrícula (que poderá ser acatada 
     ou não), desde que todas as matrículas existentes contenham apenas algarismos e o 
     maior número seja compatível com o tamanho especificado nos parâmetros. Deve 
     ser observado que a maior matrícula será acrescida de 1, independente da 
     categoria e situação do empregado a que ela pertença.
================================================================================
CM$VER      3.00.12     15/03/2002
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * A seleção do Tipo Sanguíneo é selecionada a partir de uma "Lista", ao invés de ter
  que ser digitada.
- Ficha Funcional:
  * Várias novas informações e opções de impressão. Pode ser usada como uma
  Ficha de Registro.
================================================================================
CM$VER      3.00.11     05/02/2002
--------------------------------------------------------------------------------
- Cadastro de Sindicatos:
  * Acerto na impossibilidade de se alterar endereços, telefones e contatos.
================================================================================
CM$VER      3.00.10     09/01/2002
--------------------------------------------------------------------------------
- Correção da Tela de Centros de Custo por Usuário.
================================================================================
CM$VER      3.00.09     03/12/2001
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Corrigida a chamada da tela
================================================================================
CM$VER      3.00.08     26/11/2001
--------------------------------------------------------------------------------
- Consultas / Relatórios / Cadastrais:
  * Foi acrescentada a Emissão de Crachás.
- Cadastro de Pessoal:
  * Inclusão do campo Tipo Sanguíneo que se encontra na Pasta Dados Pessoais.
- Cadastro de Estabelecimento:
  * Possibilidade de associar uma imagem (normalmente, o logotipo).
================================================================================
CM$VER      3.00.07     05/11/2001
--------------------------------------------------------------------------------
- Cadastro de Pessoal:
  * Inclusão dos Campos: Cidade de Nascimento, Cor/Raça e Deficiente Físico
    que se encontram na Pasta Dados Pessoais.
================================================================================
CM$VER      3.00.06     05/10/2001
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.00.05     03/09/2001
--------------------------------------------------------------------------------
- Foi incluída uma opção que permite a seleção de um Tipo de Duração de Contrato de
  Trabalho na Tela de Parâmetros (que permite que a duração seja expressa em:
  dias, semanas, meses ou anos) que replete nos Campos relacionados com a Duração
  do Contrato no Cadastro de Pessoas.
================================================================================
CM$VER      3.00.04     28/08/2001
--------------------------------------------------------------------------------
- Foi acrescentada na Tela de Parâmentros uma opção para que não seja exibida, nos menus dos Sistemas, a Tela de Uso Pessoal.
================================================================================
CM$VER      3.00.03     19/07/2001
--------------------------------------------------------------------------------
- Correção na abertura da Tela de Cadastro de Funcionários.
================================================================================
CM$VER      3.00.02     18/06/2001
--------------------------------------------------------------------------------
- No Relatório Cadastro de Pessoal foi incluído o campo Data de Admissão.
================================================================================
CM$VER      3.00.01     24/05/2001
--------------------------------------------------------------------------------
- Acerto nas Autorizações da opção "Uso Pessoal".
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5.
================================================================================
CM$VER      2.02.08     08/03/2001
--------------------------------------------------------------------------------
- Correção na Geração do Número Sequencial na opcão de Importação Direta de Dados.
================================================================================
CM$VER      2.02.07     07/03/2001
--------------------------------------------------------------------------------
- Melhorias internas em algumas telas;
- Incluído no cadastro de Cartas ou Comunicados a capacidade de Configurar e Restaurar o formato destas;
- Foi implementado a possibilidade da Pessoa inserir, alterar e excluir algumas de suas próprias informações, conforme parametrizado em Sistema / Configuração / Parâmetros do Sistema.
================================================================================
CM$VER      2.02.06     07/03/2001
--------------------------------------------------------------------------------
- Os Relatórios abaixo agora se encontram no Menu de Consultas/Relatórios/Cadastrais e não no Menu Relatórios e Gráficos Fixos:
  Etiquetas, Listagem do Cadastro de Pessoal, Listagem de Cargos, Listagem de Centros de Custo, Listagem de Motivos e Ações, Listagem de Profissões, Listagem de Sindicatos;
- O Relatório Ficha Funcional agora se encontra no Menu de Consultas/Relatórios/Operacionais e não no Menu Relatórios e Gráficos Fixos.
================================================================================
CM$VER      2.02.05     29/01/2001
--------------------------------------------------------------------------------
- Acerto na inserção de um novo Sindicato.
================================================================================
CM$VER      2.02.04     28/12/2000
--------------------------------------------------------------------------------
- Exclusão dos Cadastros: Unidade Federativa e Pais pois já existem no Módulo Global;
- Alteração no Layout das Telas.
================================================================================
CM$VER      2.02.03     01/12/2000
--------------------------------------------------------------------------------
- Alteração no Cadastro de Modelos de Cartas ou Comunicados.
================================================================================
CM$VER      2.02.02     05/09/2000
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.02.01     25/08/2000
--------------------------------------------------------------------------------
- Compatibilização com o Padrão;
- Acertos internos.
================================================================================
CM$VER      2.02.00     04/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor);
- Opção para a tela de Uso Pessoal: por senha ou por dados pessoais.
================================================================================
CM$VER      2.01.09     10/07/2000
--------------------------------------------------------------------------------
- Alteração no layout, de retrato para paisagem, da Listagem do Cadastro de Pessoal.
================================================================================
CM$VER      2.01.08     20/06/2000
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
as ocorrências médicas na Ficha Funcional do empregado.
================================================================================
CM$VER      2.01.01     16/11/1999
--------------------------------------------------------------------------------
- Ampliação das opções de sequência na seleção de pessoas.
================================================================================
CM$VER      2.01.00     13/10/1999
--------------------------------------------------------------------------------
- Compatibilização com o Padrão Pós 4.25.
================================================================================
CM$VER      2.00.11     14/09/1999
--------------------------------------------------------------------------------
- Implementação da tela de Uso Pessoal, onde cada empregado pode consultar
  seus próprios dados;
- Correção na seleção de empregados por Centro de Custo.
================================================================================
CM$VER      2.00.10     29/07/1999
--------------------------------------------------------------------------------
- Acerto no Cadastro de Estabelecimento.
================================================================================
CM$VER      2.00.09     20/07/1999
--------------------------------------------------------------------------------
- Otimização da busca de empregados na tela de cadastro.
================================================================================
CM$VER      2.00.08     01/06/1999
--------------------------------------------------------------------------------
- Correção no Cadastro de Estabelecimentos.
================================================================================
CM$VER      2.00.07     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.00.06     04/05/1999
--------------------------------------------------------------------------------
- Acerto do form REtiq e RCarta.
================================================================================
CM$VER      2.00.05     30/04/1999
--------------------------------------------------------------------------------
- Acerto do emissão de etiquetas.
================================================================================
CM$VER      2.00.04     28/04/1999
--------------------------------------------------------------------------------
- Foi incluído no relatório de Ficha Funcional a os campos de filiação e data de 
admissão.
================================================================================
CM$VER      2.00.03     26/04/1999
--------------------------------------------------------------------------------
- O erro "Ancestor for 'QRLABEL4' not found" já foi corrigido.
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








































































































































































































