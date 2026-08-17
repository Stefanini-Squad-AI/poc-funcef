---------------------------------------------------------------------------------
Padrões 5.10.18      11/07/2007
---------------------------------------------------------------------------------
Implementada a restrição do acesso SUPER a todas os módulos que não sejam aqueles
estritamente necessários ao cadastro de usuário, alteração de senha e liberação 
de acessos a usuários.
---------------------------------------------------------------------------------
Padrões 5.10.17      11/07/2007
---------------------------------------------------------------------------------
Implementado novas units de manipulação de strings (uCMSimpleTextFileBuilder e 
uCMTextFileBuilder). As mesmas contém métodos que facilitam a construção de
arquivos de texto.
---------------------------------------------------------------------------------
Padrões 5.10.16      14/06/2007
---------------------------------------------------------------------------------
Pendência: 24746
Descrição: - Corrigido o problema de violação de acesso que ocorria ao se 
             tentar cancelar -  Implementado Lookups múltiplos.
---------------------------------------------------------------------------------
Padrões 5.10.15     14/04/2007
---------------------------------------------------------------------------------
Liberação do padrão 5.10.15
---------------------------------------------------------------------------------
Padrões 5.10.14      02/02/2007
---------------------------------------------------------------------------------
Implementado no componente MontaSelect 
- Permite selecionar as condições NULL e NOT NULL 
- Inserido a possibilidade de utilização de campos do tipo LookUp

Implementado na consulta da query do Gerador de Relatórios
- Permite selecionar as condições NULL e NOT NULL 
---------------------------------------------------------------------------------
Padrões 5.10.08      21/11/2006
---------------------------------------------------------------------------------
Incluido o campo de email na tela de cadastro de usuarios
---------------------------------------------------------------------------------
Padrões 5.10.08      08/12/2005
---------------------------------------------------------------------------------
- Criada função SegundosParaHMS que converte uma quantidade qualquer de segundos
  no formato "1h25m33s".
-Permitir busca dos dados em tempo de desenho (corrigir preenchimento dos
 parâmetros). Implementado "bound variables" (em tempo de execução).
- Metodos implementados na CMControlObject
CreateDataSetParams e OpenDataSetParams = para evitar o prepare da query em um looping
InTransaction = verifica se esta em transação
---------------------------------------------------------------------------------
Padrões 5.10.06      14/06/2005
---------------------------------------------------------------------------------
Foram criadas duas novas bpls: CMRad50 / CMPrincipal50
Desta forma o path de herança do form Principal passa a ser:
  - c:\ProjetosCM5\CM\CMPrincipal\

Para correta visulaização do frmPrincipal, neste padrão, atualizar as 
linhas de herança do FrmCMPrincipal no DPR do projeto, conforme abaixo:

De:
  FCMPrincipal in '..\..\Cm\Forms\Source\FCMPrincipal.pas' {frmCMPrincipal},

Para:
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},

- No menu \Project \Options  {Packages}
Adicionar na lista de packages: CMPrincipal50
---------------------------------------------------------------------------------
Padrões 5.10.03a     29/12/2003
---------------------------------------------------------------------------------
- Corrigido erro na atulização automática de bpls.
- Implementada segurança no Atualizador Automático de Versões, que força o usuário
  comunicar a infraestrutura caso não deseje esta atualização. Enquanto a atualização
  não for efetivada o usuário não conseguirá acessar os sistemas.
---------------------------------------------------------------------------------
Padrões 5.10.03     18/12/2003
---------------------------------------------------------------------------------
- Inclusão do Subtipo Advogado em Pessoa;
- Verificação do tamanho da operação na gravação do log de operações;
- pendência: 15603 - Implementado a impressora de Cheques NSC 2.01 da marca Schalter
- Criação do fProgresso e fProgressoDuplo, ambos para mostrar o andamento de um 
  processo com botão para cancelar o processamento
- Incorporação da uVerificaPreenchimento;
- Pendência 15759:
  Restrição de associação de funcionário a grupos cujos cargos, funções e centros 
  de custos são incompatíveis com os seus.
- Pendência 14891:
  Implementada a não obrigatoriedade de indicação do CNPJ de Agências bancárias, de 
  acordo com parâmetro do sistema;
- Pendência: 15806 - 15.12.2003
  uCtrlGrupoUsu.pas - Corrigido erro apresentado ao incluir um participante.
- Pendência: 15806 - 15.12.2003
  fCadUsuarioNew, fUserManager.pas - Implementado envio de aviso de alteração e/ou 
  desbloqueio de senha para usuários com e-mail cadastrados.


---------------------------------------------------------------------------------
Padrões 5.09.19     08/04/2003
---------------------------------------------------------------------------------

- RAD
  A alteração foi na tela de Finalização de Etapa, que em alguns casos poderia não finalizar 
  corretamente, não criando a próxima etapa.
- Pessoa
  Correção na alteração do número do documento pois quando este era efetuado na
  caixa de texto da lista de documentosnão alterava o documento principal.

---------------------------------------------------------------------------------
Padrões 5.09.18     26/03/2003
---------------------------------------------------------------------------------

- RAD
  Colocação de tela padrão de pesquisa nas telas de Etapas Pendentes, Execução de Etapas e Processos Pendentes;
  Incluir na tela de seleção, a opção de filtragem pelo grupo de autorização;
  Possibilidade de excluir um processo quando não houver nenhum andamento;
  Criar tela consulta de processos pendentes selecionando por usuário e por etapa em atraso ou dentro do prazo;
- Cadastro de Usuários
  Correção na validação dos itens de autorização para restrições associadas ao
  Cargo, Função e Centro de custo do Usuário caso ele seja um Funcionário
- MontaSelect
  Implementação do Evento AfterOpenCDS que permite manipular os dados resultantes
  da pesquisa antes de serem exibidos para o usuário.

---------------------------------------------------------------------------------
Padrões 5.09.17     24/02/2003
---------------------------------------------------------------------------------

- Mensageiro
  Implementação da possibilidade do envio do Log por e-mail - p. 7509
- Implementação da tela de Cadastro Configuração de Históricos - p.8828, 8834 
  > Vide Documentação em Anexo
- Implementação da Classe para utilização de históricos configuráveis por módulo - p.8828, 8834
  > Vide Documentação em Anexo
- uImpostoRetido
  > Correção na verificação do lançamento do imposto associado a tipo de desembolso
    sem a indicação do centro de custo - P.6432  > 
- Atualização de Versões
  > Implementação da atualização de versões para pasta a ser indicada pelo cliente.
    Hoje a atualização é efetuado automaticamente no System da máquina. Esta impementaçãop
    é possível através da configuração de uma variável de ambiente chamada CMBPLPATH, onde é
    indicada a pasta que irá conter as bpl´s. Esta pasta deve ser adicionada também a variável
    de ambiente PATH. A configuração dessas variáveis depende da versão do windows instalada e
    deve ser efetuada pelo administrado do sistema - p8871, 9777.
- Atualizações no RAD
- Visualização de Mensagens CM
  > Implementação da "Caixa de Itens Enviados" onde é possível visualizar e manutenir todas
    as mensagens enviadas pelo usuário logado - p.9098
- Controle de Acesso por Cargo X Função X Centro de Custo X Grupo
  > Implementação do controle de acesso a partir do cadastro de Grupos que valida os direitos
    a serem atribuídos a um usuário desde que ele seja um FUNCIONARIO - p.9315
- Lançamento de Alteradores
  > Implementação de parâmetro para permitir a contabilização dos alteradores na baixa do
    documento
  > Implementação de parâmetro para permitir a contabilização dos alteradores de acordo com
    centro de custo do rateio do documento



---------------------------------------------------------------------------------
Padrões 5.09.16     10/02/2003
---------------------------------------------------------------------------------
- Atualizações no RAD

---------------------------------------------------------------------------------
Padrões 5.09.15     29/01/2003
--------------------------------------------------------------------------------

- Correção do 'Access Violation' na OleAut32.Dll
- Atualização das telas e objetos de negocio do RAD no modelo 3 camadas

---------------------------------------------------------------------------------
Padrões 5.09.14     24/01/2003
--------------------------------------------------------------------------------
- MontaSelect
  Implementação da Propriedade MultiSelect permitindo seleção de múltiplos registros
  no grid. Os valores selecionados são recuperado da mesma forma que a implementação
  atual do montaselect, sendo que devem ser referenciados num while com o teste do
  método TMontaSelect.GetNextRecord.
- Visualisador de Relatórios
  Correção na paginação inicial do relatório visualisado para exibir de forma correta o
  totalisador de páginas.
- Envio de Mensagem
  Implementação do envio de mensagens com cópia para vários destinatários ou grupos.
- Pessoa
  Implementação da visualisação do tipo de telefone sem a necessidade de alteração
  do registo do grid;
- Cadastro de Usuário
  Gravação do tipo de filtro do cadastro em relação a listagem de usuário desabilitadados.
  A opção figa gravada mantendo sempre o último estado da tela.

---------------------------------------------------------------------------------
Padrões 05.09.13 - 23/01/2003
---------------------------------------------------------------------------------


- MontaSelect
  Correção na pesquisa com campos do tipo valor com casas decimais: Não estava
  formatando o valor na montagem do SELECT

- Cadastro de Cliente
  Alteração na consulta de replicação de dados da tabela EmpresaCliente pra as 
  Empresas cadastradas na tabela EmpresaProp para considerar a associação de
  Contas Contábeis X Tipo de Cliente presente na tabela TIPOCLIXHOTELXCC


---------------------------------------------------------------------------------
Padrões 05.09.12 - 18/01/2003
---------------------------------------------------------------------------------

- Cadastro de Clientes
  Implementação do Campo Observação - Pendência 5432
  Criação automática de Subconta de Acordo com parâmetros do Global - Pendência 5099
  Alteração dos componentes de SubCona, Unidade Negocio e Atividade e Pojeto para permitir
  a exclusão do conteúdo atribuído.
- Fluxo de Operações
  Correção do erro de constratint ao alterar o registro. Pendência 7560
- Cadastro de Fornecedores
  Criação automática de Subconta de Acordo com parâmetros do Global - Pendência 10962
  Alteração dos componentes de SubCona, Unidade Negocio e Atividade e Pojeto para permitir
  a exclusão do conteúdo atribuído.

---------------------------------------------------------------------------------
Padrões 05.09.11 - 14/01/2003
---------------------------------------------------------------------------------

- uCtrlObject
  Correção na propagação dos erros na execução de instruções SQL nas control objects.
  Após a compatibilização dos fontes para implementação utilizando COM+, o erro na
  execução dos comandos deixou de ser propagado.

- uMidasUtil
  Implementação das procedures
  > SaveCDSFromScreen( Compo: TComponent; iTagToSave: Integer; fmt: TDataPacketFormat);
    Grava para arquivo o Data dos ClientDataSets do form ou datamodulo passados como parâmetro.
    O parâmetro itagToSave permite que somente os ClientDataSet diferenciados pelo valor da
    propriedade TAG sejam gravados. Caso o valor seja 0, todos os clientdatasets da tela serão
    gravados.
    O parâmetro fmt defise se o arquivo gerado é um Xml ou um MyBase.
    Os arquivos são gerados numa subpasta a pasta de execução do aplicativo chamada CdsData e tem 
    o nome composto do nomedoform.clientdatasets.xml ou nomedoform.clientdatasets.cds}
  > CopyClientDataSet(cds : TClientDataSet): OleVariant;
    Retorna o datapacket do clientdataset passado como parâmetro sem os metadados
    retornados no datapacket de origem
  > XmlToOleVariant(sXml: String): OleVariant;
    Converte um arquivo Xml no formato do DataPacket para um OleVariant no formato do DataPacket
    para ser atribuído a um ClientDataSet ou passado como parâmetro de um método


---------------------------------------------------------------------------------
Padrões 05.09.10 - 10/01/2003
---------------------------------------------------------------------------------

- Inclusão do Utilitário "Prepara Strings Para Tradução"
  Assistente para formatação de textos para inclusão e tratamento de strings no arquivo 
  de tradução do idioma dos sistemas
  Os Desenvolvedores devem consultar o documento "c:\ProjetosCM5\CM\Doc\CMTraduz.Doc".
- FuncaoGeral
  Correção na consulta de teste de cotação moeda na data. O campo da cláusula 
  "ORDERE BY" não era indicado no select gerando erro de "Invalid Data Packet".
- Alteração nas funções de mensagem para tradução automática das mensagem inclusas
  no arquivo de tradução dos sistemas

---------------------------------------------------------------------------------
Padrões 05.09.09 - 9/01/2003
---------------------------------------------------------------------------------

- Pessoa
  Correção de Erro na Gravação do Tipo de Endereço no Pessoa. Associava aleatoriamente
  o tipo de endereço a um uníco endereço cadastrado
- CmControlObjects
  Correção de Erro na Gravação de tabelas com Campos Blob quando não era informado
  valor para o campo no momento da inserção
- uDbObjects
  Alteração na uDbObject para exclusão dos TQueryes de excecução e 
  select de registros no método LoadFromDB para compatibilização da execução com
  conexão via ADO
- uDataBase
  Alteração na LeultRegistro para  compatibilização da execução com conexão via ADO
- MontaSelect
  Correção no MontaSelect inibindo a digitação de caracteres para campos de pesquisa do tipo numérico

---------------------------------------------------------------------------------
Padrões 05.09.07 - 19/12/2002
---------------------------------------------------------------------------------

- CmDbObject
  Alteração no método de criação dos CmDbFields na CmDbObject para
  inclusão de dois parâmetros. O primeiro do tipo interio Integer habilita a 
  formatação de campos do tipo ftFloat da DbObjects. O Valor defaul é -1 e o 
  campo será  arredondado de acordo com o valor da variável. Para -1 não é 
  arredondado, para 0 é arredondado sem casas decimais, para 2 é arredondado 
  com 1 casa decimal,  assim por diante. O segundo parâmetro do tipo booleam habilita
  a gravação da data no formato data e hora. O valor defaul é false.

- Pessoa
  Correção na criação automática de agência bancária nos cadastros de pessoa.
  Estava sendo gravado o IdPessoa do cadastro no lugar do Id da agência criada.

- FrmCadastroMestreDet
  Correção na excecução do evento BeforeConfirma dos registros detalhe do cadastro.
  As validações que anteriormente eram efetuadas no botão de ok do detalhe devem
  ser efetuadas neste evento para o perfeito funcionamento do cadastro

- Autorização
  * Implementação do Obrigatoriedade da troca de senha para usuários bloqueados no
     sistema. Ao efetuar o login após o desbloqueio é solicitado que o usuário 
     troque a sua senha
  * Criação de parâmetro no Global para indicação de prazo para que seja
     efetuada a troca da senha. Este prazo é contado a partir do cadastro do usuário
     e em seguida a partir da última troca de senha efetuada pelo mesmo
  

---------------------------------------------------------------------------------
Padrões 05.09.06 - 03/12/2002
---------------------------------------------------------------------------------

- Implementação da Propriedade ParamIntegra.PartidaDobrada, 
  inicializada de acordo com a coluna PARAMCONTAB.PACDOBRADA

- Mensagem CM
  Correção na gravação para mensagens com mais de 255 caracteres.
  A mensagem além de truncada era gravada com várias linhas em
  branco entre as frases.

- Correção no Cálculo do DV para contas do tipo poupança do banco Bradesco.


---------------------------------------------------------------------------------
Padrões 05.09.05 - 08/11/20002
---------------------------------------------------------------------------------

- Implementação da Replicação dos dados contábeis para empresas proprietárias
  quando a Empresa logada no sistema é uma empresa gerencial ( Id = -1).
  Este procedimento é efetuado de forma automática no Cadastro de Cliente.

- Implementação da seleção do arquivo de idiomas dos sistemas a partir
  de um "arquivo dicionário individual" por sistema caso o mesmo exista na
  pasta de execução do mesmo. Caso o "arquivo dicionário individual" não exista
  os sistemas continuarão a buscar o arquivo de idiomas no cmtraduz.mld.

---------------------------------------------------------------------------------
Padrões 05.09.04 - 05/11/20002
---------------------------------------------------------------------------------

- CM Procura Conta Contábil
  Inclusão da opção de procura por Conta Correspondente
- uSistema
  Inclusão da propriedade Sistema.LoadOldReport com "True" como default.
  Os sistemas que já tem a totalidade dos seus relatórios convertidos para o modelo
  3 camadas devem incializar esta propriedade com "False" no Initialize do form
  principal para otimizar o primeiro login dos sistemas.

---------------------------------------------------------------------------------
Padrões 05.09.02 - 24/10/20002
---------------------------------------------------------------------------------

> CMDbObject
  Correção no método clear do DbObject.
  O Método clear não "limpava" corretamente o conteúdo dos campos ( DBFields ), isso
  acarreta problemas em processamentos consecutivos de DbObjects. 

> Correção nas opções de Confirmar\Cancelar da tela de parâmetros dos relatórios
   
> DtmDadosBancários
  Correção na função de seleção dos dados bancários do cliente/fornecedor.
  ( Erro de Parâmetro não implementado )


---------------------------------------------------------------------------------
Padrões 05.09.01 - 16/10/20002
---------------------------------------------------------------------------------

> Componente de Procura a Cliente\Fornecedor
  Inclusão do campo "Situação de Crédito" na pesquisa caso o tipo de procura
  seja para Cliente. A propriedade MostraStatusCredito controla a exibição deste
  campo. O default é não exibir.

> Configuração de Relatórios
  Correção na exibição do Nome da Empresa, Nome e Versão do sistema para
   relatórios com layout alterado.
  Correção no tratamento do processamento dos botões sair e cancelar das telas
  de parâmetro de relatórios.

> Cadastro de Cliente
   Implementação do campo "Código Correspondente do Hotel" na pasta
   "Dados do Cliente". É semelhante ao "Código Correspondente" sendo
   específico para cada empresa\hotel.

---------------------------------------------------------------------------------
Padrões 05.09.00 - 02/10/20002
---------------------------------------------------------------------------------


> A uDiasUteis e uFuncaoGeral foram alteradas e estão totalmente compatíveis com o modelo 3 camadas.

  Para serem acessadas pelas telas de operação dos sistemas basta declarar a unit uSistema 
  na unit que fizer chamada a métodos dessa classe e acessá-las normalmente como a implementação anterior.

  Para utiliza-las internamente em Controls devemos instancia-las como variáveis
  privadas da nossa classe ( como fazemos com qualquer outra "Control dentro de Control" ).
  Lembrem-se: As controls não podem fazer referência a métodos ou propriedades da 
  uSistema, somente as telas.

  ** Caso ocorra erro de compilação do tipo "Undeclared Identifier" para essas classes é obrigatório a declaração
     uSistema na unit que apresentar o erro.

> A função abaixo não está implementada na ufuncaogeral e sim na uDiasUteis.
  function UltDiaMes(iAno, iMes: word): TDateTime;

  ** Caso vc faça chamada e ela no seu projeto é obrigatório a alteração da classe FuncaoGeral por DiasUteis e
     a declaração da uSistema na sua unit.

> Novos métodos da aplicação servidora
    function ProcessaWorkFlow( ovWorkflowusuario, ovWorkflow, ovPassoworkflow: OleVariant; Operacao: Integer): Boolean;
    function ProcessaGrupoUsu(OvDataviewAcesso, OvTabelaAcesso,
                   OvColunaAcesso, OvGrupo, OvUsuario, OvPessoa, OvGrupoXUsu,
                   OvAutoriza, OvAutorizaRpt, OvAutorizaMs: OleVariant; OperacaoProcessa: Integer): Boolean;
    function GravarReports( ovCds: OleVariant ): Boolean;
    function ProcurarReports( IdReports, OrigemCm: Integer): Boolean;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant; Operacao: Integer): Boolean;
    function ProcessaConfigModelo(ovReports: OleVariant): Boolean;

   Esses métodos estão implementados no projeto instalado pelo padrão em
   c:\ProjetosCM5\cm\AppServer\CMPadoresSvr50.
   Basta abrir este projeto e copiar a declaração dos métodos acima da Interface e a 
   implementação do RemoteDataModulo;

   ** É obrigatório a implementação desses métodos na aplicação servidora do seu projeto.

> CmProcuraCOntab  
  Implementação da propriedade CampoParaPesquisa que permite a procura pelo Código
  Reduzido da Conta além do Número da Conta que é o seu valor default;

  ** Cuidado: O Valor a ser gravado no DATAFIELD é o valor do campo para pesquisa ou seja:
     se vc procura pelo PLACONTA o DATAFIELD deve ser o PLACONTA, se vc procura pelo
     PLAREDUZ o DATAFIELD deve ser o PLAREDUZ. 

  ** Caso vc pesquise pelo PLAREDUZ e queira obter informações da conta acesse a propriedade
     Conta... pois entre os valores persistidos aqui estão o número e nome da conta.

---------------------------------------------------------------------------------
Padrões 05.08.06 - 31/08/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Componente de Tela de Parâmetros ( CMParamReports )
  * Inclusão dos seguintes controles:
  > Memo
  > Procura Subtipo
  > Procura Forcli
  > Procura Conta Contábil
  Os componenetes de Procura implementados acima devem OBRIGATORIAMENTE
  substituir as pesquisas a Subtipo de Pessoa, Cliente, Fornecedor e Conta Contábil
  implementadas com LookupComboBox para otimizar o acesso ao banco para esses
  processos uma vez que essas tabelas contém muitos registros e o LookupComboBox onera em
  muito a performance. ( nota: Os componentes de Procura são baseados no MontaSelect )
  * Incluisão da propriedade DisplayText
  Preenchida com os valores de display apresentados em controles do tipo ComboBox, 
  LookupComboBox, Procura Subtipo, ProcuraForcli e Procura Conta Contábil.
  Para os outros controles essa propriedade é preenchida com o conteúdo da seleção.

[ CMFORMS50 ]

- Pessoa
  Customização no controle para indicação do Grupo permitindo que, uma vez escolhido, o
  conteúdo do mesmo possa der "apagado";

- Cadastro de Usuários\Grupos
  Correção na atribuição do IDESPACESSO gerado na inclusão de Usuários\Grupos
  para as tabelas de autorização.
  Correção na gravação no "Nome Completo" na inclusão de um Usuário;
  Bloqueio do campo "Nome Completo" na alteração do Usuário;

[ CMEXPERTS50 ]

- Liberação de Versão
  Correção na tela seleção das Pastas com os fontes do módulo a ser liberado:
  Estava incluindo a pasta raiz na seleção dos Paths do fonte a ser liberado


---------------------------------------------------------------------------------
Padrões 05.08.05 - 29/08/20002
---------------------------------------------------------------------------------

[ CMBACK50 ]

- Customizações no lançamento de baixa da CPMF

[ CMEXPERTS50 ]

- Liberação de Versão
  Correção na tela seleção das Pastas com os fontes do módulo a ser liberado:
  Alteração no tamanho do campo de persistência dos dados para 2000 caracteres.

[ CMFORMS50 ]

- Visualização de Relatórios
  Correção na visualização de relatórios com lay-out alterado em instalções     
   mult-empresa. Os relatórios uma vez alterados em uma empresa deixavam de ser   
   visualizado nas outras.

- Pessoa
  Inclusão da propriedade ObrigaDocPessoa para teste da obrigatoriedade do número
  do documento independente da parametrização Global do Sistema.

---------------------------------------------------------------------------------
Padrões 05.08.04 - 12/08/20002
---------------------------------------------------------------------------------

- Componente de Procura Fornecedor e Cliente ( TCMProcuraForCli )
  Correção na procura sem filtro de Ativo\Inativo.

- Liberação de Versão
  Correção na tela seleção das Pastas com os fontes do módulo a ser liberado:
  Alteração no tamanho do campo de persistência dos dados para 2000 caracteres.

- Componente de Teclado ( TTeclado )
  Implementação das propriedades:
    Caption - Caption do Form do Teclado 
    PassWordChar - Caracter de "Máscara" para o Edit do Form do Teclado
    EditControl - Edit a ser associado ao Teclado para receber automáticamente o 
                  conteúdo da digitação

- uSistema
  Implementação da propriedade UsaTecladoLogin ( = false ).
  Controla a utilização do Teclado Visual para digitação do Usuário e Senha na
  tela de login para utilização dos sistemas em Monitores Touch Screen.
  Para o seu módulo utilizar essa implementação basta incializar a propriedad
  Sistema.UsatecladoLogin como True no inicialization do form principal do sistema.

- Tela de Login
  Implementação da utilização do Teclado Visual para Monitores Touch Screen.
  

---------------------------------------------------------------------------------
Padrões 05.08.02 - 07/08/20002
---------------------------------------------------------------------------------

- Conexão com SQL Server
  * Implementação da "Tradução" das funções de conversão e formatação do oracle para
    o SQL Server.
  * Correção de parâmetros de conexão para com o SQL Server via BDE;
  * Correção nos Selects de manutenção dos sequences pois utilizão Queryes com "RequestLive" e
    para estes casos o parser da BDE é sensível a caixa.
  * Implementação da tradução nos ControlObjects e DbObjects para conexões via BDE e ADO no
    padrão 3 camadas.
  Obs.: As implemenrações acima funcionam totalmente para testes em conexão local ( Client-Server ).
        Existem customizações adicionais para que as customizações acima funcionen corretamente
        para execução na aplicação servidora. Tais custmizações serão liberadas posteriormente.

- Componente CMSQLParams
  COrreção no "parser" do SQL para identificação dos parâmetros do SQL caso existam.
  Implementação da validação do caracter ":" passado como texto que anteriormente era
  identificado como parâmetro.

- Pessoa ( Todos )
  Correção no Constraint na gravação das Contas Bancárias quando a agência bancária era
  inclusa automaticamente no momento do cadastro da conta.

- Pessoa ( Agência )
  Correção na atribuição da Máscara Global da Agência Bancária quando a máscara da mesma 
  no banco não estava preenchida. Antes estava sendo atribuído a máscara do CNPJ ao invés
  da máscara da Agência.

- TCtrlConfigRelatorio
  Implementação no método ExecAppServer para a chamada da função da aplicação servidora
  para gravação das alterações.
  Sempre que vc possuir mais de um form de configuração de relatórios esse método deve
  ser sobrescrito nas classes de controle de cada form para diferenciar a chamada da
  aplicação servidora.
  Ex.:
     (...)
     protected
        (...)     
        function ExecAppServer(ovCds, ovCdsReport: OleVariant; Operacao: TOperacao): Boolean; Virtual;

     (...)

     implementation

     function TCtrlConfigRelatorio.ExecAppServer(ovCds, ovCdsReport: OleVariant; Operacao: TOperacao): Boolean;
     Begin
         Result := Connection.AppServer.MeuProcessaConfig(ovCds, ovCdsReport, Integer(Operacao));
     End;


---------------------------------------------------------------------------------
Padrões 05.08.00 - 11/07/20002
---------------------------------------------------------------------------------

- Conversão da tela de Configuração de Relatórios com Modelo para 3 Camadas.
  - Os projetos que possuem essa implementação devem adicionar a unit
    "C:\ProjetosCM5\Cm\Forms\SourceMT\FConfigRelatorioMT.pas" e herdar a tela a partir
    deste form.
    Os Demos dessa implementação estão instalados em 
    "C:\ProjetosCM5\Cm\Demos\Configuração de Relatórios com Modelo".

- Correção na verificação da versão do Oracle para compatibilização com o Oracle Versão 7.x

- Implementação da Configração e da visualização da mesma para os Relatórios 
  Implementados\Convertidos no modelo 3 Camadas.
  Os passos para tal implementação estão no SuporteDesenv.Doc nas páginas 25 ( Implementação
  do método ConfigReport na classe de controle do relatório ) e 28 ( implementação do
  enveto para chamada da tela de Design da configuração de relatórios ).

- Implementação da Replicação dos Dados de Inserção, alteração e Exclusão da tabela 
  EmpresaCliente para instalações centralizadas que utilizam o Central de Reservas.

---------------------------------------------------------------------------------
Padrões 05.07.07 - 02/07/20002
---------------------------------------------------------------------------------

- uDocumento
  Implementação dos teste\exclusçao de integração contábil, financeira e com o 
  orçamento\planejamento no método de exclusão de documentos.
  Implementação da exclusão do lançamento e contabilização de alteradores lançados
  para o documento a ser excluído.


- uImpostoRetido
  Customizações na função de Exclusão da CPMF para retenções provenientes de
  baixa\criação de lotes

- RealEdit
  Correção na atribuição do valor digitado quando a largura do componente é menor que
  a quantidade de caracteres que o mesmo pode exibir

- Tela de Filtro Padrão de Relatórios
  Correção no filtro da consulta quando a versão do ORACLE é inferior ao 8i

---------------------------------------------------------------------------------
Padrões 05.07.03 - 17/06/20002
---------------------------------------------------------------------------------

- Visualização de Relatórios
  Correção no "Acces Violation" na confirmação da filtragem de relatórios implementados
  no modelo 3 Camadas

- Contabilização Automática de Lançamentos
  Correção na montagem do histórico na contabilização de alteradores e lançamentos de
  baixa e na seleção dos parâmetros para contabilização.


---------------------------------------------------------------------------------
Padrões 05.07.02 - 14/06/20002
---------------------------------------------------------------------------------

- Control Objects
  > Implementação do métododo OpenDataSet(Sql: String) para manipulação
    de um DataSet ( Que pode ser um wwQuery, AdoQuery, IbQuery ) em processos
    BAT otmizando o processamento em substituição ao GetDataPacket para esses processos.
   
    Os processos que utilizarem o OpenDataSet devem ser chamados sempre de
    procedimentos internos a Classe de Negócio. Numca devem ser chamados da tela.
    Para processos chamados da tela devemos utilizar o GetDataPaclet.

    O ResultSet obtido a partir do OpenDataSet é manipulado pelo _lDataSet que permite
    todo acesso aos fields, manipulaçao de registros, etc. diferenciando do ClientDataSet
    apenas por não permitir Inserts, Deletes e Updates. 
 
    Caso o seu processamento manipule o ResultSet obtido é aconselhável a utilização 
    de um ClientDataSet com o GetDataPacket;

  > Correção nos métodos StartTransaction, Commit e Roolback.
    Tais métodos testavam o estado do database antes de aplicar a alteração. 
    Por exemplo: 
    Só era executado um COMMIT se o Database estivesse em transação. Os métodos
    Start, Commit e Rollback a partir de agora são sempre executados cabendo ao desenvolvedor
    o controle da abertura, fechamento ou cancelamento da transação de forma adequada, 
    garantindo assim a integridade do processamento da informação.

- uCtrlDocumento
  > Correções nos métodos de Estorno e Manipulações de Lançamentos de documentos;


---------------------------------------------------------------------------------
Padrões 05.07.01 - 13/06/20002
---------------------------------------------------------------------------------

- PessoaMT
  Correção na atribuição da máscara do documento na inserção do pessoa;
  Inclusão de um GRID com informações referente aos Contatos do Telefone na pasta
  telefone e dos Telefones do Contato na pasta Contato;
  Correção na alteração de dados referentes a pessoa física;
  Otimização na exclusão de dados referentes ao endereço, telefones e contatos do pessoa;

- Otimização nos métodos ExecSQL e GetDataPacket das classes de controle
  e persisitencia de negócio

---------------------------------------------------------------------------------
Padrões 05.07.00 - 11/06/20002
---------------------------------------------------------------------------------

- Alteração no método constructor dos DBObjects para inicialização do "Owner" do mesmo.
  Esse "Owner" sempre será a classe de controle que implementa as regras de negócios
  a serem persistidas pelo DB.
- Exclusão dos métodos DOSetConectionType, DoSetConnectionSide, DoSetConnection.
  A inicialização das propriedades das controls que eram feitas nestes métodos estão agora
  no AfterInitialize onde chamamos o método InitializeAs(Self) onde "Self" é 
  "a control que contém" a control a ser inicializada.
- Exclusão das referências e conexão com a aplicação servidora do padrão. Cada sistema
  se conecta apenas a sua aplicação servidora. Para isso é nescessário a implementação
  de alguns métodos nas aplicações servidoras. Tais implementações serão encaminhadas
  aos desenvolvedores.

---------------------------------------------------------------------------------
Padrões 05.06.13 - 31/05/20002
---------------------------------------------------------------------------------

- CMControlObject
  Implementação do tratamento do Session de conexão ao banco na aplicação servidora.
  É criado um Session para cada conexão garantindo segurança e maior controle das 
  conexões na aplicação servidora.
  É nescessário colocar no RemoteDataModule da aplicação servidora um TSession e
  passa-lo como parâmetro do método GeraDataBaseName no create do DataModulo.
  Outra alteração nescessária é o tratamento de erros das funções na aplicação servidora.
  Segue o código com o exemplo.
 > Função Atual

	function TMinhaAplicacaoServidora.MinhaFuncao: WordBool
	Begin
	  Result := MinhaClassedeNegocio.MinhaFuncao;
	  If Not Result Then
	    _MessageInfo := MinhaClassedeNegocio.MessageInfo;
	End;
	
 > Nova Implementação
	
	function TMinhaAplicacaoServidora.MinhaFuncao: WordBool
	Begin
	  Try
	    Result := MinhaClassedeNegocio.MinhaFuncao;
	    If Not Result Then
	      _MessageInfo := MinhaClassedeNegocio.MessageInfo;
	  Except
	    On E:Exception Do
	    Begin
	      Result := False;
	      _MessageInfo := E.Message; 
	    End;
	  End; 
	End;

 OBS: TODAS as funções da aplicação servidora tem de estar 
      "protegidas" por blocos TRY..EXCEPT. 

---------------------------------------------------------------------------------
Padrões 05.06.11 - 28/05/20002
---------------------------------------------------------------------------------

- Aplicação servidora do Padrão
  Customização de procedimentos para implementação de contrle de progresso para
  "processos bat" a serem executados pela aplicação cliente;

- Cadastro de Pessoa
  Correção na gravação do cadastro quando é "Reaproveitado" um pessoa já cadastrado
  num um outro subtipo;
  Correção na exibição dos dados do documento associado ao pessoa no momento da
  consulta\manutenção do registro;

- CMControlObjects
  Customização de procedimentos para implementação de contrle de progresso para
  "processos bat" a serem executados pela classe de controle;
  Correção no teste de preenchimento para cadastro de campos blob;

- Monitoração (Progress) de Processos em Bat ( "Aos Desenvolvedores" )
  Para Monitorae Processos em Bat disparados em um ControlObject devemos proceder
  da seguinte forma:
  
  1) Na classe de Controle O nosso método principal que dispara o processo deve possuir 
     além dos parâmetros do método um parâmetro adicional que recebera o nome do 
     "Bilhete" a ser monitorado. Ex.:
        Implementação normal:
             function TCtrlDataRepresa.AtualizaDataRepresa(IdPessoa: Integer;
                      Data: TDateTime): Boolean; 
        Implementação para o Progress:
             function TCtrlDataRepresa.AtualizaDataRepresa(IdPessoa: Integer;
                      Data: TDateTime; sNomeBilhete: String): Boolean;
  2) Na classe de Controle Os "pontos" da nossa rotina a serem Monitorados devem efetuar 
     uma chamada ao método DoProgresso passando o nome do bilhete ( que como no exemplo 
     acima é um parâmetro do método ) e os valores a serem monitorados ( que podem ser
     uma descrição, o nº do registro que está sendo processado, o total de registros
     a serem processados, etc... ). No final do método devemos deletar o bilhete gerado
     caso ele exista. Ex:

        function TCtrlDataRepresa.AtualizaDataRepresa(IdPessoa: Integer;
                  Data: TDateTime; sNomeBilhete: String): Boolean;
        Begin        

           (...)

           While Not _Cds.Eof Do
           Begin
              _MovEstoque.AtualizaSaldo( IdPessoa,
                                         Data+1,
                                        _cds.FieldByName('CODARTIGO').asString,
                                        cds.FieldByName('CODALMOXARIFADO').asInteger );
              _cds.Next;
              Inc(Valor);
   
              DoProgresso([sNomeBilhete,
                           cds.FieldByName('DESCALMOX').asString,
                           _cds.FieldByName('DESCPROD').asString,
                           Valor,
                           MaxValor]);
           End;

           (...)        
         
           If FileExists(sNomeBilhete) Then DeleteFile(sNomeBilhete);
        end;

  3)  No form da aplicação devemos implementar uma procedure com a seguinte assinatura:
      Procedure MinhaProceduredeProgresso ( vParams: Array of variant );
      Essa procedure deve ser atribuida ao evento Progresso da classe de controle onde 
      implemetamos os procedimentos descritos nos pontos 1 e 2 e deve conter o tratamento
      para as informações a serem monitoradas. Ex:

	      private        	
	         Procedure Progresso ( vParams: Array of variant );
	      
	      (...)
	
	      procedure TFrmMTDataRepresa.Progresso( vParams: Array of variant );
	      begin
	         GrpAnda.Caption     := vParams[1];
	         lblDescProd.Caption := vParams[2];
	         BarProd.Position    := vParams[3];
	         BarProd.Max         := vParams[4];
	
	         Repaint;
	      end;
      É importante lembrar que o primeiro item do array é o nome do bilhete e os valores 
      a serem monitoras os demais elementos.
      O número de elementos é sempre igual ao número de elementos passados no método 
      DoProgresso da classe de controle.  
      


---------------------------------------------------------------------------------
Padrões 05.06.10 - 21/05/20002
---------------------------------------------------------------------------------

- uDiasuteis
  Correção na  função de feriados onde considerava os feriados independente do âmbito
  dos mesmos: Nacional, Estadual e Municipal.
  Para seleção de feriados com âmbitos específicos deve se passar para o último parâmetro da
  função o Tipo de Feriado que deve ser levado em consideração de acordo com os valores:
  tfTodos, tfFederal, tfEstadual, tfMunicipal, tfMunicipalEstadual, tfEstadualFederal,
  tfMunicipalFederal. O Valor default é tfTodos;

- Cadastro de Fornecedor
  Correção na seleção dos valores para Natureza do Rendimento e Classificação Fiscal;

- Cadastro de Agência
  Correção na validação do número de agência: Foi incluso o número do banco na consulta
  de validação;

- uCtrlDocumento
  Correção na gravação da UnidadeNegoc nas classes de persistência do documento. Quando a unidade
  de negócio for nula o valor do parâmetro deve ser 0. 
  O valor -1 refere-se a unidade de negócio padrão.



---------------------------------------------------------------------------------
Padrões 05.06.09 - 21/05/20002
---------------------------------------------------------------------------------

- uDiasuteis
  Correção na  função de feriados onde considerava os feriados independente do ambito
  dos mesmos: Nacional, Estadual e Municipal.
  Para seleção de feriados com ambitos específicos deve se passar para o último parâmetro da
  função o Tipo de Feriado que deve ser levado em consideração de acordo com os valores:
  tfTodos, tfFederal, tfEstadual, tfMunicipal, tfMunicipalEstadual, tfEstadualFederal,
  tfMunicipalFederal. O Valor default é tfTodos;

---------------------------------------------------------------------------------
Padrões 05.06.06 - 21/05/20002
---------------------------------------------------------------------------------

- Associa Imagens
  Customizações para gravação de imagens do tipo JPEG e MetaFile na tela de associação
  de imagens.
  Correção na execução do LEULTREGISTRO para atribuição do ID da Imagens quando
  a aplicação está sendo executada em modo cliente.

- CMDbObjects
  Correção na atribuição do OldValue para DbFields do tipo Float e String.

---------------------------------------------------------------------------------
Padrões 05.06.05 - 21/05/20002
---------------------------------------------------------------------------------

- UCheqBloq
  Conversão para 3 Camadas;

- uEtiquetaCM
  Conversão para 3 Camadas;
- uCtrlTalaoCheque ( Antiga uCtrlCheque ).
  Conversão para 3 Camadas.
  A uCtrlCheque será descontinuada.

- uCMMath 
  Implementação das funções:
  > function StrToFloatCM(const sNumber: String): Double;
  > function FloatToStrCM(const rValor: Double): String;
  > Function RoundCM( Valor: Extended; Decimais: Integer ): Extended;

- uCMDialogs
  Implementação das funções:
  > function InputMemo(const ACaption, APrompt: string; var Value: string): Boolean;

- uCtrlImpostoRetido
  Conversão para 3 Camadas;

- uCtrlJurosCorrecao
  Conversão para 3 Camadas;

- uCtrDocumento
  Término da conversão para 3 camadas com as funções de contabilização e retenção de imposto;

- uFuncao Geral
  Conversão para 3 Camadas;

  1) As Funções\Métodos abaixo serão descontinuadas, favor substituir pelas indicadas.

     - function OraNumero(rNumero : Double ):string >> Substituir por FloatToStrCM ( uCMMath )
     - Function Elevado(nBase,nExpoente:Double):Double; >> Substituir por Power ( math )
     - Procedure TiraIcone;


  2) As funções abaixo estão implementadas na uString Por questões de compatibilidade a chamada como
     método da FuncaoGeral ainda está implementada mas será descontinudada. É necessário a
     inclusão da uString na cláusula uses das units que utilizam tais funções e a exclusão da referência
     "FuncaoGeral." na chamada das mesmas.

     - Spc
     - AD >> Substituir por AlDireita ( uString )
     - AE >> Substituir por AlEsquerda ( uString )
     - RemoveChar

  3) As função abaixo esta implementada na uDiasUteis Por questões de compatibilidade a chamada como
     método da FuncaoGeral ainda está implementada mas será descontinudada. É necessário a
     inclusão da uDiasUteis na cláusula uses das units que utilizam tal função e a troca da                     referência "FuncaoGeral." na chamada das mesma por "DiasUteis.".
  
     - UltimoDiaMes

  4) As funções abaixo estão implementadas na uDataBase Por questões de compatibilidade a chamada como
     método da FuncaoGeral ainda está implementada mas será descontinudada. É necessário a
     inclusão da uDataBase na cláusula uses das units que utilizam tais funções e a exclusão da referência
     "FuncaoGeral." na chamada das mesmas.

     - MoveRegistros
     - VerificaLinhaGrid
     - FechaQry



---------------------------------------------------------------------------------
Padrões 05.06.03 - 08/05/20002
---------------------------------------------------------------------------------

[ CMForms50 ]

Cadastro de Banco 
- Correção na seleção dos dados bancários 
Cadastro de Fornecedor 
- Alteração do nome da pasta de "Tipos de Recebimento" para "Tipos de Desembolso" 
Cadastros de Pessoa ( Todos ) 
- Correção na visualização da pasta de "Dados Pessoais" para pessoa física. 

---------------------------------------------------------------------------------
Padrões 05.06.01 - 06/05/20002
---------------------------------------------------------------------------------

[ CMPadroesSvr50 ]
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Fornecedor
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Cliente
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Banco
- Implementação dos Métodos para Otimização da Classe de Negócio\ Tela do Cadastro de Agência

[ CMCompo / CMForms ]

- Otimização da Classe de Negócio\ Tela do Cadastro de Fornecedor
- Otimização da Classe de Negócio\ Tela do Cadastro de Cliente
- Otimização da Classe de Negócio\ Tela do Cadastro de Banco
- Otimização da Classe de Negócio\ Tela do Cadastro de Agência
- Correção no processamento para envio de raltórios por e-mail

---------------------------------------------------------------------------------
Padrões 05.05.46 - 04/04/20002
---------------------------------------------------------------------------------

- CMDbObjects
  Correção na montagem do sql de insert para colunas do tipo data: Estava concatenando
  de forma errada a frase a partir do campo data.

- CMSqlParams
  Implementação do método sqlparam.CLEARLINES para exclusão das linhas do SQL
  que contiverem o parâmetros.
  Correção do evento OnFormat param para passagem do parãmetro sem formatção
  no lugar do parâmetro formatado

- CmReportManager, CMAppEvents
  Customizações gerais para visualização dos relatórios no padrão novo utilizando um tela
  de parâmetros customizada.

[ CMFORMS50 ]

- FrmParamReports_Padrao
  Implementação do form para utilização de telas de parâmetros customizadas para
  relatórios desenvolvidos no padrão novo. ( Segue documentação em anexo ).
- FrmPrincipal
  Customizações para visualização de relatórios implementados no padrão novo.

---------------------------------------------------------------------------------
Padrões 05.05.41 - 26/03/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CMParamReports
  Customizações no componente para compatibilização com o modelo 3 camadas;

- CmCtrlObjects
  Correção na atribuição de valores para os DbOjects no método ApplyCds para 
  registros que não sofreram alterações.

- Pessoa
  Inclusão da propriedade Pessoa.ObrigaDocumento para controle juntamente com a 
  propriedade Sistema.ObrigaDocPessoa da obrigatoriedade da digitação do número do
  documento na tela.
  Valor default = true.  

- CmParamIntegra
  Correção na inicialização dos parâmetros referentes a contabilização do sistema

- CmDbObjects
  Implementação da variável _UpdateKeyFields do tipo boolean com valor default false.
  Esta variável controla a alteração dos campos da chave primária no update;

- CMReportManager, FcmReports
  Alterações para a visualização de relatórios em tela única;

[ CMFORMS50 ] 

- FConfigReports
  Alterações para visualização de relatórios na tela do padrão com as opções de 
  Abrir e Salvar Arquivo de Relatórios, Visualizar e Imprimir no Acrobat Reader,
  Enviar Relatório por e-mail, Função de "Ir para a página" e imprimir relatórios para
  formatos diversos.

[ CMBACK50 ]

- Cadastro de Clientes
  Alteração do campos "% de comissão" do cliente para "% de comissão" do promotor;

- Cadastro de Tipo de Alterador X Conta X Programa X Centro de Custo
  Inclusão do alter join no campo referente ao programa na procura da tela pois o 
  mesmo é opcional.

- Cálculo de Impostos/Agregados
  Correção na seleção do fornecedor para baixa de vários documentos que geram impostos
  do tipo "gera documentos associados a imposto".
  Inclusão do número do documento de origem + nome do fornecedor ou nº do lote no histórico
  contábil e de lançamento do documento associado ao imposto.


---------------------------------------------------------------------------------
Padrões 05.05.40 - 19/03/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Visualizador de Relatórios Genérico
  Customização do Visualizador de Relatórios Genério para compatibilização da
  exibição dos relatórios para Web nos Sistemas.
  Foi implementado também todas as ferramentas existentes no Visualizador Padrão como
  Abrir e Salvar Arquivo de Relatórios, Visualizar e Imprimir no Acrobat Reader,
  Enviar Relatório por e-mail, Função de "Ir para a página" e imprimir relatórios para
  formatos diversos.
- CmReportManager
  Alteração nas funções de Imprimir para compatibilização da exibição dos relatórios 
  para Web nos Sistemas.

[ CMBACK50 ]

- Implementação do método GetContaContabil
  Busca a conta contábio associada ao tipo de desembolso\recebimento passado como 
  parâmetro  verificando a existência do relacionamento com centro de custo, programa e
  plano previdenciário antes.


---------------------------------------------------------------------------------
Padrões 05.05.39 - 18/03/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- TCmListDialog
  Implementação do componente.
  Exibe uma caixa de diálog para seleção e manutenção de uma lista de itens. Tais itens 
  podem ser pre-definidos como Diretórios, Arquivos ou uma lista de Strings.

[ CMEXPERTS50 e SAD ]

- Cadastro de Módulo
  Inclusão de opção para indicar o tipo de projeto: Executável Padrão, Bpl ou DLL para
  que a compilação dos módulos seja executada de forma específica para cada
  finalidade.
  Alteração na inclusão do Path dos fontes do projeto;

---------------------------------------------------------------------------------
Padrões 05.05.38 - 13/03/20002
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Correção na liberação dos objetos referentes a conexão com o servidor de aplicações.
- Correção na criação dos Alias para conexão com as instâncias SUPR e INT devido
  a física de servidores;

[ SAD / CMEXPERTS50 ]

- Correção na liberação de versão via FTP devido a mudança de servidor de aplicativos.

---------------------------------------------------------------------------------
Padrões 05.05.35 - 08/03/20002
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Cadastro de Fornecedor
  Implementação em "3-Camadas"
- Pessoa
  Customizações na exclusão e gravação de dados referente ao Tipo de pessoa selecionado.
- Tela Principal
  Inclusão dos "links" (HelpContext) dos items de menu com o arquivos de help dos
  sistemas fazendo com que o help seja "Sensível ao Contexto"
- Implementação da inicialização automática do componente para conexão com
  o Servidor de Aplicações de acordo com os parâmetros do sistema.
  Foram adicionados 3 compoenentes novos no form principal responsáveis pela conexão
  com o Servidor de Aplicações: Skt ( Conexão via Win Socket ), DCom ( Conexão via DCom )
  e Web ( Web Connection ). De acord com os parâmetros do sistema esses componentes
  são atribuídos a Sistema.AppRemoteServer para serem manipulados em qualquer ponto
  do sistema independente do tipo de conxão.

[ CMCOMPO50 ]
- Cusotmizações nos CtrlObjects e DbObjects;
- Implementação da criação automática das classes de negócio do Padrão dos 
  Parâmetros de Integração;

---------------------------------------------------------------------------------
Padrões 05.05.34 - 05/03/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CmControlObjects
  Implementação do método OnCreateAppServer.
  Este método deve ser sobrescrito para implementação dos "Creates" dos ClientDataSets
  da classe de negócio.
  A implementação anterior utilizava a propriedade IsAppServer no Constructor Create para
  inibir a criação dos ClientDataSets. Tal implementalçao não funcionou corretamente pois
  no create da classe o IsAppServer sempre retorna FALSE.
  O teste do Destroy continua o mesmo.
- Controle de Sequences
  Correção no teste da existência do sequence no banco no momento da criação do mesmo.
  O sequence só será criado se quando a solicitação do valor do mesmo retornar um erro 
  gerado falta do objeto no banco;
- Componente para consulta a Cliente e Fornecedores
  Alteração no SQL colocando a tabela PESSOA como primeira da cláusula FROM;

[ CMFORMS50 ]

- Cadastro de Usuário
  Otimização do SQL de seleção de usuário invertendo a ordem das tabelas na cláusula FROM;
- Pessoa
  Otimização na consulta de seleção de CIDADES: Alteração no SQL colocando a tabela CIDADES 
  como primeira da cláusula FROM;


---------------------------------------------------------------------------------
Padrões 05.05.33 - 04/03/20002
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Cadastro de Pessoa
  Customizações no processamento das tabelas "adicionais" ao pessoa ( Endereço,
  Contato, Telefone, Conta Bancária e Subtipo )
- Cadastro de Cliente
   Implementação do cadastro de cliente no modelo "3-Camadas"
- ParamIntegra
  Implementação da "uIntegraBack" no modelo "3-Camadas"

- Cadastro de Pessoa
  Customizações no processamento das tabelas "adicionais" ao pessoa ( Endereço,
  Contato, Telefone, Conta Bancária e Subtipo )
- Cadastro de Cliente
   Implementação do cadastro de cliente no modelo "3-Camadas"

[ CMCOMPO50 ]

- Control Objects e DbObjects
  Customizações no processamento de exclusão de registros

---------------------------------------------------------------------------------
Padrões 05.05.32 - 27/02/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CMControlObjects
  Correção no método ApllyCds para tratamento de "múltiplas alterações" num mesmo
  registro a ser "aplicado".
- CMDbObjects
  Correção no método de gravação de campos do tipo BLOB.

[ CMFORMS50 ]

- PessoaMT
  Customizações gerais na gravação de imagens associadas ao pessoa e aos documentos;
  Correção na gravação de telefone e contatos.
- Cadastro de Agência
- Cadastro de Banco
  Implementação do "novo" cadastro de Agência e Banco com suporte e "3 Camadas".
  As chamadas aos forms de Agência e Banco de vem ser substituidos pelos novos pois
  serão descontinuados.
  Agência: 
  > Form: FrmPessoaAgencia
     Classe: TFrmPessoaAgencia
     unit: fPessoaAgencia
  Banco:
  > Form: FrmPessoaBanco
     Classe: TFrmPessoaBanco
     unit: fPessoaBanco


---------------------------------------------------------------------------------
Padrões 05.05.31 - 26/02/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CMProcura
  * plementação da propriedade
  > ReadOnly - Inibe a digitação na caixa de texto orbigando a procura pela consulta.
- CMControlObjects, CMDbObjects
  * Implementação dos métodos:
  > ExecSql - Executa a instrução SQL passada como parâmetro. Retorna false quando 
     ocorre erro e a mensagem de erro é atribuída ao messageinfo;
  > GetNextID - Retorna um inteiro sequencial negativo incrementado automaticamente
     pela classe. Pode ser utilizado para cadastros mestre detalhe onde efetuamos algum
     tipo de filtro entre o mestre e o(s) detalhe(s);
  * Implementação da propriedade:
  > IsAppServer - Inicializada pelo método initialize ( Último parâmetro ). Dever ser
     utilizada para identificar se a classe de controle foi instanciada pela aplicação /
     servidora para que possamos diferenciar algum procedimento entre as execuções.
     Exemplo: Os ClientDatasets das classes de controle utilizados para "link" com os
     objetos do form só devem ser "criados" na classe de controle se esta estiver sendo
     executada pela aplicação servidora. 
     Esta propriedade difere do ConnectionSide uma vez que num mesmo executável
     podemos ter a classe de negócio funcionando como cliente ( n-tier ) e 
     servidor  ( Client-Server )
   * Implementação do evento
   > AfterApplyCdsRecord - Executado após o processamento de cada registro no
      ApplyCds. Possui os mesmos parâmetros do OnApplyCdsRecord.

[ CMFORMS50 ]

- PessoaMT
  Implementação do form de PESSOA com suporte a Multi Camadas bem como das
  seguintes classes de controle:.
  * PESSOA
  * ENDPESS
  * TELENDPESS
  * CONTATOPESS
  * TELCONTATO
  * DOCPESSOA
  * PESSOAFISICA
  * BANCO
  * AGENCIA
  * CONTABANCÁRIA
  * IMAGENS

---------------------------------------------------------------------------------
Padrões 05.05.30 - 20/02/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- SQL Server
  Implementação dos parâmetros para conexão com o SQL Server até versão 7 via
  BDE e versões superiores via ODBC.
- Monta Select
  Correção da pergunta sobre indicação dos parâmetros na pesquisa do montaselect;

---------------------------------------------------------------------------------
Padrões 05.05.29 - 19/02/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CMDbObjects
  Correção na montagem das sentença WHERE para tabelas com campo do tipo
  DATE na chave primária.
- CMControlObjects
  Correção na atribuição da propriedade DATABASENAME no momento da atribuição
  do TDATABASE da clase.
  Essa falha na inicialização gerava um erro na execução do método GETSEQUENCE
  através da classe de controle.
- MontaSelect
  Customizações no montaselect para execução a partir de uma aplicação servidora

[ CMBACK50 ]

- Inclusão das Novas Classes de Integração com Contabilidade e CapCar.
  A documentação das classes será instalada pelo padrão na pasta 
  C:\ProjetosCM5\CM\Docs ( IntegraContab.Doc e IntegraCapCar.Doc).
  Essas classes foram desenvolvidas utilizando as classes de negócio para utilização
  em tres camadas.



---------------------------------------------------------------------------------
Padrões 05.05.28 - 06/02/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CmControlObjects
   Impementação do Método ExecSql que executa intruções de Insert, Delete e Update
   passadas como parâmetro retornando false caso ocorra erro na execução do comando
   ou se o comando não alterar registros no banco ( Opcional, vide parâmetro ).
   A mensagem de erro é automaticamente atribuída ao MessageInfo.

[ CMBACK50 ]

- Cadastro Clientes
  Correção da consulta a tabela de cliente quando existe a integração com o FRONT no
  momento do cadastro;

- Configuração de Etiquetas
  Correção no formato de gravação do Layout de "binário" para "ascii'.
  Se gravado no formato binario gerava erro no momento da impressão do layout.

---------------------------------------------------------------------------------
Padrões 05.05.27 - 31/01/20002
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Visualizador de Relatórios
  Correção do "Acces Violation" na execução do DuploClick na arvore do visualizador de reatórios.
- FIltra SQL
  Customizações genéricas natela de filtragem de realtórios.

[ CMCOMPO50 ]

- uMidasUtil
  > Procedure FreeCds(cds: array of TClientDataSet);  
     Verifica para cada ClientDataset do array se o mesmo está ativo, fecha, limpa o endereçamento do mesmo caso esteja
     associado a outro controle e destroy o mesmo
  > Procedure CopyCdsRecord( CdsOrigem, CdsDestino: TClientDataSet; DeleteSource: Boolean = True);  
     "Appenda" os registros do CdsOrigem no CdsDestino e apaga o registro origem de acordo com
     o parâmetro DeleteSource.
     Os ClientDataSets devem possuir os mesmos Campos e na mesma ordem

---------------------------------------------------------------------------------
Padrões 05.05.26 - 30/01/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Seleciona Pessoa
  Correção no texto "Items" para "Itens"

- CMControlObjects
  Alteração nos parâmetros do evento OnApplyCdsRecord.
  procedure OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);

[ CMFORMS50 ]

- Consulta Log de Opções
  Correção no layout da tela quando a mesma é redimensionada.

- Visualizador de Relatórios
   Otimização na exibição da tela de filtro para relatórios feitos pelo gerador e visualizados
   nos sistemas.

---------------------------------------------------------------------------------
Padrões 05.05.24 - 29/01/20002
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Cadastro de Usuarios
  Inclusão da opção para controlar a exibição dos usuários desabilitados.

[ CMCOMPO50 ]

- uSistema
  Inclusão da propriedade PedeLoginEmpresa que controla a exibição da tela de login por
  empresa. O valor default e TRUE.


---------------------------------------------------------------------------------
Padrões 05.05.23 - 25/01/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- LeutlRegistro
  Inclusão da verificação de parametrização para criação de sequences a partir de um
  valor ou faixa de valores definidos.
  Essa parametrização é efetuada na tabela faixa sequence através da inserção de um
  registro com a sequinte frase:
  INSERT INTO FAIXASEQUENCE (NOMESEQ, VLRINISEQ [, VLRFINSEQ]) 
  VALUES ('CM_SEQCENTRALIZA', valorinicial [, valorfinal]);
  Essa inserção faz com que todos os sequences criados nesta base sejam iniciados com
  o valor de "valorinicial" e tenham um valor máximo caso seja informado o "valorfinal"
- CMCtrlObject
    Alteração na procedure OnApplyCdsRecord para inclusão de um parâmetro de controle
    do número de ApllyCds chamados pela classe:
    >>> procedure OnApplyCdsRecord(IdApply: Integer; Var Accept: Boolean); Virtual;
    Esse controle é utilizado quando forma aplicar as aterações em vários "Detalhes com Grid"
    e precisamos diferenciar procedimento para cada Apply executado.
    O Método AppluCds também foi alterado e adicionado o Parâmetro para identificação
    da execução do mesmo:
    >>> foi incluso o parâmetro IdAplly com valor default = 0.

---------------------------------------------------------------------------------
Padrões 05.05.22 - 24/01/20002
---------------------------------------------------------------------------------

[ CMBACK50 ] 
- Cadastro de Cliente \ Fornecedor
  Pasta de Dados Bancários: Inclusão de PoupUp Menu para seleção do tipo de conta ?
  quando o banco escolhido for caixa econômica;
- Cadastro de Fornecedor
  Inclusão de painel para autorização na pasta de Impostos;
  Inclusão do campo para informação do tipo de endereço no grid da Pasta de 
  Endereços;
- Cadastro de Cliente
  Ordenção do Combo de Tipo de Cliente  

[ CMFORMS50 ]
- Implementação da visualização\impressão dos relatórios pelo Acrobat® Reader a
  a partir da tela de visualização de relatórios.
- Cadastro de Pessoa
  Inclusão da Identificação do Tipo de Endereço no Grid de Endereços

[ CMCOMPO50 ]
- Classes de Negócio
  Implementação da procedure OnApplyCdsRecord(Accept: Boolean) na classe de
  Controle ( TCmCtrlObject ). Essa procedure deve ser sobrescrita caso seja
  nescessário algum tratamento ao registros do ClientDataSet aplicados pelo
  método ApllyCds ( Utilizado para Cadastros com Grid );
  Implementação do um Var privado _Cds: TClientDataSet;
- CmProcuraSubTipo
  Correção na atualização do campo associado ao control quanto limpamos o conteúdo do edit da pesquisa;
  Inclusão da coluna "IDPESSOA" no MontaSelect da Pesquisa.


---------------------------------------------------------------------------------
Padrões 05.05.21 - 22/01/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]
- CmDbObjects
  Implementação da gravação de dados do Tipo Blob.
  Os DbFields que farão a persistencia de dados em colunas do Tipo LONG RAW 
  devem ser declarados como o DataType ftBlob para a gravação dos dados no banco
  funcionar corretamente.
  Os DbFields que farão a persistencia de dados em colunas do Tipo VARCHAR até
  4000 caracteres deverão ser declarados com ftString.

---------------------------------------------------------------------------------
Padrões 05.05.20 - 22/01/20002
---------------------------------------------------------------------------------

[ CMEXPERTS50 ]
- Bussines Object Builder
  Correção na montagem da função de criação dos DbFields para o parâmetro Not Null.

[ CMCOMPO50 ]

- CM Control Object
  Correção no método ApplyCds: A ordem de atribuição dos parâmetros do Client
  DataSet para o DbObject estava anulando a atribuição dos valores dos campos
  chave passados como parâmetro.
  A ordem de execução foi invertida.

---------------------------------------------------------------------------------
Padrões 05.05.19 - 18/01/20002
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- FCadastroCMMT
  Implementação do envento AfterConfirma.
  Este evento deve ser implementado para o "refresh" dos ClientDataSets envolvidos
  no cadastro.
  Para Cadastros simples este refresh já está implementado, não sendo nescessário a 
  implementação do evento.
  Para Cadastros Mestre-Detalhe o(s) ClientDataSet(s) do(s) Detalhe(s) deven ser
  tratados nesse evento através do método RefreshCds([ array of TClientDataSet ]) 
  implementado na uMidasUtil.

[ CMCOMPO50 ]

- TCmTreeViewMT
   Implementação do componente DbTreeView hierárquico para ser utilizado com
   ClientDataSets.
   Esse treeview é semelhante ao CMTreeView diferenciado apenas nas propriedades
   de CampoChave, CampoTipo e CampoDescrição que agora são informadas como
   strings.
   As telas que utilizam o CMTreeView ao serem convertidas para Mult-Camadas
   deverão utilizar o CMTreeViewMt.
   Esta intalado na paleta de componentes CMDataControls

- CmControlObject
  Implementação do método GetDataPacket(Sql: String): OleVariant.
  Este método deverá ser utilizado nas classes de controle em funções que proverão dados
  para DbComboBoxes e DbGrids.
  Ela resulta um OleVariant que deverá ser atribuído a propriedade Data do ClientDataSet
  associado ao Combo ou ao Grid.
  TODAS as funções de preenchimento desses controles deverão utilizar este método
  e, como dito acima, os dados serão providos ao ClientDataSet através da propriedade 
  Data. Desta forma teremos o código mais encapsulado e padronizado para todas
  as classes de negócio.
  As funções implementadas poderão ser diferentes apenas na quantidade de parâmetros
  definidos. Ex:
    - Classe de controle de Pais: function ListPais: OleVariant.
    - Classe de controle de Estado: function ListEstado(IdPais: Integer): OleVariant.
    > As implementações diferem pois posso querer selecionar apenas os estados de 
       determinado pais ( no caso da classe de Estado ).
       No caso do pais, sempre vou retornar todos os países cadastrados.
  As implementações dessas funções ( batizadas de "funções tipo LIST" ) deverão ser
  feitas nas classes de controle das mesmas. Ex:
     - Classe de controle do Centro de Custo: function ListCentroCusto(.....)
       Nessa classe devo prover os dados da tabela centro de custo bem como
       de todas as queryes em que o resultado desejado envolve um conjunto de
       centro de custos. Podemos citar o caso do relacionamento Contas Contábeis X
       Centro de Custo. A função ListCentroCusto deve prever um filtro pela contá
       contábil, já que o resultado desejado envolve um conjunto de Centro de custo.
       Caso o meu conjunto resultante seja das Contas Contábeis associadas a um
       determindado Centro de Custo, a função do tipo LIST deve ser implementada
       na classe de controle da Contabilidade.

---------------------------------------------------------------------------------
Padrões 05.05.18 - 16/01/20002
---------------------------------------------------------------------------------

[ CMCOMPO50 ]
- Implementação de evento para log de operações na Importação do TransfRelatórios;
- Implementação de funcionalidades para os cadastros MT com Grids ( Cadastro comum e Cadastro Mestre Detalhe );
- Implementação do método ReportExists na classe de controle dos relatórios: Verifica se o relatório identificado pela propriedade IdReports está implementado na classe;
- Implementação do método ApplyCds na CmCtrlObject para processamento de cadastros grid e mestre detalhe;


[ CMFORMS50 ]
- Correção do Cadastro de Pessoa Física na tela de Uso Pessoal;
- Customização do tamanho do Form Aguarde de acordo com o tamanho da mensagem ( by Turom )
- Implementação da Visualização dos relatório implementados para Web no sistema windows.
- Implementação de funcionalidades para os cadastros MT com Grids ( Cadastro comum e Cadastro Mestre Detalhe )
  Documentação a ser liberada em 18/01/2002;
- Inclusão do Registro do MIDAS.DLL no AtualizaCM
- Correção no link do grid de detalhe com o datasource no Cadastro Mestre Detalhe MT
- Customização na telas de vizualização de relatórios e componente de eventos da aplicação para utilização dos relatórios feitos para o WebCM dentro do sistema. 
  Documentação a ser liberada em 18/01/2002;

---------------------------------------------------------------------------------
Padrões 05.05.16 - 27/12/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CMDbObjects
  Inclusão da Propriedade DisplayName nos CMDbFields;

- CMControlObjects
  Alteração no método CreateCMDbFields para inclusão do parâmetro para   inicilização da propriedade DisplayName do DbField.
  Caso esse valor não seja informado, é atribuido o Nome da Tabela + O Nome da   Coluna.

- CMDbObjects
  COrreção no método Clear e no IsNull para DbFields do Tipo TDataTime.

- uMidasUtil
  Implementação da Procedure RefreshCDS(aCds: array of TClientdataSet) que
  {Faz um "Close Open" nos ClientDataSets passados como parâmetros}

- CmParamReports, CMReportManager, CMControlReports
  ALterações genéricas para compatibilização dos relatórios do sistema para a
  visualização dos mesmos pela internet.

[ CMFORMS50 ]

- fCmReports
  ALterações genéricas para compatibilização dos relatórios do sistema para a
  visualização dos mesmos pela internet.

[ CMEXPERTS50 ]

- Bussines Object Builder
  Inclusão da coluna para indicação do Display name dos DbFields

---------------------------------------------------------------------------------
Padrões 05.05.15 - 14/12/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CMParamReport
  Inclusão de propriedade ExibeFormParams: controla a execução do form de parâmetros quando o
  relatório for impresso.

- CMReportManager
  COrreção na ordem de inicialização dos parâmetros para impressão de relatórios

- CmEventosCadastro
  Implementação dos Eventos
  * ApplyInsert, 
    ApplyEdit, 
    ApplyDelete: Estes eventos e são disparados na confirmação do cadastro
                 após o BeforeConfirma de acordo com a operação do cadatro (OpInserir, OpAlterar e OpApagar).
                 Tais eventos facilitarão a implementação das chamadas aos métodos de confirmação
                 das classes de negócio nos cadastros do tipo MT.
  * OnAbortConfirma : Disparado quando é atribuído false ao o var do evento Onconfirma, ApplyInsert, 
    ApplyEdit or ApplyDelete. Esse evento possui um parâmetro que indica de qual evento a Confirmação
    foi 'Abortada' (OaBeforeConfirma, OaApplyInsert, OaApplyDelete, OaApplyEdit).


- CmDbObject
  Inclusão dos Métodos RecordCount, First, Prior, Next, Last, Eof, Bof a serem utilizados quando
  o método LoadFromDB traz mais de um registros.
  
[ CMFORMS50 ]

- fCmReport
  Correção na ordem de inicialização dos parâmetros para exibição dos relatórios
  no Site WebCM.
  Inclusão de parâmetro para habilitar a exibição da tela de parâmetros do componente
  de Parâmetros do Relatório.

[ CMExperts ]

- Correção na montagem dos DbObjects na formatação do nome da tabela na função
  GetSequence;
- Exclusão do assisatente para "Conversão de Projetos Delphi 3 - Delphi 5";

[ CMBACK50 ]

- RAD
  COrreção do "Acces Violation" nas funções de integração com o RAD.


---------------------------------------------------------------------------------
Padrões 05.05.13 - 04/12/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- CmControlObject e CMDbObject
  Customizações genéricas nos objetos de negócio. Vide documentação.

[ CMFORMS50 ]

- Telas de Cadastro MT ( Multi Tier )
  Customizações genéricas nos objetos de negócio. Vide documentação.

[ CMBACK50 ]

- uDocumento
  Correção de erro na integração com RAD


---------------------------------------------------------------------------------
Padrões 05.05.12 - 04/12/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- uSistema
  Criação da Propriedade AppRemoteServer que representa o Componente de conexão com
  com a aplicação servidora a ser usada pelo Módulo.
  A propriedade RemoteServer representa a conexão com a aplicação servidora do padrão.
  O AppRemoteServer é inicializado com os mesmos parâmetros de conexão do RemoteServer
  fazendo-se necessário apenas informarmos o nome da nossa aplicação servidora.
  Tal configuração de parâmetro é feita pelo REGEDIT ou pela inicialização da aplicação com
  o parâmetro -p ( recomendável ).

[ CMFORMS50 ]

- uRad
  Correção na criação do DataModulo de Acesso a Dados


[ CMBACK50 ]

- uDocumento
  Correção na criação de objetos para integração com o RAD



---------------------------------------------------------------------------------
Padrões 05.05.11 - 28/11/20001
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Cadastro de Pessoa
  Inclusão de TODOS os campos da tabela pessoa física na QueryPessoaFisica do
  cadastro de pessoa.
  Tal implementação evitara erros no cadastro quando forem inclusas novas colunas
  na tabela PESSOAFISICA.
  Os subtipos que utilizam colunas específicas na tabela PESSOAFISICA devem
  alterar seus forms de PESSOA executando um "Revert To Inherited" na QryPessoaFisica
  e no UpdateSql dessa Query.
  A partir dessa implementação QUALQUER coluna adicional da tabela PESSOAFISICA
  deverá ser adicionada a partir do PADRÃO.


---------------------------------------------------------------------------------
Padrões 05.05.10 - 22/10/20001
---------------------------------------------------------------------------------


[ CMCOMPO50 ]

- uSistema
  Correção na incialização das propriedades referente ao Controle de Senhas e Acesso do
  sistema.

[ CMFORMS50 ]

- Cadastro de Usuários e Alteração de Senhas
  Inclusão da verificação da senha de acordo com o Nome\Sobrenome do usuário.
  O parâmetro para tal validação é indicado na tela de Parâmetros do Global.

[ CMBACK50 ]

- Cadstro de Clientes, Fornecedores
  Inclusão automática dos códigos do tipo de conta para as contas da Caixa Econômica Federal.

[ GLOBAL ]

- Cadastro de Moedas Cotação e Qualificação
  Inclusão de campo para indicar a Descrição da Unidade da Taxa.

- Parâmetros
  Inclusão de parâmetro para verificação da senha de acordo com o Nome\Sobrenome do usuário.
 


---------------------------------------------------------------------------------
Padrões 05.05.09 - 20/10/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- uSistema
  Criação da Propriedade Sistema.EmailOnError: String;
  Esta propriedade persiste o conteudo da coluna EMPRESAPROP.EMAILONERROR que deve ser
  preechida pelo cliente ou na instalação dos sistemas caso queira que as mensagens de 
  erro genérica dos sistemas sejam enviadas para um e-mail diferente do suporte@cmsolucoes.com.br.

- CMProcuraMask
  Alteração na visualização dos dados no Grid quando a validaçâo leva em conta o tipo
  do registro: Só analitico, Só Sintético ou Todos.
  São exibidos todos os registros no grid e o Tipo só é levado em conta na validação da seleção.

- MontaSelect
  Inclusão da Validação dos dados digitados de acordo com o Tipo de Dado do campo a ser pesquisado;

- CMParamReports
  Inclussão dos Controles MaskEdit e SpinEdit no Param Reports;
  Inclusão para propriedade ItemIndex para controles do tipo ComboBox e ListBox;
  Inclusão da propriedade Name ( Caso não esteja preenchida assume o Caption );
  Inclusão Do método ParamBYname para busca do Parâmetro.

- Instalação do demo de Criação e Utilização de Objetosa de Negócio em 
  C:\ProjetosCM5\Cm\Demos\DemoBO

- CMDbObject
  > Implementação do método Clear dos fields do DbObject;
  > Implementação do médodo Clear do DbObject que limpa o conteúdo de TODOS os Fields do DbObject;
  > Correção na procedure FreeArray. Apresentava o erro de 'Invalid Pointer Operation' e 'Acces
    Violation' ao liberar ponteiros de arrays do tipo Strig;
  > Video o DEMO em C:\ProjetosCM5\Cm\Demos\DemoBO.
  > Correção na seleção dos campos da consulta do método LOADFROMDB
  > Correção na atribuição dos valores com AsInteger para o métodos AsFloat.

- CmControlObject
  Implementação da função de Classe CreateControlObject para criação automática
  das instâncias das classes de Controle.

[ CMFORMS ]

- Pessoa
  Inclusão das colunas VLRINISS e VLRPENSAO no cadastro de pessoa física.
  Os desenvolvedores que possuem colunas específicas nessa tabela não esquecer de voltar ao componente
  original com "Revert to Inherited" e adicionar as colunas particulares.

[ CMADD50 ]
- Inclusão dos Componentes TFixedFormatDataSet,TSdfDataSet.
  Tais componententes são DATASETS para arquivos textos de formato fixo ou delimitados
  por caracteres. São excelentes ! Vc 'associa' um arquivo texto e depois trabalha como
  se fosse um TABLE. Pode fazer tudo: Inserir, Alterar, Excluir, Procurar, Exibir num Grid,
  utilizar qualquer data control, etc...
  Ideal para processos que envolvem importações a partir de arquivos textos e exportações para
  arquivos textos.
  Sem contar que ele é rápido, muito rápido.

[ CMEXPERTS50 ]
- Object Builder
  Correção na montagem das classes de persistência:
  > Atribuição do nome do sequence com aspas.
  > Inclusão do Inherited no método loadfromDB.
  > Correção na função de criação de acordo com parâmetros de ReadOnly e NullIfZero

[ CMSQL50 ]
- Correção nas traduções do com máscara de data do tipo 'DD', 'MM', 'YYYY', 'YY'

[ CMBACK50 ]

- Cadastro de Clientes
  Atualização da situação de Crédito dos contratos dos clientes no VHL e VHF automaticamente
  de acordo com a situação de crédito no cadastro do cliente.

- Corrções das funções RTRIM com parâmetros para o DB2 nos seguintes cadastros:
  Clientes;
  Contas Bancárias;
  Forncedor;
  Recebimento\Desembolso X Imposto;
  Tipo de Recebimento\Desembolso;
  Alterador X Centro de Custo X Conta X Programa.



---------------------------------------------------------------------------------
Padrões 05.05.08 - 27/10/20001
---------------------------------------------------------------------------------

[ CMEXPERTS50 ]

- Implementação do CM Bussines Object Builder
  Assistente para criação de classes de persistência e controle para objetos de negócio CM.
  Acessado pelo menu CM Soluções\Bussines Object Builder do Delphi.

[ CMCOMPO50 ]

- Alterações nas classes de negócio CM
   TCmControlObject
   Inclusão do Método
   Protected
     procedure CdsToDbObject(Cds: TClientDataSet; var DbObject: TCmDbObject);
     {Move os campos do ClientDataSet da aplicação cliente para o objeto de persistência}

   TCmDbObject
   Inclusão dos Métodos e propriedades
   Private            
      function GetSqlSelect: String; Override;
      {Monta a frese de select utilizada pelos métodos ChangeSelect e LoadFromDB}   
    
   Public
      
       property Qry: TwwQuery read FQry;
       {Query com os dados crregada pelo método ChangeSelec}
       property Dsp: TDataSetProvider read FDsp;
       {DataSet Provider para link da Qry com o ClientDataSet da aplicação cliente se este operar
        em modo servidor}
       procedure ChangeSelect; Virtual;
       {Monta a frase de select de acordo com os valores atribuidos aos campos chave}

- Monta Select
  Alterações para utilização das customizações efetuadas nas classes de negócio CM para
  acesso a dados em aplicações distribuídas.
---------------------------------------------------------------------------------
05.05.06 - 25/10/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Correção de erros de violação de memória nos componentes CMProcura e GImp;

- Fluxo de Operações
  Correção na execução do fluxo de operações no momento de fechar as telas: Erro
  list index out of bounds;

[ CMFORMS50 ]

- Atualização Automática de versão
  Inclusão do registro das OCX´s do Formula 1 no momento da atualização de versões;

- Login
  Correção no temporizador do logout automático;

- Correção na visualização do menu de consulta a participante;

- Atribuição de Direitos de Usuário e Grupo
  Correção na consulta de seleção das operações para acesso do usuário;
  Correção na atualização dos direitos no banco: Exclusão da colunma IDPESSOA nas
  instruções de UPDATE das atualizações;

---------------------------------------------------------------------------------
05.05.00 - 02/10/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Correção na atribuição do Database para conexão das telas do Monta Select quando
  o sistema utiliza mais de um database e o atribuído ao Monta Select não é o 
  database principal do sistema.

- Visualização de Relatórios
  Implementação do Flag 'REPORTS.FLGEXIBENOPREVIEW' que indica se o relatório será 
  exibido e controlado pela tela de Visualização Padrão de relatórios.
  Tal 'flag' é atribuido pelo cadastro de relatórios. 

- Importação de Definição de Dados
  Implementação de mensagens de erro 'descritivas' no processo de importação de 
  relatórios, consultas e autorizações.
  Implementação de processo para compatiblização de execução de transfrelatórios
  com bases de dados desatualizadas ( especificamente verificando as tabelas
  Reports, DataView, GrupoRelatorio, Montaselect e as tabelas de autorização ).

- CMDbObjects
  INclusão da propriedade NullIfZero nos fields dos objetos de persistência.
  A montagem da frase de Insert e Update leva em consideração esse atributo 
  pra atualizar colunas com 'NULL' no logar de '0' e ''.

[ CMFORMS50 ]

- Visualiza dor de Relatórios
  Implementação do teste do Flag de visualização do relatório no Visualizador do Padrão

  

---------------------------------------------------------------------------------
05.04.06 - 02/10/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- uSistema
  Implementação da propriedade RemoteServer. É um Custom Connection responsável 
  pelo acesso a aplicação servidora.
  É inicializado a partir dos parâmetros de Tipo E Meio de Connexão quando a 
  aplicação acessa os dados de um servidor de aplicações (Vide tela de parâmetros
  chamando o executável com -p)

- MontaSelect
  Substituição da Query do MontaSelect por um ClientDataSet.
  Implementação do acesso aos dados a partir de um servidor de aplicações de acordo
  com parâmetros do sistema.
  Otimização na ordenação do resultado da consulta utilizando os índices criados em
  run-time pelo ClientDataSet. Tal procedimento corrige também o erro de ordenação
  das colunas qdo o banco acessado é o DB2.

- TObjCMPadroesSrvr
  Implementação do Objeto de negócio e aplicação servidora para as funções do padrão.
  Foram implementadas as funções para execução remota do montaselect e da conexão incial
  com o banco de dados.

[ CMFORMS50 ]

- Alteração e Logon da Super Senha
  COrreção no logon com o usuário super com a Super Senha alterada.

[ CMBACK50 ]

- uImpostoRetido
  Correção no cálculo da reprogramação da CPMF para datas de lançamento em feriados.
- Cadastro de Cliente\Forncedor
  Inclusão dos Impostos do Tipo "Lança como novo documento" na pasta de associação com impostos\agregados


---------------------------------------------------------------------------------
05.04.04 - 25/09/20001
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Parâmetros de Registro do Sistema
  Implementada tela de manipulação dos parâmetros de registro do sistema sem a utilização
  do regedit.
  Para acessar tal configuração basta executar (a partir do menu "Iniciar\Executar" do Windows) o Sistema 
  pela linha de comando adicionando o parâmetro -p após o nome do aplicativo. Ex.: C:\ProjetosCM5\Bin\GlobalCM.exe -p.
  Todos os parâmetros referentes ao Alias de Conexão , Tipo de Banco de Dados, Idioma, Aplicação Servidora, 
  Endereços e formas de acesso, podem ser alterados diretamente por essa opção.
  Detalhes da tela de Parâmetros são descritas em documento em anexo.


- uSistema
  * Definição do Tipo TMidleWareConnection = (mwcSocket, mwcDCOM, mwcWEB);
    > Caracteriza o meio de conexão da aplicação cliente com o servidor de aplicações

  * Implementação das Propriedades 
    > ConnectionSide: TConnectionSide;
      Forma como a aplicaçao acessa a classe de negócios: Como uma aplicação CLient\Server ou Como um Thin Client;
      
    > ConnectionType: TDbConnectionType;
      Tipo de conexão da aplicação com o Banco de Dados: BDE, ADO, DOA, IB;

    > MidleWareConnection: TMidleWareConnection;
      Caracteriza o meio de conexão da aplicação cliente com o servidor de aplicações;

    > WebUrl: String;
      Endereçõ do Site onde esta hospedada a Aplicação Servidora. Utilizada quando o MidleWareConnection igual a mwcWeb;

    > DcomComputerName: String;
      Nome do Computador onde esta instalada a Aplicação Servidora. Utilizada quando o MidleWareConnection igual a mwcDCOM;

    > SocketHost: String;
      IP do Computador onde esta instalada a Aplicação Servidora. Utilizada quando o MidleWareConnection igual a mwSocket;

  ** Obs: Todas as propriedades acima são inicializadas a partir da leitura do Register do Windoes na Chave "HKEY_CURRENTUSER\SOFTWARE\CM\Nome do Módulo" 


---------------------------------------------------------------------------------
05.04.03 -22/09/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ AUTORIZAÇÃO ]
- Implementação da autorização da pasta "Senha" no Casdatro de Parâmetros do Global com 
  a função de "PARÂMETROS DE SEGURANÇA"
- Implementação da gravação da Operação de "Atualização" do Cadastro de Parâmetros do Global e
  autorização da Consulta de Log de Operações no sistema Global. 


[ CMCOMPO50 ]
- CMSqlScript
  Correção na execução de scripts para creação de VIEWS, PROCEDURES, FUNCTION E
  TRIGERS.
  Os scripts devem possuir apenas uma instrução de CREATE ou ALTER. As instruções
  de DROP podem ser várias num mesmo script.

- uSistema
  Sistema.UsaLogOperacoes 
    Indica se o sistema utilizará a tela de consulta do Log de Operações gravado pela função GravaLogOperacoes.
    A tela de log fiuca no menu "Consulta\Log de Operações".
    A propriedade deve ser inicializado no Initialize do form principal do projeto

  Sistema.GravaLogOperacoes( sDescOperacao: String )  
    Grava o log de Operações de Acordo com o módulo, usuário e data do sistema


[ CMFORMS ]
- RAD
  Correção na consulta de seleção de processos pendentes do RAD para compatiblização com
  o DB2

- Tipo Documentação
  Inclusão do parâmetro para Obrigar a indicação da Data de Validade do documento

- Pessoa
  > Implementação do teste do parâmetro "Vincula Modulo X Pessoa" atualizado pela tela
    de parâmetros do sistema Global. Este parâmetro está diretamente vinculada a parametrização
    do subtipo para gravar o módulo responsãvel no pessoa. O valor defaul é "Não Vincula".
  > Implementação do cadastro da Data de Validade do documento de acordo com o parâmetro
    do tipo de documento "Obriga data de Validade"



---------------------------------------------------------------------------------
05.04.02 -19/09/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ CMEXPERTS ]

- Implementação do Menu "Close DataSets" em "CM Soluções" na IDE do Delphi.
  Fecha todos os DataSets que estejam abertos no Form em foco em tempo de desenho.

[ CMCOMPO50 ]

- uSequence
  Correção no controle de sequences para compatibilização o DB2

[ CMFORMS50 ] 

- Cadastro de Usuário e Grupo
  Customização da tela para garantir acessos separados a "Manutenção de Usuário" e 
  "Manutenção de Grupos" de acordo com a opção de menu selecionada.
- RAD
  Correção na consulta de processos pendentes para o RAD
- Configuração de Relatórios
  Correção na configuração e restore de relatórios para instalações mult-empresa
- Tela de 'SPLASH'
  Correção do layout da tela de SPLASH para instalações da Caixa Seguros de acordo com o
  padrão fornecido

[ CMMIDAS50 ]
- Objetos de Negócio
  Inclusão de consulta genérica ( _QrySQL ) na classe ancestral dos Objetos de Negócio

[ CMSQL50 ]

- Tradução DB2
  Correção na tradução de Sub-Queryes com 'Aliases'. Na Querye traduzida o tradutor 
  acrescentava uma vírgula entre a Sub-Querye e o Alias.
  Tradução do TIMESTAMP para meses com 1 caracter ( < 10 ).



---------------------------------------------------------------------------------
05.04.01 -13/09/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- uSistema
  Implementação de controle de timeout de login de acordo com parâmetro do global


[ CMFORMS50 ]

- fPessoa
  Customização das consultas para compatibilização com DB2
- fPai
  Implementação do controle de TimeOut do login


[ cmsql50 ]
- DB2
  Customização no layout da SQL traduzida para DB2


[ CMBACK50 ]

- Cadastro de Fornecedores
  Cadastro de Agências
  Cadastro de Banco
  Cadastro de Cliente
  Compatibilização de SQL para execução com o DB2

[ CMMIDAS50 ]
- Customizações na Versão Liberada
  Segue Documentação em anexo


---------------------------------------------------------------------------------
05.03.03 - 28/08/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- MontaSelect
  Implementação da troca da descrição das colunas da pesquisa em tempo de execução;

- Correio CM
  Correção na seleção de leitura de mensagens programadas para o mesmo dia;

[ CMFORMS50 ]

- Visualizador de Relatórios
  Correção na função de "Send-Mail" do visualizador de relatórios testando se existe     relatório no visualizador.

- Cadastro de Usuário
  Correção da exclusão de usuários com autorização de relatórios e consultas;

- CMTRADUZ
  Correção na tradução doS itens de menus da Tela Principal dos Sistemas;

- Tela de Usuo Pessoal
  Correção da pasta de dados para Pessoa Física;
  Correção no teste da exibição do Menu de Usu Pessoal de Acordo com o parâmetro do RH 

[ CMBACK50 ]

- Lançamento de Alteradores
  Correção na seleção do centro de custo para lançamento de alteradores;

[ CMSQL50 ]

- Tradução da função SYSDATE do Oracle para CURRENT DATE no DB2;


---------------------------------------------------------------------------------
05.03.01 - 22/08/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ Developer Express Inc\ExpressQuantumGrid ]
- INclusão e Instalação dos componentes e help da ExpressQuantumGrid Suite. Será disponibilizado futuramente um documento com 'Dicas' e 'Demos' dos componentes.



[ CMCOMPO50 ]
- uSistema
  Atribuição da variavél IsDB2_Padrao na inicialização dos parâmetros de conexão com o banco
  de acordo com a chave DRIVERSERVIDOR do registro do sistema
- uDataBase
  Correção na montagem do SQL das funções SQLINSERT e SQLUPDATE qdo passados campos do 
  tipo float como parâmetro;

[ CMBACK50 ]

- uLancFinanc
  Inclusão de parâmetros para indicação de Programa, Plano, Patrocinadora nas Funções de integração com o financeiro;


[ CMSQL50 ]

- Implementação da conversão das funções MONTHS_BETWEEN e NVL
- Inclusão de espaços antes e depois da vírgula
- Correção da tradução para várias ocorrências da mesma tabela no FROM
- Verificar indicação de aliases para SQL´S comvárias ocorrências da mesma tabela no FROM
   >> Errado
      FROM PESSOA, PESSOA P1, PESSOA P2
   >> Correto
      FROM PESSOA P0, PESSOA P1, PESSOA P2
- Correção na tradução de SUBQUERYES em comparadores do tipo IN e NOT IN

[ VCBDE50 ]

- Implementação da variável IsDB2_Padrao: Boolean = false para indicação da conexão com DB2; 
- Implementação de tratamento de 'Prepare' para os objetos TQuery e TUpdaeSql de acordo com  a conexão DB2 (IsDB2_Padrao = True); 



---------------------------------------------------------------------------------
05.01.09 - 25/06/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ CMCOMPO50 ]

- Customizações para compatibilização dos Sistemas para acesso ao DB2;
- Implementação dos componentes TCMwwQuery e TCMUpdateSQL com
  alterações para compatibilização dos Sistemas para acesso ao DB2;
- Correção na rotina de atualização de versão para cópia de Bpl's do servidor para as estações;

[ CMFORMS50 ]

- Customizações para compatibilização dos Sistemas para acesso ao DB2; 

[ CMSQL50 ]

- Customizações para compatibilização dos Sistemas para acesso ao DB2; 
- Correção da tradução para conexão com Oracle

[ CMBACK50 ] 

- Customizações para acesso ao DB2;
- Cadastro de Contas Bancárias
  Gravação do Plano de contas na alteração de registros sem a indicação da Conta Contábil no 
  momento do Cadastro;
- CMIntBanco
  Implementação das propriedades MascaraCliente e ObrigaCC cadastradas pela tela de Parâmetros do Global;
- Cadastro de Cliente
  Alteração na atribuição da máscara do código correspondente do cliente de acordo com parâmetro do cadastro global;
- uDocumento
  Validação da indicação do Tipo de Desembolso\Recebimento no momento da gravação do Rateio do Documento;
  Validação da indicação do Centro de Custo de acordo com parâmetro do Global no momento da gravação do Rateio do Documento;
  Gravação do 'Flag' de Documento Conciliado para persistência dos documentos vindos do Imobiliário no momento da
  Inclusão e Alteração de Documento
- Cadastro de Fornecedores, Cliente, Banco e Agência
  Correção na seleção e atribuição das máscaras de Agência e Conta Corrente de acordo com o cadastro de Banco

[ CMINTBANCO50 ]

- Pagamento Unibanco
  Implementação da gravação do número do documento do favorecido no registro de pagamento;
  Correção do cálculo do CheckHorizontal para bancos diferentes do Unibanco (409)
- Pagamento Fornecedores Bradesco
  Gravação do número da Conta Corrente prferencial para pagamento para convênios com
  mais de uma conta contábil;
- Banco do Brasil
  Correção na gravação do número do convênio para arquivo de transferência do Banco do Brasil


---------------------------------------------------------------------------------
05.01.04 - 29/05/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ CMFORMS50 ]

- Cadastro de Fluxo de Operação
  Atualização do cadastro para cadastro Client Server.
  Correção diversas no processo de Inclusão, Exclusão e Procura de fluxos   cadastrados;

- Form Cadastro Client DataSet
  Implementação dos forms de cadastro baseados em ClientDataSets (Aplicações Multi Tier):
  TFrmCadastroMT - Cadastro Simples
  TFrmCadastroGridMT - Cadastro Grid
  TFrmCadastroMestreDetMT - Cadastro Mestre Detalhe

[ CMCOMPO50 ] 

- uSistema
  Implementação das propriedades
  * UsuarioDB :String;
    Nome do usuário do banco logado - A informação está encriptada com algoritomo             Two-Fish de 128 bits
  * SenhaUsuarioDB :String;
    Senha do usuário do banco logado - A informação está encriptada com algoritomo         Two-Fish de 128 bits
  As proprieddades acima são utilizadas para login em aplicações distribuidas a
  partir do login da aplicação cliente; 

- uDataBase
  * 'Overload' das funções FazQuery e ExecutarQuery para manipulação de ClientDataSets;
  * Implementação da função ChangeDataBaseName.
    Altera o DataBaseName das queryes passadas no array caso seja diferente do parâmetro;

[ CMBUSSINESOBJECT50 ]

- Implementação das classes de Negócio CmControlObjects e CmDbObjects
  Documentação em SuporteDesenv.Doc;
- Implementação de funções e classes para manutenção de tipos entre objetos distribuidos:
	> Converte um arquivo para variant
	function FileToVariant(FileName: String): OleVariant;
	> Converte um TStrings para variant
	function StringlistToVariant(aStrlist: TStrings): OleVariant;
	> Converte um Stream para variant
	function StreamToVariant(Stream: TStream): OleVariant;
	> Converte um variant gerado pela filetovariant para um arquivo
	procedure VariantToFile(FileName: String; var AVariant: OleVariant);
	> Converte um variant gerado pela StringListToVarian para um TStrings
	procedure VariantToStringlist(const Data: OleVariant; aStrlist: TStrings);
	> Converte um variant gerado pela VariantToStream para um Stream
	procedure VariantToStream(const Data: OleVariant; Stream: TStream);
	> Converte um DataSet para um XML File
	procedure DatasetToXML(Dataset: TDataset; FileName: string);
	> Converte um DataSet para um VarArray
	procedure DatasetToVarArray(ADataset: TDataset; var varResultSet: OleVariant);
        > Classe para manipulação de  array gerados a partir de um DataSet pela função DatasetToVarArray}
        TCMArrayTranslate = Class
  
---------------------------------------------------------------------------------
05.01.03 - 25/05/2001
Alterações Padrão
---------------------------------------------------------------------------------

[ CMCOMPO50 ]
- uDataBase
  * Implementação das funções

    >> function SqlInsert(Values : array of const;
                   TableName : string;
                   ColNames : array of string) : string; overload;

    >> function SqlInsert(Values : array of const;
                   TableName : string) : string; overload;

    >> function SqlUpdate(Values : array of const;
                   TableName : string;
                   ColNames : array of string;
                   WhereClause : string) : string;

      - Tais funções retornam as frases de Insert com definição de colunas, insert
        em todas as colunas e update respectivamente. Os valores devem ser passados
        no array values de acordo com o tipo de dados a ser inserido.
        Ex: 
           With Qry Do
           Begin
              iIdCotacaoMoeda := LeultRegistro('COTACAOMOEDA')  ;
              If Active Then Close;
              Sql.Text := SqlInsert([4,iIdCotacaoMoeda,Date],'COTACAOMOEDA',['MOECODIGO','IDCOTACAOMOEDA','COTDATA']);
              ExecSql;
           End;

     >> Overload na function LeUltRegistro.
        Disponibilizada as seguintes implementações do método:
        
        function LeUltRegistro (qryParPont : TwwQuery; NomeTbl : string) : Cardinal; Overload; 
        function LeUltRegistro (Nometbl :string; bExibeMensagem :Boolean = True; sDataBaseName :string = 'BaseDados'; DriverServidor :String = 'ORACLE') : Cardinal; Overload;

       - Ultilizada qdo temos mais de um Database em nosso sistema ou para ser ultilzado em aplicações servidoras onde
         o Databasename é diferente de BaseDados;

[ CMBACK50 ]

- DDadosBancarios
  * Implementação no record TContaBancaria dos atributos para formataçõa da Nº da Conta Bancária e Agência
      MascaraConta :string;
      MascaraAgencia :String;
      AgenciaFormat :String;
      NumeroFormat :String;


[ CMINTBANCO50 ]

- Arquivo de Pagamento CEF
  Correção no layout: Inclusão de 2 espaços após o número do documento corrigindo o tamanho do registro para 151 caractes.     
            
	 
  
    


---------------------------------------------------------------------------------
05.01.02 - 16/05/2001
Alterações Padrão
---------------------------------------------------------------------------------

[CMFORMS50]

- Visualizador de Relatório
  Inclusão da opção de 'Ir para a página';

- FMostraRelat
  Implementação das propriedades que controlam o Tipo de Preview, Nome da Empresa a Ser
  exibida e se a saída do relatório será na tela ou direto para a impressora.
  Devem ser atribúidas ates do preview.

  TipoPreview :TTipoPreview         = ( tpAllPages, tpFirstPage, tpLastPage );
  TipoNomeEmpresa :TTipoNomeEmpresa = ( tnNomeEmpresa, tnRazaoSocial, tnNomeFantasia );
  OutPutDevice :TOutPutDevice       = ( todScreen, todPrinter );

  Os Valores default são:
  TipoPreview = tpAllPages
  TipoNomeEmpresa = tnRazaoSocial
  OutPutDevice = todScreen 

- Filtro Automático de relatórios
  Otimização do filtro para servidores 8i.


[CMCOMPO50]

- TCMReportManager
  Inclusão das propriedades LabelEmpresa, LabelSistema para atribuição automática do
  Nome da Empresa, Nome do Sistema e Versão do sistema logado ao relatório visualizado;

[CMBACK50]
- Retenção de Impostos
  Correção na retenção de impostos do tipo 'Lança Como novo Documento':
  Correção no cálculo do valor a ser rertido e no rateio do documento lançado;

[SAD]
- Cadastro de Relatórios
  Implementação da transferência automática de relatórios no momento do cadastro;
- Autorização de menus do form principal
  Implementação da autorização automática de menus da tela principal de acordo com
  o tipo de usuário ( Gerentes, Desenvolvedores, Homologação, Outros )

---------------------------------------------------------------------------------
05.01.01 - 11/05/2001
Alterações Padrão
---------------------------------------------------------------------------------
[CMCOMPO50]
- Correções gerais nos componentes de relatório para Web

[CMFORMS50]
- Filtro de Relatórios
  Coreção no filtro de relatórios pra valroes com separador decimal e de milhar
- Autorização
  Correção nas autorizações dos botões nos forms de cadastro

[CMBACK50]
- Imposto Retido
  Correção no cálculo da retenção para impostos do tipo só calcula valor

---------------------------------------------------------------------------------
05.01.00
Alterações Padrão
---------------------------------------------------------------------------------

[CMCOMPO50]

- Criação dos coponentes de gerenciamento de relatórios para Web.
  A documentação da implementação está disponível no SuporteaoDesenvolvimento.Doc na 
  Parte 7 páginas 36, 37 e 38 instaldo pelo padrão.
- Correção na digitação da data no componete TCmDateTimePicker.

[CMFORMS50]

- Implementação do FCmReport form ancestral para implementação do novo modelo de relatórios;

[CMBACK50]

- Correção na gravação do Programa no lançamento do financeiro;

[CMINTBANCO50]

- Implementação na gravação do documento do favorecido nos registros de pagamento via DOC;

[IP50D, CMSQL50]

- Implementação das funções de conversão de SQL para DB2;

---------------------------------------------------------------------------------
05.00.21
Alterações Padrão
---------------------------------------------------------------------------------

[CMCOMPO50]
- CmDateTimePicker
  Correção no display da Data quando a mesma é atribuida a propriedade Text do componente;

[CMINTBANCO50]
- Arquivos de pagamento via DOC
  Inclusão do número do documento do favorecido nos layouts dos bancos Itau, Banco do Brasil e Caixa.

---------------------------------------------------------------------------------
05.00.20
Alterações Padrão
---------------------------------------------------------------------------------

[CMCOMPO50]
- Numeração de Versões
  Correção na gravação do número das versões da bibliotecas liberadas;
- Impressão Genérica
  Correção na confirmacão de impressão da tela de seleção de impressora genérica

[CMFORMS50]
- Tela Principal
  Otimização na seleção dos relatórios Customizados pelo cliente;

[CMBACK50]
- Cadastro de Cliente
  Correção na validação de campos obrigatórios na confirmação do cadastro;
- Cadastro de Fornecedor
  Correção na validação de campos obrigatórios na confirmação do cadastro;
  Correção na atriuição da máscara da Agência e Conta Corrente na gride de dados bancários;
  Correção na atribuição da Razão Social qdo o Nome é Digitado e a mesma está em branco e vice-versa;


---------------------------------------------------------------------------------
05.00.19 - 20/04/2001
Alterações Padrão
---------------------------------------------------------------------------------

[CMBACK50]
- Cadastro de Cliente
  Corerção na exibição da pasta Tipos de Cliente

[CMFORMS50]
- Pessoa
  Inclusão do campo para indicação da data de nascimento do contato;

---------------------------------------------------------------------------------
05.00.18 - 19/04/2001
Alterações Padrão
---------------------------------------------------------------------------------

[CMBACK50]

- Cadastro de Cliente
  Correção na exclusão do cliente do erro: 'Can not perform this operation on a empty dataset';
- Cadastro de Agência
  Atribui;cão da máscara do número da agência na procura da agência para manutenção do cadastro;
  Correção na atribuição da máscara da agência no momento da alteração do registro;
- Cadastro de Banco
  Inclusão do 'Label' Indicando a 'Máscara do Número da Agência'
- Cadastro de Fornecedor
  Correção na gravação dos dados bancários do fornecedor;
- Cadastro de Tipo de Desenbolso\Recebimento
  Relacionamento Tipo de Desenbolso\Recebimento X Impostos
  Relacionamento de Tipo de Desenbolso\Recebimento X Conta Contábil X Centro de Custo X Programa
  Correção do 'Acces Violation' no momento da replicação do Relacionamento após o cadastro 
  de Tipo de   Desenbolso\Recebimento


[CMFORMS50]

- FrmPrincipal
  Correção na opçoes de Copiar, Colar, Recortar, Delete do menu Edit;
  Implementação da chamada da tela de Consulta\Uso Pessoal para empresas que ultilizam sistemas do RH
- Cadastro CS
  Correção na repetição do Insert em função do atributo RepetirInsert;

[INSTALADORES]
- Inclusão da DCLOCX50.BPL e DCLAXSERVER50.BPL no InstalaCM;

[LIBERAÇÃO DE VERSÃO FTP]
- Correção nos Diretórios das versões liberadas no FTP em função da mundança dos servidores de aplicativos;

---------------------------------------------------------------------------------
05.00.11 - 23/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

- Inclusão dos componentes TPasswordControl, TSimpleFtp
- Correção na sinconizacão do Timer no componente TFsmTimer;

---------------------------------------------------------------------------------
05.00.09 - 23/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

- Inclusão do Componente TDialUp;
- Correção na geração e gravação do número das versões liberadas;
- Acerto no posicionamento inicial dos forms do SAD Expert;

---------------------------------------------------------------------------------
05.00.08 - 23/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

- Inclusão dos Componentes de Acesso a Dados Halcyon6 ( Acesso a Dbf's com índices, padradox, etc... )
- Correção no Cadastro Mestre Detalhe no controle do botão alterar;
- Disponibilização dos Cadastros de Usuários e Grupos;
- Inclusão do SAD Expert no menu Cm Soluções do Delphi com as funções de Cadastro de Módulo e Liberação de Versão.

Deve ser adotado o seguinte procedimento para a primeira liberação de versão:

- Verificar na unit do projeto ( nomeprojeto.Dpr ) a indicação dos forms referentes aos forms dos relatórios. No Delphi3, como eles eram herdados de TDataModule fica indicado a classe ( no caso :TDataModule ) após o nome do form. No Delphi5 os forms de relatório passaram a ser herdados de TForm mas a indicação da classe TDataModulo continua no Dpr. Isso acarreta problema no momento da manutenção de tais forms pelo Delphi. 
Deve ser retirada do dpr a indicação de :TDataModulo após o nome dos forms dos relatórios. 
Cuidado para tirar somente dos forms de relatório, se vc tem algum data modulo este deve continuar com a indicação TDataModule após o nome do mesmo.

- Corrigir no Cadastro de Módulo do SAD Expert as informações referentes ao(s) diretório(s) do módulo a ser liberado, alterando para o diretório dos fontes no PadroesCM5. Verificar também os cadastros referentes ao e-mails e responsáveis pelos módulos, ultilização de bibliotecas e grupo de desenvolvimento. Atenção para os projetos com o mesmo nome no Clipper e no Delphi, verificar se a alteração está sendo aplicada no módulo correto;

- Após a correção do cadastro do Módulo Liberar a Versão no SAD Expert indicando o histórico e a numeração '3.00.00' para a versão liberada.

Este procedimentos devem ser efetuados hoje até as 18:00 hs de hoje (03/04/2001) Para que as versões estejam disponíveis para a homologação e no FTP amanhã 04/04/2001.


---------------------------------------------------------------------------------
05.00.05 - 23/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

1) Inclusão e Instalação dos Helps dos Componentes Top Grid;

---------------------------------------------------------------------------------
05.00.05 - 23/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

1) TCmEventosCadastro
   Inclusão da Propriedade OpenDsAutomatico;

2) FrmCadastro
   ALteração da Propriedade CmeCadstro.OpenDsAutomatico para gerenciar a abertura
   do DataSet Principal da tela de cadastro automaticamente;

---------------------------------------------------------------------------------
05.00.04 - 22/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

1) FrmCadastroPai
   Atribuição do evento OnPaint responsável pelo alinhamento dos controles de Confirma
   e cancela das telas de cadastro;

2) FrmConsultar
   Inclusão do form na instalação e no CMForms50;

3) MsScriptControl
   Inclusão e registro do componente de ediçõa e execução de scripts;
   Ultilizado pelo 'Regra' da contabilidade;

4) MotaSelect
   Atribuição do 'Enter' como resposta ao click na confirmação da consulta;

5) Forms Mestre Detalhe
   Correção do estado de 'Down' dos botões de Inserir, Alterar e Excluir dos detalhes do cadastro;

6) FrmCadastroGrid
   Correção na exibição do Grid dos dados no momento da confirmação da operação com
   o cadastro;

7) CMRelatsOld50
   Correção do nome do componente "QrLabelFixo" ancestral dos forms de relatório com
   QuickReport;
   Os botoes Sair e Ajuda dos Forms descendentes de FCmParamRel foram excluídos, 
   permanecendo apenas os botoes Visualizar e Imprimir; 

---------------------------------------------------------------------------------
05.00.03 - 20/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

1) Inclusão da Instalação do Componente TParser (CmParser50.Dpl);
   Os projetos que ultilizam este componente devem adiocionar este package na lista
   RunTime Package List;

2) Criação e instalação do package CMRelatsOld50 contendo todos os forms de herença para
   relatórios do QuickeReport e Compotente TCmReportBtn;
   Os projetos que ultilizam o QuickReport devem adiocionar este package na lista
   RunTime Package List;
   Os forms de relatório e preview do QuickReport são instalados para poder ser efetuada
   a herança visual nos projetos no seguinte diretório: C:\ProjetosCm5\Cm\Relats\Source;

3) Implementação do Componente CmApplicationEvents ultilizado no formulário principal
   que implementa os eventos AfterLogin (Substitui o AposLogin) e OnCreateFormReports ( Ultilizado
   para criar os Forms de Relatórios;
   O Método AposLogin deve ser implementado no evento AfterLogin e a implementação
   de Criação dos Forms de Relatórios, que foi implementada antes do Inherited do Apos login
   deve ser implementada no evento OnCreateFormReports;

4) FormPessoa
   Alteração dos Hints dos botões de manipulação dos detalhes;
   Correção no display dos botões de detalhe ao cancelar\voltar um cadastro;
   

5) Tela de Configuração de Relatórios
   Correção na altura dos botões de Altera e Restaura Relatórios;

6) Lista e Envio de Mensagens
   Correção na exibição dos botoões de Ok e Cancelar;
   Correção na verificação de mensagens pendentes;

---------------------------------------------------------------------------------
05.00.02 - 19/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

1) Conversor de Projetos
   * Inclusão da Opção de conversão de Arquivo (*.Pas e\ou *.Dfm) e de Diretório;

2) Acha e Troca
   * Correção na leitura de arquivos Dfm para análise do parser;
   * Instalação do Convert.Exe no ProjetosCm5\Cm\Packages;

---------------------------------------------------------------------------------
05.00.01 - 19/03/2001
Alterações Padrão
---------------------------------------------------------------------------------

1) Instalador
   * Correção da Instalação do CmBussines50 no System da máquina.
     Caso vc tenha direcionado a instalação do package acima para 
     "C:\ProjetosCm5\Cm\Packages" favor redirecionar para o System32 após a instalação
     do padrão;

2) MontaSelect
   * Foco no primeiro controle de edição;
   * Alteração no botão de confirmação da consulta pra responder ao Enter da
     confirmação da consulta;

3) FCmPrincipal
   * Exclusão do atalho 'F2' para o menu sistema;

4) CocbCm50
   * Alteração do nome do package para CmIntBanco50.
     Caso o seu projeto ultilize este package alterar a referência em 'Project Options'

5) CMExpert
   * Correção na exibição do form do "Acha e Troca";
   * Correção na criação do arquivo dof na conversão do projeto e na criação do projeto novo
     trocando o package CobrCm50 pelo CmIntBanco50.
 

---------------------------------------------------------------------------------
05.00.00 - 16/03/2001
Mudanças Gerais e Procedimentos Para Conversão de Projetos
---------------------------------------------------------------------------------

1) As Funções abaixo passaram a constar na uCripto
   function Encrypt(const S: String; KEY:WORD): String;
   function Decrypt(const S: String; KEY:WORD): String;

2) uCmRegister
   Criação da Classe TCmRegister com métodos para acesso ao registro do windows;

3) Descontinuados
   uErro
   uData: foi adicioada a uDiasUteis

4) Cadastros: 
   Cadastro, CadastroDS, CadastroMestreDet, CadastroMestreDetCS 
   A Herança Visual passo de FrmOkCancelar para FrmCadastroPai;
   Os Métodos e propriedades de manipulação do Cadastro foram emcapsulados nos componentes
   CmeCadastro, CmeDetalhe devendo ser manipulados pelos eventos do componentes;

   No Lugar de......		Manipular o evento do CmeCadastro.
  
   FazerOpen			OnOpenDataSet
   FazerClose			OnCloseDataSet
   FazerInsert			OnInsert
   FazerEdit			OnEdit
   FazerDelete			OnDelete
   FazerCancel			OnCancel
   FazerProcurar			OnFind
   FazerConfirma			OnConfirma
   TestarConfirma			OnBeforeConfirma
   AtualizaBotoes			OnAtualizaBotoes
   
   No Lugar de......		Manipular o evento do CmeDetalhe
   FazerInserirDetalhe                    	OnInsert
   FazerAlterarDetalhe                    OnEdit
   FazerExcluirDetalhe                    	OnDelete
   FazerConfirmaDetalhe                	OnConfirma
   FazerCancelaDetalhe               	OnCancel
   VerificaBotoesDetalhe             	AtualizaBotoes

   No Lugar de.....			Manipular a propriedade

   OperacaoCadastro		CmeCadastro.Operacao
   bRepetirInsert			CmeCadastro.RepetirInsert

   * Atenção:
     Os Métodos FazerMove, RepetirInsert, FazerOpenAutomatico, HabilitaOkCancelar, FazendoCloseOpen,	
     FazerOpenAutomatico, HabilitaOkCancelar,  RepertirInsert, AbrirQueryes, FormProcurar foram Descontinuados.


5) Alterações no TPessoa

  * Foram Adicionados os Eventos

   OnChangePessoa, no lugar do método MudaPessoa;
   OnChangeSubtipo, no lugar do método MudaOutros;
   OnSaveSubtipo, no lugar do método Grava;

   * As Propriedades referentes ao controle do form

   _BotaoFisFur
   _PainelMestre
   _PainelFoto
   _LabelDocumento
   _LabelNome 
   _CampoDocum 

   * Foram Alteradas para o tipo TFormControls e são respectivamente

   FormControls.BotaoFisFur
   FormControls.PainelMestre
   FormControls.PainelFoto
   FormControls.LabelDocumento
   FormControls.LabelNome 
   FormControls.CampoDocum 

6) Procedimentos para conversão de projetos

   Após a instalação do Delphi5, selecionar no menu CM Soluções a opção de Conversor de Projetos e seguir os passos do assistente.

   * Após a Conversão....

   > Form Principal
   > Abrir o formulário principal e deletar a referência do Componente Dock97Bot que foi excluído no form ancestral.
   > Procedures Ativou, ShowHint e TrataExcessao do form principal deixaram de existir. Seus procedimentos foram atribuidos aos eventos do componenete AppPadrao OnActivate, OnShowHint e OnException;
   > Verificar as configurações do Project Options Com os Packages e Diretórios e excluir os packages da CM não ultilizados pelo seu projeto.
     * A Configuração padrão é:

       OutputDir	c:\ProjetosCM5\Bin
       UnitOutputDir	..\Dcu
       SearchPath	c:\ProjetosCM5\cm\packages
       Packages		Vcl50;Vclx50;VclSmp50;Vcldb50;vclado50;ibevnt50;Vclbde50;vcldbx50;Qrpt50;TeeUI50;
			TeeDB50;Tee50;Dss50;TeeQR50;VCLIB50;Vclmid50;vclie50;Inetdb50;Inet50;NMFast50;webmid50;dclocx50;dclaxserver50;TB97_d5;CMAdd50;Ml42ND50;Ml42DB50;rbTDBC51;rbRCL55;rbCIDE55;rbIDE55;rbBDE55;rbRIDE55;rbRAP55;rbDBDE55;rbDAD55;rbDIDE55;rbUSER55;xtradev;ip50client_d5;ip50_d5;ip50word_d5;FirstClass2000_vcl5;Indy50;CmCompo50;CmOld50;CmBussines50;CMRegra50;CMTotalPrev50;CmForms50;CmBack50
      
 
   > Compilar o Projeto atentando para os possíveis erros:

     * O Erro File not Foud nas seções uses deve ser corrigido automaticamente com a declaração da unit no uses pelo próprio Delphi no momento que abrimos e salvamos o form com o erro.
     * O Erro de Undeclared Identifier deve ser corrigido automaticamente com a declaração da unit no uses pelo próprio Delphi no momento que abrimos e salvamos o form com o erro.
     * A Function Testar Confirma foi substituida pelo evento BeforeConfirma, mas o conversor não substitui corretamente a declaração do método na implementação. Tal procedimento dave ser feito manualmente quando o erro for encontrado e o “Result” da função deve ser atribuido ao var parameter accept, logo: Implementação BeforeConfirma: Trocar function por procedure, deletar o tipo do result boolean e substituir as atribuições do resulta para accept.
    
   > Criação dos Forms de Relatórios:
     A Herança do Data Módulos dos relatórios foi mudada para Tform para garantir melhor performance na execução dos ReportBuilder , apesar do nome Ter sido mantido para compatibilizar com chamadas ao módulo e cadastro de relatórios, essa mudança traz alguns problemas que devem ser  corrigidos da seguinte forma:
	
     > Os Eventos OnCreate e OnDestroy, caso tenham sido manipulados perdem o pondeiro qdo a herança e alterada, devem ser atribuídos aos eventos OnCreate e OnDestroy do Form.
     > Os Forms de Relatórios Devem ser tirados do autocreate ecriados no evento após login antes do Inherited da seguinte forma:

	Procedure TfrmPrincipal.AposLogin(Sender :Tobject);
	Begin
	  if (Not bReportsCreate) And (Sistema.FezLogin) Then
	  Begin
		bReportsCreate := True;
		Application.CreateForm(TDtmRelatoriosCapCar, DtmRelatoriosCapCar);
		Application.CreateForm(TDtmRelatoriosCapCar2, DtmRelatoriosCapCar2);
		Application.CreateForm(TDtmRelatoriosCapCar3, DtmRelatoriosCapCar3);
     	  End;
          Inherited;
          ...
	End;

   > A Classe TppCalc do Report Bulder foi substituída pela TppSystemVariable, a alteração é feita altomaticamente no momento que abrimos o form de relatório e salvamos qualquer modificação feita no mesmo ( basta mudar o form de posição ). Os Nomes atribuidos aos componentes da classe TppCalc Continuam os mesmos.


7) Packages da CM Soluções Instalados Pelo Padrão
   CMAdd50 
   DJCL50 
   CMCOMPO50 
   CMBussines50 
   CMOld50 
   CMForms50 
   CMExperts 
   CMBack50
   CmIntBanco50
   CMRegra50
   CMTotalPrev50
   CmParser50
   CmRelatsOld50

8) Registro Debuger 
   A instalação do padrão registra automaticamente o debuger do delphi, caso você não tenha marcado a opção de ergistro basta executar em o comando abaixo:
   regsvr32 "c:\arquivos de programas\arquivos comuns\borland shared\debugger\bordbk50.dll"











