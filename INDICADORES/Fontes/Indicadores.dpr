program Indicadores;

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\CM\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\CM\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\CM\Forms\Source\fAguarde.pas' {frmAguarde},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FSairAjuda in '..\..\CM\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\CM\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  FCadastroCS in '..\..\CM\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  FCmReport in '..\..\Cm\Forms\Source\FCmReport.pas' {FrmCmReport},
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas' {FrmCadastroMestreDetMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {frmCadastroPai},
  fParamReports_Padrao in '..\..\Cm\Forms\SourceMT\fParamReports_Padrao.pas' {frmParamReports_Padrao},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  UModuloIndicadores in 'UModuloIndicadores.pas',
  dRelLojasLivres in 'dRelLojasLivres.pas' {dtmRelLojasLivres},
  dRelAbono in 'dRelAbono.pas' {dtmRelAbono},
  dRelEnergia in 'dRelEnergia.pas' {dtmRelEnergia},
  dRelFuncionario in 'dRelFuncionario.pas' {dtmRelFuncionario},
  dRelOrcamento in 'dRelOrcamento.pas' {dtmRelOrcamento},
  dRelRemessa in 'dRelRemessa.pas' {dtmRelRemessa},
  dRelVendaLoja in 'dRelVendaLoja.pas' {dtmRelVendaLoja},
  dRelEstrutura in 'dRelEstrutura.pas' {dtmRelEstrutura},
  dRelIndicadores in 'dRelIndicadores.pas' {dtmRelIndicadores},
  fCadLojaMT in 'fCadLojaMT.pas' {frmCadLojaMT},
  fCadIndicadoresMT in 'fCadIndicadoresMT.pas' {frmCadIndicadoresMT},
  fCadContratoLojaMT in 'fCadContratoLojaMT.pas' {frmCadContratoLojaMT},
  fCadSubTipoRelatMT in 'fCadSubTipoRelatMT.pas' {frmCadSubTipoRelatMT},
  fCadHistEventoMkgMT in 'fCadHistEventoMkgMT.pas' {frmCadHistEventoMkgMT},
  fCadTipoRelatMT in 'fCadTipoRelatMT.pas' {frmCadTipoRelatMT},
  fCadEventoMkgMT in 'fCadEventoMkgMT.pas' {frmCadEventoMkgMT},
  fApuracaoMT in 'fApuracaoMT.pas' {frmApuracaoMT},
  fExecCalcIndicadores in 'fExecCalcIndicadores.pas' {frmExecCalcIndicadores},
  cRelOrcamento in 'cRelOrcamento.pas' {cfgRelOrcamento},
  fParamIndicadores in 'fParamIndicadores.pas' {frmParamIndicadores},
  cRelFuncionario in 'cRelFuncionario.pas' {cfgRelFuncionario},
  dRelVeiculoSem in 'dRelVeiculoSem.pas' {dtmRelVeiculoSem},
  cRelVeiculoSem in 'cRelVeiculoSem.pas' {cfgRelVeiculoSem},
  cRelEnergia in 'cRelEnergia.pas' {cfgRelEnergia},
  cRelVendaLoja in 'cRelVendaLoja.pas' {cfgRelVendaLoja},
  cRelInadimplencia in 'cRelInadimplencia.pas' {cfgRelInadimplencia},
  dRelInadimplencia in 'dRelInadimplencia.pas' {dtmRelInadimplencia},
  cRelAbono in 'cRelAbono.pas' {cfgRelAbono},
  cRelRemessa in 'cRelRemessa.pas' {cfgRelRemessa},
  cRelLojasLivres in 'cRelLojasLivres.pas' {cfgRelLojasLivres},
  dRelVendaAtividade in 'dRelVendaAtividade.pas' {dtmRelVendaAtividade},
  dRelRanking in 'dRelRanking.pas' {dtmRelRanking},
  dRelPerformance in 'dRelPerformance.pas' {dtmRelPerformance},
  dRelAgua in 'dRelAgua.pas' {dtmRelAgua},
  cRelVendaAtividade in 'cRelVendaAtividade.pas' {cfgRelVendaAtividade},
  uCtrlRptIndicadores in '..\CtrlObjects\uCtrlRptIndicadores.pas',
  cRelRanking in 'cRelRanking.pas' {cfgRelRanking},
  fExecEncerraContrato in 'fExecEncerraContrato.pas' {frmExecEncerraContrato},
  fExecCheckList in 'fExecCheckList.pas' {frmExecCheckList},
  cRelAgua in 'cRelAgua.pas' {cfgRelAgua},
  cRelPerformance in 'cRelPerformance.pas' {cfgRelPerformance},
  dRelGrpApuracao in 'dRelGrpApuracao.pas' {dtmRelGrpApuracao},
  dRelVeiculoMen in 'dRelVeiculoMen.pas' {dtmRelVeiculoMen},
  cRelVeiculoMen in 'cRelVeiculoMen.pas' {cfgRelVeiculoMen},
  cRelIndicadores in 'cRelIndicadores.pas' {cfgRelIndicadores},
  cRelGrpApuracao in 'cRelGrpApuracao.pas' {cfgRelGrpApuracao},
  cRelEstrutura in 'cRelEstrutura.pas' {cfgRelEstrutura},
  fExecConcilia in 'fExecConcilia.pas' {frmExecConcilia},
  fExecImportacao in 'fExecImportacao.pas' {frmExecImportacao},
  fExecExcluiApuracao in 'fExecExcluiApuracao.pas' {frmExecExcluiApuracao},
  FCadEventoContratoLojaMT in 'fCadEventoContratoLojaMT.pas' {frmCadEventoContratoLojaMT},
  cRelVendaAtividadeShop in 'cRelVendaAtividadeShop.pas' {cfgRelVendaAtividadeShop},
  dRelVendaAtividadeShop in 'dRelVendaAtividadeShop.pas' {dtmRelVendaAtividadeShop},
  cRelOrcamentoCivil in 'cRelOrcamentoCivil.pas' {cfgRelOrcamentoCivil},
  dRelOrcamentoCivil in 'dRelOrcamentoCivil.pas' {dtmRelOrcamentoCivil},
  dRelRdsHotel in 'dRelRdsHotel.pas' {dtmRelRDSHotel},
  cRelRdsHotel in 'cRelRdsHotel.pas' {cfgRelRdsHotel},
  fCadContratoHotelMT in 'fCadContratoHotelMT.pas' {frmCadContratoHotelMT},
  dRelComparaHotel in 'dRelComparaHotel.pas' {dtmRelComparaHotel},
  cRelComparaHotel in 'cRelComparaHotel.pas' {cfgRelComparaHotel},
  mHotel in 'mHotel.pas' {molHotel: TFrame},
  dRelGraficoHotel in 'dRelGraficoHotel.pas' {dtmRelGraficoHotel},
  cRelGraficoHotel in 'cRelGraficoHotel.pas' {cfgRelGraficoHotel},
  cRelVendaFranquiaShop in 'cRelVendaFranquiaShop.pas' {cfgRelVendaFranquiaShop},
  dRelVendaFranquiaShop in 'dRelVendaFranquiaShop.pas' {dtmRelVendaFranquiaShop},
  fCadContratoTerceiroMT in 'fCadContratoTerceiroMT.pas' {frmCadContratoTerceiroMT},
  FProgresso in '..\..\Cm\Forms\Source\FProgresso.pas' {frmProgresso},
  fCadGrpApuracaoMT in 'fCadGrpApuracaoMT.pas' {frmCadGrpApuracaoMT},
  fExecImportPlanilha in 'fExecImportPlanilha.pas' {frmExecImportPlanilha},
  fCadSinonimoMT in 'fCadSinonimoMT.pas' {frmCadSinonimoMT},
  fCadLayOutImpMT in 'fCadLayOutImpMT.pas' {FrmCadLayOutImpMT},
  dRelVacancia in 'dRelVacancia.pas' {dtmRelVacancia},
  cRelVacancia in 'cRelVacancia.pas' {cfgRelVacancia},
  cRelEvolVacancia in 'cRelEvolVacancia.pas' {cfgRelEvolVacancia},
  dRelEvolVacancia in 'dRelEvolVacancia.pas' {dtmRelEvolVacancia},
  cRelAnaliseOrca in 'cRelAnaliseOrca.pas' {cfgRelAnaliseOrca},
  dRelAnaliseOrca in 'dRelAnaliseOrca.pas' {dtmRelAnaliseOrca},
  FWizardMT in '..\..\Cm\Forms\SourceMT\FWizardMT.pas' {frmWizardMT};

{$R *.RES}
{$R INDICADORES_RES.RES}

begin
  frmCMEntrada:= TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Indicadores de Shoppings, Hotéis e Parques';
  Application.HelpFile := 'C:\ProjetosCM5\Help\INDICADORES.HLP';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;

end. 
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Indicadores de Shoppings, Hotéis e Parques
================================================================================
CM$VER      3.01.18a    17/03/2008
--------------------------------------------------------------------------------
- Pendência 27596: Ajuste nos Helps do sistema.
================================================================================
CM$VER      3.01.18     15/01/2008
--------------------------------------------------------------------------------
Liberação do padrão 18
================================================================================
CM$VER      3.01.17     15/08/2007
--------------------------------------------------------------------------------
Liberação do padrão 17
Configuração de Relatórios
  Pendência: 26239 - Disponibilização de relatórios em 3 camadas para parametrização
                     de layout pelo usuário.
================================================================================
CM$VER      3.01.16     28/05/2007
--------------------------------------------------------------------------------
Liberação do Padrão 16.
================================================================================
CM$VER      3.01.15     23/03/2007
--------------------------------------------------------------------------------
- Liberação do padrão 15
================================================================================
CM$VER      3.01.14     16/02/2007
--------------------------------------------------------------------------------
- Pendencia 24000: Reestruturação interna dos módulos do Imobiliário
================================================================================
CM$VER      3.01.13a    31/01/2007
--------------------------------------------------------------------------------
Reestruturação interna de bibliotecas para o padrão 5.10.14
================================================================================
CM$VER      3.01.13     21/11/2006
--------------------------------------------------------------------------------
Liberação do padrão 13.
================================================================================
CM$VER      3.01.12     15/09/2006
--------------------------------------------------------------------------------
Liberação do padrão 12.
================================================================================
CM$VER      3.01.11a    05/10/2006
--------------------------------------------------------------------------------
Consulta / Relatórios
  Pend.: 23390 - Troca dos componentes para exibir gráficos nos seguintes relatórios:
                      -  Consumo de energia elétrica;
                      -  Evolução de vacância;
                      -  Fluxo de veículo mensal;
                      -  Fluxo de veículo semanal;
                      -  Orçamento - Encargos comuns;
                      -  Vacância por imóvel mestre.
================================================================================
CM$VER      3.01.11     28/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 11.
================================================================================
CM$VER      3.01.10     12/07/2006
--------------------------------------------------------------------------------
Liberação do padrão 10.
================================================================================
CM$VER      3.01.09     15/03/2006
--------------------------------------------------------------------------------
Liberação de Versão no padrão 5.10.09
================================================================================
CM$VER      3.01.08     23/01/2006
--------------------------------------------------------------------------------
- Liberação de versão no padrão 8
Importação de Indicadores
  - Correção da importação por planilha eletrônica quando não informado o valor correto
    na célula indicada no layout de importação
================================================================================
CM$VER      3.01.07b    05/12/2005
--------------------------------------------------------------------------------
- Cadastro de Indicadores: Criação de nova query de entrada de regra
================================================================================
CM$VER      3.01.07a    03/11/2005
--------------------------------------------------------------------------------
- Liberação de versão com novas bpls
================================================================================
CM$VER      3.01.07     11/10/2005
--------------------------------------------------------------------------------
Liberação do padrão 5.10.07
================================================================================
CM$VER      3.01.05     05/08/2005
--------------------------------------------------------------------------------
Liberação do Padrão 5.10.06
================================================================================
CM$VER      3.01.04a    17/01/2005
--------------------------------------------------------------------------------
Relatórios - Orçamento de Encargos Comuns
  - Inclusão do filtro para seleção dos indicadores a serem apresentados
Relatórios - Vacância por empreendimento
  - Inclusão do filtro para seleção do segmento de imóveis
================================================================================
CM$VER      3.01.04     15/12/2004
--------------------------------------------------------------------------------
Cadastro de Indicadores
  - Inclusão do tipo interno de indicador: Vacância
Relatórios
  - Implementação de relatório Operacional de Vacância por Imóvel Mestre
  - Implementação de relatório Operacional de Evolução de Vacância por Imóvel Mestre  
  - Implementação do relatório de Análise da Variações do Orçamento
  - Orçamento - Encargos Comuns: Inclusão da variação percentual, valor médio do 
    período informado e gráficos evolutivos diversos
  - Orçamento - Condomínio Civil: Inclusão da variação percentual e valor médio do
    período informado
================================================================================
CM$VER      3.01.03     14/10/2004
--------------------------------------------------------------------------------
Liberação do padrão 5.10.05
================================================================================
CM$VER      3.01.02     17/08/2004
--------------------------------------------------------------------------------
Parâmetros do Sistema
  - Inclusão de parâmetro indicador de impressão de logotipo em relatórios
================================================================================
CM$VER      3.01.01     22/06/2004
--------------------------------------------------------------------------------
Liberação do padrão 5.10.04
================================================================================
CM$VER      3.01.00b    27/05/2004
--------------------------------------------------------------------------------
Cadastro de Contratos
  - Correção de erro ao editar eventos
================================================================================
CM$VER      3.01.00     14/04/2004
--------------------------------------------------------------------------------
Cadastros
  - Criação da Tela de Cadastro de layout para importação de planilhas
  - Criação da Tela de Cadastro de Sinônimos de indicadores
Apuração
  - Inclusão do campo de Observação da apuração
Importação de Indicadores
  - Implementação do processo de importação de Planilha Eletrônica conforme
    layout cadastrado.   
================================================================================
CM$VER      3.00.04     09/03/2004
--------------------------------------------------------------------------------
Atualização para o padrão 5.10.03
================================================================================
CM$VER      3.00.03     23/12/2003
--------------------------------------------------------------------------------
Padronização da Barra de Progresso dos processos
Relatórios
 - RDS de Hotel - Exclusão do total do grupo de desempenho. Ajustes no calculo de percentual sobre as UH´s do Hotel.
================================================================================
CM$VER      3.00.02b    04/08/2003
--------------------------------------------------------------------------------
Alteração do uso da CMComunsImobiliarioObj50 para CMImobiliarioObj50
================================================================================
CM$VER      3.00.02a    27/06/2003
--------------------------------------------------------------------------------
Relatórios
  - Criação de relatório de Vendas x Franquia x Shopping
Cadastros
  - Implementação de Contrato de Terceiros
================================================================================
CM$VER      3.00.02     07/05/2003
--------------------------------------------------------------------------------
Liberado pelo padrão 5.10.00, excluisivo TOTALPREV
================================================================================
CM$VER      3.00.01c    21/03/2003
--------------------------------------------------------------------------------
- Implementação de Indicadores de Hotéis
- Implementação do arquivo de Help do sistema
- Cadastro de Indicadores
    Inclusão da referência aos dados de entrada para a regra de calculo do indicador
- Cadastro de Contratos com Hotéis  
- Cadastro de Dados Complementares
- Cadastro de Dados Complementares por Tipo de Imóvel
- Calculo de Indicadores
    Não exibe os passos de reajuste e prorrogação de contratos quando não for selecionada
    a opção de calculo de aluguel mínimo
    Exibe os Contratos de Hotéis a serem calculados por regra.  
- Relatórios
    Resumo diário do Hotel - RDS       ( novo )
    Comparativo entre Hotéis              ( novo )
    Gráficos de Indicadores de Hotéis  ( novo )
================================================================================
CM$VER      3.00.01     08/10/2002
--------------------------------------------------------------------------------
- Parâmetros do Sistema
    Associação do grupo de regras a ser utilizado
- Cadastro de Indicadores
    Inclusão da referência da regra de negócio para indic. de Regra
    Inclusão do tipo fixo de indicador para Overage de Vendas
    Exclusão do indicador de Data de Remessa
- Cadastro de Contratos de Lojas
    Inclusão da indicação da Situação Contratual ( jurídica )
- Apuração de Indicadores Calculados
    Inclusão da apuração dos indicadores calculados por regra
- Apuração de Indicadores
    Visualização da forma de apuração do indicador
    Bloqueio de alteração do indicador cuja apuração não tenha sido manual
- Relatórios
    Inclusão da opção de impressão de separador ou cores de linha alternadas.
    Somente serão utilizados os valores CALCULADOS para os indicadores de ABL e Aluguel.
    Utilização do novo indicador de Overage calculado por Regra nos relatórios de vendas.
    Remessa de Alugueis - Exclusão do indicador de Data da Remessa, onde a mesma passa a ser
                          a Data de Apuração dos Indicadores.
                          Inclusão do percentual de variação do Previsto x Realizado.
    Fluxo de veículos Semanal - Ordenação por mes e ano
    Novos Relatórios: Vendas e Aluguel por Atividade e Shopping
	    	      Condomínio Civil - Orçamento Civil	
  
- Novos Processos
    Conciliação de Indicadores de ABL e Aluguel (Calculado x Importado).
    Processo para exclusão de apurações em Lote
    Cadastro de Situação Contratual ( jurídica )
================================================================================
CM$VER      3.00.00     24/06/2002
--------------------------------------------------------------------------------
Versão Inicial
Cadastros
   Lojas
   Contratos
   Indicadores
   Tipo e Sub-Tipo de Indicador
   Grupo de Apuração
   Eventos de Marketing e Histórico
   Marcas
   Atividades
   Apuração de Indicadores
================================================================================
CM$ALT}


















































































































