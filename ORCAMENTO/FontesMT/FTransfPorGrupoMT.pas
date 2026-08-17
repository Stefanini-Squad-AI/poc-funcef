{
//***************************************************************************************
Data      : 24/09/2014
Autor     : Thiago Melo
Sol       : 239565
PPM       : 519993
Rotina    : btBuscFornOrigemClick, btBuscFornDestinoClick
Descrição : Permitir transferencia entre contas inativas
--------------------------------------------------------------------------------------------------
//Rotina: btExcluirClick
//Nº SOL: 234860
//Nº PPM: 445467
//Data da Alteração: 14/07/2014
//Alteração Form: Não foi efetuada alteração de Form
//Responsável: Sadi Freire
//Descrição: Correção da reversão do saldo durante exclusão de transferencia de contas
--------------------------------------------------------------------------------------------------
Data      : 08/01/2014
Autor     : Edilaine Ferraresi
Sol       : 221865-15668
Kintana   : 2058524
Rotina    : VerificaRateioNx1, btIncluirClick, ValidaDados
Descrição : ajuste no funcionamento da transferencia N x 1
{-------------------------------------------------------------------------------------------------
Data      : 24/01/2014
Autor     : Marcio Sanches Spinosa SOL 224751 Kintana 2058281
Sol       : 224751
Kintana   : 2058281
Rotina    : Validação de Saldo mensal
Descrição : Retirada da validação de saldo mensal, pois atualmente, trabalha com saldo anual.
--------------------------------------------------------------------------------------------------
Data      : 18/11/2013
  Autor     : Marcio Sanches Spinosa SOL 219324 Kintana 2051326
Sol       : 219324
Kintana   : 2051326
Rotina    : VerificaRateioMesmoCentroCusto
Descrição : Ajuste no rateio conforme solicitado na funcef.
--------------------------------------------------------------------------------------------------
Data      : 29/10/2013
Autor     : Marcio Sanches Spinosa SOL 219322 Kintana 2051324
Sol       : 219322
Kintana   : 2051324
Rotina    : verificaSubDespesa
Descrição : Verifica se existe SubDespesa e caso sim, é obrigatorio a escolher.
--------------------------------------------------------------------------------------------------
Data      : 29/10/2013
Autor     : Marcio Sanches Spinosa SOL 219320 Kintana 2051323
Sol       : 219320
Kintana   : 2051323
Rotina    : Carregar Programa
Descrição : Ajuste para sempre carregar o combo programa quando selecionar um centro de custo.
--------------------------------------------------------------------------------------------------
Data      : 22/10/2013
Autor     : Marcio Sanches Spinosa SOL 217885 Kintana 2050643
Sol       : 217885
Kintana   : 2050643
Rotina    : CarregaComboOrigemDestino
Descrição : ajuste para evitar erros na efetuação do rateio.
--------------------------------------------------------------------------------------------------
Data      : 24/09/2013
Autor     : Marcio Sanches Spinosa SOL 217025 Kintana 2046511
Sol       : 217025
Kintana   : 2046511
Rotina    : calcularateiotransf2
Descrição : Ajuste realizado para efetuar o rateio de forma correta.
--------------------------------------------------------------------------------------------------
Data      : 19/07/2013
Autor     : Marcio Sanches Spinosa SOL 210745 Kintana 2030612
Sol       : 210745
Kintana   : 2030612
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : Ajuste no select para trazer dados corretos, estava duplicando e ajuste no filtro de
calculo do valor.
--------------------------------------------------------------------------------------------------
Rotina......: ValidaDados, msGrupoOrigem, msGrupoDestino, LimpaControles
Nº SOL......: 190311
Nº KINTANA..: 1799290
Data........: 15/04/2013
Responsável.: Edilaine Ferraresi
Descrição...: permitir transferencia entre grupos diferentes
--------------------------------------------------------------------------------------------------
Data      : 20/06/2013
Autor     : Thiago Melo
Sol       : 209723
Kintana   : 2023107
Rotina    : ListaContasParaTransf
Descrição : No grupo de origem, carregar somente o saldo que estiver diferente de 0.
---------------------------------------------------------------------------------------------------
Rotina    : *.DFM, FormCreate, btSelContasOrigemClick, btSelContasDestinoClick, CmeCadastroApplyInsert,
            CmeCadastroFind, CmeCadastroApplyDelete, tbsMontaTransfShow, MontaTransferencia, MontaSelectBeforeOpenCds
Data      : 08/05/2013
Autor     : Edilaine Ferraresi
Sol       : 190488
Kintana   : 1909246
Descrição : adequação do rateio e obritatoriedade de sub-despesa
{ --------------------------------------------------------------------------------------------------
Data      : 24/05/2013
Autor     : Marcio Sanches Spinosa SOL 206192 Kintana 1996858
Sol       : 206192
Kintana   : 1996858
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : Ajuste no modulo para efetuar a transferencia de valores entre contas para N selecionaveis
{ --------------------------------------------------------------------------------------------------
Data      : 15/01/2013
Autor     : Edilaine Ferraresi
Sol       : 172383-7762
Kintana   : 1556974
Rotina    : varias (uso do plano orçamentario selecionado no grupo)
Descrição : retirada do parametro PLANO ORÇAMENTARIO e MÁSCARA da parametrização do módulo
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 193146
Nº KINTANA..: 1940385
Data........: 19/02/2013
Responsável.: Rodrigo / Edilaine
Rotina......: CalculaTotalCampoCds, VerificaRestoRateio2, FiltraSelecionados, LimpaTransferencia,
              TransfereValor, FormCreate, btIncluirClick, btExcluirClick, ValidaDados, LimpaControles,
              bbtnConfirmarClick, CalculaTotalCampoCds, CalculaRateioTransf2, VerificaRestoRateio2
              MontaTransferencia;
Descrição...: ajustes para utilização correta da funcionalide
{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9361
Nº KINTANA..: 1653184
Data........: 05/06/2012
Responsável.: Vander Campos
Descrição...: Adequação da interface aos padrões de utilização da funcionalidade Especial
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasOrigemClick, btSelContasDestinoClick
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 27/12/2011
Responsável.: Edilaine Ferraresi
Descrição...: inclusao de novos parametros "Atividade Projeto", "Programa" e "Tipo de Despesa"

Rotina......: tbsOrigem, tbsDestino
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 26/12/2011
Responsável.: Edilaine Ferraresi
Descrição...: Inclusão dos campos "Atividade Projeto", "Programa" e "Tipo de Despesa" nas guias
              Grupo de Origem e Grupo de Destino

Rotina......: tbsMontaTransf
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 26/12/2011
Responsável.: Edilaine Ferraresi
Descrição...: na guia Montagem Transferência, separar as colunas do grid em duas guias, uma
              para Grupo de Origem e outra para Destino.

Rotina......: TrocaCampoGrid
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 03/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: efetua a troca de campos no grid em runtime.

Rotina......: pnlGridOrigemclick, pnlGridDestinoclick
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 11/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: filtra os dados que serão apresentados na tela conforme o painel selecionado.

Rotina......: MontaTransferencia, CalculaRateioTransfMontagem, GridMontagemUpdateFooter
Nº SOL......: 163908
Nº KINTANA..: 1403202
Data........: 11/01/2012
Responsável.: Edilaine Ferraresi
Descrição...: preenche client CDS com dados de conta de origem e destino separadamente.
----------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina......: Calcular_Rateio_Tranferencia,btIncluirClick
Nº SOL......: 153918
Nº KINTANA..: 1166699
Data........: 01/03/2011
Responsável.: Ricardo de Freitas Araujo
Descrição...: Ao realizar calculo de rateio, se tiver critério de rateio
              definido aplicar este ciretério.

Rotina......: btSelContasDestinoClick
Data........: 01/03/2011
Responsável.: Ricardo de Freitas Araujo
Descrição...: Acertar combobox de critério de rateio grupo\periodo definido na Entrada de
              Dados Especial.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroInsert
Nº SOL......: 153807
Nº KINTANA..: 1163275
Data........: 28/02/2011
Responsável.: Ricardo de Freitas Araujo
Descrição...: Alterado chamada do combobox de Periodo por causa do filtro anual

Rotina......: RetornarData
Data........: 28/02/2011
Responsável.: Ricardo de Freitas Araujo
Descrição...: Retornar data fomartada conforme periodo e exercicio.

Rotina......: btIncluirClick
Data........: 28/02/2011
Responsável.: Ricardo de Freitas Araujo
Descrição...: Ao realizar consulta entre contas de destino e origem apenas
aplica o filtro de pe´riodo nos casos de tranferência anual, quando não é informado
os centros de custas de destino e origem(transferir tudo).
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: CmeCadastroApplyDelete
Nº SOL......: 152922/4001
Nº KINTANA..: 1161267
Data........: 28/02/2011
Responsável.: Brunno Mattos
Descrição...: Alteração para exclusão do registro por completo e não apenas de uma linha do grid
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btExcluirClick
Nº SOL......: 152913
Nº KINTANA..: 1150429
Data........: 23/02/2011
Responsável.: Brunno Mattos
Descrição...: Alteração do campo procurado, alterado de SALDO para VLRORCADO.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btIncluirClick, ValidaDados, CalculaRateioTransf, CalculaTotalCampoCds
Nº SOL......: 152922
Nº KINTANA..: 1146873
Data........: 18/02/2011
Responsável.: Brunno Mattos
Descrição...: Alteração para permitir a transferência de todas as contas de um grupo para outra,
              de modo que o usuário não precise selecionar um a um.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 153170
Nº KINTANA..: 1150546
Data........: 18/02/2011
Responsável.: Brunno Mattos
Descrição...: No grid das contas de origem e destino foi trocado o campo que apresenta o saldo
              de VLRORCADO para SALDODISP.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: componente MontaSQL
Nº SOL......: 152915
Nº KINTANA..: 1146745
Data........: 17/02/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Na consulta do botão procurar, foi substituída por uma view
              VWPLAN_ORCAMEN_TRANFS_CONS por causa do agrupamento.
Rotina......: CmeCadastroFind,GridMontagemRowChanged,LimpaControles
Descrição...: Ao consultar dados, preenche controles corretamente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasOrigemClick
Nº SOL......: 152921
Nº KINTANA..: 1146742
Data........: 15/02/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Permissão de consultas de contas orçamentária por período anual
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasOrigemClick, btSelContasDestinoClick
Nº SOL......: 151660
Nº KINTANA..: 1115295
Data........: 27/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para trazer apenas os centros de custos ativos na inclusão
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: btSelContasOrigemClick, btSelContasDestinoClick
Nº SOL......: 151079
Nº KINTANA..: 1103455
Data........: 18/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Retirada a obrigatoriedade do plano de trabalho.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 150183
Nº KINTANA..: 1087556
Data........: 13/01/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para buscar o plano de trabalho após mudar o exercício.
---------------------------------------------------------------------------------------------------}
unit FTransfPorGrupoMT;
//==============================================================================
//  Data      : 02/01/2006
//  Autor     : Rodolpho da Silva
//  Pendência : 16461
//  Descrição : Criar tela para transferências de saldos por grupo de contas
//==============================================================================

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, wwdblook, CMDBLookupCombo, uCtrlTransacoesPorGrupo,
  uCtrlPadroes, uSistema, uCtrlPlanPrevContabPatro, uCtrlAlterorcamento, uMenserro,
  uModulo, TREdit, wwdbdatetimepicker, CMDateTimePicker, uDiasUteis, uCMMath,
  DBCtrls,uCtrlPlanPrevContabil, uCtrlPatro, uCtrlPeriodoOrcamen,
  uCtrlCadUsuxCResp, //VANDER SOL 172384/9361 KINTANA 1653184
  uCtrlBlqEntDados, DBGrids, wwQuery,uCMTypes, Gauges, DBTables;

type
  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  EMontagemTransferencia = Class(Exception);
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  TFrmTransfPorGrupoMT = class(TFrmCadastroMT)
    CdsPlanoOrigem: TCMClientDataSet;
    CdsPatroOrigem: TCMClientDataSet;
    CdsCCustoOrigem: TCMClientDataSet;
    CdsCResponOrigem: TCMClientDataSet;
    CdsContasOrigem: TCMClientDataSet;
    dsContasOrigem: TDataSource;
    dsContasDestino: TDataSource;
    CdsPatroDestino: TCMClientDataSet;
    CdsPlanoDestino: TCMClientDataSet;
    CdsCCustoDestino: TCMClientDataSet;
    CdsCResponDestino: TCMClientDataSet;
    CdsContasDestino: TCMClientDataSet;
    CdsContasTransfOrigem: TCMClientDataSet;
    CdsContasTransfDestino: TCMClientDataSet;
    ImageList: TImageList;
    CdsRatCriter: TCMClientDataSet;
    cdsAtivProjOrigem: TCMClientDataSet;
    cdsProgOrigem: TCMClientDataSet;
    cdsTipoDespOrigem: TCMClientDataSet;
    cdsAtivProjDestino: TCMClientDataSet;
    cdsProgDestino: TCMClientDataSet;
    cdsTipoDespDestino: TCMClientDataSet;
    cdsPlanoOrcOrigem: TCMClientDataSet;
    cdsPlanoOrcDestino: TCMClientDataSet;
    Panel1: TPanel;
    PageControl: TPageControl;
    tbsOrigem: TTabSheet;
    pnlOrigem: TPanel;
    Label1: TLabel;
    btBuscGrupoOrigem: TSpeedButton;
    Label4: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    lblFornecedoresSubDespesasOrigem: TLabel;
    btBuscFornOrigem: TSpeedButton;
    edtDescGrupoOrigem: TEdit;
    cboPatroOrigem: TCMDBLookupCombo;
    btSelContasOrigem: TBitBtn;
    edtExercicioOrigem: TDBRealEdit;
    cboPeriodoOrigem: TComboBox;
    cboTipoDespOrigem: TCMDBLookupCombo;
    cboAtivProjOrigem: TCMDBLookupCombo;
    cboProgOrigem: TCMDBLookupCombo;
    cboPlanoPrevidenciarioOrigem: TCMDBLookupCombo;
    edtFornecedoresSubDespesasOrigem: TEdit;
    cboPlanoOrcamentarioOrigem: TCMDBLookupCombo;
    Panel4: TPanel;
    pnlTotalContasOrigem: TPanel;
    GridOrigem: TwwDBGrid;
    tbsDestino: TTabSheet;
    pnlDestino: TPanel;
    Label7: TLabel;
    btBuscaGrupoDestino: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Label26: TLabel;
    lblPlanoOrcamentario: TLabel;
    lblCentroCusto: TLabel;
    lblFornecedoresSubDespesasDestino: TLabel;
    btBuscFornDestino: TSpeedButton;
    edtDescGrupoDestino: TEdit;
    cboPatroDestino: TCMDBLookupCombo;
    cboPlanoPrevidenciarioDestino: TCMDBLookupCombo;
    btSelContasDestino: TBitBtn;
    edtExercicioDestino: TDBRealEdit;
    cboPeriodoDestino: TComboBox;
    cboAtivProjDestino: TCMDBLookupCombo;
    cboProgDestino: TCMDBLookupCombo;
    cboTipoDespDestino: TCMDBLookupCombo;
    edtFornecedoresSubDespesasDestino: TEdit;
    cboPlanoOrcamentarioDestino: TCMDBLookupCombo;
    Panel6: TPanel;
    pnlTotalContasDestino: TPanel;
    GridDestino: TwwDBGrid;
    tbsMontaTransf: TTabSheet;
    pnlMontaTransf: TPanel;
    Label17: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    lblPeriodoOrigem: TLabel;
    Label16: TLabel;
    cboTransfContaOrigem: TwwDBLookupCombo;
    edtPerTransfOrigem: TDBRealEdit;
    edtExercTransfOrigem: TDBRealEdit;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    lblPeriodoDestino: TLabel;
    Label19: TLabel;
    cboTransfContaDestino: TwwDBLookupCombo;
    edtPerTransfDestino: TDBRealEdit;
    edtExercTransfDestino: TDBRealEdit;
    edtDataReferencia: TCMDateTimePicker;
    edtVlrSolicitado: TDBRealEdit;
    btIncluir: TBitBtn;
    btExcluir: TBitBtn;
    mmObs: TMemo;
    chkObs: TCheckBox;
    pnl_Bottom: TPanel;
    Label6: TLabel;
    gProgresso: TGauge;
    lblTransferencia: TLabel;
    cboRatCriter: TCMDBLookupCombo;
    pnlGrid: TPanel;
    Panel3: TPanel;
    GridMontagem: TwwDBGrid;
    Panel7: TPanel;
    pnlGridDestino: TPanel;
    pnlGridOrigem: TPanel;
    cboCentroCustoOrigem: TCMDBLookupCombo;
    cboCentroCustoDestino: TCMDBLookupCombo;
    msGrupoOrigem: TMontaSelect;
    msDespesaOrigem: TMontaSelect;
    msGrupoDestino: TMontaSelect;
    msDespesaDestino: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btBuscGrupoOrigemClick(Sender: TObject);
    procedure btBuscaGrupoDestinoClick(Sender: TObject);
    procedure btSelContasOrigemClick(Sender: TObject);
    procedure btSelContasDestinoClick(Sender: TObject);
    procedure CdsContasOrigemAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure GridOrigemUpdateFooter(Sender: TObject);
    procedure GridDestinoUpdateFooter(Sender: TObject);
    procedure cboTransfContaOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CdsNewRecord(DataSet: TDataSet);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure GridMontagemUpdateFooter(Sender: TObject);
    procedure cboTransfContaDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure GridOrigemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GridOrigemTopRowChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CdsContasDestinoAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbgrd1TitleClick(Column: TColumn);
    procedure GridMontagemRowChanged(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure pnlGridOrigemClick(Sender: TObject);
    procedure pnlGridDestinoClick(Sender: TObject);
    procedure btBuscFornOrigemClick(Sender: TObject);
    procedure btBuscFornDestinoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbsMontaTransfShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure cboCentroCustoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cboCentroCustoDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

  private
    { Private declarations }
    iIdPlanoOrcOri  : integer;   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    iIdPlanoOrcDest : integer;   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974

    iIdGrupoOrcOri : integer;
    iIdGrupoOrcDest : integer;

    aContaSelecionadaOrigem  : string;
    aContaSelecionadaDestino : string;



    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlAlterorcamento      : TCtrlAlterorcamento;
    CtrlPatro               : TCtrlPatro;
    CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
    CtrlPeriodoOrcamen      : TCtrlPeriodoOrcamen;
    CtrlBlqEntDados         : TCtrlBlqEntDados;
    TransfGridAtivo         : tTipoFiltro;  // Edilaine Ferraresi - SOL 163908 / KTN 1403202

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    ParamEntEsp_Origem  : TParamEntradaEspecial;
    ParamEntEsp_Destino : TParamEntradaEspecial;
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    Procedure SetGrupo(Var AParamEntEsp : TParamEntradaEspecial; AMsGrupo : TMontaSelect);
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
    procedure HabilitarPanels(bHabilita: boolean);
    function ValidaDados : Boolean;
    function CalculaRateioTransf : Double;
    procedure VerificaRestoRateio;
    function CalculaTotalCampoCds(cCds: TCMClientDataSet;
                                  Campo: String;
                                  const bFiltraSel : boolean = false;
                                  const pStrContaDestino : string = ''): Double; //Marcio Sanches Spinosa SOL 206192 Kintana 1996858 // Edilaine - SOL 193146 / KTN 1940385
    function RetornarData(iPeriodo:integer;Exercicio:string):TDateTime;
    procedure CalculaRateioTransf2(cCds : TCmClientDataSet;
                                  //rVlrDisponivelConta,
                                  rVlrSaldoAntigo,
                                  rVlrNovoSaldo : Double;
                                  sCampoParaAtualizar,
                                  sCampoPeriodo : String;
                                  isOrigem : Boolean = False;
                                  isDestino : Boolean = False;
                                  const pStrContaDestino : string = '');//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
    procedure CalculaRateioTransfMontagem(cCds,
                                         cCdsOrigem,
                                         cCdsDestino : TCMClientDataSet;
                                         //rVlrDisponivelConta,
                                         rVlrSaldoAntigo,
                                         rVlrNovoSaldo : Double;
                                         sCampoParaAtualizar,
                                         sCampoPeriodo : String;
                                         isOrigem : Boolean = False;
                                         isDestino : Boolean = False;
                                         Const pStrContaDestino : string = '');//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
    procedure VerificaRestoRateio2(CdsVerifica : TCMClientDataSet;
                                   rVlrAjustado : Double;
                                   sCampoParaAtualizar,
                                   sCampoPeriodo : String;
                                   bIsOrigem : boolean   // Edilaine - SOL 193146 / KTN 1940385
                                   );

    procedure CalculaRateioTransfUmparaUm(sCtaOrigem, sCtaDestino : string);  // Edilaine - SOL 193146 / KTN 1940385


    procedure MontaTransferencia;

    procedure AtivaFiltroDados(cCds : TCMClientDataSet; TipoDado : tTipoFiltro); // Edilaine Ferraresi - SOL 163908 / KTN 1403202
    procedure FiltraSelecionados(bFiltra : boolean);        // Edilaine - SOL 193146 / KTN 1940385
    procedure LimpaTransferencia(TipoDado : tTipoFiltro);   // Edilaine - SOL 193146 / KTN 1940385
    procedure TransfereValor(TipoDado : tTipoFiltro);       // Edilaine - SOL 193146 / KTN 1940385
    procedure AtualizaValoresCds;//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
    procedure VerificaRateioMesmoCentroCusto(oCdsOrigem, oCdsDestino : TCMClientDataSet);
    procedure CarregaComboOrigemDestino;
    function RateioLinearNparaN(cCds  : TCMClientDataSet;
                                 dValorRateio : Double;
                                 sCampoAtualizar   : string) : Boolean;
    procedure VerificaRateioNx1(oCds, oCdsOrigem : TCMClientDataSet);  // Edilaine - SOL 221865-15668 / KTN 2058524
    procedure LimparCds();
//    procedure LimparComboOrigemDestino;
  public
    { Public declarations }

    //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
    //Cds de apoio para rotina de rateio de valores com critério
    cdsTransfRateio_Aux: TClientDataSet;
    isRateioNparaN : Boolean;


    //Ricardo SOL 152915 KINTANA 1146745 - método que limap controles de tela
    procedure LimpaControles;

    procedure Calcular_Rateio_Tranferencia;

    // Edilaine Ferraresi - SOL 163908 / KTN 1403202
    procedure TrocaCampoGrid(var wwGrid : TwwDBGrid; OldCampo, NewCampo, NewLabel : String);
  end;

var
  FrmTransfPorGrupoMT: TFrmTransfPorGrupoMT;

implementation

{$R *.DFM}


Function TruncVal(Value:Real; Casas:Integer) : Real;
Var sValor:String;
    nPos:Integer;
begin
   //Transforma o valor em string
   sValor := FloatToStr(Value);

   //Verifica se possui pondo decimal
   nPos := Pos(DecimalSeparator,sValor);
   If ( nPos > 0 ) Then begin
      sValor := Copy(sValor,1,nPos+Casas);
   End;

   Result := StrToFloat(sValor);
end;


procedure TFrmTransfPorGrupoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
  CtrlTransacoesPorGrupo.InitializeAs(Padroes);
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);
  CtrlAlterorcamento      := TCtrlAlterorcamento.Create;
  CtrlAlterorcamento.InitializeAs(Padroes);
  CtrlPatro               := TCtrlPatro.Create;
  CtrlPatro.InitializeAs(Padroes);
  CtrlPlanPrevContabil    := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabil.InitializeAs(Padroes);
  CtrlPeriodoOrcamen      := TCtrlPeriodoOrcamen.Create;
  CtrlPeriodoOrcamen.InitializeAs(Padroes);
  CtrlBlqEntDados := TCtrlBlqEntDados.Create;
  CtrlBlqEntDados.InitializeAs(Padroes);

  TransfGridAtivo := tfOrigem;  // Edilaine Ferraresi - SOL 163908 / KTN 1403202

  CtrlAlterorcamento.CdsAlterorcamento := Cds;
  //Brunno Mattos SOL 154957  KTN 1193108 - Associa CdsOrigem e CdsDestino
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858 - Inicio
//  CtrlAlterorcamento.CdsOrigem  := CdsContasTransfOrigem;
//  CtrlAlterorcamento.CdsDestino := CdsContasTransfDestino;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858 - Fim
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - comentado e chamando o overload da funcao
  //Cds.Data                    := CtrlTransacoesPorGrupo.ListaTransfEfetuadas('01/01/1899',-1,-1);
  //Cds.Data                    := CtrlTransacoesPorGrupo.ListaTransfEfetuadas('01/01/1899','1899','1899',-1,-1, tcAmbas);  // Edilaine - SOL 190488 / KTN 1909246 - comentado
  Cds.Data                      := CtrlTransacoesPorGrupo.ListaTransfEfetuadas('01/01/1899', '-1', -1,-1,-1, tcAmbas);     // Edilaine - SOL 190488 / KTN 1909246 
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim


  // Dados origem
  //Brunno Mattos - KTN 1150546 - SOL 153170 - Ao inves de iniciar o cds com "ListaContasEntDados" mudei para "ListaContasParaTransf"
  CdsContasOrigem.Data        := CtrlTransacoesPorGrupo.ListaContasParaTransf(-1,-1,-1,-1,-1,-1);
  CdsContasTransfOrigem.Data  := CdsContasOrigem.Data;
  //CdsPlanoTrabOrigem.Data     := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario,Sistema.IdEmpresa,Date); // Alterado por FHBS - SOL: 150183 KTN: 1087556
  CdsCCustoOrigem.Data        := CtrlTransacoesPorGrupo.ListaTransfCCusto(Sistema.IdUsuario,Sistema.IdEmpresa);
  CdsCResponOrigem.Data       := CtrlTransacoesPorGrupo.ListaTransfCRespon(Sistema.IdUsuario);
  cboPeriodoOrigem.ItemIndex  := 1; // (DiasUteis.ExtraiMes(date) - 1);   // Edilaine - SOL 193146 / KTN 1940385
  edtExercicioOrigem.Text     := IntToStr(DiasUteis.ExtraiAno(date));
  CdsPlanoOrigem.Data         := CtrlTransacoesPorGrupo.ListaPlano;
  CdsPatroOrigem.Data         := CtrlTransacoesPorGrupo.ListaPatro;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  cdsTipoDespOrigem.Data      := CtrlTransacoesPorGrupo.ListaTipoDespesa;
  cdsProgOrigem.Data          := CtrlTransacoesPorGrupo.ListaPrograma;
  cdsAtivProjOrigem.Data      := CtrlTransacoesPorGrupo.ListaAtividadeProj;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202  -- fim

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  cdsPlanoOrcOrigem.Data  := CtrlTransacoesPorGrupo.ListaPlanoOrcamento('-1');
  CdsCCustoOrigem.Data    := CtrlTransacoesPorGrupo.ListaCentroCusto;
  cdsPlanoOrcDestino.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento('-1');
  CdsCCustoDestino.Data   := CtrlTransacoesPorGrupo.ListaCentroCusto;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  // Dados destino
  //Brunno Mattos - KTN 1150546 - SOL 153170 - Ao inves de iniciar o cds com "ListaContasEntDados" mudei para "ListaContasParaTransf"
  CdsContasDestino.Data       := CtrlTransacoesPorGrupo.ListaContasParaTransf(-1,-1,-1,-1,-1,-1);
  CdsContasTransfDestino.Data := CdsContasDestino.Data;
  //CdsPlanoTrabDestino.Data    := CdsPlanoTrabOrigem.Data; // Alterado por FHBS - SOL: 150183 KTN: 1087556
  CdsCCustoDestino.Data       := CdsCCustoOrigem.Data;
  CdsCResponDestino.Data      := CdsCResponOrigem.Data;
  cboPeriodoDestino.ItemIndex := 1;   // (DiasUteis.ExtraiMes(date) - 1);  // Edilaine - SOL 193146 / KTN 1940385
  edtExercicioDestino.Text    := IntToStr(DiasUteis.ExtraiAno(date));
  CdsPatroDestino.Data        := CdsPatroOrigem.Data;
  CdsPlanoDestino.Data        := CdsPlanoOrigem.Data;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  cdsTipoDespDestino.Data     := CtrlTransacoesPorGrupo.ListaTipoDespesa;
  cdsProgDestino.Data         := CtrlTransacoesPorGrupo.ListaPrograma;
  cdsAtivProjDestino.Data     := CtrlTransacoesPorGrupo.ListaAtividadeProj;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202  -- fim


  PageControl.ActivePageIndex := 0;
  //Ricardo Freitas SOL 153807 KINTANA 1163275
  edtDataReferencia.Date      := StrToDate(FormatDateTime('dd/mm/yyyy',Date));
  //Ricardo SOL 152915 KINTANA 1146745 - comentado MontaSelect.Filtro.Add('A.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  //Ricardo SOL 152915 KINTANA 1146745

  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - inicio
  {MontaSelect.Filtro.Add('VWPLAN_ORCAMEN_TRANFS_CONS.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  msGrupoOrigem.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  msGrupoDestino.Filtro.Add('G.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));
  } // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - fim

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  CdsRatCriter.Data    := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);
  cboRatCriter.Enabled := false;
  cdsTransfRateio_Aux  := TClientDataSet.Create(Application);

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  ParamEntEsp_Origem     := TParamEntradaEspecial.Create(TRUE);
  ParamEntEsp_Destino    := TParamEntradaEspecial.Create(TRUE);
  tbsMontaTransf.Enabled := False;
  isRateioNparaN         := False;

  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
end;

procedure TFrmTransfPorGrupoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlPlanPrevContabil);
  FreeAndNil(CtrlPatro);
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlTransacoesPorGrupo);
  FreeAndNil(CtrlAlterorcamento);
  FreeAndNil(CtrlPeriodoOrcamen);
  FreeAndNil(CtrlBlqEntDados);

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  CdsRatCriter.Close;
  cdsTransfRateio_Aux.Close;
  inherited;

end;




procedure TFrmTransfPorGrupoMT.btBuscGrupoOrigemClick(Sender: TObject);
begin
  inherited;
  msGrupoOrigem.Executar;
  if msGrupoOrigem.RetornouValor then
  Begin
    edtDescGrupoOrigem.Text := msGrupoOrigem.ValoresChave[2] + '-' + msGrupoOrigem.ValoresChave[1];

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    SetGrupo(ParamEntEsp_Origem, msGrupoOrigem);//Atribui as informações do Grupo

    cdsPlanoOrcOrigem.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( msGrupoOrigem.ValoresChave[2] );
    cboPlanoOrcamentarioOrigem.LookupValue := msGrupoOrigem.ValoresChave[3];
    if cdsPlanoOrcOrigem.FieldByName('ANO').AsString <> '' then
       edtExercicioOrigem.Text := cdsPlanoOrcOrigem.FieldByName('ANO').AsString;
    edtFornecedoresSubDespesasOrigem.text := '';
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrcOri := StrToIntDef(cboPlanoOrcamentarioOrigem.LookupValue, -1); // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    iIdGrupoOrcOri := StrToInt(msGrupoOrigem.ValoresChave[0]);
  End;

end;




procedure TFrmTransfPorGrupoMT.btBuscaGrupoDestinoClick(Sender: TObject);
begin
  inherited;
  msGrupoDestino.Executar;
  if msGrupoDestino.RetornouValor then
  Begin
    edtDescGrupoDestino.Text := msGrupoDestino.ValoresChave[2] + '-' + msGrupoDestino.ValoresChave[1];

    //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
    SetGrupo(ParamEntEsp_Destino, msGrupoDestino);//Atribui as informações do Grupo

    cdsPlanoOrcDestino.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( msGrupoDestino.ValoresChave[2] );
    cboPlanoOrcamentarioDestino.LookupValue := msGrupoDestino.ValoresChave[3];
    if cdsPlanoOrcDestino.FieldByName('ANO').AsString <> '' then
       edtExercicioDestino.Text := cdsPlanoOrcDestino.FieldByName('ANO').AsString;
    edtFornecedoresSubDespesasDestino.text := '';
    //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

    iIdPlanoOrcDest := StrToIntDef(cboPlanoOrcamentarioDestino.LookupValue, -1); // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
    iIdGrupoOrcDest := StrToInt(msGrupoDestino.ValoresChave[0]);
  End;
end;




procedure TFrmTransfPorGrupoMT.btSelContasOrigemClick(Sender: TObject);
var
  iPlano,iPatro,iUnidNegoc  : integer;
  iPrograma, iTipoDespesa   : integer;
  sCentCusto,sCodCentRespon : string;
begin
  inherited;
  if Trim(edtDescGrupoOrigem.Text) = '' then
  begin
     MsgDlg('Informe o grupo orçamentário!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  // Alterado por FHBS - SOL: 151079 KTN: 1103455
  //if Trim(cboPlanoTrabOrigem.Text) = '' then
  //begin
  //   MsgDlg('Informe um plano de trabalho!','Aviso',mtWarning,[mbOK],0);
  //   Exit;
  //end;

  if StrToInt(edtExercicioOrigem.Text) = 0 then
  begin
     MsgDlg('Informe o exercício!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
  iUnidNegoc     := 0;
  sCodCentRespon := '';
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  // Plano
  if Trim(cboPlanoPrevidenciarioOrigem.Text) <> '' then
     iPlano := StrToIntDef(cboPlanoPrevidenciarioOrigem.LookupValue,-1)
  else
     iPlano := -1;

  //Marcio Sanches Spinosa SOL 219322 Kintana 2051324 - Inicio
  if (edtFornecedoresSubDespesasOrigem.text = EmptyStr) then
  begin
    if CtrlTransacoesPorGrupo.verificaSubDespesa(iIdGrupoOrcOri) then
    begin
      MsgDlg('Esse lançamento deve ser realizado para um dos Fornecedor/Sub-despesa relacionado a este Grupo Orçamentário!','Aviso',mtWarning,[mbOk],0);
      Exit;
    end;
  end;
  //Marcio Sanches Spinosa SOL 219322 Kintana 2051324 - Fim
  
  // Patro
  if Trim(cboPatroOrigem.Text) <> '' then
     iPatro := StrToIntDef(cboPatroOrigem.LookupValue,-1)
  else
     iPatro := -1;


  if (iPlano <> -1) and (iPatro <> -1) then
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iPatro, iPlano) then begin
      MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
      exit;
  end;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202

  // --- Atividade
  if Trim(cboAtivProjOrigem.Text) <> '' then
     iUnidNegoc := StrToIntDef(cboAtivProjOrigem.LookupValue,-1);

  // --- Programa
  if Trim(cboProgOrigem.Text) <> '' then
     iPrograma := StrToIntDef(cboProgOrigem.LookupValue,-1)
  else
     iPrograma := -1;

  // --- Tipo despesa
  if Trim(cboTipoDespOrigem.Text) <> '' then
     iTipoDespesa := StrToIntDef(cboTipoDespOrigem.LookupValue,-1)
  else
     iTipoDespesa := -1;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
  {if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodoOrigem.ItemIndex + 1) + '/' +
                                            FloatToStr(edtExercicioOrigem.Value),
                                            Sistema.Idempresa) then}

  if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodoOrigem.ItemIndex) + '/' +
                                            FloatToStr(edtExercicioOrigem.Value),
                                            Sistema.Idempresa) then
  begin
     MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  //xxxxxx

  //xxxxxx

  //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
  {if not CtrlTransacoesPorGrupo.VerificaSaldoGrupo(StrToInt(msGrupoOrigem.ValoresChave[0]),
                                                   (cboPeriodoOrigem.ItemIndex + 1),
                                                    Trunc(edtExercicioOrigem.Value),
                                                    Sistema.IdEmpresa,
                                                    Modulo.iPlanoOrc) then}

//Marcio Sanches Spinosa SOL 224751 Kintana 2058281 - Inicio
//   if not CtrlTransacoesPorGrupo.VerificaSaldoGrupo(StrToInt(msGrupoOrigem.ValoresChave[0]),
//                                                      (cboPeriodoOrigem.ItemIndex),
//                                                       Trunc(edtExercicioOrigem.Value),
//                                                       Sistema.IdEmpresa,
//                                                       iIdPlanoOrcOri   {Modulo.iPlanoOrc}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
//                                                       ) then
//
//  begin
//     MsgDlg('Não há saldo lançado para este grupo orçamentário neste período/exercício','Aviso',mtWarning,[mbOk],0);
//     Exit;
//  end;
//Marcio Sanches Spinosa SOL 224751 Kintana 2058281 - Fim

  //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
  {CdsContasOrigem.Data :=  CtrlTransacoesPorGrupo.ListaContasParaTransf((cboPeriodoOrigem.ItemIndex + 1),
                                                                        Trunc(edtExercicioOrigem.Value),
                                                                        Sistema.IdEmpresa,
                                                                        Modulo.iPlanoOrc,
                                                                        StrToInt(msGrupoOrigem.ValoresChave[0]),
                                                                        Sistema.IdUsuario,
                                                                        iUnidNegoc,
                                                                        sCodCentRespon,
                                                                        iPlano,
                                                                        iPatro,
                                                                        True); } // Alterado por FHBS - SOL: 151660 KTN: 1115295
  { VANDER SOL 172384/9361 KINTANA 1653184 -> Try Finally adicionado para o uso de "ParamEntEsp" }
  ParamEntEsp_Origem.Clear(False);
  With ParamEntEsp_Origem.Parametros do
  Begin
    iIdPlanoOrc   := StrToIntDef(cboPlanoOrcamentarioOrigem.LookupValue, -1);
    sCodCCusto    := Trim(cboCentroCustoOrigem.LookupValue);
    //iIdSubDespesa := StrToIntDef(edtFornecedoresSubDespesas.Text,  -1);
    iIdSubDespesa := -1;                                                                        // Edilaine - SOL 190488 / KTN 1909246
    If (edtFornecedoresSubDespesasOrigem.Text <> '') and (msDespesaOrigem.RetornouValor) Then   // Edilaine - SOL 190488 / KTN 1909246
       iIdSubDespesa := StrToIntDef(msDespesaOrigem.ValoresChave[0],  -1);
  End;


  CdsContasOrigem.Data :=  CtrlTransacoesPorGrupo.ListaContasParaTransf((cboPeriodoOrigem.ItemIndex),
                                                                        Trunc(edtExercicioOrigem.Value),
                                                                        Sistema.IdEmpresa,
                                                                        iIdPlanoOrcOri, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                        StrToInt(msGrupoOrigem.ValoresChave[0]),
                                                                        Sistema.IdUsuario,
                                                                        iUnidNegoc,
                                                                        sCodCentRespon,
                                                                        iPlano,
                                                                        iPatro,
                                                                        iPrograma,    // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                                                        iTipoDespesa, // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                                                        True,
                                                                        ParamEntEsp_Origem   // VANDER SOL 172384/9361 KINTANA 1653184
                                                                        // Thiago Melo Sol 209723 Kintana 2023107
                                                                        ,0 // Define (se grupo de origem ou destino)
                                                                        // Thiago Melo Sol 209723 Kintana 2023107
                                                                        );
  //

  // Este Cds somente é usado no lookup, pois se for utilizado o original,
  //os campos que NÃO fazem parte do lookup somem do Grid
  CdsContasTransfOrigem.Data := CdsContasOrigem.Data;

  //Ricardo Freitas SOL 153807 KINTANA 1163275
  edtExercTransfOrigem.Value   := CdsContasTransfOrigem.FieldByName('EXERCICIO').AsInteger;

  // Edilaine - SOL 193146 / KTN 1940385
  if CdsContasTransfOrigem.filtered then
     FiltraSelecionados(false);

  // Toda vez em que o usuário selecionar um novo grupo de contas
  //é necessário limpar o Cds que contém as contas para transferências, pois
  //assim evita-se de pegar 2 grupos de origem diferentes, o que na verdade tem que ser
  //sempre 1.
  Cds.Cancel;
  Cds.EmptyDataSet;
end;




procedure TFrmTransfPorGrupoMT.btSelContasDestinoClick(Sender: TObject);
var
  iPlano,iPatro,iUnidNegoc  : integer;
  iPrograma, iTipoDespesa   : integer;
  sCentCusto,sCodCentRespon : string;
begin
  inherited;
  if Trim(edtDescGrupoDestino.Text) = '' then
  begin
     MsgDlg('Informe o grupo orçamentário!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;
  if StrToInt(edtExercicioDestino.Text) = 0 then
  begin
     MsgDlg('Informe o exercício!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  //Marcio Sanches Spinosa SOL 219322 Kintana 2051324 - Inicio
  if (edtFornecedoresSubDespesasDestino.text = EmptyStr) then
  begin
    if CtrlTransacoesPorGrupo.verificaSubDespesa(iIdGrupoOrcDest) then
    begin
      MsgDlg('Esse lançamento deve ser realizado para um dos Fornecedor/Sub-despesa relacionado a este Grupo Orçamentário!','Aviso',mtWarning,[mbOk],0);
      Exit;
    end;
  end;
  //Marcio Sanches Spinosa SOL 219322 Kintana 2051324 - Fim

  // Alterado por FHBS - SOL: 151079 KTN: 1103455
  //if Trim(cboPlanoTrabDestino.Text) = '' then
  //begin
  //   MsgDlg('Informe um plano de trabalho!','Aviso',mtWarning,[mbOK],0);
  //   Exit;
  //end;

  //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
  {if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodoDestino.ItemIndex + 1) + '/' +
                                            FloatToStr(edtExercicioDestino.Value),
                                            Sistema.Idempresa) then}

  //Ricardo de Freitas SOL 152921 KINTANA 1146742
  if not CtrlPeriodoOrcamen.PeriodoLiberado('1/' +
                                            IntToStr(cboPeriodoDestino.ItemIndex) + '/' +
                                            FloatToStr(edtExercicioDestino.Value),
                                            Sistema.Idempresa) then
  begin
     MsgDlg('Período BLOQUEADO para lançamentos e alterações!','Aviso',mtWarning,[mbOk],0);
     Exit;
  end;

  //INÍCIO - VANDER SOL 172384/9361 KINTANA 1653184
  iUnidNegoc     := 0;
  sCodCentRespon := '';
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  // Plano
  if Trim(cboPlanoPrevidenciarioDestino.Text) <> '' then
     iPlano := StrToIntDef(cboPlanoPrevidenciarioDestino.LookupValue,-1)
  else
     iPlano := -1;


  // Patro
  if Trim(cboPatroDestino.Text) <> '' then
     iPatro := StrToIntDef(cboPatroDestino.LookupValue,-1)
  else
     iPatro := -1;


  if (iPlano <> -1) and (iPatro <> -1) then
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro (iPatro, iPlano) then begin
      MsgDlg (CtrlPlanPrevContabPatro.MessageInfo, 'Relacionamento Inválido', mtWarning, [mbok], 0);
      exit;
    end;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202

  // --- Atividade
  if Trim(cboAtivProjDestino.Text) <> '' then
     iUnidNegoc := StrToIntDef(cboAtivProjDestino.LookupValue,-1);

  // --- Programa
  if Trim(cboProgDestino.Text) <> '' then
     iPrograma := StrToIntDef(cboProgDestino.LookupValue,-1)
  else
     iPrograma := -1;

  // --- Tipo despesa
  if Trim(cboTipoDespDestino.Text) <> '' then
     iTipoDespesa := StrToIntDef(cboTipoDespDestino.LookupValue,-1)
  else
     iTipoDespesa := -1;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim


  //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
  {CdsContasDestino.Data :=  CtrlTransacoesPorGrupo.ListaContasParaTransf((cboPeriodoDestino.ItemIndex + 1),
                                                                         Trunc(edtExercicioDestino.Value),
                                                                         Sistema.IdEmpresa,
                                                                         Modulo.iPlanoOrc,
                                                                         StrToInt(msGrupoDestino.ValoresChave[0]),
                                                                         Sistema.IdUsuario,
                                                                         iUnidNegoc,
                                                                         sCodCentRespon,
                                                                         iPlano,
                                                                         iPatro,
                                                                         True);} // Alterado por FHBS - SOL: 151660 KTN: 1115295
  { VANDER SOL 172384/9361 KINTANA 1653184 -> Try Finally adicionado para o uso de "ParamEntEsp" }
  ParamEntEsp_Destino.Clear(False);
  With ParamEntEsp_Destino.Parametros do
  Begin
    iIdPlanoOrc   := StrToIntDef(cboPlanoOrcamentarioDestino.LookupValue, -1);
    sCodCCusto    := Trim(cboCentroCustoDestino.LookupValue);
    //iIdSubDespesa := StrToIntDef(edtFornecedoresSubDespesas.Text,  -1);
    iIdSubDespesa := -1;                                                                          // Edilaine - SOL 190488 / KTN 1909246
    If (edtFornecedoresSubDespesasDestino.Text <> '') and (msDespesaDestino.RetornouValor) Then   // Edilaine - SOL 190488 / KTN 1909246
       iIdSubDespesa := StrToIntDef(msDespesaDestino.ValoresChave[0],  -1);
  End;
  //

  //Ricardo de Freitas SOL 152921 KINTANA 1146742 - comentado
  CdsContasDestino.Data :=  CtrlTransacoesPorGrupo.ListaContasParaTransf((cboPeriodoDestino.ItemIndex),
                                                                         Trunc(edtExercicioDestino.Value),
                                                                         Sistema.IdEmpresa,
                                                                         iIdPlanoOrcDest, {Modulo.iPlanoOrc,}  // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                         StrToInt(msGrupoDestino.ValoresChave[0]),
                                                                         Sistema.IdUsuario,
                                                                         iUnidNegoc,
                                                                         sCodCentRespon,
                                                                         iPlano,
                                                                         iPatro,
                                                                         iPrograma,    // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                                                         iTipoDespesa, // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                                                         True,
                                                                         ParamEntEsp_Destino   // VANDER SOL 172384/9361 KINTANA 1653184
                                                                         // Thiago Melo Sol 209723 Kintana 2023107
                                                                         ,1 // Define (se grupo de origem ou destino)
                                                                         // Thiago Melo Sol 209723 Kintana 2023107
                                                                         ); // Alterado por FHBS - SOL: 151660 KTN: 1115295





  // Este Cds somente é usado no lookup do combo cboTransfContaOrigem/Destino, pois se for utilizado o original,
  //os campos que NÃO fazem parte do lookup somem do Grid
  CdsContasTransfDestino.Data := CdsContasDestino.Data;

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  //Acerta combobox de critério de rateio conforme na Entrada de Dados
  if (CdsContasTransfDestino.RecordCount > 0) then
  begin
       cboRatCriter.LookupValue := FloatToStr(CtrlTransacoesPorGrupo.Retornar_IdCriterio_porGrupoPeriodo(Sistema.IdEmpresa,
                                                                                                    iIdPlanoOrcDest, {Modulo.iPlanoOrc,} // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
                                                                                                    CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').Asinteger,
                                                                                                    Trim(edtExercicioDestino.text),
                                                                                                    IntToStr(cboPeriodoDestino.itemIndex)));
  end;

  //Ricardo Freitas SOL 153807 KINTANA 1163275
  edtExercTransfDestino.Value   := CdsContasTransfDestino.FieldByName('EXERCICIO').AsInteger;

  // Edilaine - SOL 193146 / KTN 1940385
  if CdsContasTransfDestino.filtered then
     FiltraSelecionados(false);

  // Toda vez em que o usuário selecionar um novo grupo de contas
  //é necessário limpar o Cds que contém as contas para transferências, pois
  //assim evita-se de pegar 2 grupos de destino diferentes, o que na verdade tem que ser
  //sempre conforme o parâmetro.
  Cds.Cancel;
  Cds.EmptyDataSet;
end;




procedure TFrmTransfPorGrupoMT.CdsContasOrigemAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('SALDODISP')).DisplayFormat := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByName('VLRORCADO')).DisplayFormat := '#,##0.00;-#,##0.00';
  if DataSet.IsEmpty then
     pnlTotalContasOrigem.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s) de origem'
  else
     pnlTotalContasOrigem.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s) de origem para o grupo ' + DataSet.FieldByName('CODGRUPOORC').AsString + ' - ' + DataSet.FieldByName('NOMEGRUPOORCAMEN').AsString;
end;




procedure TFrmTransfPorGrupoMT.HabilitarPanels(bHabilita: boolean);
begin
   pnlOrigem.Enabled      := bHabilita;
   pnlDestino.Enabled     := bHabilita;
   pnlMontaTransf.Enabled := bHabilita;
end;

procedure TFrmTransfPorGrupoMT.CmeCadastroInsert(Sender: TObject);
begin
  // Edilaine - SOL 190311 / KTN 1799290
  if Modulo.sPermiteTransf = 'N' then
  begin
    MsgDlg('Não é possível fazer transferência entre grupos diferentes, conforme parâmetros do sistema!','Aviso',mtWarning,[mbOk],0);
    bbtnCancelarClick(bbtnCancelar);
  end;
  // Edilaine - SOL 190311 / KTN 1799290 - fim

  inherited;
  //Brunno Mattos SOL 154957  KTN 1193108 inclui brIncluir
  btIncluir.Enabled := True;

  //Ricardo Freitas SOL 153807 KINTANA 1163275 - comentado
  //Alterado por FHBS - SOL: 150183 KTN: 1087556
  {CdsPlanoTrabOrigem.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario,
                                                                   Sistema.IdEmpresa,
                                                                   StrToDate('01/'+FormatCurr('00', cboPeriodoOrigem.ItemIndex+1)+'/' + edtExercicioOrigem.Text));

  // Alterado por FHBS - SOL: 150183 KTN: 1087556
  CdsPlanoTrabDestino.Data := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario,
                                                                    Sistema.IdEmpresa,
                                                                    StrToDate('01/'+FormatCurr('00', cboPeriodoDestino.ItemIndex+1)+'/' + edtExercicioDestino.Text));}
  //Ricardo Freitas SOL 153807 KINTANA 1163275 - Fim

  HabilitarPanels(True);
  Cds.Cancel;

  CdsContasOrigem.EmptyDataSet;
  CdsContasDestino.EmptyDataSet;
  PageControl.ActivePageIndex := 0;

  //Ricardo SOL 152915 KINTANA 1146745
  LimpaControles;
end;


procedure TFrmTransfPorGrupoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  HabilitarPanels(False);
end;




procedure TFrmTransfPorGrupoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  //Brunno Mattos SOL 154957  KTN 1193108 inclui btInclui
  btIncluir.Enabled := True;
  LimpaControles;
  HabilitarPanels(False);
  Cds.EmptyDataSet;
  
  CdsContasOrigem.EmptyDataSet;
  CdsContasDestino.EmptyDataSet;
  CdsContasTransfOrigem.EmptyDataSet;
  CdsContasTransfDestino.EmptyDataSet;
end;




procedure TFrmTransfPorGrupoMT.btIncluirClick(Sender: TObject);
var
 rSaldoDisponivelOrigem,
 rSaldoDisponivelDestino,
 rVlrSolicitado,
 rNovoSaldoOrigem,
 rNovoSaldoDestino,
 rVlrBaseOrigem,
 rVlrBaseDestino          : Double;
 contaMes : Integer;
 sCtaOri, sCtaDest : string;   // Edilaine - SOL 193146 / KTN 1940385
begin
  inherited;


  if isRateioNparaN then
  begin
    ShowMessage('Uma inclusão não é permitida neste caso. Uma nova transferência será necessário!');
    Exit;
  end;
  //Validação de Dados
  if ValidaDados() then
  begin

   //Marcio Sanches Spinosa SOL 206192 Kintana 1996858 - Inicio
    if (cboTransfContaOrigem.LookupValue <> EmptyStr) then
    sCtaOri  := CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString; //cboTransfContaOrigem.LookupValue;    // Edilaine - SOL 193146 / KTN 1940385

    if (cboTransfContaDestino.LookupValue <> EmptyStr) then
    sCtaDest := CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString;       //cboTransfContaDestino.LookupValue;   // Edilaine - SOL 193146 / KTN 1940385
   //Marcio Sanches Spinosa SOL 206192 Kintana 1996858 - Fim
      //Brunno Mattos SOL 154957  KTN 1193108 Inicio
     //  btIncluir.Enabled := False;

      //Preenhe grid de montagem da transferência
      MontaTransferencia;

      // Edilaine  - SOL 221865-15668 / KTN 2058524
      if (cboTransfContaDestino.LookupValue = EmptyStr) and (CdsContasTransfDestino.RecordCount > 1) then
         VerificaRateioMesmoCentroCusto(CdsContasTransfDestino, cds)//Marcio Sanches Spinosa SOL 219324 Kintana 2051326
      else
         VerificaRateioNx1(Cds, CdsContasTransfOrigem);
      // Edilaine  - SOL 221865-15668 / KTN 2058524 - fim

//      VerificaRateioMesmoCentroCusto(Cds, Cds);
      // Edilaine - SOL 193146 / KTN 1940385
      FiltraSelecionados(true);

      rSaldoDisponivelOrigem      := CalculaTotalCampoCds(CdsContasTransfOrigem, 'SALDODISP', true);
      rSaldoDisponivelDestino     := CalculaTotalCampoCds(CdsContasTransfDestino,'SALDODISP', true);
      //rVlrBaseOrigem armazena o valor de dotação efetuado em entrado de dados, o qual não é alterado
      rVlrBaseOrigem              := CalculaTotalCampoCds(CdsContasTransfOrigem, 'VLRORCADO', true);
      rVlrBaseDestino             := CalculaTotalCampoCds(CdsContasTransfDestino, 'VLRORCADO', true, sCtaDest);//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
      rVlrSolicitado              := edtVlrSolicitado.Value;

      rNovoSaldoOrigem            := rSaldoDisponivelOrigem  - rVlrSolicitado;
      rNovoSaldoDestino           := rSaldoDisponivelDestino + rVlrSolicitado;


      // Edilaine - SOL 193146 / KTN 1940385
      if (cboTransfContaOrigem.Text <> '') and (cboTransfContaDestino.Text <> '') then
         CalculaRateioTransfUmparaUm(sCtaOri, sCtaDest)
      else
      begin

        //Atualizar valores Grupo de Origem
          CalculaRateioTransf2(CdsContasTransfOrigem,
                               rVlrBaseOrigem,//rSaldoDisponivelOrigem,
                               rNovoSaldoOrigem,
                               'VLRORCADO',
                               'PERIODO',
                               True);


        //Atualizar valores Grupo de Destino
        if (cboTransfContaOrigem.Text = '') and (cboTransfContaDestino.Text <> '') then   //Marcio Sanches Spinosa SOL 219324 Kintana 2051326
         CalculaRateioTransf2(CdsContasTransfDestino,
                             rVlrBaseDestino,//rSaldoDisponivelDestino,
                             rNovoSaldoDestino,
                             'VLRORCADO',
                             'PERIODO',
                             False,
                             True,
                             sCtaDest)//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
         else
         begin
           //Marcio Sanches Spinosa SOL 219324 Kintana 2051326 - Inicio
          if not RateioLinearNparaN(CdsContasTransfDestino,
                              rVlrSolicitado,
                             'VLRSOLICITADO') then
                Exit;
           //Marcio Sanches Spinosa SOL 219324 Kintana 2051326 - Fim
         end;

        //Rateio valor solicitado para as contas da montagem
        CalculaRateioTransfMontagem(Cds,
                                    CdsContasTransfOrigem,
                                    CdsContasTransfDestino,
                                    rVlrSolicitado,
                                    rNovoSaldoDestino,//XXXXX //rVlrBaseDestino,//rSaldoDisponivelDestino,
                                    'VLRSOLICITADO',
                                    'PERIODODESTINO',
                                    False,   // Edilaine Ferraresi - SOL 163908 / KTN 1403202
                                    True,
                                    sCtaDest);//Marcio Sanches Spinosa SOL 206192 Kintana 1996858

        // Edilaine Ferraresi - SOL 163908 / KTN 1403202
        CalculaRateioTransfMontagem(Cds,
                                    CdsContasTransfOrigem,
                                    CdsContasTransfDestino,
                                    rVlrBaseOrigem,//rSaldoDisponivelDestino,
                                    rVlrSolicitado,
                                    'VLRSOLICITADO',
                                    'PERIODOORIGEM',
                                    True,
                                    False);
        // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

     // end;
      //Brunno Mattos SOL 154957  KTN 1193108 Fim
    end;

    FiltraSelecionados(false);  // Edilaine - SOL 193146 / KTN 1940385


    // Edilaine Ferraresi - SOL 163908 / KTN 1403202
    // filtrando os dados que devem ser apresentados
    if TransfGridAtivo = tfOrigem then
       pnlGridOrigemClick(pnlGridOrigem)
    else
       pnlGridDestinoClick(pnlGridDestino);
    // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim


     if not chkObs.Checked then
        mmObs.Lines.Clear;
     cboTransfContaOrigem.SetFocus;

//    Marcio Sanches Spinosa SOL 217885 Kintana 2050643 - Inicio

      CarregaComboOrigemDestino;

//     Marcio Sanches Spinosa SOL 217885 Kintana 2050643 - Fim
  end;
end;




procedure TFrmTransfPorGrupoMT.btExcluirClick(Sender: TObject);
begin

   //Inicio - Sadi - SOL 234860 - PPM  445467
   //Descomentando bloco abaixo, corrigindo regresso do saldo em exclusão da transferência.
   //Ação efetuada antes através do código da linha abaixo:
   // inherited;
   if not Cds.IsEmpty then
  begin
     // Repõe o valor retirado da conta de origem
     TransfereValor( TransfGridAtivo );    // Edilaine - SOL 193146 / KTN 1940385

      // Edilaine - SOL 193146 / KTN 1940385 - comentado
     if CdsContasTransfOrigem.Locate('IDCONTAORCAMEN',Cds.FieldByName('IDCONTAORIGEM').AsString,[]) then
     begin
        CdsContasTransfOrigem.Edit;
        //Brunno Mattos - KTN 1150429 - SOL 152913 troquei "CdsContasTransfOrigem.FieldByName('SALDO').AsFloat" por "CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat"
        CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat := CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat + Cds.FieldByName('VLRSOLICITADO').AsFloat;
        CdsContasTransfOrigem.Post;
     end;

     // Retira o valor inserido na conta de destino
     if CdsContasTransfDestino.Locate('IDCONTAORCAMEN',Cds.FieldByName('IDCONTADESTINO').AsString,[]) then
     begin
        CdsContasTransfDestino.Edit;
        //Brunno Mattos - KTN 1150429 - SOL 152913 troquei "CdsContasTransfOrigem.FieldByName('SALDO').AsFloat" por "CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat"
        CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat := CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat - Cds.FieldByName('VLRSOLICITADO').AsFloat;
        CdsContasTransfDestino.Post;
     end;
       // Edilaine - SOL 193146 / KTN 1940385 - fim  }

     // Deleta o registro
    Cds.Delete;

     // Edilaine - SOL 193146 / KTN 1940385
     if cds.IsEmpty then
     begin
       if TransfGridAtivo = tfDestino then
          LimpaTransferencia(tfOrigem)
       else
          LimpaTransferencia(tfDestino);


     end;
     // Edilaine - SOL 193146 / KTN 1940385 - fim
  end;
   Cds.EmptyDataSet;
   CdsContasTransfOrigem.EmptyDataSet;
   CdsContasTransfDestino.EmptyDataSet;
   CdsContasTransfOrigem.Data  := CdsContasOrigem.Data;
   CdsContasTransfDestino.Data := CdsContasDestino.Data;
   isRateioNparaN := false;
  LimparCds;
  pnlGridDestinoClick(Sender);
  ////Termino - Sadi - SOL 234860 - PPM  445467

end;




procedure TFrmTransfPorGrupoMT.GridOrigemUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rTotal: Double;
begin
  inherited;
  try
     CdsAux      := TCMClientDataSet.Create(nil);
     CdsAux.Data := CdsContasOrigem.Data;
     rTotal      := 0;

     while not CdsAux.Eof do
     begin
        rTotal := rTotal + CdsAux.FieldByName('SALDODISP').AsFloat;
        CdsAux.Next;
     end;

     GridOrigem.ColumnByName('SALDODISP').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotal);
  finally
     FreeAndNil(CdsAux);
  end;
end;




procedure TFrmTransfPorGrupoMT.GridDestinoUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rTotal: Double;
begin
  inherited;
  try
     CdsAux      := TCMClientDataSet.Create(nil);
     CdsAux.Data := CdsContasDestino.Data;
     rTotal      := 0;

     while not CdsAux.Eof do
     begin
        rTotal := rTotal + CdsAux.FieldByName('SALDODISP').AsFloat;
        CdsAux.Next;
     end;

     GridDestino.ColumnByName('SALDODISP').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotal);
  finally
     FreeAndNil(CdsAux);
  end;
end;




procedure TFrmTransfPorGrupoMT.cboTransfContaOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  //Ricardo Freitas SOL 153807 KINTANA 1163275
  if Trim(cboTransfContaOrigem.Text) <> '' then
  begin
       edtPerTransfOrigem.Visible   := true;
//  edtPerTransfOrigem.Value   := CdsContasTransfOrigem.FieldByName('PERIODO').AsInteger;
    edtPerTransfOrigem.Value   := cboPeriodoOrigem.ItemIndex;
    aContaSelecionadaOrigem := cboTransfContaOrigem.LookupValue;
  end
  else
  begin
       edtPerTransfOrigem.Visible   := false;
       edtPerTransfOrigem.Clear;
  end;

  lblPeriodoOrigem.Visible     := edtPerTransfOrigem.Visible;
  edtExercTransfOrigem.Value := CdsContasTransfOrigem.FieldByName('EXERCICIO').AsInteger;
  //Ricardo Freitas SOL 153807 KINTANA - FIM
end;


procedure TFrmTransfPorGrupoMT.CdsNewRecord(DataSet: TDataSet);
begin
  inherited;
  Cds.FieldByName('DATAREFERENCIA').AsDateTime := Date;

end;

procedure TFrmTransfPorGrupoMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VLRSOLICITADO')).DisplayFormat := '#,##0.00;-#,##0.00';
end;




procedure TFrmTransfPorGrupoMT.GridMontagemUpdateFooter(Sender: TObject);
var
   CdsAux: TClientDataSet;
   rTotal: Double;
begin
  inherited;
  try
     CdsAux      := TCMClientDataSet.Create(nil);
     CdsAux.Data := Cds.Data;
     rTotal      := 0;

     while not CdsAux.Eof do
     begin
        // Edilaine Ferraresi - SOL 163908 / KTN 1403202
        if (TransfGridAtivo = tfOrigem) and (CdsAux.FieldByName('FLGTIPOCONTA').AsString = 'O') then
           rTotal := rTotal + CdsAux.FieldByName('VLRSOLICITADO').AsFloat
        else if (TransfGridAtivo = tfDestino) and (CdsAux.FieldByName('FLGTIPOCONTA').AsString = 'D') then
           rTotal := rTotal + CdsAux.FieldByName('VLRSOLICITADO').AsFloat
        else if TransfGridAtivo = tfNone then     // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim
           rTotal := rTotal + CdsAux.FieldByName('VLRSOLICITADO').AsFloat;

        CdsAux.Next;
     end;

     GridMontagem.ColumnByName('VLRSOLICITADO').FooterValue := FormatFloat('#,##0.00;-#,##0.00',rTotal);
  finally
     FreeAndNil(CdsAux);
  end;
end;



function TFrmTransfPorGrupoMT.ValidaDados : Boolean;
var
   rSaldoCta : currency;   // Edilaine - SOL 193146 / KTN 1940385
begin
   Result := false;
   if CdsContasTransfOrigem.IsEmpty then
   begin
        MsgDlg('Informe o grupo de origem!','Aviso',mtWarning,[mbOk],0);
        Exit;
   end;

   if CdsContasTransfDestino.IsEmpty then
   begin
        MsgDlg('Informe o grupo de origem!','Aviso',mtWarning,[mbOk],0);
        Exit;
   end;

   //Ricardo Freitas SOL 153807 KINTANA 1163275
   if (edtVlrSolicitado.Value = 0) or (Trim(edtVlrSolicitado.Text) = '') then
   begin
      MsgDlg('Informe o valor da transferência!','Aviso',mtWarning,[mbOk],0);
      if edtVlrSolicitado.CanFocus then
         edtVlrSolicitado.SetFocus;
      Exit;
   end;
   //Ricardo Freitas SOL 153807 KINTANA 1163275 - FIM


   // Edilaine - SOL 193146 / KTN 1940385
   if Trim(cboTransfContaOrigem.Text) = '' then
      rSaldoCta := CalculaTotalCampoCds(CdsContasTransfOrigem,'SALDODISP')
   else
      rSaldoCta := CdsContasTransfOrigem.FieldByName('SALDODISP').AsCurrency;
   rSaldoCta := RoundCM(rSaldoCta,2);
   // Edilaine - SOL 193146 / KTN 1940385 - fim


   //if (edtVlrSolicitado.Value > RoundCM(CdsContasTransfOrigem.FieldByName('SALDODISP').AsFloat,2)) then   // rodrigo
//   if (edtVlrSolicitado.Value > rSaldoCta) then                                                             // rodrigo
//   begin
//      MsgDlg('Não há saldo suficiente na conta de origem!' + #13 +
//             'Valor solicitado: ' + FormatFloat('#,##0.00;-#,##0.00',edtVlrSolicitado.Value) + #13 +
//             'Saldo disponível: ' + FormatFloat('#,##0.00;-#,##0.00',rSaldoCta),'Aviso',mtError,[mbOk],0);    // rodrigo
//
//      Exit;
//   end;


   //Brunno Mattos SOL 154957  KTN 1193108 exclui if not
   //Brunno Mattos - KTN 1146873 - SOL 152922  iclui if not ((Trim(cboTransfContaOrigem.Text) = '') AND (Trim(cboTransfContaDestino.Text) = '')) then e else
   //if CdsContasTransfOrigem.RecordCount = CdsContasTransfDestino.RecordCount then
   //begin
   if ({not}((Trim(cboTransfContaOrigem.Value) <> '') AND (Trim(cboTransfContaDestino.Value) <> ''))) or  // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524
      ((CdsContasTransfOrigem.RecordCount = 1) and (CdsContasTransfDestino.RecordCount = 1)) then         // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524
   begin

     { // Edilaine - SOL 193146 / KTN 1940385 - comentado
     if Trim(cboTransfContaOrigem.Text) = '' then
     begin
        MsgDlg('Informe a conta de origem!','Aviso',mtWarning,[mbOk],0);
        Exit;
     end;

     if Trim(cboTransfContaDestino.Text) = '' then
     begin
        MsgDlg('Informe a conta de destino!','Aviso',mtWarning,[mbOk],0);
        Exit;
     end;

     // Não permite cadastrar a transferência se o valor solicitado for maior que o saldo do período
     //if (edtVlrSolicitado.Value > RoundCM(CdsContasTransfOrigem.FieldByName('SALDODISP').AsFloat,2)) then   // rodrigo
     if (edtVlrSolicitado.Value > rSaldoCta) then                                                             // rodrigo
     begin
        MsgDlg('Não há saldo suficiente na conta de origem!' + #13 +
               'Valor solicitado: ' + FormatFloat('#,##0.00;-#,##0.00',edtVlrSolicitado.Value) + #13 +
               'Saldo disponível: ' + FormatFloat('#,##0.00;-#,##0.00',rSaldoCta),'Aviso',mtError,[mbOk],0);    // rodrigo

        Exit;
     end;
     } // Edilaine - SOL 193146 / KTN 1940385 - fim

     //Brunno Mattos - KTN 1146873 - SOL 152922
//     if ((cboTransfContaOrigem.LookupValue = cboTransfContaDestino.LookupValue) and
//         (edtPerTransfOrigem.Value = edtPerTransfDestino.Value)) then
//     begin
//        MsgDlg('Não é possível efetuar uma transferência para uma mesma conta entre' + #13 +
//               'período/exercício iguais.','Aviso',mtWarning,[mbOk],0);
//        Exit;
//     end;

      // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524
      if (CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString = CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString) and
         (ParamEntEsp_Origem.Parametros.iIdSubDespesa = ParamEntEsp_Destino.Parametros.iIdSubDespesa) then
      begin
        MsgDlg('A conta destino não pode receber rateio, devido a mesma estar presente na origem!','Aviso',mtWarning,[mbOk],0);
        Exit;
      end;
      // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524 - fim
   end;

   //if (edtVlrSolicitado.Value > CalculaTotalCampoCds(CdsContasTransfOrigem, 'SALDODISP')) then   // // Edilaine - SOL 193146 / KTN 1940385 - comentado
   if (RoundCM(edtVlrSolicitado.Value,2) > rSaldoCta) then     // Edilaine - SOL 193146 / KTN 1940385
   begin
        MsgDlg('Não há saldo suficiente na conta de origem!' + #13 +
               'Valor solicitado: ' + FormatFloat('#,##0.00;-#,##0.00',edtVlrSolicitado.Value) + #13 +
               'Saldo disponível: ' + FormatFloat('#,##0.00;-#,##0.00',rSaldoCta),'Aviso',mtError,[mbOk],0);

        Exit;
   end;

   // Edilaine - SOL 190311 / KTN 1799290 - alteração da regra permitindo transferência entre grupos diferentes
   //a transferencia so pode acontecer se as contas de origem e destino forem do mesmo grupo
   //Brunno Mattos - KTN 1146873 - SOL 152922
   {if (Copy(Trim(msGrupoOrigem.ValoresChave[2]),1,1) <> Copy(Trim(msGrupoDestino.ValoresChave[2]),1,1)) then
   begin
        MsgDlg('Não é possível efetuar transferência entre grupos de categorias diferentes!','Aviso',mtWarning,[mbOk],0);
        Exit;
   end;}

   if (edtExercTransfOrigem.Value <> edtExercTransfDestino.Value) then
   begin
      MsgDlg('Não é possível realizar transferências entre exercícios diferentes!','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;
   
   if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                           StrToIntDef(edtPerTransfDestino.text,0),
                                           StrToIntDef(edtExercTransfDestino.Text,0)) then
   begin
      MsgDlg(CtrlBlqEntDados.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   // Edilaine - SOL 190311 / KTN 1799290 - comentado tratado no evento  tbsMontaTransfShow
   // Não permitir a transferência de uma conta de origem para uma conta de destino que sejam iguais
   {if (Modulo.sPermiteTransf = 'N') then
   if Trim(msGrupoOrigem.ValoresChave[0]) <> Trim(msGrupoDestino.ValoresChave[0]) then
   begin
      MsgDlg('Não é possível fazer transferência entre grupos diferentes, conforme parâmetros do sistema!','Aviso',mtWarning,[mbOk],0);
      //MsgDlg('Não é possível efetuar transferência entre grupos diferentes!','Aviso',mtWarning,[mbOk],0);
      Exit;
   end;
   } // Edilaine - SOL 190311 / KTN 1799290 - fim

   Result := true;
end;




procedure TFrmTransfPorGrupoMT.cboTransfContaDestinoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  //Ricardo Freitas SOL 153807 KINTANA 1163275
  if Trim(cboTransfContaDestino.Text) <> '' then
  begin
       edtPerTransfDestino.Visible := True;
//  edtPerTransfDestino.Value   := CdsContasTransfDestino.FieldByName('PERIODO').AsInteger;
      edtPerTransfDestino.Value   :=  cboPeriodoDestino.ItemIndex;

     aContaSelecionadaDestino :=  cboTransfContaDestino.LookupValue;

  end
  else
  begin
       edtPerTransfDestino.Visible := false;
       edtPerTransfDestino.Clear;
  end;

  lblPeriodoDestino.Visible     := edtPerTransfDestino.Visible;
  edtExercTransfDestino.Value := CdsContasTransfDestino.FieldByName('EXERCICIO').AsInteger;
  //Ricardo Freitas SOL 153807 KINTANA - FIM
end;




procedure TFrmTransfPorGrupoMT.GridOrigemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   // Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
     if not(Highlight) then
     begin
       if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
       begin
         ABrush.color := clwhite
       end
       else
       begin
         ABrush.Color := $00C0FFFF; //Amarelo Bebê
       end;
     end;
   end
   else
   begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
   end;
end;




procedure TFrmTransfPorGrupoMT.GridOrigemTopRowChanged(Sender: TObject);
begin
  inherited;
  (sender as TwwDBGrid).Invalidate;
end;




procedure TFrmTransfPorGrupoMT.bbtnConfirmarClick(Sender: TObject);
begin
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  AtivaFiltroDados(Cds, tfNone);
  FiltraSelecionados(true);       // Edilaine - SOL 193146 / KTN 1940385
  CmeCadastro.RepetirInsert := False;
  inherited;
end;


procedure TFrmTransfPorGrupoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
var
  iIdOperacao, iPeriodo: integer;

begin
  inherited;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858 - Inicio
//
//  CdsContasTransfOrigem.RefreshRecord;
//  CdsContasTransfDestino.RefreshRecord;
 isRateioNparaN := False;
 AtualizaValoresCds;

 CdsContasTransfOrigem.Edit;
 CdsContasTransfOrigem.FieldByName('PERIODO').AsString := IntToStr(cboPeriodoOrigem.ItemIndex);
 CdsContasTransfOrigem.Post;

 CdsContasTransfDestino.Edit;
 CdsContasTransfDestino.FieldByName('PERIODO').AsString := IntToStr(cboPeriodoDestino.ItemIndex);
 CdsContasTransfDestino.Post;


  CtrlAlterorcamento.CdsOrigem  := CdsContasTransfOrigem;
  CtrlAlterorcamento.CdsDestino := CdsContasTransfDestino;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858 - Fim
  //Accept := CtrlAlterorcamento.GravarTransferenciasPorGrupo(Modulo.iPlanoOrc,iIdOperacao); // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - comentado
  Accept := CtrlAlterorcamento.GravarTransferenciasPorGrupo(iIdPlanoOrcOri, iIdPlanoOrcDest, iIdOperacao); // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  if not Accept then
     MsgDlg('Não foi possível efetuar a transferência entre grupo de contas orçamentárias.' + #13 +
            'Motivo: ' + CtrlAlterorcamento.MessageInfo,'Erro',mtError,[mbOk],0)
  else
  begin
     // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - comentando e chamando o overload da funcao
//   Cds.Data                    := CtrlTransacoesPorGrupo.ListaTransfEfetuadas(DateToStr(date),iIdOperacao, iPeriodo);
     //Cds.Data                  := CtrlTransacoesPorGrupo.ListaTransfEfetuadas(DateToStr(date),edtExercicioOrigem.text,edtExercicioDestino.text,iIdOperacao, iPeriodo, tcAmbas);  // Edilaine - SOL 190488 / KTN 1909246 - comentado
     Cds.Data                    := CtrlTransacoesPorGrupo.ListaTransfEfetuadas(DateToStr(date), IntToStr(iIdPlanoOrcOri), iIdOperacao, cboPeriodoOrigem.ItemIndex, cboPeriodoDestino.ItemIndex, tcAmbas);  // Edilaine - SOL 190488 / KTN 1909246
     pnlGridOrigemClick(pnlGridOrigem);
     // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

     CdsContasOrigem.Data        := CtrlTransacoesPorGrupo.ListaContasParaTransf(-1,-1,-1,-1,-1,-1);
     CdsContasDestino.Data       := CdsContasOrigem.Data;
     CdsContasTransfOrigem.Data  := CdsContasOrigem.Data;
     CdsContasTransfDestino.Data := CdsContasOrigem.Data;

     FiltraSelecionados(false);  // Edilaine - SOL 193146 / KTN 1940385
  end;
end;




procedure TFrmTransfPorGrupoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

    //Ricardo SOL 152915 KINTANA 1146745 - Preenche controles conforme consulta              

    //Retorno Monta Select
    {0 - Data Referência
    1 - Id Operação
    2 - Código Grupo origem
    3 - Nome Grupo Origem
    4 - Período Origem
    5 - Exercício Origem
    6 - Código Grupo Destino
    7 - Nome Grupo Destino
    8 - Período Destino
    9 - Exercício Destino}
    if MontaSelect.RetornouValor then
    begin
        //Grupo Origem
        edtDescGrupoOrigem.Text        := Trim(MontaSelect.ValoresChave[2]) + '-' + Trim(MontaSelect.ValoresChave[3]);
        cboPeriodoOrigem.ItemIndex     := StrToIntDef(MontaSelect.ValoresChave[4],0);
        edtExercicioOrigem.Text        := Trim(MontaSelect.ValoresChave[5]);
        CdsContasOrigem.Data           := CtrlTransacoesPorGrupo.ListaContasParaTransf(-1,-1,-1,-1,-1,-1);

        //cboPatroOrigem.LookupValue     := MontaSelect.ValoresChave[0];                      
        //cboPlanoPrevidenciarioOrigem.LookupValue     := MontaSelect.ValoresChave[0];
        //cboPlanoTrabOrigem.LookupValue := MontaSelect.ValoresChave[0];                      

        //Grupo Destino
        edtDescGrupoDestino.Text        := Trim(MontaSelect.ValoresChave[6]) + '-' + Trim(MontaSelect.ValoresChave[7]);
        cboPeriodoDestino.ItemIndex     := StrToIntDef(MontaSelect.ValoresChave[8],0);
        edtExercicioDestino.Text        := Trim(MontaSelect.ValoresChave[9]);
        //cboPatroDestino.LookupValue     := MontaSelect.ValoresChave[0];
        //cboPlanoPrevidenciarioDestino.LookupValue     := MontaSelect.ValoresChave[0];
        //cboPlanoTrabDestino.LookupValue := MontaSelect.ValoresChave[0];
        CdsContasDestino.Data           := CtrlTransacoesPorGrupo.ListaContasParaTransf(-1,-1,-1,-1,-1,-1);

        //Montagem de Tranferência
        //Cds.Data  := CtrlTransacoesPorGrupo.ListaTransfEfetuadas(MontaSelect.ValoresChave[0],edtExercicioOrigem.text,edtExercicioDestino.text,StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[4]));   // Edilaine - SOL 190488 / KTN 1909246 - comentado

        //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
        cdsPlanoOrcDestino.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( MontaSelect.ValoresChave[6] );           // Edilaine - SOL 190488 / KTN 1909246
        cboPlanoOrcamentarioDestino.LookupValue := MontaSelect.ValoresChave[12];                                        // Edilaine - SOL 190488 / KTN 1909246
        edtFornecedoresSubDespesasDestino.text := CtrlTransacoesPorGrupo.GetFornecedorSubDespesa( StrToInt(MontaSelect.ValoresChave[11]) );  // Edilaine - SOL 190488 / KTN 1909246
        //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

        // Edilaine - SOL 190488 / KTN 1909246
        cdsPlanoOrcOrigem.Data := CtrlTransacoesPorGrupo.ListaPlanoOrcamento( MontaSelect.ValoresChave[2] );
        cboPlanoOrcamentarioOrigem.LookupValue := MontaSelect.ValoresChave[12];
        edtFornecedoresSubDespesasOrigem.text := CtrlTransacoesPorGrupo.GetFornecedorSubDespesa( StrToInt(MontaSelect.ValoresChave[10]) );
        // Edilaine - SOL 190488 / KTN 1909246 - FIM

        // Edilaine - SOL 190488 / KTN 1909246
        Cds.Data  := CtrlTransacoesPorGrupo.ListaTransfEfetuadas(MontaSelect.ValoresChave[0], MontaSelect.ValoresChave[12] ,StrToIntDef(MontaSelect.ValoresChave[1],-1), StrToIntDef(MontaSelect.ValoresChave[4],0), StrToIntDef(MontaSelect.ValoresChave[8],0));


       // Edilaine Ferraresi - SOL 163908 / KTN 1403202
       pnlGridOrigemClick(pnlGridOrigem);

       PageControl.ActivePageIndex := 2;

       // Edilaine - SOL 190488 / KTN 1909246
       tbsMontaTransf.Enabled := true;
       pnlMontaTransf.Enabled := false;
       pnl_Bottom.enabled     := false;
       pnlGrid.enabled        := true;
       // Edilaine - SOL 190488 / KTN 1909246 - false

    end;
  end;




procedure TFrmTransfPorGrupoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
var  I, iddespesaorc : INTEGER;
begin
  inherited;

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  AtivaFiltroDados(cds, tfNone);
  cds.DisableControls;
//  for I := 0 to Cds.Fields.Count - 1 DO
//  begin
//    ShowMessage(Cds.Fields[i].FieldName);
//  end;
  cds.data := CtrlTransacoesPorGrupo.ListaTransfEfetuadas(cds.FieldByName('DATAREFERENCIA').AsString ,
                                                          //cds.FieldByName('EXERCICIOORIGEM').AsString ,      // Edilaine - SOL 190488 / KTN 1909246 - comentado
                                                          //cds.FieldByName('EXERCICIODESTINO').AsString ,     // Edilaine - SOL 190488 / KTN 1909246 - comentado
//                                                          cds.FieldByName('IDPLANOORIGEM').AsString ,          // Edilaine - SOL 190488 / KTN 1909246
                                                          cds.FieldByName('IDPLANOORCAMEN').AsString ,          // Edilaine - SOL 190488 / KTN 1909246
                                                          cds.FieldByName('IDOPERACAO').AsInteger,
                                                          cds.FieldByName('PERIODOORIGEM').AsInteger,          // Edilaine - SOL 190488 / KTN 1909246
                                                          cds.FieldByName('PERIODODESTINO').AsInteger,         // Edilaine - SOL 190488 / KTN 1909246
                                                          tcAmbas);

   {-- comentado o trecho abaixo, exclusão sera feita dentro do ExcluiTransferenciasPorGrupo
  //Brunno Mattos SOL 152922/4001  KTN 1161267 inicio
  Cds.First;
  while not Cds.Eof do
     Cds.Delete;
  //Brunno Mattos SOL 152922/4001  KTN 1161267 fim
  }
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  //Inicio - Sadi - SOL 234860 - PPM  445467 (Alterar para planos diferentes)
  iIdPlanoOrcOri := cds.FieldByName('IDPLANOORCAMEN').AsInteger;
  iIdPlanoOrcDest:= cds.FieldByName('IDPLANOORCAMEN').AsInteger;
  //Fim - Sadi - SOL 234860 - PPM  445467

  //Accept := CtrlAlterorcamento.ExcluiTransferenciasPorGrupo(Modulo.iPlanoOrc);    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - comentado
  Accept := CtrlAlterorcamento.ExcluiTransferenciasPorGrupo(iIdPlanoOrcOri, iIdPlanoOrcDest);    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
  if not Accept then
     MsgDlg('Não foi possível excluir a transferência entre grupo de contas orçamentárias.' + #13 +
            'Motivo: ' + CtrlAlterorcamento.MessageInfo,'Erro',mtError,[mbOk],0);

  Cds.EmptyDataSet;
  CdsContasOrigem.EmptyDataSet;
  CdsContasDestino.EmptyDataSet;
  CdsContasTransfOrigem.EmptyDataSet;
  CdsContasTransfDestino.EmptyDataSet;
  cds.EnableControls;
   //Início - Sadi - SOL 234860 - PPM  445467
    inherited;

  with pnlGridDestino do
  begin
    BevelInner := bvNone;
    BevelOuter := bvRaised;
    color      := clNavy;
  end;

  with pnlGridOrigem do
  begin
    BevelInner := bvLowered;
    BevelOuter := bvLowered;
    color      := clSilver;
  end;

  // ESCONDE CAMPOS
  TransfGridAtivo := tfDestino;

  AtivaFiltroDados(cds, tfDestino);

  TrocaCampoGrid(gridMontagem, 'GRUPOORIGEM'    , 'GRUPODESTINO'    , 'Grupo de ~Destino');
  TrocaCampoGrid(gridMontagem, 'EXERCICIOORIGEM', 'EXERCICIODESTINO', 'Exercício~Destino');
  TrocaCampoGrid(gridMontagem, 'PERIODOORIGEM'  , 'PERIODODESTINO'  , 'Período~Destino');
  TrocaCampoGrid(gridMontagem, 'CENTRESPORIGEM' , 'CENTRESPDESTINO' , 'C.Respon.~Destino');
  TrocaCampoGrid(gridMontagem, 'CENTCUSTORIGEM' , 'CENTCUSTDESTINO' , 'C.Custo~Destino');
  TrocaCampoGrid(gridMontagem, 'SBORIGEM'       , 'SBDESTINO'       , 'Fornecedor / Sub-despesas');
  TrocaCampoGrid(gridMontagem, 'ATIVPROJORIGEM'     , 'ATIVPROJDESTINO'     , 'Atividade~Projeto');
  TrocaCampoGrid(gridMontagem, 'PROGRAMAORIGEM'     , 'PROGRAMADESTINO'     , 'Programa');
  TrocaCampoGrid(gridMontagem, 'TIPODESPESAORIGEM'  , 'TIPODESPESADESTINO'  , 'Tipo de~Despesa');
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  TrocaCampoGrid(gridMontagem, 'PLANOORIGEM'  , 'PLANODESTINO'  , 'Plano~Previdenciário');
  TrocaCampoGrid(gridMontagem, 'PATROORIGEM'  , 'PATRODESTINO'  , 'Patrocinadora');

  GridMontagemUpdateFooter(GridMontagem); 
//Fim - Sadi - SOL 234860 - PPM  445467

end;




procedure TFrmTransfPorGrupoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := not (Cds.IsEmpty);
  if not Accept then
     MsgDlg('Não há nenhuma transferência efetuada!','Aviso',mtWarning,[mbOk],0);
end;



procedure TFrmTransfPorGrupoMT.CdsContasDestinoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('SALDODISP')).DisplayFormat := '#,##0.00;-#,##0.00';
  TFloatField(DataSet.FieldByName('VLRORCADO')).DisplayFormat := '#,##0.00;-#,##0.00';
  if DataSet.IsEmpty then
     pnlTotalContasDestino.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s) de destino'
  else
     pnlTotalContasDestino.Caption := 'Total de ' + IntToStr(DataSet.RecordCount) + ' relacionamento(s) de destino para o grupo ' + DataSet.FieldByName('CODGRUPOORC').AsString + ' - ' + DataSet.FieldByName('NOMEGRUPOORCAMEN').AsString;
end;

procedure TFrmTransfPorGrupoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  //Brunno Mattos SOL 154957  KTN 1193108 inclui btIncluir
  btIncluir.Enabled := True;
end;

procedure TFrmTransfPorGrupoMT.dbgrd1TitleClick(Column: TColumn);
begin
  inherited;
  ShowMessage(Column.FieldName);
end;

procedure TFrmTransfPorGrupoMT.GridMontagemRowChanged(Sender: TObject);
begin
  inherited;
  //Ricardo SOL 152915 KINTANA 1146745 - preencha controles conforme dados da
  //transferência
  if CmeCadastro.Operacao <> opInserir then
  begin
       cboTransfContaOrigem.Text     := cds.Fieldbyname('CENTCUSTORIGEM').AsString;
       edtPerTransfOrigem.Text       := cds.Fieldbyname('PERIODOORIGEM').AsString;
       edtExercTransfOrigem.Text     := cds.Fieldbyname('EXERCICIOORIGEM').AsString;

       // Edilaine Ferraresi - SOL 163908 / KTN 1403202
         //cboTransfContaDestino.Text    := cds.Fieldbyname('CENTCUSTDESTINO').AsString;
         //edtPerTransfDestino.Text      := cds.Fieldbyname('PERIODODESTINO').AsString;
         //edtExercTransfDestino.Text    := cds.Fieldbyname('EXERCICIODESTINO').AsString;
       // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

       mmObs.Lines.Text              := cds.Fieldbyname('OBSALTERORCAMEN').AsString;
       edtVlrSolicitado.Text         := cds.Fieldbyname('VLRSOLICITADO').AsString;
       edtDataReferencia.DateTime    := cds.Fieldbyname('DATAREFERENCIA').AsDatetime;
  end;
  //Ricardo SOL 152915 KINTANA 1146745 - FIM
end;

procedure TFrmTransfPorGrupoMT.LimpaControles;  
begin
       //Ricardo Freitas SOL 153807 KINTANA 1163275
       TRY
         //Dados de Transferência
         edtDataReferencia.Date      :=  StrToDate(FormatDateTime('dd/mm/yyyy',Date));
         mmObs.Lines.Clear;
         //Brunno Mattos SOL 154957  KTN 1193108
         edtVlrSolicitado.Text := '';

         //Origem
         edtDescGrupoOrigem.Clear;
         pnlTotalContasOrigem.Caption      := '';
         cboPeriodoOrigem.ItemIndex        := 1;  // (DiasUteis.ExtraiMes(date) - 1);  // Edilaine - SOL 193146 / KTN 1940385
         edtExercicioOrigem.Text           := IntToStr(DiasUteis.ExtraiAno(date));
         cboTransfContaOrigem.Clear;
         cboTransfContaOrigem.LookupValue  := '-1';
         lblPeriodoOrigem.Visible          := False;
         edtPerTransfOrigem.Visible        := False;
         edtPerTransfOrigem.Clear;
         edtExercTransfOrigem.Clear;
         // Edilaine Ferraresi - SOL 163908 / KTN 1403202
         cboPatroOrigem.Clear;
         cboPlanoPrevidenciarioOrigem.clear;
         cboAtivProjOrigem.Clear;
         cboProgOrigem.Clear;
         cboTipoDespOrigem.Clear;
         // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

         //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
         cboPlanoOrcamentarioOrigem.Clear;
         cboCentroCustoOrigem.Clear;
         edtFornecedoresSubDespesasOrigem.Clear;
         //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

         cboCentroCustoOrigem.LookupValue  := '';  // Edilaine - SOL 190311 / KTN 1799290
         cboCentroCustoDestino.LookupValue := '';  // Edilaine - SOL 190311 / KTN 1799290

         //Destino
         edtDescGrupoDestino.Clear;
         cboPeriodoDestino.ItemIndex       := 1;  // (DiasUteis.ExtraiMes(date) - 1);  // Edilaine - SOL 193146 / KTN 1940385
         edtExercicioDestino.Text          := IntToStr(DiasUteis.ExtraiAno(date));
         pnlTotalContasDestino.Caption     := '';
         cboTransfContaDestino.Clear;
         cboTransfContaDestino.LookupValue := '-1';
         lblPeriodoDestino.Visible         := False;
         edtPerTransfDestino.Visible       := False;
         edtPerTransfDestino.Clear;
         edtExercTransfDestino.Clear;
         cboRatCriter.LookupValue          := '-1';
         // Edilaine Ferraresi - SOL 163908 / KTN 1403202
         cboPatroDestino.Clear;
         cboPlanoPrevidenciarioDestino.clear;
         cboAtivProjDestino.Clear;
         cboProgDestino.Clear;
         cboTipoDespDestino.Clear;
         // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

         //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
         cboPlanoOrcamentarioDestino.Clear;
         cboCentroCustoDestino.Clear;
         edtFornecedoresSubDespesasDestino.Clear;
         //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

         FiltraSelecionados(false);  // Edilaine - SOL 193146 / KTN 1940385

       FINALLY
         Application.ProcessMessages;
       END;
       //Ricardo Freitas SOL 153807 KINTANA 1163275 - Fim
end;

//Brunno Mattos - KTN 1146873 - SOL 152922  Cria procedure CalculaRateioTransf e SaldoDisponivelxGrupoOrigem
function TFrmTransfPorGrupoMT.CalculaRateioTransf : Double;
//Brunno Mattos - KTN 1146873 - SOL 152922  Cria procedure CalculaRateioTransf
var
  rTotalDisponivel, rVlrOrigem, rVlrSolicitado, rPercentTransf, rVlrTransf, rQntdContasDestino : Double;
begin
  Result := 0;

  //Obtem o saldo total disponível para transferência
  rTotalDisponivel   := CalculaTotalCampoCds(CdsContasTransfOrigem, 'SALDODISP');

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699 - comentado - rVlrSolicitado     := StrToFloat(StringReplace(edtVlrSolicitado.Text,'.','',[]));
  //Ricardo de Freitas Araújo SOL 153807 KTN 1163275
  rVlrSolicitado     := edtVlrSolicitado.Value;
  rQntdContasDestino := CdsContasTransfDestino.RecordCount;
  rVlrOrigem         := CdsContasTransfOrigem.FieldByName('SALDODISP').AsFloat;

  //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
  //Sem critério de rateio
  if (cboRatCriter.LookupValue = '-1') then
  begin
      rPercentTransf := rVlrOrigem / rTotalDisponivel;
      rVlrTransf     := rPercentTransf * rVlrSolicitado;
      //rVlrTransf := RoundCM(rVlrTransf, 2);
      rVlrTransf     := Trunc(rVlrTransf * 100) / 100;

      //Atualiza o saldo da conta de origem
      CdsContasTransfOrigem.Edit;
      CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat := (CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat - rVlrTransf);
      CdsContasTransfOrigem.Post;

      //Atualiza o saldo da conta de destino
      CdsContasTransfDestino.Edit;
      CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat := (CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat + rVlrTransf);
      CdsContasTransfDestino.Post;
  end
  //Com critério de rateio
  else
  begin
     //Retorna 0 pois o cálculo do valor solicitado é feito na rotina:
     //"CtrlTransacoesPorGrupo.CalcularRateio".
     rVlrTransf     := 0;
     {TRY
         cdsTransfRateio_Aux.Close;
         CdsContasTransfDestino.Filtered := false;
         CdsContasTransfDestino.Filter   := ' IDPLANOORCAMEN = ' + CdsContasTransfDestino.FieldByName('IDPLANOORCAMEN').AsString + ' AND ' +
                                            ' IDCONTAORCAMEN = ' + QuotedStr(CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString) + ' AND ' +
                                            ' EXERCICIO = '      + CdsContasTransfDestino.FieldByName('EXERCICIO').AsString + ' AND ' +
                                            ' PERIODO = '        + CdsContasTransfDestino.FieldByName('PERIODO').AsString   + ' AND ' +
                                            ' CENTROCUSTO = '    + QuotedStr(CdsContasTransfDestino.FieldByName('CENTROCUSTO').AsString);
         CdsContasTransfDestino.Filtered := true;

         //Clona ClientDataset
         CtrlTransacoesPorGrupo.Clona_CLientDataset(CdsContasTransfDestino,cdsTransfRateio_Aux);

         CtrlTransacoesPorGrupo.CalcularRateio(cdsTransfRateio_Aux,//cCds: TClientDataSet;
                                               StrToInt(cboRatCriter.LookupValue),//iIdCriterioRateio: integer;
                                               Sistema.IdEmpresa,//iIdPessoa: integer;
                                               edtVlrSolicitado.Value, //rValor: Double;
                                               Trim(cboRatCriter.Text),//sNomeCriterio: string;
                                               Modulo.iPlanoOrc,//iIdPlano: integer;
                                               CdsContasTransfDestino.FieldByName('IDPATRO').AsInteger,//iIdPatro: integer;
                                               '',//sAtivProj: string;
                                               '',//sCRespon : string;
                                               true,//bNovoCalcCriterioRateio: Boolean;
                                               CdsContasTransfDestino.FieldByName('PERIODO').AsInteger,//pPeriodo: integer;
                                               CdsContasTransfDestino.FieldByName('EXERCICIO').AsInteger);//pExercicio: integer): boolean;

         rVlrTransf := cdsTransfRateio_Aux.fieldbyname('VALOR').AsFLoat;
    FINALLY
         CdsContasTransfDestino.Filtered := false;
         cdsTransfRateio_Aux.Close;
    END;}

  end;

  Result := rVlrTransf;
end;


procedure TFrmTransfPorGrupoMT.VerificaRestoRateio;
//Brunno Mattos - KTN 1146873 - SOL 152922  Cria procedure VerificaRestoRateio
var
   rSaldoDisponivelDestino, rDiferenca, rTotal : Double;
   contaMes : Integer;
begin
   //Ricardo de Freitas Araújo SOL 153918 KTN 1166699 - comentado rTotal := StrToFloat(StringReplace(edtVlrSolicitado.Text,'.','',[]));
   //Ricardo de Freitas Araújo SOL 153807 KTN 1163275
   rTotal := edtVlrSolicitado.Value;
   rDiferenca := rTotal - CalculaTotalCampoCds(Cds, 'VLRSOLICITADO');//(Cds.FieldByName('VLRSOLICITADO').AsFloat * Cds.RecordCount);

   if ((cboPeriodoOrigem.ItemIndex = 0) AND (cboPeriodoDestino.ItemIndex = 0)) then
   //rateia a diferença entre o primeiro relacionamento de cada período, de modo que fique o mais uniforme possível
   begin
       rDiferenca := rDiferenca * 100;
       contaMes   := 1;
       while Trunc(rDiferenca) > 0 do
       begin
            Cds.Filtered := False;
            Cds.Filter   := 'PERIODOORIGEM = ' + IntToStr(contaMes);
            Cds.Filtered := True;
            if not Cds.IsEmpty then
            begin
              Cds.First;
              Cds.Edit;
              Cds.FieldByName('VLRSOLICITADO').AsFloat := 0.01 + Cds.FieldByName('VLRSOLICITADO').AsFloat;
              Cds.Post;
              rDiferenca   := rDiferenca - 1;
            end;

            if contaMes = 12 then
               contaMes := 1
            else
               contaMes := contaMes + 1;
       end;
       Cds.Filtered := False;
   end;

   //joga a diferença de centavos no primeiro relacionamento
   rDiferenca := rTotal - CalculaTotalCampoCds(Cds, 'VLRSOLICITADO');//(Cds.FieldByName('VLRSOLICITADO').AsFloat * Cds.RecordCount);
   if (rDiferenca > 0) then
   begin
        Cds.First;
        Cds.Edit;
        Cds.FieldByName('VLRSOLICITADO').AsFloat := rDiferenca + Cds.FieldByName('VLRSOLICITADO').AsFloat;
        Cds.Post;
   end;
end;
                               
function TFrmTransfPorGrupoMT.CalculaTotalCampoCds(cCds: TCMClientDataSet;
                                                   Campo: String;
                                                   const bFiltraSel : boolean;
                                                   const pStrContaDestino : string): Double; //Marcio Sanches Spinosa SOL 206192 Kintana 1996858  // Edilaine - SOL 193146 / KTN 1940385
//Brunno Mattos - KTN 1146873 - SOL 152922  Cria procedure CalculaTotalCampoCds
//Calcula total do campo de um determinado cds
var
   CdsAux: TClientDataSet;
   rTotal: Double;
   sFiltro : string;
begin
  inherited;
  try
     CdsAux      := TCMClientDataSet.Create(nil);
     CdsAux.Data := cCds.Data;

     // Edilaine - SOL 193146 / KTN 1940385
     if bFiltraSel then
     begin
       sFiltro := cdsAux.Filter;

       cdsAux.Filtered := false;
       if (cCds.Filter <> EmptyStr) then
          cdsAux.Filter   := cCds.Filter
       else
          cdsAux.Filter   := 'SELECIONADO = ''N'' ';
       cdsAux.Filtered := true;
     end;
     // Edilaine - SOL 193146 / KTN 1940385 - fim

     rTotal      := 0;
     CdsAux.First;
     //Marcio Sanches Spinosa SOL 206192 Kintana 1996858
     if (pStrContaDestino = EmptyStr) then
     begin
     while not CdsAux.Eof do
     begin
        rTotal := rTotal + CdsAux.FindField(Campo).AsFloat;
        CdsAux.Next;
     end;
     end
     else
     begin
       if (CdsAux.Locate('IDCONTAORCAMEN', pStrContaDestino, [])) then
          rTotal := CdsAux.FindField(Campo).AsFloat;
     end;
    //Marcio Sanches Spinosa SOL 206192 Kintana 1996858

  finally
     Result :=  RoundCM(rTotal,2);
     if bFiltraSel then
     begin
       cdsAux.Filtered := false;
       cdsAux.Filter   := sFiltro;
       cdsAux.Filtered := sFiltro <> '';
     end;
     FreeAndNil(CdsAux);
  end;
end;

procedure TFrmTransfPorGrupoMT.MontaSelectBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
var
  sSQL,sSQLUnion: TStrings;
  iOrderBy: integer;

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  iWhere            : Integer;
  sSqlExercicio,
  sSubDespesa       : String;
  iExercicioOrigem,
  iExercicioDestino : Integer;

  Function GetValue_strListParams(AParamName : String) : String;
  Var
    I : Integer;
  Begin
    Result := '';

    I := 0;
    With strListParams do
      While (I < Count) do
        if POS(AParamName, Strings[I]) > 0 Then
        Begin
           Result := Trim(Copy(Strings[I], Pos('=', Strings[I])+1, 50));
           I      := Count;
        end Else
           Inc(I);
    //
  End;

  Function DropLine(Const ASubStr : String; VAR ASql : TStrings) : Integer;
  Var
    J : Integer;
  Begin
    j := ASQL.Count - 1;
    While j > 0 do
      if Pos(ASubStr, AnsiUpperCase(ASQL.Strings[j])) > 0 then
      Begin
        Result := J;
        ASQL.Delete(j);
        j := 0;
      end Else
        Dec(j);
  End;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

begin
  inherited;

  try
     sSQL      := TStringList.Create;
     sSQLUnion := TStringList.Create;

     sSQL.Text      := sqlText;
     sSQLUnion.Text := sqlText;     

     //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
     sSubDespesa := GetValue_strListParams(QuotedStr('SUBDESPESA'));
     if Trim(sSubDespesa) <> '' then//Informou a sub despesa
     Begin
       //Determinado o ANO DE EXERCICIO do saldo quando informado
       iExercicioOrigem  := StrToIntDef(GetValue_strListParams( 'EXERCICIOORIGEM'  ),0);
       iExercicioDestino := StrToIntDef(GetValue_strListParams( 'EXERCICIODESTINO' ),0);

       Case (iExercicioOrigem + iExercicioDestino) of
            0..2000: sSqlExercicio := ' WHERE ';//Não informou nenhum dos dois
         4000..9999: sSqlExercicio := ' WHERE (S.EXERCICIO in (' + IntToStr( iExercicioOrigem  ) + ', '
                                                                 + IntToStr( iExercicioDestino ) + ')) AND ';//Informou os dois ou informou o ano errado
       Else//Informou apenas um
         if iExercicioDestino = 0 Then
            sSqlExercicio := ' WHERE S.EXERCICIO = ' + IntToStr( iExercicioOrigem )  + ' AND '
         Else
            sSqlExercicio := ' WHERE S.EXERCICIO = ' + IntToStr( iExercicioDestino ) + ' AND ';
       End;
       //

       iWhere := sSQL.Count - 1;
       While iWhere > 0 do
         if Pos('WHERE', AnsiUpperCase(sSQL.Strings[iWhere])) > 0 then
         Begin
            sSQL.Insert(iWhere, ', GRUPOORCAMEN G,' );
            sSQL.Insert(iWhere+1, '(Select C.IDGRUPOORCAMEN, D.SUBDESPESA '
                               +   ' From CONTASORCAMEN C,'
                               +   '      SALDOORCADO S,'
                               +   '      DESPESAORCAMENTARIA D'
                               + sSqlExercicio
                               + '   C.IDCONTAORCAMEN = S.IDCONTAORCAMEN '
                               + '   And C.IDPESSOA       = S.IDPESSOA(+) '
                               + '   And C.IDPLANOORCAMEN = S.IDPLANOORCAMEN(+) '
                               + '   And S.IDDESPESAORC   = D.IDDESPESAORC(+) '
                               + ' Group By C.IDGRUPOORCAMEN, D.SUBDESPESA) ct' );

           iWhere := 0;
         end Else
           Dec(iWhere);

       DropLine('ORDER BY', sSQL);
       sSQL.Add( '   AND (Ct.IDGRUPOORCAMEN = G.IdGrupoOrcamen)');
       sSQL.Text       := StringReplace(sSQL.Text, '(''SUBDESPESA''','(SUBDESPESA', []);

       //Eliminando o parametro do Union
       iWhere         := DropLine('(''SUBDESPESA''', sSQLUnion);
       sSQLUnion.Strings[iWhere - 1] := StringReplace(sSQLUnion.Strings[iWhere - 1], ' AND','', []);
     End;
     //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

     sSQLUnion.Strings[5]  := 'NOMEGRUPOORCAMENORIGEM || '' - Anual'' AS C4,';
     sSQLUnion.Strings[9]  := 'NOMEGRUPOORCAMENDESTINO || '' - Anual'' AS C8,';
     sSQLUnion.Strings[1]  := 'null AS C0,';
     sSQLUnion.Strings[2]  := '0 AS C1,';
     sSQLUnion.Strings[6]  := '0 AS C5,';
     sSQLUnion.Strings[11]  := 'null AS C10,';
     sSQLUnion.Strings[18]  := '0 AS C17,';
     sSQLUnion.Strings[22]  := '0 AS C21,';       // Edilaine - SOL 190488 / KTN 1909246

     DropLine('ORDER BY', sSQL);
     DropLine('ORDER BY', sSQLUnion);
     sqlText := sSQL.Text + ' UNION ' + #13#10 + sSQLUnion.Text + #13#10 + ' ORDER BY C3 ASC, C1, C2';
  finally
     FreeAndNil(sSQL);
     FreeAndNil(sSQLUnion);
  end;
end;

procedure TFrmTransfPorGrupoMT.Calcular_Rateio_Tranferencia;
var
     //Brunno Mattos - KTN 1146873 - SOL 152922 cria váriavel para calcular o valor
     //que será trasferido para cada um dos relacionamentos, sendo este proporcional ao valor do relacionamento de origem em relação ao total disponível do Grupo Orçamentário
     rValorTransf  : Double;
     iTamCod1      : Integer;
     qry           : TwwQuery;
     bTemNaDestino : Boolean;
begin
     //Obtem valor do parametro do sistema que define quantidade de zeros que compoe o IDCONTAORCAMEN
     //Brunno Mattos - KTN 1146873 - SOL 152922

     {//Obtem valor total disponível do grupo de destino antes de efetuar o rateio, sera utilzado para verificar se há resto no rateio devido ao arredondamento
     rSaldoDisponivelOrigem := CalculaTotalCampoCds(CdsContasTransfOrigem, 'SALDODISP'); }

     //Caso não informar a contas de origem e destino, deverá tranferir tudo.
     if (cboTransfContaOrigem.Text = '') and (cboTransfContaDestino.Text = '') then
     begin

       //Progresso
       lblTransferencia.Caption := 'Aguarde...';
       gProgresso.Visible       := true;
       gProgresso.MaxValue      := CdsContasTransfOrigem.RecordCount;
       gProgresso.MinValue      := 0;
       gProgresso.Progress      := 0;
       Application.ProcessMessages;

       //Brunno Mattos - KTN 1146873 - SOL 152922  inicio - inclui o while
       CdsContasTransfOrigem.First;
       while not CdsContasTransfOrigem.Eof do
       begin

           //Ricardo Freitas SOL 153807 KINTANA 1163275
           //Para os casos de Tranferência anual, deverá realizar filtro por período,
           //pois haverá vários Centro de Custas,Plano,Patro para vários períodos
           bTemNaDestino := false;

           if (cboPeriodoOrigem.ItemIndex = 0) or (cboPeriodoDestino.ItemIndex = 0) then
           begin
              //Anual X Período
              bTemNaDestino := (CdsContasTransfDestino.Locate('CENTROCUSTO;PLANO;PATRO;PERIODO',varArrayOf([CdsContasTransfOrigem.FieldByName('CENTROCUSTO').Value,
                                                                                           CdsContasTransfOrigem.FieldByName('PLANO').Value,
                                                                                           CdsContasTransfOrigem.FieldByName('PATRO').Value,
                                                                                           CdsContasTransfOrigem.FieldByName('PERIODO').Value]),[]));
           end
           else
           begin
               //Perído x Período
               bTemNaDestino := (CdsContasTransfDestino.Locate('CENTROCUSTO;PLANO;PATRO',varArrayOf([CdsContasTransfOrigem.FieldByName('CENTROCUSTO').Value,
                                                                                           CdsContasTransfOrigem.FieldByName('PLANO').Value,
                                                                                           CdsContasTransfOrigem.FieldByName('PATRO').Value]),[]));
           end;
           //Ricardo Freitas SOL 153807 KINTANA 1163275 - Fim

           //Ricardo Freitas SOL 153807 KINTANA 1163275 - comentado
           {if not (CdsContasTransfDestino.Locate('CENTROCUSTO;PLANO;PATRO;PERIODO',varArrayOf([CdsContasTransfOrigem.FieldByName('CENTROCUSTO').Value,
                                                                                       CdsContasTransfOrigem.FieldByName('PLANO').Value,
                                                                                       CdsContasTransfOrigem.FieldByName('PATRO').Value,
                                                                                       CdsContasTransfOrigem.FieldByName('PERIODO').Value]),[])) then}
           if not bTemNaDestino then
           begin
             CdsContasTransfOrigem.Next;

             //Progresso
             gProgresso.Progress        := gProgresso.Progress + 1;
             Application.ProcessMessages;
           end
           else
           begin
             // Inserindo registros para transferências...
             Cds.Append;
             Cds.FieldByName('IDGRUPOORCORIGEM').AsInteger  := CdsContasTransfOrigem.FieldByName('IDGRUPOORCAMEN').AsInteger;
             Cds.FieldByName('IDGRUPOORCDESTINO').AsInteger := CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').AsInteger;
             Cds.FieldByName('GRUPODESTINO').AsString       := msGrupoDestino.ValoresChave[2] + '-' + msGrupoDestino.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
             Cds.FieldByName('EXERCICIODESTINO').AsString   := CdsContasTransfDestino.FieldByName('EXERCICIO').AsString;//edtExercTransfDestino.Text;
             Cds.FieldByName('PERIODODESTINO').AsString     := CdsContasTransfDestino.FieldByName('PERIODO').AsString;//edtPerTransfDestino.Text;
             Cds.FieldByName('IDPESSOA').AsFloat            := Sistema.IdEmpresa;
             Cds.FieldByName('GRUPOORIGEM').AsString        := msGrupoOrigem.ValoresChave[2] + '-' + msGrupoOrigem.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
             Cds.FieldByName('EXERCICIOORIGEM').AsString    := CdsContasTransfOrigem.FieldByName('EXERCICIO').AsString;//edtExercTransfOrigem.Text;
             Cds.FieldByName('PERIODOORIGEM').AsString      := CdsContasTransfOrigem.FieldByName('PERIODO').AsString;//edtPerTransfOrigem.Text;XXXXXX
             Cds.FieldByName('IDPLANOORCAMEN').AsInteger    := iIdPlanoOrcOri; {Modulo.iPlanoOrc;}   // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
             Cds.FieldByName('IDCONTAORIGEM').AsString      := CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString; //cboTransfContaOrigem.LookupValue;
             Cds.FieldByName('IDCONTADESTINO').AsString     := CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString;//cboTransfContaDestino.LookupValue;
             Cds.FieldByName('OBSALTERORCAMEN').AsString    := mmObs.Lines.Text;
             //Brunno Mattos - KTN 1146873 - SOL 152922  comentado, calculo sera feito na function CalculaRateioTransf
             //Cds.FieldByName('VLRSOLICITADO').AsFloat       := edtVlrSolicitado.Value;
             Cds.FieldByName('VLRSOLICITADO').AsFloat       := CalculaRateioTransf;
             Cds.FieldByName('DATAREFERENCIA').AsDateTime   := edtDataReferencia.Date;
             Cds.FieldByName('FLGTIPOALTER').AsString       := 'T';
             Cds.FieldByName('PLANOORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PLANO').AsString;
             Cds.FieldByName('PLANODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PLANO').AsString;
             Cds.FieldByName('PATROORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PATRO').AsString;
             Cds.FieldByName('PATRODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PATRO').AsString;
             Cds.FieldByName('CENTRESPORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTRORESPON').AsString;
             Cds.FieldByName('CENTRESPDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTRORESPON').AsString;
             Cds.FieldByName('CENTCUSTORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTROCUSTO').AsString;
             Cds.FieldByName('CENTCUSTDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTROCUSTO').AsString;

             //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
             //Campos Virtuias para Cálculo de Rateio conforme Grupo Destino
             Cds.FieldByName('VALIDAR').AsString               := 'S';
             Cds.FieldByName('IDGRUPOORCAMEN').AsInteger      :=  CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').AsInteger;
             Cds.FieldByName('IDCONTAORCAMEN').AsString       :=  CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString;
             Cds.FieldByName('CODCENTROCUSTO').AsString       :=  CdsContasTransfDestino.FieldByName('CODCENTROCUSTO').AsString;
             Cds.FieldByName('EXERCICIO').AsString            :=  CdsContasTransfDestino.FieldByName('EXERCICIO').AsString;
             Cds.FieldByName('PERIODO').AsString              :=  CdsContasTransfDestino.FieldByName('PERIODO').AsString;
             Cds.FieldByName('IDPLANOPREV').AsInteger         :=  CdsContasTransfDestino.FieldByName('IDPLANOPREV').AsInteger;
             Cds.FieldByName('IDPATRO').AsInteger             :=  CdsContasTransfDestino.FieldByName('IDPATRO').AsInteger;
             Cds.FieldByName('IDCRITERIORATORC').AsInteger    :=  StrToIntDef(cboRatCriter.LookUpValue,0);
             Cds.FieldByName('NOMECRITERIO').AsString         :=  Trim(cboRatCriter.Text);
             //Ricardo de Freitas Araújo SOL 153918 KTN 1166699 - Fim
             Cds.Post;

             CdsContasTransfOrigem.Next;

             //Progresso
             gProgresso.Progress         := gProgresso.Progress + 1;
             Application.ProcessMessages;
           end;
       end;

       //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
       if (cboRatCriter.LookupValue = '-1') then
       begin
          //Progresso
          lblTransferencia.Caption := 'Verificando resto de rateio...';
          Application.ProcessMessages;
          VerificaRestoRateio;//Caso no rateio tenha resto, o mesmo será jogado para a primeira conta
       end;
       //Brunno Mattos - KTN 1146873 - SOL 152922 fim
     end
     else
     begin

       //Transferência NORMAL

       // Atualiza o saldo da conta de origem
       CdsContasTransfOrigem.Edit;
       CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat := (CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat - edtVlrSolicitado.Value);
       CdsContasTransfOrigem.Post;

       // Atualiza o saldo da conta de destino
       CdsContasTransfDestino.Edit;
       CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat := (CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat + edtVlrSolicitado.Value);
       CdsContasTransfDestino.Post;

       // Inserindo registros para transferências...
       Cds.Append;
       Cds.FieldByName('IDGRUPOORCORIGEM').AsInteger  := CdsContasTransfOrigem.FieldByName('IDGRUPOORCAMEN').AsInteger;
       Cds.FieldByName('IDGRUPOORCDESTINO').AsInteger := CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').AsInteger;
       Cds.FieldByName('GRUPODESTINO').AsString       := msGrupoDestino.ValoresChave[2] + '-' + msGrupoDestino.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
       Cds.FieldByName('EXERCICIODESTINO').AsString   := edtExercTransfDestino.Text;
       Cds.FieldByName('PERIODODESTINO').AsString     := edtPerTransfDestino.Text;
       Cds.FieldByName('IDPESSOA').AsFloat            := Sistema.IdEmpresa;
       Cds.FieldByName('GRUPOORIGEM').AsString        := msGrupoOrigem.ValoresChave[2] + '-' + msGrupoOrigem.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
       Cds.FieldByName('EXERCICIOORIGEM').AsString    := edtExercTransfOrigem.Text;
       Cds.FieldByName('PERIODOORIGEM').AsString      := edtPerTransfOrigem.Text;
       Cds.FieldByName('IDPLANOORCAMEN').AsInteger    := iIdPlanoOrcDest;   {Modulo.iPlanoOrc;}    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
       Cds.FieldByName('IDCONTAORIGEM').AsString      := cboTransfContaOrigem.LookupValue;
       Cds.FieldByName('IDCONTADESTINO').AsString     := cboTransfContaDestino.LookupValue;
       Cds.FieldByName('OBSALTERORCAMEN').AsString    := mmObs.Lines.Text;
       Cds.FieldByName('VLRSOLICITADO').AsFloat       := edtVlrSolicitado.Value;
       Cds.FieldByName('DATAREFERENCIA').AsDateTime   := edtDataReferencia.Date;
       Cds.FieldByName('FLGTIPOALTER').AsString       := 'T';
       Cds.FieldByName('PLANOORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PLANO').AsString;
       Cds.FieldByName('PLANODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PLANO').AsString;
       Cds.FieldByName('PATROORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PATRO').AsString;
       Cds.FieldByName('PATRODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PATRO').AsString;
       Cds.FieldByName('CENTRESPORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTRORESPON').AsString;
       Cds.FieldByName('CENTRESPDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTRORESPON').AsString;
       Cds.FieldByName('CENTCUSTORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTROCUSTO').AsString;
       Cds.FieldByName('CENTCUSTDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTROCUSTO').AsString;
       //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
       Cds.FieldByName('VALIDAR').AsString    := 'S';
       Cds.Post;
     end;

     lblTransferencia.Caption := '';
     gProgresso.Visible       := false;
     Application.ProcessMessages;

end;

procedure TFrmTransfPorGrupoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Ricardo Freitas SOL 153807 KINTANA 1163275
  LimpaControles;
  isRateioNparaN := False;
end;

function TFrmTransfPorGrupoMT.RetornarData(iPeriodo: integer;
  Exercicio: string): TDateTime;
begin
     if iPeriodo > 0 then
        Result := StrToDate('01/'+FormatCurr('00', iPeriodo)+'/' + Trim(Exercicio))
     else
        Result := StrToDate('01/'+FormatCurr('00', 01)+'/'       + Trim(Exercicio));
end;

//Brunno Mattos SOL 154957  KTN 1193108 inicio
procedure TFrmTransfPorGrupoMT.CalculaRateioTransf2(cCds : TCMClientDataSet;
                                                   rVlrSaldoAntigo,
                                                   rVlrNovoSaldo : Double;
                                                   sCampoParaAtualizar,
                                                   sCampoPeriodo : String;
                                                   isOrigem : Boolean = False;
                                                   isDestino : Boolean = False;
                                                   const pStrContaDestino : string = '');//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
var
rPercentTransf, rVlrTransf, rQntdContas, rVlrAjustado, rVlrDisponivelConta, rVlrSolicitado, rVlrBaseConta : Double;
sFlgTipo : string;
begin

  // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524
  if cCds.RecordCount = 0 then
  begin
    LimparCds;
    ShowMessage('A conta destino não pode receber rateio, devido a mesma estar presente na origem!');
    Exit;
  end;
  // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524 - fim

  // Edilaine - SOL 193146 / KTN 1940385
  // faz o rateio do destino igual da entrada de dados (rateio lançado no campo VALOR do cliente)
  //Marcio Sanches Spinosa SOL 206192 Kintana 1996858
    if (pStrContaDestino <> EmptyStr) then
    begin
      if (cCds.Locate('IDCONTAORCAMEN',pStrContaDestino, [])) then
      Begin
        Cds.Filtered := False;

        cCds.Edit;
        cCds.FieldByName('VALOR').Value := cCds.FieldByName('VALOR').Value + edtVlrSolicitado.value;
        cCds.Post;
      end;
    end
    else
    if (isDestino) and (rVlrSaldoAntigo = 0) then
    begin
         CtrlTransacoesPorGrupo.CalcularRateio(cCds,                   //cCdsDestino,
               -1,                                                //iIdCriterioRateio: integer;
              Sistema.IdEmpresa                                   //iIdPessoa: integer;
              edtVlrSolicitado.value,                              //rValor: Double;
                '',                                               //sNomeCriterio: string;
               StrToIntDef(cboPlanoPrevidenciarioDestino.LookupValue,-1),          //iIdPlano: integer = -1;
               StrToIntDef(cboPatroDestino.LookupValue,-1),         //iIdPatro: integer = -1;
              cboAtivProjDestino.text,                            //sAtivProj: string = '';
              '',                                                 //sCRespon : string = '';
              cboProgDestino.Text,                                //sPrograma   : string = '';
              cboTipoDespDestino.Text                             //sTipoDespesa: string = '';
              false,                                              //bNovoCalcCriterioRateio: Boolean = False;
              cboPeriodoDestino.ItemIndex,                        //pPeriodo: integer = 0;
              StrToIntDef(edtExercicioDestino.Text, 0),            //pExercicio: integer = 0;
              true);                                               //bTranfMonta : Boolean = False
    end;
   //Marcio Sanches Spinosa SOL 206192 Kintana 1996858
  // Edilaine - SOL 193146 / KTN 1940385 - fim

  isRateioNparaN := true;
  cCds.First;
  while not cCds.Eof do
  begin
      rQntdContas := cCds.RecordCount;
      //rVlrBaseConta armazena o valor de dotação efetuado em entrado de dados de cada conta, o qual não é alterado
      rVlrBaseConta := cCds.FieldByName('VLRORCADO').AsFloat;
      rVlrDisponivelConta := cCds.FieldByName('SALDODISP').AsFloat;
      //Marcio Sanches Spinosa SOL 206192 Kintana 1996858
       if (pStrContaDestino <> EmptyStr) then
        begin
           rVlrTransf := cCds.FieldByName('VALOR').AsFloat;
        end
       else if ((isDestino) and (rVlrSaldoAntigo = 0)) then
        rVlrTransf := cCds.FieldByName('VALOR').AsFloat
       else
       begin
          if (rVlrSaldoAntigo = 0) then
             rVlrSaldoAntigo := 1;

            //Marcio Sanches Spinosa SOL 217025 Kintana 2046511 - Inicio
          if not isDestino and (pStrContaDestino = EmptyStr) then
          begin
              rPercentTransf := rVlrDisponivelConta/(rVlrNovoSaldo + edtVlrSolicitado.Value);
              rVlrTransf := rPercentTransf * rVlrNovoSaldo;
              rVlrTransf := RoundCM(rVlrTransf, 2);
            //Marcio Sanches Spinosa SOL 217025 Kintana 2046511 - Fim
          end
          else
          begin
            if cCds.RecordCount > 1 then
            begin
              rPercentTransf := rVlrDisponivelConta/rVlrNovoSaldo;
  //            rPercentTransf := rVlrBaseConta / rVlrSaldoAntigo;
              rVlrTransf := rPercentTransf * rVlrNovoSaldo;
            end
            else
              rVlrTransf := rVlrNovoSaldo;

             rVlrTransf := RoundCM(rVlrTransf, 2);

          end;
          //rVlrTransf := Trunc(rVlrTransf * 100) / 100;
       end;
      //Marcio Sanches Spinosa OL 206S192 Kintana 1996858
      //Atualiza o saldo da conta dentro do Cds

      cCds.Edit;
      cCds.FieldByName(sCampoParaAtualizar).AsFloat := rVlrTransf;
      cCds.Post;

      sFlgTipo := CtrlTransacoesPorGrupo.iif(isOrigem, 'O', 'D');   // Edilaine - SOL 193146 / KTN 1940385

      //Preenche VLRSOLICITADOORIGEM e VLRSOLICITADODESTINO no cds da montagem
//      if Cds.Locate('IDCONTAORCAMEN;FLGTIPOCONTA;IDDESPESAORCORIGEM',
//        VarArrayOf([cCds.FieldByName('IDCONTAORCAMEN').AsString, sFlgTipo,
//        cCds.FieldByName('IDDESPESAORC').AsString]),[]) then   // Edilaine - SOL 193146 / KTN 1940385 - fim

      if Cds.Locate('IDCONTAORCAMEN;FLGTIPOCONTA',
        VarArrayOf([cCds.FieldByName('IDCONTAORCAMEN').AsString, sFlgTipo]),[]) then   // Edilaine - SOL 193146 / KTN 1940385 - fim
      begin
        if isOrigem then
        begin
          rVlrSolicitado := rVlrDisponivelConta - rVlrTransf;
          Cds.Edit;
          Cds.FieldByName('VLRSOLICITADOORIGEM').AsFloat := Cds.FieldByName('VLRSOLICITADOORIGEM').AsFloat + (rVlrSolicitado * -1);//rVlrTransf * -1;Marcio Sanches Spinosa SOL 206192 Kintana 1996858
          Cds.Post;
          cCds.Edit;
          cCds.FieldByName('VLRSOLICITADO').AsFloat := cCds.FieldByName('VLRSOLICITADO').AsFloat + (rVlrSolicitado * -1);//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
          cCds.Post;
        end
        else if isDestino then
        begin
//          rVlrSolicitado := rVlrTransf - rVlrDisponivelConta;
          rVlrSolicitado := rVlrNovoSaldo - rVlrDisponivelConta;
//          rVlrSolicitado := rVlrNovoSaldo - rVlrTransf;
          Cds.Edit;
          Cds.FieldByName('VLRSOLICITADODESTINO').AsFloat := rVlrSolicitado;//rVlrTransf;
//          Cds.FieldByName('VLRSOLICITADOORIGEM').AsFloat := rVlrSolicitado;//rVlrTransf;
          Cds.Post;
          cCds.Edit;
          cCds.FieldByName('VLRSOLICITADO').AsFloat := rVlrSolicitado;
          cCds.Post;
        end;
      end;

      cCds.Next;
  end;

  if  (not (isDestino) and not(rVlrSaldoAntigo = 0)) then
  begin
    rVlrAjustado :=  ABS(CalculaTotalCampoCds(cCds, 'SALDODISP', true) - CalculaTotalCampoCds(cCds, sCampoParaAtualizar, true)); //ABS(rVlrSaldoAntigo - rVlrNovoSaldo);
    VerificaRestoRateio2(cCds, rVlrAjustado, sCampoParaAtualizar, sCampoPeriodo, isOrigem);
  end;
end;

procedure TFrmTransfPorGrupoMT.CalculaRateioTransfMontagem(cCds,
                                                          cCdsOrigem,
                                                          cCdsDestino : TCMClientDataSet;
                                                          rVlrSaldoAntigo,
                                                          rVlrNovoSaldo : Double;
                                                          sCampoParaAtualizar,
                                                          sCampoPeriodo : String;
                                                          isOrigem : Boolean = False;
                                                          isDestino : Boolean = False;
                                                          Const pStrContaDestino : string = '');//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
var
lFindCta : boolean;  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
rPercentTransf, rVlrTransf, rQntdContas, rVlrAjustado, rVlrDisponivelConta : Double;
begin
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - filtra cds antes de iniciar conforme o tipo
  if (isDestino) then
     AtivaFiltroDados(cCds, tfDestino)
  else
     AtivaFiltroDados(cCds, tfOrigem);
  cCds.DisableControls;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim


  cCds.First;
  while not cCds.Eof do
  begin
      rQntdContas := cCds.RecordCount;
      // Edilaine Ferraresi - SOL 163908 / KTN 1403202
      // cCdsDestino.Locate('IDCONTAORCAMEN', cCds.FieldByName('IDCONTAORCAMEN').AsString, []);

      if (isDestino) and (cCds.FieldByName('FLGTIPOCONTA').AsString = 'D') then
         lFindCta := CdsContasTransfDestino.Locate('IDCONTAORCAMEN', cCds.FieldByName('IDCONTADESTINO').AsString, [])
      else if (isOrigem) and (cCds.FieldByName('FLGTIPOCONTA').AsString = 'O') then
         lFindCta := CdsContasTransfOrigem.Locate('IDCONTAORCAMEN', cCds.FieldByName('IDCONTAORIGEM').AsString, []);
      // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

      if (lFindCta) then   // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - só executa o bloco se localizou a conta
      begin

        if (isOrigem) then
        begin
          { // Edilaine - SOL 193146 / KTN 1940385 - comentado
          rVlrDisponivelConta := cCds.FieldByName('VLRORCADO').AsFloat;
          rPercentTransf := rVlrDisponivelConta / rVlrSaldoAntigo;
          rVlrTransf := rPercentTransf * rVlrNovoSaldo;
          rVlrTransf := RoundCM(rVlrTransf, 2);
          //rVlrTransf := Trunc(rVlrTransf * 100) / 100;
          } // Edilaine - SOL 193146 / KTN 1940385 - fim

          rVlrTransf := CdsContasTransfOrigem.FieldByName('SALDODISP').AsFloat - CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat;
         //Marcio Sanches Spinosa SOL 206192 Kintana 1996858
          cCds.Edit;
          cCds.FieldByName(sCampoParaAtualizar).AsFloat := rVlrTransf + cCds.FieldByName(sCampoParaAtualizar).AsFloat;
          cCds.Post;
         //Marcio Sanches Spinosa SOL 206192 Kintana 1996858
        end
        else
        begin
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
          // Edilaine - SOL 193146 / KTN 1940385
//          if (rVlrSaldoAntigo = 0) then

          if not (isRateioNparaN) then
          begin
          if (CdsContasTransfDestino.FieldByName('SALDODISP').AsFloat = 0) then
             rVlrTransf := CdsContasTransfDestino.FieldByName('VALOR').AsFloat
//          if (rVlrSaldoAntigo = 0) then
//             rVlrTransf := CdsContasTransfDestino.FieldByName('VALOR').AsFloat
          else
//           if (CdsContasTransfDestino.RecordCount = 1) then
             rVlrTransf := rVlrNovoSaldo - {CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat -} CdsContasTransfDestino.FieldByName('SALDODISP').AsFloat;
//           else
//            rVlrTransf := CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat - CdsContasTransfDestino.FieldByName('SALDODISP').AsFloat;
            cCds.Edit;
            cCds.FieldByName(sCampoParaAtualizar).AsFloat := rVlrTransf ;
            cCds.Post;
          end
          else
          begin
            cCds.Edit;
            cCds.FieldByName(sCampoParaAtualizar).AsFloat := cCds.FieldByName(sCampoParaAtualizar + 'DESTINO').AsFloat ;
            cCds.Post;
          end;
        end;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
        //Atualiza o saldo da conta dentro do Cds
//        cCds.Edit;
//        cCds.FieldByName(sCampoParaAtualizar).AsFloat := cCds.FieldByName(sCampoParaAtualizar).AsFloat;
//        cCds.Post;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
      end;  // Edilaine Ferraresi - SOL 163908 / KTN 1403202

      cCds.Next;
  end;
//    isRateioNparaN := False;
{
  end
  else
    begin
       // ajusta valor na cdsMontagem
       CdsContasTransfDestino.first;
       while not CdsContasTransfDestino.eof do
       begin
         if Cds.Locate('IDCONTAORCAMEN',cCdsDestino.FieldByName('IDCONTAORCAMEN').AsString,[]) then
         begin
            cCds.Edit;
            cCds.FieldByName('VLRSOLICITADO').AsFloat := CdsContasTransfDestino.FieldByName('VALOR').AsFloat;
            cCds.Post;
         end;

         CdsContasTransfDestino.next;
       end;

    end;

  { // Edilaine - SOL 193146 / KTN 1940385 - comentado
  //rVlrAjustado := CalculaTotalCampoCds(cCds, 'VLRSOLICITADODESTINO');
  rVlrAjustado := CalculaTotalCampoCds(cCds, 'VLRSOLICITADO');
  VerificaRestoRateio2(cCds, rVlrAjustado, sCampoParaAtualizar, sCampoPeriodo, isOrigem);
  } // Edilaine - SOL 193146 / KTN 1940385 - fim

  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - remove o filtro
  AtivaFiltroDados(cCds, tfNone);
  cCds.EnableControls;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

end;

procedure TFrmTransfPorGrupoMT.VerificaRestoRateio2(CdsVerifica : TCMClientDataSet;
                                                    rVlrAjustado : Double;            
                                                    sCampoParaAtualizar,
                                                    sCampoPeriodo : String;
                                                    bIsOrigem : boolean   // Edilaine - SOL 193146 / KTN 1940385
                                                    );
var
   rVlrTransferido , rDiferenca, rTotal : double;
   contaMes : Integer;
   contaCta : integer;            // Edilaine - SOL 193146 / KTN 1940385
   rRateio, rValor  : currency;   // Edilaine - SOL 193146 / KTN 1940385
   sFiltro  : string;             // Edilaine - SOL 193146 / KTN 1940385
begin
   rDiferenca := 0;
   rTotal := edtVlrSolicitado.Value;
   // Edilaine - SOL 193146 / KTN 1940385
   if bIsOrigem then
      rDiferenca := RoundCm(rVlrAjustado,2) - RoundCM(rTotal,2) //CalculaTotalCampoCds(CdsVerifica, sCampoParaAtualizar);
   else
      rDiferenca := RoundCM(rTotal,2) - RoundCm(rVlrAjustado,2);//CalculaTotalCampoCds(CdsVerifica, sCampoParaAtualizar);
   // Edilaine - SOL 193146 / KTN 1940385 - fim

   if ((cboPeriodoOrigem.ItemIndex = 0) AND (cboPeriodoDestino.ItemIndex = 0)) then
   //rateia a diferença entre o primeiro relacionamento de cada período, de modo que fique o mais uniforme possível
   begin
       rDiferenca := rDiferenca * 100;
       contaMes   := 1;
       while Trunc(rDiferenca) < 0 do
       begin
            CdsVerifica.Filtered := False;
            //Brunno Mattos SOL 154957  KTN 1193108 - Troca 'PERIODOORIGEM =' por sCampoPeriodo
            CdsVerifica.Filter   := sCampoPeriodo + ' = ' + IntToStr(contaMes);
            CdsVerifica.Filtered := True;
            if not CdsVerifica.IsEmpty then
            begin
              CdsVerifica.First;
              CdsVerifica.Edit;
              //Brunno Mattos SOL 154957  KTN 1193108 Troca VLRSOLICITADO por sCampoParaAtualizar
              CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat := 0.01 + CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat;
              CdsVerifica.Post;
              rDiferenca   := rDiferenca + 1;
            end;

            if contaMes = 12 then
               contaMes := 1
            else
               contaMes := contaMes + 1;
       end;

       while Trunc(rDiferenca) > 0 do
       begin
            CdsVerifica.Filtered := False;
            //Brunno Mattos SOL 154957  KTN 1193108 - Troca 'PERIODOORIGEM =' por sCampoPeriodo
            CdsVerifica.Filter   := sCampoPeriodo + ' = ' + IntToStr(contaMes);
            CdsVerifica.Filtered := True;
            if not CdsVerifica.IsEmpty then
            begin
              CdsVerifica.First;
              CdsVerifica.Edit;
              //Brunno Mattos SOL 154957  KTN 1193108 Troca VLRSOLICITADO por sCampoParaAtualizar
              CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat := CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat - 0.01;
              CdsVerifica.Post;
              rDiferenca   := rDiferenca - 1;
            end;

            if contaMes = 12 then
               contaMes := 1
            else
               contaMes := contaMes + 1;
       end;
       CdsVerifica.Filtered := False;
   end
   else if (ABS(rDiferenca) > 0) then
   begin
     // Edilaine - SOL 193146 / KTN 1940385
     sFiltro := CdsVerifica.Filter;
     rRateio := 0;

     // filtra contas com LAN_DIF = S e rateia a diferença entre as contas
     CdsVerifica.Filtered := False;
     if sFiltro <> '' then
        CdsVerifica.Filter := sFiltro + ' and LANC_DIF = ''S'' '
     else
        CdsVerifica.Filter := ' LANC_DIF = ''S'' ';
     CdsVerifica.Filtered := true;
     CdsVerifica.recordcount;
     contaCta := CdsVerifica.recordcount;

     // se nao houver cabeça de centro de custo, rateia a diferença entre as contas ate esgotar
     if contaCta > 0 then
     begin
       rRateio := (rDiferenca / contaCta); // valor por conta
       rRateio := RoundCM(rRateio, 2);
     end
     else
       CdsVerifica.Filtered := False;

     rDiferenca := rDiferenca - (rRateio * contaCta); // resto da diferenca
     rDiferenca := RoundCM( rDiferenca, 2) ;
     rDiferenca := rDiferenca * 100;

     while not CdsVerifica.eof do
     begin
       rValor := CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat + rRateio;

       if abs(rDiferenca) > 0 then
       begin
         if rDiferenca > 0 then
         begin
           rValor := rValor + 0.01;
           rDiferenca := rDiferenca - 1;
         end
         else
         begin
           rValor := rValor - 0.01;
           rDiferenca := rDiferenca + 1;
         end;

       end;

       CdsVerifica.Edit;
       CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat := rValor;
       CdsVerifica.Post;

       CdsVerifica.next;
     end;
     // tira o filtro
     CdsVerifica.Filtered := false;
     CdsVerifica.Filter   := sFiltro;
     if sFiltro <> '' then
        CdsVerifica.Filtered := true;
     // Edilaine - SOL 193146 / KTN 1940385 - fim
   end;

   //joga a diferença de centavos no primeiro relacionamento
   {if (rDiferenca < 0) then
   begin
        CdsVerifica.First;
        CdsVerifica.Edit;
        CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat := rDiferenca + CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat;
        CdsVerifica.Post;
   end
   else
   begin
        CdsVerifica.First;
        CdsVerifica.Edit;
        CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat := CdsVerifica.FieldByName(sCampoParaAtualizar).AsFloat - rDiferenca;
        CdsVerifica.Post
   end;}

end;
//Brunno Mattos SOL 154957  KTN 1193108 fim

procedure TFrmTransfPorGrupoMT.MontaTransferencia;
begin
     AtivaFiltroDados(Cds, tfNone);  // Edilaine - SOL 193146 / KTN 1940385

     if cboTransfContaDestino.Text = '' then   // Edilaine - SOL 193146 / KTN 1940385
        CdsContasTransfDestino.first;

     while not CdsContasTransfDestino.Eof do
     begin
       // Edilaine - SOL 193146 / KTN 1940385 - comentado
       //CdsContasTransfOrigem.Locate('IDCONTAORCAMEN', CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString,[]);

       if not Cds.Locate('IDCONTADESTINO', CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString,[]) then
       begin

         // Inserindo registros para transferências...
         Cds.Append;

         Cds.FieldByName('FLGTIPOCONTA').AsString       := 'D'; //Edilaine Ferraresi - SOL 163908 / KTN 1403202 - inclui, flag para identificar a o tipo de conta;
         Cds.FieldByName('IDGRUPOORCORIGEM').AsInteger  := CdsContasTransfOrigem.FieldByName('IDGRUPOORCAMEN').AsInteger;
         Cds.FieldByName('IDGRUPOORCDESTINO').AsInteger := CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').AsInteger;
         Cds.FieldByName('GRUPODESTINO').AsString       := msGrupoDestino.ValoresChave[2] + '-' + msGrupoDestino.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
         Cds.FieldByName('EXERCICIODESTINO').AsString   := CdsContasTransfDestino.FieldByName('EXERCICIO').AsString;//edtExercTransfDestino.Text;
         Cds.FieldByName('PERIODODESTINO').AsString     := CdsContasTransfDestino.FieldByName('PERIODO').AsString;//edtPerTransfDestino.Text;  xxxxxx
//         Cds.FieldByName('PERIODODESTINO').AsString     := edtPerTransfDestino.Text;
         Cds.FieldByName('IDPESSOA').AsFloat            := Sistema.IdEmpresa;
         Cds.FieldByName('GRUPOORIGEM').AsString        := msGrupoOrigem.ValoresChave[2] + '-' + msGrupoOrigem.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
         Cds.FieldByName('EXERCICIOORIGEM').AsString    := CdsContasTransfOrigem.FieldByName('EXERCICIO').AsString;//edtExercTransfOrigem.Text;
         Cds.FieldByName('PERIODOORIGEM').AsString      := CdsContasTransfOrigem.FieldByName('PERIODO').AsString;//edtPerTransfOrigem.Text;xxxxxxxx
//         Cds.FieldByName('PERIODOORIGEM').AsString      := edtPerTransfOrigem.Text;//edtPerTransfOrigem.Text;
         Cds.FieldByName('IDPLANOORCAMEN').AsInteger    := iIdPlanoOrcDest;   {Modulo.iPlanoOrc;}    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
         //Cds.FieldByName('IDCONTAORIGEM').AsString      := CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString; // Edilaine - SOL 193146 / KTN 1940385 - comentado
         Cds.FieldByName('IDCONTADESTINO').AsString     := CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString;//cboTransfContaDestino.LookupValue;
         Cds.FieldByName('OBSALTERORCAMEN').AsString    := mmObs.Lines.Text;
         //Brunno Mattos SOL 154957  KTN 1193108  "Cds.FieldByName('VLRSOLICITADO').AsFloat       := 0;"
         Cds.FieldByName('VLRSOLICITADO').AsFloat       := 0;//Será preenchido pela rotina CalculaRateioTransfMontagem
         Cds.FieldByName('DATAREFERENCIA').AsDateTime   := edtDataReferencia.Date;
         Cds.FieldByName('FLGTIPOALTER').AsString       := 'T';
         Cds.FieldByName('PLANOORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PLANO').AsString;
         Cds.FieldByName('PLANODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PLANO').AsString;
         Cds.FieldByName('PATROORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PATRO').AsString;
         Cds.FieldByName('PATRODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PATRO').AsString;
         Cds.FieldByName('CENTRESPORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTRORESPON').AsString;
         Cds.FieldByName('CENTRESPDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTRORESPON').AsString;
         Cds.FieldByName('CENTCUSTORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTROCUSTO').AsString;
         Cds.FieldByName('CENTCUSTDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTROCUSTO').AsString;

         // Edilaine Ferraresi - SOL 163908 / KTN 1403202
         Cds.FieldByName('ATIVPROJORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('ATIVPROJ').AsString;
         Cds.FieldByName('ATIVPROJDESTINO').AsString    := CdsContasTransfDestino.FieldByName('ATIVPROJ').AsString;
         Cds.FieldByName('PROGRAMAORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('PROGRAMA').AsString;
         Cds.FieldByName('PROGRAMADESTINO').AsString    := CdsContasTransfDestino.FieldByName('PROGRAMA').AsString;
         Cds.FieldByName('TIPODESPESAORIGEM').AsString  := CdsContasTransfOrigem.FieldByName('TIPODESPESA').AsString;
         Cds.FieldByName('TIPODESPESADESTINO').AsString := CdsContasTransfDestino.FieldByName('TIPODESPESA').AsString;
         // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

         //Ricardo de Freitas Araújo SOL 153918 KTN 1166699
         //Campos Virtuias para Cálculo de Rateio conforme Grupo Destino
         //Brunno Mattos SOL 154957  KTN 1193108 adiciona VLRORCADO
         Cds.FieldByName('VLRORCADO').AsFloat             :=  CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat;
         Cds.FieldByName('VALIDAR').AsString              := 'S';
         Cds.FieldByName('IDGRUPOORCAMEN').AsInteger      :=  CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').AsInteger;
         Cds.FieldByName('IDCONTAORCAMEN').AsString       :=  CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString;
         Cds.FieldByName('CODCENTROCUSTO').AsString       :=  CdsContasTransfDestino.FieldByName('CODCENTROCUSTO').AsString;
         Cds.FieldByName('EXERCICIO').AsString            :=  CdsContasTransfDestino.FieldByName('EXERCICIO').AsString;
         Cds.FieldByName('PERIODO').AsString              :=  CdsContasTransfDestino.FieldByName('PERIODO').AsString;
//         Cds.FieldByName('PERIODO').AsString              :=  edtPerTransfDestino.Text;                            xxxxxxxxx
         Cds.FieldByName('IDPLANOPREV').AsInteger         :=  CdsContasTransfDestino.FieldByName('IDPLANOPREV').AsInteger;
         Cds.FieldByName('IDPATRO').AsInteger             :=  CdsContasTransfDestino.FieldByName('IDPATRO').AsInteger;
         Cds.FieldByName('IDCRITERIORATORC').AsInteger    :=  CdsRatCriter.FieldByName('IDCRITERIORATORC').AsInteger;
         Cds.FieldByName('NOMECRITERIO').AsString         :=  CdsRatCriter.FieldByName('DESCRICAO').AsString;
         //Ricardo de Freitas Araújo SOL 153918 KTN 1166699 - Fim

         // Edilaine - SOL 193146 / KTN 1940385
         Cds.FieldByName('SBDESTINO').AsString            :=  CdsContasTransfDestino.FieldByname('SUBDESPESA').AsString;

         // Edilaine - SOL 190488 / KTN 1909246
         Cds.FieldByName('IDDESPESAORCORIGEM').AsInteger  := -1;  //ParamEntEsp_Origem.Parametros.iIdSubDespesa;
//         Cds.FieldByName('IDDESPESAORCDESTINO').AsInteger := ParamEntEsp_Destino.Parametros.iIdSubDespesa;
         Cds.FieldByName('IDDESPESAORCDESTINO').AsInteger := CdsContasTransfDestino.FieldByName('IDDESPESAORC').AsInteger;
         // Edilaine - SOL 190488 / KTN 1909246 - fim

         Cds.Post;

         // Edilaine - SOL 193146 / KTN 1940385
         CdsContasTransfDestino.edit;
         CdsContasTransfDestino.FieldByName('SELECIONADO').AsString := 'N';
         CdsContasTransfDestino.Post;
         // Edilaine - SOL 193146 / KTN 1940385 - fim
       end;

       if cboTransfContaDestino.Text <> '' then   // Edilaine - SOL 193146 / KTN 1940385
          CdsContasTransfDestino.last;

       CdsContasTransfDestino.Next;
     end;

     if cboTransfContaOrigem.Text = '' then   // Edilaine - SOL 193146 / KTN 1940385
        CdsContasTransfOrigem.first;

     // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - separando dados de origem e destino
     while not CdsContasTransfOrigem.Eof do
     begin
//       CdsContasTransfDestino.Locate('IDCONTAORCAMEN', CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString,[]);

       if not Cds.Locate('IDCONTAORIGEM;IDDESPESAORCORIGEM', VarArrayOf([CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString,
       CdsContasTransfOrigem.FieldByName('IDDESPESAORC').AsString]),[]) then
       begin

         // Inserindo registros para transferências...
         Cds.Append;

         Cds.FieldByName('FLGTIPOCONTA').AsString       := 'O'; //Edilaine Ferraresi - SOL 163908 / KTN 1403202 - inclui, flag para identificar a o tipo de conta;
         Cds.FieldByName('IDGRUPOORCORIGEM').AsInteger  := CdsContasTransfOrigem.FieldByName('IDGRUPOORCAMEN').AsInteger;
         Cds.FieldByName('IDGRUPOORCDESTINO').AsInteger := CdsContasTransfDestino.FieldByName('IDGRUPOORCAMEN').AsInteger;
         Cds.FieldByName('GRUPODESTINO').AsString       := msGrupoDestino.ValoresChave[2] + '-' + msGrupoDestino.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
         Cds.FieldByName('EXERCICIODESTINO').AsString   := CdsContasTransfDestino.FieldByName('EXERCICIO').AsString;//edtExercTransfDestino.Text;
         Cds.FieldByName('PERIODODESTINO').AsString     := CdsContasTransfDestino.FieldByName('PERIODO').AsString;//edtPerTransfDestino.Text;xxxxxx
//         Cds.FieldByName('PERIODODESTINO').AsString     := edtPerTransfDestino.Text;
         Cds.FieldByName('IDPESSOA').AsFloat            := Sistema.IdEmpresa;
         Cds.FieldByName('GRUPOORIGEM').AsString        := msGrupoOrigem.ValoresChave[2] + '-' + msGrupoOrigem.ValoresChave[1]; //Brunno Mattos - KTN 1146873 - SOL 152922 inclui
         Cds.FieldByName('EXERCICIOORIGEM').AsString    := CdsContasTransfOrigem.FieldByName('EXERCICIO').AsString;//edtExercTransfOrigem.Text;
         Cds.FieldByName('PERIODOORIGEM').AsString      := CdsContasTransfOrigem.FieldByName('PERIODO').AsString;//edtPerTransfOrigem.Text;xxxxxxx
//         Cds.FieldByName('PERIODOORIGEM').AsString      := edtPerTransfOrigem.Text;
         Cds.FieldByName('IDPLANOORCAMEN').AsInteger    := iIdPlanoOrcOri;   {Modulo.iPlanoOrc;}    // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974
         Cds.FieldByName('IDCONTAORIGEM').AsString      := CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString; //cboTransfContaOrigem.LookupValue;
         //Cds.FieldByName('IDCONTADESTINO').AsString     := CdsContasTransfDestino.FieldByName('IDCONTAORCAMEN').AsString;  / Edilaine - SOL 193146 / KTN 1940385 - comentado
         Cds.FieldByName('OBSALTERORCAMEN').AsString    := mmObs.Lines.Text;
         Cds.FieldByName('VLRSOLICITADO').AsFloat       := 0; //Será preenchido pela rotina CalculaRateioTransfMontagem
         Cds.FieldByName('DATAREFERENCIA').AsDateTime   := edtDataReferencia.Date;
         Cds.FieldByName('FLGTIPOALTER').AsString       := 'T';
         Cds.FieldByName('PLANOORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PLANO').AsString;
         Cds.FieldByName('PLANODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PLANO').AsString;
         Cds.FieldByName('PATROORIGEM').AsString        := CdsContasTransfOrigem.FieldByName('PATRO').AsString;
         Cds.FieldByName('PATRODESTINO').AsString       := CdsContasTransfDestino.FieldByName('PATRO').AsString;
         Cds.FieldByName('CENTRESPORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTRORESPON').AsString;
         Cds.FieldByName('CENTRESPDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTRORESPON').AsString;
         Cds.FieldByName('CENTCUSTORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('CENTROCUSTO').AsString;
         Cds.FieldByName('CENTCUSTDESTINO').AsString    := CdsContasTransfDestino.FieldByName('CENTROCUSTO').AsString;

         Cds.FieldByName('ATIVPROJORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('ATIVPROJ').AsString;
         Cds.FieldByName('ATIVPROJDESTINO').AsString    := CdsContasTransfDestino.FieldByName('ATIVPROJ').AsString;
         Cds.FieldByName('PROGRAMAORIGEM').AsString     := CdsContasTransfOrigem.FieldByName('PROGRAMA').AsString;
         Cds.FieldByName('PROGRAMADESTINO').AsString    := CdsContasTransfDestino.FieldByName('PROGRAMA').AsString;
         Cds.FieldByName('TIPODESPESAORIGEM').AsString  := CdsContasTransfOrigem.FieldByName('TIPODESPESA').AsString;
         Cds.FieldByName('TIPODESPESADESTINO').AsString := CdsContasTransfDestino.FieldByName('TIPODESPESA').AsString;

         Cds.FieldByName('VLRORCADO').AsFloat             :=  CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat;
         Cds.FieldByName('VALIDAR').AsString              := 'S';
         Cds.FieldByName('IDGRUPOORCAMEN').AsInteger      :=  CdsContasTransfOrigem.FieldByName('IDGRUPOORCAMEN').AsInteger;
         Cds.FieldByName('IDCONTAORCAMEN').AsString       :=  CdsContasTransfOrigem.FieldByName('IDCONTAORCAMEN').AsString;
         Cds.FieldByName('CODCENTROCUSTO').AsString       :=  CdsContasTransfOrigem.FieldByName('CODCENTROCUSTO').AsString;
         Cds.FieldByName('EXERCICIO').AsString            :=  CdsContasTransfOrigem.FieldByName('EXERCICIO').AsString;
         Cds.FieldByName('PERIODO').AsString              :=  CdsContasTransfOrigem.FieldByName('PERIODO').AsString;
//         Cds.FieldByName('PERIODO').AsString              :=  edtPerTransfOrigem.Text;
         Cds.FieldByName('IDPLANOPREV').AsInteger         :=  CdsContasTransfOrigem.FieldByName('IDPLANOPREV').AsInteger;
         Cds.FieldByName('IDPATRO').AsInteger             :=  CdsContasTransfOrigem.FieldByName('IDPATRO').AsInteger;
         Cds.FieldByName('IDCRITERIORATORC').AsInteger    :=  CdsRatCriter.FieldByName('IDCRITERIORATORC').AsInteger;
         Cds.FieldByName('NOMECRITERIO').AsString         :=  CdsRatCriter.FieldByName('DESCRICAO').AsString;

         // Edilaine - SOL 190488 / KTN 1909246
//         Cds.FieldByName('IDDESPESAORCORIGEM').AsInteger  := ParamEntEsp_Origem.Parametros.iIdSubDespesa;xxxxxxx
         Cds.FieldByName('IDDESPESAORCORIGEM').AsInteger  := CdsContasTransfOrigem.FieldByName('IDDESPESAORC').AsInteger;
         Cds.FieldByName('IDDESPESAORCDESTINO').AsInteger := -1;  //ParamEntEsp_Destino.Parametros.iIdSubDespesa;
         // Edilaine - SOL 190488 / KTN 1909246 - fim

         // Edilaine - SOL 193146 / KTN 1940385
         Cds.FieldByName('SBORIGEM').AsString             :=  CdsContasTransfOrigem.FieldByname('SUBDESPESA').AsString;

         Cds.Post;

         // Edilaine - SOL 193146 / KTN 1940385
         CdsContasTransfOrigem.edit;
         CdsContasTransfOrigem.FieldByName('SELECIONADO').AsString := 'N';
         CdsContasTransfOrigem.Post;
         // Edilaine - SOL 193146 / KTN 1940385 - fim
       end;

       if cboTransfContaOrigem.Text <> '' then   // Edilaine - SOL 193146 / KTN 1940385
          CdsContasTransfOrigem.last;

       CdsContasTransfOrigem.Next;
     end;
     // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  // Edilaine - SOL 193146 / KTN 1940385
  AtivaFiltroDados(Cds, tfNone);

end;

procedure TFrmTransfPorGrupoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  LimpaControles;
end;


// Edilaine Ferraresi - SOL 163908 / KTN 1403202
procedure TFrmTransfPorGrupoMT.TrocaCampoGrid(var wwGrid : TwwDBGrid; OldCampo, NewCampo, NewLabel : String);
var
  lFind : boolean;
  PosTab1 : integer;
  PosTab2 : integer;
  i : integer;
begin
{ ************************* HIDE COLUMNS ON  TwwDBGRID *************************

If UseTFields is False, manipulate the Selected : TStrings property.

To 'hide' a field:

  Search for the field in the Selected : TStrings property and .Delete it.

To Add a field:

  It is necessary to have a dataset open and the grid connected to it.
  Also, the fields will only appear in the grid if they exist in the
  table, unless they are calculated or lookup fields.

  The format of the Selected : TStrings property is:

  tab delimited string....
  fieldname,fieldwidth,displaylabel,readonly,groupname

To Add a new one:

  Selected.add('Customer No'+#9+'15'+#9+'Customer No'+#9+'F'+#9+'GroupName');

To change the title:

  Find the string beginning with  '<fieldname>'+#9
  and replace the entire string with the same string with the new title.
  This ensures that the groupname is not lost.
}

  with wwGrid do
  begin
    with Selected do
    begin
      i := 0;
      lFind := false;
      while (i <= Pred(Count)) and (not lFind) do
      begin
        // fieldname,fieldwidth,displaylabel,readonly,groupname
        if Copy(Strings[i], 1, Length(OldCampo) + 1) = OldCampo + #9 then
        begin

          // 'GRUPODESTINO'#9'20'#9'Grupo de ~Destino');

          PosTab1 := Pos(#9, Strings[i]);
          PosTab2 := Pos(#9, Copy(Strings[i], PosTab1 + 1, Length(Strings[i])));

          // ShowMessage(Copy(Strings[i], 1, PosTab1 + PosTab2) + NewTitle + #9 + Copy(Strings[i], PosTab1 + PosTab2 + PosTab3 + 1, Length(Strings[i])));

          //ShowMessage(NewCampo + Copy(Strings[i], PosTab1, PosTab2) + #9 + NewLabel);

          Strings[i] := NewCampo + Copy(Strings[i], PosTab1, PosTab2) + #9 + NewLabel;

          ApplySelected();

          lFind := true;
        end;
        inc(i);
      end;
    end;
  end;

end;
// Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim


procedure TFrmTransfPorGrupoMT.pnlGridOrigemClick(Sender: TObject);
begin
  inherited;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  with pnlGridOrigem do
  begin
    BevelInner := bvNone;
    BevelOuter := bvRaised;
    color      := clNavy;
  end;

  with pnlGridDestino do
  begin
    BevelInner := bvLowered;
    BevelOuter := bvLowered;
    color      := clSilver; // $00D70000;
  end;

  // ESCONDE CAMPOS
  TransfGridAtivo := tfOrigem;

  AtivaFiltroDados(cds, tfOrigem);

  TrocaCampoGrid(gridMontagem, 'GRUPODESTINO'    , 'GRUPOORIGEM'    , 'Grupo de ~Origem');
  TrocaCampoGrid(gridMontagem, 'EXERCICIODESTINO', 'EXERCICIOORIGEM', 'Exercício~Origem');
  TrocaCampoGrid(gridMontagem, 'PERIODODESTINO'  , 'PERIODOORIGEM'  , 'Período~Origem');
  TrocaCampoGrid(gridMontagem, 'CENTRESPDESTINO' , 'CENTRESPORIGEM' , 'C.Respon.~Origem');
  TrocaCampoGrid(gridMontagem, 'CENTCUSTDESTINO' , 'CENTCUSTORIGEM' , 'C.Custo~Origem');
  TrocaCampoGrid(gridMontagem, 'SBDESTINO'       , 'SBORIGEM'       , 'Fornecedor / Sub-despesas');
  TrocaCampoGrid(gridMontagem, 'ATIVPROJDESTINO'     , 'ATIVPROJORIGEM'     , 'Atividade~Projeto');
  TrocaCampoGrid(gridMontagem, 'PROGRAMADESTINO'     , 'PROGRAMAORIGEM'     , 'Programa');
  TrocaCampoGrid(gridMontagem, 'TIPODESPESADESTINO'  , 'TIPODESPESAORIGEM'  , 'Tipo de~Despesa');
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  TrocaCampoGrid(gridMontagem, 'PLANODESTINO'  , 'PLANOORIGEM'  , 'Plano~Previdenciário'); // Edilaine - SOL 193146 / KTN 1940385
  TrocaCampoGrid(gridMontagem, 'PATRODESTINO'  , 'PATROORIGEM'  , 'Patrocinadora');        // Edilaine - SOL 193146 / KTN 1940385

end;


procedure TFrmTransfPorGrupoMT.pnlGridDestinoClick(Sender: TObject);
begin
  inherited;
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202
  with pnlGridDestino do
  begin
    BevelInner := bvNone;
    BevelOuter := bvRaised;
    color      := clNavy;
  end;

  with pnlGridOrigem do
  begin
    BevelInner := bvLowered;
    BevelOuter := bvLowered;
    color      := clSilver; // $00D70000;
  end;

  // ESCONDE CAMPOS
  TransfGridAtivo := tfDestino;

  AtivaFiltroDados(cds, tfDestino);

  TrocaCampoGrid(gridMontagem, 'GRUPOORIGEM'    , 'GRUPODESTINO'    , 'Grupo de ~Destino');
  TrocaCampoGrid(gridMontagem, 'EXERCICIOORIGEM', 'EXERCICIODESTINO', 'Exercício~Destino');
  TrocaCampoGrid(gridMontagem, 'PERIODOORIGEM'  , 'PERIODODESTINO'  , 'Período~Destino');
  TrocaCampoGrid(gridMontagem, 'CENTRESPORIGEM' , 'CENTRESPDESTINO' , 'C.Respon.~Destino');
  TrocaCampoGrid(gridMontagem, 'CENTCUSTORIGEM' , 'CENTCUSTDESTINO' , 'C.Custo~Destino');
  TrocaCampoGrid(gridMontagem, 'SBORIGEM'       , 'SBDESTINO'       , 'Fornecedor / Sub-despesas');
  TrocaCampoGrid(gridMontagem, 'ATIVPROJORIGEM'     , 'ATIVPROJDESTINO'     , 'Atividade~Projeto');
  TrocaCampoGrid(gridMontagem, 'PROGRAMAORIGEM'     , 'PROGRAMADESTINO'     , 'Programa');
  TrocaCampoGrid(gridMontagem, 'TIPODESPESAORIGEM'  , 'TIPODESPESADESTINO'  , 'Tipo de~Despesa');
  // Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim

  TrocaCampoGrid(gridMontagem, 'PLANOORIGEM'  , 'PLANODESTINO'  , 'Plano~Previdenciário');  // Edilaine - SOL 193146 / KTN 1940385
  TrocaCampoGrid(gridMontagem, 'PATROORIGEM'  , 'PATRODESTINO'  , 'Patrocinadora');         // Edilaine - SOL 193146 / KTN 1940385

  GridMontagemUpdateFooter(GridMontagem); // Edilaine - SOL 193146 / KTN 1940385
end;


// Edilaine Ferraresi - SOL 163908 / KTN 1403202
procedure TFrmTransfPorGrupoMT.AtivaFiltroDados(cCds : TCMClientDataSet; TipoDado : tTipoFiltro);
begin
  cCds.Filtered := false;
  if TipoDado = tfOrigem then
     cCds.Filter   := '(FLGTIPOCONTA = ''O'')'
  else if TipoDado = tfDestino then
     cCds.Filter   := '(FLGTIPOCONTA = ''D'')'
  else
     cCds.Filter   := '';

  if cCds.Filter <> '' then
     cCds.Filtered := true;
end;
// Edilaine Ferraresi - SOL 163908 / KTN 1403202 - fim


procedure TFrmTransfPorGrupoMT.btBuscFornOrigemClick(Sender: TObject);
begin
  inherited;
  msDespesaOrigem.Filtro.Clear;
  msDespesaOrigem.Filtro.Add('D.IDFORNECEDOR = P.IDPESSOA(+) ');

  if Trim(edtDescGrupoOrigem.text) <> '' then begin // Thiago Melo SOL  239565 PPM 519993
     msDespesaOrigem.Filtro.Add('D.IDGRUPOORCAMEN = '+Quotedstr( msGrupoOrigem.ValoresChave[0]) );
     msDespesaOrigem.Filtro.Add(' ( DECODE(D.FLGSTATUSDESPESA, '''', ''A'', D.FLGSTATUSDESPESA)) = ''A'''  ); // Thiago Melo SOL  239565 PPM 519993
  end; // Thiago Melo SOL  239565 PPM 519993



  if cboCentroCustoOrigem.LookupValue <> '' then   // listando despesas que tenham o c. custo selecionado
     msDespesaOrigem.Filtro.Add('(D.IDDESPESAORC in (SELECT DC.IDDESPESAORC FROM DESPESAORCXCCUSTO DC WHERE DC.CODCENTROCUSTO = '+QuotedStr(cboCentroCustoOrigem.LookupValue)+') )');

  msDespesaOrigem.Executar;
  Repaint;

  edtFornecedoresSubDespesasOrigem.text := '';
  If msDespesaOrigem.RetornouValor Then
  begin
    if msDespesaOrigem.ValoresChave[3] <> '' then
       edtFornecedoresSubDespesasOrigem.text := msDespesaOrigem.ValoresChave[3] + '/';
    edtFornecedoresSubDespesasOrigem.text := edtFornecedoresSubDespesasOrigem.text + msDespesaOrigem.ValoresChave[2];

    {
    if not cds.IsEmpty then
       Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);
    }
  end;
end;

procedure TFrmTransfPorGrupoMT.btBuscFornDestinoClick(Sender: TObject);
begin
  inherited;
  msDespesaDestino.Filtro.Clear;
  msDespesaDestino.Filtro.Add('D.IDFORNECEDOR = P.IDPESSOA(+) ');

  if Trim(edtDescGrupoDestino.text) <> '' then begin  // Thiago Melo SOL  239565 PPM 519993
     msDespesaDestino.Filtro.Add('D.IDGRUPOORCAMEN = '+Quotedstr( msGrupoDestino.ValoresChave[0]) );
     msDespesaDestino.Filtro.Add(' ( DECODE(D.FLGSTATUSDESPESA, '''', ''A'', D.FLGSTATUSDESPESA)) = ''A'''  ); // Thiago Melo SOL  239565 PPM 519993
  end; // Thiago Melo SOL  239565 PPM 519993

  if cboCentroCustoDestino.LookupValue <> '' then   // listando despesas que tenham o c. custo selecionado
     msDespesaDestino.Filtro.Add('(D.IDDESPESAORC in (SELECT DC.IDDESPESAORC FROM DESPESAORCXCCUSTO DC WHERE DC.CODCENTROCUSTO = '+QuotedStr(cboCentroCustoDestino.LookupValue)+') )');

  msDespesaDestino.Executar;
  Repaint;

  edtFornecedoresSubDespesasDestino.text := '';
  If msDespesaDestino.RetornouValor Then
  begin
    if msDespesaDestino.ValoresChave[3] <> '' then
       edtFornecedoresSubDespesasDestino.text := msDespesaDestino.ValoresChave[3] + '/';
    edtFornecedoresSubDespesasDestino.text := edtFornecedoresSubDespesasDestino.text + msDespesaDestino.ValoresChave[2];

    {
    if not cds.IsEmpty then
       Cds.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(-1,-1,-1,-1,-1,-1,-1);
    }
  end;
end;

procedure TFrmTransfPorGrupoMT.FormDestroy(Sender: TObject);
begin
  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  FreeAndNil(ParamEntEsp_Origem  );
  FreeAndNil(ParamEntEsp_Destino );
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184

  inherited;
end;

procedure TFrmTransfPorGrupoMT.SetGrupo(Var AParamEntEsp: TParamEntradaEspecial; AMsGrupo : TMontaSelect);
begin
  // VANDER SOL 172384/9361 KINTANA 1653184
  With AParamEntEsp.GrupoOrcamentario do
  Begin
    Id   := StrToIntDef(AmsGrupo.ValoresChave[0], -1);
    Nome := AmsGrupo.ValoresChave[1];
    Cod  := AmsGrupo.ValoresChave[2];
    FlgTransf := AmsGrupo.ValoresChave[4];  // Edilaine - SOL 190311 / KTN 1799290
  End;
  //
end;

procedure TFrmTransfPorGrupoMT.tbsMontaTransfShow(Sender: TObject);
Var
  CodOrigem,
  CodDestino : String[3];

  Procedure ValidaGrupo(Var AParamEntEsp: TParamEntradaEspecial; ATbsGrupo : TTabSheet);
  Begin
    if AParamEntEsp.GrupoOrcamentario.id < 1 Then
    Begin
      //PageControl.ActivePageIndex := ATbsGrupo.PageIndex;
      Raise EMontagemTransferencia.Create('Informe o Grupo!');
    End;

  End;
begin
  inherited;

  //INICIO - VANDER SOL 172384/9361 KINTANA 1653184
  Try
    //Marcio Sanches Spinosa SOL 210745 Kintana 2030612 - Inicio
    if (CmeCadastro.Operacao = opInserir) then
    begin
      ValidaGrupo(ParamEntEsp_Origem,  tbsOrigem);
      ValidaGrupo(ParamEntEsp_Destino, tbsDestino);
    end;
    //Marcio Sanches Spinosa SOL 210745 Kintana 2030612 - Fim

    CodOrigem  := ParamEntEsp_Origem.GrupoOrcamentario.Cod;
    CodDestino := ParamEntEsp_Destino.GrupoOrcamentario.Cod;

    // Edilaine - SOL 190311 / KTN 1799290 - alteração da regra permitindo transferência entre grupos diferentes

    // se 1o e 2o dígitos forem diferentes não permite transferência entre os grupos
    if (Copy(CodOrigem,1,2) <> Copy(CodDestino,1,2)) then
    begin
      Raise EMontagemTransferencia.Create('Contas orçamentárias possuem naturezas distintas!');
    end;

    // se 3o dígito for diferente efetuar verificação pelo campo FLGTRANSFORIGDIF
    if (Copy(CodOrigem,3,1) <> Copy(CodDestino,3,1)) then
    begin
      // Origem e Destino não permitem transferência
      if (ParamEntEsp_Origem.GrupoOrcamentario.FlgTransf = 'N') and
         (ParamEntEsp_Destino.GrupoOrcamentario.FlgTransf = 'N') then
      begin
        Raise EMontagemTransferencia.Create('As contas de Origem e Destino não permitem a transferência entre os grupos orçamentários!');
      end
      // Origem não permite transferência
      else if (ParamEntEsp_Origem.GrupoOrcamentario.FlgTransf = 'N') then
      begin
        Raise EMontagemTransferencia.Create('A conta de Origem não permite a transferência entre os grupos orçamentários!');
      end
      // Destino não permite transferência
      else if (ParamEntEsp_Destino.GrupoOrcamentario.FlgTransf = 'N') then
      begin
        Raise EMontagemTransferencia.Create('A conta de Destino não permite a transferência entre os grupos orçamentários!');
      end;
    end;

   // Não permitir a transferência de uma conta de origem para uma conta de destino que sejam iguais
   if (Modulo.sPermiteTransf = 'N') and ((Copy(CodOrigem,3,1) <> Copy(CodDestino,3,1))) then
   begin
      Raise EMontagemTransferencia.Create('Não é possível fazer transferência entre grupos diferentes, conforme parâmetros do sistema!');
   end;

    { comentário pela mudança na regra
    if ((Trim(CodOrigem) <> Trim(CodDestino))                 OR
        (Length(CodOrigem ) <> 3)                             OR
        (Length(CodDestino) <> 3)           )                 and
        (NOT CtrlTransacoesPorGrupo.UsuarioCOPEF(Sistema.IdUsuario)) Then
    Begin
       PageControl.ActivePageIndex := tbsOrigem.TabIndex;
       Raise EMontagemTransferencia.Create( 'Não é permitida a Transferência entre Grupos Orçamentários de Origens Diferentes - '
                                          + 'Favor entrar em contato com a área responsável pelo Orçamento da Fundação.');
    End; }
    // Edilaine - SOL 190311 / KTN 1799290 - fim

    tbsMontaTransf.Enabled := True;
    pnlMontaTransf.Enabled := true;  // Edilaine - SOL 190488 / KTN 1909246
    pnl_Bottom.enabled     := true;  // Edilaine - SOL 190488 / KTN 1909246

  Except
    on EMontTransf : EMontagemTransferencia do
    Begin
      Application.MessageBox(PChar(EMontTransf.Message),
                             PChar(tbsMontaTransf.Caption),
                             MB_ICONERROR + MB_OK);

      tbsMontaTransf.Enabled := False;
    End;

    On E:Exception do RAISE;
  End;
  //FIM    - VANDER SOL 172384/9361 KINTANA 1653184
End;


// Edilaine - SOL 193146 / KTN 1940385
procedure TFrmTransfPorGrupoMT.FiltraSelecionados(bFiltra: boolean);
begin
  if bFiltra then
  begin
    CdsContasTransfOrigem.Filtered  := false;

    if (CdsContasTransfOrigem.Filter <> EmptyStr) then
      CdsContasTransfOrigem.Filter    := CdsContasTransfOrigem.Filter  + ' AND SELECIONADO = ''N'' '
    else
      CdsContasTransfOrigem.Filter    := 'SELECIONADO = ''N'' ';

    CdsContasTransfOrigem.Filtered  := true;

    CdsContasTransfDestino.Filtered := false;

    if (CdsContasTransfDestino.Filter <> EmptyStr) then
      CdsContasTransfDestino.Filter   := CdsContasTransfDestino.Filter  + ' AND SELECIONADO = ''N'' '
    else
      CdsContasTransfDestino.Filter   := 'SELECIONADO = ''N'' ';

    CdsContasTransfDestino.Filtered := true;
  end
  else
  begin
    CdsContasTransfOrigem.Filtered  := false;
    CdsContasTransfOrigem.Filter    := '';

    CdsContasTransfDestino.Filtered := false;
    CdsContasTransfDestino.Filter   := '';
  end;
end;

// Edilaine - SOL 193146 / KTN 1940385
procedure TFrmTransfPorGrupoMT.LimpaTransferencia(TipoDado: tTipoFiltro);
begin
  AtivaFiltroDados(cds, TipoDado);

  cds.First;
  cds.DisableControls;
  while not cds.isEmpty do
  begin
    TransfereValor(TipoDado);
    cds.delete;
  end;
  Cds.EnableControls;
  AtivaFiltroDados(cds, tfNone);
end;


// Edilaine - SOL 193146 / KTN 1940385
procedure TFrmTransfPorGrupoMT.TransfereValor(TipoDado: tTipoFiltro);
begin
  // Repõe o valor retirado da conta de origem
  if TipoDado = tfOrigem then
    if CdsContasTransfOrigem.Locate('IDCONTAORCAMEN',Cds.FieldByName('IDCONTAORIGEM').AsString,[]) then
    begin
       CdsContasTransfOrigem.Edit;
       CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat := CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat + Cds.FieldByName('VLRSOLICITADO').AsFloat;
       CdsContasTransfOrigem.Post;
    end;

  // Retira o valor inserido na conta de destino
  if TipoDado = tfDestino then
    if CdsContasTransfDestino.Locate('IDCONTAORCAMEN',Cds.FieldByName('IDCONTADESTINO').AsString,[]) then
    begin
       CdsContasTransfDestino.Edit;
       CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat := CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat - Cds.FieldByName('VLRSOLICITADO').AsFloat;
       CdsContasTransfDestino.Post;
    end;
end;


// Edilaine - SOL 193146 / KTN 1940385
procedure TFrmTransfPorGrupoMT.CalculaRateioTransfUmparaUm(sCtaOrigem, sCtaDestino : string);
var
  rVlrTransf : currency;
begin
  rVlrTransf := edtVlrSolicitado.value;

  // altera valores da conta origem
  if CdsContasTransfOrigem.Locate('IDCONTAORCAMEN', sCtaOrigem, []) then
  begin
    CdsContasTransfOrigem.Edit;
    CdsContasTransfOrigem.FieldByName('VLRORCADO').AsFloat     := CdsContasTransfOrigem.FieldByName('VLRORCADO').AsCurrency - rVlrTransf;
    CdsContasTransfOrigem.FieldByName('VLRSOLICITADO').AsFloat := CdsContasTransfOrigem.FieldByName('VLRSOLICITADO').AsCurrency + (rVlrTransf * -1);
    CdsContasTransfOrigem.Post;
  end;

  // altera valores da conta destino
  CdsContasTransfDestino.Filtered := False;
  if CdsContasTransfDestino.Locate('IDCONTAORCAMEN', sCtaDestino, []) then
  begin
    CdsContasTransfDestino.Edit;
    CdsContasTransfDestino.FieldByName('VLRORCADO').AsFloat     := CdsContasTransfDestino.FieldByName('VLRORCADO').AsCurrency + rVlrTransf;
    CdsContasTransfDestino.FieldByName('VLRSOLICITADO').AsFloat := CdsContasTransfDestino.FieldByName('VLRSOLICITADO').AsCurrency + rVlrTransf;
    CdsContasTransfDestino.Post;
  end;
  CdsContasTransfDestino.Filtered := True;

  Cds.Filtered := False;       // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524
  if Cds.Locate('IDCONTAORCAMEN;FLGTIPOCONTA', VarArrayOf([sCtaOrigem, 'O']),[]) then
  begin
    Cds.Edit;
    Cds.FieldByName('VLRSOLICITADOORIGEM').AsFloat := rVlrTransf * -1;
    Cds.FieldByName('VLRSOLICITADO').AsCurrency    := Cds.FieldByName('VLRSOLICITADO').AsCurrency + rVlrTransf;
    Cds.Post;
  end;

  //Cds.Filtered := False;     // Edilaine Ferraresi -  SOL 221865-15668 / KTN 2058524 - comentado
  if Cds.Locate('IDCONTAORCAMEN;FLGTIPOCONTA', VarArrayOf([sCtaDestino, 'D']),[]) then
  begin
    Cds.Edit;
    Cds.FieldByName('VLRSOLICITADOORIGEM').AsFloat := rVlrTransf;
    Cds.FieldByName('VLRSOLICITADO').AsCurrency    := Cds.FieldByName('VLRSOLICITADO').AsCurrency + rVlrTransf;
    Cds.Post;
  end;
  Cds.Filtered := True;

end;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858
procedure TFrmTransfPorGrupoMT.AtualizaValoresCds;
begin
  cds.Filtered := False;
  cds.Filter   := 'FLGTIPOCONTA = ''O''';
  Cds.Filtered := True;

  cds.First;
  if (Cds.RecordCount > 0) then
  begin
    while not Cds.Eof do
    begin
      if CdsContasTransfOrigem.Locate('IDCONTAORCAMEN', Cds.FieldByName('IDCONTAORIGEM').AsString, []) then
        if (CdsContasTransfOrigem.FieldByName('VLRSOLICITADO').Value <> (Cds.FieldByName('VLRSOLICITADO').Value * -1)) then
        begin
           CdsContasTransfOrigem.Edit;
           CdsContasTransfOrigem.FieldByName('VLRSOLICITADO').Value := RoundCM((Cds.FieldByName('VLRSOLICITADO').Value * -1), 2);
           CdsContasTransfOrigem.Post;
        end;
      Cds.Next;
    end;
  end;

  cds.Filtered := False;
  cds.Filter   := 'FLGTIPOCONTA = ''D''';
  CDS.Filtered := True;

  cds.First;
  if (Cds.RecordCount > 0) then
  begin
    while not cds.Eof do
    begin
      if (CdsContasTransfDestino.Locate('IDCONTAORCAMEN', cds.FieldByName('IDCONTADESTINO').AsString, [])) then
        if (CdsContasTransfDestino.FieldByName('VLRSOLICITADO').Value <> Cds.FieldByName('VLRSOLICITADO').Value) then
        begin
          CdsContasTransfDestino.Edit;
          CdsContasTransfDestino.FieldByName('VLRSOLICITADO').value := RoundCM(Cds.FieldByName('VLRSOLICITADO').Value, 2);
          CdsContasTransfDestino.Post;
        end;

        cds.Next;
    end;
  end;

   cds.Filtered := False;
end;
//Marcio Sanches Spinosa SOL 206192 Kintana 1996858



procedure TFrmTransfPorGrupoMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
//xxxxxx
  cboPeriodoOrigem.ItemIndex := StrToInt(FormatDateTime('MM', Now));
  cboPeriodoDestino.ItemIndex := StrToInt(FormatDateTime('MM', Now));
  cboPeriodoOrigem.Enabled := False;
  cboPeriodoDestino.Enabled := False;
//xxxxxx
end;

//Marcio Sanches Spinosa SOL 219320 Kintana 2051323 - Inicio
procedure TFrmTransfPorGrupoMT.cboCentroCustoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not (CdsCCustoOrigem.FieldByName('IDPROGRAMAORCAMEN').isNull)
  and (cboCentroCustoOrigem.LookupValue <> EmptyStr) then
  begin
    cboProgOrigem.LookupValue := CdsCCustoOrigem.FieldByName('IDPROGRAMAORCAMEN').AsString;
    cboProgOrigem.DisplayValue := CdsCCustoOrigem.FieldByName('DESCRICAO_PROGRAMAORCAMEN').AsString
  end;
end;

procedure TFrmTransfPorGrupoMT.cboCentroCustoDestinoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
    if not CdsCCustoDestino.FieldByName('IDPROGRAMAORCAMEN').isNull
    and (cboCentroCustoDestino.LookupValue <> EmptyStr) then
  begin
    cboProgDestino.LookupValue := CdsCCustoDestino.FieldByName('IDPROGRAMAORCAMEN').AsString;
    cboProgDestino.DisplayValue := CdsCCustoDestino.FieldByName('DESCRICAO_PROGRAMAORCAMEN').AsString
  end;
end;
//Marcio Sanches Spinosa SOL 219320 Kintana 2051323 - Fim

//Marcio Sanches Spinosa SOL 219324 Kintana 2051326 - Inicio
procedure TFrmTransfPorGrupoMT.VerificaRateioMesmoCentroCusto(oCdsOrigem,
  oCdsDestino: TCMClientDataSet);
var ssql : string;
    aAjustaCdsDestinoRateioIDCONTAORCAMEN : array of string;
    aAjustaCdsDestinoRateioIDDESPESAORCDESTINO : array of string;
    i : Integer;
begin
  i := 0;
  ssql := EmptyStr;
  oCdsOrigem.First;
  oCdsDestino.First;

  oCdsDestino.Filtered := False;
  oCdsDestino.Filter := 'FLGTIPOCONTA = ''O''';
  oCdsDestino.Filtered := True;

  SetLength(aAjustaCdsDestinoRateioIDCONTAORCAMEN, oCdsDestino.RecordCount);
  SetLength(aAjustaCdsDestinoRateioIDDESPESAORCDESTINO, oCdsDestino.RecordCount);

  while not oCdsDestino.Eof do
  begin
    if (oCdsOrigem.Locate('IDCONTAORCAMEN;IDDESPESAORC', VarArrayOf([
                                                         oCdsDestino.FieldByName('IDCONTAORCAMEN').AsString,
                                                         oCdsDestino.FieldByName('IDDESPESAORCORIGEM').AsString]), [])) then
    begin
      ssql := ssql + QuotedStr(oCdsDestino.FieldByName('IDCONTAORCAMEN').AsString )+ ',';
      aAjustaCdsDestinoRateioIDCONTAORCAMEN[i] :=  oCdsDestino.FieldByName('IDCONTAORCAMEN').AsString;
      aAjustaCdsDestinoRateioIDDESPESAORCDESTINO[i] :=  oCdsDestino.FieldByName('IDDESPESAORCORIGEM').AsString;
    end;
    oCdsDestino.Next;
    Inc(i);
  end;

   if (Trim(ssql) <> EmptyStr) then
   begin
     oCdsOrigem.Filtered := false;
     oCdsOrigem.Filter := ' NOT ( IDCONTAORCAMEN IN (' + Copy(ssql, 0, Length(ssql) - 1) + ' )) ';
     oCdsOrigem.Filtered := True;
   end;

   for i := 0 to Length(aAjustaCdsDestinoRateioIDCONTAORCAMEN) - 1 do
   begin
     if (aAjustaCdsDestinoRateioIDCONTAORCAMEN[i] <> EmptyStr) then
     begin
        oCdsDestino.Filtered := False;

       if (oCdsDestino.Locate('IDCONTAORCAMEN;IDDESPESAORCDESTINO;FLGTIPOCONTA',
           VarArrayOf([aAjustaCdsDestinoRateioIDCONTAORCAMEN[i], aAjustaCdsDestinoRateioIDDESPESAORCDESTINO[i], 'D']), [])) then
           oCdsDestino.Delete;
     end;
   end;


end;

//Marcio Sanches Spinosa SOL 217885 Kintana 2050643 - Inicio

procedure TFrmTransfPorGrupoMT.CarregaComboOrigemDestino;
begin
    cboTransfContaOrigem.Clear;
    cboTransfContaOrigem.LookupValue := EmptyStr;
    cboTransfContaOrigem.LookupValue  := aContaSelecionadaOrigem;

    cboTransfContaDestino.Clear;
    cboTransfContaDestino.LookupValue := EmptyStr;
    cboTransfContaDestino.LookupValue := aContaSelecionadaDestino;

    edtVlrSolicitado.Text := EmptyStr;
end;
//Marcio Sanches Spinosa SOL 217885 Kintana 2050643 - Fim


function TFrmTransfPorGrupoMT.RateioLinearNparaN(cCds  : TCMClientDataSet;
                                                  dValorRateio : Double;
                                                  sCampoAtualizar   : string) : Boolean;
var dValorRateado : CURRENCY;
    dValorAcumulado : CURRENCY;
begin
  try

     dValorAcumulado := 0;

     if cCds.RecordCount > 0 then
      dValorRateado := dValorRateio/ cCds.RecordCount
     else
     begin
//       Raise Exception.create('A conta destino não pode receber rateio, devido a mesma estar presente na origem!');  // Edilaine - SOL 221865-15668 / KTN 2058524
       LimparCds;
       ShowMessage('A conta destino não pode receber rateio, devido a mesma estar presente na origem!');
       Result := False;
       Exit;
     end;

     cCds.First;
     Cds.Filtered := False;
     Cds.Filter := 'FLGTIPOCONTA = ''D''';
     Cds.Filtered := True;
     isRateioNparaN := True;
     Cds.DisableControls;
     cCds.DisableControls;

     while not cCds.Eof do
     begin
       cCds.Edit;
       cCds.FieldByName(sCampoAtualizar).Value := TruncVal(dValorRateado, 2);
       cCds.Post;

       Cds.Edit;
       Cds.FieldByName(sCampoAtualizar + 'DESTINO').Value := TruncVal(dValorRateado, 2);
       Cds.Post;

       dValorAcumulado := dValorAcumulado + cCds.FieldByName(sCampoAtualizar).Value;
       cCds.Next;
       Cds.Next;
     end;

      dValorRateado := RoundCM(dValorRateio - dValorAcumulado,2);

      dValorRateio := 0;
      cCds.First;
      Cds.First;
      dValorRateado := (StrToFloat(FloatToStr(dValorRateado)));
      if (StrToFloat(FloatToStr(dValorRateado)) > 0) then
      begin

        while not cCds.Eof do
        begin
           dValorRateado := dValorRateado - 0.01;
           cCds.Edit;
           cCds.FieldByName(sCampoAtualizar).Value := cCds.FieldByName(sCampoAtualizar).Value + 0.01;
           cCds.Post;

           Cds.Edit;
           Cds.FieldByName(sCampoAtualizar + 'DESTINO').Value := Cds.FieldByName(sCampoAtualizar + 'DESTINO').Value + 0.01;
           Cds.Post;

           cCds.Next;
           Cds.Next;

           if (StrToFloat(FloatToStr(dValorRateado)) < 0.01) then
             Break;
        end;

         ccds.first;
         while not ccds.Eof do
         begin
              dValorRateio := dValorRateio + cCds.FieldByName(sCampoAtualizar).Value;
              ccds.Next;
         end;
  //        ShowMessage(FloatToStr(dValorRateio));


      end;

      Result := True;

  finally
    Cds.Filtered := False;
    Cds.EnableControls;
    cCds.EnableControls;
  end;
end;

procedure TFrmTransfPorGrupoMT.LimparCds;
begin
   Cds.EmptyDataSet;
   CdsContasTransfOrigem.EmptyDataSet;
   CdsContasTransfDestino.EmptyDataSet;
   CdsContasTransfOrigem.Data  := CdsContasOrigem.Data;
   CdsContasTransfDestino.Data := CdsContasDestino.Data;
   CdsContasTransfOrigem.Filtered := False;
   CdsContasTransfDestino.Filtered := False;
   isRateioNparaN := false;
end;
//Marcio Sanches Spinosa SOL 219324 Kintana 2051326 - Fim



procedure TFrmTransfPorGrupoMT.VerificaRateioNx1(oCds, oCdsOrigem : TCMClientDataSet);
var ssql : string;
    lstDestinoRateioIDCONTAORCAMEN : TStringList;
    lstDestinoRateioIDDESPESAORCDESTINO : TStringList;
    i : Integer;
begin
  i := 0;
  ssql := EmptyStr;
  oCds.First;
  oCdsOrigem.First;

  oCds.Filtered := False;
  oCds.Filter := 'FLGTIPOCONTA = ''D''';
  oCds.Filtered := True;

  try
    lstDestinoRateioIDCONTAORCAMEN := TStringList.create;
    lstDestinoRateioIDDESPESAORCDESTINO := TStringList.create;

    while not oCds.Eof do
    begin
      if (oCdsOrigem.Locate('IDCONTAORCAMEN;IDDESPESAORC', VarArrayOf([
                                                           oCds.FieldByName('IDCONTAORCAMEN').AsString,
                                                           oCds.FieldByName('IDDESPESAORCDESTINO').AsString]), [])) then
      begin
        ssql := ssql + QuotedStr(oCdsOrigem.FieldByName('IDCONTAORCAMEN').AsString )+ ',';

        lstDestinoRateioIDCONTAORCAMEN.Add(oCdsOrigem.FieldByName('IDCONTAORCAMEN').AsString);
        lstDestinoRateioIDDESPESAORCDESTINO.Add(oCdsOrigem.FieldByName('IDDESPESAORC').AsString);
      end;
      oCds.Next;
    end;

     if (Trim(ssql) <> EmptyStr) then
     begin
       oCdsOrigem.Filtered := false;
       oCdsOrigem.Filter := ' NOT ( IDCONTAORCAMEN IN (' + Copy(ssql, 0, Length(ssql) - 1) + ' )) ';
       oCdsOrigem.Filtered := True;
     end;

     for i := 0 to lstDestinoRateioIDCONTAORCAMEN.count-1 do
     begin
       oCds.Filtered := False;

       if (oCds.Locate('IDCONTAORCAMEN;IDDESPESAORCORIGEM;FLGTIPOCONTA',
          VarArrayOf([lstDestinoRateioIDCONTAORCAMEN.Strings[i], lstDestinoRateioIDDESPESAORCDESTINO.Strings[i], 'O']), [])) then
          oCds.Delete;
     end;
  finally
    lstDestinoRateioIDCONTAORCAMEN.Free;
    lstDestinoRateioIDDESPESAORCDESTINO.free;
  end;
end;

end.


