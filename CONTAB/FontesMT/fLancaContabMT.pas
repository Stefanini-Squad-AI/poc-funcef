unit fLancaContabMT;
{Rotina .....: CmeDetalheInsert
SOL..........: 117454
Data.........: 17/08/2021
Responsável..: Cássio Florencio Rovaroto
Descrição....: Inclusão de tipo de operação padrão, para lançamentos manuais.
****************************************************************************}
{Rotina .....: bbtnCancelarDetClick, bbtnVoltarDetClick
SOL..........: 190984
Kintana......: 1813669
Data.........: 02/10/2012
Responsável..: Edilaine Ferraresi
Descrição....: Botão imprimir não habilita após inclusão de item no detalhe
****************************************************************************}
{Rotina ......: CmeDetalheEdit(
SOL..........: 188991
Kintana......: 1783906
Data.........: 06/09/2012
Responsável..: Higor Nayde Ferreira
Descrição....: Possibilitar que o centro de custo passe ser usado pela conta.
****************************************************************************}
{Rotina ......: Imprimir
SOL..........: 184701
Kintana......: 1747036
Data.........: 27/08/2012
Responsável..: Felipe Azevedo dos Santos
Descrição....: Foi adicionado um botão de impressão para chamar o rela-
               tório de Aviso de Lançamentos como era feito pelo tela de
               Relátorios -> Consultas.
***********************************************************************}
{Rotina ......: MontaSelectAtivProj
SOL..........: 163982
Kintana......: 1404974
Data.........: 26/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi alterado o filtro desse componente para retornar
               apenas as atividades ativas.
***********************************************************************}
{ Autor.....: Arnaldo Vicente Scarin
 SOL.......: 131028
 Kintana...: 740201
 Data      : 18/02/2010
 Descrição : Correção dos componentes das contas contabeis que apresentavam
             erro quando o plano contabil não é setado antes da carga dos
             dados de lançamentos 
***********************************************************************}
{
Rotina............: CmeCadastroFind
N. Sol............: 128586
N. Kintana........: 690153
Data..............: 02/02/2009
Responsável.......: Marilza Colpani
Descrição.........: Correção do erro apresentado ao selecionar Sair da Busca.
}
{ Autor.....: Arnaldo Vicente Scarin
 SOL.......: 124568
 Kintana...: 633456
 Data      : 06/10/2009
 Descrição : Solicito que os lançamentos contábies manuais considerem a
             vigência do plano de contas e não o plano de contas ativo.
***********************************************************************}
{   
Analista : André Tavares
Data     : 15/11/2007
Pendência: 24892
Descrição: estava faltando preencher o campo "plano contábil" do cdsDet
}
(*==============================================================================
Analista : Marcus Oliveira
Data     : 10/10/2007
Pendência: 26535
Descrição: Adicionado o campo chave no montaselect, pois tem q retornar o idmodulo.
(*==============================================================================
Analista : Antonio Marcos (amf)
Data     : 02/08/2007
Pendência: 24589 - ajuste/implementação
Descrição: Adicionado um novo grid que reúne informações do lançamento e memória de cálculo.
----------------------------------------------------------------------------------
Analista : Antonio Marcos (amf)
Data     : 02/07/2007
Pendência: 24589
Descrição: Corrige regra prova zero. Agora, leva em consideração os lançamentos da planilha e a
memória de cálculo para verificação de saldo zerado (total de créditos = total de débitos)
(*==============================================================================
Analista : David Ayrolla
Data     : 15/01/2007
Pendência: 23894
Descrição: Criar memória de cálculo de segregação.
(*==============================================================================
Analista : Marcus Oliveira
Data     : 30/10/2006
Pendência: 23510
Descrição: Permitir que a data seja alterada no momento do insert do detalhe.

================================================================================
Analista : Rodolpho da Silva
Rotina   : CmeDetalheEdit
Data     : 16/11/2005
Pendência: 20695
Descrição: Corrigido o erro em que o sistema estava misturando o histórico da
           planilha que foi digitada anteriormente, com o histórico da próxima
           planilha que selecionada para fazer qualquer alteração de lançamento.
(*==============================================================================
Analista : Alex Pereira
Rotina   : Divs
Data     : 20-29/09/2004
Pendência: 17193
Solução  : Ajustando formulário para se adequar ao novo processo para segregação
           de recursos na origem.

Data     : 18/10/2004
Solução  : Ajustando form para se adequar ao plano de operações administrativas
==============================================================================*)
(*==============================================================================
Analista : André Tavares
Rotina   : CmeCadastroEdit, CmeCadastroFind, sbtnApagarClick
Data     : 18/05/2004
Pendência: 16733
Solução  : Exibir mensagem de alerta e perguntar se deseja realmente alterar ou
excluir o lançamento quando é de origem de outro módulo.
==============================================================================*)
(*==============================================================================
Analista : Marchetti
Rotina   : VerificaPreenchimentoDet
Data     : 02/04/2004
Pendência: 16345
Solução  : Verificar a existencia do relacionamento entre patro e plano no global
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 07/01/04
Pendência: 14451 Nova estrutura para segregação
Solução  : Preparando tela para aceitar o novo processo de segregação.

Novos Metodos: ProcuraSegregaCriter
               VerificaPreenchimentoDet

Data     : 08/01/04
           RegraProvaZero
           Termino formulário com nova segreação

  Data         : 20/01/04
  Solução      : modificada a criação do uCtrlSegregacao
  
==============================================================================*)
(*==============================================================================
Analista : Alex Pereira
Data     : 06/01/04
Pendência: 14451 Nova estrutura para segregação

Métodos atualizados:

Pendentes: TFrmLancaContabMT.CmeDetalheConfirma ==> ProcessaContab.ProcessaLancamento

Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.

Métodos Removidos:

==============================================================================*)
//Atualizado em: 30/10/2003 - André Tavares - pendência 14915 :
//                            Inclusão dos filtros Plano previdenciário e Patrocinadora no Monta select

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,uCMSqlParams,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, TREdit, wwdblook, Mask, wwdbedit, fcLabel, MConnect,
  CMProcuraMask, CMProcura, uCtrlPeriodo, uCtrlProcessaContab,wwclient,
  DBCtrls, Wwdotdot, Wwdbcomb, uCtrlContaContabil,uAutorizacao,
  uCtrlLancamento, uCtrlContab, uCtrlHistoContab, uCtrlDemonstrativo, DBTables, Wwquery,
  Provider, CMDBLookupCombo, uCmControlObject,
  uCtrlListTerceiros, uCMTypes, uCtrlSegregacao, uVerificaPreenchimento,
  uCtrlPlanPrevContabPatro, jclMath, FPreview;


type
  TOperLanc = (olAguardando, olInsPlanilha, olAltPlanilha, olProPlanilha, olEstPlanilha,
               olExcPlanilha, olInsLancamento, olAltLancamento, olExcLancamento);

  TFrmLancaContabMT = class(TFrmCadastroMestreDetMT)
    sbtnEstorno: TToolbarButton97;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    Label11: TLabel;
    Label28: TLabel;
    Label9: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbeDocumento: TwwDBEdit;
    dblkHistorico: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dblkMutacoesPL: TwwDBLookupCombo;
    Panel6: TPanel;
    lbConvOfDeb: TLabel;
    lbConvG1Deb: TLabel;
    lbConvG2Deb: TLabel;
    lbConvG3Deb: TLabel;
    lblHistDeb: TLabel;
    SpeedButton1: TSpeedButton;
    Panel9: TPanel;
    fcLabel1: TfcLabel;
    Panel7: TPanel;
    lbConvOfCre: TLabel;
    lbConvG1Cre: TLabel;
    lbConvG2Cre: TLabel;
    lbConvG3Cre: TLabel;
    Label24: TLabel;
    SpeedButton2: TSpeedButton;
    Panel8: TPanel;
    fcLabel2: TfcLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label25: TLabel;
    dbedData: TCMDateTimePicker;
    dbedUsuario: TwwDBEdit;
    dbedSistema: TwwDBEdit;
    imgCredito: TImage;
    imgDebito: TImage;
    imgIgual: TImage;
    imgPlanilNaoEfet: TImage;
    imgPlanilEfetiva: TImage;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Bevel2: TBevel;
    dbrDebito: TDBRealEdit;
    dbrCredito: TDBRealEdit;
    Label6: TLabel;
    Panel2: TPanel;
    lblCCustoDeb: TLabel;
    lblSubContaDeb: TLabel;
    dblkCCustoDeb: TwwDBLookupCombo;
    btnSubContaDeb: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    fcLabel3: TfcLabel;
    Panel3: TPanel;
    lblCCustoCred: TLabel;
    lblSubContaCred: TLabel;
    dblkCCustoCred: TwwDBLookupCombo;
    btnSubContaCred: TBitBtn;
    Panel12: TPanel;
    fcLabel4: TfcLabel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    MontaSelectSubConta: TMontaSelect;
    Label10: TLabel;
    btnAtivProj: TBitBtn;
    CdsTipoOper: TClientDataSet;
    CdsHistorico: TClientDataSet;
    CdsElemen: TClientDataSet;
    CdsPlano: TClientDataSet;
    CdsPatro: TClientDataSet;
    dbedPeriodo: TwwDBEdit;
    dbedDif: TDBRealEdit;
    dbedNumLan: TwwDBEdit;
    dbedExercicio: TwwDBEdit;
    dbedPlanilha: TwwDBEdit;
    dbedSubContaDeb: TwwDBEdit;
    dbedSubContaCre: TwwDBEdit;
    dbedAtivProj: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    dbreValor: TDBRealEdit;
    mskHist1: TMaskEdit;
    mskHist2: TMaskEdit;
    mskHist3: TMaskEdit;
    mskHist4: TMaskEdit;
    mskHist5: TMaskEdit;
    Memo1: TMemo;
    cmbConvOfDeb: TwwDBComboBox;
    cmbConvGerDeb: TwwDBComboBox;
    cmbConvGe1Deb: TwwDBComboBox;
    cmbConvGe2Deb: TwwDBComboBox;
    cmbConvOfCre: TwwDBComboBox;
    cmbConvGerCre: TwwDBComboBox;
    cmbConvGe1Cre: TwwDBComboBox;
    cmbConvGe2Cre: TwwDBComboBox;
    dbrgOriApl: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    dbedHistDeb: TDBRealEdit;
    dbedHistCre: TDBRealEdit;
    dbreValOfiDeb: TDBRealEdit;
    dbreValGerDeb: TDBRealEdit;
    dbreValGe1Deb: TDBRealEdit;
    dbreValGe2Deb: TDBRealEdit;
    dbreValOfiCre: TDBRealEdit;
    dbreValGerCre: TDBRealEdit;
    dbreValGe1Cre: TDBRealEdit;
    dbreValGe2Cre: TDBRealEdit;
    MontaSelectAtivProj: TMontaSelect;
    cdsCCustDeb: TClientDataSet;
    cdsCCustCre: TClientDataSet;
    cdsSubContaDeb: TClientDataSet;
    cdsSubContaCre: TClientDataSet;
    cdsAtivProj: TClientDataSet;
    Panel4: TPanel;
    lblPlanilha: TLabel;
    CdsDetAux: TClientDataSet;
    cdsDetMantem: TClientDataSet;
    cdsDet: TwwClientDataSet;
    cmpContaDeb: TCMProcuraMaskContabil;
    cmpContaCre: TCMProcuraMaskContabil;
    cdsEstornada: TCMClientDataSet;
    sqlEstornada: TCMSqlParams;
    LBLESTORNADA: TLabel;
    cdsAux: TClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsparmacontab: TClientDataSet;
    cdsSegrega: TCMClientDataSet;
    panSegregacao: TPanel;
    Label12: TLabel;
    dbCboSegregaCriter: TwwDBLookupCombo;
    dbEdSegregaData: TCMDateTimePicker;
    Label13: TLabel;
    tabProvaZero: TTabSheet;
    cdsProvaZeroLanc: TCMClientDataSet;
    dsProvaZeroLanc: TwwDataSource;
    lbProvaZero: TLabel;
    tabMemoCalcSegrega: TTabSheet;
    grdMemoCalcSegrega: TwwDBGrid;
    dtsMemoCalcSegrega: TwwDataSource;
    cdsMemoCalcSegrega: TwwClientDataSet;
    cdsProvaZeroMemo: TCMClientDataSet;
    dsProvaZeroMemo: TwwDataSource;
    dsLancaMemoria: TDataSource;
    pnlProvaZeroLanc: TPanel;
    Panel13: TPanel;
    grdProvaZeroLanc: TwwDBGrid;
    Splitter1: TSplitter;
    pnlProvaZeroMemo: TPanel;
    grdProvaZeroMemo: TwwDBGrid;
    Panel14: TPanel;
    Splitter2: TSplitter;
    pnlLaneMemo: TPanel;
    grdLaneMemo: TwwDBGrid;
    Panel15: TPanel;
    cdsNovaRegraProvaZero: TCMClientDataSet;
    dsNovaRegraProvaZero: TwwDataSource;
    sqlPlanoPatro: TCMSqlParams;
    cdsPlanoPatro: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    cdsDetMARCA: TStringField;
    cdsDetPLNCODIGO: TFloatField;
    cdsDetLACNUMLAN: TFloatField;
    cdsDetUNIDNEGOC: TFloatField;
    cdsDetIDPLANOPREV: TFloatField;
    cdsDetIDSEGREGACRITER: TFloatField;
    cdsDetDATASEGREGACRITER: TDateTimeField;
    cdsDetDESCSEGREGACRITER: TStringField;
    cdsDetIDSEGREGACONTR: TFloatField;
    cdsDetIDPATRO: TFloatField;
    cdsDetIDELEMDEMONSTRAT: TFloatField;
    cdsDetHITCODHIST: TStringField;
    cdsDetIDPESSOA: TFloatField;
    cdsDetIDMODULO: TFloatField;
    cdsDetIDUSUARIOINCLUSAO: TFloatField;
    cdsDetLACVALOR: TFloatField;
    cdsDetTIPCODIGO: TStringField;
    cdsDetSUBCONTADEB: TFloatField;
    cdsDetSUBCONTACRE: TFloatField;
    cdsDetCCUSTDEB: TStringField;
    cdsDetCCUSTCRE: TStringField;
    cdsDetPLACONTAD: TStringField;
    cdsDetPLACONTAC: TStringField;
    cdsDetPLACONCORRESPD: TStringField;
    cdsDetPLACONCORRESPC: TStringField;
    cdsDetPLAREDUZD: TStringField;
    cdsDetPLAREDUZC: TStringField;
    cdsDetPLANO: TFloatField;
    cdsDetLACTIPO: TStringField;
    cdsDetLACNUMDOC: TStringField;
    cdsDetLACHIST1: TStringField;
    cdsDetLACHIST2: TStringField;
    cdsDetLACHIST3: TStringField;
    cdsDetLACHIST4: TStringField;
    cdsDetLACHIST5: TStringField;
    cdsDetNOMEPATRO: TStringField;
    cdsDetNOMEPLANOPREV: TStringField;
    cdsDetTIPCONVOFIDEB: TStringField;
    cdsDetTIPCONVGERDEB: TStringField;
    cdsDetTIPCONVGE1DEB: TStringField;
    cdsDetTIPCONVGE2DEB: TStringField;
    cdsDetTIPCONVOFICRE: TStringField;
    cdsDetTIPCONVGERCRE: TStringField;
    cdsDetTIPCONVGE1CRE: TStringField;
    cdsDetTIPCONVGE2CRE: TStringField;
    cdsDetVALOFIDEB: TFloatField;
    cdsDetVALGERDEB: TFloatField;
    cdsDetVALGE1DEB: TFloatField;
    cdsDetVALGE2DEB: TFloatField;
    cdsDetVALOFICRE: TFloatField;
    cdsDetVALGERCRE: TFloatField;
    cdsDetVALGE1CRE: TFloatField;
    cdsDetVALGE2CRE: TFloatField;
    cdsDetORIAPLDEB: TStringField;
    cdsDetORIAPLCRE: TStringField;
    cdsDetVALHISDEB: TFloatField;
    cdsDetVALHISCRE: TFloatField;
    cdsDetNOMECONTAD: TStringField;
    cdsDetNOMECONTAC: TStringField;
    cdsDetNOMEATIVPROJ: TStringField;
    cdsDetUNECODIGO: TStringField;
    cdsDetNOMESUBCONTAD: TStringField;
    cdsDetNOMESUBCONTAC: TStringField;
    cdsDetNOMECCUSTOD: TStringField;
    cdsDetNOMECCUSTOC: TStringField;
    cdsDetORDLANCARATEADO: TFloatField;
    sbtnImprimir: TToolbarButton97;
    procedure FormCreate(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedDataExit(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dblkHistoricoExit(Sender: TObject);
    procedure mskHist1Enter(Sender: TObject);
    procedure mskHist1Change(Sender: TObject);
    procedure mskHist2Change(Sender: TObject);
    procedure mskHist2Exit(Sender: TObject);
    procedure mskHist3Change(Sender: TObject);
    procedure mskHist4Change(Sender: TObject);
    procedure mskHist5Change(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSubContaDebClick(Sender: TObject);
    procedure dbedSubContaDebExit(Sender: TObject);
    procedure btnSubContaCredClick(Sender: TObject);
    procedure dbedSubContaCreExit(Sender: TObject);
    procedure dbedAtivProjExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure btnAtivProjExit(Sender: TObject);
    procedure pnlPlanoPatroCExit(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure sbtnEstornoClick(Sender: TObject);
    procedure cmpContaDebExit(Sender: TObject);
    procedure cmpContaCreExit(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure CmeDetalheApplyInsert(sender: TObject; var Accept: Boolean);
    procedure grdProvaZeroLancTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure grdProvaZeroLancCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure tbcDetalheChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure cdsDetAfterCancel(DataSet: TDataSet);
    procedure cdsDetAfterDelete(DataSet: TDataSet);
    procedure cdsDetAfterPost(DataSet: TDataSet);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure cdsProvaZeroLancAfterOpen(DataSet: TDataSet);
    procedure grdProvaZeroMemoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure grdProvaZeroMemoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure grdLaneMemoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbCboSegregaCriterExit(Sender: TObject);
    procedure CmeDetalheAfterConfirma(Sender: TObject);
    procedure dblcPlanoPrevCExit(Sender: TObject);
    procedure dblcPatroCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbCboSegregaCriterCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgrdDetRowChanged(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    iIdModulo      : integer;
    Periodo        :TCtrlPeriodo;
    ProcessaContab :TCtrlProcessaContab;
    Lancamento     :TCtrlLancamento;
    ContaContabil  :TCtrlContaContabil;
    HistoContab    :TCtrlHistoContab;
    Demonstrativo  :TCtrlDemonstrativo;
    Contab         :TCtrlContab;
    ListTerceiros  :TCtrlListTerceiros;
    CtrlSegregacao  :TCtrlSegregacao;

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

    OrdemLancaRateado: Integer;
    sSegregaCriter : string;
    dSegregaCriter : TDateTime;
    procedure AbreQry(PlnCodigo: Double;bPrincipal: Boolean);
    procedure SetaPlano(sData : String);
    procedure MontaConta(sTipo,sConta : String);
    procedure VerificaEstornada;
    procedure CalculaDebCre;
    procedure AtuParamContab;
    procedure ProcuraSegregaCriter;
    function VerificaPreenchimentoDet: boolean;
    procedure RegraProvaZero;
    procedure ligaLabelProvazero(cds: TclientDataset);
    procedure TrataPanels(memocalc: boolean);
    function VerificaLancRateado(iOrdLanca : integer): boolean;

    // Ricardo A. SOL 130350/941 KTN 745297
    procedure AtualizaBotaoEditarDetalhe;
    // FIM Ricardo A. SOL 130350/941 KTN 745297
  public
    { Public declarations }
    bVeioDaConsultaSaldo :Boolean;
    dPlnDaConsultaSaldo,dPlnCodContab     :Double;
    procedure ConfigMontaSelect;
  end;

var
  FrmLancaContabMT: TFrmLancaContabMT;
  bGravouDet  :Boolean;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uString, dBaseDados,fDataMT, FParamAvisoLan,
  RAvisoLan;

procedure TFrmLancaContabMT.FormCreate(Sender: TObject);
begin

  inherited;
  sqlPlanoPatro.Prepare;
  sqlPlanoPatro.ParamByName('idpessoa').AsInteger := Sistema.IdEmpresa;
  sqlPlanoPatro.Open;

  iIdModulo := -1;

  Periodo := TCtrlPeriodo.Create;
  Periodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  ProcessaContab := TCtrlProcessaContab.Create;
  ProcessaContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  Lancamento := TCtrlLancamento.Create;
  Lancamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                        Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  HistoContab := TCtrlHistoContab.Create;
  HistoContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                         Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  Demonstrativo := TCtrlDemonstrativo.Create;
  Demonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);


  ContaContabil := TCtrlContaContabil.Create;
  ContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);
  cdsSegrega.Data := CtrlSegregacao.ListaSegregaCriter;
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlSegregacao);

  //Cássio - SOL Nº 125469 KINTANA Nº 633457
  //A opção de seleção, Critério para Segregação, não pode mais ser
  //influenciada pelo campo Segregação Virtual, existente no Global.
  //panSegregacao.Visible := CtrlSegregacao.SegregaVirtual;

  dPlnCodContab  := 0;
  Contab := TCtrlContab.Create;
  Contab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);



  If Not Contab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(Contab.MessageInfo,'Erro',MtError,[mbOk],0);

  dPlnCodContab := Contab.PlnCodigo;

  //Configura o montaselect
  if Contab.PacPesqPlaResumida = 'S' then
     ConfigMontaSelect;

  // *** verifica se vai lançar pelo codigo normal ou reduzido ***
  if Contab.PlaReduz = 'R' then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaReduz;
    cmpContaCre.CampoPesquisa := cpPlaReduz;
    cmpContaDeb.DataField := 'PLAREDUZD';
    cmpContaCre.DataField := 'PLAREDUZC';
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Red)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Red)';
  end else
  if Contab.PlaReduz = 'C' then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaConta;
    cmpContaCre.CampoPesquisa := cpPlaConta;
    cmpContaDeb.DataField := 'PLACONTAD';
    cmpContaCre.DataField := 'PLACONTAC';
  end else
  if Contab.PlaReduz = 'P' then
  begin
    cmpContaDeb.CampoPesquisa := cpPlaCorresp;
    cmpContaCre.CampoPesquisa := cpPlaCorresp;
    cmpContaDeb.DataField := 'PLACONCORRESPD';
    cmpContaCre.DataField := 'PLACONCORRESPC';                                         
    cmpContaDeb.Caption   := 'Conta Contábil (Cod.Corresp)';
    cmpContaCre.Caption   := 'Conta Contábil (Cod.Corresp)';
  end;

  cmpContaDeb.Plano    := Contab.PlanoParam;
  cmpContaDeb.Mascara  := Contab.MascaraContaParam;
  cmpContaCre.Plano    := Contab.PlanoParam;
  cmpContaCre.Mascara  := Contab.MascaraContaParam;

  //
  ProcessaContab.cdsPlanilha   := cds;
  ProcessaContab.cdsLancamento := CdsDetAux;
  //

  AbreQry(-1,True);
  //
  MontaSelect.Filtro.Add('PLANILHA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  //
  MontaSelectSubConta.Filtro.Delete(4);
  MontaSelectSubConta.Filtro.Delete(3);
  MontaSelectSubConta.Filtro.Delete(2);
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco('1',18)+'''');
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO = '+IntToStr(Contab.PlanoParam));
  //
  cdsDetMantem.Data := Lancamento.SelecionaLancamentosEsp(-1);
  //

  tabMemoCalcSegrega.Visible := CtrlSegregacao.FlgSegOrComFin or CtrlSegregacao.FlgSegOrAdmFin;

  TrataPanels(tabMemoCalcSegrega.visible);

  pnlProvaZeroMemo.Visible   := CtrlSegregacao.FlgSegOrComFin or CtrlSegregacao.FlgSegOrAdmFin;
  Splitter1.Visible           := CtrlSegregacao.FlgSegOrComFin or CtrlSegregacao.FlgSegOrAdmFin;


  if not tabMemoCalcSegrega.Visible then
  begin
    tabProvaZero.PageIndex := 1;
    tbcDetalhe.Tabs.Delete( 1 );
  end;

  // Ricardo A. SOL 130350/941 KTN 745297
  OrdemLancaRateado := 0;
  //OrdemLancaRateado := 1;
  // FIM Ricardo A. SOL 130350/941 KTN 745297

  sSegregaCriter := '';
end;

procedure TFrmLancaContabMT.AbreQry(PlnCodigo: Double;bPrincipal: Boolean);
begin
  if bPrincipal then begin
     cds.Data := Lancamento.SelecionaPlanilhas(PlnCodigo,0,0,Sistema.idEmpresa,0,0,tpSoPeriodo,
                                               '','','','',teAmbos,tolPlnCodigo);
  end;

  RegraProvaZero;

  // Alterado por Arnaldo V. Scarin em 18/02/2010
  // Sol: 131028 KTN: 740201
  // Essa rotina deve ser feita antes da carga do cdsDet para evitar erros
  if not cds.IsEmpty then
    SetaPlano(cds.FieldByName('PLNDATDIA').AsString);

  cdsDet.Data := Lancamento.SelecionaLancamentosEsp(PlnCodigo);

  TFloatField(cdsDet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
  cdsDet.ControlType.Add('MARCA;CheckBox;S;N');

  if CtrlSegregacao.FlgSegOrComFin or CtrlSegregacao.FlgSegOrAdmFin then
  begin
    cdsMemoCalcSegrega.Data := Lancamento.SelecionaLancMemoCalcSegrega( PlnCodigo );
    TFloatField(cdsMemoCalcSegrega.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
  end;

  If PlnCodigo = -1 Then
  Begin
     If cdsDetAux.Active Then cdsDetAux.Close;
     cdsDetAux.Data := CdsDet.Data;
  End;

  //
  //
  if cds.FieldByName('PLNEFETIVADO').AsString = 'S' then begin
     imgPlanilEfetiva.Visible := True;
     imgPlanilNaoEfet.Visible := False;
  end else begin
     imgPlanilEfetiva.Visible := False;
     imgPlanilNaoEfet.Visible := True;
  end;
  //
  if cds.FieldByName('DIFERENCA').AsFloat = 0 then begin
     imgIgual.Visible   := True;
     imgDebito.Visible  := False;
     imgCredito.Visible := False;
  end else begin
     if cds.FieldByName('DIFERENCA').AsFloat > 0 then begin
        imgIgual.Visible   := False;
        imgDebito.Visible  := True;
        imgCredito.Visible := False;
     end else begin
        imgIgual.Visible   := False;
        imgDebito.Visible  := False;
        imgCredito.Visible := True;
     end;
  end;
end;

procedure TFrmLancaContabMT.CmeDetalheInsert(Sender: TObject);
var x : Integer;
begin
  inherited;
  bGravouDet := False;
  if (not cdsDetMantem.IsEmpty) and (Contab.MantemLancTela = 'S') then begin
     For X:=0 To cdsDetMantem.FieldCount - 1 Do
        cdsDet.FieldByName(cdsDetMantem.Fields[x].FieldName).Value := cdsDetMantem.Fields[x].Value;

     cdsDet.FieldByName('LACNUMLAN').Clear;
     cdsdet.FieldByName('PLNCODIGO').Clear;
     cdsDet.FieldByName('LACVALOR').AsFloat  := 0;
     cdsDet.FieldByName('VALOFIDEB').AsFloat := 0;
     cdsDet.FieldByName('VALGERDEB').AsFloat := 0;
     cdsDet.FieldByName('VALGE1DEB').AsFloat := 0;
     cdsDet.FieldByName('VALGE2DEB').AsFloat := 0;
     cdsDet.FieldByName('VALHISDEB').AsFloat := 0;
     cdsDet.FieldByName('VALOFICRE').AsFloat := 0;
     cdsDet.FieldByName('VALGERCRE').AsFloat := 0;
     cdsDet.FieldByName('VALGE1CRE').AsFloat := 0;
     cdsDet.FieldByName('VALGE2CRE').AsFloat := 0;
     cdsDet.FieldByName('VALHISCRE').AsFloat := 0;
  end else begin
     mskHist1.text     := '';
     mskHist2.text     := '';
     mskHist3.text     := '';
     mskHist4.text     := '';
     mskHist5.text     := '';
     mskHist1.EditMask := '';
     mskHist2.EditMask := '';
     mskHist3.EditMask := '';
     mskHist4.EditMask := '';
     mskHist5.EditMask := '';
  end;
  pnlMestre.Align   := AlNone;

  MontaConta('D', CdsDet.FieldByName('PLACONTAD').asString);
  MontaConta('C', CdsDet.FieldByName('PLACONTAC').asString);
  cmpContaDeb.SetFocus;

  if not CtrlSegregacao.SegregaVirtual then
  begin
    dblcPlanoPrevC.Enabled := trim(dbCboSegregaCriter.text) = '';
    if CdsPlano.Locate('IDPLANOPREV', cdsDet.FieldByName('IDPLANOPREV').asVariant, []) then
      dblcPlanoPrevC.Text := CdsPlano.FieldByName('NOME').asString;

    dblcPatroC.Enabled := trim(dbCboSegregaCriter.text) = '';
    if CdsPatro.Locate('IDPESSOA', cdsDet.FieldByName('IDPATRO').asVariant, []) then
      dblcPatroC.text := CdsPatro.FieldByName('NOME').asString;

    dbCboSegregaCriter.Enabled := ((trim(dblcPlanoPrevC.text) = '') and (trim(dblcPatroC.Text) = ''));
    if not dbCboSegregaCriter.Enabled then
    begin
      dbEdSegregaData.Clear;
      dbEdSegregaData.Enabled := False;
    end
    else
    begin
      dbCboSegregaCriter.LookupValue := sSegregaCriter;
      dbEdSegregaData.Enabled := True;
      dbEdSegregaData.DateTime := dSegregaCriter;
    end;
  end;

  cdsDetTIPCODIGO.AsString :=  '07'; //Cássio Rovaroto - SIG nº 117454

end;

procedure TFrmLancaContabMT.CmeDetalheConfirma(Sender: TObject);
Var
  X: Integer;
  //Cássio - SOl Nº 124569 KINTANA Nº 633457
  //Armazena Cotação de Critério
  _cdsCotacaoCriter : TCMClientDataSet;
  dValorLanc, dValorTotal : Double;
  iIdPatro, iIdPlanoPrev, iIdSegregaCriter, iOrdLancRateadoTmp, iLacNumLan : integer;
  sNomePatro, sNomePlanoPrev : string;
begin
  // Alterado por Arnaldo V. Scarin
  // Para o chamado Sol = 124568 Kintana = 633456
  dbedData.Enabled := CdsDet.IsEmpty;

  bGravouDet     := True;
  dValorLanc     := 0;
  dValorTotal    := 0;
  iIdPatro       := 0;
  iIdPlanoPrev   := 0;
  sNomePatro     := '';
  sNomePlanoPrev := '';

  _cdsCotacaoCriter := TCmClientDataSet.Create(nil);
  try
    if not CtrlSegregacao.SegregaVirtual then
    begin
      _cdsCotacaoCriter.Data := ProcessaContab.GetCriterioSegrega(cdsDet.FieldByName('IDSEGREGACRITER').asInteger,
                                                   cdsDet.FieldByName('DATASEGREGACRITER').asString);
      sSegregaCriter := cdsDet.FieldByName('IDSEGREGACRITER').AsString;
      dSegregaCriter := cdsDet.FieldByName('DATASEGREGACRITER').AsDateTime;
    end;

    if CdsDet.State in dsEditModes then
    begin
       CdsDet.FieldByName('LACHIST1').asString := mskHist1.text;
       CdsDet.FieldByName('LACHIST2').asString := mskHist2.text;
       CdsDet.FieldByName('LACHIST3').asString := mskHist3.text;
       CdsDet.FieldByName('LACHIST4').asString := mskHist4.text;
       CdsDet.FieldByName('LACHIST5').asString := mskHist5.text;
       CdsDet.FieldByName('NOMECCUSTOD').AsString := dblkCCustoDeb.Text;
       CdsDet.FieldByName('NOMECCUSTOC').AsString := dblkCCustoCred.Text;
       // 15/11/2007 - pendência 24892
       CdsDet.FieldByName('PLANO').AsInteger := Contab.PlanoData;

       CdsDetAux.Data := Lancamento.SelecionaLancamentosEsp(-1);

       If Not cdsDetAux.IsEmpty Then
        cdsDetAux.Delete;

       //Cássio - SOL Nº 124569 KINTANA Nº 633754 - Início
       if _cdsCotacaoCriter.IsEmpty then
       begin
        cdsDetAux.Insert;
        For X:=0 To CdsDet.FieldCount - 1 Do
          cdsDetAux.FieldByName(cdsDet.Fields[x].FieldName).Value := cdsDet.Fields[x].Value;
        cdsDetAux.Post;

        iOrdLancRateadoTmp := -1;
       end
       else
       begin

        // Ricardo A. SOL 130350/941 KTN 745297
        Inc( OrdemLancaRateado );
        iOrdLancRateadoTmp := OrdemLancaRateado;

        // na edição com critério de segregação deve-se deletar registro antigo e inserir novo registro
        if cdsDet.State = dsEdit then
        begin
          iLacNumLan := cdsDetLACNUMLAN.AsInteger;

          cdsDetAux.Insert;
          for X:=0 to CdsDet.FieldCount - 1 do
            cdsDetAux.FieldByName(cdsDet.Fields[x].FieldName).Value := cdsDet.Fields[x].Value;
          CdsDetAux.FieldByName( 'LACNUMLAN' ).Clear;
          cdsDetAux.Post;

          cdsDet.Cancel;
          if not ProcessaContab.ProcessaExcluiLanc(
            Sistema.idEmpresa,
            cds.FieldByName('PLNCODIGO').AsFloat,
            Sistema.idModulo,
            Sistema.idUsuario,
            iLacNumLan,
            Sistema.UsaPlanoPatro,
            False) then
          begin
            MsgDlg( ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0 );
            bGravouDet := False;
          end;
          // para compatibilizar com a forma de edição atual
          CmeDetalhe.Insert( CmeDetalhe );
          For X:=0 To CdsDetAux.FieldCount - 1 Do
            cdsDet.FieldByName(cdsDetAux.Fields[x].FieldName).Value := cdsDetAux.Fields[x].Value;

          CdsDetAux.EmptyDataSet;
        end;

        _cdsCotacaoCriter.First;
        // FIM Ricardo A. SOL 130350/941 KTN 745297

        while not _cdsCotacaoCriter.eof do
        begin
          cdsDetAux.Append;
          for x:=0 To CdsDet.FieldCount - 1 do
          begin
            if cdsDet.Fields[x].FieldName = 'IDPATRO' then
              iIdPatro := _cdsCotacaoCriter.FieldByName('IDPATRO').AsInteger;

            if cdsDet.Fields[x].FieldName = 'NOMEPATRO' then
              sNomePatro := _cdsCotacaoCriter.FieldByName('NOMEPATRO').AsString;

            if cdsDet.Fields[x].FieldName = 'IDPLANOPREV' then
              iIdPlanoPrev := _cdsCotacaoCriter.FieldByName('IDPLANOPREV').AsInteger;

            if cdsDet.Fields[x].FieldName = 'NOMEPLANOPREV' then
              sNomePlanoPrev := _cdsCotacaoCriter.FieldByName('NOMEPLANO').AsString;

            if cdsDet.Fields[x].FieldName = 'LACVALOR' then
            begin
              if _cdsCotacaoCriter.RecNo = _cdsCotacaoCriter.RecordCount then
                dValorLanc := dbreValor.Value - dValorTotal
              else
                dValorLanc := StrToFloat(FormatFloat('##.00', (dbreValor.Value * _cdsCotacaoCriter.FieldByName('COTACAO').asFloat)/100));
              dValorTotal := dValorTotal + dValorLanc;
              cdsDetAux.FieldByName(cdsDet.Fields[x].FieldName).Value := dValorLanc;
            end
            else
              cdsDetAux.FieldByName(cdsDet.Fields[x].FieldName).Value := cdsDet.Fields[x].Value;
          end;

          cdsDetAux.FieldByName('IDPATRO').asInteger := iIdPatro;
          cdsDetAux.FieldByName('IDPLANOPREV').asInteger := iIdPlanoPrev;
          cdsDetAux.FieldByName('NOMEPATRO').asString := sNomePatro;
          cdsDetAux.FieldByName('NOMEPLANOPREV').asString := sNomePlanoPrev;
          CdsDetAux.FieldByName('IDSEGREGACRITER').asInteger := -1;
          cdsDetAux.Post;
          _cdsCotacaoCriter.Next;
        end;
       end;

       If Not cdsDetMantem.IsEmpty Then cdsDetMantem.Delete;
          cdsDetMantem.Append;
       For X:=0 To CdsDet.FieldCount - 1 Do
           cdsDetMantem.FieldByName(cdsDet.Fields[x].FieldName).Value := cdsDet.Fields[x].Value;
       cdsDetMantem.Post;

       CdsDetAux.First;
       while not CdsDetAux.eof do
       begin
        if not ProcessaContab.ProcessaLancamento(Sistema.idEmpresa, Sistema.idModulo,
                                              Sistema.idUsuario, Sistema.UsaPlanoPatro,
                                              cds.FieldByName('PLNCODIGO').AsFloat,
                                              cds.FieldByName('PLNDATDIA').AsString,

                                              // Ricardo A. SOL 130350/941 KTN 745297
                                              //OrdemLancaRateado) then
                                              iOrdLancRateadoTmp) then
                                              // FIM Ricardo A. SOL 130350/941 KTN 745297
        begin
            MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
            // Cássio - SOL Nº 128681 KINTANA Nº 691677
            //Caso de problemas ocorridos na gravação dos lançamentos.
            bGravouDet := False;
        end
        else
        begin
          if cds.FieldByName('PLNPLANIL').isNull then
          begin
            lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(ProcessaContab.RetornaPlnPlanil) + ' - Lanc. Nº ' +
                                       IntToStr(ProcessaContab.RetornaPlnNumLan)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
             cds.FieldByName('PLNPLANIL').AsFloat   :=ProcessaContab.RetornaPlnPlanil;
          end
          else
          begin
             lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                                    IntToStr(ProcessaContab.RetornaPlnNumLan)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
          end;
          cdsDet.FieldByName('LACNUMLAN').AsInteger :=ProcessaContab.RetornaPlnNumLan;
          cds.FieldByName('PLNNUMLAN').AsInteger    :=ProcessaContab.RetornaPlnNumLan;
          cds.FieldByName('PLNCODIGO').AsFloat      :=ProcessaContab.RetornaPlnCodigo;

          inherited;

          If not sbtnInsDet.Down Then pnlMestre.Align := AlTop;
        end;
        CdsDetAux.Next;
       end;
    end;

    RegraProvaZero;
  finally
    FreeAndNil(_cdsCotacaoCriter);
  end;
end;

procedure TFrmLancaContabMT.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  pnlMestre.Align := AlTop;
  AtuParamContab;
  dblcPlanoPrevC.Enabled := True;
  dblcPatroC.Enabled := True;
  dbCboSegregaCriter.Enabled:= True;


  sbtnImprimir.enabled := not CdsDet.IsEmpty;  // Edilaine - SOL 190984 / KTN 1813669
end;

procedure TFrmLancaContabMT.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;

  bGravouDet := True;

  AtuParamContab;

  pnlMestre.Align := AlTop;

  if (not CtrlSegregacao.SegregaVirtual) and (dsDet.State in [dsBrowse]) then
    // Ricardo A. SOL 130350/941 KTN 745297
    AtualizaBotaoEditarDetalhe;
    //sbtnAltDet.Enabled := VerificaLancRateado(cdsDet.FieldByName('ORDLANCARATEADO').asInteger);
    // FIM Ricardo A. SOL 130350/941 KTN 745297

  sbtnImprimir.enabled := not CdsDet.IsEmpty;  // Edilaine - SOL 190984 / KTN 1813669
    
end;

procedure TFrmLancaContabMT.btnAtivProjClick(Sender: TObject);
begin
   inherited;
   MontaSelectAtivProj.Executar;
   if MontaSelectAtivProj.RetornouValor then begin
      cdsDet.FieldByName('UNIDNEGOC').AsFloat     := StrToFloat(MontaSelectAtivProj.ValoresChave[1]);
      cdsDet.FieldByName('NOMEATIVPROJ').AsString := MontaSelectAtivProj.ValoresChave[2];
      cdsDet.FieldByName('UNECODIGO').AsString    := MontaSelectAtivProj.ValoresChave[0];
   end;
end;

procedure TFrmLancaContabMT.CmeCadastroConfirma(Sender: TObject);
var iPlnPlanil : Double;
begin
  if not bGravouDet then
  begin
    MsgDlg('Antes do OK final, Tecle <OK> para Confirmar ou <Cancelar>/<Voltar> para Cancelar o Lançamento.','Aviso',mtWarning,[mbOk],0);
    if bbtnOkDet.CanFocus then bbtnOkDet.SetFocus;
    Abort;
  end;
  if cds.FieldByName('PLNCODIGO').AsFloat = 0 then
     iPlnPlanil := -1
  else
     iPlnPlanil := cds.FieldByName('PLNCODIGO').AsFloat;

  if (Contab.PacDebCre = 'B') or (Contab.PacDebCre = 'S') then
  begin
    if cds.FieldByName('DIFERENCA').asFloat <> 0 then
      MsgDlg('O Débito não está batendo com o Crédito.','Erro',MtError,[mbOk],0);
  end;
  AbreQry(iPlnPlanil,true);



end;

procedure TFrmLancaContabMT.CmeDetalheDelete(Sender: TObject);
var
  bOk : Boolean;

  // Ricardo A. SOL 130350/941 KTN 745297
  sList: TStringList;
  i: Integer;
  // FIM Ricardo A. SOL 130350/941 KTN 745297
begin
   if MsgDlg('Confirma a Exclusão do(s) Lançamento(s) Marcado(s)?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
   begin
      bOk := True;

      // Ricardo A. SOL 130350/941 KTN 745297
      // monta lista de registros rateados que devem ser excluidos
      sList := TStringList.Create;
      try
        cdsDet.DisableControls;
        try
          cdsDet.First;
          while not CdsDet.Eof do
          begin
            if ( cdsDet.FieldByName('MARCA').AsString = 'S' ) and
              ( CdsDet.FieldByName('ORDLANCARATEADO').asInteger <> -1 ) and
              ( sList.IndexOf( CdsDet.FieldByName('ORDLANCARATEADO').AsString ) = -1 ) then
              sList.Add( CdsDet.FieldByName('ORDLANCARATEADO').AsString );

            cdsDet.Next;
          end;


          if sList.Count > 0 then
          begin
            if MsgDlg('Todos os outros lançamentos rateados relacionados ' +#13+
             'aos lançamento marcados serão excluídos. Confirma?','Confirmação',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
            begin
              bOk := False;
              Exit;
            end;

            cdsDet.First;
            while not cdsDet.Eof do
            begin
              if sList.IndexOf( cdsDet.fieldByName('ORDLANCARATEADO').AsString ) <> -1 then
              begin
                cdsDet.Edit;
                cdsDet.FieldByName('MARCA').AsString:= 'S';
                cdsDet.Post;
              end;
              cdsDet.Next;
            end;
          end;
        finally
          cdsDet.EnableControls;
        end;
      finally
        FreeAndNil( sList );
      end;
      // FIM Ricardo A. SOL 130350/941 KTN 745297

      cdsDet.DisableControls;
      cdsDet.First;
      while not cdsDet.Eof do begin
         if cdsDet.FieldByName('MARCA').AsString = 'S' then
         begin
            if not ProcessaContab.ProcessaExcluiLanc(Sistema.idEmpresa,cds.FieldByName('PLNCODIGO').AsFloat,
                   Sistema.idModulo, Sistema.idUsuario,cdsDet.FieldByName('LACNUMLAN').AsInteger,
                   Sistema.UsaPlanoPatro, False) then begin
               bOk := False;
               Break;
            end;
         end;
         CdsDet.Next;
      end;
      
      cdsDet.First;
      cdsDet.EnableControls;
      if not bOK then
      begin
         MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      end
      else
      begin
         inherited;
         AbreQry(cds.FieldByName('PLNCODIGO').AsFloat,False);
      end;
      RegraProvaZero;
   end;
  // Alterado por Arnaldo V. Scarin
  // Para o chamado Sol = 124568 Kintana = 633456
  dbedData.Enabled := CdsDet.IsEmpty;
end;

procedure TFrmLancaContabMT.CmeCadastroDelete(Sender: TObject);
begin
   LBLESTORNADA.Visible := false;
   if not ProcessaContab.ProcessaExcluiLanc(Sistema.idEmpresa,cds.FieldByName('PLNCODIGO').AsFloat,
          Sistema.idModulo,Sistema.idUsuario,0, Sistema.UsaPlanoPatro, True) then begin
      MsgDlg(ProcessaContab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
   end else begin
      dPlnCodContab := 0;
   end;
   AbreQry(cds.FieldByName('PLNCODIGO').AsFloat,true);

end;

procedure TFrmLancaContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CtrlPlanPrevContabPatro.Free;

  Periodo.Free;
  ProcessaContab.Free;
  Lancamento.Free;
  HistoContab.Free;
  Demonstrativo.Free;
  ContaContabil.Free;
  Contab.Free;
  ListTerceiros.Free;
  CtrlSegregacao.Free;

  if bVeioDaConsultaSaldo then
  begin
     bVeioDaConsultaSaldo := false;
     Close;
  end;
end;


procedure TFrmLancaContabMT.dbedDataExit(Sender: TObject);
begin
  inherited;
  if dbedData.Text <> '' then begin
     SetaPlano(dbedData.Text);
     if not Periodo.RetornaPeriodoExercicioData(Sistema.idEmpresa,dbedData.Text) then begin
        MsgDlg(Periodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        dbedData.Text;
     end;
     if Periodo.TestaPeriodoBloqueado(Sistema.idEmpresa,tbBloqueado,Periodo.Periodo,Periodo.Exercicio,False) then begin
        MsgDlg(Periodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
        dbedData.Text;
     end;
     if cds.FieldByName('PLNPLANIL').isNull then
        lblPlanilha.Caption := 'Planilha Nº --- Lanc. Nº --- Data: '+dbedData.Text
     else
        lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                               IntToStr(cds.FieldByName('PLNNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
     cds.FieldByName('PERNOME').AsString := Periodo.NomePeriodo;
     cds.FieldByName('PEREXERCICIO').AsInteger := Periodo.Exercicio;
  end else begin
     if (cds.State = dsInsert) and (ActiveControl.Tag <> 99) then begin
        MsgDlg('Obrigatório indicar a data do Lançamento','Erro',MtError,[mbOk],0);
        dbedData.SetFocus;
     end;
  end;
end;

procedure TFrmLancaContabMT.CmeDetalheEdit(Sender: TObject);
var
  qry : TwwQuery;
begin
  inherited;
  lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                           IntToStr(cdsdet.FieldByName('LACNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;

  bGravouDet := False;
  pnlMestre.Align := AlNone;


  //  Retira-se a máscara
  mskHist1.EditMask := '';
  mskHist2.EditMask := '';
  mskHist3.EditMask := '';
  mskHist4.EditMask := '';
  mskHist5.EditMask := '';
  // Insere o hirtórico nos MaskEdits
  mskHist1.text     := CdsDet.FieldByName('LACHIST1').asString;
  mskHist2.text     := CdsDet.FieldByName('LACHIST2').asString;
  mskHist3.text     := CdsDet.FieldByName('LACHIST3').asString;
  mskHist4.text     := CdsDet.FieldByName('LACHIST4').asString;
  mskHist5.text     := CdsDet.FieldByName('LACHIST5').asString;
  // Insere-se a máscara novamente
  mskHist1.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist2.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist3.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist4.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';
  mskHist5.EditMask := 'cccccccccccccccccccccccccccccccccccccccc;1;_';



  //
  MontaConta('D', CdsDet.FieldByName('PLACONTAD').asString);
  MontaConta('C', CdsDet.FieldByName('PLACONTAC').asString);
  //
  cmpContaDeb.SetFocus;
//Higor Nayde Ferreira SOL 188991 KTN 1783906 Inicio
  qry := TwwQuery.Create(Self);
  qry.DatabaseName := 'BaseDados';

  try
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT CODCENTROCUSTO FROM CENTCUST WHERE NOME = '+QuotedStr(dblkCCustoDeb.text)+'AND CODAREA IS NOT NULL');
    qry.Open;

    if (not qry.IsEmpty)  then
    begin
     cdsDet.FieldByName('CCUSTDEB').AsString := qry.FieldByName('CODCENTROCUSTO').AsString;
    // cdsDet.FieldByName('NOMECCUSTOD').AsString :=  dblkCCustoDeb.text;
     dblkCCustoDeb.text := cdsDet.FieldByName('NOMECCUSTOD').AsString;

    // NOMECCUSTOD
    // NOMECCUSTOC
    end;
    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('SELECT CODCENTROCUSTO FROM CENTCUST WHERE NOME = '+QuotedStr(dblkCCustoCred.Text)+'AND CODAREA IS NOT NULL');
    qry.Open;

    if (not qry.IsEmpty)  then
     cdsDet.FieldByName('CCUSTCRE').AsString := qry.FieldByName('CODCENTROCUSTO').AsString;

  finally
    qry.Close;
    FreeAndNil(qry);
  end;
  //Higor Nayde Ferreira SOL 188991 KTN 1783906 FIM

  // Ricardo A. SOL 130350/941 KTN 745297
//  dblcPlanoPrevC.Enabled := CtrlSegregacao.SegregaVirtual;
//  dblcPatroC.Enabled := CtrlSegregacao.SegregaVirtual;
//  dbCboSegregaCriter.Enabled := CtrlSegregacao.SegregaVirtual;
  dbCboSegregaCriter.Enabled := CtrlSegregacao.SegregaVirtual and ((trim(dblcPlanoPrevC.text) = '') and (trim(dblcPatroC.Text) = ''));
  dblcPlanoPrevC.Enabled     := not dbCboSegregaCriter.Enabled;
  dblcPatroC.Enabled         := not dbCboSegregaCriter.Enabled;
  // FIM Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.dblkHistoricoExit(Sender: TObject);
var
   Hist : Array[1..5] of String;
   i, iMax, iLoop : Integer;
   sComp : String;
begin
   inherited;
   if dblkHistorico.Focused then exit;

   mskHist1.text := '';
   mskHist2.text := '';
   mskHist3.text := '';
   mskHist4.text := '';
   mskHist5.text := '';

   if dblkHistorico.text = '' then begin
      Hist[1] := '';
      Hist[2] := '';
      Hist[3] := '';
      Hist[4] := '';
      Hist[5] := '';
      exit;
   end;

   if CdsHistorico.FieldByName('HITCODHIST').AsString <> dblkHistorico.text then exit;

   Hist[1] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,1  ,40);
   Hist[2] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,41 ,40);
   Hist[3] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,81 ,40);
   Hist[4] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,121,40);
   Hist[5] := copy(CdsHistorico.FieldByName('HITDESCR1').AsString,161,40);

   for iLoop := 1 to 5 do begin
      i := 1;

       iMax := length(trim(Hist[iLoop])) ;

      sComp := StringOfChar ('c',40 - Length(Trim(Hist[iLoop]))+1);

      while  i < iMax do begin
         if copy(Hist[iLoop],i,1) = '#' then begin
            Hist[iLoop] := copy(Hist[iLoop], 1, i-1) + 'c' + copy(Hist[iLoop], i, iMax-i);
         end else begin
            Hist[iLoop] := copy(Hist[iLoop], 1, i-1) + '\' + copy(Hist[iLoop], i, iMax);
            inc(i);
            inc(iMax);
         end;
         inc(i);

      end;
      case iLoop of
         1 : mskHist1.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         2 : mskHist2.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         3 : mskHist3.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         4 : mskHist4.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
         5 : mskHist5.EditMask := Trim(Hist[iLoop]) + sComp + ';1;_';
      end;
   end;


end;

procedure TFrmLancaContabMT.mskHist1Enter(Sender: TObject);
begin
  inherited;
  mskHist1.SelLength := 0;
end;

procedure TFrmLancaContabMT.mskHist1Change(Sender: TObject);
begin
  inherited;
  If ( mskHist1.SelStart = 40 ) and ( mskHist1.SelLength = 0 ) then begin
     mskHist2.SetFocus;
     mskHist2.SelLength := 0;
  End;

end;

procedure TFrmLancaContabMT.mskHist2Change(Sender: TObject);
begin
  inherited;
  If ( mskHist2.SelStart = 40 ) and ( mskHist2.SelLength = 0 ) Then begin
     mskHist3.SetFocus;
     mskHist3.SelLength := 0;
  End;

end;

procedure TFrmLancaContabMT.mskHist2Exit(Sender: TObject);
begin
  inherited;
  if trim((sender as tmaskedit).text) = '' then dbreValor.SetFocus;
end;

procedure TFrmLancaContabMT.mskHist3Change(Sender: TObject);
begin
  inherited;
  If ( mskHist3.SelStart = 40 ) and ( mskHist3.SelLength = 0 ) Then begin
     mskHist4.SetFocus;
     mskHist4.SelLength := 0;
  End;

end;

procedure TFrmLancaContabMT.mskHist4Change(Sender: TObject);
begin
  inherited;
  If ( mskHist4.SelStart = 40 ) and ( mskHist4.SelLength = 0 ) Then begin
     mskHist5.SetFocus;
     mskHist5.SelLength := 0;
  End;
end;

procedure TFrmLancaContabMT.mskHist5Change(Sender: TObject);
begin
  inherited;
  If ( mskHist5.SelStart = 40 ) and ( mskHist5.SelLength = 0 ) Then
   dbreValor.SetFocus;
end;

procedure TFrmLancaContabMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  OrdemLancaRateado := 0; //Marilza Colpani SOL 128586/ Kintana 690153
  if MontaSelect.RetornouValor then begin
     AbreQry(StrToFloat(MontaSelect.ValoresChave[0]),True);
     lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                               IntToStr(cds.FieldByName('PLNNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
     VerificaEstornada;
     CmeCadastroAtualizaBotoes(self);
     iIdModulo := strToIntDef(MontaSelect.ValoresChave[1], -1);

     // Ricardo A. SOL 130350/941 KTN 745297
//     OrdemLancaRateado :=  Lancamento.RetornaQntLancamento(StrToFloat(MontaSelect.ValoresChave[0])) + 1;
     OrdemLancaRateado :=  Lancamento.RetornaQntLancamento(StrToFloat(MontaSelect.ValoresChave[0]));
     // FIM Ricardo A. SOL 130350/941 KTN 745297
  end;
end;

procedure TFrmLancaContabMT.FormActivate(Sender: TObject);
begin
  inherited;
  if Self.WindowState <> wsMaximized then Self.WindowState := wsMaximized;
  
  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;
  CdsHistorico.Data :=  HistoContab.ListHistoContab(Sistema.idempresa,tohCodigo,'');
  //
  CdsTipoOper.Data := ListTerceiros.ListTipoOper(False);
  //
  CdsElemen.Data := Demonstrativo.SelecionaElemDemonst(Sistema.IdEmpresa, 0, 0,'L',toeElem);

  if Sistema.UsaPlanoPatro then begin
     CdsPlano.Data := ListTerceiros.ListPlanoPrev;
     CdsPatro.Data := ListTerceiros.ListPlanoPatro;
  end;
end;


procedure TFrmLancaContabMT.SetaPlano(sData:String);
begin
   if not Contab.SelecionaPlanoData(Sistema.idEmpresa,sData) then begin
      MsgDlg(Contab.MessageInfo,'Aviso',mtWarning,[mbOk],0);
      dbedData.SetFocus;
      Exit;
   end;
   TStringField(cdsDet.FieldByName('PLACONTAD')).EditMask := Contab.MascaraContaData+ ';0; ';
   TStringField(cdsDet.FieldByName('PLACONTAC')).EditMask := Contab.MascaraContaData+ ';0; ';
   TFloatField(cdsDet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';

   // Alterado por Arnaldo V. Scarin
   // Para o chamado Sol = 124568 Kintana = 633456
   If sData <> '' then
   begin
     cmpContaDeb.Plano    := Contab.PlanoData;
     cmpContaDeb.Mascara  := Contab.MascaraContaData;
     cmpContaCre.Plano    := Contab.PlanoData;
     cmpContaCre.Mascara  := Contab.MascaraContaData;
   end;

   if CtrlSegregacao.FlgSegOrComFin or CtrlSegregacao.FlgSegOrAdmFin then
   begin
     TStringField(cdsMemoCalcSegrega.FieldByName('PLACONTAD')).EditMask := Contab.MascaraContaData+ ';0; ';
     TStringField(cdsMemoCalcSegrega.FieldByName('PLACONTAC')).EditMask := Contab.MascaraContaData+ ';0; ';
     TFloatField(cdsMemoCalcSegrega.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
   end;
end;

procedure TFrmLancaContabMT.MontaConta(sTipo,sConta : String);
begin
   if sConta <> '' then begin
      if not Periodo.RetornaPeriodoExercicioData(Sistema.idEmpresa,dbedData.Text) then begin
         MsgDlg(Periodo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         exit;
      end;
      if not ContaContabil.TestaContaContabil(Contab.PlanoData,Sistema.idEmpresa,Periodo.Periodo,Periodo.Exercicio,sConta,False,False) then begin
         MsgDlg('Conta Contábil '+sConta+' '+ContaContabil.MessageInfo,'Aviso',mtWarning,[mbOk],0);
         if sTipo = 'D' then cmpContaDeb.SetFocus else cmpContaCre.SetFocus;
         exit;
      end;
      if sTipo = 'D' then begin
         cdsDet.FieldByName('NOMECONTAD').AsString := ContaContabil.NomeConta;

         cdsCCustDeb.Data := ContaContabil.ListContasxCC(Contab.PlanoData,Sistema.idEmpresa,sConta,'',
                                                        tccSoAnaliticaCC,toNome);
         if ContaContabil.ObrigaCentroCusto = 'S' then begin
            dblkCCustoDeb.Enabled := true;
            dblkCCustoDeb.LookupValue := trim(cdsDet.FieldByName('CCUSTDEB').AsString);
            dblkCCustoDeb.Text        := cdsDet.FieldByName('NOMECCUSTOD').AsString;
            dblkCCustoDeb.SetFocus;
         end else begin
            dblkCCustoDeb.Enabled := false;
            cdsDet.FieldByName('CCUSTDEB').Clear;
         end;
         if ContaContabil.ObrigaSubConta = 'S' then begin
            dbedSubContaDeb.Enabled := true;
            btnSubContaDeb.Enabled := true;
            dbedSubContaDeb.Setfocus;
         end else begin
            dbedSubContaDeb.Enabled := false;
            btnSubContaDeb.Enabled := false;
            cdsDet.FieldByName('SUBCONTADEB').Clear;
         end;
         if cdsDet.FieldByName('ORIAPLDEB').isNull then
            cdsDet.FieldByName('ORIAPLDEB').AsString := 'A';
      end else begin
         cdsDet.FieldByName('NOMECONTAC').AsString := ContaContabil.NomeConta;
         cdsCCustCre.Data := ContaContabil.ListContasxCC(Contab.PlanoData,Sistema.idEmpresa,sConta,'',
                                                              tccSoAnaliticaCC,toNome);
         if ContaContabil.ObrigaCentroCusto = 'S' then begin
            dblkCCustoCred.Enabled := true;
            dblkCCustoCred.LookupValue := trim(cdsDet.FieldByName('CCUSTCRE').AsString);
            dblkCCustoCred.Text        := cdsDet.FieldByName('NOMECCUSTOC').AsString;
            dblkCCustoCred.Setfocus;
         end else begin
            dblkCCustoCred.Enabled := false;
            cdsDet.FieldByName('CCUSTCRE').Clear;
         end;
         if ContaContabil.ObrigaSubConta = 'S' then begin
            dbedSubContaCre.Enabled := true;
            btnSubContaCred.Enabled := true;
            dbedSubContaCre.Setfocus;
         end else begin
            dbedSubContaCre.Enabled := false;
            btnSubContaCred.Enabled := false;
            cdsDet.FieldByName('SUBCONTACRE').Clear;
         end;
         if cdsDet.FieldByName('ORIAPLCRE').isNull then
            cdsDet.FieldByName('ORIAPLCRE').AsString := 'O';
      end;
   end else begin
      //
      if sTipo = 'D' then begin
         dblkCCustoDeb.Enabled   := false;
         dbedSubContaDeb.Enabled := false;
         btnSubContaDeb.Enabled  := false;
         cdsDet.FieldByName('CCUSTDEB').Clear;
         cdsDet.FieldByName('SUBCONTADEB').Clear;
      end else begin
         //
         dblkCCustoCred.Enabled  := false;
         dbedSubContaCre.Enabled := false;
         btnSubContaCred.Enabled := false;
         cdsDet.FieldByName('CCUSTCRE').Clear;
         cdsDet.FieldByName('SUBCONTACRE').Clear;
      end;
   end;
end;

procedure TFrmLancaContabMT.btnSubContaDebClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Filtro.Delete(4);
  MontaSelectSubConta.Filtro.Delete(3);
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco(cdsDet.FieldByName('PLACONTAD').AsString,18)+'''');
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO = '+IntToStr(Contab.PlanoData));
  MontaSelectSubConta.Executar;
  if MontaSelectSubConta.RetornouValor then begin
     cdsDet.FieldByName('SUBCONTADEB').AsFloat   := StrToFloat(MontaSelectSubConta.ValoresChave[0]);
     cdsDet.FieldByName('NOMESUBCONTAD').AsString := MontaSelectSubConta.ValoresChave[1];
  end;
end;

procedure TFrmLancaContabMT.dbedSubContaDebExit(Sender: TObject);
begin
  inherited;
  if (trim(dbedSubContaDeb.Text) <> '')  and (trim(dbedSubContaDeb.Text) <> '0') then begin
     cdsSubContaDeb.Data := ContaContabil.ListContasxSC(Contab.PlanoData,Sistema.idEmpresa,
                            cdsDet.FieldByName('SUBCONTADEB').AsFloat, cdsDet.FieldByName('PLACONTAD').AsString,
                            toCodigo);
     if cdsSubContaDeb.IsEmpty then begin
        MsgDlg('Subconta não existe ou não é permitida para esta conta contábil','Aviso',mtWarning,[mbOk],0);
        dbedSubContaDeb.SetFocus;
        exit;
     end else begin
        cdsDet.FieldByName('NOMESUBCONTAD').AsString := cdsSubContaDeb.FieldByName('NOMESUBCONTA').AsString;
     end;
  end;
end;


procedure TFrmLancaContabMT.btnSubContaCredClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Filtro.Delete(4);
  MontaSelectSubConta.Filtro.Delete(3);
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLACONTA = '''+Espaco(cdsDet.FieldByName('PLACONTAC').AsString,18)+'''');
  MontaSelectSubConta.Filtro.Add('CONTASXSUBC.PLANO = '+IntToStr(Contab.PlanoData));
  MontaSelectSubConta.Executar;
  if MontaSelectSubConta.RetornouValor then begin
     cdsDet.FieldByName('SUBCONTACRE').AsFloat   := StrToFloat(MontaSelectSubConta.ValoresChave[0]);
     cdsDet.FieldByName('NOMESUBCONTAC').AsString := MontaSelectSubConta.ValoresChave[1];
  end;
end;

procedure TFrmLancaContabMT.dbedSubContaCreExit(Sender: TObject);
begin
  inherited;
  if (trim(dbedSubContaCre.Text) <> '')  and (trim(dbedSubContaCre.Text) <> '0') then begin
     cdsSubContaCre.Data := ContaContabil.ListContasxSC(Contab.PlanoData,Sistema.idEmpresa,
                           cdsDet.FieldByName('SUBCONTACRE').AsFloat, cdsDet.FieldByName('PLACONTAC').AsString,
                           toCodigo);

     if cdsSubContaCre.IsEmpty then begin
        MsgDlg('Subconta não existe ou não é permitida para esta conta contábil','Aviso',mtWarning,[mbOk],0);
        dbedSubContaCre.SetFocus;
        exit;
     end else begin
        cdsDet.FieldByName('NOMESUBCONTAC').AsString := cdsSubContaCre.FieldByName('NOMESUBCONTA').AsString;
     end;
  end;

end;

procedure TFrmLancaContabMT.dbedAtivProjExit(Sender: TObject);
begin
  inherited;
  if (dbedAtivProj.Text <> '') then begin
     cdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.idEmpresa,0,cdsDet.FieldByName('UNECODIGO').AsString,
                                     tapSoAnaliticaAP,toapCodigo);
     if cdsAtivProj.IsEmpty then begin
        MsgDlg('Atividade/Projeto não existe','Aviso',mtWarning,[mbOk],0);
        dbedAtivProj.SetFocus;
        exit;
     end else begin
        cdsDet.FieldByName('UNIDNEGOC').AsFloat     := cdsAtivProj.FieldByName('UNIDNEGOC').AsFloat;
        cdsDet.FieldByName('NOMEATIVPROJ').AsString := cdsAtivProj.FieldByName('NOME').AsString;
     end;
  end;
end;


procedure TFrmLancaContabMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  LBLESTORNADA.Visible := false;
  while not cdsDetMantem.Eof do cdsDetMantem.Delete;
  bGravouDet := False;
  AbreQry(-1,False);
  dbedData.Enabled := True;
  dbedData.SetFocus;
  lblPlanilha.Caption := 'Planilha Nº --- Lanc. Nº --- Data:';

  // Ricardo A. SOL 130350/941 KTN 745297
  //OrdemLancaRateado := 1;
  OrdemLancaRateado := 0;
  // FIM Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if (iIdModulo <> sistema.idmodulo) then
    if (MsgDlg('O Lançamento é de Origem de Outro Módulo. Deseja Realmente Alterar?',
       'Alteração de Lançamentos', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
    begin
      bbtnCancelarClick(sender);
      Abort;
    end;
  while not cdsDetMantem.Eof do cdsDetMantem.Delete;
  dbedData.Enabled := False;
  bGravouDet := True;
  if tbcDetalhe.CanFocus then tbcDetalhe.SetFocus;

 
end;

procedure TFrmLancaContabMT.FormShow(Sender: TObject);
begin
  inherited;
  bGravouDet := False;
  sbtnImprimir.Enabled := false;

  if  bVeioDaConsultaSaldo then
  begin
     AbreQry(dPlnDaConsultaSaldo,true);
     lblPlanilha.Caption := 'Planilha Nº ' + FloatToStr(cds.FieldByName('PLNPLANIL').AsFloat) + ' - Lanc. Nº ' +
                               IntToStr(cds.FieldByName('PLNNUMLAN').AsInteger)+' Data: '+cds.FieldByName('PLNDATDIA').AsString;
     VerificaEstornada;
  end;
end;

procedure TFrmLancaContabMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  bGravouDet := True;
  // Ricardo A. SOL 130350/941 KTN 745297
  AtualizaBotaoEditarDetalhe;
//  if cdsDet.FieldByName('ORDLANCARATEADO').asInteger <> -1 then
//    sbtnAltDet.Enabled := False
//  else
//    sbtnAltDet.Enabled := True;
  // FIM Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.bbtnOkDetClick(Sender: TObject);
var
  bAlterou :boolean;
begin
  bAlterou := cdsDet.State = dsEdit;
  if (Contab.PermiteZero = 'N') AND (dbreValor.Value = 0) then
  begin
    MsgDlg('Valor não Pode ser Zero','Erro',MtError,[mbOk],0);
     dbreValor.SetFocus;
    Exit;
  end;
  inherited;

  if bAlterou then
  begin
     AtuParamContab;
  end;


end;

procedure TFrmLancaContabMT.btnAtivProjExit(Sender: TObject);
begin
  inherited;
  if not Sistema.UsaPlanoPatro then
     if (bbtnOkDet.CanFocus) and (ActiveControl.Tag <> 99) then bbtnOkDet.SetFocus;
end;

procedure TFrmLancaContabMT.pnlPlanoPatroCExit(Sender: TObject);
begin
  inherited;
  if (bbtnOkDet.CanFocus) and (ActiveControl.Tag <> 99) then bbtnOkDet.SetFocus;

  if dblcPlanoPrevC.Text <> '' then
     cdsDet.FieldByName('NOMEPLANOPREV').AsString := CdsPlano.FieldByName('NOME').AsString;

  if dblcPatroC.Text <> '' then
     cdsDet.FieldByName('NOMEPATRO').AsString := CdsPatro.FieldByName('NOME').AsString;
     
end;

procedure TFrmLancaContabMT.dbgrdDetDblClick(Sender: TObject);
begin
  //inherited;
  cdsDet.Edit;
  if cdsDet.FieldByName('MARCA').AsString = 'S' then
     cdsDet.FieldByName('MARCA').AsString := 'N'
  else
     cdsDet.FieldByName('MARCA').AsString := 'S';
  cdsDet.Post;
end;

procedure TFrmLancaContabMT.sbtnEstornoClick(Sender: TObject);
begin
  inherited;
  if (cds.State = dsInsert) or (cds.IsEmpty)  then Exit;

  Application.CreateForm(TfrmDataMT, frmDataMT);
  frmDataMT.dCodPlanilha :=  cds.FieldByName('PLNCODIGO').AsFloat;
  frmDataMT.dUsuario     :=  Sistema.idUsuario;
  frmDataMT.dModulo      :=  cds.FieldByName('IDMODULO').asFloat;
  frmDataMT.ShowModal;
  sbtnEstorno.Down := false;

end;

procedure TFrmLancaContabMT.cmpContaDebExit(Sender: TObject);
begin
  inherited;
  If (cmpContaDeb.Valida = VcOK) Then
  Begin
     cdsDet.FieldByName('PLACONTAD').AsString := cmpContaDeb.Conta.Numero;
     if cmpContaDeb.Conta.Numero <> '' then
        MontaConta('D',cmpContaDeb.Conta.Numero)
     else
        cdsDet.FieldByName('PLACONTAD').Clear;
  End;

end;

procedure TFrmLancaContabMT.cmpContaCreExit(Sender: TObject);
begin
  inherited;
  If (cmpContaCre.Valida = VcOK) Then
  Begin
    cdsDet.FieldByName('PLACONTAC').AsString := cmpContaCre.Conta.Numero;
    if cmpContaCre.Conta.Numero <> '' then
       MontaConta('C',cmpContaCre.Conta.Numero)
    else
       cdsDet.FieldByName('PLACONTAC').Clear;
  End;

end;

procedure TFrmLancaContabMT.VerificaEstornada;
var
  numpla  :string;
  datapla :string;
  i :Integer;
begin
   if cds.FieldByname('PLNPLANESTORNO').isNull then
   begin
      LBLESTORNADA.Visible := false;
      Exit;
   end else
   begin
      LBLESTORNADA.Caption := '';
      LBLESTORNADA.Visible := true;
      sqlEstornada.Prepare;
      sqlEstornada.ParamByName('PLNCODIGO').asFloat := cds.FieldByname('PLNPLANESTORNO').asFloat;
      sqlEstornada.Open;

      numpla  := FloatToStr(cdsEstornada.FieldByName('PLNPLANIL').asFloat);
      datapla := DateToStr(cdsEstornada.FieldByName('PLNDATDIA').asDateTime);

      LBLESTORNADA.Caption := 'Planilha Resultante do Estorno da Planilha:' + numpla +' e Data:'+datapla;

      for i := 1 to 6 do
      begin
        LBLESTORNADA.Refresh;
        tbcDetalhe.Refresh;
        Application.ProcessMessages;

        LBLESTORNADA.Visible := false;
        Sleep(100);

        LBLESTORNADA.Refresh;
        tbcDetalhe.Refresh;
        Application.ProcessMessages;

        LBLESTORNADA.Visible := True;
        Sleep(100);

        LBLESTORNADA.Refresh;
        tbcDetalhe.Refresh;
        Application.ProcessMessages;
      end;

   end;
end;

procedure TFrmLancaContabMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin

  inherited;
  //=========================================
  // Isto só é feito se a tela de lancamento
  // vier da consulta de saldo
  //==========================================
  if  bVeioDaConsultaSaldo then
  begin
     sbtnAlterar.Enabled := True;
     sbtnApagar.Enabled  := True;
  end;


   if (Contab.PacDebCre = 'B')  then
   begin
      if dPlnCodContab <> 0 then
      begin
        if dPlnCodContab <> cds.FieldByName('PLNCODIGO').asFloat then
        begin
          cdsAux.Data := Lancamento.SelecionaPlanilhas(dPlnCodContab,0,0,Sistema.idEmpresa,0,0,tpSoPeriodo,
                                             '','','','',teAmbos,tolPlnCodigo);
          MsgDlg('Proibido Efetuar Operações com a Planilha Selecionada.'+CHR(13)+'Débito não bate com o Crédito na Planilha '+cdsAux.FieldByName('PLNPLANIL').AsString+' do dia '+cdsAux.FieldByName('PLNDATDIA').AsString+'.'+CHR(13)+'Acerte a planilha indicada para ter acesso as demais.','Aviso',MtWarning,[mbOk],0);
          sbtnAlterar.Enabled := False;
          sbtnApagar.Enabled  := False;
          sbtnEstorno.Enabled := False;
        end else
        begin
          sbtnAlterar.Enabled := True;
          sbtnApagar.Enabled  := True;
          sbtnEstorno.Enabled := True;
        end;
        sbtnInserir.Enabled  := False;
        sbtnProcurar.Enabled := True;
      end;
   end;
     AutorizarForm(afSoDesabilitar);
end;

procedure TFrmLancaContabMT.CalculaDebCre;
var
  bPosicao: TBookmark;
begin
  If cds.State In DsEditModes then
  Begin
     If not cds.FieldByName('PLNCODIGO').IsNull then
     Begin
        bPosicao := Cds.GetBookmark;
        cdsDet.DisableControls;
        Try
          cdsDet.First;
          Cds.FieldByName('PLNTOTDEB').AsFloat := 0;
          Cds.FieldByName('PLNTOTCRE').AsFloat := 0;
          WHile Not CdsDet.Eof Do
          Begin
             If (Trim(CdsDet.FieldByName('PLACONTAC').AsString) <>  '') And (Trim(CdsDet.FieldByName('PLACONTAD').AsString) <>  '') Then
             Begin
                  Cds.FieldByName('PLNTOTDEB').AsFloat := Cds.FieldByName('PLNTOTDEB').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
                  Cds.FieldByName('PLNTOTCRE').AsFloat := Cds.FieldByName('PLNTOTCRE').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
             End
             Else
             If (Trim(CdsDet.FieldByName('PLACONTAC').AsString) <>  '') Then
             Begin
                 Cds.FieldByName('PLNTOTCRE').AsFloat := Cds.FieldByName('PLNTOTCRE').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
             End
             Else
             If (Trim(CdsDet.FieldByName('PLACONTAD').AsString) <>  '') Then
             Begin
                 Cds.FieldByName('PLNTOTDEB').AsFloat := Cds.FieldByName('PLNTOTDEB').AsFloat + CdsDet.FieldByName('LACVALOR').AsFloat;
             End;

             CdsDet.Next;
          End;
          Cds.FieldByName('DIFERENCA').AsFloat := Cds.FieldByName('PLNTOTDEB').AsFloat - Cds.FieldByName('PLNTOTCRE').AsFloat;
        Finally
             cdsDet.GotoBookmark (bPosicao);
             cdsDet.FreeBookmark (bPosicao);
           cdsDet.EnableControls;
        End;
     End;
  End;

end;

procedure TFrmLancaContabMT.AtuParamContab;
begin
  //-----------------------------------------------------------------
  // grava o codigo da planilha no paramcontab
  //-----------------------------------------------------------------
  if Contab.PacDebCre = 'B' then
  begin
     if cds.FieldByName('DIFERENCA').asFloat <> 0 then
     begin
       ProcessaContab.AtualizaParamContab(Sistema.idEmpresa,cds.FieldByName('PLNCODIGO').asFloat);
       dPlnCodContab  := cds.FieldByName('PLNCODIGO').asFloat;
     end else
     begin
       if dPlnCodContab =  cds.FieldByName('PLNCODIGO').AsFloat then
       begin
         ProcessaContab.AtualizaParamContab(Sistema.idEmpresa,0);
         dPlnCodContab := 0;
       end;
     end;
  end;


end;

procedure TFrmLancaContabMT.bbtnConfirmarClick(Sender: TObject);
begin
  AtuParamContab;
  inherited;
end;

procedure TFrmLancaContabMT.bbtnCancelarClick(Sender: TObject);
begin
  AtuParamContab;
  inherited;
end;

procedure TFrmLancaContabMT.bbtnSairClick(Sender: TObject);
begin
  AtuParamContab;
  inherited;
end;


procedure TFrmLancaContabMT.ConfigMontaSelect;
var
  sql :string;
begin
  //-------------------------------------------------------
  // Configura o Monta select
  //-------------------------------------------------------
  // 1 - Define as tabelas
  MontaSelect.Tabelas.Clear;
  MontaSelect.Tabelas.Add('PLANILHA');
  MontaSelect.Tabelas.Add('MODULO');
  MontaSelect.Tabelas.Add('PERIODO');

  // 2 - Define  o campo a ser retornado
  MontaSelect.CamposChave.Clear;
  MontaSelect.CamposChave.Add('PLANILHA.PLNCODIGO');

  MontaSelect.CamposChave.Add('MODULO.IDMODULO');

  // 3 - Define  o campo a ser retornado
  MontaSelect.Colunas.Clear;
  MontaSelect.Colunas.Add('PLANILHA.PEREXERCICIO');
  MontaSelect.Colunas.Add('PERIODO.PERNOME');
  MontaSelect.Colunas.Add('PLANILHA.PLNDATDIA');
  MontaSelect.Colunas.Add('PLANILHA.PLNDATDIA');
  MontaSelect.Colunas.Add('PLANILHA.PLNPLANIL');
  MontaSelect.Colunas.Add('PLANILHA.PLNNUMLAN');
  MontaSelect.Colunas.Add('PLANILHA.PLNTOTDEB');
  MontaSelect.Colunas.Add('PLANILHA.PLNTOTCRE');
  MontaSelect.Colunas.Add('MODULO.NOMEMODULO');

  MontaSelect.TipodeDado.Clear;
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('C');
  MontaSelect.TipodeDado.Add('D');
  MontaSelect.TipodeDado.Add('D');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('N');
  MontaSelect.TipodeDado.Add('C');


  // 4 - Descrição, largura, mascara...
  MontaSelect.Descricao.Clear;
  MontaSelect.Larguras.Clear;
  MontaSelect.Descricao.Add('Exercício');
  MontaSelect.Descricao.Add('Período');
  MontaSelect.Descricao.Add('Data Inicial');
  MontaSelect.Descricao.Add('Data Final');
  MontaSelect.Descricao.Add('Nº Planilha');
  MontaSelect.Descricao.Add('Nº do Lanc');
  MontaSelect.Descricao.Add('Total Débito');
  MontaSelect.Descricao.Add('Total Crédito');
  MontaSelect.Descricao.Add('Módulo Origem');

  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('25');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('10');
  MontaSelect.Larguras.Add('50');

  MontaSelect.Mascaras.Clear;
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('');
  MontaSelect.Mascaras.Add('#,##0.00');
  MontaSelect.Mascaras.Add('#,##0.00');
  MontaSelect.Mascaras.Add('');


  // 5 - Define filtros...
  MontaSelect.Filtro.Clear;
  MontaSelect.Filtro.Add('PLANILHA.IDMODULO     = MODULO.IDMODULO');
  MontaSelect.Filtro.Add('PLANILHA.PEREXERCICIO = PERIODO.PEREXERCICIO');
  MontaSelect.Filtro.Add('PLANILHA.PERNUMERO    = PERIODO.PERNUMERO');
  MontaSelect.Filtro.Add('PLANILHA.IDPESSOA     = PERIODO.IDPESSOA');

  sql :=   MontaSelect.MontaSQL;

end;

procedure TFrmLancaContabMT.ProcuraSegregaCriter;
var
  iIdPlanoPrev, iIdPatro, iIdSegregaCriter: integer;
  sPlaConta: string;
begin
  sPlaConta := trim(cmpContaDeb.Conta.Numero);
  if sPlaConta = '' then sPlaConta := trim(cmpContaCre.Conta.Numero);
  iIdPlanoPrev := StrToIntDef(dblcPlanoPrevC.LookupValue, -1);
  iIdPatro     := StrToIntDef(dblcPatroC.LookupValue, -1);
  if (sPlaConta <> '') and (iIdPlanoPrev <> -1) and (iIdPatro <> -1) then begin
    // nehuma segregação foi informada pelo usuário
    if dbCboSegregaCriter.Text = '' then begin
      iIdSegregaCriter := CtrlSegregacao.RetornaSegregaCriter(Contab.PlanoParam, iIdPlanoPrev, iIdPatro, trim(cmpContaDeb.Conta.Numero), sPlaConta);
      // achada critério para segregação com parâmetros informados, colocar como default
      if iIdSegregaCriter <> -1 then begin
        cdsDet.FieldByName('IDSEGREGACRITER').AsInteger := iIdSegregaCriter;
        // verificar se a data está preenchida
        if dbEdSegregaData.Text = '' then begin
          cdsDet.FieldByName('DATASEGREGACRITER').AsDateTime := dbedData.DateTime;;
        end;
      end;
    end;
  end;
end;

function TFrmLancaContabMT.VerificaPreenchimentoDet: boolean;
begin
  Result := False;
  try

    if not cdsDet.FieldByName('IDSEGREGACONTR').IsNull then begin
      Result := true;
      exit;
    end;

    // verificações para segregação virtual
    if CtrlSegregacao.SegregaVirtual then
    begin
      // plano = comum ou plano = adm ou patro = comum
      if (CtrlSegregacao.PlanoPrevComum = cdsDet.FieldByName('IDPLANOPREV').AsInteger) or
         (CtrlSegregacao.PlanoPrevAdm   = cdsDet.FieldByName('IDPLANOPREV').AsInteger) or
         (CtrlSegregacao.PatroComum     = cdsDet.FieldByName('IDPATRO').AsInteger) then
      begin
        // se plano = comum ou plano = adm => patro também deve ser = comum
        if not ((CtrlSegregacao.PlanoPrevComum = cdsDet.FieldByName('IDPLANOPREV').AsInteger) or
                (CtrlSegregacao.PlanoPrevAdm   = cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
          raise EValidacao.CreateVal('Para escolher a Patrocinadora "Comum" o Plano também deve ser "Comum" ou "Administrativo"!', dblcPlanoPrevC);
        if (CtrlSegregacao.PatroComum     <> cdsDet.FieldByName('IDPATRO').AsInteger) then
          raise EValidacao.CreateVal('Para escolher o Plano "Comum" ou "Administrativo" a Patronidora também deve ser "Comum"!', dblcPatroC);

        // aqui o critério de segregação é obrigatório
        // se a conta não for a de segregação
        if ( not CtrlSegregacao.ContaContabilDeSegregacao( cmpContaDeb.Conta.Numero )) and
           ( not CtrlSegregacao.ContaContabilDeSegregacao( cmpContaCre.Conta.Numero )) then
        begin
          if ( dbCboSegregaCriter.Text = '') then
            raise EValidacao.CreateVal('O critério para segregação é obrigatório!', dbCboSegregaCriter);
          if dbEdSegregaData.Text = '' then
            raise EValidacao.CreateVal('A data do critério para segregação é obrigatória!', dbEdSegregaData);
        end;
      end
      else
      begin
        // aqui é plano comum e patro comum
        // aqui o critério de segregação é obrigatório
        if dbCboSegregaCriter.Text <> '' then
          raise EValidacao.CreateVal('O critério para segregação só deve ser preenchido para lançamentos com Plano "Comum"/"Administrativo" e Patro "Comum"!', dbCboSegregaCriter);
        if dbEdSegregaData.Text <> '' then
          raise EValidacao.CreateVal('O data critério para segregação só deve ser preenchido para lançamentos com Plano "Comum"/"Administrativo" e Patro "Comum"!', dbEdSegregaData);
      end;
    end;

    if not CtrlSegregacao.SegregaVirtual then
    begin
      if ((dblcPlanoPrevC.Text = '') or (dblcPatroC.Text = '')) and (dbCboSegregaCriter.Text = '') then
      begin
        raise EValidacao.CreateVal('Devem ser informados o Plano e a Patrocinadora ou um Critério de Segregação!', pnlPlanoPatroC);
      end
      else
      begin
        if (dblcPlanoPrevC.Text <> '') and (dblcPatroC.Text <> '') then
          if not( CtrlPlanPrevContabPatro.ValidaPlanoPatro(cdsDet.FieldByName('IDPATRO').AsInteger,
                                                           cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
          raise EValidacao.CreateVal('Não existe relacionamento entre Patrocinadora e Plano escolhidos!', dblcPatroC);
      end;
      if (dbCboSegregaCriter.Text <> '') and (dbEdSegregaData.Text = '') then
      begin
        raise EValidacao.createVal('Informe a Data do Critério.', dbEdSegregaData);
      end;
    end
    else
      if (dblcPlanoPrevC.Text <> '') and (dblcPatroC.Text <> '') then
          if not( CtrlPlanPrevContabPatro.ValidaPlanoPatro(cdsDet.FieldByName('IDPATRO').AsInteger,
                                                           cdsDet.FieldByName('IDPLANOPREV').AsInteger)) then
          raise EValidacao.CreateVal('Não existe relacionamento entre Patrocinadora e Plano escolhidos!', dblcPatroC);
  except
    on ev : EValidacao do begin
      if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TFrmLancaContabMT.CmeDetalheApplyInsert(sender: TObject;
  var Accept: Boolean);
begin

  Accept := VerificaPreenchimentoDet;
  inherited;
end;

procedure TFrmLancaContabMT.grdProvaZeroLancTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsProvaZeroLanc.IndexFieldNames := AFieldName;
end;

                                             
procedure TFrmLancaContabMT.grdProvaZeroLancCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if State <> [gdSelected] then begin
     if not Highlight then begin
        if not IsFloatZero( cdsProvaZeroLanc.FieldByName('TOT_SALDO').AsFloat ) then begin
           ABrush.Color := $00A0A0FC;
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;



procedure TFrmLancaContabMT.RegraProvaZero;
begin
  //Lançamentos

  cdsProvaZeroLanc.Data := Lancamento.SelecionaProvaZero( Cds.FieldByName('PLNCODIGO').AsFloat, 1 );
  ligaLabelProvazero(cdsProvaZeroLanc);
  //Memória de cálculo de segregação
  cdsProvaZeroMemo.Data := Lancamento.SelecionaProvaZero(cds.FieldByName('PLNCODIGO').AsFloat,  2);
  if not lbProvaZero.Visible then
    ligaLabelProvazero(cdsProvaZeroMemo);

  //Lançamento mais Memória de Cálculo
  cdsNovaRegraProvaZero.Data := Lancamento.getProvaZeroLancamentoMaisMemoCalc(Cds.FieldByName('PLNCODIGO').AsFloat);
  if not lbProvaZero.Visible then
    ligaLabelProvazero(cdsNovaRegraProvaZero);

end;

procedure TFrmLancaContabMT.ligaLabelProvazero(cds: TclientDataset);
begin
  lbProvaZero.Visible := false;
  cds.DisableControls;
  cds.first;
  while not cds.eof do
  begin
    if not IsFloatZero( cds.FieldByName('TOT_SALDO').AsFloat ) then
    begin
      lbProvaZero.Visible := true;
      break;
    end;
    cds.next;
  end;
  cds.EnableControls;  
end;

procedure TFrmLancaContabMT.tbcDetalheChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if CdsDet.State in dsEditModes then AllowChange := false
  else inherited;
end;


procedure TFrmLancaContabMT.sbtnApagarClick(Sender: TObject);
begin
  if (iIdModulo <> sistema.idmodulo) then
    if (MsgDlg('O Lançamento é de Origem de Outro Módulo. Deseja Realmente Excluir?',
       'Exclusão de Lançamentos', mtConfirmation, [mbYes,mbNo],0) = mrNo) then
    begin
      bbtnCancelarClick(sender);
      Abort;
    end;

  inherited;
end;

procedure TFrmLancaContabMT.cdsDetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  If (not cds.FieldByName('PLNCODIGO').IsNull) and
     (cdsDet.FieldByName('MARCA').AsString <> 'S') then begin
    AbreQry(cds.FieldByName('PLNCODIGO').AsInteger, false);

    CalculaDebCre;
  end;
end;

procedure TFrmLancaContabMT.cdsDetAfterDelete(DataSet: TDataSet);
begin
  inherited;
  // FAZER UM REFRESH PARA PEGAR OS LANÇAMENTOS CRIADOS PELA SEGREGAÇÃO VIRTUAL
  If (not cds.FieldByName('PLNCODIGO').IsNull) and
     (cdsDet.FieldByName('MARCA').AsString <> 'S') then begin
    AbreQry(cds.FieldByName('PLNCODIGO').AsInteger, false);

    CalculaDebCre;
  end;
end;

procedure TFrmLancaContabMT.cdsDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  // FAZER UM REFRESH PARA PEGAR OS LANÇAMENTOS CRIADOS PELA SEGREGAÇÃO VIRTUAL
  If (not cds.FieldByName('PLNCODIGO').IsNull) and
     (cdsDet.FieldByName('MARCA').AsString <> 'S') then begin
    AbreQry(cds.FieldByName('PLNCODIGO').AsInteger, false);

    CalculaDebCre;
  end;
end;



procedure TFrmLancaContabMT.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('PLNTOTDEB')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('PLNTOTCRE')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('DIFERENCA')).DisplayFormat := '#,##0.00;(#,##0.00)';
end;




procedure TFrmLancaContabMT.cdsProvaZeroLancAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('TOT_DEBITO')).DisplayFormat  := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('TOT_CREDITO')).DisplayFormat := '#,##0.00;(#,##0.00)';
  TFloatField(DataSet.FieldByName('TOT_SALDO')).DisplayFormat   := '#,##0.00;(#,##0.00)';
end;

procedure TFrmLancaContabMT.grdProvaZeroMemoTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  cdsProvaZeroMemo.IndexFieldNames := AFieldName;
end;

procedure TFrmLancaContabMT.grdProvaZeroMemoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;

  if State <> [gdSelected] then begin
     if not Highlight then begin
        if ( not IsFloatZero( (cdsProvaZeroMemo.FieldByName('TOT_SALDO').AsFloat ) ) ) then begin
           ABrush.Color := $00A0A0FC; // vermelho claro
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;

end;

procedure TFrmLancaContabMT.TrataPanels(memocalc: boolean);
begin
  if ( memocalc ) then
  begin
     pnlProvaZeroMemo.Visible := true;
     pnlLaneMemo.Visible      := true;
  end
  else
  begin
     splitter2.Visible        := false;
     pnlProvaZeroMemo.Visible := false;
     pnlLaneMemo.Visible      := false;
     pnlProvaZeroLanc.Align   := alClient;
  end
end;


procedure TFrmLancaContabMT.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  dblcPlanoPrevC.Text := cdsPlanoPatro.fieldByName('Plano').AsString;
  dblcPatroC.Text := cdsPlanoPatro.fieldByName('Patro').AsString;
end;

procedure TFrmLancaContabMT.grdLaneMemoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if State <> [gdSelected] then begin
     if not Highlight then begin
        if ( not IsFloatZero( (cdsNovaRegraProvaZero.FieldByName('TOT_SALDO').AsFloat ) ) ) then begin
           ABrush.Color := $00A0A0FC; // vermelho claro
        end else begin
           ABrush.Color := clWhite;
        end;
     end;
  end else begin
     ABrush.Color := clHighLight;
     AFont.Color  := clHighLightText;
  end;
end;

procedure TFrmLancaContabMT.dbCboSegregaCriterExit(Sender: TObject);
begin
  inherited;
  //Cássio - SOL Nº 125469 KINTANA Nº 633457 - Início
  //Os campos Plano e Patrocinadora não podem ser preenchidos se o campo
  //Critério para Segregação estiver preenchido.
  if not CtrlSegregacao.SegregaVirtual then
  begin
    if trim(dbCboSegregaCriter.Text) <> '' then
    begin
    //Se o campo critério para segregação for preenchido, os campos plano e
    //patrocinadora serão limpados e bloqueados
      dblcPlanoPrevC.Clear;
      CdsDet.FieldByName('IDPLANOPREV').AsInteger := -1;

      dblcPlanoPrevC.Enabled := False;

      dblcPatroC.Clear;
      CdsDet.FieldByName('IDPLANOPREV').AsInteger := -1;
      dblcPatroC.Enabled := False;
    end
    else
    begin
      dblcPlanoPrevC.Enabled := True;
      dblcPatroC.Enabled := True;
      dbEdSegregaData.Clear;
    end;
  end;
  //Cássio - SOL Nº 125469 KINTANA Nº 633457 - Fim
end;

procedure TFrmLancaContabMT.CmeDetalheAfterConfirma(Sender: TObject);
begin
  inherited;
  // Cássio  - SOL Nº 128681 KINTANA Nº 691677
  // Caso haja problemas durante a inclusão os ocmponents continuam habilitados
  if (bGravouDet) then
  begin
    // Cássio  - SOL Nº 128681 KINTANA Nº 691677
    // incluído "not" na condição para que mantenha os compoenenets habilitados
    // se for Segergação Virtual.
    if not CtrlSegregacao.SegregaVirtual then
    begin
      //Cássio - SOL Nº 125469 KINTANA Nº 633457
      //Habilita os componentes após a a inserção.
      dblcPlanoPrevC.Enabled := trim(dbCboSegregaCriter.text) = '';
      dblcPatroC.Enabled := trim(dbCboSegregaCriter.text) = '';

      dbCboSegregaCriter.Enabled := ((trim(dblcPlanoPrevC.text) = '') and (trim(dblcPatroC.Text) = ''));
    end;
  end;

  // Ricardo A. SOL 130350/941 KTN 745297
  //Cássio - SOL Nº 125469 KINTANA Nº 633457
//  OrdemLancaRateado := OrdemLancaRateado + 1;
  //Habilita os componentes após a a inserção.
  // Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.dblcPlanoPrevCExit(Sender: TObject);
begin
  inherited;
  if not CtrlSegregacao.SegregaVirtual then
  begin
    dbCboSegregaCriter.Enabled := not ((trim(dblcPlanoPrevC.Text) <> '') and (trim(dblcPatroC.Text) <> ''));
    dbEdSegregaData.Enabled := not ((trim(dblcPlanoPrevC.Text) <> '') and (trim(dblcPatroC.Text) <> ''));
    if not dbCboSegregaCriter.Enabled then
    begin
      dbEdSegregaData.Clear;
      dbEdSegregaData.Enabled := False;
    end;
  end;
end;

procedure TFrmLancaContabMT.dblcPatroCCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not CtrlSegregacao.SegregaVirtual then
  begin
    dbCboSegregaCriter.Enabled := not ((trim(dblcPlanoPrevC.Text) <> '') and (trim(dblcPatroC.Text) <> ''));
    dbEdSegregaData.Enabled := not ((trim(dblcPlanoPrevC.Text) <> '') and (trim(dblcPatroC.Text) <> ''));

    if not dbCboSegregaCriter.Enabled then
    begin
      dbEdSegregaData.Clear;
      dbEdSegregaData.Enabled := False;
    end;
  end;
end;

procedure TFrmLancaContabMT.dbCboSegregaCriterCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //Cássio - SOL Nº 125469 KINTANA Nº 633457 - Início
  //Os campos Plano e Patrocinadora não podem ser preenchidos se o campo
  //Critério para Segregação estiver preenchido.
  if not CtrlSegregacao.SegregaVirtual then
  begin
    if trim(dbCboSegregaCriter.Text) <> '' then
    begin
    //Se o campo critério para segregação for preenchido, os campos plano e
    //patrocinadora serão limpados e bloqueados
      dblcPlanoPrevC.Clear;
      dblcPlanoPrevC.ClearSelection;
      dblcPlanoPrevC.Enabled := False;

      dblcPatroC.Clear;

      dblcPatroC.Enabled := False;
    end
    else
    begin
      dblcPlanoPrevC.Enabled := True;
      dblcPatroC.Enabled := True;
      dbEdSegregaData.Clear;
    end;
  end;
  //Cássio - SOL Nº 125469 KINTANA Nº 633457 - Fim
end;

function TFrmLancaContabMT.VerificaLancRateado(
  iOrdLanca: integer): boolean;
var
  iQntRateio : integer;
  _cds : TCMClientDataSet;
begin
  Result := iOrdLanca = -1;
//  _cds := TCMClientDataSet.Create(nil);
//  iQntRateio := 0;
//  try
//    _cds.Data := cdsDet.Data;
//    _cds.First;
//    Result := False;
//
//    if cdsDet.FieldByName('ORDLANCARATEADO').asInteger = -1 then
//    begin
//      Result := True;
//      Exit;
//    end
//    else
//    begin
//      while not _cds.eof do
//      begin
//        if _cds.FieldByName('ORDLANCARATEADO').asInteger = iOrdLanca then
//          Inc(iQntRateio);
//          _cds.Next;
//      end;
//
//      if iQntRateio > 1 then
//        Result:= False
//      else
//        Result := True;
//    end;
//  finally
//    FreeAndNil(_cds);
//  end;
end;

procedure TFrmLancaContabMT.dbgrdDetRowChanged(Sender: TObject);
begin
  inherited;
  if dsDet.State in [dsBrowse] then
  // Ricardo A. SOL 130350/941 KTN 745297
//    if not CtrlSegregacao.SegregaVirtual then
//      if not VerificaLancRateado(cdsDet.FieldByName('ORDLANCARATEADO').asInteger) then
//        sbtnAltDet.Enabled := False
//      else
//        sbtnAltDet.Enabled := True;
    AtualizaBotaoEditarDetalhe;
  // Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   if dsDet.State in [dsBrowse] then
   // Ricardo A. SOL 130350/941 KTN 745297
     AtualizaBotaoEditarDetalhe;
//    if not CtrlSegregacao.SegregaVirtual then
//      if not VerificaLancRateado(cdsDet.FieldByName('ORDLANCARATEADO').asInteger) then
//        sbtnAltDet.Enabled := False
//      else
//        sbtnAltDet.Enabled := True;
  // FIM Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.tbcDetalheChange(Sender: TObject);
begin
  inherited;

  // Ricardo A. SOL 130350/941 KTN 745297
  // Lançamentos
  if ( pgctrlDetalhe.ActivePageIndex = 0 ) then
    AtualizaBotaoEditarDetalhe;
  // FIM Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.AtualizaBotaoEditarDetalhe;
begin
  // Ricardo A. SOL 130350/941 KTN 745297
  sbtnAltDet.Enabled :=  Cds.Active and ( Cds.State in [ dsEdit, dsInsert ] ) and
    CdsDet.Active and ( CdsDet.State = dsBrowse ) and
    VerificaLancRateado( cdsDetORDLANCARATEADO.AsInteger );
  // FIM Ricardo A. SOL 130350/941 KTN 745297
end;

procedure TFrmLancaContabMT.sbtnImprimirClick(Sender: TObject);
begin
  //inherited;
  // Felipe Santos SOL 184701 ktn 1747036
    try
    RptAvisoLan := TRptAvisoLan.Create(Self);
    RptAvisoLan.CmpRptCM.ParamValues[0].AsString   := datetostr(dbedData.date);
    RptAvisoLan.CmpRptCM.ParamValues[2].AsInteger  := dbedPlanilha.Field.Value;
    RptAvisoLan.CmpRptCM.ParamValues[3].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[4].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[5].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[6].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[7].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[8].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[9].AsInteger  := 0;
    RptAvisoLan.CmpRptCM.ParamValues[10].AsInteger := 0;
    RptAvisoLan.CmpRptCM.ParamValues[11].AsInteger := 0;
    RptAvisoLan.CmpRptCM.ParamValues[12].AsInteger := 0;
    RptAvisoLan.CmpRptCM.ParamValues[15].AsString  := '0';
    RptAvisoLan.CrmRptCM.idEmpresa := sistema.idEmpresa;
    RptAvisoLan.rptAvisoLan.PrinterSetup.DocumentName := 'Aviso de Lançamento';

    RptAvisoLan.CrmRptCMBeforePrint(Sender);

    TfrmPreview.CreateModalPreview(Application,
                                   RptAvisoLan.rptAvisoLan,
                                   RptAvisoLan.rptAvisoLan.PrinterSetup.DocumentName);
  finally
    FreeAndNil(frmParamAvisoLan);
    FreeAndNil(RptAvisoLan);
  end;
end;

procedure TFrmLancaContabMT.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if dbedData.date <> 0 then
  begin
  sbtnImprimir.enabled := true;
  end;
   if ds.State in [dsInsert, dsEdit] then
   begin
   sbtnImprimir.Enabled := false;
  end;
end;

procedure TFrmLancaContabMT.sbtnProcurarClick(Sender: TObject);
begin
   dbedPlanilha.Text := '';
   dbedData.Date := 0;
   sbtnImprimir.Enabled := false;
   inherited;

end;

end.





