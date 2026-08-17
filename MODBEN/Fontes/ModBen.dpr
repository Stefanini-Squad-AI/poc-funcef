program ModBen;

uses
  Forms,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  UModulo in 'UModulo.pas',
  fParamBenefPorPessoa in '..\Reports\Source\fParamBenefPorPessoa.pas' {frmParamBenefPorPessoa},
  fParamBenefPorTipo in '..\Reports\Source\fParamBenefPorTipo.pas' {frmParamBenefPorTipo},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  fCadBenef in '..\FontesMT\fCadBenef.pas' {frmCadBenef},
  fCadProvento in '..\FontesMT\fCadProvento.pas' {frmCadProvento},
  fAssocProvEmpre in '..\..\Shared\ModComp\FontesMT\fAssocProvEmpre.pas' {frmAssocProvEmpre},
  fLerCodProvento in '..\..\Shared\ModComp\FontesMT\fLerCodProvento.pas' {frmLerCodProvento},
  fHstBenef in '..\FontesMT\fHstBenef.pas' {frmHstBenef},
  fSelEstBenef in '..\FontesMT\fSelEstBenef.pas' {frmSelEstBenef},
  fCadRegBen in '..\FontesMT\fCadRegBen.pas' {frmCadRegBen},
  fIncRubrica in '..\..\Shared\ModComp\FontesMT\fIncRubrica.pas' {frmIncRubrica},
  fSelPessoalMT in '..\..\Shared\ModComp\FontesMT\fSelPessoalMT.pas' {frmSelPessoalMT},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  RBenefPorPessoa in '..\Reports\Source\RBenefPorPessoa.pas' {RptBenefPorPessoa},
  uCmCtrlRptModBen in '..\CtrlObjetos\uCmCtrlRptModBen.pas',
  RBenefPorTipo in '..\Reports\Source\RBenefPorTipo.pas' {RptBenefPorTipo},
  FCMEntrada in '..\..\Cm\Forms\Source\FCMEntrada.pas' {frmCMEntrada};

{$R *.RES}
{$R MODBEN_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'RH - Benefícios Sociais';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo RH - Benefícios Sociais
================================================================================
CM$VER      4.00.07     26/06/2008
--------------------------------------------------------------------------------
Reorganizando estrutura de diretórios.
================================================================================
CM$VER      4.00.06     19/12/2007
--------------------------------------------------------------------------------
- Várias telas seletivas onde consta a caixa "Máscara do Centro de Custo":
  * A busca passa a ser pela descrição;
  * A especificação de uma máscara (usando asteriscos como coringas) ficou facilitada,
    bastando escrever diretamente no campo, sem que a lista interfira.
================================================================================
CM$VER      4.00.05     12/09/2003
--------------------------------------------------------------------------------
- Listas de Nomes/Descrições com marcação do ítem selecionado:
  * Ao buscar um item da lista digitando-se letras no teclado,
  ele responde a uma sequência de caracteres, e não apenas ao
  primeiro, como era feito até então. Isto acontece desde que
  o usuário tecle-os com intervalo máximo de 0,45 segundos.
================================================================================
CM$VER      4.00.04     07/08/2003
--------------------------------------------------------------------------------
- Consultas / Relatórios / RH... / Operacioanis / Benefícios por Pessoa e por Tipo:
  * Acerto na busca das informações quando se altera a data na tela de solicitação.
- Gráficos Fixos / Estatística de Benefícios:
  * Acerto na busca das informações quando se altera a data na tela de solicitação.
================================================================================
CM$VER      4.00.03i    16/06/2003
--------------------------------------------------------------------------------
- As seguintes telas somente irão mostrar as Pessoas da Empresa
  Proprietária logada:
  * Registro de Benefícios Sociais;
  * Histórico de Benefícios Sociais.
================================================================================
CM$VER      4.00.02i    02/06/2003
--------------------------------------------------------------------------------
- Telas de Seleção de Pessoal:
  * Acrescentado o filtro pela Empresa Proprietária.
================================================================================
CM$VER      4.00.01i    21/02/2003
--------------------------------------------------------------------------------
- Compatibilização com a CMRhObj50.bpl versão 4.01.16i.
================================================================================
CM$VER      4.00.00i    18/11/2002
--------------------------------------------------------------------------------
- Versão Inicial Implementada no Modelo 3 Camadas.
================================================================================
CM$VER      3.01.03     14/11/2002
--------------------------------------------------------------------------------
- Implementação do Help Sensível ao Contexto.
================================================================================
CM$VER      3.01.02     01/10/2002
--------------------------------------------------------------------------------
- A partir desta versão o Sistema necessita do arquivo CMRHObj50.bpl para funcionar.
================================================================================
CM$VER      3.01.01     19/08/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.07.00;
- Retirada a opção de menu Sistema / Utilitários / Queries Diversas pois a mesma não é mais necessária.
================================================================================
CM$VER      3.01.00     03/06/2002
--------------------------------------------------------------------------------
- Compatibilização com o Padrão pós 5.06.13.
================================================================================
CM$VER      3.00.04     25/04/2002
--------------------------------------------------------------------------------
- Usuário RH
  * Esta autorização pode também ser feita a nível de Grupo de
    Usuários, o que até então não era permitido.
================================================================================
CM$VER      3.00.03     26/12/2001
--------------------------------------------------------------------------------
- Correção na Estatística de Benefícios em vigor.
================================================================================
CM$VER      3.00.02     26/12/2001
--------------------------------------------------------------------------------
- Acrescentado um filtro por Data de Admissão em algumas telas de Seleção de Pessoas.
================================================================================
CM$VER      3.00.01     20/07/2001
--------------------------------------------------------------------------------
- Alterações na Associação de Rubricas por Empresa:
  * Possibilidade de procurar uma determinada rubrica digitando-se seu nome na caixa de textos abaixo de cada lista;
  * Possibilidade de tornar todas as rubricas selecionadas para a Empresa em questão visíveis ou invisíveis para as seleções dos Sistemas de RH.
================================================================================
CM$VER      3.00.00     09/04/2001
--------------------------------------------------------------------------------
- Versão em Delphi 5;
- Agora os Relatórios que se encontravam no menu "Relatórios e Gráficos Fixos" 
  (Benefício por Pessoa e Benefício por Tipo) se localizam no menu Consultas / Relatórios / Operacionais, e "Relatórios e Gráficos Fixos" passa a se chamar "Gráficos Fixos" pois só contém o gráfico já existente.
================================================================================
CM$VER      2.03.03     29/01/2001
--------------------------------------------------------------------------------
- Possibilidade de especificar a data de vigência desejada na Estatística e nos Relatórios 
  de Benefícios em Vigor (antes, só fazia com base na data atual);
- Redução do tempo de execução dessas mesmas funções, e mais o da Consulta ao 
  Histórico de Benefícios.
================================================================================
CM$VER      2.03.02     01/12/2000
--------------------------------------------------------------------------------
- Alteração no tratamento dos Benefícios que constam na Folha de Pagamento.
================================================================================
CM$VER      2.03.01     05/09/2000
--------------------------------------------------------------------------------
- Acerto na opção de Tela Única dos Relatórios.
================================================================================
CM$VER      2.03.00     01/08/2000
--------------------------------------------------------------------------------
- Suporte ao "Usuário Gerente" (só enxerga pessoas do seu setor).
================================================================================
CM$VER      2.02.06     19/07/2000
--------------------------------------------------------------------------------
- Correção na seleção de pessoas por faixa etária.
================================================================================
CM$VER      2.02.05     31/05/2000
--------------------------------------------------------------------------------
- Correção na tela de cadastro das Rubricas Salariais.
================================================================================
CM$VER      2.02.03     01/03/2000
--------------------------------------------------------------------------------
- Novas opções de seleção de demitidos (por data e por motivo) nas consultas e 
relatórios do módulo, onde isto se aplica.
================================================================================
CM$VER      2.02.01     16/11/1999
--------------------------------------------------------------------------------
- Ampliação das opções de sequência na seleção de pessoas.
================================================================================
CM$VER      2.02.00     13/10/1999
--------------------------------------------------------------------------------
- Compatibilização com o Padrão Pós 4.25.
================================================================================
CM$VER      2.01.06     13/09/1999
--------------------------------------------------------------------------------
- Correção na seleção de empregados por Centro de Custo.
================================================================================
CM$VER      2.01.05     16/08/1999
--------------------------------------------------------------------------------
- Melhoria no desempenho de algumas telas de consulta e relatórios.
================================================================================
CM$VER      2.01.04     08/06/1999
--------------------------------------------------------------------------------
- Tratamento no Número Sequencial nos Lançamentos de Benefícios.
================================================================================
CM$VER      2.01.03     10/05/1999
--------------------------------------------------------------------------------
- Alterações feitas nos relatórios.
================================================================================
CM$VER      2.01.02     25/03/1999
--------------------------------------------------------------------------------
- Foi retirado do projeto o FCMSobre e o FSobre, e todas as sua referências.
================================================================================
CM$ALT}









































































