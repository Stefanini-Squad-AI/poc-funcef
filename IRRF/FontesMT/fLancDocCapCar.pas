{********************************************************************************
Analista.: Arnaldo V. Scarin
Data.....: 12/11/2009
Kintana..: 123357
Sol......: 616264
Descrição: Inclusão da Funcionalidade de Manutenção de Documentos (AP)
********************************************************************************}
unit fLancDocCapCar;

interface

uses
  WIndows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97,
  MAHlpBtn, StdCtrls, Buttons, Grids, TB97Tlbr, TB97Ctls, IvDictio,
  IvMulti, IvEMulti, CMProcuraMask, CMProcuraSubTipo, CMDBLookupCombo,
  ppComm, ppProd, ppClass, ppReport, ppTypes, CMProcura, EditReg,
  wwdbdatetimepicker, CMDateTimePicker, Mask, CmEventosCadastro, ImgList,
  DBClient, uCMClientDataSet, uCmSqlParams, uCMTypes, FCadastroMestreDetMT,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
  TREdit, wwdbedit, DBCtrls, uCtrlPeriodo, uCtrlDocumento, uCtrlLancDocCapCarIR,
  uCtrlPadroes, uCtrlIntBanco;

type
  TContabDoc = record
    PLANO         : integer;
    CODSUBCONTA   : integer;
    PLACONTA      : string;
    CODCENTROCUSTO: string;
  end;

  TfrmLancDocCAPCAR = class(TFrmCadastroMestreDetMT)
    dsContabil: TwwDataSource;
    tbsContabil: TTabSheet;
    dbgrdContabil: TwwDBGrid;
    pnlContabil: TPanel;
    lblCCusto: TLabel;
    lblAtividade: TLabel;
    lblValorMoedaCon: TLabel;
    lblValorCorrenteCon: TLabel;
    lblSubConta: TLabel;
    dbgDebitoCredito: TDBRadioGroup;
    gbHistorico: TGroupBox;
    dblcCCusto: TwwDBLookupCombo;
    dblcAtividade: TwwDBLookupCombo;
    dblcSubConta: TwwDBLookupCombo;
    sbtnEstornar: TToOlbarButton97;
    tbsLancamento: TTabSheet;
    dbgLancamentos: TwwDBGrid;
    dsLancamento: TwwDataSource;
    TbsAlteradores: TTabSheet;
    PnlAlteradores: TPanel;
    CContabil: TCMProcuraMaskContabil;
    reValorCorrenteCon: TDBRealEdit;
    reValorMoedaCon: TDBRealEdit;
    Bevel3: TBevel;
    TbsGeral: TTabSheet;
    GpBarras: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    LblFormaPag: TLabel;
    DblCodForma: TwwDBLookupCombo;
    DbeBarras: TwwDBEdit;
    DbeLInhaDigit: TwwDBEdit;
    GpConta: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    DbEdtConta: TwwDBEdit;
    DbEdtBanco: TwwDBEdit;
    DbEdtAgencia: TwwDBEdit;
    DBText1: TDBText;
    LblSubContaCli: TLabel;
    CmbSubConta: TwwDBLookupCombo;
    Label8: TLabel;
    Dbereferencia: TwwDBEdit;
    Label9: TLabel;
    MemObs: TDBMemo;
    ImlDocs: TImageList;
    PnlRateioGeral: TPanel;
    lblUnidNegoc: TLabel;
    lblCentroRespon: TLabel;
    lblTipoRD: TLabel;
    Label6: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    dblcCentroRespon: TwwDBLookupCombo;
    dblcTipoRD: TwwDBLookupCombo;
    CmbCentCusto: TwwDBLookupCombo;
    PageRateioPrev: TPageControl;
    TbsRateioGeral: TTabSheet;
    TbsPrevidencia: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    EdtImovel: TwwDBEdit;
    CmbPlano: TCMDBLookupCombo;
    CmbPatro: TCMDBLookupCombo;
    BtnBuscaContaCor: TSpeedButton;
    GpDotorc: TPanel;
    SpeedButton1: TSpeedButton;
    ReResorc: TDBRealEdit;
    Label17: TLabel;
    PnlPrograma: TPanel;
    Label13: TLabel;
    CmbPrograma: TCMDBLookupCombo;
    edMoedaDet: TEdit;
    lblMoedaDet: TLabel;
    dbeValorMoedaDet: TRealEdit;
    lblValorOutDet: TLabel;
    dbeValorDet: TRealEdit;
    lblValorDet: TLabel;
    GrdAlteradores: TwwDBGrid;
    DsAlteradores: TwwDataSource;
    lblAlterador: TLabel;
    lblValOut: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    EdtHist: TDBEdit;
    DtLancto: TCMDateTimePicker;
    DbROutraMoeda: TDBRealEdit;
    DbrValor: TDBRealEdit;
    dblkAlterador: TwwDBLookupCombo;
    DbrValLiquido: TDBRealEdit;
    DclAtivProjeto: TwwDBLookupCombo;
    CkbContabiliza: TDBCheckBox;
    PnlAp: TPanel;
    LblNumAp: TLabel;
    EdtNumAp: TwwDBEdit;
    BtnNumApgr: TSpeedButton;
    MsResORc: TMontaSelect;
    LblEstorno: TLabel;
    TbsDadosLanc: TTabSheet;
    SqlDoc: TCMSqlParams;
    SQLDet: TCMSqlParams;
    CdsDet: TCMClientDataSet;
    SqlContab: TCMSqlParams;
    CdsContab: TCMClientDataSet;
    SQLAlteradores: TCMSqlParams;
    CdsAlteradores: TCMClientDataSet;
    SQLLancamento: TCMSqlParams;
    CdsLancamento: TCMClientDataSet;
    LblMesmaData: TLabel;
    SQLMoeda: TCMSqlParams;
    CdsMoeda: TCMClientDataSet;
    CdsDadosConta: TCMClientDataSet;
    SqlDadosConta: TCMSqlParams;
    dbeHist1: TwwDBEdit;
    dbeHist2: TwwDBEdit;
    dbeHist3: TwwDBEdit;
    dbeHist4: TwwDBEdit;
    dbeHist5: TwwDBEdit;
    SQLPlanoPrev: TCMSqlParams;
    CdsPlanoPrev: TCMClientDataSet;
    SQLProgramaPrev: TCMSqlParams;
    CdsProgramaPrev: TCMClientDataSet;
    SQLPatroPrev: TCMSqlParams;
    CdsPatroPrev: TCMClientDataSet;
    SQLTipoRD: TCMSqlParams;
    CdsTipoRD: TCMClientDataSet;
    CdsAlt: TCMClientDataSet;
    SqlAlt: TCMSqlParams;
    CdsSubContaForCli: TCMClientDataSet;
    SqlSubContaForCli: TCMSqlParams;
    SqlValida: TCMSqlParams;
    CdsValida: TCMClientDataSet;
    SqlSubConta: TCMSqlParams;
    CdsSubConta: TCMClientDataSet;
    SqlCentroRespon: TCMSqlParams;
    CdsCentroRespon: TCMClientDataSet;
    SqlPortForma: TCMSqlParams;
    CdsPortForma: TCMClientDataSet;
    SqlCCusto: TCMSqlParams;
    CdsCCusto: TCMClientDataSet;
    SqlAuxTipoRD: TCMSqlParams;
    CdsAuxTipoRD: TCMClientDataSet;
    SqlTipoDoc: TCMSqlParams;
    CdsTipoDoc: TCMClientDataSet;
    SqlCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    SqlUnidNegoc: TCMSqlParams;
    SqlFormaPag: TCMSqlParams;
    CdsFormaPag: TCMClientDataSet;
    SqlCliAdianto: TCMSqlParams;
    CdsForCliAdianto: TCMClientDataSet;
    SqlForneAdianto: TCMSqlParams;
    CdsAux: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    PnlDados: TPanel;
    Bevel1: TBevel;
    lblValorMoeda: TLabel;
    lblValor: TLabel;
    lblHistorico: TLabel;
    lblMoeda: TLabel;
    lblPortadorForma: TLabel;
    lblNumDoc: TLabel;
    lblBarra: TLabel;
    lblTipoDocum: TLabel;
    lblNumChBordero: TLabel;
    Label7: TLabel;
    DbeNoDocumento: TwwDBEdit;
    dbenNumDoc: TDBRealEdit;
    dbeHistorico: TwwDBEdit;
    dblcMoeda: TwwDBLookupCombo;
    gbDatas: TGroupBox;
    lblData: TLabel;
    lblEmissao: TLabel;
    lblVencimento: TLabel;
    lblProgramada: TLabel;
    dbeDataLanc: TCMDateTimePicker;
    dbeDataEmi: TCMDateTimePicker;
    dbeDataVenc: TCMDateTimePicker;
    dbeDataProgr: TCMDateTimePicker;
    dblcPortadorForma: TwwDBLookupCombo;
    gbOutros: TGroupBox;
    cbEnglobParc: TCheckBox;
    cbLancaBaixa: TCheckBox;
    cbIntegra: TCheckBox;
    dbeCompl: TwwDBEdit;
    dblcTipoDoc: TwwDBLookupCombo;
    dbenChBordero: TDBRealEdit;
    CmpForCli: TCMProcuraForCli;
    BtnStatus: TToolbarButton97;
    Label10: TLabel;
    DBText3: TDBText;
    DBText2: TDBText;
    lblModulo: TLabel;
    Bevel2: TBevel;
    Image1: TImage;
    dbeValorMoeda: TDBRealEdit;
    dbeValorCorrente: TDBRealEdit;
    sbtnAlternarTipoDoc: TToolbarButton97;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure dbeValorMoedaExit(Sender: TObject);
    procedure dbeValorMoedaDetExit(Sender: TObject);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure dblcCCustoEnter(Sender: TObject);
    procedure reValorMoedaConExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnEstornarClick(Sender: TObject);
    procedure dblcMoedaExit(Sender: TObject);
    procedure dbeDataVencExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbeValorCorrenteChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dsLancamentoDataChange(Sender: TObject; Field: TField);
    procedure cbLancaBaixaClick(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure CmpForCliEnter(Sender: TObject);
    procedure CmpForCliExit(Sender: TObject);
    procedure dblcTipoRDCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dblcCentroResponExit(Sender: TObject);
    procedure DbeNoDocumentoExit(Sender: TObject);
    procedure dblcTipoDocExit(Sender: TObject);
    procedure dbeDataEmiExit(Sender: TObject);
    procedure BtnNumApgrClick(Sender: TObject);
    procedure CContabilApertouBotao(Sender: TObject);
    procedure CmbProgramaExit(Sender: TObject);
    procedure CmbPlanoExit(Sender: TObject);
    procedure CmbPatroExit(Sender: TObject);
    procedure CmbCentCustoExit(Sender: TObject);
    procedure dblcTipoRDExit(Sender: TObject);
    procedure CmbCentCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CmpForCliApertouBotao(Sender: TObject);
    procedure CmbProgramaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure BtnBuscaContaCorClick(Sender: TObject);
    procedure DclAtivProjetoExit(Sender: TObject);
    procedure dblkAlteradorExit(Sender: TObject);
    procedure DbrValorExit(Sender: TObject);
    procedure CdsalteradoresAfterInsert(DataSet: TDataSet);
    procedure cbEnglobParcClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure dblcCentroResponCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: boolean);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure CdsDetAfterOpen(DataSet: TDataSet);
    procedure CdsUnidNegocAfterOpen(DataSet: TDataSet);
    procedure CdsTipoRDAfterOpen(DataSet: TDataSet);
    procedure CdsDetAfterInsert(DataSet: TDataSet);
    procedure CdsLancamentoAfterOpen(DataSet: TDataSet);
    procedure CdsContabAfterOpen(DataSet: TDataSet);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure CdsAfterDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: boolean);
    procedure CdsDetAfterCancel(DataSet: TDataSet);
    procedure sbtnAlternarTipoDocClick(Sender: TObject);
  private
     CtrlIntBanco: TCtrlIntBanco;

    _DataLancto: TDateTime; 
    _ContabDoc :TContabDoc;
    _IdForCliAdianto: Integer;
    _CodTipDoc: Integer;
    _CodLancCAPCAR: Integer;
    _CodLancContab: Integer;
    _PlanoPrevDet: Integer;
    _PatroDet: Integer;
    _Plano: Integer;
    _SubConta: Integer;
    _SubContaCliFor: Integer;
    _IdCidade: Integer;
    _IdPais: Integer;

    _UF: String;
    _CodCentroRespon: String;
    _NomeCentroRespon: String;
    _Ativproj: String;
    _Crespom: String;
    _Tpdesmb: String;
    _Ccusto: String;
    _Hist1: String;
    _Hist2: String;
    _Hist3: String;
    _Hist4: String;
    _Hist5: String;
    _ContaCliFor: String;
    _CCustoCliFor: String;
    _ContaContabil: String;

    _IntegraChecked: boolean;
    _Valida: boolean;
    _LiberaAlteracaoOutroSistema: boolean;

    _ValorCotacao: Double;
    _ValorEdit: Double;

    _LancDocCapCar: TCtrlLancDocCapCarIR;
    _oPeriodo: TCtrlPeriodo;
    _oDocumento: TCtrlDocumento;

    procedure SelDocs(iCodDocumento: Integer);
    Procedure SelecionaTipoDesembolso;

    procedure MontaCentroDeCusto;
    function  ConfereSaldo(CodDocumento: integer; VerificaLanc: boolean): boolean;
    function  VerificaParcelas(sNumFatura: string): boolean;
    function  ObrigaSubconta(sContaContabil: string): boolean;
    procedure SetaCentResponDesemb(iNumReserva: LongInt; bLimpa: boolean);
    procedure SetaEnglobaParcela;
    procedure setaplanopatroglobal;
    function  TestaAlterador: boolean;
    function  ValidaOperacao: boolean;
    procedure CalculaValorEdit;
    function  StatusIsAtivo(IdPessoa, IdEmpresa: integer): boolean;
  public
    class procedure AbrirForm;
  end;

var
  frmLancDocCAPCAR: TfrmLancDocCAPCAR;

implementation

{$R *.DFM}

uses
  uMensErro, uDataBase, uSistema, uModulo, ustring, dReports, fMostraRelat, DDadosBancarios,
  udiasuteis, JclMath, uFormManager, Registry, uCtrlParamIntegra, uFuncaoGeral, DCapCarMT,
  uMidasUtil, uCtrlFuncoesIRRF, dCds;

procedure TfrmLancDocCAPCAR.CmeCadastroInsert(Sender: TObject);
begin
  _IdForCliAdianto := 0;

  SelDocs(-1);

  inherited;

  PnlAp.Enabled := true;

  _IntegraChecked := false;

  SetaCentResponDesemb(-1, true);
  cbLancaBaixa.Checked := false;
  cbLancaBaixaClick(Self);
  pnlMestre.Enabled := true;
  dbenChBordero.Enabled := false;
  lblNumChBordero.Enabled := false;
  cbEnglobParc.Checked := false;
  cbLancaBaixa.Checked := false;
  cbIntegra.Checked := false;

  _CodLancCAPCAR := 0;
  _CodLancContab := 0;

  dbeValorMoeda.Enabled          := false;
  dbeValorCorrente.Enabled       := true;

  if CmpForCli.CanFocus then  CmpForCli.SetFocus;

  SetaEnglobaParcela;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheInsert(Sender: TObject);
var
  bVazio :boolean;
begin
  bVazio := CdsDet.IsEmpty;

  inherited;

  if pgctrlDetalhe.ActivePage.PageIndex = 1 then
  begin

     if PnlRateioGeral.Visible then
        PageRateioPrev.ActivePage := TbsRateioGeral;

     CdsDet.FieldByName('NumReserva').asInteger := 0;

     if CdsCentroRespon.IsEmpty then
     begin
        dblcCentroRespon.Enabled := false;
        CdsDet.FieldByName('CODCENTRORESPON').asString := _CodCentroRespon;
        CdsDet.FieldByName('NOME_1').asString := _NomeCentroRespon;
     end;

     CdsDet.FieldByName('MOECODIGO').Clear;

     dbeValorMoedaDet.Value:=0;
     dbeValorDet.Value:=0;

     edMoedaDet.Text:='';
     if Cds.FieldByName('MOECODIGO').asInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').asInteger := Cds.FieldByName('MOECODIGO').asInteger;
        edMoedaDet.Text := CdsMoeda.FieldByName('MOESIGLA').asString;
     end
     else
        dbeValorMoedaDet.Value:=0;

     CmbCentCusto.CloseUp(true);

    if not bVazio then
    begin
       if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;

       CdsDet.FieldByName('UNIDNEGOC').asString := _Ativproj;
       dblcUnidNegoc.CloseUp(true);
       CdsDet.FieldByName('CODCENTRORESPON').asString := _Crespom;
       dblcCentroRespon.CloseUp(true);
       CdsDet.FieldByName('CODTIPRECDES').asString := _Tpdesmb;
       dblcTipoRD.CloseUp(true);
       CdsDet.FieldByName('CODCENTROCUSTO').asString := _Ccusto;
       CmbCentCusto.CloseUp(true);

       if _PlanoPrevDet = 0 then
          CdsDet.FieldByName('IDPLANOPREV').Clear
       else
          begin
             CdsDet.FieldByName('IDPLANOPREV').asFloat := _PlanoPrevDet;
             CmbPlano.LookupValue := FloatToStr(_PlanoPrevDet);
          end;

       CmbPlano.CloseUp(true);

       if _PatroDet = 0 then
          CdsDet.FieldByName('IDPATRO').Clear
       else
          begin
             CdsDet.FieldByName('IDPATRO').asFloat := _PatroDet;
             CmbPatro.LookupValue := FloatToStr(_PatroDet);
          end;
       CmbPatro.CloseUp(true);
    end
    else
        setaplanopatroglobal;

    if (Trim(_Crespom) = '') or
       (Trim(_Crespom) = '9999999999') then
    begin
       CdsDet.FieldByName('CODCENTRORESPON').asString  := '9999999999';
       dblcCentroRespon.CloseUp(true);
    end;

    MontaCentroDeCusto;
  end
  else
    if pgctrlDetalhe.ActivePage.PageIndex = 2 then
    begin
       CdsContab.FieldByName('LACDEBCRE').asString := 'D';
       CdsContab.FieldByName('PLANO').asInteger := _Plano;
       CdsContab.FieldByName('LACHIST1').asString := _Hist1;
       CdsContab.FieldByName('LACHIST2').asString := _Hist2;
       CdsContab.FieldByName('LACHIST3').asString := _Hist3;
       CdsContab.FieldByName('LACHIST4').asString := _Hist4;
       CdsContab.FieldByName('LACHIST5').asString := _Hist5;
       CdsContab.FieldByName('LACNUMDOC').asString := Trim(dbenNumDoc.Text)+'/'+Trim(dbeCompl.Text);

       if Cds.FieldByName('MOECODIGO').asInteger <> 0 then
       begin
          reValorMoedaCon.Enabled:=true;
          reValorCorrenteCon.Enabled:=false;
       end
       else
       begin
          reValorMoedaCon.Enabled:=false;
          reValorCorrenteCon.Enabled:=true;
       end;
    end;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (Cds.State In ([dsInsert,dsEdit])) then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 1)  then
     begin
        if not (CdsDet.State In ([dsInsert,dsEdit])) then CdsDet.Edit;

        dblcTipoRD.Text := CdsDet.FieldByName('DESCRICAO').Text;
        dblcCentroRespon.Text := CdsDet.FieldByName('NOME_1').Text;
        dblcUnidNegoc.Text := CdsDet.FieldByName('NOME').Text;
        CdsDet.FieldByName('MOECODIGO').Clear;
        dbeValorMoedaDet.Value := CdsDet.FieldByName('VALOROUTRAMOEDA').asFloat;
        dbeValorDet.Value := CdsDet.FieldByName('VALOR').asFloat;
        edMoedaDet.Text := '';

        if CdsCentroRespon.IsEmpty then
        begin
           dblcCentroRespon.Enabled:=false;
           CdsDet.FieldByName('CODCENTRORESPON').asString := _CodCentroRespon;
           CdsDet.FieldByName('NOME_1').asString := _NomeCentroRespon;
        end;
        if Cds.FieldByName('MOECODIGO').asInteger <>0 then
        begin
           CdsDet.FieldByName('MOECODIGO').asInteger := Cds.FieldByName('MOECODIGO').asInteger;
           edMoedaDet.Text := CdsMoeda.FieldByName('MOESIGLA').asString;
        end
        else
           dbeValorMoedaDet.Value:=0;

        CmbCentCusto.CloseUp(true);

        setaplanopatroglobal;
     end;

     if (pgctrlDetalhe.ActivePage.PageIndex = 2)  and (CdsContab.State In ([dsInsert,dsEdit])) then
     begin
        if Cds.FieldByName('MOECODIGO').asInteger <>0 then
        begin
           reValorMoedaCon.Enabled := true;
           reValorCorrenteCon.Enabled := false;
           if (reValorMoedaCon.Value = 0) and (_ValorCotacao > 0) then
              reValorMoedaCon.Value := reValorCorrenteCon.Value / _ValorCotacao;
        end
        else
        begin
           reValorMoedaCon.Value := 0;
           reValorMoedaCon.Enabled := false;
           reValorCorrenteCon.Enabled := true;
        end;
     end;
  end;
end;

procedure TfrmLancDocCAPCAR.CmeDetalheConfirma(Sender: TObject);
begin
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
     if (pgctrlDetalhe.ActivePage.PageIndex = 1) and (CdsDet.State In [dsInsert,dsEdit]) then
        begin
           if (Trim(dblcUnidNegoc.Text) = '') then
           begin
              if ( ParamIntegra.ObrigaAbc ) then
              begin
                MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk,mbHelp],0);
                if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
                exit
              end
              else
              begin
                CdsDet.FieldByName('UNIDNEGOC').asFloat := -1;
                dblcUnidNegoc.LookupValue := '-1';
              end;
           end;

           if CdsCentroRespon.isEmpty then
           begin
              CdsDet.FieldByName('NOME_1').Text := _NomeCentroRespon;
              CdsDet.FieldByName('CODCENTRORESPON').asString := '9999999999';
              dblcCentroRespon.LookupValue   := '9999999999';
           end
           else
           begin
              if (Trim(dblcCentroRespon.Text) = '') then
              begin
                 if ( ParamIntegra.ObrigaCrespon ) then
                 begin
                   MsgDlg('Obrigatório preencher o Centro de Responsabilidade','Erro',mtError,[mbOk,mbHelp],0);
                   if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
                   exit
                 end
                 else
                 begin
                   CdsDet.FieldByName('CODCENTRORESPON').asString := '9999999999';
                   dblcCentroRespon.LookupValue := '9999999999';
                   CdsDet.FieldByName('NOME_1').asString := _NomeCentroRespon;
                 end;
              end;

              CdsDet.FieldByName('NOME_1').Text := dblcCentroRespon.Text;
           end;

           if Trim(dblcTipoRD.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso','Erro',mtError,[mbOk,mbHelp],0);
              if dblcTipoRD.CanFocus then dblcTipoRD.SetFocus;
              exit;
           end;

           if (dbeValorMoedaDet.Value = 0) and (Cds.FieldByName('MOECODIGO').asInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk,mbHelp],0);
              if dbeValorMoedaDet.CanFocus then dbeValorMoedaDet.SetFocus;
              exit;
           end;

           if (dbeValorDet.Value = 0) and (dbeValorCorrente.Value <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Moeda Corrente','Erro',mtError,[mbOk,mbHelp],0);
              if dbeValorDet.CanFocus then dbeValorDet.SetFocus;
              exit;
           end;


           if Sistema.UsaPlanoPatro then
           begin
             if (Trim(CmbPlano.Text) = '') or (Trim(CmbPatro.Text) = '' ) then
             begin
                MsgDlg('Obrigatório preencher o Plano Previdenciário e a Patrocinadora na ''Pasta'' Previdência','Erro',mtError,[mbOk,mbHelp],0);
                if cmbPlano.CanFocus then cmbPlano.SetFocus;
                exit;
             end;
           end;

           _ValorEdit :=  _ValorEdit - dbeValorDet.Value;

           CdsDet.FieldByName('DESCRICAO').Text := dblcTipoRD.Text;
           CdsDet.FieldByName('NOME').Text := dblcUnidNegoc.Text;
           CdsDet.FieldByName('MOESIGLA').Text := edMoedaDet.Text;
           CdsDet.FieldByName('VALOR').Value := dbeValorDet.Value;
           CdsDet.FieldByName('VALOROUTRAMOEDA').Value := dbeValorMoedaDet.Value;

           if CdsDet.FieldByName('CODDOCUMENTO').asInteger<=0 then
           begin
              CdsDet.FieldByName('RecPag').asString := ParamIntegra.RecPag;
              CdsDet.FieldByName('CODDOCUMENTO').asInteger := Cds.FieldByName('CODDOCUMENTO').asInteger;
              CdsDet.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
           end;

           //ReResorc.Value := 0;
        end;

     if (pgctrlDetalhe.ActivePage.PageIndex = 2) and (CdsContab.State In ([dsInsert,dsEdit])) then
        begin
           if CContabil.Valida <> VcOk then exit;

           CdsContab.FieldByName('PLANOME').asString := CContabil.Conta.Nome;

           if (Trim(dblcAtividade.Text) = '') and ( ParamIntegra.ObrigaAbc ) then
           begin
              MsgDlg('Obrigatório preencher a Atividade','Erro',mtError,[mbOk,mbHelp],0);
              if dblcAtividade.CanFocus then dblcAtividade.SetFocus;
              exit;
           end;
           if Trim(dbeHist1.Text) = '' then
           begin
              MsgDlg('Obrigatório preencher pelo menos a primeira lInha do histórico','Erro',mtError,[mbOk,mbHelp],0);
              if dbeHist1.CanFocus then dbeHist1.SetFocus;
              exit;
           end;
           if (reValorMoedaCon.Value = 0) and (Cds.FieldByName('MOECODIGO').asInteger <> 0) then
           begin
              MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk,mbHelp],0);
              if reValorMoedaCon.CanFocus then reValorMoedaCon.SetFocus;
              exit;
           end;
           if reValorCorrenteCon.Value = 0 then
           begin
              MsgDlg('Obrigatório preencher o Valor','Erro',mtError,[mbOk,mbHelp],0);
              if reValorCorrenteCon.CanFocus then reValorCorrenteCon.SetFocus;
              exit;
           end;
           if CdsContab.FieldByName('LACDEBCRE').asString = 'D' then
              CdsContab.FieldByName('LACTIPO').asString := '0'
           else
              CdsContab.FieldByName('LACTIPO').asString := '1';

           CdsContab.FieldByName('NOME').Text := dblcUnidNegoc.Text;
           CdsContab.FieldByName('NOME_1').Text := dblcCCusto.Text;
           CdsContab.FieldByName('LACVALOR').Value := reValorCorrenteCon.Value;
           CdsContab.FieldByName('LACVALHIST').Value := reValorMoedaCon.Value;
        end;
     SetaCentResponDesemb(-1,true);
  end;

  inherited;

  if (CdsDet.state = dsInsert) then
  begin
    CdsDet.FieldByName('CODCENTROCUSTO').asString := _Ccusto  ;
    CdsDet.FieldByName('CODTIPRECDES').asString := _Tpdesmb  ;
    CdsDet.FieldByName('UNIDNEGOC').asString := _Ativproj ;

    if (Trim(_Crespom) = '') or (Trim(_Crespom) = '9999999999') then
    begin
       CdsDet.FieldByName('CODCENTRORESPON').asString  := '9999999999';
       CdsDet.FieldByName('NOME_1').Text := _NomeCentroRespon;
    end
    else
       CdsDet.FieldByName('CODCENTRORESPON').asString  := _Crespom;

    MontaCentroDeCusto;
  end;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroFind(Sender: TObject);
begin
     if (MontaSelect.RetornouValor) then
     begin
        _CodLancCAPCAR := StrtoInt(MontaSelect.ValoresChave[0]);

        SelDocs(_CodLancCAPCAR);

        _CodLancContab := Cds.FieldByName('PLNCODIGO').asInteger;
        _ContaCliFor := Cds.FieldByName('PLACONTA').asString;
        _CCustoCliFor := Cds.FieldByName('CODCENTROCUSTO').asString;

        cbLancaBaixa.Checked := ((Cds.FieldByName('OPERACAO').asString = '10') or (Cds.FieldByName('OPERACAO').asString = '15'));
        cbEnglobParc.Checked := ((Cds.FieldByName('OPERACAO').asString = '1') or (Cds.FieldByName('OPERACAO').asString = '11'));
        cbIntegra.Checked := (Cds.FieldByName('PLNCODIGO').asInteger = 0);

        SetaEnglobaParcela;

        //SaveCDSFromScreen(Self, 0, dfXML);
     end;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  PnlAp.Enabled := _LiberaAlteracaoOutroSistema;

  if Cds.FieldByName('ESTORNO').asInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido Alterar.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnCancelar.Click;
     exit;
  end;

  if Cds.FieldByName('MOECODIGO').asInteger <> 0 then
  begin
    dbeValorMoeda.Enabled:=true;
    dbeValorCorrente.Enabled:=false;
  end
  else
  begin
    dbeValorMoeda.Enabled:=false;
    dbeValorCorrente.Enabled:=true;
  end;

  if CmpForCli.CanFocus then CmpForCli.SetFocus;

  _Valida := true;

  if cbLancaBaixa.Checked then
  begin
     dbenChBordero.Enabled := true;
     lblNumChBordero.Enabled := true;
  end
  else
  begin
     dbenChBordero.Enabled := false;
     lblNumChBordero.Enabled := false;
  end;

  _IntegraChecked := cbIntegra.Checked;

  DtmDadosBancarios.SetaContaPreferencial(Cds.FieldByName('IDFORCLI').asFloat, Cds);

  _ContabDoc.PLANO          := 0;
  _ContabDoc.CODSUBCONTA    := 0;
  _ContabDoc.PLACONTA       := '';
  _ContabDoc.CODCENTROCUSTO := '';

  if ParamIntegra.IntegraContab and
     ( not cbIntegra.Checked ) and
     (( Cds.FieldByName('IDMODULO').asInteger = 3 ) or
      ( Cds.FieldByName('IDMODULO').asInteger = 4 )) then
  begin
    _DataLancto := Cds.FieldByName('DATALANCTO').AsDateTime;
    _ContabDoc.PLANO := Cds.FieldByName('PLANO').asInteger;
    _ContabDoc.CODSUBCONTA := Cds.FieldByName('CODSUBCONTA').asInteger;
    _ContabDoc.PLACONTA := Trim(Cds.FieldByName('PLACONTA').asString);
    _ContabDoc.CODCENTROCUSTO := Trim(Cds.FieldByName('CODCENTROCUSTO').asString);
  end
  else
    _DataLancto := 0;
end;

procedure TfrmLancDocCAPCAR.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  if ( ParamIntegra.IntegraContab ) and (cbIntegra.Checked = false) and (sbtnInserir.Down = false) and (sbtnAlterar.Down = false) and (sbtnApagar.Down = false) then
  begin
    if ( ParamIntegra.EstornaContab ) then
      sbtnApagar.Enabled  :=false;
  end;

  sbtnEstornar.Enabled := (LblEstorno.Enabled) And (sbtnAlterar.Enabled) and (not bbtnConfirmar.Enabled);

  gbOutros.Enabled := bbtnConfirmar.Enabled;
end;

procedure TfrmLancDocCAPCAR.bbtnConfirmarClick(Sender: TObject);
var
  TotalRateioOM, TotalRateio, rTotalContab, rValorCliFor, rValorCheckForCli: Real;
  sNomeConta, sObriga, sNome, sSubConta, PlacontaCredito: string;
  bExiste: boolean;
begin
  if (CdsDet.IsEmpty) then
    exit;

  if ( CmeCadastro.Operacao in [ OpInserir, OpAlterar ] ) then
  begin
    if ( not (Cds.State in [DsEdit, DsInsert]) ) then
      Cds.Edit;

    if ParamIntegra.Integracontab then
    begin
      CdsContab.First;
      bExiste := false;

      if (CmeCadastro.Operacao = opAlterar) then
      begin
        while not(CdsContab.EOF) do
        begin
          if (_ContabDoc.PLANO = CdsContab.FieldByName('PLANO').asInteger) and
             (_ContabDoc.CODSUBCONTA = CdsContab.FieldByName('CODSUBCONTA').asInteger) and
             (_ContabDoc.PLACONTA = Trim(CdsContab.FieldByName('PLACONTA').asString)) and
             (_ContabDoc.CODCENTROCUSTO = Trim(CdsContab.FieldByName('CODCENTROCUSTO').asString)) and
             (Trim(CdsTipoDoc.FieldBYName('DEBCRE').asString) = Trim(CdsContab.FieldByName('LACDEBCRE').asString)) then
          begin
            bExiste := true;
            Break;
          end
          else
            CdsContab.Next;
        end;
      end;

      if not(bExiste) then
      begin
        _ContabDoc.PLANO          := _Plano;
        _ContabDoc.CODSUBCONTA    := _SubContaCliFor;
        _ContabDoc.PLACONTA       := _ContaCliFor;
        _ContabDoc.CODCENTROCUSTO := _CCustoCliFor;
      end;

      Cds.FieldByName('PLANO').asInteger := _ContabDoc.PLANO;
      Cds.FieldByName('CODSUBCONTA').asInteger := _ContabDoc.CODSUBCONTA;
      Cds.FieldByName('PLACONTA').asString := _ContabDoc.PLACONTA;
      Cds.FieldByName('CODCENTROCUSTO').asString := _ContabDoc.CODCENTROCUSTO;
    end;
  end;

  CdsDet.first;
  PlacontaCredito :='';
 {
  if ( ParamIntegra.IntegraContab ) then
  begin
    try
      CdsDet.DisableControls;
      while not CdsDet.EOF do
      begin
        if PlacontaCredito='' then
           PlacontaCredito := CdsDet.FieldByName('PLACONTACREDITO').asString
        else
        begin
           if Trim(PlacontaCredito) <> Trim(CdsDet.FieldByName('PLACONTACREDITO').asString) then
           begin
              if ( ParamIntegra.RecPag = 'P' ) then
                  raise Exception.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Desembolsos Selecionados.')
              else
                  raise Exception.Create('Conta Contábil para baixa diferentes. Verifique os Tipos de Recebimentos Selecionados.')  ;
           end;
        end;
        CdsDet.next;
      end;
      CdsDet.EnableControls;
    except
        CdsDet.EnableControls;
        raise;
    end;
  end;
 }
  if (Trim(DbeBarras.Text) <> '') and not
     CtrlIntBanco.ValidaCodBarrasSispag(DbeBarras.Text,11) then
    exit;

  if (Trim(DbeLInhaDigit.Text) <> '') And not
    CtrlIntBanco.ValidaCodBarrasSispag(DbeLInhaDigit.Text,10) then
    exit;

  if (Trim(dblcPortadorForma.Text) = '') then
  begin
    if (cbLancaBaixa.Checked) then
    begin
      MsgDlg('Obrigatório Indicar '+ lblPortadorForma.Caption ,'Erro',mtError,[mbOk,mbHelp],0);
      if dblcPortadorForma.CanFocus then
        dblcPortadorForma.SetFocus;
      exit;
    end;
  end
  else
  if ( ParamIntegra.RecPag = 'P' ) and
     (not CdsPortForma.FieldByName('CODARQUIVOREMESSA').IsNull) and
     (not CdsPortForma.FieldByName('CODFORMAPAGTO').IsNull) and
     CtrlIntBanco.ObrigaDadosBancarios(CdsPortForma.FieldByName('CODARQUIVOREMESSA').asInteger,
       CdsPortForma.FieldByName('CODFORMAPAGTO').asInteger) and
     ((DbEdtBanco.Text = '') or (DbEdtAgencia.Text = '') or (DbEdtConta.Text = '')) then
  begin
    MsgDlg('Esta forma de pagamento obriga a Indicação da conta bancária', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  if (CmpForCli.Valida <> VcOk) then
    exit;

  if ObrigaSubconta(_ContaContabil) then
    exit;

  if Cds.FieldByName('NODOCUMENTO').IsNull then
  begin
    MsgDlg('Obrigatório preencher o Número do Documento','Erro',mtError,[mbOk,mbHelp],0);
    if dbenNumDoc.CanFocus then
       dbenNumDoc.SetFocus
    else
       if DbeNoDocumento.CanFocus then
          DbeNoDocumento.SetFocus;
    exit;
  end;

  if (DblCodForma.Text = '') then
  begin
    MsgDlg('Obrigatório Indicar ' + LblFormaPag.Caption + ' na ''Pasta'' Geral','Erro',mtError,[mbOk,mbHelp],0);
    if DblCodForma.CanFocus then DblCodForma.SetFocus;
    exit;
  end;

  if Trim(dbeDataEmi.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblEmissao.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    exit;
  end;

  if Trim(dbeDataLanc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblData.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
    exit;
  end;

  if Trim(dbeDataVenc.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblVencimento.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if Trim(dbeDataProgr.text) = '' then
  begin
    MsgDlg('Obrigatório preencher a ' + lblProgramada.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;

  if StrToDate(dbeDataVenc.Text) < StrToDate(dbeDataEmi.Text) then
  begin
    MsgDlg('A ' + lblVencimento.Caption + ' não pode ser menor que ' + lblEmissao.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    if dbeDataVenc.CanFocus then dbeDataVenc.SetFocus;
    exit;
  end;

  if StrToDate(dbeDataProgr.Text) < StrToDate(dbeDataLanc.Text)  then
  begin
    MsgDlg('A ' + lblProgramada.Caption + ' não pode ser menor que a ' + lblData.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    if dbeDataProgr.CanFocus then dbeDataProgr.SetFocus;
    exit;
  end;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  if ( ParamIntegra.IntegraContab ) and
     (cbIntegra.Checked = false)       and
     (CdsContab.ChangeCount > 0)      and
     ((Cds.FieldByName('IDMODULO').asInteger = 3) or
     (Cds.FieldByName('IDMODULO').asInteger = 4)) then
  begin
     if (CmeCadastro.Operacao = OpAlterar) and
        (Cds.FieldByName('DATALANCTO').OldValue <> null) And
        ( Cds.FieldByName('DATALANCTO').Value <> Cds.FieldByName('DATALANCTO').OldValue  ) then
     begin
       _oPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr( Cds.FieldByName('DATALANCTO').OldValue ));
       if _oPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, _oPeriodo.Periodo, _oPeriodo.Exercicio, false) then
       begin
          MsgDlg(_oPeriodo.MessageInfo, Self.Caption, mtWarning, [ MbOk ], 0);
          if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
          exit;
       end;
     end;

     _oPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, Cds.FieldByName('DATALANCTO').asString);
     if _oPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, _oPeriodo.Periodo, _oPeriodo.Exercicio, false) then
     begin
        MsgDlg(_oPeriodo.MessageInfo, Self.Caption, mtWarning, [ MbOk ], 0);
        if dbeDataLanc.CanFocus then dbeDataLanc.SetFocus;
        exit;
     end;
  end;

  if (dbeValorMoeda.Value = 0) and (Cds.FieldByName('MOECODIGO').asInteger <> 0) then
     begin
       MsgDlg('Obrigatório preencher o Valor em Outra Moeda','Erro',mtError,[mbOk,mbHelp],0);
       if dbeValorMoeda.CanFocus then dbeValorMoeda.SetFocus;
       exit;
     end;

  if dbeValorCorrente.Value = 0 then
     begin
       if (MsgDlg('Confirma o lançamento do documento com valor ''0''(Zero)?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mrNo) then
       begin
        if dbeValorCorrente.CanFocus then dbeValorCorrente.SetFocus;
        exit;
       end;
     end;

  if Trim(dblcTipoDoc.text) = '' then
     begin
       MsgDlg('Obrigatório preencher o Tipo de Documento','Erro',mtError,[mbOk,mbHelp],0);
       if dblcTipoDoc.CanFocus then dblcTipoDoc.SetFocus;
       exit;
     end;

  if (cbLancaBaixa.Checked) then
  begin
     if Trim(dblcPortadorForma.text) = '' then
     begin

       Cds.FieldByName('CODPORTFORMA').Value := -1;

       if ( ParamIntegra.RecPag = 'R' ) then
          MsgDlg('Obrigatório preencher a Cobrança','Erro',mtError,[mbOk,mbHelp],0)
       else
          MsgDlg('Obrigatório preencher a Forma de Pagamento','Erro',mtError,[mbOk,mbHelp],0);
       if dblcPortadorForma.CanFocus then dblcPortadorForma.SetFocus;
       exit;
     end;

     if Trim(dbenChBordero.text) = '' then
     begin
       if ( ParamIntegra.RecPag = 'R' ) then
          MsgDlg('Obrigatório preencher o Número do Lote de Recebimento','Erro',mtError,[mbOk,mbHelp],0)
       else
          MsgDlg('Obrigatório preencher o Número do Cheque/Borderô','Erro',mtError,[mbOk,mbHelp],0);
       if dbenChBordero.CanFocus then dbenChBordero.SetFocus;
       exit;
     end;

     if ( ParamIntegra.RecPag = 'R' ) then
        Cds.FieldByName('DATACFLOAT').AsDateTime := Cds.FieldByName('DATALANCTO').AsDateTime  +
                                                    CdsPortForma.FieldByName('DMAIS').asInteger
     else
        Cds.FieldByName('DATACFLOAT').AsDateTime := Cds.FieldByName('DATALANCTO').AsDateTime  -
                                                    CdsPortForma.FieldByName('DMAIS').asInteger;

     if ( ParamIntegra.IntegraContab ) then
     begin
        _ContaCliFor := CdsPortForma.FieldByName('PLACONTA').asString;
        _SubContaCliFor := _SubConta;
        _CCustoCliFor := CdsPortForma.FieldByName('CODCENTROCUSTO').asString;
     end;
  end;

  TotalRateioOM:=0;
  TotalRateio  := 0;
  CdsDet.First;

  while (not CdsDet.EOF) do
  begin
     TotalRateio   := TotalRateio + CdsDet.FieldByName('VALOR').asFloat;
     TotalRateioOM := TotalRateioOM + CdsDet.FieldByName('VALOROUTRAMOEDA').asFloat;
     CdsDet.Next;
  end;

  if not FloatsEqual(dbeValorCorrente.Value, TotalRateio) then
     begin
       MsgDlg('Total do Rateio não bate com o Valor do Lançamento','Erro',mtError,[mbOk,mbHelp],0);
       _ValorEdit := dbeValorCorrente.Value - TotalRateio;
       exit;
     end;

  if (not IsFloatZero(dbeValorMoeda.Value)) and
     (not FloatsEqual(dbeValorMoeda.Value, TotalRateioOM)) then
     begin
       MsgDlg('Total do Rateio em outra moeda não bate com o Valor do Lançamento em outra moeda','Erro',mtError,[mbOk,mbHelp],0);
       exit;
     end;

  _DataLancto := Cds.FieldByName('DATALANCTO').AsDateTime;
  _CodTipDoc := Cds.FieldByName('CODTIPDOC').asInteger;
  
  Cds.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  Cds.FieldByName('DEBCRE').asString := CdsTipoDoc.FieldByName('DEBCRE').asString;
  Cds.FieldByName('NOME').asString := CmpForCli.ForCliReg.Nome;
  rTotalContab := 0;
  rValorCliFor := 0;

  if Cds.FieldByName('DEBCRE').asString = 'C' then
     rValorCheckForCli := (dbeValorCorrente.Value * (-1))
  else
     rValorCheckForCli := dbeValorCorrente.Value;

  if ( ParamIntegra.IntegraContab ) and ( not cbIntegra.Checked ) then
  begin
     sObriga := '';
     sNome := '';
     sSubConta := '';
     funcaogeral.TestaContaCC(false, _Plano, _ContaCliFor, sObriga, sNome, sSubConta);

     if Sobriga <> 'S' then _CCustoCliFor := '';

     if sSubConta <> 'S' then _SubContaCliFor := 0;
  end;

  if ( ParamIntegra.IntegraContab ) and ( not cbIntegra.Checked ) and
     ((Cds.FieldByName('IDMODULO').asInteger = 3) or
     (Cds.FieldByName('IDMODULO').asInteger = 4)) then
  begin
     CdsContab.First;
     while (not CdsContab.EOF) do
     begin
        if CdsContab.FieldByName('LACDEBCRE').IsNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação de D/C','Erro',mtError,[mbOk,mbHelp],0);
          exit;
        end;

        if CdsContab.FieldByName('PLACONTA').IsNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação da Conta Contábil','Erro',mtError,[mbOk,mbHelp],0);
          exit;
        end;

        if CdsContab.FieldByName('UNIDNEGOC').IsNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação da Unidade de Negócio','Erro',mtError,[mbOk,mbHelp],0);
          exit;
        end;

        if CdsContab.FieldByName('LACVALOR').IsNull then
        begin
          MsgDlg('Existem lançamentos contábeis sem a Indicação do Valor','Erro',mtError,[mbOk,mbHelp],0);
          exit;
        end;

        sObriga := '';
        sNome := '';
        sSubConta := '';
        funcaogeral.TestaContaCC(false, _Plano, CdsContab.FieldByName('PLACONTA').asString, sObriga, sNome, sSubConta);

        if (Sobriga = 'S') and
           (Trim(CdsContab.FieldByName('CODCENTROCUSTO').asString) = '') then
        begin
          MsgDlg('É obrigatório preencher o centro de custo da conta ' + CdsContab.FieldByName('PLACONTA').asString, 'Erro', mtError, [mbOk,mbHelp], 0);
          exit;
        end
        else
        begin
           if (Sobriga <> 'S') and
              (not CdsContab.FieldByName('CODCENTROCUSTO').IsNull) then
           begin
            CdsContab.Edit;
            CdsContab.FieldByName('CODCENTROCUSTO').Clear;
            CdsContab.Post;
           end;
        end;

        if (sSubConta = 'S') and (CdsContab.FieldByName('CODSUBCONTA').asInteger = 0) then
        begin
          MsgDlg('É obrigatório preencher a sub-conta da conta ' + CdsContab.FieldByName('PLACONTA').asString, 'Erro', mtError, [mbOk,mbHelp], 0);
          exit;
        end
        else
        begin
           if (sSubConta <> 'S') and
              (not CdsContab.FieldByName('CODSUBCONTA').IsNull) then
           begin
             CdsContab.Edit;
             CdsContab.FieldByName('CODSUBCONTA').Clear;
             CdsContab.Post;
           end;
        end;

        if not FuncaoGeral.TestaContaxCC(_Plano, Sistema.IdEmpresa, CdsContab.FieldByName('CODCENTROCUSTO').asString, CdsContab.FieldByName('PLACONTA').asString, true) then exit;

        if CdsContab.FieldByName('LACDEBCRE').asString = 'D' then
           rTotalContab   := rTotalContab   +  CdsContab.FieldByName('LACVALOR').asFloat
        else
           rTotalContab   := rTotalContab   - CdsContab.FieldByName('LACVALOR').asFloat;

        if CdsContab.FieldByName('PLACONTA').asString = _ContaCliFor then
        begin
           _CCustoCliFor := CdsContab.FieldByName('CODCENTROCUSTO').asString;
           
           if CdsContab.FieldByName('LACDEBCRE').asString = 'D' then
              rValorCliFor  := rValorCliFor + CdsContab.FieldByName('LACVALOR').asFloat
           else
              rValorCliFor  := rValorCliFor - CdsContab.FieldByName('LACVALOR').asFloat;
        end;

        CdsContab.Next;
     end;

     if not FloatsEqual(rTotalContab, 0) then
     begin
       MsgDlg('Total do Débito não bate com o Total do Crédito na Contabilização. Verifique','Erro',mtError,[mbOk,mbHelp],0);
       exit;
     end;

     if not FloatsEqual(rValorCliFor, rValorCheckForCli) then
     begin

       if cbLancaBaixa.Checked then
          sNomeConta := 'Banco'
       else
         if ( ParamIntegra.RecPag = 'R' ) then
            sNomeConta := 'Cliente'
         else
            sNomeConta := 'Favorecido';

       MsgDlg('O valor contabilizado na conta do ' + sNomeCOnta + ' deve ser igual ao valor do lançamento. Verifique', 'Erro', mtError, [mbOk,mbHelp], 0);

       exit;
     end;
  end;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);

  inherited;

  dblcTipoRD.Enabled := false;

  if sbtnInserir.Down then
  begin
    _ValorEdit := 0;
    _Valida := true;
    if CmpForCli.CanFocus then CmpForCli.SetFocus;
  end;

end;

procedure TfrmLancDocCAPCAR.FormCreate(Sender: TObject);
Var
  RegAutoriza: TRegistry;
begin
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAS( Padroes );

  _oPeriodo := TCtrlPeriodo.Create;
  _oPeriodo.InitializeAs(Padroes);

  _oDocumento := TCtrlDocumento.Create;
  _oDocumento.InitializeAs(Padroes);

  _LancDocCapCar := TCtrlLancDocCapCarIR.Create;
  _LancDocCapCar.InitializeAs(Padroes);

  DtmDadosBancarios := TDtmDadosBancarios.Create(Application);
  DtmCapCarMT := TDtmCapCarMT.Create(Application);

  _LiberaAlteracaoOutroSistema := false;
  
  RegAutoriza := TRegistry.Create;
  Try
     RegAutoriza.RootKey := HKEY_CURRENT_USER;

     if ( ParamIntegra.RecPag = 'P' ) then
        RegAutoriza.OpenKey('Software\CM\Contas a Pagar', true)
     else
        RegAutoriza.OpenKey('Software\CM\Contas a Receber', true);

     if RegAutoriza.ValueExists('Libera Alteração de Documentos') then
        _LiberaAlteracaoOutroSistema := (RegAutoriza.ReadString('Libera Alteração de Documentos') = 'S')
     else
        RegAutoriza.WriteString('Libera Alteração de Documentos','N');
  Finally
     RegAutoriza.Free;
  end;

  DiasUteis.SetLogradouro(Sistema.IdEmpresa, _IdCidade, _IdPais, _UF);

  DbeNoDocumento.Visible := (Trim( ParamIntegra.MascaraNoDocum ) <> '');
  dbenNumDoc.Visible := not DbeNoDocumento.Visible;

  dbeCompl.ReadOnly := ParamIntegra.AssociaComplTipoFat;

  inherited;

  if ( ParamIntegra.IntegraContab ) then
  begin
    cbIntegra.Checked := false;
    cbIntegra.Enabled := true;
  end
  else
  begin
    cbIntegra.Checked := true;
    cbIntegra.Enabled := false;
  end;

  sbtnEstornar.Visible := (Sistema.IdModulo = MODAUTO); // TIRAR QDO QUISER LIBERAR PARA OUTROS MÓDULOS

  sbtnAlternarTipoDoc.Visible := (Sistema.IdModulo = PROCJUD) or
    (Sistema.IdModulo = PROCPREV) or (Sistema.IdModulo = MODAUTO) or
    (Sistema.IdModulo = SISTJURCONS);
  if not(sbtnAlternarTipoDoc.Visible) then
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

  if ( ParamIntegra.RecPag = 'R' ) then
  begin
    LblNumAp.Caption := 'Nº da GR';
    lblTipoRD.Caption := 'Tipo de Recebimento';
    Self.Caption := 'Manutenção de Documentos no Contas a Receber';
    CmpForCli.Caption := ' Cliente ';
    CmpForCli.ForCli := fcCliente;
    lblPortadorForma.Caption := 'Contas/Caixas x Tipo Cobr';
    lblNumChBordero.Caption := 'No. Recebto.';
    LblFormaPag.Caption := 'Tipos de Cobrança';
  end
  else
  begin
    LblNumAp.Caption := 'Nº da AP';
    lblTipoRD.Caption := 'Tipo de Desembolso';
    Self.Caption := 'Manutenção de Documentos no Contas a Pagar';
    CmpForCli.Caption := ' Favorecido ';
    CmpForCli.ForCli := fcFornecedor;
    lblPortadorForma.Caption := 'Contas/Caixas x Forma de Pag';
    lblNumChBordero.Caption := 'No. Ch./Borderô';
    LblFormaPag.Caption := 'Forma de Pagamento';
    LblSubContaCli.Caption := 'Sub-Conta Fornecedor';
  end;

  GpDotorc.Enabled := (( ParamIntegra.IntegraOrcamento ) AND ( ParamIntegra.RecPag = 'P' ));
  GpBarras.Visible := ( ParamIntegra.RecPag = 'P' );
  GpConta.Visible := ( ParamIntegra.RecPag = 'P' );

  if GpDotorc.Enabled then
     MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  _Plano := ParamIntegra.Plano;
  CContabil.Plano := _Plano;
  CContabil.Mascara := ParamIntegra.MascaraPlano;

  _DataLancto := Date;
  _CodTipDoc := 0;
  pnlMestre.Enabled := false;
  _CodLancCAPCAR := 0;
  _CodLancContab := 0;

  MontaSelect.Filtro.Add('DOCUMENTO.IDMODULO       = '+IntToStr(Sistema.IdModulo));
  MontaSelect.Filtro.Add('DOCUMENTO.RecPag         = ' + QuotedStr(ParamIntegra.RecPag));
  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA       = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('TIPODOCRECPAG.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RecPag =   ' +
                         QuotedStr(ParamIntegra.RecPag) + ' and not exists  (select 1 from UsuarioxTpdocto b where RecPag=' + QuotedStr(ParamIntegra.RecPag) + ' and b.idusuario=' +
                         Inttostr(sistema.IdUsuario)+') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RecPag =   ' +
                         QuotedStr(ParamIntegra.RecPag) + '  and exists (select 1 from UsuarioxTpdocto b where RecPag=' + QuotedStr(ParamIntegra.RecPag) + ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
                         Inttostr(sistema.idusuario)+'))');
  MontaSelect.Filtro.Add('TIPODOCRECPAG.RecPag = ' + QuotedStr(ParamIntegra.RecPag));
  MontaSelect.Filtro.Add('DOCUMENTO.OPERACAO = ''1'' OR DOCUMENTO.OPERACAO = ''2'' OR DOCUMENTO.OPERACAO = ''10''');

  SelDocs(-1);

  if ( ParamIntegra.RecPag = 'R' ) then
    Caption := 'Manutenção de Documentos no Contas a Receber'
  else
    Caption := 'Manutenção de Documentos no Contas a Pagar';

  CmpForCli.Mensagens.EmBranco := CmpForCli.Caption + CmpForCli.Mensagens.EmBranco;
  CmpForCli.Mensagens.NaoExiste:= CmpForCli.Caption + CmpForCli.Mensagens.NaoExiste;

  SqlFormaPag.Prepare;
  SqlFormaPag.ParamByName('RecPag').asString := ParamIntegra.RecPag;
  SqlFormaPag.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  SqlFormaPag.OPen;

  SqlCentroCusto.Sql.Clear;
  SqlCentroCusto.SQL.Add(' SELECT DISTINCT  ');
  SqlCentroCusto.SQL.Add('   CODCENTROCUSTO, ');
  SqlCentroCusto.SQL.Add('   NOME, ');
  SqlCentroCusto.SQL.Add('   STATUSGRUPOCDC, ');
  SqlCentroCusto.SQL.Add('   IDPROGRAMA ');
  SqlCentroCusto.SQL.Add(' FROM ');
  SqlCentroCusto.SQL.Add('   CENTCUST ');
  SqlCentroCusto.SQL.Add(' WHERE 1=2 ');
  SqlCentroCusto.Prepare;
  SqlCentroCusto.Open;

  if UpperCase( Sistema.TipoEmpresa ) = 'P' then
  begin
     PnlPrograma.Visible := true;
     PnlRateioGeral.Parent := TbsRateioGeral;

     SqlPlanoPrev.Prepare;
     SqlPlanoPrev.Open;

     SqlProgramaPrev.Prepare;
     SqlProgramaPrev.Open;

     SqlPatroPrev.Prepare;
     SqlPatroPrev.Open;
  end
  else
  begin
     PnlRateioGeral.Parent := pnlControlesDet;
     PnlPrograma.Visible := false;
  end;

  PageRateioPrev.Visible := (PnlRateioGeral.Parent = TbsRateioGeral);

  if ( not ParamIntegra.TipoOperOk ) and ( ParamIntegra.IntegraContab ) then
  begin
    MsgDlg('Para ter este sistema Integrado com a Contabilidade é necessário cadastrar o Tipo de Operação 03 no GlobalCM. Caso este código não seja cadastrado, este sistema não aceitará nenhum lançamento.','Atenção',mtWarnIng,[mbOk,mbHelp],0);
    Close;
    exit;
  end;

  SqlAlt.Prepare;
  SqlAlt.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  SqlAlt.ParamByName('RecPag').asString := ParamIntegra.RecPag;
  SqlAlt.Open;

  SqlTipoDoc.Prepare;
  SqlTipoDoc.ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
  SqlTipoDoc.ParamByName('RecPag').asString := ParamIntegra.RecPag;
  SqlTipoDoc.Open;

  SqlPortForma.Prepare;
  SqlPortForma.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  SqlPortForma.ParamByName('RecPag').asString := ParamIntegra.RecPag;
  SqlPortForma.Open;

  SqlMoeda.Open;

  _NomeCentroRespon := '';
  _CodCentroRespon  := '';

  With SqlCentroRespon, Sql Do
  begin
     Clear;
     Add(' SELECT ');
     Add('     CEN.CODCENTRORESPON, ');
     Add('     CEN.NOME, ');
     Add('     CEN.ANALITICOSINTET, ');
     Add('     CEN.CODCENTROCUSTO ');
     Add(' FROM ');
     Add('     CENTRESPON CEN, ');
     Add('     PESSOAXCRESP PES ');
     Add(' WHERE ');
     Add('    (CEN.IDPESSOA = :IDPESSOA) AND ');
     Add('    (CEN.CODCENTRORESPON <> ''9999999999'') AND ');
     Add('    (CEN.ATIVO = ''S'') AND ');
     Add('    (CEN.CODCENTRORESPON = PES.CODCENTRORESPON) AND ');
     Add('    (PES.IDPESSOAACESSO = :IDUSUARIO) ');
     Add(' ORDER BY ');
     Add('    CEN.CODCENTRORESPON, ');
     Add('    CEN.ANALITICOSINTET, ');
     Add('    CEN.NOME ');

     Prepare;
     ParamByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
     ParamByName('IDUSUARIO').asFloat := Sistema.IdUsuario;
     Open;

     if CdsCentroRespon.IsEmpty then
     begin
        Clear;
        Add(' SELECT ');
        Add('    CODCENTRORESPON, ');
        Add('    NOME, ');
        Add('    ANALITICOSINTET, ');
        Add('    CODCENTROCUSTO ');
        Add(' FROM ');
        Add('    CENTRESPON ');
        Add(' WHERE ');
        Add('    IDPESSOA = :IDPESSOA AND ');
        Add('    CODCENTRORESPON = ''9999999999''  AND ');
        Add('    ATIVO=''S''' );

        Prepare;
        ParamByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
        Open;

        _NomeCentroRespon := CdsCentroRespon.FieldByName('NOME').asString;
        _CodCentroRespon := CdsCentroRespon.FieldByName('CODCENTRORESPON').asString;

        Clear;
        Add(' SELECT ');
        Add('    CEN.CODCENTRORESPON, ');
        Add('    CEN.NOME, ');
        Add('    CEN.ANALITICOSINTET, ');
        Add('    CEN.CODCENTROCUSTO ');
        Add(' FROM ');
        Add('    CENTRESPON CEN ');
        Add(' WHERE ');
        Add('    (CEN.IDPESSOA = :IDPESSOA) AND ');
        Add('    (CEN.CODCENTRORESPON <> ''9999999999'') AND ');
        Add('    (CEN.ATIVO=''S'') ');
        Add(' ORDER BY ');
        Add('    CEN.CODCENTRORESPON, ');
        Add('    CEN.ANALITICOSINTET, CEN.NOME ');

        Prepare;
        ParamByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
        Open
     end;
  end;

  SqlUnidNegoc.Prepare;
  SqlUnidNegoc.ParamByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
  SqlUnidNegoc.Open;

  if ( ParamIntegra.IntegraContab ) then
  begin
     With SqlSubConta, Sql Do
     begin
        Clear;
        Add(' SELECT ');
        Add('    NOMESUBCONTA, ');
        Add('    CODSUBCONTA ');
        Add(' FROM ');
        Add('    SUBCONTA ');
        Add(' WHERE ');
        Add('   (IDPESSOA = :IDPESSOA) ');
        Add(' ORDER BY ');
        Add('   NOMESUBCONTA ');

        Prepare;
        ParamByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
        Open;
     end;

     With SqlSubContaForCli, Sql Do
     begin
        Clear;
        Add(' SELECT ');
        Add('    NOMESUBCONTA, ');
        Add('    CODSUBCONTA ');
        Add(' FROM ');
        Add('    SUBCONTA ');
        Add(' WHERE ');
        Add('   (IDPESSOA = :IDPESSOA) ');
        Add(' ORDER BY ');
        Add('   NOMESUBCONTA ');

        Prepare;
        ParamByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
        Open;
     end;

     tbsContabil.Enabled := (not cbIntegra.Checked);
  end
  else
  begin
    tbsContabil.Enabled := false;
    CmbSubConta.Enabled := false;
  end;

  SelecionaTipoDesembolso;

  case (Sistema.IdModulo) of
    MODAUTO  : HelpContext := 4170023;
    MODCON   : HelpContext := 760022;
    MODFOL   : HelpContext := 210069;
    PROCJUD  : HelpContext := 1100016;
    PROCPREV : HelpContext := 1100016;
    SISTJURCONS : HelpContext := 7190024;
  end;
end;

procedure TfrmLancDocCAPCAR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DtmDadosBancarios.Free;
  DtmCapCarMT.Free;
  CtrlIntBanco.Free;
  _LancDocCapCar.Free;
  _oPeriodo.Free;
  _oDocumento.Free;
  inherited;
end;

procedure TfrmLancDocCAPCAR.tbcDetalheChange(Sender: TObject);
begin
  inherited;

  //Se o sistema não está integrado com a contabilidade passa direto para pasta de lançamentos
  if (( not ParamIntegra.IntegraContab ) or
      (cbIntegra.Checked = true)) and
      (Cds.State In ([dsInsert,dsEdit])) then
  begin
      if tbcDetalhe.TabIndex = 2 then
      begin
         pgctrlDetalhe.ActivePage := tbsLancamento;
         tbcDetalhe.TabIndex := 3;
         tbcDetalheChange(Self);
      end;
  end;

  if (tbcDetalhe.TabIndex = 4) then
  begin
    sbtnInsDet.Enabled := sbtnInserir.Down;
    sbtnAltDet.Enabled := sbtnInsDet.Enabled;
    sbtnExcluiDet.Enabled := sbtnInsDet.Enabled;
  end
  else
  begin
    sbtnInsDet.Enabled := true;
    sbtnAltDet.Enabled := sbtnInsDet.Enabled;
    sbtnExcluiDet.Enabled := sbtnInsDet.Enabled;
  end;

end;

procedure TfrmLancDocCAPCAR.dbeValorMoedaExit(Sender: TObject);
begin
  inherited;
  dbeValorCorrente.Value := dbeValorMoeda.Value * _ValorCotacao;
end;

procedure TfrmLancDocCAPCAR.dbeValorMoedaDetExit(Sender: TObject);
begin
  inherited;
  dbeValorDet.Value:=dbeValorMoedaDet.Value * _ValorCotacao;
end;

procedure TfrmLancDocCAPCAR.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if Cds.FieldByName('MOECODIGO').asInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').asInteger := Cds.FieldByName('MOECODIGO').asInteger;
        dbeValorMoedaDet.Enabled := true;
        dbeValorDet.Enabled := false;
     end
     else
     begin
        dbeValorMoedaDet.Enabled := false;
        dbeValorDet.Enabled := true;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').asString <> 'A') then
     begin
        MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarnIng,[mbOk,mbHelp],0);
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asString;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcCCustoEnter(Sender: TObject);
begin
  inherited;
  With SqlCCusto, Sql Do
  begin
     Clear;
     Add(' SELECT ');
     Add('    CENT.CODCENTROCUSTO, ');
     Add('    CENT.NOME ');
     Add(' FROM ');
     Add('    CENTCUST CENT ');
     Add(' WHERE ');
     Add('    CENT.ATIVO = ''S'' AND ');
     Add('    CODCENTROCUSTO IN ');
     Add('       ( ');
     Add('          SELECT ');
     Add('             CODCENTROCUSTO ');
     Add('          FROM ');
     Add('             CONTASxCC CONT ');
     Add('          WHERE ');
     Add('             CONT.IdEmpresa = CENT.IdEmpresa AND ');
     Add('             CONT.CODCENTROCUSTO= CENT.CODCENTROCUSTO AND ');
     Add('             CONT.IdEmpresa = :IdEmpresa AND ');
     Add('             CONT.PLANO = :PLANO AND ');
     Add('             RTRIM(CONT.PLACONTA) = :PLACONTA ');
     Add('       ) ');

     prepare;
     ParamByName('PLACONTA').asString := Trim( CContabil.Conta.Numero);
     ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
     ParamByName('PLANO').asInteger := ParamIntegra.Plano;
     Open;          
  end;
end;

procedure TfrmLancDocCAPCAR.reValorMoedaConExit(Sender: TObject);
begin
  inherited;
  reValorCorrenteCon.Value:=reValorMoedaCon.Value*_ValorCotacao;
end;

procedure TfrmLancDocCAPCAR.bbtnCancelarClick(Sender: TObject);
begin
  SetaCentResponDesemb(-1,true);
  
  if not sbtnInsDet.Enabled then bbtnCancelarDetClick(Self);

  pnlMestre.Enabled:=false;

  inherited;
end;

procedure TfrmLancDocCAPCAR.sbtnEstornarClick(Sender: TObject);
begin
  sbtnEstornar.Down := False;
  inherited;
  
  _TpDesmb   := '';
  _AtivProj  := '';
  _Ccusto   := '';
  _CRespom   := '';
  _Plano := Cds.FieldByName('PLANO').asInteger;

  if not Cds.FieldByName('CODDOCUMENTO').IsNull then
     if ConfereSaldo(Cds.FieldByName('CODDOCUMENTO').asInteger,true) then exit;

  if Cds.FieldByName('ESTORNO').asInteger <> 0 then
  begin
     MsgDlg('Este Lançamento foi estornado ou é um estorno. Proibido estornar outra vez.','Erro',mtError,[mbOk,mbHelp],0);
     sbtnEstornar.Down:=false;
     exit;
  end;

  {**
    O Parâmetro oeDialogProcessa indica que será exibida uma caixa de diálogo na
    tela e o processamento será efetuado na aplicação servidora
  **}
  
  if _oDocumento.Estornar(Cds.FieldByName('DATALANCTO').AsDateTime,
                          Sistema.IdModulo,
                          Sistema.IdEmpresa,
                          Sistema.IdUsuario,
                          Cds.FieldByName('CODDOCUMENTO').asInteger,
                          0,
                          ParamIntegra.Plano,
                          Sistema.UsaPlanoPatro,
                          oeDialogProcessa) then
  begin
     MsgDlg('Documento estornado com sucesso', 'Atenção',  mtInformation, [mbOk,mbHelp], 0);
     CmeCadastro.Find(Self);
  end
  else
     MsgDlg(_oDocumento.MessageInfo,'Atenção',mtWarning,[mbOk,mbHelp],0);

  sbtnEstornar.Down := false;
end;

procedure TfrmLancDocCAPCAR.dblcMoedaExit(Sender: TObject);
begin
  if not(Cds.FieldByName('MOECODIGO').IsNull) then
  begin
    _ValorCotacao := FuncaoGeral.TestaCotacaoMoeda(Cds.FieldByName('MOECODIGO').asInteger,
      dbeDataLanc.Text, 'S');
    if (_ValorCotacao = 0) then
    begin
      if (dbeDataLanc.CanFocus) then
        dbeDataLanc.SetFocus;
      exit;
    end;
    dbeValorMoeda.Enabled := true;
    dbeValorCorrente.Enabled := false;
  end
  else
  begin
    dbeValorMoeda.Enabled := false;
    dbeValorCorrente.Enabled := true;
  end;
end;

procedure TfrmLancDocCAPCAR.dbeDataVencExit(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down = true then
  begin
     if _IdCidade <> 0 then
       if not diasuteis.DiaUtil(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false) then
       begin
         if (Application.MessageBox('Data de vencimento não é um dia útil. Deseja alterar ?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
         begin
            if (Application.MessageBox('Lançar para o primeiro dia útil posterior?','Lançamento de Documentos',Mb_YesNo + Mb_IconQuestion) = Id_Yes) then
              dbeDataVenc.Date := diasuteis.PrimeiroDiaUtilPosterior(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false)
            else
              dbeDataVenc.Date := diasuteis.UltDiaUtilAnterior(dbeDataVenc.Date, _IdCidade, _IdPais, _UF, true, false, false);
         end;
      end;
      
     Cds.FieldByName('DATAPROGRAMADA').AsDateTime := strtodate(dbeDataVenc.text);
     dbeDataProgr.text := dbeDataVenc.text;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnInserirClick(Sender: TObject);
begin
  _TpDesmb  :='';
  _AtivProj := '';
  _Ccusto  :='';
  _CRespom  :='';
  _plano := ParamIntegra.plano;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange(Sender);
  
  dblcTipoRD.Enabled := false;

  _ValorEdit := 0;
  _Valida := true;

  inherited;
end;

procedure TfrmLancDocCAPCAR.bbtnOkDetClick(Sender: TObject);
begin
  if (tbcDetalhe.TabIndex = 4) then
  begin
     if not TestaAlterador then exit;
  end;

  inherited;

  if tbcDetalhe.TabIndex = 1 then
  begin
     dbeValorDet.Value := _ValorEdit;
     if IsFloatZero(dbeValorDet.Value) then bbtnVoltarDet.Click;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnInsDetClick(Sender: TObject);
begin
  if not ValidaOperacao then exit;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    inherited;

    if (tbcDetalhe.TabIndex = 1) then
    begin
       if IsFloatZero(_ValorEdit) then
       begin
          MsgDlg('O Total do Rateio Já Foi Fechado!', 'Erro', mtError, [mbOk,mbHelp], 0);
          bbtnCancelarDet.Click;
       end
       else
          dbeValorDet.Value := _ValorEdit;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnAltDetClick(Sender: TObject);
begin
  if not ValidaOperacao then exit;

  if ( CdsAtual <> nil ) And CdsAtual.IsEmpty then
  begin
    sbtnAltDet.Down := false;
    exit;
  end;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    inherited;

    if tbcDetalhe.TabIndex = 1 then
    begin
       if PnlRateioGeral.Visible then
          PageRateioPrev.ActivePage := TbsRateioGeral;

       if CdsDet.State <> DsEdit then CdsDet.Edit;

       if (_ValorEdit <> 0) and (CdsDet.State = DsInsert) then
       begin
          _ValorEdit := (_ValorEdit + CdsDet.FieldByName('VALOR').asFloat);
          dbeValorDet.Value := _ValorEdit
       end
       else
       begin
          _ValorEdit := CdsDet.FieldByName('VALOR').asFloat;
          dbeValorDet.Value := CdsDet.FieldByName('VALOR').asFloat;
       end;

       MontaCentroDeCusto;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnExcluiDetClick(Sender: TObject);
begin
  if not ValidaOperacao then exit;

  if ( CdsAtual <> nil ) And CdsAtual.IsEmpty then exit;

  if ( CmeCadastro.Operacao in [opInserir, opAlterar] ) then
  begin
    if (tbcDetalhe.TabIndex = 1) then
       _ValorEdit := _ValorEdit + CdsDet.FieldByName('VALOR').asFloat;

    inherited;
  end;
end;

procedure TfrmLancDocCAPCAR.dbeValorCorrenteChange(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao In [OpInserir,OpAlterar] then
  begin
     CalculaValorEdit;

     if Cds.State in [ DsEdit, DsInsert ] then
        Cds.FieldByName('VLRLIQUIDO').asFloat := dbeValorCorrente.Value;
  end;
end;

procedure TfrmLancDocCAPCAR.sbtnAlterarClick(Sender: TObject);
begin
  if (Cds.FieldByName('OPERACAO').asString = '10') then
  begin
    MsgDlg('Não é possível alterar ' +Caption+ ' efetuados com a opção de "Lança e Baixa"',
      'Erro', mtError, [mbOk,mbHelp], 0);
    sbtnAlterar.Down := false;
  end
  else
  if (StatusIsAtivo(Cds.FieldByName('IDFORCLI').asInteger, Sistema.IdEmpresa)) then
  begin
    _TpDesmb := '';
    _AtivProj := '';
    _Ccusto :='';
    _Crespom := '';

    if not(Cds.FieldByName('CODDOCUMENTO').IsNull) and not(_LiberaAlteracaoOutroSistema) then
    begin
      if (VerificaParcelas(Cds.FieldByName('NUMFATURA').asString)) then
        exit;
      if ConfereSaldo(Cds.FieldByName('CODDOCUMENTO').asInteger, false) then
        exit;
    end;

    _ValorEdit := 0;

    inherited;

    _Plano := Cds.FieldByName('PLANO').asInteger;
  end
  else
    sbtnAlterar.Down := false;
end;

procedure TfrmLancDocCAPCAR.sbtnApagarClick(Sender: TObject);
var
  iCampo, iDestac: Integer;
  bMensExcluir: boolean;
begin
  if (trim(BtnStatus.Caption)  = 'Documento Baixado') then
  begin
    MsgDlg('Documento Baixado. Não é Permitido Excluir', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    sbtnApagar.Down := False;
    exit;
  end;
  bMensExcluir := true;

  _TpDesmb := '';
  _AtivProj := '';
  _Ccusto := '';
  _Crespom := '';
  _Plano := Cds.FieldByName('PLANO').asInteger;

  //inherited;

  if (CmeCadastro.Operacao = opIdle) then
  begin
    try
      CmeCadastro.Operacao := opApagar;

      if (bMensExcluir) then
      begin
        if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
          CmeCadastro.Delete(Self);
      end
      else
        CmeCadastro.Delete(Self);

      if (Cds.IsEmpty) then
        CmeCadastro.Operacao := opVazio
      else
        CmeCadastro.Operacao := opIdle;

      CmeCadastro.AtualizaBotoes(Self);
    except
      CmeCadastro.Operacao := opIdle;
      sbtnApagar.Down := False;
      raise;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.dsLancamentoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if not(bbtnConfirmar.Enabled) and not(CdsLancamento.IsEmpty) then
  begin
    SqlContab.Prepare;
    SqlContab.ParamByName('PLNCODIGO').asFloat := CdsLancamento.FieldByName('PLNCODIGO').asInteger;
    SqlContab.Open;
  end;
end;

function TfrmLancDocCAPCAR.ConfereSaldo(CodDocumento: integer; VerificaLanc: boolean): boolean;
begin
 _oDocumento.Saldo.CalculaSaldo(CodDocumento);

 if (Verificalanc) then
   Result := (((Cds.FieldByName('STATUS').asString = '2') and
               (Cds.FieldByName('OPERACAO').asString <> '10')) or
             (not FloatsEqual(Abs(_oDocumento.Saldo.Valor), Abs(dbeValorCorrente.Value))))
 else
   Result := (((Cds.FieldByName('STATUS').asString = '2') and
               (Cds.FieldByName('OPERACAO').asString <> '10')) or
               (IsFloatZero(_oDocumento.Saldo.Valor)));

 if (Result) then
   MsgDlg('Existem outros lançamentos para este documento,'+#13+
          'proibido alterar, excluir ou estornar', 'Erro', mtError, [mbOk,mbHelp], 0);
end;

function TfrmLancDocCAPCAR.VerificaParcelas(sNumFatura: string):boolean;
begin
 if (sNumFatura = '0') or (sNumFatura = '') then
   Result := false
 else
 begin
   Result := FazQuery(dmCds.qry,
     'SELECT CODDOCUMENTO'+#13+
     'FROM   DOCUMENTO'+#13+
     'WHERE  (NUMFATURA = ' +sNumFatura+ ') AND'+#13+
     '       (OPERACAO  = ''3'')');
   dmCds.qry.Close;
   if (Result) then
     MsgDlg('O Documento foi Englobado\Parcelado, favor excluir as parcelas para modificar o documento','Erro',mtError,[mbOk,mbHelp],0);
 end;
end;

procedure TfrmLancDocCAPCAR.cbLancaBaixaClick(Sender: TObject);
begin
  inherited;
  dbenChBordero.Enabled   := cbLancaBaixa.Checked;
  lblNumChBordero.Enabled := cbLancaBaixa.Checked;

  if not cbLancaBaixa.Checked then
     if (Cds.State In ([dsInsert,dsEdit])) then Cds.FieldByName('NUMCHQBORDERO').Clear;
end;

procedure TfrmLancDocCAPCAR.CContabilExit(Sender: TObject);
begin
  inherited;
  CContabil.AceitaTipoConta := SoAnalitica;
  dblcCCusto.Enabled   := CContabil.Conta.ObrigaCentrodeCusto;
  dblcSubConta.Enabled := CContabil.Conta.obrigaSubConta;
end;

procedure TfrmLancDocCAPCAR.CmpForCliEnter(Sender: TObject);
begin
  inherited;
  dblcTipoRD.Enabled := false;
end;

procedure TfrmLancDocCAPCAR.CmpForCliExit(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
     (ActiveControl <> nil) and (ActiveControl.Tag <> 9999) and _Valida then
  begin
     if ( not (Cds.State in [DsEdit, DsInsert]) ) then Cds.Edit;

     if CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;

     if (CmpForCli.Valida = VcOk) And (StatusIsAtivo(CmpForCli.ForCliReg.Id, Sistema.IdEmpresa)) then
     begin
        Cds.FieldByName('CODSUBCONTA').asString := CmpForCli.ForCliReg.SubConta;
        CmbSubConta.LookupValue := CmpForCli.ForCliReg.SubConta;

        DtmDadosBancarios.SetaContaPreferencial(CmpForCli.ForCliReg.Id, Cds);

        if ( ParamIntegra.IntegraContab ) and
            ((Cds.FieldByName('IDMODULO').asInteger = 3) or
             (Cds.FieldByName('IDMODULO').asInteger = 4)) then
        begin
           if ( ParamIntegra.RecPag = 'R' ) then
           begin
              if Trim(CmpForCli.ForCliReg.CContabil) = '' then
              begin
                MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Cliente','Erro',mtError,[mbOk,mbHelp],0);
                bbtnCancelar.Click;
                exit;
              end;

              if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CReceita then
                 cbIntegra.Checked:=true;
           end
           else
           begin
              if Trim(CmpForCli.ForCliReg.CContabil) = '' then
              begin
                MsgDlg('Como a contabilidade está Integrada, é obrigatório preencher a conta contabil deste Fornecedor','Erro',mtError,[mbOk,mbHelp],0);
                bbtnCancelar.Click;
                exit;
              end;
              if CmpForCli.ForCliReg.CContabil = CmpForCli.ForCliReg.CDespesa then
                 cbIntegra.Checked:=true;
           end;
        end;

        if DbeNoDocumento.Visible then
        begin
           Cds.FieldByName('COMPLDOCUMENTO').asString := ParamIntegra.BuscaCodigoFiscalReduzido(CmpForCli.ForCliReg.Id);

           if (Trim(Cds.FieldByName('COMPLDOCUMENTO').asString) = '') and
              ( ParamIntegra.AssociaComplTipoFat ) then
              begin
                 MsgDlg('Não foi cadastrada a Classificação Fiscal para este ' + CmpForCli.caption + ' ou o código reduzido da mesma não foi preenchido. Não é possível Inserir o documento.','Erro',mtError,[mbOk,mbHelp],0);
                 bbtnCancelar.Click;
                 exit;
              end;
        end;

     end
     else
     begin
        if CmpForCli.CanFocus then CmpForCli.SetFocus;
        exit;
     end;

     if DbeNoDocumento.CanFocus then
        DbeNoDocumento.SetFocus
     else
        if dbenNumDoc.CanFocus then
           dbenNumDoc.SetFocus;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcTipoRDCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    MontaCentroDeCusto;
    if CdsDet.State In [DsEdit, DsInsert] then
    begin
       CdsDet.FieldByName('DESCRICAO').asString := dblcTipoRD.Text;
       if not CdsTipoRD.FieldByName('PLACONTACREDITO').IsNull then
          CdsDet.FieldByName('PLACONTACREDITO').asString := CdsTipoRD.FieldByName('PLACONTACREDITO').asString
       else
          CdsDet.FieldByName('PLACONTACREDITO').asString := CmpForCli.ForCliReg.CContabil  ;

       _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asString;
       CdsDet.FieldByName('HITCODHIST').asString := CdsTipoRD.FieldByName('HITCODHIST').asString;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  if MsResORc.RetornouValor then
  begin
    if not (CdsDet.State In [DsEdit, DsInsert]) then CdsDet.Edit;

    CdsDet.FieldByName('NUMRESERVA').asInteger := StrToInt(MsResORc.ValoresChave[1]);
    CdsDet.FieldByName('IDRESERVAORCAMEN').asFloat := StrToFloat(MsResORc.ValoresChave[0]);
    ReResorc.Value := CdsDet.FieldByName('NUMRESERVA').asInteger;
    SetaCentResponDesemb(CdsDet.FieldByName('IDRESERVAORCAMEN').asInteger, false);
  end;
end;

procedure TfrmLancDocCAPCAR.dblcCentroResponExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(dblcCentroRespon.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsCentroRespon.FieldByName('ANALITICOSINTET').asString <> 'A') then
     begin
        MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk,mbHelp],0);
        if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     end;

     _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').asString;
  end;
end;

function TfrmLancDocCAPCAR.ObrigaSubconta(sContaContabil: string):boolean;
begin
  Result := false;

  if ( ParamIntegra.IntegraContab ) and (CmbSubConta.Text = '') then
  begin
    SqlDadosConta.Prepare;
    SqlDadosConta.ParamByName('PLACONTA').asString := sContaContabil;
    SqlDadosConta.ParamByName('PLANO').asInteger := _Plano;
    SqlDadosConta.Open;

    if not CdsDadosConta.IsEmpty then
    begin
       Result := (CdsDadosConta.FieldByName('PLASUBCONTA').asString = 'S');

       if Result then MsgDlg('A Conta "' + CmpForcli.ForCliReg.CContabil + '" obriga subconta. Informar na "Pasta Geral" em ' + LblSubContaCli.Caption,'Erro',mtError,[mbOk,mbHelp],0);
    end;

    CdsDadosConta.Close; 
  end;
end;

procedure TfrmLancDocCAPCAR.SetaCentResponDesemb(iNumReserva:LongInt;bLimpa: boolean);
var
  sFiltroDesemb, sFiltroCRespon: string;
begin
  if (not bLimpa) and
     FazQuery(dmCds.Qry,'SELECT ' +
                               ' CP.CODCENTRORESPON, CP.CODTIPRECDES ' +
                               'FROM ' +
                               ' COMPCONTASORCAMEN CP, RESERVAORCAMEN RE ' +
                               'WHERE ' +
                               ' (RE.IDRESERVAORCAMEN = ' + IntToStr(iNumReserva) + ') AND ' +
                               ' (RE.IDPLANOORCAMEN = CP.IDPLANOORCAMEN)     AND ' +
                               ' (RE.IDCONTAORCAMEN = CP.IDCONTAORCAMEN)') then
  begin
    sFiltroDesemb  := '';
    sFiltroCRespon := '';

    while not dmCds.Qry.EOF Do
    begin
      if not dmCds.Qry.FieldByname('CODTIPRECDES').IsNull then
         if sFiltroDesemb = '' then
            sFiltroDesemb  := ' CODTIPRECDES = ''' + Espaco(dmCds.Qry.FieldByname('CODTIPRECDES').asString,15) + ''''
         else
            sFiltroDesemb  := sFiltroDesemb + ' OR CODTIPRECDES = ''' + Espaco(dmCds.Qry.FieldByname('CODTIPRECDES').asString,15) + '''';

      if not dmCds.Qry.FieldByname('CODCENTRORESPON').IsNull then
         if sFiltroCRespon = '' then
            sFiltroCRespon := ' CODCENTRORESPON = ''' + Espaco(dmCds.Qry.FieldByname('CODCENTRORESPON').asString,10) + ''''
         else
            sFiltroCRespon := sFiltroCRespon + ' OR CODCENTRORESPON = ''' + Espaco(dmCds.Qry.FieldByname('CODCENTRORESPON').asString,10) + '''';
      dmCds.Qry.Next;
    end;

    if sFiltroDesemb <> '' then
    begin
      CdsTipoRD.Filter         := sFiltroDesemb;
      CdsTipoRD.Filtered       := true;
    end
    else
    begin
      CdsTipoRD.Filtered       := false;
      CdsTipoRD.Filter         := '';
    end;

    if sFiltroCRespon <> '' then
    begin
      CdsCentroRespon.Filter   := sFiltroCRespon;
      CdsCentroRespon.Filtered := true;
    end
    else
    begin
      CdsCentroRespon.Filtered       := false;
      CdsCentroRespon.Filter         := '';
    end;
  end
  else
  begin
    CdsTipoRD.Filtered       := false;
    CdsTipoRD.Filter         := '';
    CdsCentroRespon.Filtered := false;
    CdsCentroRespon.Filter   := '';
  end;
end;

procedure TfrmLancDocCAPCAR.DbeNoDocumentoExit(Sender: TObject);
var
  sNoDocum :string;
begin
  inherited;
  if (CmeCadastro.Operacao In [Opalterar,OpInserir]) and
     (ActiveControl.tag <> 9999) and
     (DbeNoDocumento.Visible) then
  begin

    sNodocum := Cds.FieldByName('NUMFATURA_1').asString;
    while (Pos('.',sNodocum) <> 0) Do
          Delete(sNoDocum,Pos('.',sNodocum),1);

    if Trim(sNoDocum) <> '' then
    begin
       Cds.FieldByName('NODOCUMENTO').asString := sNoDocum;
       if Cds.FieldByName('IDFORCLI').IsNull then
       begin
          if CmpForCli.CanFocus then CmpForCli.SetFocus;
       end
       else
         if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
    end
    else
      if dbeDataEmi.CanFocus then dbeDataEmi.SetFocus;
  end;
end;

procedure TfrmLancDocCAPCAR.SetaEnglobaParcela;
var
  sNumDocumento, sAuxMasacara :string;
begin
  inherited;
  if (dblcTipoDoc.Text <> '') and
     (CmeCadastro.Operacao In [OpInserir, OpAlterar]) then
  begin
     cbEnglobParc.Enabled := (((CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').asString = 'A') OR
                               (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').IsNull)));
     cbEnglobParc.Checked := (CdsTipoDoc.FieldByName('FLGENGLOBAPARCELA').asString = 'S') Or
                             ((Cds.FieldByName('OPERACAO').asString = '1') or (Cds.FieldByName('OPERACAO').asString = '11'));
  end;

  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) and
     (CdsTipoDoc.FieldByName('FLGGERANUMDOC').asString = 'S') and
     (dbenNumDoc.Value = 0.00) and
     (dblcTipoDoc.Text <> '') then
  begin
    if ParamIntegra.MascaraNoDocum <> '' then
    begin
       sNumDocumento := IntToStr(_oDocumento.GetSequenceDocumento);
       Cds.FieldByName('NODOCUMENTO').asFloat := StrToFloat(sNumDocumento);
       sAuxMasacara := ParamIntegra.MascaraNoDocum;

       while Pos('9',sAuxMasacara) <> 0 Do
             sAuxMasacara[Pos('9',sAuxMasacara)] := '0';

       sNumDocumento := Copy(sAuxMasacara, 1, Length(sAuxMasacara) - Length(sNumDocumento)) + sNumDocumento;
       Cds.FieldByName('NUMFATURA_1').asString := sNumDocumento;
       DbeNoDocumentoExit(Self);
    end
    else
    begin
       if (Trim(dblcTipoDoc.text) <> '') and (Cds.FieldByName('NODOCUMENTO').asFloat = 0) then
          Cds.FieldByName('NODOCUMENTO').asFloat := _oDocumento.GetSequenceDocumento;
    end;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcTipoDocExit(Sender: TObject);
begin
  inherited;
  SetaEnglobaParcela;
end;

procedure TfrmLancDocCAPCAR.MontaCentroDeCusto;
begin
  dblcTipoRD.LookupValue := dblcTipoRD.LookupValue;

  if cbIntegra.Checked then
  begin
     With SqlCentroCusto, Sql Do
     begin
        Clear;
        Add(' SELECT DISTINCT ');
        Add('    CODCENTROCUSTO, ');
        Add('    NOME, ');
        Add('    STATUSGRUPOCDC, ');
        Add('    IDPROGRAMA ');
        Add(' FROM ');
        Add('    CENTCUST ');
        Add(' WHERE ');
        Add('    ATIVO = ''S'' AND ');
        Add('    IdEmpresa = :IdEmpresa ');
        Add(' ORDER BY ');
        Add('    CODCENTROCUSTO, ');
        Add('    STATUSGRUPOCDC DESC ');

        Prepare;
        ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
        Open;
     end;
  end
  else
  begin
     if ( not CdsTipoRD.FieldByName('PLACONTA').IsNull ) then
     begin
       With SqlAux, Sql Do
       begin
          Clear;
          Add(' SELECT ');
          Add('    PLACCUST ');
          Add(' FROM ');
          Add('    PLANOCONTA ');
          Add(' WHERE ');
          Add('    PLANO = :PLANO ');
          Add('    AND PLACONTA = :PLACONTA ');

          Prepare;
          ParamByName('PLACONTA').asString := Trim(CdsTipoRD.FieldByName('PLACONTA').asString);
          ParamByName('PLANO').asInteger := Sistema.IdEmpresa;
          Open;
       end;

       With SqlCentroCusto, Sql Do
       begin
          Clear;
          
          if CdsAux.FieldByName('PLACCUST').asString = 'S' then
          begin
            Add(' SELECT DISTINCT ');
            Add('   CENT.CODCENTROCUSTO, ');
            Add('   CENT.NOME, ');
            Add('   CENT.STATUSGRUPOCDC, ');
            Add('   CENT.IDPROGRAMA ');
            Add(' FROM ');
            Add('   CENTCUST CENT ');
            Add(' WHERE ');
            Add('   CENT.ATIVO = ''S'' AND ');
            Add('   CODCENTROCUSTO IN ');
            Add('       (SELECT ');
            Add('           CODCENTROCUSTO ');
            Add('        FROM ');
            Add('           CONTASxCC CONT ');
            Add('        WHERE ');
            Add('           CONT.IdEmpresa = CENT.IdEmpresa AND ');
            Add('           CONT.CODCENTROCUSTO = CENT.CODCENTROCUSTO AND ');
            Add('           CONT.IdEmpresa = :IdEmpresa AND ');
            Add('           CONT.PLANO = :PLANO AND ');
            Add('           RTRIM(CONT.PLACONTA) = :PLACONTA ) ');
            Add(' ORDER BY ');
            Add('    CENT.CODCENTROCUSTO, ');
            Add('    CENT.STATUSGRUPOCDC DESC ');

            Prepare;
            ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
            ParamByName('PLANO').asInteger := ParamIntegra.Plano;
            ParamByName('PLACONTA').asString := Trim(CdsTipoRD.FieldByName('PLACONTA').asString);
            Open;
          end
          else
          begin
             Add(' SELECT DISTINCT ');
             Add('   CODCENTROCUSTO, ');
             Add('   NOME, ');
             Add('   STATUSGRUPOCDC, ');
             Add('   IDPROGRAMA ');
             Add(' FROM ');
             Add('   CENTCUST ');
             Add(' WHERE ');
             Add('   ATIVO = ''S'' AND ');
             Add('   IdEmpresa = :IdEmpresa ');
             Add(' ORDER BY ');
             Add('   CODCENTROCUSTO, ');
             Add('   STATUSGRUPOCDC DESC ');

             Prepare;
             ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
             Open;
          end;
       end;

       if not CdsCentroCusto.IsEmpty then
       begin
         if (not CdsCentroRespon.FieldByName('CODCENTROCUSTO').IsNull) and
            (CdsDet.FieldByName('CODCENTROCUSTO').IsNull) then
         begin
          if not (CdsDet.State In [DsEdit,DsInsert]) then CdsDet.Edit;
                 CdsDet.FieldByName('CODCENTROCUSTO').asString := CdsCentroRespon.FieldByName('CODCENTROCUSTO').asString;
           if CdsCentroCusto.Locate('CODCENTROCUSTO', CdsCentroRespon.FieldByName('CODCENTROCUSTO').asString, []) then
           begin

             CmbCentCusto.LookupValue := CdsCentroRespon.FieldByName('CODCENTROCUSTO').asString;
             CmbCentCusto.DisplayValue := CdsCentroCusto.FieldByName('NOME').asString;
           end
           else
             CmbCentCusto.Clear;
         end
         else
         begin
           if not CdsDet.FieldByName('CODCENTROCUSTO').IsNull then
           begin
             CmbCentCusto.LookupValue := CdsDet.FieldByName('CODCENTROCUSTO').asString;
             CmbCentCusto.DisplayValue := CdsCentroCusto.FieldByName('NOME').asString;
           end;
         end;
       end
       else
       begin
         With SqlCentroCusto, Sql Do
         begin
            Clear;
            Add(' SELECT DISTINCT ');
            Add('    CODCENTROCUSTO, ');
            Add('    NOME, ');
            Add('    STATUSGRUPOCDC, ');
            Add('    IDPROGRAMA ');
            Add(' FROM ');
            Add('   CENTCUST ');
            Add(' WHERE ');
            Add(' 1=2 ');

            Open;
         end;
         
         if not CdsDet.FieldByName('CODCENTROCUSTO').IsNull then
         begin
           CmbCentCusto.LookupValue      := CdsDet.FieldByName('CODCENTROCUSTO').asString;
           CmbCentCusto.DisplayValue     := CdsCentroCusto.FieldByName('NOME').asString;
         end
         else
           CmbCentCusto.Clear;
       end;
     end
     else
     begin
         With SqlCentroCusto, Sql Do
         begin
            Clear;
            Add(' SELECT DISTINCT ');
            Add('    C.CODCENTROCUSTO, ');
            Add('    C.NOME, ');
            Add('    C.STATUSGRUPOCDC, ');
            Add('    C.IDPROGRAMA ');
            Add(' FROM ');
            Add('    TIPORDXCCXCONTA T, ');
            Add('    CENTCUST C ');
            Add(' WHERE ');
            Add('    C.ATIVO = ''S'' AND ');
            Add('    (T.RecPag = :RecPag) AND ');
            Add('    (T.IDPESSOA = :IDPESSOA) AND ');
            Add('    (RTRIM(T.CODTIPRECDES) = :CODTIPRECDES) AND ');

            if not CdsDet.FieldByName('IDPROGRAMA').IsNull then
               Add(' (T.IDPROGRAMA = :IDPROGRAMA) AND ');

            Add('    (T.IDPESSOA = C.IdEmpresa) AND ');
            Add('    (C.CODCENTROCUSTO = T.CODCENTROCUSTO) ');
            Add(' ORDER BY ');
            Add('    C.CODCENTROCUSTO, ');
            Add('    C.STATUSGRUPOCDC DESC ');

            Prepare;
            ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
            ParamByName('RecPag').asString := ParamIntegra.RecPag;
            ParamByName('CODTIPRECDES').asString := Trim(dblcTipoRD.LookupValue);

            if not CdsDet.FieldByName('IDPROGRAMA').IsNull then
               ParamByName('IDPROGRAMA').asInteger := CdsDet.FieldByName('IDPROGRAMA').asInteger;
            Open;
         end;

       if CdsCentroCusto.IsEmpty then
       begin
          With SqlCentroCusto, Sql Do
          begin
             Clear;
             Add(' SELECT DISTINCT ');
             Add('    CODCENTROCUSTO, ');
             Add('    NOME, ');
             Add('    STATUSGRUPOCDC, ');
             Add('    IDPROGRAMA ');
             Add(' FROM ');
             Add('    CENTCUST ');
             Add(' WHERE ');
             Add('    ATIVO = ''S'' AND ');
             Add('    IdEmpresa = :IdEmpresa ');
             Add(' ORDER BY ');
             Add('    CODCENTROCUSTO, ');
             Add('    STATUSGRUPOCDC DESC ');

            Prepare;
            ParamByName('IdEmpresa').asInteger := Sistema.IdEmpresa;
            Open;
          end;
          
          if not CdsDet.FieldByName('CODCENTROCUSTO').IsNull then
          begin
            CmbCentCusto.LookupValue := CdsDet.FieldByName('CODCENTROCUSTO').asString;
            CmbCentCusto.DisplayValue := CdsCentroCusto.FieldByName('NOME').asString;
          end
          else
            CmbCentCusto.Clear;
       end;
     end;
  end;
end;

procedure TfrmLancDocCAPCAR.dbeDataEmiExit(Sender: TObject);
begin
  inherited;
  if sbtnInserir.Down = true then
  begin
     Cds.FieldByName('DATALANCTO').AsDateTime := strtodate(dbeDataEmi.text);
     dbeDataLanc.text := dbeDataEmi.text;
  end;
end;

procedure TfrmLancDocCAPCAR.BtnNumApgrClick(Sender: TObject);
begin
  inherited;
  if Cds.State in [DsEdit, DsInsert] then
     Cds.FieldByName('NUMAPGR').asInteger := LeUltRegistro(nil,'SEQAPGR');
end;

procedure TfrmLancDocCAPCAR.CContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CContabil.AceitaTipoConta := Indiferente;
end;

procedure TfrmLancDocCAPCAR.CmbProgramaExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
     CdsDet.FieldByName('DESCPROGRAMA').asString := CmbPrograma.Text;
end;

procedure TfrmLancDocCAPCAR.CmbPlanoExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     _PlanoPrevDet := CdsDet.FieldByName('IDPLANOPREV').asInteger;
     CdsDet.FieldByName('DESCPLANO').asString := CmbPlano.Text;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbPatroExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     CdsDet.FieldByName('NOMEPATRO').asString := CmbPatro.Text;
     _PatroDet := CdsDet.FieldByName('IDPATRO').asInteger;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbCentCustoExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if (Trim(CmbCentCusto.Text)<>'') and (ActiveControl.Tag <> 9999) and
        (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').asString <> 'A') then
     begin
        MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk,mbHelp],0);
        if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
     end;

    _Ccusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString;
    CdsDet.FieldByName('NOMECENTROCUSTO').asString := CmbCentCusto.Text;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcTipoRDExit(Sender: TObject);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    _TpDesmb := CdsTipoRD.FieldByName('CODTIPRECDES').asString;
    CdsDet.FieldByName('FLGOBRIGARESERVA').asString := CdsTipoRD.FieldByName('FLGOBRIGARESERVA').asString;
  end;
end;

procedure TfrmLancDocCAPCAR.CmbCentCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
    if (Trim(CmbCentCusto.Text)<>'') and
       (ActiveControl.Tag <> 9999) and
       (CdsCentroCusto.FieldByName('STATUSGRUPOCDC').asString <> 'A') then
    begin
       MsgDlg('Centro de custo tem de ser analítico','Atenção',mtWarnIng,[mbOk,mbHelp],0);
       if CmbCentCusto.CanFocus then CmbCentCusto.SetFocus;
    end;

    _CCusto := CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString;
    CdsDet.FieldByName('NOMECENTROCUSTO').asString := CmbCentCusto.Text;

    if not CdsCentroCusto.FieldByName('IDPROGRAMA').IsNull then
       CdsDet.FieldByName('IDPROGRAMA').asFloat := CdsCentroCusto.FieldByName('IDPROGRAMA').asFloat
    else
       CdsDet.FieldByName('IDPROGRAMA').Clear;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if CdsDet.State In [DsEdit, DsInsert] then
  begin
     if Cds.FieldByName('MOECODIGO').asInteger <> 0 then
     begin
        CdsDet.FieldByName('MOECODIGO').asInteger := Cds.FieldByName('MOECODIGO').asInteger;
        dbeValorMoedaDet.Enabled := true;
        dbeValorDet.Enabled := false;
     end
     else
     begin                                                 
        dbeValorMoedaDet.Enabled := false;
        dbeValorDet.Enabled := true;
     end;

     if (Trim(dblcUnidNegoc.Text)<>'') and
        (ActiveControl.Tag <> 9999) and
        (CdsUnidNegoc.FieldByName('UNETIPO').asString <> 'A') then
     begin
        MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarnIng,[mbOk,mbHelp],0);
        if dblcUnidNegoc.CanFocus then dblcUnidNegoc.SetFocus;
     end;

     _AtivProj := CdsUnidNegoc.FieldByName('UNIDNEGOC').asString;
  end;

end;

procedure TfrmLancDocCAPCAR.CmpForCliApertouBotao(Sender: TObject);
begin
  inherited;
  _IdForCliAdianto := Cds.FieldByName('IDFORCLI').asInteger;
end;

procedure TfrmLancDocCAPCAR.CmbProgramaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  CdsDet.FieldByName('DESCPROGRAMA').asString := CmbPrograma.Text;
end;

procedure TfrmLancDocCAPCAR.CmbPatroCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  _PatroDet := CdsDet.FieldByName('IDPATRO').asInteger;
  CdsDet.FieldByName('NOMEPATRO').asString := CmbPatro.Text;
end;

procedure TfrmLancDocCAPCAR.CmbPlanoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: boolean);
begin
  inherited;
  _PlanoPrevDet := CdsDet.FieldByName('IDPLANOPREV').asInteger;
  CdsDet.FieldByName('DESCPLANO').asString := CmbPlano.Text;
end;

procedure TfrmLancDocCAPCAR.BtnBuscaContaCorClick(Sender: TObject);
begin
  inherited;
  if CmeCadastro.Operacao In [OpInserir, OpAlterar] then
  begin
     With DtmDadosBancarios Do
     begin
        SetaFiltroMs(Cds.FieldByName('IDFORCLI').asFloat);
        if MsContaCor.Executar = MrOk then
        begin
          Cds.FieldByName('IDCBANCARIA').asFloat := StrToFloat(MsContaCor.ValoresChave[0]); //CONTABANCARIA.IDCBANCARIA
          Cds.FieldByName('CONTACORRENTE').asString := MsContaCor.ValoresChave[1]; //CONTABANCARIA.CONTACORRENTE
          Cds.FieldByName('NUMBANCO').asString := MsContaCor.ValoresChave[2]; //BANCO.NUMBANCO
          Cds.FieldByName('NUMAGENCIA').asString := MsContaCor.ValoresChave[3]; //AGENCIABANCARIA.NUMAGENCIA
          Cds.FieldByName('DESCTIPOCONTA').asString := MsContaCor.ValoresChave[4]; //CONTABANCARIA.TIPOCONTA
        end;
     end;
  end;
end;

procedure TfrmLancDocCAPCAR.setaplanopatroglobal;
begin
   if CdsDet.FieldByName('IDPLANOPREV').IsNull and
      (ParamIntegra.PlanoPrevGlobal > 0) then
   begin
      CdsDet.FieldByName('IDPLANOPREV').asFloat := ParamIntegra.PlanoPrevGlobal;
      CmbPlano.Lookupvalue := IntToStr(ParamIntegra.PlanoPrevGlobal);
      _PlanoPrevDet := ParamIntegra.PlanoPrevGlobal;
      CmbPlano.CloseUp(true);
      CmbPlanoExit(Self);
   end;

   if CdsDet.FieldByName('IDPATRO').IsNull and
      (ParamIntegra.PatroGlobal > 0) then
   begin
      _PatroDet := ParamIntegra.PatroGlobal;
      CmbPatro.Lookupvalue := IntToStr(ParamIntegra.PatroGlobal);
      CdsDet.FieldByName('IDPATRO').asFloat := ParamIntegra.PatroGlobal;
      CmbPatro.CloseUp(true);
      CmbPatroExit(Self);
   end;
end;

procedure TfrmLancDocCAPCAR.DclAtivProjetoExit(Sender: TObject);
begin
  inherited;
  if (Trim(DclAtivProjeto.Text) <> '') and
     (CdsAlteradores.State In [DsEdit,DsInsert]) then
     CdsAlteradores.FieldByName('NOME').asString := DclAtivProjeto.Text;
end;

procedure TfrmLancDocCAPCAR.dblkAlteradorExit(Sender: TObject);
begin
  inherited;
  if (Trim(dblkAlterador.Text) <> '') and
     (CdsAlteradores.State In [DsEdit,DsInsert]) then
  begin
   CdsAlteradores.FieldByName('DESCRICAO').asString := dblkAlterador.Text;
   CdsAlteradores.FieldByName('DEBCRE').asString := CdsAlt.FieldByName('ACRESDECRES').asString;
  end;
end;

Function TfrmLancDocCAPCAR.TestaAlterador:boolean;
begin
  Result := false;
  if Trim(dblkAlterador.Text) = '' then
     MsgDlg('O Alterador não foi Informado','Erro',mtError,[mbOk,mbHelp],0)
  else
     if DbrValor.Value = 0.00 then
        MsgDlg('O Valor do Alterador não foi Informado','Erro',mtError,[mbOk,mbHelp],0)
     else
        if DtLancto.Text = '' then
           MsgDlg('A Data de Lançamento do Alterador não foi Informada','Erro',mtError,[mbOk,mbHelp],0)
        else
           Result := true;

  if not Result then Abort;
end;

procedure TfrmLancDocCAPCAR.DbrValorExit(Sender: TObject);
begin
  inherited;
  if CdsAlteradores.State In [DsEdit,DsInsert] then
     CdsAlteradores.FieldByName('VLRLIQUIDO').asFloat := CdsAlteradores.FieldByName('VALOR').asFloat;
end;

procedure TfrmLancDocCAPCAR.CdsalteradoresAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not cbIntegra.Checked then
  begin
     CdsAlteradores.FieldByName('CONTABILIZA').asString := 'S';
     CkbContabiliza.Enabled := true;
  end
  else
  begin
     CdsAlteradores.FieldByName('CONTABILIZA').asString := 'N';
     CkbContabiliza.Enabled := cbIntegra.Enabled;
  end;
end;

procedure TfrmLancDocCAPCAR.cbEnglobParcClick(Sender: TObject);
begin
  inherited;
  BtnNumApgr.Enabled := not cbEnglobParc.checked;
  GpConta.Enabled := not cbEnglobParc.checked;
  
  if sbtnInserir.Down then EdtNumAp.text:='';
end;

procedure TfrmLancDocCAPCAR.SelecionaTipoDesembolso;
begin
  if (Trim(dblcCentroRespon.Text)<>'') and
     (ActiveControl.Tag <> 9999) and
     (CdsCentroRespon.FieldByName('ANALITICOSINTET').asString <> 'A') then
  begin
     MsgDlg('Centro de Responsabilidade tem de ser analítico','Atenção',mtWarnIng,[mbOk,mbHelp],0);
     if dblcCentroRespon.CanFocus then dblcCentroRespon.SetFocus;
     exit;
  end;
  _CRespom:= CdsCentroRespon.FieldByName('CODCENTRORESPON').asString;

  dblcTipoRD.Enabled := true;

  if ParamIntegra.RecPag = 'P' then
  begin
    SqlTipoRD.Sql.Clear;
    SqlTipoRD.Sql.Add(  'SELECT DISTINCT T.CODTIPRECDES, T.RecPag, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                        'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                        'TIPORECEBDESEMB T, FORNXDESEMB F ' +
                        ' WHERE (T.ANASINT = ''A'') AND ' +
                        '       (T.RecPag        = '''+ParamIntegra.RecPag+''') AND  ' +
                        '       (T.IDPESSOA      = '+InttoStr(Sistema.IdEmpresa)+ ') AND ' +
                        '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') AND ' +
                        '       (F.RecPag        = T.RecPag) AND  ' +
                        '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +
                        '       (F.CODTIPRECDES  = T.CODTIPRECDES) ');

    if not CdsCentroRespon.IsEmpty then
      SqlTipoRD.Sql.Add( ' AND  ((T.CODTIPRECDES IN ' +
                         '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                         '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                         '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                         '            (RecPag = T.RecPag))) OR ' +
                         '             not EXISTS (SELECT * ' +
                         '                         FROM TRDXCRESPON ' +
                         '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                         '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');

    SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
    SqlTipoRD.Open;

    if CdsTipoRD.IsEmpty then
    begin
        SqlTipoRD.Sql.Clear;
        SqlTipoRD.Sql.Add( 'SELECT DISTINCT T.CODTIPRECDES, T.RecPag, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                           'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                           'TIPORECEBDESEMB T, RAMOXDESEMB R ' +
                           ' WHERE (T.ANASINT = ''A'') AND ' +
                           '       (T.RecPag           = '''+ParamIntegra.RecPag+''') AND  ' +
                           '       (T.IDPESSOA         = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                           '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR FROM FORNXRAMO WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) AND ' +
                           '       (R.RecPag           = T.RecPag)   AND ' +
                           '       (R.IDPESSOA         = T.IDPESSOA) AND ' +
                           '       (R.CODTIPRECDES     = T.CODTIPRECDES) ');
        if not CdsCentroRespon.IsEmpty then
           SqlTipoRD.Sql.Add( '     AND  ((T.CODTIPRECDES IN ' +
                              '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                              '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                              '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                              '            (RecPag = T.RecPag))) OR ' +
                              '             not EXISTS (SELECT * ' +
                              '                         FROM TRDXCRESPON ' +
                              '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                              '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');

        SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
        SqlTipoRD.Open;

        if CdsTipoRD.IsEmpty then
        begin
          SqlTipoRD.Sql.Clear;
          SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RecPag, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST ' +
                           'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') AND (RecPag = ''' + ParamIntegra.RecPag +
                           ''') AND (IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ') ');

          if not CdsCentroRespon.IsEmpty then
            SqlTipoRD.Sql.Add('  AND ((T.CODTIPRECDES IN ' +
                              '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                              '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                              '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                              '            (RecPag = T.RecPag))) OR ' +
                              '             not EXISTS (SELECT * ' +
                              '                         FROM TRDXCRESPON ' +
                              '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                              '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');

          SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
          SqlTipoRD.Open;
        end;
      end
      else
      begin
         if CdsDet.State in [ DsEdit, DsInsert ] then
         begin
           dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').asString;
           dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').asString;
         end;
      end;
  end
  else { Contas a Receber }
  begin
    SqlTipoRD.Sql.Clear;
    SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RecPag, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                      'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                      'TIPORECEBDESEMB T, CLIXRECEB F ' +
                      ' WHERE (T.ANASINT = ''A'') AND ' +
                      '       (T.RecPag        = '''+ParamIntegra.RecPag+''') AND  ' +
                      '       (T.IDPESSOA      = '+InttoStr(Sistema.IdEmpresa)+ ') AND ' +
                      '       (F.IDPESSOA      = '+IntToStr(CmpForCli.ForCliReg.Id) + ') AND ' +
                      '       (F.RecPag        = T.RecPag) AND  ' +
                      '       (F.IdEmpresa     = T.IDPESSOA) AND ' +
                      '       (F.CODTIPRECDES  = T.CODTIPRECDES)  ');

    if not CdsCentroRespon.IsEmpty then
      SqlTipoRD.Sql.Add('  AND     ((T.CODTIPRECDES IN ' +
                        '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                        '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                        '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                        '            (RecPag = T.RecPag))) OR ' +
                        '             not EXISTS (SELECT * ' +
                        '                         FROM TRDXCRESPON ' +
                        '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                        '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');


    SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
    SqlTipoRD.Open;
       
    if CdsTipoRD.IsEmpty then
    begin
        SqlTipoRD.Sql.Clear;
           
        if Sistema.TipoEmpresa = 'P' then
        begin
           SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RecPag, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                             'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                             ' WHERE (T.ANASINT = ''A'') AND ' +
                             '       (T.RecPag           = '''+ParamIntegra.RecPag+''') AND  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                             '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIXTIPOCLI WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) AND ' +
                             '       (TR.RecPag           = T.RecPag)   AND ' +
                             '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
                             '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ');

           if not CdsCentroRespon.IsEmpty then
             SqlTipoRD.Sql.Add('   AND  ((T.CODTIPRECDES IN ' +
                               '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                               '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                               '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                               '            (RecPag = T.RecPag))) OR ' +
                               '             not EXISTS (SELECT * ' +
                               '                         FROM TRDXCRESPON ' +
                               '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                               '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');

           SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
           if CdsTipoRD.IsEmpty then
           begin
             SqlTipoRD.Sql.Clear;
             SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RecPag, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  ' +
                               'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') AND (RecPag = ''' + ParamIntegra.RecPag +
                               ''') AND (IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ') ');

             if not CdsCentroRespon.IsEmpty then
               SqlTipoRD.Sql.Add('    AND   ((T.CODTIPRECDES IN ' +
                                 '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                                 '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                                 '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                                 '            (RecPag = T.RecPag))) OR ' +
                                 '             not EXISTS (SELECT * '+
                                 '                         FROM TRDXCRESPON ' +
                                 '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                                 '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');

              SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
              SqlTipoRD.Open;
           end;
        end
        else
         begin
           SqlTipoRD.Sql.Clear;
           SqlTipoRD.Sql.Add('SELECT DISTINCT T.CODTIPRECDES, T.RecPag, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
                             'T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST  FROM ' +
                             'TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
                             ' WHERE (T.ANASINT = ''A'') AND ' +
                             '       (T.RecPag           = '''+ParamIntegra.RecPag+''') AND  ' +
                             '       (T.IDPESSOA         = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                             '       (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE FROM CLIENTEPESS WHERE IDPESSOA = ' + IntToStr(CmpForCli.ForCliReg.Id) + ')) AND ' +
                             '       (TR.RecPag           = T.RecPag)   AND ' +
                             '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
                             '       (TR.CODTIPRECDES     = T.CODTIPRECDES)  ');

           if not CdsCentroRespon.IsEmpty then
             SqlTipoRD.Sql.Add('   AND  ((T.CODTIPRECDES IN ' +
                               '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                               '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                               '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                               '            (RecPag = T.RecPag))) OR ' +
                               '             not EXISTS (SELECT * ' +
                               '                         FROM TRDXCRESPON ' +
                               '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                               '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');

           SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
           SqlTipoRD.Open;

           if CdsTipoRD.IsEmpty then
           begin
            SqlTipoRD.Sql.Clear;
            SqlTipoRD.Sql.Add('SELECT T.CODTIPRECDES, T.RecPag, T.PLACONTACREDITO, T.PLANO, T.PLACONTA, T.DESCRICAO, T.ANASINT, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO, T.HITCODHIST ' +
                              'FROM TIPORECEBDESEMB T WHERE (ANASINT = ''A'') AND (RecPag = ''' + ParamIntegra.RecPag +
                              ''') AND (IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ') ');

            if not CdsCentroRespon.IsEmpty then
               SqlTipoRD.Sql.Add('    AND ((T.CODTIPRECDES IN ' +
                                 '            (SELECT CODTIPRECDES FROM TRDXCRESPON WHERE ' +
                                 '            (CODCENTRORESPON = ' +  Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                                 '            (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ') AND ' +
                                 '            (RecPag = T.RecPag))) OR ' +
                                 '             not EXISTS (SELECT * ' +
                                 '                         FROM TRDXCRESPON ' +
                                 '                         WHERE (CODCENTRORESPON = ' + Trim(CdsCentroRespon.FieldByName('CODCENTRORESPON').asString) + ') AND ' +
                                 '                               (IDPESSOA = ' + InttoStr(Sistema.IdEmpresa)+ ')))');
            SqlTipoRD.Sql.Add(' ORDER BY T.RecPag, T.DESCRICAO');
            SqlTipoRD.Open;
           end;
         end;
      end
      else
      begin
         if CdsDet.State in [ DsEdit, DsInsert ] then
         begin
           dblcTipoRD.LookupValue := CdsTipoRD.FieldByName('CODTIPRECDES').asString;
           dblcTipoRD.Text := CdsTipoRD.FieldByName('DESCRICAO').asString;
         end;
      end;
  end;
end;

procedure TfrmLancDocCAPCAR.dblcCentroResponCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: boolean);
begin
  inherited;
  if not CdsCentroRespon.IsEmpty then SelecionaTipoDesembolso;
end;

procedure TfrmLancDocCAPCAR.SelDocs(iCodDocumento: Integer);
   procedure ExibeStatusDoc;
   begin
     try
       BtnStatus.ImageIndex := -1;

       if Cds.FieldByName('ESTORNO').asInteger <> 0 then
       begin
           BtnStatus.Caption    := 'Doc. Estornado\Cancelado';
           BtnStatus.ImageIndex := 2;
       end
       else
       begin
          if ( Trim(Cds.FieldByName('STATUS').asString) = '2' ) then
          begin
            if Cds.FieldByName('NUMFATURA').asInteger <> 0 then
            begin
              BtnStatus.Caption    := 'Documento Englobado\Parcelado ';
              BtnStatus.ImageIndex := 3
            end
            else
            begin
              BtnStatus.Caption    := 'Documento Baixado ';
              BtnStatus.ImageIndex := 1
            end;
          end
          else
          begin
            _oDocumento.Saldo.CalculaSaldo(Cds.FieldByName('CODDOCUMENTO').asInteger);

            if IsFloatZero(_oDocumento.Saldo.Valor) then
              BtnStatus.Caption    := 'Documento Em Aberto '
            else
              BtnStatus.Caption    := 'Documento Em Aberto '  + (#13+#10) + 'Saldo: '+ FormatFloat('#,##0.00', _oDocumento.Saldo.Valor );

            BtnStatus.ImageIndex := 0
          end;
       end;
     except
         MsgDlg('Erro ao associar imagens','Erro',mtError,[mbOk,mbHelp],0);
     end;
   end;
begin
   SqlDoc.Prepare;
   SqlDoc.ParambyName('CODDOCUMENTO').asInteger := iCodDocumento;
   SqlDoc.Open;

   SQLDet.Prepare;
   SQLDet.ParambyName('CODDOCUMENTO').asInteger := iCodDocumento;
   SQLDet.Open;

   SQLLancamento.Prepare;
   SQLLancamento.ParambyName('CODDOCUMENTO').asInteger := iCodDocumento;
   SQLLancamento.Open;

   SqlContab.Prepare;
   SqlContab.ParambyName('PLNCODIGO').asInteger := Cds.FieldByName('PLNCODIGO').asInteger;
   SqlContab.Open;

   SqlContab.Prepare;
   SqlContab.ParambyName('PLNCODIGO').asInteger := Cds.FieldByName('PLNCODIGO').asInteger;
   SqlContab.Open;

   SQLAlteradores.Prepare;
   SQLAlteradores.ParambyName('CODDOCUMENTO').asInteger := iCodDocumento;
   SQLAlteradores.Open;

   ExibeStatusDoc;
end;

procedure TfrmLancDocCAPCAR.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DbeNoDocumento.Visible then
     Cds.FieldByName('NUMFATURA_1').EditMask :=  ParamIntegra.MascaraNoDocum + ';1; ';
end;

procedure TfrmLancDocCAPCAR.CdsDetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(CdsDet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(CdsDet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';

  if ParamIntegra.RecPag = 'R' then
  begin
     CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Recebimento';
     CdsDet.FieldByName('NOME').DisplayLabel      := 'Projeto';
  end
  else
  begin
     CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Desembolso';
     CdsDet.FieldByName('NOME').DisplayLabel      := 'Atividade';
  end;

  CdsDet.FieldByName('NUMIMOVEL').Visible := (UpperCase(Sistema.TipoEmpresa) = 'P');
  CdsDet.FieldByName('NOMEPATRO').Visible := (UpperCase(Sistema.TipoEmpresa) = 'P');
  CdsDet.FieldByName('DESCPLANO').Visible := (UpperCase(Sistema.TipoEmpresa) = 'P');
  CdsDet.FieldByName('DESCPROGRAMA').Visible := (UpperCase(Sistema.TipoEmpresa) = 'P');
end;

procedure TfrmLancDocCAPCAR.CdsUnidNegocAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('UNECODIGO').EditMask := ParamIntegra.MascaraUnidNegoc + ';0;_';
end;

procedure TfrmLancDocCAPCAR.CdsTipoRDAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
     DataSet.Fields[0].EditMask := ParamIntegra.MascaraDesemb + ';0;_'
  else
     DataSet.Fields[0].EditMask := ParamIntegra.MascaraReceb + ';0;_';
end;

procedure TfrmLancDocCAPCAR.CdsDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  CdsDet.FieldByName('VALOR').asFloat := _ValorEdit;
  CdsDet.FieldByName('RecPag').asString := ParamIntegra.RecPag;
  CdsDet.FieldByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
end;

procedure TfrmLancDocCAPCAR.CdsLancamentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TFloatField(DataSet.FieldByName('VALOROUTRAMOEDA')).DisplayFormat := '#,##0.00';
end;

procedure TfrmLancDocCAPCAR.CdsContabAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('LACVALOR')).DisplayFormat := '#,##0.00';
end;

procedure TfrmLancDocCAPCAR.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  Cds.FieldByName('RecPag').asString := ParamIntegra.RecPag;
  Cds.FieldByName('IDPESSOA').asFloat := Sistema.IdEmpresa;
  Cds.FieldByName('IDMODULO').asFloat := Sistema.IdModulo;
  Cds.FieldByName('DATALANCTO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAEMISSAO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAVENCTO').AsDateTime := _DataLancto;
  Cds.FieldByName('DATAPROGRAMADA').AsDateTime := _DataLancto;
  Cds.FieldByName('IDUSUARIOINCLUSAO').asInteger := Sistema.IdUsuario;
  Cds.FieldByName('CODTIPDOC').asInteger := _CodTipDoc;
end;

procedure TfrmLancDocCAPCAR.CdsAfterDelete(DataSet: TDataSet);
  Procedure EmptyDataSet(Dts: TDataSet);
  begin
      Dts.First;
      While not Dts.EOF Do Dts.Delete;
  end;
begin
  inherited;
  EmptyDataSet(CdsDet);
  EmptyDataSet(CdsLancamento);
  EmptyDataSet(CdsContab);
  EmptyDataSet(CdsAlteradores);
end;

class procedure TfrmLancDocCAPCAR.AbrirForm;
begin
  if ExisteForm(FrmLancDocCapCar) then
    MsgDlg('A tela de ' + FrmLancDocCapCar.Caption + ' está aberta, para acessar outra opção é obrigatório sair da operação atual.', 'Atenção', mtInformation, [ MbOk ], 0)
  else
    uFormManager.AbrirForm(FrmLancDocCapCar, TFrmLancDocCapCar, false);
end;

procedure TfrmLancDocCAPCAR.CmeCadastroApplyEdit(sender: TObject;
  var Accept: boolean);
begin
  inherited;
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario,
                                             Sistema.IdEspAcesso,
                                             ParamIntegra.uNidNegoc,
                                             (not cbIntegra.Checked),
                                             Sistema.UsaPlanoPatro,
                                             false,
                                             cbEnglobParc.Checked,
                                             cbLancaBaixa.Checked,
                                             ( CdsPortForma.FieldByName('LANCAFINANC').asString = 'S' ),
                                             GpDotorc.Enabled,
                                             Cds.Data,
                                             CdsAlteradores.Data,
                                             CdsDet.Data,
                                             CdsContab.Data,
                                             DtmCapCarMT.CdsPrevPendente.Data,
                                             DtmCapCarMT.CdsAdtoPendente.Data,
                                             opAlterar,
                                             opldEfetivo,
                                             ParamIntegra.PartidaDobrada,
                                             dbeDataLanc.Date);

  if not(Accept) then
    MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0)
end;

procedure TfrmLancDocCAPCAR.CmeCadastroApplyDelete(sender: TObject;
  var Accept: boolean);
begin
  inherited;
  Accept := _LancDocCapCar.ProcessaDocumento(Sistema.IdUsuario, Sistema.IdEspAcesso,
    ParamIntegra.uNidNegoc, (not cbIntegra.Checked), Sistema.UsaPlanoPatro, false,
    cbEnglobParc.Checked, cbLancaBaixa.Checked, ( CdsPortForma.FieldByName('LANCAFINANC').asString = 'S' ),
    GpDotorc.Enabled, Cds.Data, CdsAlteradores.Data, CdsDet.Data, CdsContab.Data,
    DtmCapCarMT.CdsPrevPendente.Data, DtmCapCarMT.CdsAdtoPendente.Data, opApagar,
    opldEfetivo, ParamIntegra.PartidaDobrada, 0 );

  if not Accept then MsgDlg(_LancDocCapCar.MessageInfo, 'Atenção', mtError, [ MbOk ], 0)
end;

procedure TfrmLancDocCAPCAR.CdsDetAfterCancel(DataSet: TDataSet);
begin
  inherited;
  CalculaValorEdit;
end;

procedure TfrmLancDocCAPCAR.CalculaValorEdit;
Var
  rValorDet: Double;
begin
  inherited;
  CdsDet.DisableControls;
  Try
    rValorDet := 0;

    CdsDet.First;
    While not CdsDet.EOF Do
    begin
       rValorDet := rValorDet + CdsDet.FieldByName('VALOR').asFloat;
       CdsDet.Next;
    end;

    _ValorEdit := dbeValorCorrente.Value - rValorDet;
  finally
    CdsDet.EnableControls;
  end;
end;

function TfrmLancDocCAPCAR.ValidaOperacao: boolean;
begin
  Result := true;

  if ( not CdsLancamento.IsEmpty ) And
     ( tbcDetalhe.TabIndex = 2 ) And
     ( Cds.FieldByName('OPERACAO').asString <> CdsLancamento.FieldByName('OPERACAO').asString) then
  begin
     MsgDlg('Esta Contabilização não se refere ao lançamento do documento. Verifique na pasta "Lançamentos".', 'Atenção', mtInformation, [mbOk,mbHelp], 0);
     Result := false;
  end;

  if Result And
     ( CdsAtual <> nil ) And
     ( CdsAtual.State in [DsEdit, DsInsert] ) then Result := false;
end;

procedure TfrmLancDocCAPCAR.sbtnAlternarTipoDocClick(Sender: TObject);
begin
  SelDocs(-1); // Limpar a tela
  
  if (ParamIntegra.RecPag = 'P') then
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAR)
  else
    ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

  if (ParamIntegra.RecPag = 'P') then
  begin
    LblNumAp.Caption             := 'Nº da AP';
    lblTipoRD.Caption            := 'Tipo de Desembolso';
    CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Desembolso';
    CdsDet.FieldByName('NOME').DisplayLabel      := 'Atividade';
    Self.Caption                      := 'Manutenção de Documentos do Contas a Pagar';
    CmpForCli.Caption            := ' Favorecido ';
    CmpForCli.ForCli             := fcFornecedor;
    lblPortadorForma.Caption     := 'Contas/Caixas x Forma de Pag';
    lblNumChBordero.Caption      := 'No. Ch./Borderô';
    LblFormaPag.Caption          := 'Forma de Pagamento';
    LblSubContaCli.Caption       := 'Sub-Conta Fornecedor';
  end
  else
  begin
    LblNumAp.Caption             := 'Nº da GR';
    CdsDet.FieldByName('DESCRICAO').DisplayLabel := 'Recebimento';
    CdsDet.FieldByName('NOME').DisplayLabel      := 'Projeto';
    lblTipoRD.Caption            := 'Tipo de Recebimento';
    Self.Caption                      := 'Manutenção de Documentos do Contas a Receber';
    CmpForCli.Caption            := ' Cliente ';
    CmpForCli.ForCli             := fcCliente;
    lblPortadorForma.Caption     := 'Contas/Caixas x Tipo Cobr';
    lblNumChBordero.Caption      := 'No. Recebto.';
    LblFormaPag.Caption          := 'Tipos de Cobrança';
  end;

  CdsPortForma.Close;
  SqlPortForma.Prepare;
  SqlPortForma.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  SqlPortForma.ParamByName('RecPag').asString := ParamIntegra.RecPag;
  SqlPortForma.Open;

  CdsFormaPag.Close;
  SqlFormaPag.Prepare;
  SqlFormaPag.ParamByName('RecPag').asString := ParamIntegra.RecPag;
  SqlFormaPag.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  SqlFormaPag.OPen;

  MontaSelect.Filtro[15] := 'TIPODOCRECPAG.RecPag = '+QuotedStr(ParamIntegra.RecPag);
  MontaSelect.Filtro[11] := 'DOCUMENTO.IDMODULO   = '+IntToStr(Sistema.IdModulo);
  MontaSelect.Filtro[12] := 'DOCUMENTO.RecPag     = '+QuotedStr(ParamIntegra.RecPag);
  MontaSelect.Filtro[13] := 'DOCUMENTO.IDPESSOA   = '+IntToStr(Sistema.IdEmpresa);
  MontaSelect.Filtro[14] :=
    'TIPODOCRECPAG.CODTIPDOC In (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RecPag = '+
    QuotedStr(ParamIntegra.RecPag) + ' and not exists (select 1 from UsuarioxTpdocto b '+
    'where (RecPag = '+QuotedStr(ParamIntegra.RecPag)+') and (b.idusuario = ' +
    Inttostr(sistema.IdUsuario)+')) union SELECT CODTIPDOC FROM TIPODOCRECPAG a '+
    'WHERE (a.RecPag = ' +QuotedStr(ParamIntegra.RecPag)+ ') and exists (select 1 from '+
    'UsuarioxTpdocto b where (RecPag = '+QuotedStr(ParamIntegra.RecPag)+
    ') and (a.codtipdoc = b.codtipdoc) and (b.idusuario = ' + Inttostr(sistema.idusuario)+')))';

  sbtnAlternarTipoDoc.Down := false;
end;

function TfrmLancDocCAPCAR.StatusIsAtivo(IdPessoa, IdEmpresa: integer): boolean;
var
  sNome: string;
begin
  if (ParamIntegra.RecPag = 'P') then
  begin
    dmCds.qry.SQL.Text :=
      'SELECT FLGSTATUS'+CR_LF+
      'FROM   EMPRESAFORN'+CR_LF+
      'WHERE  (IDFORCLI = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '       (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')';
    sNome := 'Fornecedor\Favorecido';
  end
  else
  begin
    dmCds.qry.SQL.Text :=
      'SELECT FLGSTATUS'+CR_LF+
      'FROM   EMPRESACLIENTE'+CR_LF+
      'WHERE  (IDFORCLI = ' +FloatToStr(IdPessoa)+ ') AND'+CR_LF+
      '       (IDPESSOA = ' +IntToStr(IdEmpresa)+ ')';
    sNome := 'Cliente';
  end;
  dmCds.qry.Open;

  Result := (dmCds.qry.IsEmpty) or (dmCds.qry.Fields[0].asString <> 'I');

  if not(Result) then
    MsgDlg('Este ' +sNome+ ' está Inativo.'+#13+#10+
           'Não é permitido fazer movimentação para o mesmo.', 'Atenção', mtInformation, [mbOk], 0);
end;

end.
