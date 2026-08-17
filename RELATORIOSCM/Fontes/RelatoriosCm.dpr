program RelatoriosCm;

uses
  Forms,
  FCMEntrada,
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  UModulo in 'UModulo.pas',
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  CmSqlWzd in 'CmSqlWzd.pas',
  FAguardeDDic in 'FAguardeDDic.pas' {FrmAguardeDDic},
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FCadastroGrid in '..\..\Cm\Forms\Source\FCadastroGrid.pas' {frmCadastroGrid},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {frmCadastroGridCS},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  fTransfRelats in 'fTransfRelats.pas' {frmTransfRelats},
  uVerificaSQL in 'uVerificaSQL.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FConsultaManualMT in '..\FontesMT\FConsultaManualMT.pas' {FrmConsultaManual},
  FCadGrupoRelatorioMT in '..\FontesMT\FCadGrupoRelatorioMT.pas' {FrmCadGrupoRelatorio},
  fCadRelatorioMT in '..\FontesMT\fCadRelatorioMT.pas' {FrmCadRelatorio},
  fConfigChartMT in '..\FontesMT\fConfigChartMT.pas' {frmConfigChart},
  FDesenhoOutLookMT in '..\FontesMT\FDesenhoOutLookMT.pas' {FrmDesenhoOutLook},
  FDataDicMT in '..\FontesMT\FDataDicMT.pas' {FrmDataDic},
  FAssistenteConsultasMT in '..\FontesMT\FAssistenteConsultasMT.pas' {FrmAssistenteConsultas},
  FAssistenteExportaMT in '..\FontesMT\FAssistenteExportaMT.pas' {FrmAssistenteExport},
  FCadSubGrpRelatoriosMT in '..\FontesMT\FCadSubGrpRelatoriosMT.pas' {frmCadSubGrpRelatorios},
  FExportaRelatorioMT in '..\FontesMT\FExportaRelatorioMT.pas' {FrmExportaRelatorioMT},
  FImportaRelatorioMT in '..\FontesMT\FImportaRelatorioMT.pas' {frmImportarRelatorioMT},
  uMD5 in '..\FontesMT\uMD5.pas';

{$R *.RES}
{$R RELATORIOSCM_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Gerador de Relatórios, Consultas e Gráficos';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TFrmDataDic, FrmDataDic);
  Application.CreateForm(TFrmAguardeDDic, FrmAguardeDDic);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;

  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Gerador de Relatórios, Consultas e Gráficos
================================================================================
CM$VER      3.04.21     20/12/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.18
================================================================================
CM$VER      3.04.20     31/07/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.17
================================================================================
CM$VER      3.04.19     18/06/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.16
================================================================================
CM$VER      3.04.18     27/02/2007
--------------------------------------------------------------------------------
Liberação do padrão 5.10.14
================================================================================
CM$VER      3.04.17     09/11/2006
--------------------------------------------------------------------------------
Liberação do padrão 5.10.13
================================================================================
CM$VER      3.04.16     18/09/2006
--------------------------------------------------------------------------------
Liberação do Padrão  5.10.12
================================================================================
CM$VER      3.04.15     12/07/2006
--------------------------------------------------------------------------------
 Liberação do Padrão  5.10.10
================================================================================
CM$VER      3.04.14     02/05/2006
--------------------------------------------------------------------------------
Padrão 5.10.09
================================================================================
CM$VER      3.04.13a    05/04/2006
--------------------------------------------------------------------------------
Pendencia: 21515  Gerador de Relatórios/Cadastro de Relatórios
Descrição: Correção da falha que ocorria ao selecionar os campos da consulta. Os campos
           não estavam sendo exibidos na lista.
================================================================================
CM$VER      3.04.13     01/11/2005
--------------------------------------------------------------------------------
Pendencia: 5998  Cadastros\Graficos
Descrição: Correção do erro no botão Editar, em que, ao clicar no botão,
           não acontecia nada. Liberada no padrão 5.10.08
Pendência 20562
Tela: Área de Trabalho / Consultas / Cadastro.
Descrição: Quando se realiza uma consulta manual ao Relatório Analítico Folha de Benefício (código 739/0);
 no momento em que se tenta fazer uma alteração no campo consulta (Query), ocorre um problema na tela,
que não permite a digitação desta query, a partir de um dado momento na tela. Vale ressaltar que este erro só
ocorre para este item específico (Relatório Analítico Folha de Benefício - código 739/0).
================================================================================
CM$VER      3.04.12     22/06/2004
--------------------------------------------------------------------------------
- Pendencia 15228 - Ajuste no campo descrição na filtraghem da tela de Cadastro/Consultas
================================================================================
CM$VER      3.04.11     16/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15229
  > Tela\Opçao No Sistema: Cadastro \ Relatórios
  No desenho do relatório não está vindo a opção de seleção do label texto.
- Resolução da Pendência Nº 14513
  > Tela\Opçao No Sistema: Cadastro \ Gráficos
  A clicar no Ok para gravação do gráfico, está dando erro de List Index, mas grava o mesmo.
- Resolução da Pendência Nº 14160
  > Tela\Opçao No Sistema: Consulta/ Relatório
  Quando dá OK final da erro, porém grava o relatório.
- Resolução da Pendência Nº 15229
  > Tela\Opçao No Sistema: Cadastro \ Relatórios
  No desenho do relatório não está vindo a opção de seleção do label texto.
- Resolução da Pendência Nº 14513
  > Tela\Opçao No Sistema: Cadastro \ Gráficos
  A clicar no Ok para gravação do gráfico, está dando erro de List Index, mas grava o mesmo.
- Resolução da Pendência Nº 14160
  > Tela\Opçao No Sistema: Consulta/ Relatório
  Quando dá OK final da erro, porém grava o relatório.
================================================================================
CM$VER      3.04.10     16/10/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14513
  > Tela\Opçao No Sistema: Cadastro \ Gráficos
  A clicar no Ok para gravação do gráfico, está dando erro de List Index, mas grava o mesmo.
- Resolução da Pendência Nº 14160
  > Tela\Opçao No Sistema: Consulta/ Relatório
  Quando dá OK final da erro, porém grava o relatório.
================================================================================
CM$VER      3.04.09     07/04/2003
--------------------------------------------------------------------------------
- Altração dos nomes dos forms, retornando-os para o nome original (sem MT no final) para ficar de acordo com as autorizações.
================================================================================
CM$VER      3.04.08     05/02/2003
--------------------------------------------------------------------------------
- Correção na tela de Consulta Manual que em alguns casos permitia que um usuário utilizasse,  sem autorização, uma coluna de uma tabela.
================================================================================
CM$VER      3.04.07     04/12/2002
--------------------------------------------------------------------------------
- Correção de problema no Cadastro de Relatórios que, em alguns casos, poderia corromper o layu-out do relatório.
================================================================================
CM$VER      3.04.06     28/11/2002
--------------------------------------------------------------------------------
- Alteração nas telas de cadastro de Consultas e de Relatórios para não aceitar apostrofos nos repectivos nomes.
================================================================================
CM$VER      3.04.05     25/10/2002
--------------------------------------------------------------------------------
- Alteração para quando excluir uma consulta, excluir tambem os direitos de todos os usuários sobre ela.
  Com isso pôde-se "dropar" a trigger "TrgDataviewAcesso" que realizava essa tarefa.
- Inclusão na tela de Cadastro de Consultas o código interno das mesmas.
- Inclusão na tela de Cadastro de Relatorios o código interno dos mesmos.
- Na Área de Trabalho/Relatórios/Visualizar não apareciam os dados do relatório.
- Na Área de Trabalho/Consultas/Visualizar não apareciam os dados da consulta.
================================================================================
CM$VER      3.04.04     11/09/2002
--------------------------------------------------------------------------------
- Correção da tela de Cadastro de Relatorios: Não salvava o lay-out do relatorio na inclusão.
- Correção na tela principal (Formato Outlook): Não funcionava a visualização das consultas.
- Correção na tela principal (Formato Outlook): Não funcionava a visualização dos relatórios.
================================================================================
CM$VER      3.04.03     10/09/2002
--------------------------------------------------------------------------------
- Correção da Tela de Cadastro de Relatórios que não gravava o lay-out do relatório na inclusão.
================================================================================
CM$VER      3.04.02     04/09/2002
--------------------------------------------------------------------------------
- Correção da opção Salvar da Tela de Desenho que não funcionada adequadamente.
================================================================================
CM$VER      3.04.01     26/08/2002
--------------------------------------------------------------------------------
- Alteração na tela de Cadastro de Relatórios. No desenho do relatório o menu de opções foi corrigido, pois haviam algumas opções sem ação ou com ação indevida.
================================================================================
CM$VER      3.04.00     16/08/2002
--------------------------------------------------------------------------------
- Conversão da tela de Cadastro de Relatórios e Gráficos e dos Assistentes de Consultas 
  e Exportação para funcionar em três camadas.
================================================================================
CM$VER      3.03.05     11/07/2002
--------------------------------------------------------------------------------
- Alteração da tela de Dicionário de Dados para funcionar em tres camadas.
- Alteração na tela de Consulta Manual, estava com problema na inclusão, campo OrigemCM não era atualizado.
================================================================================
CM$VER      3.03.04     04/07/2002
--------------------------------------------------------------------------------
- Alteração da tela principal do sistema (semenhante ao Outlook) para o funcionamento 
em tres camadas.
- Alteração da telas de cadastro de Consultas Manuais, Grupos de Relatorios e 
Relatórios para funcionamento em tres camadas.
================================================================================
CM$VER      3.03.03     03/05/2002
--------------------------------------------------------------------------------
- Feitas as alterações para funcionar com o Padrão 5.6.
================================================================================
CM$VER      3.03.02     28/01/2002
--------------------------------------------------------------------------------
- No Oracle 7.3 estava demorando para montar a tela de parametros.
================================================================================
CM$VER      3.03.01     24/01/2002
--------------------------------------------------------------------------------
- Possibilita a restrição de acessos a tabelas e visões para os grupos de usuário.
================================================================================
CM$VER      3.03.00     10/10/2001
--------------------------------------------------------------------------------
- Permite alteração do relatório sem necessidade de entrar para alterar o desenho.
- Verifica se o usuário tem direito sobre as tabelas, colunas e views utilizadas para 
   criar a consulta na hora de cadastrar/alterar um nova consulta manual.
- Verifica se o usuário tem direito sobre a dataview utilizada na hora de cadastrar/alterar 
   um relatório.
================================================================================
CM$VER      3.02.00     04/10/2000
--------------------------------------------------------------------------------
- Implementação do Cadastro de Gráficos
- Correção do Assistente te Exportação de Consultas
- Correção do Assistente de Consultas
================================================================================
CM$VER      3.01.07     22/02/2000
--------------------------------------------------------------------------------
- Gráficos
  Correção no Desenho, Gravação, Preview e Imrpessão de relatórios com gráficos;
================================================================================
CM$VER      3.01.05     24/09/1999
--------------------------------------------------------------------------------
- Cadastro de Consultas
   Alteração na gravação do SQL da consulta pois não 
   gravava textos acima de 32 K;
================================================================================
CM$VER      3.01.04     06/09/1999
--------------------------------------------------------------------------------
- Área de Trabalho
  Alteração no estado da janela ao ser exibida uma tela de cadastro como a de
  relatório ou de consulta: a tela da área de trabalho era minimizada/restaurada
  agora permanece maximizada.
  As telas de cadastro passaram a ser exibidas de forma normal.
================================================================================
CM$VER      3.01.03     27/08/1999
--------------------------------------------------------------------------------
- Cadastro de Relatório
  Correção da edição e configuração de gráficos na tela de desenho do relatório;
- Etiquetas
   Implementação da Configuração e Impressão de etiquetas de endereçamento;
================================================================================
CM$VER      3.01.02     16/07/1999
--------------------------------------------------------------------------------
- Cadastro de relatórios
  Correção na tela de desenho pois não permitia a ultilização do componente Gráfico;
================================================================================
CM$VER      3.01.01     14/07/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Alteração na visualização do modelo de impressora selecionada: Passou a exibir o
  Nome da Impressora + O Nº de colunas;
================================================================================
CM$VER      3.01.00     08/07/1999
--------------------------------------------------------------------------------
- Parâmetros do Sistema
  Implemetação da tela onde é indicado o Modelo e Nome da Impressora Matricial ultilizada pelo sistema;
- Etiquetas: Configuração e Impressão
   Implementação da opção Relatórios\Etiquetas\Configuração e  Relatórios\Etiquetas\Impressão onde é
   possível configurar qualquer modelo de etiqueta tanto para impressão matricial qdo para impressão
   com Jato de Tinta e Lazer, além de possibilitar a impressão de etiquetas para qualquer tipo de Pessoa.
  
================================================================================
CM$VER      3.00.06     26/06/2001
--------------------------------------------------------------------------------
- Customizações para compatibilização dos Sistemas para acesso ao DB2
================================================================================
CM$VER      3.00.04     25/06/2001
--------------------------------------------------------------------------------
- Customizações para acesso ao DB2
================================================================================
CM$VER      3.00.03     24/05/2001
--------------------------------------------------------------------------------
- Importação de Relatórios
  Correção na atribuição da senha de acesso ao Banco para importação de relatório;
- Cadastro de Relatórios
  Otimização no cadastro de relatórios ultilizando MemoryStreams ao invés que gravar o
  Template em disco
- Visualização de Relatórios
  Otimização no display de relatórios ultilizando MemoryStreams ao invés que gravar o
  Template em disco
================================================================================
CM$VER      3.00.02     20/04/2001
--------------------------------------------------------------------------------
- Cadastro de Relatórios
  Correção na seleção das colunas da consulta do Cadastro de Relatórios no ambiente de desenho;
================================================================================
CM$VER      3.00.01     10/04/2001
--------------------------------------------------------------------------------
- Cadastro de Relatório
  Correção na  listagem dos campos para a consulta.
================================================================================
CM$VER      3.00.00     04/04/2001
--------------------------------------------------------------------------------
* Liberação de Versão Delphi 5
================================================================================
CM$VER      2.03.00     28/08/2000
--------------------------------------------------------------------------------
- Assistente de Consultas
- Dicionário de Dados
  Correção do erro "Field TIPOCHAVE is not of expected type":
  Consultas de acesso ao ddfield > Campo "tipochave" foi mudado o tipo;
- Assistente de Exportação
  Correção do erro "Field TIPOCHAVE is not of expected type":
  Consultas de acesso ao ddfield > Campo "tipochave" foi mudado o tipo;
  Correção da navegação pelo assistente;
================================================================================
CM$VER      2.02.06     23/03/2001
--------------------------------------------------------------------------------
- Cadastro de Relatórios
  Correção na gravação do relatório: A consulta era fechada no momento do Desenho do relatório;
================================================================================
CM$VER      2.02.05     19/03/2001
--------------------------------------------------------------------------------
- Cadastro de Relatórios
  Correção na listagem dos campos disponíveis para a consulta, selecionados a partir
  da consulta de origem associada ao relatório.
================================================================================
CM$VER      2.02.04     06/03/2001
--------------------------------------------------------------------------------
- Visualização de Relatórios
  Correção na atribuição do Identificador do relatório para a tela de filtro do mesmo.
================================================================================
CM$VER      2.02.03     12/02/2001
--------------------------------------------------------------------------------
- Login no Sistema
  Correção no teste do cadastramento dos parâmetros do sistema: Exclusão da mensagem
  de indicação dos parâmetros;
- Cadastro de Consultas
  Otimização da validação da consulta cadastrada;
================================================================================
CM$VER      2.02.02     05/02/2001
--------------------------------------------------------------------------------
- Cadastro de Conusltas
  Inclusão de Scrolls Bars Horizontal e Vertical no campo de cadastro das consultas.
  Exclusão da opção de quebra de linha automática.
================================================================================
CM$VER      2.02.01     22/01/2001
--------------------------------------------------------------------------------
- Tranferência de Relatórios
  Implementação da opção de Tranferência de Relatórios montados pelo Gerador de
  Relatórios entre 'Bases de Dados'\Instâncias existentes no cliente. Acessado pelo
  menu Sistema\Ultilitário\Tranferência de Relatórios;
================================================================================
CM$VER      2.02.00     11/01/2001
--------------------------------------------------------------------------------
- Cadastro de Relatórios
  Correção do erro na gravação do Lay-Out dos relatórios com imagens ou com
  muitos dados;
- Tela de Desenho
  Otimização na abertura da tela;
  Alterações no Layout;
- Geral
  Acerto no número da versão.
================================================================================
CM$ALT}















































































