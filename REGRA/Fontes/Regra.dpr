program Regra;

{%File '..\..\Cm\Regra\Package\CMRegra50.dpk'}

uses
  Forms,
  uAutorizacao,
  fCMEntrada,
  FPai in '..\..\Cm\Forms\Source\FPai.pas' {frmPai},
  FTelaAut in '..\..\Cm\Forms\Source\FTelaAut.pas' {frmTelaAutorizacao},
  fAguarde in '..\..\Cm\Forms\Source\fAguarde.pas' {frmAguarde},
  FCadastroPai in '..\..\CM\Forms\Source\FCadastroPai.pas' {FrmCadastroPai},
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  FSairAjuda in '..\..\Cm\Forms\Source\FSairAjuda.pas' {frmSairAjuda},
  FOkCancelar in '..\..\Cm\Forms\Source\FOkCancelar.pas' {frmOkCancelar},
  fDicionarioDados in 'fDicionarioDados.pas' {frmDicionarioDados},
  FCadastroCS in '..\..\Cm\Forms\Source\FCadastroCS.pas' {frmCadastroCS},
  fCadCampos in 'fCadCampos.pas' {frmCadCampos},
  fCadGrupoArquivo in 'fCadGrupoArquivo.pas' {frmCadGrupoArquivo},
  fAtualizVariaveis in 'fAtualizVariaveis.pas' {frmAtualizVariaveis},
  FCadMestreDetCS in '..\..\Cm\Forms\Source\FCadMestreDetCS.pas' {frmCadMestreDetalheCS},
  fCadRegra in 'fCadRegra.pas' {frmCadRegra},
  fCadTabelaLonga in 'fCadTabelaLonga.pas' {frmCadTabelaLonga},
  fConsulta in 'fConsulta.pas' {frmConsulta},
  uglobal in 'uglobal.pas',
  fExecutaRegra in 'fExecutaRegra.pas' {frmExecutaRegra},
  fDetalhes in 'fDetalhes.pas' {frmDetalhes},
  fAssociacaoGruposCampos in 'fAssociacaoGruposCampos.pas' {frmAssociacaoGruposCampos},
  fParamRelatRegra in 'fParamRelatRegra.pas' {frmParamRelatRegra},
  dReports in '..\..\Cm\Forms\Source\dReports.pas' {dtmReports: TDataModule},
  fParamRelatDetalhe in 'fParamRelatDetalhe.pas' {frmParamRelatDetalhe},
  dRelDetalhes in 'dRelDetalhes.pas' {dtmRelDetalhes: TDataModule},
  dRelRegra in 'dRelRegra.pas' {dtmRelRegra: TDataModule},
  fExportarRegras in 'fExportarRegras.pas' {frmExportarRegras},
  fImportarRegras in 'fImportarRegras.pas' {frmImportarRegras},
  fcampospararegra in 'fcampospararegra.pas' {frmCamposParaRegra},
  fExportaDicDados in 'fExportaDicDados.pas' {frmExportaDicDados},
  fListaValores in 'fListaValores.pas' {frmListaValores},
  fImportaTabGenerica in 'fImportaTabGenerica.pas' {frmImportaTabGenerica},
  fImportaTabLonga in 'fImportaTabLonga.pas' {frmImportaTabLonga},
  fCadTabelaGenerica in 'fCadTabelaGenerica.pas' {frmcadTabelaGenerica},
  fMigraDicDados in 'fMigraDicDados.pas' {frmMigraDicDados},
  FCadastroGridCS in '..\..\Cm\Forms\Source\FCadastroGridCS.pas' {FrmCadastroGridCS},
  FTestesRegra in 'ftestesregra.pas' {FrmTestesRegra},
  UBiblioteca in 'UBiblioteca.pas',
  FCadastro in '..\..\Cm\Forms\Source\FCadastro.pas' {frmCadastro},
  FCadMulti in '..\..\Cm\Forms\Source\FCadMulti.pas' {frmCadastroMulti},
  FCadMestreDet in '..\..\Cm\Forms\Source\FCadMestreDet.pas' {frmCadMestreDetalhe},
  DRegra in 'DRegra.pas' {DmRegra: TDataModule},
  FCadTab in 'FCadTab.pas' {frmCadTabela},
  FTipoPasso in 'FTipoPasso.pas' {frmTipoPasso},
  FMostraPassos in '..\..\Cm\Regra\Source\FMostraPassos.pas' {FrmMostraPassos},
  FCadastroMestreDetMT in '..\..\Cm\Forms\Source\FCadastroMestreDetMT.pas',
  FCadastroMT in '..\..\Cm\Forms\Source\FCadastroMT.pas' {FrmCadastroMT},
  FCadastroGridMT in '..\..\Cm\Forms\Source\FCadastroGridMT.pas' {FrmCadastroGridMT},
  uCtrlRegra in '..\..\Cm\RegraMT\Source\uCtrlRegra.pas',
  URegra in '..\..\Cm\Regra\Source\URegra.pas',
  UCtrlFormula in '..\CtrlObjects\UCtrlFormula.pas',
  FCadFormulaMT in '..\FontesMT\FCadFormulaMT.pas' {FrmCadFormulaMT},
  uDbFormula in '..\DbObjects\uDbFormula.pas',
  FCadGrpFormulaMT in '..\FontesMT\FCadGrpFormulaMT.pas' {FrmCadGrpFormulaMT},
  uDbGrpFormula in '..\DbObjects\uDbGrpFormula.pas',
  UCtrlGrpFormula in '..\CtrlObjects\UCtrlGrpFormula.pas',
  FControleAcessoTabGenerMT in '..\FontesMT\FControleAcessoTabGenerMT.pas' {FrmControleAcessoTabGenerMT},
  uDbGrpRegraUsuario in '..\DbObjects\uDbGrpRegraUsuario.pas',
  UCtrlTabgenerUsuario in '..\CtrlObjects\UCtrlTabgenerUsuario.pas',
  FCadGrpRegraMT in '..\FontesMT\FCadGrpRegraMT.pas' {FrmCadGrpRegraMT},
  uDbGrupoRegra in '..\DbObjects\uDbGrupoRegra.pas',
  UCtrlGrpRegra in '..\CtrlObjects\UCtrlGrpRegra.pas',
  UCtrlTipoRegra in '..\CtrlObjects\UCtrlTipoRegra.pas',
  FCadTipoRegraMT in '..\FontesMT\FCadTipoRegraMT.pas' {FrmCadTipoRegraMT},
  uDbTipoRegra in '..\DbObjects\uDbTipoRegra.pas',
  FCadVariavelMT in '..\FontesMT\FCadVariavelMT.pas' {FrmCadVariavelMT},
  UCtrlVariavel in '..\CtrlObjects\UCtrlVariavel.pas',
  uDbCmpbd in '..\DbObjects\uDbCmpbd.pas',
  uDbTabgenerUsuario in '..\DbObjects\uDbTabgenerUsuario.pas',
  UCtrlGrpRegraUsuario in '..\CtrlObjects\UCtrlGrpRegraUsuario.pas',
  FControleAcessoTipoRegraMT in '..\FontesMT\FControleAcessoTipoRegraMT.pas' {FrmControleAcessoTipoRegraMT},
  FControleAcessoGrpRegraMT in '..\FontesMT\FControleAcessoGrpRegraMT.pas' {FrmControleAcessoGrpRegraMT},
  FInputVar in '..\..\Cm\REGRA\Source\finputvar.pas' {frmInputVar},
  Fpassoapasso in '..\..\Cm\REGRA\Source\fpassoapasso.pas' {FrmPassoAPasso},
  Fpegatab in '..\..\Cm\REGRA\Source\fpegatab.pas' {frmpegatab},
  uPilha in '..\..\Cm\REGRA\Source\upilha.pas',
  UCalcIrrf in '..\..\Cm\REGRA\Source\uCalcIrrf.pas',
  UDiasUteisInvest in '..\..\Cm\REGRA\Source\UDiasUteisInvest.pas',
  uFormulas in '..\..\Cm\REGRA\Source\uFormulas.pas',
  uFuncoesRegra in '..\..\Cm\REGRA\Source\uFuncoesRegra.pas',
  FPARAMRELATREGRA5 in 'FPARAMRELATREGRA5.pas' {FRMPARAMRELATREGRA5},
  uTiposRegraMT in '..\..\Cm\REGRAMT\Source\uTiposRegraMT.pas',
  FMostraPassosMT in '..\..\Cm\REGRAMT\Source\FMostraPassosMT.pas' {FrmMostraPassosMT},
  FPassoaPassoMT in '..\..\Cm\REGRAMT\Source\FPassoaPassoMT.pas' {FrmPassoAPassoMT},
  UCalcIrrfMT in '..\..\Cm\REGRAMT\Source\uCalcIrrfMT.pas',
  UDiasUteisInvestMT in '..\..\Cm\REGRAMT\Source\UDiasUteisInvestMT.pas',
  uFormulasMT in '..\..\Cm\REGRAMT\Source\uFormulasMT.pas',
  uFuncoesRegraMT in '..\..\Cm\REGRAMT\Source\uFuncoesRegraMT.pas',
  uRegraMT in '..\..\Cm\REGRAMT\Source\uRegraMT.pas',
  FInputVarMT in '..\..\Cm\REGRAMT\Source\FInputVarMT.pas' {FrmInputVarMT},
  FCMPrincipalForms in '..\..\Cm\Forms\Source\FCMPrincipalForms.pas' {frmCMPrincipalForms},
  FCMPrincipal in '..\..\Cm\Forms\CMPrincipal\FCMPrincipal.pas' {frmCMPrincipal},
  FCarregaTabua in 'FCarregaTabua.pas' {FrmCarregaTabua},
  uFormulasAtuariaisMT in '..\..\Cm\RegraMT\Source\uFormulasAtuariaisMT.pas';

{$R *.RES}
{$R REGRA_RES.RES}

begin
  frmCMEntrada := TfrmCMEntrada.Create(Application);
  frmCMEntrada.Show;
  frmCMEntrada.Update;

  Application.Initialize;
  Application.Title := 'Regras de Negócio';
  Application.HelpFile := 'C:\ProjetosCM5\Bin\REGRA.HLP';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmAguarde, frmAguarde);
  Application.CreateForm(TfrmConsulta, frmConsulta);
  Application.CreateForm(TDmRegra, DmRegra);
  Application.CreateForm(TFrmMostraPassos, FrmMostraPassos);
  frmCMEntrada.Hide;
  frmCMEntrada.Free;
  Application.Run;
end.
{CM$ALT
================================================================================
Histórico de alterações efetuadas no módulo Regras de Negócio
================================================================================
CM$VER      3.02.09a    14/03/2008
--------------------------------------------------------------------------------
Pendência: 27173
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Novo paramentro para fórmula VLRBENEFICIO possibilitando informar o IDPESSOA da pesquisa
Pendência: 226850
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Inclui parametro, DATAEFETIVACAO, na fórmula CTVA
================================================================================
CM$VER      3.02.09     20/12/2007
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 18
Pendência: 26941
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Ajuste na consulta da fórmula RMTRANSFERENCIA corrigindo a máscara para obter o mês da alimentação.
Pendência: 26958
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Ajuste no texto descritivo da fórmula DIFMESES.
================================================================================
CM$VER      3.02.08b    23/10/2007
--------------------------------------------------------------------------------
Pendência: 26070 (Reabertura)
Tela: Cadastros / Cadastro de Fórmulas / RMTRANSFERENCIA
Descrição: Nova pesquisa, filtra apenas a DATAALIMENTACAO que deve acompanhar
           o MESREFERENCIA
================================================================================
CM$VER      3.02.08a    22/10/2007
--------------------------------------------------------------------------------
Pendência: 26092
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Nova fomula SOMACOTASRESERVA para retornar o somatório das reservas
           informadas no periodo desejado.
================================================================================
CM$VER      3.02.08     21/08/2007
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 17
Pendência: 25796
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Ajuste nas fórmulas ADICIONALDIA, ADICIONALMES, NUMDIASADICIONAL e
           NUMDIASPERCADICIONAL para considerar o novo Adicional de Incorporação.
           Ver texto explicativo no Cadastro de Fórmulas do módulo Regra.
Pendência: 26070
Tela: Cadastros / Cadastro de Fórmulas
Descrição: Ajuste na fórmula RMTRANSFERENCIA para tratar registros com mês referência de abono.
================================================================================
CM$VER      3.02.07b    18/07/2007
--------------------------------------------------------------------------------
Pendência: 25782
Tela: Fórmula INDICE 
Descrição: Novo parametro para retornar a DATA da cotação
================================================================================
CM$VER      3.02.07a    10/07/2007
--------------------------------------------------------------------------------
Pendência: 25544
Tela: Fórmula PERCFUNPBC
Descrição: Acerto na pesquisa das funções
Pendência: 24913
Tela: Fórmula SOMACONTRIB
Descrição: Novo parametro MESCOBRANCA
================================================================================
CM$VER      3.02.07     21/05/2007
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 16
================================================================================
CM$VER      3.02.06     22/01/2007
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 15
================================================================================
CM$VER      3.02.05     22/01/2007
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 14
================================================================================
CM$VER      3.02.04h    27/02/2007
--------------------------------------------------------------------------------
Pendência: 24512
Tela: Fórmula PR2
Descrição: Novo filtro na consulta da HISTRUBSAL para não pegar registros estornados
================================================================================
CM$VER      3.02.04g    22/02/2007
--------------------------------------------------------------------------------
Tela: Fórmula VLRBENEFICIO
Descrição: Opção para escolher a coluna de pesquisa (MESREFERENCIA/MES)
================================================================================
CM$VER      3.02.04f    26/01/2007
--------------------------------------------------------------------------------
Tela: Fórmula POSSUIMIGRACAO
Descrição: Opção para pesquisar na EVENTOSPREV 
================================================================================
CM$VER      3.02.04e    22/12/2006
--------------------------------------------------------------------------------
Tela: Fórmula SOMAHSTBENEF
Descrição: Correção na fórmula SOMAHSTBENEF 
Tela: Fórmula SOMAHSTBENEF
Descrição: Correção na fórmula SOMAHSTBENEF
================================================================================
CM$VER      3.02.04d    20/12/2006
--------------------------------------------------------------------------------
Pendência: 23054 (Reabertura)
Tela: Fórmula
Descrição: Correção na fórmula  CTVA
================================================================================
CM$VER      3.02.04c    13/12/2006
--------------------------------------------------------------------------------
Pendência: 23984
Tela: Fórmula PV, FV, PMT
Descrição: Alteração nas fórmulas de Emprestimo (PV,FV,PMT...) para resultado com ponto
================================================================================
CM$VER      3.02.04b    17/11/2006
--------------------------------------------------------------------------------
Pendência: 23054 (Reabertura)
Tela: Fórmula
Descrição: Nova fórmula  CTVA
================================================================================
CM$VER      3.02.04a    08/11/2006
--------------------------------------------------------------------------------
Pendência: 23055 (Reabertura)
Tela: Fórmulas VALORCF e VLRCF
Descrição: Novo parametro "Pisso de Mercado" e "Pisso de Mercado dos Licenciados"
================================================================================
CM$VER      3.02.04     23/10/2006
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 12
Pendência: 23054
Tela: Fórmula CTVA
Descrição: Nova formula
Pendência: 23055
Tela: Fórmulas VALORCF e VLRCF
Descrição: Novo parametro "Pisso de Mercado" e "Pisso de Mercado dos Licenciados"
Pendência: 23515
Tela: Fórmula VERCONCEDIDO
Descrição: Novo parametro para indicar o IDPESSOA
Pendência: 23503
Tela: Fórmula VLRBENEFICIO
Descrição: Novo parametro para filtrar beneficios não pagos
Pendência: 23460
Tela: Fórmulas
Descrição: Novo parametro na formula RUBRINDIV
Pendência: 23270
Tela: Fórmula VLRBENEFICIO
Descrição: Novo parametro para filtrar por plano ou fontepagadora
================================================================================
CM$VER      3.02.03     10/08/2006
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 11
================================================================================
CM$VER      3.02.02     12/07/2006
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 10
Pendência: 21565
Tela: Fórmulas
Descrição: Criação de novas formulas para o cálculo atuarial
           TABSERV, TABPENSAO, GRAVAMEMATUARIAL
================================================================================
CM$VER      3.02.01a    27/06/2006
--------------------------------------------------------------------------------
Pendência: 22691
Tela: Formula PERCFUNPBC
Descrição: Correção da porcentagem gerada pela fórmula PERCFUNPBC.
Pendência: 22637
Descrição: Integração com as novas funções Atuariais
================================================================================
CM$VER      3.02.01     16/03/2006
--------------------------------------------------------------------------------
- Liberação de versão para o Padrão 9
================================================================================
CM$VER      3.02.00a    09/05/2006
--------------------------------------------------------------------------------
Pendência: 21963
Tela: Fórmulas
Descrição: Nova fórmula RUBREEMBINSS
Pendência: 22221
Tela: Gravar na memória de calculo
Descrição: Novas disposições dos valores na tela de passo a passo
Pendência: 22083
Tela: Formula IRRF
Descrição: Acerto na pesquisa das opções 1,2,3,4,5 do tipo de pesquisa
Pendência: 22265
Tela: 3C - Compara valores
Descrição: Acerto na comparação com valores nulos
Pendência: 22262
Tela: 3C - Passo a passo
Descrição: Permitir executar com arquivo externo sem informa o SQL de entrada
Pendência: 22259
Tela: 3C - Passo a passo
Descrição: Quando ocorre um erro o sistema se perde nas telas de resultado do passo
Pendência: 21619
Tela: Formula TRUNC
Descrição: Acerto no caso de mais de 4 decimais
Pendência: 22251
Tela: Formula TEMPOFUNDACAO
Descrição: Acertos caso tenha mais de um resgate
================================================================================
CM$VER      3.02.00     07/03/2006
--------------------------------------------------------------------------------
Pendência: 21619
Tela: Formula TRUNC
Descrição: Novo procedimento interno para truncar valor
================================================================================
CM$VER      3.01.07d    07/03/200
--------------------------------------------------------------------------------
Pendência: 21053
Tela: Gravar na memoria de Calculo
Descrição: Caso não exista a variavel a gravar, pula o passo.
Pendência: 21628
Tela: Formula TEMPOFUNDACAO
Descrição: Acerto caso pessoa possua reinscrição
================================================================================
CM$VER      3.01.07c    22/02/200
--------------------------------------------------------------------------------
Pendência:
Tela: Formula IRRF
Descrição: Acerto na montagem das faixas
================================================================================
CM$VER      3.01.07b    07/02/200
--------------------------------------------------------------------------------
Pendência: 21373
Tela: Cadastros de abela Generica
Descrição: Gravar Tabela Genérica o campo IDMODULO e IDPESSOA = IDEMPRESAPROP.
Pendência: 21362
Tela: Importação de Regras
Descrição: Permitir a importação, COMO CÓPIA, de regra quando existe outra de
           mesmo número, já publicada.
Pendência: 19512
Tela: Importação de Regras
Descrição: Permitir passar para o Regra um arquivo *.CDS do disco.
           Esta pendência facilitará muito o debug de erros
           de regra no Auto-Atendimento.
Pendência: 21052
Tela: Importação de Regras
Descrição: - Importar os passos mesmo que a regra esteja
             publicada na origem
           - Colocá-la sempre como não publicada para permitir
             alteração no destino
================================================================================
CM$VER      3.01.07a    26/01/200
--------------------------------------------------------------------------------
Pendência: 21316
Tela: Formula TEMPOPATRO
Descrição: Filtrar somente patrocinadoras
================================================================================
CM$VER      3.01.07     25/01/2006
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.08.
Pendência: 21313
Tela: Formula VALORRESERVA
Descrição: Nova opção para utilizar Lista de Reservas
================================================================================
CM$VER      3.01.06h    19/12/2005
--------------------------------------------------------------------------------
Pendência: 20668
Tela: Formula SOMACONJUNTORUBRICA
Descrição: Nova formula SOMACONJUNTORUBRICA
================================================================================
CM$VER      3.01.06g    15/12/2005
--------------------------------------------------------------------------------
Liberação de versão no Padrão 5.10.08.
================================================================================
CM$VER      3.01.06f    08/12/2005
--------------------------------------------------------------------------------
Pendência: 20990
Tela: Formula VLRBENEFICIO
Descrição: Opção para pesquisar variod BENEFICIOS ou na formula VLRBENEFICIO
Pendência: 20917
Tela: Formula VALORRESERVA
Descrição: Opção para pesquisar por IDTIPORESERVA ou CODHIERARQUIA
================================================================================
CM$VER      3.01.06e    17/11/2005
--------------------------------------------------------------------------------
Pendência: 20668
Tela: Formula PARCANTEP
Descrição: Novo filtro no SQL da fórmula PARCANTEP
================================================================================
CM$VER      3.01.06d    18/10/2005
--------------------------------------------------------------------------------
Pendência: 19046
Tela: Formula SOMARUBRICA
Descrição: Novo parametro que indica se filtra ou não por patrocinadora
Pendência: 20458
Tela: Execução de Regra
Descrição: Retirar mensagem de erro caso não exista a variavel utilizada na
           regra e sim, gravar um LOG.
Pendência: 20166
Tela: Cadastro de Fórmulas
Descrição: Nova formula TOTALIZAITENSEP
================================================================================
CM$VER      3.01.06b    15/09/2005
--------------------------------------------------------------------------------
Pendência: -
Tela: -
Descrição: Retirada do controle de variaveis não criadas antes da utilização
================================================================================
CM$VER      3.01.06a    13/09/2005
--------------------------------------------------------------------------------
Pendência: 19900
Tela: Cadastro de Fórmulas
Descrição: Nova formula ULTDATAEVENTO
================================================================================
CM$VER      3.01.06     05/09/2005
--------------------------------------------------------------------------------
Liberação de versão no padrão 5.10.07.
================================================================================
CM$VER      3.01.05a    29/08/2005
--------------------------------------------------------------------------------
Pendência: 20005
Tela: Fórmulas (Componentes)
Descrição: Acertos na formula TEMPOFUNDACAO
================================================================================
CM$VER      3.01.04c    03/08/2005
--------------------------------------------------------------------------------
Pendência: 19896
Tela: Cadastro de Fórmulas
Descrição: Acerto na visualização das formulas de contagem de tempos
================================================================================
CM$VER      3.01.04b    02/08/2005
--------------------------------------------------------------------------------
Tela: Cadastro de Fórmulas
Descrição: Controle de Formula Publicada
================================================================================
CM$VER      3.01.04a    01/08/2005
--------------------------------------------------------------------------------
Tela: COMPONENTES
Descrição: Acerto na Formula TEMPOFUNDACAO
================================================================================
CM$VER      3.01.04     25/07/2005
--------------------------------------------------------------------------------
Tela: COMPONENTES
Descrição: Acerto na Formula PRO
================================================================================
CM$VER      3.01.03     22/07/2005
--------------------------------------------------------------------------------
Pendência: 19788 (AUGUSTO)
Tela: COMPONENTES
Descrição: Acerto na Formula VALORCF, Troca de IDFAIXASALEXT para DATAEFETIVACAO
================================================================================
CM$VER      3.01.01     03/06/2005
--------------------------------------------------------------------------------
Pendência: 18404 (AUGUSTO)
Tela: FORMULAS
Descrição: Em "comparar valores" no Regra,  ao utilizar "Em", se o nº passado for unitário
           e estiver na comparação pretendida, ele é considerado "True", quando deveria ser
           "False".
Pendência: 18430 (AUGUSTO)
Tela: FORMULAS
Descrição: Alterar formula VLRREFRUBMES para retirar o maior valor encontrado.
Pendência: 19141 (P.RAMOS)
Tela: FORMULA TEMPOFUNDACAO
Descrição: A fórmula TEMPOFUNDACAO não está levando em consideração o parametro
           de FLGCANCELAMENTO quando definido como "S".
================================================================================
CM$VER      3.00.99     13/09/2004
--------------------------------------------------------------------------------
Atualização de Fontes.
================================================================================
CM$VER      3.00.98     05/08/2004
--------------------------------------------------------------------------------
- Criação da fórmula POSSUIMIGRACAO.
================================================================================
CM$VER      3.00.97     22/07/2004
--------------------------------------------------------------------------------
Pendência 16740 - Fórmula MED
- Corrigido problema de cálculo da fórmula.
================================================================================
CM$VER      3.00.96     27/05/2004
--------------------------------------------------------------------------------
- Compatibilização da função VLRBENEFICIO nos fontes em 2 e 3 camadas.
================================================================================
CM$VER      3.00.95     28/04/2004
--------------------------------------------------------------------------------
Pendência 16333 - Fórmula VLRBENEFICIOTOTAL
- Criação de fórmula.
================================================================================
CM$VER      3.00.94     20/04/2004
--------------------------------------------------------------------------------
Alterações diversas.
================================================================================
CM$VER      3.00.93c    01/04/2004
--------------------------------------------------------------------------------
Alterações para compatibilização dos fontes em 2 e 3 camadas.
================================================================================
CM$VER      3.00.93b    13/02/2004
--------------------------------------------------------------------------------
Atualização de versões
================================================================================
CM$VER      3.00.93a    05/02/2004
--------------------------------------------------------------------------------
Correção de problema na atualização de versão.
================================================================================
CM$VER      3.00.93     08/01/2004
--------------------------------------------------------------------------------
- Resolução da Pendência 15879
 > Tela : Consulta | Relatórios | Gerenciais
 Criar um relatório que discrimine todas as regras que efetivamente estão associadas 
 a uma função no sistema, relacionado o número da regra, nome da regra e 
 o sistema que utiliza a regra.  
================================================================================
CM$VER      3.00.92     12/12/2003
--------------------------------------------------------------------------------
Pendência  : 15598 - 11.12.2003
FCadFormulaMT.pas - Help da OPPATRO: Alterado help da fórmula OPPATRO para contemplar a inclusão dos campos VALORBASE4, VALORBASE5 e VALORBASE6.
================================================================================
CM$VER      3.00.90     04/11/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 15464
  > Tela\Opçao No Sistema: CADASTROS/FÓRMULAS/SALÁRIOS E CONTRIBUIÇÕES/NP
  Permitir que sejam utilizadas mais de uma rubrica, como a fórmula PRO.
================================================================================
CM$VER      3.00.89     05/09/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14986
  > Tela\Opçao No Sistema: Importar regra
  Erro de constraint ao importar regra, quando usava fórmula já publicada.
================================================================================
CM$VER      3.00.88v    04/09/2003
--------------------------------------------------------------------------------
Atualização
================================================================================
CM$VER      3.00.87v    21/08/2003
--------------------------------------------------------------------------------
Atualização de Versão
================================================================================
CM$VER      3.00.86v    20/08/2003
--------------------------------------------------------------------------------
Acertos na Formula SOMARUBRICA 
================================================================================
CM$VER      3.00.85v    08/08/2003
--------------------------------------------------------------------------------
Alteraçoes no controle de IRRF
================================================================================
CM$VER      3.00.84v    06/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14784
  > Tela\Opçao No Sistema: Cadastro Regras/Botão fórmulas
  No cadastro de regras, o botão fórmulas traz as fórmulas repetidas mais de uma vez.
- Resolução da Pendência Nº 14653
  > Tela\Opçao No Sistema: Participantes/Eventos/Faleciemnto/Beneficio por Falecimento/Benefício
  Substituir no order by da query abaixo o campo H.DATAPAGAMENTO DESC por
H.DTEFETPGTO DESC
- Resolução da Pendência Nº 14002
  > Tela\Opçao No Sistema: Utilização de faixas de datas para tabela de alíquotas de IR
  Após conclusão da pendência 8533, passar alterar as formulas e funções do regra que utilizam a tabela de IR para utilizar as alíquotas de IR por faixa de data de vigência. 
- Resolução da Pendência Nº 14784
  > Tela\Opçao No Sistema: Cadastro Regras/Botão fórmulas
  No cadastro de regras, o botão fórmulas traz as fórmulas repetidas mais de uma vez.
- Resolução da Pendência Nº 14653
  > Tela\Opçao No Sistema: Participantes/Eventos/Faleciemnto/Beneficio por Falecimento/Benefício
  Substituir no order by da query abaixo o campo H.DATAPAGAMENTO DESC por
H.DTEFETPGTO DESC
- Resolução da Pendência Nº 14002
  > Tela\Opçao No Sistema: Utilização de faixas de datas para tabela de alíquotas de IR
  Após conclusão da pendência 8533, passar alterar as formulas e funções do regra que utilizam a tabela de IR para utilizar as alíquotas de IR por faixa de data de vigência. 
================================================================================
CM$VER      3.00.83v    06/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14784
  > Tela\Opçao No Sistema: Cadastro Regras/Botão fórmulas
  No cadastro de regras, o botão fórmulas traz as fórmulas repetidas mais de uma vez.
- Resolução da Pendência Nº 14653
  > Tela\Opçao No Sistema: Participantes/Eventos/Faleciemnto/Beneficio por Falecimento/Benefício
  Substituir no order by da query abaixo o campo H.DATAPAGAMENTO DESC por
H.DTEFETPGTO DESC
- Resolução da Pendência Nº 14002
  > Tela\Opçao No Sistema: Utilização de faixas de datas para tabela de alíquotas de IR
  Após conclusão da pendência 8533, passar alterar as formulas e funções do regra que utilizam a tabela de IR para utilizar as alíquotas de IR por faixa de data de vigência. 
================================================================================
CM$VER      3.00.82v    06/08/2003
--------------------------------------------------------------------------------
- Resolução da Pendência Nº 14784
  > Tela\Opçao No Sistema: Cadastro Regras/Botão fórmulas
  No cadastro de regras, o botão fórmulas traz as fórmulas repetidas mais de uma vez.
- Resolução da Pendência Nº 14653
  > Tela\Opçao No Sistema: Participantes/Eventos/Faleciemnto/Beneficio por Falecimento/Benefício
  Substituir no order by da query abaixo o campo H.DATAPAGAMENTO DESC por
H.DTEFETPGTO DESC
- Resolução da Pendência Nº 14002
  > Tela\Opçao No Sistema: Utilização de faixas de datas para tabela de alíquotas de IR
  Após conclusão da pendência 8533, passar alterar as formulas e funções do regra que utilizam a tabela de IR para utilizar as alíquotas de IR por faixa de data de vigência. 
- Resolução da Pendência Nº 14784
  > Tela\Opçao No Sistema: Cadastro Regras/Botão fórmulas
  No cadastro de regras, o botão fórmulas traz as fórmulas repetidas mais de uma vez.
- Resolução da Pendência Nº 14653
  > Tela\Opçao No Sistema: Participantes/Eventos/Faleciemnto/Beneficio por Falecimento/Benefício
  Substituir no order by da query abaixo o campo H.DATAPAGAMENTO DESC por
H.DTEFETPGTO DESC
- Resolução da Pendência Nº 14002
  > Tela\Opçao No Sistema: Utilização de faixas de datas para tabela de alíquotas de IR
  Após conclusão da pendência 8533, passar alterar as formulas e funções do regra que utilizam a tabela de IR para utilizar as alíquotas de IR por faixa de data de vigência. 
================================================================================
CM$VER      3.00.81v    06/08/2003
--------------------------------------------------------------------------------
Alterações na formula VLRBENEFICIO
Acertos no montaselect de formulas do cadastro de Regras 
- Resolução da Pendência Nº 14653
  > Tela\Opçao No Sistema: Participantes/Eventos/Faleciemnto/Beneficio por Falecimento/Benefício
  Substituir no order by da query abaixo o campo H.DATAPAGAMENTO DESC por
H.DTEFETPGTO DESC
- Resolução da Pendência Nº 14002
  > Tela\Opçao No Sistema: Utilização de faixas de datas para tabela de alíquotas de IR
  Após conclusão da pendência 8533, passar alterar as formulas e funções do regra que utilizam a tabela de IR para utilizar as alíquotas de IR por faixa de data de vigência. 
================================================================================
CM$VER      3.00.80v    05/08/2003
--------------------------------------------------------------------------------
Atualização
================================================================================
CM$VER      3.00.79v    25/07/2003
--------------------------------------------------------------------------------
acertos na formula PR2
acertos na formula  SOMARBRICA 
================================================================================
CM$VER      3.00.78v    23/07/2003
--------------------------------------------------------------------------------
Alterações na formula VLRBENEFICIO
================================================================================
CM$VER      3.00.77v    02/07/2003
--------------------------------------------------------------------------------
Novo Padrão
================================================================================
CM$VER      3.00.76v    25/06/2003
--------------------------------------------------------------------------------
Acerto no controle de acesso a Tipos de Regra 
================================================================================
CM$VER      3.00.75v    24/06/2003
--------------------------------------------------------------------------------
Acertos no cadastro de tables genericas
================================================================================
CM$VER      3.00.74v    16/06/2003
--------------------------------------------------------------------------------
Alterações no cadastro de TAbelas Genéricas novas
================================================================================
CM$VER      3.00.73v    10/06/2003
--------------------------------------------------------------------------------
Alterações nos componentes 
================================================================================
CM$VER      3.00.72v    09/06/2003
--------------------------------------------------------------------------------
Alterações no menu de opções  
================================================================================
CM$VER      3.00.71v    30/05/2003
--------------------------------------------------------------------------------
Atualização
================================================================================
CM$VER      3.00.70v    07/05/2003
--------------------------------------------------------------------------------
Liberação SADPREV
================================================================================
CM$VER      3.00.69v    06/05/2003
--------------------------------------------------------------------------------
Primeira liberação no padrão TotalPrev
================================================================================
CM$VER      3.00.68v    27/02/2003
--------------------------------------------------------------------------------
Alterações na Formula VLRRUBMES
================================================================================
CM$VER      3.00.67v    27/02/2003
--------------------------------------------------------------------------------
Alterações nos Componentes 
================================================================================
CM$VER      3.00.66v    17/02/2003
--------------------------------------------------------------------------------
Alteração na execução de Regras 3C;
  Controle local para consultas sem resultado
 
================================================================================
CM$VER      3.00.65v    13/02/2003
--------------------------------------------------------------------------------
Alteração no passo de Gravação de Calculo 
================================================================================
CM$VER      3.00.64v    12/02/2003
--------------------------------------------------------------------------------
Alterações na Formula SOMARUBRICA
================================================================================
CM$VER      3.00.63v    11/02/2003
--------------------------------------------------------------------------------
Nova Formula VLRREFRUBMES
================================================================================
CM$VER      3.00.62v    05/02/2003
--------------------------------------------------------------------------------
Acertos nos Componenets 
   Formula SOMARUBRICA
================================================================================
CM$VER      3.00.61v    21/01/2003
--------------------------------------------------------------------------------
Alterações nos componentes 
================================================================================
CM$VER      3.00.60v    07/01/2003
--------------------------------------------------------------------------------
Alterações nos Componentes
================================================================================
CM$VER      3.00.59v    07/01/2003
--------------------------------------------------------------------------------
Alterações nos Componentes
================================================================================
CM$VER      3.00.58v    27/12/2002
--------------------------------------------------------------------------------
alterações na Execução de Regras
================================================================================
CM$VER      3.00.57v    27/12/2002
--------------------------------------------------------------------------------
Alterações nos componentes
================================================================================
CM$VER      3.00.56v    20/12/2002
--------------------------------------------------------------------------------
acertos no log de ocorrencias
================================================================================
CM$VER      3.00.55v    19/12/2002
--------------------------------------------------------------------------------
Acertos no Log de ocorrencia.
================================================================================
CM$VER      3.00.54v    19/12/2002
--------------------------------------------------------------------------------
Alterações nos Componentes
================================================================================
CM$VER      3.00.53v    19/12/2002
--------------------------------------------------------------------------------
Alterações para suportar controle de ocorrencias.
================================================================================
CM$VER      3.00.52v    16/12/2002
--------------------------------------------------------------------------------
Acerto na cópia de regras.
================================================================================
CM$VER      3.00.51v    16/12/2002
--------------------------------------------------------------------------------
Inclusão das Novas pastas de fontes (3C) para compilação.
================================================================================
CM$VER      3.00.50v    13/12/2002
--------------------------------------------------------------------------------
Alterações nos Componentes
================================================================================
CM$VER      3.00.49v    10/12/2002
--------------------------------------------------------------------------------
Alteração no Cadastro do SAD
================================================================================
CM$VER      3.00.48v    09/12/2002
--------------------------------------------------------------------------------
Inclusão dos formulários 3 Camadas.
================================================================================
CM$VER      3.00.47v    05/12/2002
--------------------------------------------------------------------------------
Alterações nos Componentes
================================================================================
CM$VER      3.00.46v    04/12/2002
--------------------------------------------------------------------------------
Acerto no componente MT
================================================================================
CM$VER      3.00.45v    03/12/2002
--------------------------------------------------------------------------------
Acerto nos componentes,
opção para copias formulas
copia de formula publicada, gera copia não publicada
================================================================================
CM$VER      3.00.44v    28/11/2002
--------------------------------------------------------------------------------
Alterações nos componentes; 
   Nova formula SOMACONTRIB
   Acertos na formula SOMARUBRICA
   Alteração na formula ROUND
================================================================================
CM$VER      3.00.43v    21/11/2002
--------------------------------------------------------------------------------
Alterações nos Componentes 
================================================================================
CM$VER      3.00.42v    21/10/2002
--------------------------------------------------------------------------------
Alterações nos Componentes
================================================================================
CM$VER      3.00.41v    02/10/2002
--------------------------------------------------------------------------------
Retirada da Biblioteca 'ip50word_d5' 
================================================================================
CM$VER      3.00.40v    30/09/2002
--------------------------------------------------------------------------------
Alterações e ajustes 
================================================================================
CM$VER      3.00.39v    19/09/2002
--------------------------------------------------------------------------------
Alterações na na Imoprtação de Regras;
  Passos das Regras são excluidos de acordo com o nome das regras importadas
Alterações nos Componentes 
================================================================================
CM$VER      3.00.38v    10/09/2002
--------------------------------------------------------------------------------
Retirada da Unit uRegraMT
================================================================================
CM$VER      3.00.37v    10/09/2002
--------------------------------------------------------------------------------
Alterações no cadastro do Projeto 
================================================================================
CM$VER      3.00.36v    09/09/2002
--------------------------------------------------------------------------------
Acertos no componente 
================================================================================
CM$VER      3.00.35v    02/09/2002
--------------------------------------------------------------------------------
Acertos no Componente MT
================================================================================
CM$VER      3.00.34v    28/08/2002
--------------------------------------------------------------------------------
Acertos nos componentes de 3 Camadas.
Implementações nas Formulas de Data.
Nova Formula para Investimento 
Acerto no cadastro de campos
================================================================================
CM$VER      3.00.33v    23/08/2002
--------------------------------------------------------------------------------
Alterações Diversas
================================================================================
CM$VER      3.00.32v    09/05/2002
--------------------------------------------------------------------------------
Alterações no Componente Regra
================================================================================
CM$VER      3.00.31v    30/04/2002
--------------------------------------------------------------------------------
Alterações de compatibilidade com novo Padrão CM
================================================================================
CM$VER      3.00.30v    29/04/2002
--------------------------------------------------------------------------------
Importação de Regras:
  Caso o Identificador da Regra importada não exista na Base de Dados,
o Sistema utiliza o mesmo Identificador ao importar.
Cadastro de Regra:
  Acertos na manutenção nos flags dos valores constantes.
================================================================================
CM$VER      3.00.29v    15/03/2002
--------------------------------------------------------------------------------
Alteração da importação de Regras. Retirada das chaves nas cláusulas de "SET" 
dos "UPDATES" para melhora de performance.
================================================================================
CM$VER      3.00.29u    11/03/2002
--------------------------------------------------------------------------------
Correção de bug na função VERFUNCAOPCC.
================================================================================
CM$VER      3.00.29t    08/03/2002
--------------------------------------------------------------------------------
Alteração da função TEMPOFUNDACAO para considerar dias comercias
ao invés de dias corridos.
================================================================================
CM$VER      3.00.29s    05/02/2002
--------------------------------------------------------------------------------
Acertos no Componente
================================================================================
CM$VER      3.00.28s    01/02/2002
--------------------------------------------------------------------------------
Nova opção "Em" no tipo de passo Comparar Valores..
  Compara valor 1 com lista de valores 2 (separados por virgula e entre parenteses)
Ex:
       se SITPART Em (12,09,34) vai para o passo.....
Alterações no componente
================================================================================
CM$VER      3.00.27s    29/01/2002
--------------------------------------------------------------------------------
Aletrações no Componente
Inclusão do campo expressao formula no
grid do cadasto do regra
================================================================================
CM$VER      3.00.26s    14/01/2002
--------------------------------------------------------------------------------
3) Acerto na Formula EXISTECAMPO 
    (Reimplementada) 
4) Nova Formula VLRBENEFICIO
    (Vide Help)
================================================================================
CM$VER      3.00.25s    17/12/2001
--------------------------------------------------------------------------------
regra
================================================================================
CM$VER      3.00.24s    17/12/2001
--------------------------------------------------------------------------------
Acertos
================================================================================
CM$VER      3.00.23s    17/12/2001
--------------------------------------------------------------------------------
Acertos no Cadastro de Formulas 
================================================================================
CM$VER      3.00.22s    14/12/2001
--------------------------------------------------------------------------------
Acertos
================================================================================
CM$VER      3.00.21s    13/12/2001
--------------------------------------------------------------------------------
Acerto na Consulta de Formulas do Cadastro de Regras 
Inclusão das Formulas 
  SOMARUBRICAS      - Soma Grupo de Rubricas
  MEDIARUBRICAS    - Faz média de Grupo de Rubricas
  FERIADO                   - Verifica se uma data é feriado (CM)
Revisão do Controle de acesso as consultas de regra 
================================================================================
CM$VER      3.00.20s    14/11/2001
--------------------------------------------------------------------------------
Novas formulas;
  QTDMINUTOS 
  SOMARUBRICAS
  MEDIARUBRICA
  PARCANTEP
Acertos nas formulas de Evolucao funcional
Acertos no Componente 
================================================================================
CM$VER      3.00.19s    23/10/2001
--------------------------------------------------------------------------------
Alterações no Componente 
================================================================================
CM$VER      3.00.18s    10/10/2001
--------------------------------------------------------------------------------
Junção de Fontes
================================================================================
CM$VER      3.00.17s    09/10/2001
--------------------------------------------------------------------------------
Alteracoes no Componente 
================================================================================
CM$VER      3.00.16s    27/09/2001
--------------------------------------------------------------------------------
Acerto no cadastro de Regras;
    Tipo de passso, Gravar na memória de Calculo.
Acertos na Importação de Regras.
Remodelagem e inovações na Exportação de Regras;
   Interface foi toda remodelada e novas incorporações foram feitas a funcionalidade.
Acertos no componente.
  
================================================================================
CM$VER      3.00.15s    21/09/2001
--------------------------------------------------------------------------------
Alterações para suportar acesso ao BD DB2
Alterações na Exportação de Regras 
Alterações na Importação de Regras 
================================================================================
CM$VER      3.00.14s    13/09/2001
--------------------------------------------------------------------------------
Importação de Regras;
     1) Revisão do Leyout da Tela
     2) Opção para excluir os passos das regras existentes no banco, iguais as importadas.
          2.1) Na tela principal o CheckBox exclui de todas as regras que estão sendo 
                 importadas, na pasta Passos somente da que esta selecionada.
Cadastro de Formulas;
    1) Incluisão  de Novas Formulas (Camille)
Alterações no Componente.
================================================================================
CM$VER      3.00.13s    30/08/2001
--------------------------------------------------------------------------------
Acerto no Cadastro de tabelas Logas;
  Não estava incluindo registros  
Alteração no Cadastro de Formulas;
  Inclusão das Formulas DIASINICIAIS e DIASFINAIS na opção de Fórmulas de Datas 
================================================================================
CM$VER      3.00.12s    28/08/2001
--------------------------------------------------------------------------------
Acertos na exportação de Tabelas Genericas 
Alterações no Cadastro de Tipos de Regra, 
       não permite Mesmo Tipo de Regra para o Mesmo Grupo.
Alterações no Cadastro de Variaveis, 
        Formulario transformado em Cadastro com Grid .
================================================================================
CM$VER      3.00.11s    17/08/2001
--------------------------------------------------------------------------------
Acerto na importacao de tabelas Genericas...
================================================================================
CM$VER      3.00.10s    02/08/2001
--------------------------------------------------------------------------------
1) Alterações no Componente.
2) Acerto no cadastro de Regras;
           cadastro de regras com consultas auxiliares.
================================================================================
CM$VER      3.00.09s    13/07/2001
--------------------------------------------------------------------------------
Incorporação das Alterações  feitas pela Camille nos clientes,
no cadastro de Fomulas
================================================================================
CM$VER      3.00.08s    13/07/2001
--------------------------------------------------------------------------------
Alterações no Cadastro de Tabelas Genericas;
   - Opção para importar somente linhas a uma tabela existente.
   - Acertos no Componente Regra.
================================================================================
CM$VER      3.00.07s    10/07/2001
--------------------------------------------------------------------------------
Acertos na Compilacao 
================================================================================
CM$VER      3.00.06s    09/07/2001
--------------------------------------------------------------------------------
Acerto no Passo:  Resultado de Regra;
    Alterações na opção de Dados para Regra.
================================================================================
CM$VER      3.00.05s    29/05/2001
--------------------------------------------------------------------------------
Acertos na Formula NP
================================================================================
CM$VER      3.00.04s    24/05/2001
--------------------------------------------------------------------------------
Acertos no Componenete
================================================================================
CM$VER      3.00.03s    22/05/2001
--------------------------------------------------------------------------------
Novas Implementacoes Camille
================================================================================
CM$VER      3.00.02s    07/05/2001
--------------------------------------------------------------------------------
- Acerto no Tipo de Passo Gravar na Memoria de Calculo 
- Inclusao de Novas Formulas da Camille 
================================================================================
CM$VER      3.00.010    10/04/2001
--------------------------------------------------------------------------------
Acerto no Formulario de Execucao de Regras 
================================================================================
CM$VER      3.00.000    04/04/2001
--------------------------------------------------------------------------------
Projeto Delphi 5.0
================================================================================
CM$VER      2.02.99s    05/02/2001
--------------------------------------------------------------------------------
-Inclusao do Botao Cadastro de Formulas na Tela Principal
-Modificações no Componente 
================================================================================
CM$VER      2.02.98s    17/01/2001
--------------------------------------------------------------------------------
Acerto no Help da Formula CP
Modificações no Componente 
================================================================================
CM$VER      2.02.97s    12/01/2001
--------------------------------------------------------------------------------
Nova Formula;
  ReajustaINSS.
  feita pela Camille, na FUNCEF
================================================================================
CM$VER      2.02.96s    09/01/2001
--------------------------------------------------------------------------------
Alterações no componente
================================================================================
CM$VER      2.02.95s    08/01/2001
--------------------------------------------------------------------------------
Acerto no Cadastro de Campos.
================================================================================
CM$VER      2.02.94s    06/01/2001
--------------------------------------------------------------------------------
Formulario de Execucao de Regra 
  - Alteração do Componente de PopMenu, para incluir opçãoes de
    edição normais. (Copy, Paste e outros)
================================================================================
CM$VER      2.02.93s    05/01/2001
--------------------------------------------------------------------------------
Alterações no Componente Regra
================================================================================
CM$VER      2.02.92s    27/12/2000
--------------------------------------------------------------------------------
Acertos no Componente.
================================================================================
CM$VER      2.02.91s    26/12/2000
--------------------------------------------------------------------------------
Alterações no Componente 
================================================================================
CM$VER      2.02.90s    22/12/2000
--------------------------------------------------------------------------------
Acertos na formula NUMINSS
================================================================================
CM$VER      2.02.89s    18/12/2000
--------------------------------------------------------------------------------
  - Inclusão de opção para visualizar os passos da Regra
================================================================================
CM$VER      2.02.88s    11/12/2000
--------------------------------------------------------------------------------
Acertos finais e novas implementações na formula SBINSS
 - Foram incluidos novos parametros para:
   Posibilidade de gravação na memória de calculo
   Flag para ser gravado na memória de calculo
   Opcao de numero de casas para se computar o indice do INSS (FATOR)
 - Outros acertos
Acertos na formula PRO
 - Quando existiam duas rubricas iguais no mesmo mês a formula estava
   computando só uma, agora soma todas.
 - Outros acertos
Opção para gravar ou não os resultados de certas formulas na memoria de
calculo
 - Foi criado um novo Flag, FlgGravaCalculo (Booleano) para ser utilizado,
   nas formulas.
   Formula SBINSS, já implementada.
     Obs.: o Default é True (Grava Calculo)
Para facilitar as consultas feitas pelo regra ao banco de dados, foi incluido
no inicio de cada uma um campo "REGRA" com valor de 1.
  Ex.:
           SELECT
             1 AS REGRA, IDPESSOA
           FROM
             PESSOA
- Resolução da Pendência Nº 541
  > Tela\Opçao No Sistema: nova
  
- Resolução da Pendência Nº 542
  > Tela\Opçao No Sistema: 
  
- Resolução da Pendência Nº 580
  > Tela\Opçao No Sistema: Formulas 
  
- Resolução da Pendência Nº 1127
  > Tela\Opçao No Sistema: Cadastro de regras de negocio
- Resolução da Pendência Nº 1236
  > Tela\Opçao No Sistema: 
  
================================================================================
CM$VER      2.02.87s    29/11/2000
--------------------------------------------------------------------------------
LayOut do Formulario de Cadastro de Forumulas 
Componente (Acerto no acesso ao dicionario de Dados)
================================================================================
CM$VER      2.02.86s    29/11/2000
--------------------------------------------------------------------------------
- Alteraçoes no Componente Regra 
================================================================================
CM$VER      2.02.85s    21/11/2000
--------------------------------------------------------------------------------
Alterações no Componente Regra 
================================================================================
CM$VER      2.02.83     16/11/2000
--------------------------------------------------------------------------------
Alteração na Formula CONSULTA, retirado o comando UPPER das consultas a
tabela genérica .
================================================================================
CM$VER      2.02.82     13/11/2000
--------------------------------------------------------------------------------
Foram feitas varias alterações na interface dos formulários do Sistema.
Formulario de Execucao de Regras
  - Alterações no LayOut.
  - Preenchendo o Código da regra o Sistema busca os dados sem necessidade de
    se utilizar o MontaSelect.
  - Possibilidade de com o botão direito do mouse, guardar o SQL da regra que foi
    executada no Tipo de Regra , assim todas as outras regras do mesmo tipo poderão se
    se utilizar deste SQL.
Formulario de Execucao de Regras Passo A Passo
  - Alterações no LayOut.
  - Opcao para parar em um determinado passo da regra.
================================================================================
CM$VER      2.02.76     20/09/2000
--------------------------------------------------------------------------------
- Inclusão de um procedimento de alteração de formulas na tela de parametros do regra,
este procedimento corrige as formulas que foram cadastradas erradas antes ou bem
próximo a união com o atuarial (+ ou - no inicio do ano de 2000).
================================================================================
CM$VER      2.02.68     14/08/2000
--------------------------------------------------------------------------------
- Implementação de controle de acesso a regras cadastradas por grupos de regras.
- Criação das telas de cadastro de grupos de regras, e cadastro de controle de acesso.
- Implementação na tela de cadastro de tipos de regras, uma opção de escolha de grupos
  de regras.
================================================================================
CM$VER      2.02.63     17/07/2000
--------------------------------------------------------------------------------
Encontrado um problema na exportação de regras. Quando verificava se existia alguma
regra filha para uma regra principal só se registrava a primeira ocorrência de regra, e as
restantes eram ignoradas, e o problema já foi resolvido.
================================================================================
CM$VER      2.02.56     24/05/2000
--------------------------------------------------------------------------------
- Criação dos Relatórios de Regras, Fórmulas, Campos, Variáveis e Detalhes de regra.
================================================================================
CM$VER      2.02.120    06/03/2001
--------------------------------------------------------------------------------
Alterações diversas
================================================================================
CM$VER      2.02.110    08/02/2001
--------------------------------------------------------------------------------
Acertos no Componente
================================================================================
CM$VER      2.02.100s   07/02/2001
--------------------------------------------------------------------------------
Acerto no cadastro de regras
================================================================================
CM$ALT}
























































































































































































































































































































































