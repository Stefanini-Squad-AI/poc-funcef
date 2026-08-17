//CGI
program AutoAtendimento;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  DPrincipal in 'DPrincipal.pas' {wmdlAutoAtendimento: TWebModule},
  uWebDadosCadastrais in 'uWebDadosCadastrais.pas',
  uWebTempoServico in 'uWebTempoServico.pas',
  uWebContribuicoes in 'uWebContribuicoes.pas',
  uWebReserva in 'uWebReserva.pas',
  uWebEventosPrev in 'uWebEventosPrev.pas',
  uWebQuadroSalarial in 'uWebQuadroSalarial.pas',
  uWebContraCheque in 'uWebContraCheque.pas',
  uWebHistBenef in 'uWebHistBenef.pas',
  uWebConsignacao in 'uWebConsignacao.pas',
  uWebManutEnderecos in 'uWebManutEnderecos.pas',
  uWebAlteracaoSenha in 'uWebAlteracaoSenha.pas',
  uWebManutDependentes in 'uWebManutDependentes.pas',
  uWebRelatorioDinamico in 'uWebRelatorioDinamico.pas',
  uWebEmpSimulacaoInscricao in 'uWebEmpSimulacaoInscricao.pas',
  uFuncoesEmprestimo in 'uFuncoesEmprestimo.pas',
  uWebTransfPlano in 'uWebTransfPlano.pas',
  uWebBeneficio in 'uWebBeneficio.pas',
  uWebInformeRendimentos in 'uWebInformeRendimentos.pas',
  uWebExtResPer in 'uWebExtResPer.pas',
  uWebNovoUsuario in 'uWebNovoUsuario.pas',
  uWebManutTelefones in 'uWebManutTelefones.pas',
  uWebSitAtualBenef in 'uWebSitAtualBenef.pas',
  uWebEmpConsEmprestimos in 'uWebEmpConsEmprestimos.pas',
  uWebCadastroTempoServico in 'uWebCadastroTempoServico.pas';

{$R *.RES}
{$R AUTOATENDIMENTO_RES.RES}

begin
  Application.Initialize;
  Application.Title := 'Auto-Atendimento';
  Application.CreateForm(TwmdlAutoAtendimento, wmdlAutoAtendimento);
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Auto-Atendimento
================================================================================
CM$VER      3.01.18c    25/04/2008
--------------------------------------------------------------------------------
- Pendência 27232 - Simulação de empréstimos: Avaliação de ítens em aberto de empréstimos anteriores selecionados por regra conforme o tipo de contrato.
- Pendência 27749 - Simulação de empréstimos: Avaliação do valor de parcela inicial superior a margem consignável realizado dependendo da parametrização no tipo de contrato.
================================================================================
CM$VER      3.01.18b    15/01/2008
--------------------------------------------------------------------------------
- Pendência 23274 - Manutenção de dependentes: Ajuste na exibição do CPF com máscara e edição de nomes em maíusculas.
================================================================================
CM$VER      3.01.18a    10/01/2008
--------------------------------------------------------------------------------
- Pendência 23274 - Manutenção de dependentes. 
  Inclusão dos campos de CPF e Data de Falecimento.
================================================================================
CM$VER      3.01.18     21/12/2007
--------------------------------------------------------------------------------
Liberação do Padrão 18
================================================================================
CM$VER      3.11.17b    20/12/2007
--------------------------------------------------------------------------------
- Pendência 26951 - Query da regra de valor máximo. Passagem das informações de contratos ativos com o tipo 1.
- Pendência 26950 - Query da regra de valor máximo. Inclusão das datas de assinatura, crédito e primeira parcela.
================================================================================
CM$VER      3.11.17a    30/10/2007
--------------------------------------------------------------------------------
- Implementação de rotinas comuns ao Auto-Atendimento e Auto-Empréstimo. 
- Pendência 18467 - Conexão: Verificação de regra de acesso para página Home.
================================================================================
CM$VER      3.11.17     03/09/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 17
================================================================================
CM$VER      3.11.16a    03/09/2007
--------------------------------------------------------------------------------
- Pendência 19090 - Relatórios dinâmicos: Implementação de relatórios criados no gerador para impressão no auto-atendimento.
Deve-se verificar a existência dos registros de relatórios pré-existentes (1 a 4) na tabela WEBTPREPORTS.
================================================================================
CM$VER      3.11.16     17/07/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 16
- Pendência 25719 - Dados Exibidos: Ajuste para apresentação do campo Descrição dos Endereços.
- Parâmetros de Extratos de Empréstimos: Ajuste na abertura da página após ativação no módulo de Gerência.
================================================================================
CM$VER      3.11.15a    24/05/2007
--------------------------------------------------------------------------------
- Pendência 24902 - Simulação de Empréstimo: Disponibilização de forma parametrizada da entrada do Valor Solicitado 
  na tela de parcelas simuladas e cálculo da margem consignável conforme o prazo selecionado.
================================================================================
CM$VER      3.11.15     13/04/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 15
================================================================================
CM$VER      3.11.14a    02/03/2007
--------------------------------------------------------------------------------
- Pendência 23402 - Implementação de envio de senha por e-mail do usuário.
================================================================================
CM$VER      3.11.14     16/02/2007
--------------------------------------------------------------------------------
- Pendências 18467 e 21824 - Configuração/Dados Exibidos: Possibilidade de determinar acesso a página ou campo utilizando regra.
- Liberação para versão do padrão 14
================================================================================
CM$VER      3.11.13a    22/12/2006
--------------------------------------------------------------------------------
- Pendência 23733 - Tabela PARAMEMPTMO: Criação da coluna IDREGRATIPOCONTR. O script de atualização da tabela deve ser executado.
Concessão/Inscrição: Chamada a regra definida para validação, após escolha do tipo de contrato de empréstimo.
================================================================================
CM$VER      3.11.13     21/11/2006
--------------------------------------------------------------------------------
Versão para liberação do Padrão 13
================================================================================
CM$VER      3.11.12a    18/10/2006
--------------------------------------------------------------------------------
- Pendência 23553 - Conexão: Recuperação das informações do participante prioritariamente como titular.
- Pendência 23499 - Simulação / Concessão de empréstimo: Ativação de crítica não permitindo gravação do mesmo empréstimo mais de uma vez.
- Pendência 22836 - Simulação / Concessão de empréstimo: Passagem de flag de excepcionalidade nas regras de concessão.
- Pendência 23311 - Ajuste  na gravação do Plano contábil do contrato no momento da concessão.
- Pendência 23312 - Regra de elegibilidade recebe IDPLANOPREV e IDPLANOPREVCONTAB.
================================================================================
CM$VER      3.11.12     28/09/2006
--------------------------------------------------------------------------------
Versão para liberação do Padrão 12
================================================================================
CM$VER      3.11.11e    22/09/2006
--------------------------------------------------------------------------------
Pendência 23274 - Manutenção de Dependentes
- Permitir cancelamento de dependentes e, na inclução, permitir que um cliente cancelado possa ser reativado.
================================================================================
CM$VER      3.11.11d    13/09/2006
--------------------------------------------------------------------------------
- Pendência 22934 - Ajuste na verificação de acesso a layers parametrizados
================================================================================
CM$VER      3.11.11c    04/09/2006
--------------------------------------------------------------------------------
- Pendência 23044 - Demonstrativo da Simulação de Benefício: Ajuste na impressão utilizando o formato de saída do gerador de relatórios
- Pendência 22930 - Extrato de Reserva de poupança: Ordenação pelo campo data de movimentação
================================================================================
CM$VER      3.11.11b    21/08/2006
--------------------------------------------------------------------------------
- Pendência 22997 - Extrato de Reserva de Poupança: Inclusão de combo para filtragem por tipo de reserva.
================================================================================
CM$VER      3.11.11a    17/08/2006
--------------------------------------------------------------------------------
- Pendência 22914 - Concessão de empréstimos: Ajuste permitindo simulação mesmo sem contrato assinado para o tipo de empréstimo selecionado.
- Pendência 22248 - Chamada de cálculo de margem consignável alterada para reconhecer módulo na regra e execução por prazo selecionado.
- Pendência 22885 - Ajuste no erro de estouro de campo durante gravação da tabela de movimentações de empréstimo.
================================================================================
CM$VER      3.11.11     28/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 11.
================================================================================
CM$VER      3.11.10     14/07/2006
--------------------------------------------------------------------------------
Versão para liberação do Padrão 10
================================================================================
CM$VER      3.10.53     05/07/2006
--------------------------------------------------------------------------------
Pendência 22220 - Simulação de Benefícios
- Erro na Simulação de Benefícios
Pendência 22248 - Simulação de Empréstimos
- Erro na Simulação de Empréstimos
================================================================================
CM$VER      3.10.52     27/06/2006
--------------------------------------------------------------------------------
Pendência 22220 - Simulação de Benefícios
- Erro na Simulação de Benefícios
Pendência 22248 - Simulação de Empréstimos
- Erro na Simulação de Empréstimos
================================================================================
CM$VER      3.10.51     19/04/2006
--------------------------------------------------------------------------------
Pendência 21165 - Simulação de Benefícios
- Desenvolvimento de módulo para uso da ferramenta nos sistemas que utilizam o padrão do TotalPrev.
Pendência 22043 - Situação Atual de Benefícios
- Implementar consulta (incluindo número de beneficio do INSS)
================================================================================
CM$VER      3.10.50     10/04/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09.
================================================================================
CM$VER      3.10.49     06/03/2006
--------------------------------------------------------------------------------
Pendência 20450 - Alteração Cadastral de Telefone
- Implementação da funcionalidade.
Pendência 21479 - Concessão de Empréstimos
- Sincronização de fontes.
- Mudanças internas no uso do Regra 3 Camadas.
================================================================================
CM$VER      3.10.48     01/02/2006
--------------------------------------------------------------------------------
Pendência 21322 - Simulação/Concessão de Empréstimos
- Sincronização de fontes.
================================================================================
CM$VER      3.10.46     05/01/2006
--------------------------------------------------------------------------------
Pendência 20274 - Simulação de Benefícios
- Evitar quebra de títulos de campos e resultados.
Pendência 20276 - Simulação de Benefícios
- Implementar uma forma mais eficiente de digitação de campos datas.
Pendência 20723 - Simulação de Benefícios
- Alterar em todas as janelas e páginas do Auto-Atendimento e do Gerência o tipo de conteúdo de campo/resultado "Valor Default" para "Conteúdo Fixo".
Pendência 20616 - Simulação de Benefícios
- Implementar impressão de demostrativo da simulação (relatório).
Pendência 20471 - Relatórios
- Favor incluir um total no gráfico de Acessos por página. 
Pendência 19837 - Status do Sistema
- Incluir janela de status do sistema, informando quantidade de (e quais) usuários conectados, data e hora do último acesso, etc.
Pendência 21185 - Concessão de Empréstimos
- Algumas contratações de empréstimos estavam com valores diferentes nas tabelas INSCRICAOEMPTMO, CONTRATOEMPTMO e HISTMOVEMPTMO.
Pendência 21186 - Simulação/Concessão de Empréstimos
- Sincronização dos fontes do Auto-Atendimento e do Empréstimo.
================================================================================
CM$VER      3.10.45     12/12/2005
--------------------------------------------------------------------------------
Pendência 20727 - Cadastros de Campos e Resultados para Simulação
- Queries de entrada não estavam sendo salvas corretamente.
================================================================================
CM$VER      3.10.44     16/11/2005
--------------------------------------------------------------------------------
Pendência 20728 - Simulação de Benefícios
- Campos não requeridos estavam tendo o preenchimento obrigatório.
================================================================================
CM$VER      3.10.43     09/11/2005
--------------------------------------------------------------------------------
Pendência 20611 - Simulação de Benefícios
- Permitir cadastro de campos e resultados sem nome para regra.
Pendência 20615 - Simulação de Benefícios
- Permitir customização da página de resultados.
Pendência 20618 - Simulação de Benefícios
- Pemitir que resultados venham de valor default ou de query (do processo ou própria), da mesma forma que os campos.
Pendência 20619 - Simulação de Benefícios
- Substituir, na utilização de query própria, palavras chave ":XXX" por conteúdos da query do processo.
Pendência 20621 - Simulação de Benefícios
- Pemitir que a geração de campos e resultados sejam executados dentro de uma transação (que opcionalmente poderá ser "comittada").
Pendência 20622 - Simulação de Benefícios
- Validar prennchimento de campos em JavaScript.
================================================================================
CM$VER      3.10.40     29/08/2005
--------------------------------------------------------------------------------
- Pendência 20076 - Concessão de Empréstimos
Correção da apresentando mensagem de erro "Esta concessão já foi efetivada, ou houve alterações nos dados dos contratos anteriores" para algumas matrículas.
================================================================================
CM$VER      3.10.39     23/08/2005
--------------------------------------------------------------------------------
Pendência 19671 - Simulação de Empréstimos
- Mensagem de margem consignável insuficiente está aparecendo duplicada.
Pendência 20029 - Simulação/Contratação de Empréstimos
- Sincronização de fontes.
================================================================================
CM$VER      3.10.38     17/08/2005
--------------------------------------------------------------------------------
Pendência 19988 - Contratação de Empréstimos
- Criação de log em disco para monitorar contratações e inscrições de empréstimos.
================================================================================
CM$VER      3.10.37     11/08/2005
--------------------------------------------------------------------------------
Pendência 19953 - Alteração de senha
- Corrigido erro apresentado quando usuário altera sua senha no primeiro login.
================================================================================
CM$VER      3.10.36     10/08/2005
--------------------------------------------------------------------------------
Pendência 19945 - Todo o sistema
- Migrar o Auto-Atendimento para o padrão 5.10.06.
================================================================================
CM$VER      3.10.35     03/08/2005
--------------------------------------------------------------------------------
Pendência 19882 - Contratação de Empréstimos
- Ocorrendo erro em certas contratações no momento da atualização do saldo devedor.
================================================================================
CM$VER      3.10.34     28/07/2005
--------------------------------------------------------------------------------
Pendência 19694 - Contratação de Empréstimos
- Implementar impressão de contratos.
Pendência 19838 - Contratação de Empréstimos
- Os contratos de empréstimos gerados pelo Auto-Atencimento não estão com o campo HMEFORMACOBRANCA nulo.
================================================================================
CM$VER      3.10.33     27/07/2005
--------------------------------------------------------------------------------
Pendência 19826 - Contratação de Empréstimos
- Alguns empréstimos estavam sendo gravados duplicados.
================================================================================
CM$VER      3.10.32c    25/07/2005
--------------------------------------------------------------------------------
Alterações diversas.
================================================================================
CM$VER      3.10.32     20/07/2005
--------------------------------------------------------------------------------
Pendência 19576 - Login do sistema
- Implementar lembrete de senha.
================================================================================
CM$VER      3.10.31     18/07/2005
--------------------------------------------------------------------------------
Pendência 19665 - Simulação de Empréstimos
- Tornar mensagem de "contrato não assinado" apenas informativa, permitindo simulação mas não inscrição.
Pendência 19666 - Simulação de Empréstimos
- Retirar crítica de margem consignável não encontrada.
================================================================================
CM$VER      3.10.30     04/07/2005
--------------------------------------------------------------------------------
Pendência 19621 - Simulação de Empréstimos
- Prazos não apresentados para a matrícula 7393936.
================================================================================
CM$VER      3.10.29     27/06/2005
--------------------------------------------------------------------------------
Pendência 19547 - Simulação de Empréstimos
- Correção no cálculo do saldo de empréstimos anteriores.
================================================================================
CM$VER      3.10.28     23/06/2005
--------------------------------------------------------------------------------
Pendência 19547 - Simulação de Empréstimos
- Correção no cálculo do saldo de empréstimos anteriores.
================================================================================
CM$VER      3.10.27     22/06/2005
--------------------------------------------------------------------------------
Pendência 19545 - Simulação de Empréstimos
- Correção na exibição de mensagens do Regra.
================================================================================
CM$VER      3.10.26     21/06/2005
--------------------------------------------------------------------------------
Pendência 19510 - Simulação/Contratação de Empréstimos
- Liberar contratação de empréstimos para usuários com empréstimos anteriores. Tornar a mensagem, que hoje é restritiva, em informativa. Mensagem: "Participante não poderá contratar este empréstimo antes de quitar o(s) anterior(es)."
Pendência 19488 - Simulação/Contratação de Empréstimos
- Implementar alterações da pendência 19196.
Pendência 19511 - Execução de regras
Implementar registro em arquivos texto referentes a regras executadas para facilitar o debug dos usuários, de modo que estes possam resolver problemas sem recorrer à CM.
================================================================================
CM$VER      3.10.23     15/06/2005
--------------------------------------------------------------------------------
Correção de problema no cadastro de usuário.
================================================================================
CM$VER      3.10.22     14/06/2005
--------------------------------------------------------------------------------
Pendência 19244 - Login do sistema
Implementar funcionalidade "Novo usuário", no qual o usuário possa criar a sua senha.
Pendência 19463 - Auto-Atendimento
Botão de "Inscrição em Empréstimos" não desaparece mesmo se a opção é desmarcada no Gerência do Auto-Atendimento.
Pendência 19464 - Concessão de Empréstimos
Todos os campos de "Forma de Pagamento" x "Forma de Recebimento", e "Conta de Pagamento" x "Conta de Recebimento" estão com suas descrições trocadas. Aproveitar e mudar para "Pagamento de Prestações" e "Recebimento de Concessão".
Pendência 19469 - Simulação de Empréstimos
Campos "Mínimo de Parcelas" e "Máximo de Parcelas" está aparecendo duplicado.
================================================================================
CM$VER      3.10.21     01/06/2005
--------------------------------------------------------------------------------
Pendência 19085 - Acesso ao sistema
- Incluir coluna na WEBSESSAO para identificar interface para sistemas externos.
Pendência 19087 - Consulta Contratos de Empréstimos
- Incluir link sempre na primeira coluna da tabela, não importa qual seja o campo.
Pendência 19088 - Extratos de empréstimos
- Revista a query do extrato, retirando da query os registros referentes à atualização diária. Incluído, ainda, campo com situação da parcela (se está paga, em aberto ou suspensa).
Pendência 19092 - Login do sistema
- Verificar, no login, se o usuário tem acesso alguma página da interface. Caso não tenha, exibir uma mensagem de erro e não permitir sua entrada no sistema por aquela interface.
================================================================================
CM$VER      3.10.20     16/05/2005
--------------------------------------------------------------------------------
Sincronização dos fontes com alterações de todos os clientes.
================================================================================
CM$VER      3.10.15     09/12/2004
--------------------------------------------------------------------------------
Correção de problema no extrato de empréstimos.
================================================================================
CM$VER      3.10.13     17/11/2004
--------------------------------------------------------------------------------
Pendência 16666 - Menus do Auto-Atendimento
- Possibilitar que os itens de menu que possuam subitens possam ter seus títulos alterados.
================================================================================
CM$VER      3.10.12     08/09/2004
--------------------------------------------------------------------------------
Pendência 16960 - Gráfico de Acesso por Páginas
- Implementar gráfico estatístico de acessos ao Auto-Atendimento por páginas.
================================================================================
CM$VER      3.10.11     01/09/2004
--------------------------------------------------------------------------------
Pendência 17519 - Inscrição em Empréstimos
- Resolução do problema que permitia gravar duas inscrições para o mesmo participante se o mesmo em instante de segundos clicasse no botão "Voltar" do browser.
Pendência 16752 - Simulação de Empréstimos
- Incluir campo CPF na simulação de empréstimos.
================================================================================
CM$VER      3.10.10     11/08/2004
--------------------------------------------------------------------------------
Pendência 17337 - Simulação de Empréstimos
- Implementação da data de falecimento no cálculo de quitações.
================================================================================
CM$VER      3.10.09b    27/04/2004
--------------------------------------------------------------------------------
Pendência 16674 - Consulta a Constratos de Empréstimos
- Permitir que a regra de cálculo do saldo do contrato seja desabilitada.
================================================================================
CM$VER      3.10.09a    26/04/2004
--------------------------------------------------------------------------------
Pendência 16657 - Inscrição em Empréstimos
- Não permitir que o usuário possa increver-se em empréstimos cujo valor seja zero ou negativo, independentemente do valor que a regra retorne.
================================================================================
CM$VER      3.10.09     22/04/2004
--------------------------------------------------------------------------------
Pendência 16613 - Simulação de Empréstimos
- Impedir simulações de empréstimos para participantes que não atendem à regra de limites.
================================================================================
CM$VER      3.10.08     15/04/2004
--------------------------------------------------------------------------------
- Alteração na geração de senha para informar o login do usuário caso apresente erro.
================================================================================
CM$VER      3.10.07     06/04/2004
--------------------------------------------------------------------------------
Pendência 15947 - Diversas páginas
- Implementação do bloqueio de senhas quando usuário errar um certo número de vezes.
================================================================================
CM$VER      3.10.06     02/04/2004
--------------------------------------------------------------------------------
Primeira liberação no SAD.
================================================================================
CM$ALT}





























































































































































