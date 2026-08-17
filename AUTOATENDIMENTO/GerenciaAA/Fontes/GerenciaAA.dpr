program GerenciaAA;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\..\CM\Forms\Source\fAguarde.pas' {frmAguarde},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\..\CM\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\..\CM\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\..\CM\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  UModuloGerenciaAA in 'UModuloGerenciaAA.pas',
  FCadastroPai in '..\..\..\CM\FORMS\SOURCE\FCADASTROPAI.pas' {frmCadastroPai},
  FCadastroMT in '..\..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FSelecionaDados in 'FSelecionaDados.pas' {frmSelecionaDados},
  FWebConfiguracao in 'FWebConfiguracao.pas' {frmWebConfiguracao},
  FGeracaoSenha in 'FGeracaoSenha.pas' {frmGeracaoSenha},
  FConexao in 'FConexao.pas' {frmConexao},
  FFrameDadosExportados in 'FFrameDadosExportados.pas' {frameDadosExportados: TFrame},
  FGeraExportacao in 'FGeraExportacao.pas' {frmGeraExportacao},
  FExporta in 'FExporta.pas' {frmExporta},
  FConsExportImport in 'FConsExportImport.pas' {frmConsExportImport},
  FImportacaoArquivos in 'FImportacaoArquivos.pas' {frmImportacaoArquivos},
  FSincronizacao in 'FSincronizacao.pas' {frmSincronizacao},
  FLogOperacao in 'FLogOperacao.pas' {frmLogOperacao},
  FCadWebInterface in 'FCadWebInterface.pas' {frmCadWebInterface},
  FCadWebReports in 'FCadWebReports.pas' {frmCadWebReports},
  FCadWebCfgInfRend in 'FCadWebCfgInfRend.pas' {frmCadWebCfgInfRend},
  FGeraPaginasCampos in 'FGeraPaginasCampos.pas' {frmGeraPaginasCampos},
  FSelOrigem in 'FSelOrigem.pas' {frmSelOrigem},
  FCriaSelecao in 'FCriaSelecao.pas' {frmCriaSelecao},
  FLimpeza in 'FLimpeza.pas' {frmLimpeza},
  fParamRelGraficoAcessos in 'fParamRelGraficoAcessos.pas' {frmParamRelGraficoAcessos},
  dReports in '..\..\..\Cm\Forms\Source\dReports.pas' {dtmReports},
  dParamRelGraficoAcessos in 'dParamRelGraficoAcessos.pas' {dtmParamRelGraficoAcessos},
  fStatus in 'fStatus.pas' {frmStatus},
  FCMPrincipalForms in '..\..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  dMS in 'dMS.pas' {dtmMS: TDataModule},
  FCadWebTpReports in 'FCadWebTpReports.pas' {frmCadWebTpReports};

{$R *.RES}
{$R GERENCIAAA_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Gerência do Auto-Atendimento';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TdtmMS, dtmMS);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Gerência do Auto-Atendimento
================================================================================
CM$VER      3.01.18a    10/01/2008
--------------------------------------------------------------------------------
- Pendência 23274 - Manutenção de dependentes. 
  Inclusão dos campos de CPF e Data de Falecimento e
  Ajuste da rotina de criação de páginas e campos.
================================================================================
CM$VER      3.11.18     21/12/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 18
================================================================================
CM$VER      3.11.17a    04/10/2007
--------------------------------------------------------------------------------
- Pendência 26488 - Criação de campos para definição de login e senha a serem utilizados para o novo módulo de AutoEmpréstimo
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
CM$VER      3.11.16     30/05/2007
--------------------------------------------------------------------------------
- Pendência 25164 - Dados Exibidos: Ajuste no comprimento do campo conteúdo.
- Liberação para versão do padrão 16
================================================================================
CM$VER      3.11.15a    24/05/2007
--------------------------------------------------------------------------------
- Pendência 24902 - Simulação de Empréstimo: Disponibilização de forma parametrizada da entrada do Valor Solicitado 
  na tela de parcelas simuladas e cálculo da margem consignável conforme o prazo selecionado.
================================================================================
CM$VER      3.11.15     26/03/2007
--------------------------------------------------------------------------------
- Liberação para versão do padrão 15
================================================================================
CM$VER      3.11.14a    02/03/2007
--------------------------------------------------------------------------------
- Pendência 23402 - Parametrização de envio de senha por e-mail do usuário, conexão com o servidor de e-mail e mensagens pré-definidas.
================================================================================
CM$VER      3.11.14     16/02/2007
--------------------------------------------------------------------------------
- Pendências 18467 e 21824 - Configuração/Dados Exibidos: Possibilidade de determinar acesso a página ou campo utilizando regra.
Versão para liberação do Padrão 14
================================================================================
CM$VER      3.11.13     21/11/2006
--------------------------------------------------------------------------------
Versão para liberação do Padrão 13
================================================================================
CM$VER      3.11.12     28/09/2006
--------------------------------------------------------------------------------
Versão para liberação do Padrão 12
================================================================================
CM$VER      3.11.11b    22/09/2006
--------------------------------------------------------------------------------
Pendência 23274 - Manutenção de Dependentes
- Permitir cancelamento de dependentes e, na inclução, permitir que um cliente cancelado possa ser reativado.
================================================================================
CM$VER      3.11.11a    14/09/2006
--------------------------------------------------------------------------------
- Pendência 23301 - Gráfico de acessos ajustado para padrão 10 ou superior
================================================================================
CM$VER      3.11.11     28/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 11.
================================================================================
CM$VER      3.11.10     14/07/2006
--------------------------------------------------------------------------------
Versão para liberação do Padrão 10
================================================================================
CM$VER      3.10.40     08/05/2006
--------------------------------------------------------------------------------
Pendência 21165 - Simulação de Benefícios
- Desenvolvimento de módulo para uso da ferramenta nos sistemas que utilizam o padrão do TotalPrev.
Pendência 22043 - Situação Atual de Benefícios
- Implementar consulta (incluindo número de beneficio do INSS)
================================================================================
CM$VER      3.10.39     10/04/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.09.
================================================================================
CM$VER      3.10.38     04/04/2006
--------------------------------------------------------------------------------
Pendência 21984 - Simulação de empréstimos
- Sincronização de alterações com Empréstimos.
================================================================================
CM$VER      3.10.37     23/03/2006
--------------------------------------------------------------------------------
- Mudanças internas no uso do Regra 3 Camadas.
================================================================================
CM$VER      3.10.36     16/02/2006
--------------------------------------------------------------------------------
Pendência 20450 - Alteração Cadastral de Telefone
- Implementação da funcionalidade.
================================================================================
CM$VER      3.10.35     05/01/2006
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
Pendência 21186 - Simulação/Concessão de Empréstimos
- Sincronização dos fontes do Auto-Atendimento e do Empréstimo.
================================================================================
CM$VER      3.10.34     12/12/2005
--------------------------------------------------------------------------------
Pendência 20727 - Cadastros de Campos e Resultados para Simulação
- Queries de entrada não estavam sendo salvas corretamente. Incluir scrollbars nos campos.
================================================================================
CM$VER      3.10.33     09/11/2005
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
CM$VER      3.10.32     10/08/2005
--------------------------------------------------------------------------------
Pendência 19945 - Todo o sistema
- Migrar o Auto-Atendimento para o padrão 5.10.06.
================================================================================
CM$VER      3.10.31     03/08/2005
--------------------------------------------------------------------------------
Pendência 19808 - Configurações do Auto-Atendimento
- Não está gravando alterações das definições de regras de validação de novo usuário.
================================================================================
CM$VER      3.10.30     28/07/2005
--------------------------------------------------------------------------------
Pendência 19694 - Contratação de Empréstimos
- Implementar impressão de contratos.
================================================================================
CM$VER      3.10.29     20/07/2005
--------------------------------------------------------------------------------
Pendência 19576 - Login do sistema
- Implementar lembrete de senha.
================================================================================
CM$VER      3.10.28     18/07/2005
--------------------------------------------------------------------------------
Alterações diversas.
================================================================================
CM$VER      3.10.27     27/06/2005
--------------------------------------------------------------------------------
Pendência 19547 - Simulação de Empréstimos
- Correção no cálculo do saldo de empréstimos anteriores.
================================================================================
CM$VER      3.10.26     23/06/2005
--------------------------------------------------------------------------------
Pendência 19547 - Simulação de Empréstimos
- Correção no cálculo do saldo de empréstimos anteriores.
================================================================================
CM$VER      3.10.25     21/06/2005
--------------------------------------------------------------------------------
Pendência 19510 - Simulação/Contratação de Empréstimos
- Liberar contratação de empréstimos para usuários com empréstimos anteriores. Tornar a mensagem, que hoje é restritiva, em informativa. Mensagem: "Participante não poderá contratar este empréstimo antes de quitar o(s) anterior(es)."
Pendência 19488 - Simulação/Contratação de Empréstimos
- Implementar alterações da pendência 19196.
Pendência 19511 - Execução de regras
Implementar registro em arquivos texto referentes a regras executadas para facilitar o debug dos usuários, de modo que estes possam resolver problemas sem recorrer à CM.
================================================================================
CM$VER      3.10.22     14/06/2005
--------------------------------------------------------------------------------
Pendência 19244 - Login do sistema
Implementar funcionalidade "Novo usuário", no qual o usuário possa criar a sua senha.
Pendência 19464 - Concessão de Empréstimos
Todos os campos de "Forma de Pagamento" x "Forma de Recebimento", e "Conta de Pagamento" x "Conta de Recebimento" estão com suas descrições trocadas. Aproveitar e mudar para "Pagamento de Prestações" e "Recebimento de Concessão".
================================================================================
CM$VER      3.10.21     01/06/2005
--------------------------------------------------------------------------------
Pendências diversas no Auto-Atendimento.
================================================================================
CM$VER      3.10.20     16/05/2005
--------------------------------------------------------------------------------
Sincronização dos fontes com alterações de todos os clientes.
================================================================================
CM$VER      3.10.16     17/11/2004
--------------------------------------------------------------------------------
Pendência 16666 - Menus do Auto-Atendimento
- Possibilitar que os itens de menu que possuam subitens possam ter seus títulos alterados.
================================================================================
CM$VER      3.10.15     18/10/2004
--------------------------------------------------------------------------------
Pendência 17120 - Alteração de senhas
- Incluir opção de geração de senha aleatória.
Pendência 17121 - Exportação de senhas
- Permitir exportar senhas apenas para sócio novo.
Pendência 17103 - Exportação de senhas
- Implementar possibilidade de parametrização para arquivo de exportação de senhas.
================================================================================
CM$VER      3.10.14     08/09/2004
--------------------------------------------------------------------------------
Pendência 16960 - Gráfico de Acesso por Páginas
- Implementar gráfico estatístico de acessos ao Auto-Atendimento por páginas.
================================================================================
CM$VER      3.10.13     31/08/2004
--------------------------------------------------------------------------------
Pendência 16752 - Simulação de Empréstimos
- Incluir campo CPF na simulação de empréstimos.
================================================================================
CM$VER      3.10.12     11/08/2004
--------------------------------------------------------------------------------
Pendência 17337 - Simulação de Empréstimos
- Implementação da data de falecimento no cálculo de quitações.
================================================================================
CM$VER      3.10.11     06/08/2004
--------------------------------------------------------------------------------
Pendência 17122 - Exportação de Senhas
- Incluir exportação de senhas no módulo Central de Atendimento.
================================================================================
CM$VER      3.10.10     19/05/2004
--------------------------------------------------------------------------------
Pendência 15208 - Migração de dados
- Alterações na rotina de migração de dados entre bases.
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
Pendência 15947 - Confirguração do Auto-Atendimento; Alteração de Senha
- Implementação do bloqueio de senhas quando usuário errar um certo número de vezes.
================================================================================
CM$VER      3.10.06     02/04/2004
--------------------------------------------------------------------------------
Utilização da CMWebComum50.bpl
================================================================================
CM$VER      3.10.03m    19/01/2004
--------------------------------------------------------------------------------
Liberação do sistema nos PadrõesCM.
 
================================================================================
CM$ALT}












