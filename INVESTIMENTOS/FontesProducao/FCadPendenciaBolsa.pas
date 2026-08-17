//******************************************************************************
// Data      : 31/08/2007
// Código    : AL_12
// Pendencia :
// SOL       :
// Motivo    : Implementação do tratamento de maximizar a tela
//******************************************************************************
// Data      : 10/09/2007
// Código    : AL_11
// Pendencia : 26293
// SOL       : 68432
// Motivo    : Ajuste nos cálculos dos valores arredondados mostrados na tela
//               Os cálculos passam a ter o resultado truncado em duas casas.
//******************************************************************************
// Data      : 30/08/2007
// Código    : AL_10
// Pendencia : 26220
// SOL       : 67697
// Motivo    : Desfeita a implementação por solicitação do cliente.
//******************************************************************************
// Data      : 28/08/2007
// Código    : AL_9
// Pendencia : 26220
// SOL       : 67697
// Motivo    : Implementação da crítica da data pelo vencimento e não pela data
//               da operacao
//******************************************************************************
// Data      : 15/08/2007
// Código    : AL_8
// Pendencia : 26074
// SOL       : 66338
// Motivo    : Implementação da alteração do PU nas operações de Pendência
//******************************************************************************
// Data      : 14/08/2007
// Código    : AL_7
// Pendencia : 26098
// SOL       : 66441
// Motivo    : Implementação de crítica para não liquidar somente uma pendência
//******************************************************************************
// Data      : 21/05/2007
// Código    : AL_6
// Pendencia : 25354
// SOL       : 60201
// Motivo    : Implementação do plano/patrocinadora e dos filtros por plano
//******************************************************************************
// Data      : 11/05/2007
// Código    : AL_5
// Pendencia : 25330
// SOL       :
// Motivo    : Implementação do plano e nas querys que náo identifica o id da operacaoinvest
//******************************************************************************
// Data     : 17/11/2004
// Código   : AL_4
// Motivo   : Implementação da seleção de boleta na tela(QryBoleta,QryLiquidacao)
//******************************************************************************
// Data     : 17/11/2004
// Código   : AL_3
// Motivo   : Tratamento da mensagem que retorna da função
//******************************************************************************
// Data     : 28/05/2004
// Código   : AL_2
// Motivo   : Atualizar a qryBuscaBoleta todas as vezes que abrir a qryConsulta
//******************************************************************************
// Data     : 27/05/2004
// Código   : AL_1
// Motivo   : Controle de Exclusão de pendencia e data de liquidação original
//******************************************************************************

unit FCadPendenciaBolsa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, wwdbedit, Wwdbspin, ComCtrls, PpPrvDlg, PPforms, Menus,
  MontaSelect, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
  wwdblook;

type
  TfrmPendenciaBolsa = class(TfrmSairAjuda)
    Panel2: TPanel;
    Panel3: TPanel;
    DsConsulta: TwwDataSource;
    QryAux: TwwQuery;
    PnlDespesas: TPanel;
    Label5: TLabel;
    PnlTotLiquido: TPanel;
    Label6: TLabel;
    Panel4: TPanel;
    //AL_6
    UpdDespesas: TUpdateSQL;
    QryDespesasOperacao: TwwQuery;
    QryDespesasOperacaoIDDESPOPERINVEST: TFloatField;
    QryDespesasOperacaoIDOPERACAOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOINVEST: TFloatField;
    QryDespesasOperacaoIDTIPOOPERACAO: TFloatField;
    QryDespesasOperacaoIDTIPODESPINVEST: TFloatField;
    QryDespesasOperacaoDATAVENCDESPOPER: TDateTimeField;
    QryDespesasOperacaoIDREGRACALCUSADA: TFloatField;
    QryDespesasOperacaoIDREGRAVENCUSADA: TFloatField;
    QryDespesasOperacaoIDFORCLI: TFloatField;
    QryDespesasOperacaoVLRDESPOPER: TFloatField;
    QryDespesasOperacaoNUMDOCUMENTO: TStringField;
    QryDespesasOperacaoFLGCALCDIARIO: TStringField;
    QryDespesasOperacaoIDINVESTIMENTO: TFloatField;
    QryDespesasOperacaoIDCARTEIRAINVEST: TFloatField;
    QryDespesasOperacaoVLROPERACAO: TFloatField;
    QryDespesasOperacaoQTDEOPERACAO: TFloatField;
    QryDespesasOperacaoDESCTIPOOPERACAO: TStringField;
    QryDespesasOperacaoDESCINVESTIMENTO: TStringField;
    QryDespesasOperacaoNATUREZAOPERACAO: TStringField;
    QryDespesasOperacaoDATAOPERACAO: TDateTimeField;
    QryDespesasOperacaoMOECODIGO: TFloatField;
    QryDespesasOperacaoTIPOTITULO: TStringField;
    QryDespesasOperacaoNATOPERDESP: TStringField;
    DsDespesasOperacao: TwwDataSource;
    Panel6: TPanel;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    QryDespesasOperacaoIDLOTE: TStringField;
    PgCt: TPageControl;
    tbDet: TTabSheet;
    TbConsolidado: TTabSheet;
    GridDespesas: TDBGrid;
    grdConsolidado: TDBGrid;
    QryConsolidado: TwwQuery;
    QryConsolidadoDESCTIPODESPINV: TStringField;
    QryConsolidadoVLRDESPOPER: TFloatField;
    DtsConsolidado: TwwDataSource;
    TbObs: TTabSheet;
    mmoObs: TMemo;
    QryDespesasOperacaoNOME: TStringField;
    QryDespesasOperacaoDESCTIPODESPINV: TStringField;
    MSBuscaCredor: TMontaSelect;
    QryConsulta: TwwQuery;
    QryCorretagemDevol: TwwQuery;
    Panel8: TPanel;
    pnlCorretLiquida: TPanel;
    QryCorretValores: TwwQuery;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    DBGrid1: TwwDBGrid;
    updConsulta: TUpdateSQL;
    QryOperacaoPendente: TwwQuery;
    DsOperacaoPendente: TwwDataSource;
    UpdOperacaoPendente: TUpdateSQL;
    Panel7: TPanel;
    QryDelOperacaoPendente: TwwQuery;
    QryOperacaoInvest: TwwQuery;
    Panel9: TPanel;
    ProgressBar1: TProgressBar;
    QryInsOperacaoInvest: TwwQuery;
    QryBuscaTipoOper: TwwQuery;
    //AL_6
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    Toolbar971: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    BtOkDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    BtCancDet: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dblCorretora: TwwDBLookupCombo;
    dbDtaOperacao: TCMDateTimePicker;
    QryOperacaoPendenteIDOPERACAOINVEST: TFloatField;
    QryOperacaoPendenteQTDEPENDENTE: TFloatField;
    QryAltOperacaoPendente: TwwQuery;
    QryUpdOperacaoPendente: TwwQuery;
    QryHistCartInv: TwwQuery;
    //AL_6
    QryUpdOperacaoInvest_2: TwwQuery;
    dblLiquidacao: TwwDBLookupCombo;
    Label3: TLabel;
    QryLiquidacao: TwwQuery;
    QryLiquidacaoDATAVENCOPER: TDateTimeField;
    QryDelOperacaoInvestPend: TwwQuery;
    QryTestaMenorData: TwwQuery;
    DateTimeField1: TDateTimeField;
    QryTestaQtdZerada: TwwQuery;
    //AL_6
    QryLiquidacao1: TwwQuery;
    DateTimeField3: TDateTimeField;
    QryConsultaSGLBOLSAVALORES: TStringField;
    QryConsultaDATAOPERACAO: TDateTimeField;
    QryConsultaDATAVENCOPER: TDateTimeField;
    QryConsultaQTDEOPERACAO: TFloatField;
    QryConsultaIDOPERACAOINVEST: TFloatField;
    QryConsultaPRECOUNITOPERACAO: TFloatField;
    QryConsultaVLROPERACAO: TFloatField;
    QryConsultaTOTALDESPESAS: TFloatField;
    QryConsultaDESCMERCADO: TStringField;
    QryConsultaNOME: TStringField;
    QryConsultaDESCINVESTIMENTO: TStringField;
    QryConsultaDESCTIPOOPERACAO: TStringField;
    QryConsultaNUMDOCUMENTO: TStringField;
    QryConsultaNATUREZAOPERACAO: TStringField;
    QryConsultaIDTIPOOPERACAO: TFloatField;
    QryConsultaIDTIPOINVEST: TFloatField;
    QryConsultaIDTIPOOPERACAO_1: TFloatField;
    QryConsultaIDFORCLI: TFloatField;
    QryConsultaIDCARTEIRAINVEST: TFloatField;
    QryConsultaCODTIPOACAO: TStringField;
    QryConsultaMOECODIGO: TFloatField;
    QryConsultaIDINVESTIMENTO: TFloatField;
    QryConsultaIDLOTE: TStringField;
    QryConsultaIDCORRETVALORES: TFloatField;
    QryConsultaQTDELOTE: TFloatField;
    QryConsultaEMPRESAPROP: TFloatField;
    QryConsultaIDOPERACAOORIGEM: TFloatField;
    QryConsultaRECPAGBOL: TStringField;
    QryInsOperacaoPendente: TwwQuery;
    QryBuscaUltDtaOperInv: TwwQuery;
    QryVerOperInvPendente: TwwQuery;
    QryVerDtaVenc: TwwQuery;
    QryBuscaInvestimento: TwwQuery;
    //AL_6
    QryInsertOprAcao: TwwQuery;
    QryConsultaIDCUSTODIANTE: TFloatField;
    QryConsultaIDMODULO: TFloatField;
    QryConsultaPLNCODIGO: TFloatField;
    QryConsultaCODDOCUMENTO: TFloatField;
    QryConsultaIDHISTCARTINV: TFloatField;
    QryBuscaPlanilhaOrigem: TwwQuery;
    QryConsultaPLANO: TFloatField;
    QryConsultaCODFINANCEIRO: TFloatField;
    Panel5: TPanel;
    QryUpdParaminvest: TwwQuery;
    StringField1: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    DateTimeField4: TDateTimeField;
    StringField2: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField5: TStringField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    QryConsultaIDPLANPREVCTBPATR: TFloatField;
    qryAtualizaBoleta: TwwQuery;
    qryBuscaBoleta: TwwQuery;
    qryAtuFinContOperPend: TwwQuery;
    //AL_6
    QryBoleta: TwwQuery;
    QryBoletaIDBOLETA: TStringField;
    //AL_6
    dblkBoleta: TwwDBLookupCombo;
    lblBoleta: TLabel;
    //AL_6
    dblkPlanPatro: TwwDBLookupCombo;
    lblPlanoPatroOrigem: TLabel;
    qryPlanoPatro: TwwQuery;
    qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPatroIDPLANOPREV: TFloatField;
    qryPlanoPatroIDPATRO: TFloatField;
    qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
    QryBuscaDespesa: TwwQuery;
    QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    QryBuscaDespesaMOECODIGO: TFloatField;
    QryBuscaDespesaDESCTIPODESPINV: TStringField;
    QryBuscaDespesaNATUREZAOPERACAO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryConsultaAfterOpen(DataSet: TDataSet);
    procedure QryDespesasOperacaoUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryDespesasOperacaoAfterOpen(DataSet: TDataSet);
    procedure GridDespesasColExit(Sender: TObject);
    procedure QryDespesasOperacaoAfterPost(DataSet: TDataSet);
    procedure GridDespesasExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure QryDespesasOperacaoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure PnlDadosDespesaExit(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure QryConsultaBeforePost(DataSet: TDataSet);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure PgCtChange(Sender: TObject);
    procedure QryConsultaVLROPERACAOValidate(Sender: TField);
    procedure dbDtaOperacaoExit(Sender: TObject);
    //AL_6
    procedure dblkPlanPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkPlanPatroExit(Sender: TObject);
    procedure dblkPlanPatroEnter(Sender: TObject);
    procedure dblCorretoraCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblCorretoraEnter(Sender: TObject);
    procedure dblCorretoraExit(Sender: TObject);
    procedure dblkBoletaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkBoletaEnter(Sender: TObject);
    procedure dblkBoletaExit(Sender: TObject);
    procedure dblLiquidacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblLiquidacaoEnter(Sender: TObject);
    procedure dblLiquidacaoExit(Sender: TObject);
  private

     //AL_6
     bModif  : Boolean;
     wValAnt : String;

     procedure AbreQry;
     Procedure Contabiliza;
     //AL_6
     procedure AbreQryLiq;
     procedure TotalLiquidoDespesa;
     procedure AbreQryConsLiq;
     //AL_6
     procedure DeletaQtdZeradas;
     procedure GuardaVariaveis;
     procedure OrdenaQryConsulta(wTotalLiquido : Double);

     function FinanceiroAtual(sTipo: String = 'O'): Boolean;
     function FinanceiroPendencia: Boolean;

     function  OperacaoNormal      : Boolean;
     function  ExcluirPendencia    : Boolean;
     function  ExcluirLiqPendencia : Boolean;
     function  GravaOperNormal     : Boolean;
     function  GravaOperPendente   : Boolean;
     function  VerColunaAlterada   : Boolean;
     function  VerificaQtde        : Boolean;
     function  GravaOperPendenteLiquidada : Boolean;
     function  TestaExisteIDOperPendente  : Boolean;
     function  TestaMenorData(dData, dDataVenc : TDateTime)  : Boolean;

     function  CorretagemLiquida   : Double;
     function  ApuraValorLiquido   : Double;

     function  Natureza(IDORIGEM : Integer) : String;

     function  BuscaPlanilhaOrigem(Var Plano : Integer) : Integer;

     function  TestaOperacaoLiquida : Boolean;

     function  BuscaPendencia(iTipo: Byte; bRefaz: Boolean): Boolean;

    { Private declarations }
  public
    { Public declarations }
     dData        : TDateTime;
  end;

var frmPendenciaBolsa: TfrmPendenciaBolsa;

  Const
    wMensagem: Array[-9..0] Of String =
           (' ',
            ' ',
            'Não foi possível efetuar o lançamento de CAP/CAR.',
            'Não foi possível efetuar o lançamento contábil.',
            'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
            'Ocorreu um problema de gravação.',
            'Ambigüidade no Padrão de Lançamento.',
            'Operação com valor igual a "ZERO".',
            'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
            'Lançamento(s) realizados com sucesso.');

implementation

{$R *.DFM}

Uses FDmRelatorios, USistema, UOperacaoInvest, UOperComum, DOpercomum, UBibliotecaInvest,
     UFuncoesRendaFixa, DBasedados, UMensErro, UDataBase, UDiasUteisInv,
     FPrincipal;

Var wTotalLiquido, wTotalDespesa : Double;
    bAlteraPendencia, bTestaPendencia, bOK, bTrocaLine : Boolean;
    sTipoOperacao : String; //P -> Pendencia, N -> Normal, L -> Liquidação
    iAlteracao    : Integer;
    bTrue         : Boolean;
    iIDCORRETVALORES, iMOECODIGO, iIDCARTEIRAINVEST, iIDINVESTIMENTO, iIDTIPOINVEST,
    iIDTIPOOPERLIQPEND, iIDFORCLI, iIDOPERACAOORIGEM, wiPlanilhaContabil,
    wDocumContAC, wPlanoContabil : Integer;
    fQTDEOPERACAO, fPRECOUNITOPERACAO, fVLROPERACAO : Double;
    dDataVencMenor, dDATAVENCOPER, dDATAOPERACAO : TDateTime;
    sNUMDOCUMENTO, sIDLOTE : String;

procedure TfrmPendenciaBolsa.FormShow(Sender: TObject);
begin
 // inherited;
  bOk := False;
  iAlteracao         := 0;
  bTrocaLine         := True;
  DBGrid1.Font.Color := clGray;
  If dData = 0 Then
     dbDtaOperacao.Date := Date
  Else
     dbDtaOperacao.Date := dData;

  //AL_6 - Ini
  OperComum.LimpaParametros(qryPlanoPatro);
  qryPlanoPatro.Open;

  OperComum.LimpaParametros(QryCorretValores);
  QryCorretValores.Open;

  //AL_4
  OperComum.LimpaParametros(QryBoleta);
  QryBoleta.Open;

  OperComum.LimpaParametros(QryLiquidacao);
  QryLiquidacao.Open;
  //AL_4 - Fim

  If (PgCt.ActivePage <> TbConsolidado) Then
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';

  OperComum.LimpaParametros(QryDespesasOperacao);
  QryDespesasOperacao.Open;
  //AL_6 - Fim

  PgCt.ActivePage         := TbDet;
  GridDespesas.Visible    := True;
  bbtnConfirmar.Enabled   := False;
  bbtnCancelar.Enabled    := False;
  dbDtaOperacao.SetFocus;
end;

procedure TfrmPendenciaBolsa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  //AL_6 - Ini
  OperComum.LimpaParametros(qryPlanoPatro);
  OperComum.LimpaParametros(QryBoleta);
  OperComum.LimpaParametros(QryCorretValores);
  OperComum.LimpaParametros(QryConsulta);
  OperComum.LimpaParametros(QryOperacaoPendente);
  OperComum.LimpaParametros(QryConsolidado);
  OperComum.LimpaParametros(QryDespesasOperacao);
  OperComum.LimpaParametros(QryLiquidacao);
  OperComum.LimpaParametros(QryLiquidacao1);
  OperComum.LimpaParametros(qryAtualizaBoleta);
  OperComum.LimpaParametros(QryBuscaTipoOper);
  OperComum.LimpaParametros(QryHistCartInv);
  OperComum.LimpaParametros(qryBuscaBoleta);
  OperComum.LimpaParametros(QryTestaQtdZerada);
  OperComum.LimpaParametros(QryBuscaInvestimento);
  OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
  OperComum.LimpaParametros(QryVerDtaVenc);
  OperComum.LimpaParametros(QryTestaMenorData);
  OperComum.LimpaParametros(QryBuscaPlanilhaOrigem);
  OperComum.LimpaParametros(QryCorretagemDevol);
  OperComum.LimpaParametros(QryOperacaoInvest);
  OperComum.LimpaParametros(QryVerOperInvPendente);
  //AL_6 - Fim
  if DtmBaseDados.dbBaseDados.InTransaction then
     DtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmPendenciaBolsa.QryConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if QryConsulta.IsEmpty then
  begin
     BtAltDet.Enabled         := False;
     BtDelDet.Enabled         := False;
  end
  else
  begin
     //Al_2
     OperComum.LimpaParametros(qryBuscaBoleta);
     qryBuscaBoleta.ParamByName('IDBOLETA').AsString := QryConsultaNUMDOCUMENTO.AsString;
     qryBuscaBoleta.Open;

     BtAltDet.Enabled           := True;

     if Trim(dblLiquidacao.Text) = '' then
     begin
        if (QryLiquidacao.RecordCount > 1) or (QryLiquidacao.RecordCount = 0) then
        begin
           BtDelDet.Enabled     := False;
           if (QryLiquidacao.RecordCount = 0) then
               BtAltDet.Enabled := True;
        end
        else
           BtDelDet.Enabled     := True;
     end
     else
        BtDelDet.Enabled        := True;
  end;
end;

procedure TfrmPendenciaBolsa.QryDespesasOperacaoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  inherited;
  If UpdateKind    = ukInsert Then Begin
     UpdateAction := uaSkip;
  End;
end;

procedure TfrmPendenciaBolsa.bbtnCancelarClick(Sender: TObject);
begin
  bOK        := False;
  bTrocaLine := True;
// Confirma Cancelamento
  If (MsgDlg('Deseja realmente cancelar esta operação ?',
    'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then
     Exit;

// Caso Esteja em uma Transacao Cancela a Mesma
  If DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.Rollback;

  If dblLiquidacao.Text <> '' Then
  Begin
     AbreQryConsLiq;
     BtAltDet.Enabled := False;
     sTipoOperacao    := 'L';
  End
  Else
  Begin
     AbreQry;
     bAlteraPendencia := True;
  End;

  TotalLiquidoDespesa;

  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  DBGrid1.Options       := DBGrid1.Options - [TwwDBgridOption(dgEditing)];
  DBGrid1.Font.Color    := clGray;
  DBGrid1.Color         := clSilver;

  //AL_6
  QryConsultaQTDEOPERACAO.DisplayFormat := '###,###,###,###,###';
  QryConsultaVLROPERACAO.DisplayFormat  := '###,###,###,###0.00';
  PgCt.Enabled          := True;
  BtAltDet.Enabled      := True;
  BtOkDet.Enabled       := False;
  BtCancDet.Enabled     := False;
  BtVoltaDet.Enabled    := False;
  Label2.Enabled        := True;
  dbDtaOperacao.Enabled := True;
  Label1.Enabled        := True;
  dblCorretora.Enabled  := True;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  Label3.Enabled        := True;
  dblLiquidacao.Enabled := True;
  lblPlanoPatroOrigem.Enabled := True;
  dblkPlanPatro.Enabled := True;
  lblBoleta.Enabled     := True;
  dblkBoleta.Enabled    := True;
end;

procedure TfrmPendenciaBolsa.bbtnConfirmarClick(Sender: TObject);
Var QtdOld, QtdNew  : Double;
    dDataLiq: TDateTime;
begin
  inherited;
  If Not bOK Then
  Begin
     MsgDlg('Falta confirmar a Operação.             ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Exit;
  End;

  If Trim(dblCorretora.Text) = '' Then
  Begin
     MsgDlg('Selecionar a Corretora.                 ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Exit;
  End;

  If Trim(dblkBoleta.Text) = '' Then
  Begin
     MsgDlg('Selecionar a Boleta.                    ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Exit;
  End;

  //AL_7 
  try
     QryConsulta.DisableControls;
     QryConsulta.First;
     dDataLiq := 0;
     while not QryConsulta.Eof do
     begin
        If (sTipoOperacao <> 'N') Then
        Begin
           // Verifica se a operação teve sua data de liquidação alterada (Se foi gerada uma Pendência)
           if (QryConsulta.FieldByName('DATAVENCOPER').AsDateTime <=
               QryConsulta.FieldByName('DATAVENCOPER').OldValue) then
           Begin
              MsgDlg('A Data de Liquidação da Pendência deve ser Superior a da Operação Atual.',
                     'Mensagem do Sistema ',mtWarning,[mbOK],0);
              Exit;
           End
           else
           begin
              // Se a data foi alterada (Pendência) e é Maior que a anterior
              // Capta data de Liquidação da primeira operação alterada e testa para ver se todas são iguais
              if dDataLiq = 0 then
                 dDataLiq := QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;

              if dDataLiq <> QryConsulta.FieldByName('DATAVENCOPER').AsDateTime then
              begin
                 MsgDlg('Existem diferentes datas de liquidação para esta boleta.',
                        'Mensagem do Sistema ',mtWarning,[mbOK],0);
                 Exit;
              end;
           end;
        End;

        QtdOld := QryConsulta.FieldByName('QTDEOPERACAO').OldValue;
        QtdNew := QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
        If ((QtdOld - QtdNew) = 0) Then
        Begin
          //AL_6
          OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
          QryBuscaUltDtaOperInv.ParamByName('DATAOPERACAO').AsdateTime     := StrToDate(dbDtaOperacao.Text);
          QryBuscaUltDtaOperInv.ParamByName('IDCORRETVALORES').AsInteger   := QryCorretValoresIDCORRETVALORES.AsInteger;
          //AL_5
          QryBuscaUltDtaOperInv.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
          QryBuscaUltDtaOperInv.ParamByName('NUMDOCUMENTO').AsString       := dblkBoleta.Text; //Renan Cristiano Sol 135526 Kintana 806425
          QryBuscaUltDtaOperInv.Open;
          If (Not QryLiquidacao.Eof) And
             (QryConsulta.FieldByName('DATAVENCOPER').AsDateTime <=
              QryBuscaUltDtaOperInv.FieldByName('DATAVENCOPER').AsDateTime) Then
          Begin
            MsgDlg('Data de Liquidação menor que a última data de Pendência Liquidada.',
                   'Mensagem do Sistema ',mtWarning,[mbOK],0);
            OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
            Exit;
          End;
          OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
        End;

        QryConsulta.Next;
     end;
  finally
     QryConsulta.EnableControls;
  end;

  If (sTipoOperacao = 'N') Then
  Begin
     // Primeira operação - Define as pendências (Tem que alterar somente as operações p/ pendência)
     If Not GravaOperNormal Then
     Begin
        MsgDlg('Não foi possível realizar a Operação.',
               'Mensagem do Sistema ',mtWarning,[mbOK],0);
        Exit;
     End;
  End
  Else If sTipoOperacao = 'P' Then
  Begin
     // Operação Pendente - Tem que alterar a data de todas as operações
     If Not GravaOperPendente Then
     Begin
        MsgDlg('Não foi possível realizar a Operação.',
               'Mensagem do Sistema ',mtWarning,[mbOK],0);
        Exit;
     End;
  End
  Else If sTipoOperacao = 'L' Then
  Begin
     // Operação de Liquidação - Não precisa alterar nada, liquida todas as pendências
     If Not GravaOperPendenteLiquidada Then
     Begin
        MsgDlg('Não foi possível realizar a Operação de Liquidação Total da Pendência.',
               'Mensagem do Sistema ',mtWarning,[mbOK],0);
        Exit;
     End;
  End;

  BtDelDet.Enabled      := True;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
  DBGrid1.Options       := DBGrid1.Options - [TwwDBgridOption(dgEditing)];
  DBGrid1.Color         := clSilver;
  DBGrid1.Font.Color    := clGray;

  If sTipoOperacao = 'N' Then
     AbreQry
  Else
  Begin
     If bTestaPendencia Then
     Begin
        AbreQryLiq;
     End
     Else
        AbreQry;
  End;
  //AL_6
  OperComum.LimpaParametros(QryLiquidacao);
  QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger := StrToInt(dblCorretora.LookupValue);
  QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
  QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;
  //AL_5
  QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
  QryLiquidacao.Open;

  TotalLiquidoDespesa;
  dblLiquidacao.Text := '';
  bTestaPendencia    := True;

  MsgDlg('Operação Concluída! ', 'Mensagem do Sistema', mtInformation, [mbOk],0);

end;

procedure TfrmPendenciaBolsa.QryDespesasOperacaoAfterOpen(DataSet: TDataSet);
begin
  inherited;
// Habilita ou Inabilita o Grid de Despesas
   GridDespesas.Enabled := Not QryDespesasOperacao.IsEmpty;
  If sTipoOperacao    <> 'P' Then
  Begin
     If (PgCt.ActivePage <> TbConsolidado) Then
        pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
  End;
end;

procedure TfrmPendenciaBolsa.GridDespesasColExit(Sender: TObject);
Var
  wIdOperacao, wIdDespesa : Integer;
begin
  inherited;
  If     (Sender.ClassType = TDbGrid) And
     ( ( (Sender As TDbGrid).SelectedField.FieldName = 'VLRDESPOPER'     ) Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DATAVENCDESPOPER') Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DESCCRED'        ) ) And
         (QryDespesasOperacao.State In [DsEdit]) Then
  Begin
// Guarda Despesas
     If Not QryDespesasOperacao.IsEmpty Then
     Begin
        Try
           QryDespesasOperacao.ApplyUpdates;
           QryDespesasOperacao.CommitUpdates;
        Except
          Raise;
        End;
     End;
  End;
end;

procedure TfrmPendenciaBolsa.QryDespesasOperacaoAfterPost(DataSet: TDataSet);
Var
  wIdOperacao, wIdDespesa:Integer;
begin
  inherited;

  If (Not TestaValor(DataSet.FieldByName('VLRDESPOPER').OldValue-
                     DataSet.FieldByName('VLRDESPOPER').AsFloat) )  Then
  Begin
    MsgDlg('Alteração maior do que a permitida','Mensagem do Sistema',
           MtWarning,[MbOk],0);
    QryDespesasOperacao.CancelUpdates;
    QryDespesasOperacao.CommitUpdates;
    Exit;
  End;

  QryDespesasOperacao.ApplyUpdates;
  QryDespesasOperacao.CommitUpdates;

// Fecha e Abre a Query de Operacoes
  QryConsulta.Close;
  QryConsulta.Open;

  If (PgCt.ActivePage <> TbConsolidado) Then
     pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';

  //AL_6  
  OperComum.LimpaParametros(QryConsolidado);
  QryConsolidado.ParamByName('NUMDOC').AsString :=
                 QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
  QryConsolidado.Open;
end;

procedure TfrmPendenciaBolsa.GridDespesasExit(Sender: TObject);
begin
  inherited;
  If     (Sender.ClassType = TDbGrid) And
     ( ( (Sender As TDbGrid).SelectedField.FieldName = 'VLRDESPOPER'     ) Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DATAVENCDESPOPER') Or
       ( (Sender As TDbGrid).SelectedField.FieldName = 'DESCCRED'        ) ) And
         (QryDespesasOperacao.State In [DsEdit]) Then
  Begin
// Guarda Despesas
     If Not QryDespesasOperacao.IsEmpty Then
     Begin
        Try
           QryDespesasOperacao.ApplyUpdates;
           QryDespesasOperacao.CommitUpdates;
        Except
           Raise;
        End;
     End;
  End;
end;

procedure TfrmPendenciaBolsa.bbtnSairClick(Sender: TObject);
begin
// Caso esteja em transacao mostra mensagem informando
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
     If (MsgDlg('As alterações não foram confirmadas. Deseja Sair ?',
                'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
         DtmBaseDados.dbBaseDados.Rollback
     Else
       Exit;
  End;

  inherited;
end;

procedure TfrmPendenciaBolsa.QryDespesasOperacaoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QryDespesasOperacao.CancelUpdates;
  QryDespesasOperacao.CommitUpdates;
end;

procedure TfrmPendenciaBolsa.FormCreate(Sender: TObject);
begin
  inherited;

   PnlFundo.Enabled := True;
   //AL_12
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmPendenciaBolsa.Alterar1Click(Sender: TObject);
begin
  inherited;

// Muda a Tela
  GridDespesas.Visible    := False;  
// Muda a Qry para modo de alteracao
  QryDespesasOperacao.Edit;  
end;

procedure TfrmPendenciaBolsa.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
// Cancela as Alteracoes
  QryDespesasOperacao.Cancel;
  QryDespesasOperacao.CancelUpdates;
// Muda a Tela
  GridDespesas.Visible    := True;
end;

procedure TfrmPendenciaBolsa.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
// Confirma as Alteracoes
  QryDespesasOperacao.Post;
  QryDespesasOperacao.ApplyUpdates;
  QryDespesasOperacao.CommitUpdates;

// Muda a Tela
  GridDespesas.Visible    := True;
end;

procedure TfrmPendenciaBolsa.SB1Click(Sender: TObject);
begin
  inherited;
// Executa a Pesquisa
  MSBuscaCredor.Executar;
// Teste de Retorno
  If MSBuscaCredor.RetornouValor Then Begin
// Preenche os Dados
    QryDespesasOperacao.FieldByName('IDFORCLI').AsString := MSBuscaCredor.ValoresChave[0];

  End;
end;

procedure TfrmPendenciaBolsa.PnlDadosDespesaExit(Sender: TObject);
begin
  inherited;
   If QryDespesasOperacao.State in [DsEdit] Then
      bbtnCancelarDetClick(Self);
end;

function TfrmPendenciaBolsa.CorretagemLiquida : Double   ;
begin
   Result := 0;
   //AL_6  
   OperComum.LimpaParametros(QryCorretagemDevol);
   QryCorretagemDevol.ParamByName('IDOPERACAOINVEST').AsInteger :=
                      QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryCorretagemDevol.Open;
   While Not QryCorretagemDevol.EOF Do
   Begin
      Result := Result + QryCorretagemDevol.Fieldbyname('VLRDESPOPER').AsFloat;
      QryCorretagemDevol.Next;
   End;
end;

procedure TfrmPendenciaBolsa.AbreQry;
Begin
   //AL_6
   OperComum.LimpaParametros(QryConsulta);
   With QryConsulta Do
   Begin
      Sql.Clear;
      Sql.Add('SELECT                                                                   ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
      Sql.Add('      OP.QTDEPENDENTE AS QTDEOPERACAO, OI.IDOPERACAOINVEST,              ');
      Sql.Add('      OI.PRECOUNITOPERACAO, AB.QTDELOTE, OI.IDMODULO,                    ');
      Sql.Add('  ROUND(((OP.QTDEPENDENTE/NVL(AB.QTDELOTE,1))*OI.PRECOUNITOPERACAO)-0.0049,2) AS VLROPERACAO, ');
      Sql.Add('      0 AS TOTALDESPESAS, OI.IDCUSTODIANTE,                              ');
      Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                        ');
      Sql.Add('      PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,12) AS DESCINVESTIMENTO,     ');
      Sql.Add('      SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,                ');
      Sql.Add('      TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST,           ');
      Sql.Add('      OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,               ');
      Sql.Add('      AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOTE,        ');
      Sql.Add('      OI.IDCORRETVALORES, OI.EMPRESAPROP, OI.IDOPERACAOORIGEM,           ');
      SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',                          ');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',                       ');
      SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',                    ');
      SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',                 ');
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL,');
      SQL.Add('      HC.PLNCODIGO, OI.CODDOCUMENTO, HC.IDHISTCARTINV, HC.PLANO,         ');
      SQL.Add('      OI.CODFINANCEIRO, OI.IDPLANPREVCTBPATR                             ');
      Sql.Add('FROM PESSOA PS, OPERACAOPENDENTE OP, ACOESXBOLSA AB,               ');
      Sql.Add('     OPERACAOINVEST OI, OPRACAO OA, BOLSAVALORES BV,   ');
      Sql.Add('     INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,  ');
      Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
      Sql.Add('	     FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI                   ');
      Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND             ');
      Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')                   ');
      Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS, HISTCARTINV HC                  ');
      Sql.Add('WHERE (OI.IDCARTEIRAGERENC IS NULL)                               AND    ');

      //AL_6
      If Trim(dblkPlanPatro.Text) <> '' Then
         Sql.Add('   (OI.IDPLANPREVCTBPATR  = '+
                   qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')    AND    ')
      Else
         Sql.Add('   (OI.IDPLANPREVCTBPATR  > 0)                                 AND    ');

      If Trim(dblCorretora.Text) <> '' Then
         Sql.Add('   (OI.IDCORRETVALORES  = '+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+')    AND    ')
      Else
         Sql.Add('   (IDCORRETVALORES  > 0)                                      AND    ');
      //AL_6
      //AL_4
      Sql.Add('   (OI.NUMDOCUMENTO     = '''+QryBoleta.FieldByName('IDBOLETA').AsString+''') AND ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('   (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('   (OI.DATAOPERACAO IS NULL)                                   AND    ');
      Sql.Add('      (OP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)    AND                 ');
      Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND                 ');
      Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND                 ');
      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	    AND                 ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	    AND                 ');
      Sql.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO)      AND                 ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	    AND                 ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND                 ');
      Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)              AND                 ');
      Sql.Add('      (AB.IDACAO           = AC.IDACAO)              AND                 ');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)      AND                 ');
      Sql.Add('      (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)    AND                 ');
      Sql.Add('      (HC.TIPMOVCARTINV    = ''OPE'')                AND                 ');
      Sql.Add('      (OP.QTDEPENDENTE > 0)                                              ');
      Sql.Add('      ORDER BY IV.DESCINVESTIMENTO,SIGLATIPOOPER,OI.PRECOUNITOPERACAO    ');
      Open;
      DBGrid1.FixedCols        := 4; 
      Panel6.Caption           := 'Operações de Pendência';
      sTipoOperacao            := 'P';
      pnlCorretLiquida.Caption := '0,00';
      //AL_6
      QryConsultaTOTALDESPESAS.Visible := False;

      If (IsEmpty) And (Trim(dblCorretora.Text) <> '') Then
      Begin
         //AL_6
         OperComum.LimpaParametros(QryConsulta);
         Sql.Clear;
         Sql.Add('SELECT                                                                   ');
         Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
         Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, QTDELOTE, OI.IDMODULO,       ');
         Sql.Add('      OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO,2) AS VLROPERACAO, DS.TOTALDESPESAS, ');
         Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, OI.IDCUSTODIANTE,      ');
         Sql.Add('      PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,12) AS DESCINVESTIMENTO,     ');
         Sql.Add('      SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,                ');
         Sql.Add('      TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST,           ');
         Sql.Add('      OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,               ');
         Sql.Add('      AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOTE,        ');
         Sql.Add('      OI.IDCORRETVALORES, AB.QTDELOTE, OI.EMPRESAPROP, OI.IDOPERACAOORIGEM, ');
         SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',                          ');
         SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',                       ');
         SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',                    ');
         SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',                 ');
         SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL,');
         SQL.Add('      HC.PLNCODIGO, OI.CODDOCUMENTO, HC.IDHISTCARTINV, HC.PLANO,         ');
         SQL.Add('      OI.CODFINANCEIRO, OI.IDPLANPREVCTBPATR                             ');
         Sql.Add('FROM PESSOA PS, OPERACAOINVEST OI, OPRACAO OA, BOLSAVALORES BV,    ');
         Sql.Add('     INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,  ');
         Sql.Add('     ACOESXBOLSA AB,                                                  ');
         Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
         Sql.Add('	     FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI              ');
         Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND        ');
         Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')              ');
         Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS, HISTCARTINV HC             ');
         Sql.Add('WHERE (OI.IDCARTEIRAGERENC IS NULL)                               AND ');

         //AL_6
         If Trim(dblkPlanPatro.Text) <> '' Then
            Sql.Add('   (OI.IDPLANPREVCTBPATR  = '+
                      qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')    AND    ')
         Else
            Sql.Add('   (OI.IDPLANPREVCTBPATR  > 0)                                 AND    ');

         If Trim(dblCorretora.Text) <> '' Then
            Sql.Add('   (OI.IDCORRETVALORES  ='+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+')       AND ')
         Else
            Sql.Add('   (OI.IDCORRETVALORES > 0)                                    AND ');
         //AL_6
         //AL_4
         Sql.Add('   (OI.NUMDOCUMENTO     = '''+QryBoleta.FieldByName('IDBOLETA').AsString+''') AND ');

         If dbDtaOperacao.Text <> '' Then
            Sql.Add('   (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
         Else
            Sql.Add('   (NOT OI.DATAOPERACAO IS NULL)                               AND ');

         Sql.Add('      (OI.FLGSTATUSFECHBOL = ''F'')                               AND ');
         Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)                 AND ');
         Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+))              AND ');
         Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	                    AND ');
         Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	            AND ');
         Sql.Add('      (OA.IDACAO 	     = IV.IDINVESTIMENTO)                   AND ');
         Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	                    AND ');
         Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)                   AND ');
         Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)                           AND ');
         Sql.Add('      (AB.IDACAO           = AC.IDACAO)                           AND ');
         Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                   AND ');
         Sql.Add('      (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                 AND ');
         Sql.Add('      (HC.TIPMOVCARTINV    = ''OPE'')                                    ');
         Sql.Add('      ORDER BY IV.DESCINVESTIMENTO,SIGLATIPOOPER,OI.PRECOUNITOPERACAO    ');
         Open;
         //AL_6
         QryDespesasOperacao.Close;
         QryDespesasOperacao.Open;
         //AL_6
         OperComum.LimpaParametros(QryConsolidado);
         QryConsolidado.ParamByName('NUMDOC').AsString :=
                  QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
         QryConsolidado.Open;

         QryDespesasOperacao.DataSource := DsConsulta;

         Panel6.Caption      := 'Operações';
         sTipoOperacao       := 'N';
         DBGrid1.FixedCols   := 5;
         QryConsultaTOTALDESPESAS.Visible := True;
      End;
   End;
   If sTipoOperacao    <> 'P' Then
   Begin
      If (PgCt.ActivePage <> TbConsolidado) Then
          pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
   End;

   If (BtDelDet.Enabled) Then
   Begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   End;
   //AL_8 - Permite alterar o PU da operação
   QryConsulta.FieldByName('TOTALDESPESAS').ReadOnly     := True;

   //AL_6
   OperComum.LimpaParametros(QryOperacaoPendente);
   QryOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                       QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryOperacaoPendente.Open;

End;

procedure TfrmPendenciaBolsa.AbreQryLiq;
Begin
   With QryConsulta Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT                                                                   ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
      Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, QTDELOTE, OI.IDMODULO,       ');
      Sql.Add('      OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO,2) AS VLROPERACAO, DS.TOTALDESPESAS,    ');
      Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO, OI.IDCUSTODIANTE,      ');
      Sql.Add('      PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,12) AS DESCINVESTIMENTO,     ');
      Sql.Add('      SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,                ');
      Sql.Add('      TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST,           ');
      Sql.Add('      OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,               ');
      Sql.Add('      AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOTE,        ');
      Sql.Add('      OI.IDCORRETVALORES, AB.QTDELOTE, OI.EMPRESAPROP, OI.IDOPERACAOORIGEM, ');
      SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',                          ');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',                       ');
      SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',                    ');
      SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',                 ');
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL,');
      SQL.Add('      HC.PLNCODIGO, OI.CODDOCUMENTO, HC.IDHISTCARTINV, HC.PLANO,         ');
      SQL.Add('      OI.CODFINANCEIRO, OI.IDPLANPREVCTBPATR                             ');
      Sql.Add('FROM OPERACAOINVEST OI, OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,   ');
      Sql.Add('     INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,  ');
      Sql.Add('     ACOESXBOLSA AB, OPERACAOPENDENTE  OP,                            ');
      Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
      Sql.Add('	     FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI                   ');
      Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND             ');
      Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')                   ');
      Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS, HISTCARTINV HC                  ');
      Sql.Add('WHERE (OI.IDCARTEIRAGERENC IS NULL)                                  AND ');

      //AL_6
      If Trim(dblkPlanPatro.Text) <> '' Then
         Sql.Add('   (OI.IDPLANPREVCTBPATR  = '+
                   qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')       AND ')
      Else
         Sql.Add('   (OI.IDPLANPREVCTBPATR  > 0)                                    AND ');

      If Not QryCorretValores.FieldByName('IDCORRETVALORES').IsNull Then
         Sql.Add('   (OI.IDCORRETVALORES  = '+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+')       AND ')
      Else
         Sql.Add('   (OI.IDCORRETVALORES > 0)                                       AND ');
      //AL_6
      //AL_4
      Sql.Add('   (OI.NUMDOCUMENTO     = '''+QryBoleta.FieldByName('IDBOLETA').AsString+''') AND ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('   (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('   (NOT OI.DATAOPERACAO IS NULL)                                  AND ');
      Sql.Add('      (OP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST(+))                 AND ');
      Sql.Add('      (OP.QTDEPENDENTE     > 0                     )                 AND ');
      Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)                    AND ');
      Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+))                 AND ');
      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	                    AND ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	                    AND ');
      Sql.Add('      (OA.IDACAO           = IV.IDINVESTIMENTO)                      AND ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	                    AND ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)                      AND ');
      Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)                              AND ');
      Sql.Add('      (AB.IDACAO           = AC.IDACAO)                              AND ');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                      AND ');
      Sql.Add('      (OI.IDOPERACAOORIGEM IS NOT NULL)                              AND ');
      Sql.Add('      (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                    AND ');
      Sql.Add('      (HC.TIPMOVCARTINV    = ''OPE'')                                    ');
      Sql.Add('      ORDER BY IV.DESCINVESTIMENTO,SIGLATIPOOPER,OI.PRECOUNITOPERACAO    ');
      Open;
      Panel6.Caption      := 'Operações';
      sTipoOperacao       := 'N';
      DBGrid1.FixedCols   := 5; 
   End;
   //AL_8 - Permite alterar o PU da operação
   QryConsulta.FieldByName('TOTALDESPESAS').ReadOnly     := True;
   QryConsultaTOTALDESPESAS.Visible := True;
End;


procedure TfrmPendenciaBolsa.BtAltDetClick(Sender: TObject);
var
   DataVenc : TDateTime;
   iOper    : Integer;
begin
   Panel7.Caption        := '';
   bOK                   := False;
   PgCt.Enabled          := False;
   Label2.Enabled        := False;
   dbDtaOperacao.Enabled := False;
   Label1.Enabled        := False;
   dblCorretora.Enabled  := False;
   Label3.Enabled        := False;
   dblLiquidacao.Enabled := False;
   //AL_6
   lblPlanoPatroOrigem.Enabled := False;
   dblkPlanPatro.Enabled := False;
   lblBoleta.Enabled     := False;
   dblkBoleta.Enabled    := False;

   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

   BtAltDet.Down         := False;
   BtAltDet.Enabled      := False;
   BtOkDet.Enabled       := True;
   BtCancDet.Enabled     := True;
   BtVoltaDet.Enabled    := True;

   DBGrid1.SelectedIndex := 0;
   DBGrid1.Options       := DBGrid1.Options + [TwwDBgridOption(dgEditing)];
   DBGrid1.Font.Color    := clBlack;
   DBGrid1.SetFocus;

   If sTipoOperacao = 'P' Then
      bAlteraPendencia := True
   Else
      bAlteraPendencia := False;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   QryConsulta.Edit;

   bTrocaLine            := False;

   QryConsultaQTDEOPERACAO.DisplayFormat := '';
   QryConsultaVLROPERACAO.DisplayFormat  := '#0.00';

   iAlteracao := iAlteracao + 1;
   bTrue := False;
end;

function TfrmPendenciaBolsa.VerColunaAlterada : Boolean;
Begin
   //AL_8 - Ajuste nas mensagens
   Result := True;
   If (QryConsulta.FieldByName('SGLBOLSAVALORES').AsString <>
       QryConsulta.FieldByName('SGLBOLSAVALORES').OldValue) Then
   Begin
      MsgDlg('Não é possível alterar a Bolsa de Valores.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('DESCINVESTIMENTO').AsString <>
       QryConsulta.FieldByName('DESCINVESTIMENTO').OldValue) Then
   Begin
      MsgDlg('Não é possível alterar o Investimento.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('DESCTIPOOPERACAO').AsString <>
       QryConsulta.FieldByName('DESCTIPOOPERACAO').OldValue) Then
   Begin
      MsgDlg('Não é possível alterar o Tipo de Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('DESCMERCADO').AsString <>
       QryConsulta.FieldByName('DESCMERCADO').OldValue) Then
   Begin
      MsgDlg('Não é possível alterar o Mercado.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   //AL_8 - Permite alterar o PU da operação

   If (QryConsulta.FieldByName('TOTALDESPESAS').AsFloat <>
       QryConsulta.FieldByName('TOTALDESPESAS').OldValue) Then
   Begin
      MsgDlg('Não é possível alterar o Total das Despesas',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('QTDEOPERACAO').AsFloat >
       QryConsulta.FieldByName('QTDEOPERACAO').OldValue) Then
   Begin
      MsgDlg('Valor da Pendência maior que o valor da Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;
End;

procedure TfrmPendenciaBolsa.BtOkDetClick(Sender: TObject);
Var
   fQtdPendente      : Double;
   dData             : TDateTime;
   iIDOPERACAOINVEST : Integer;
begin
   bOK          := True;
   bTrocaLine   := True;
   If Not VerColunaAlterada Then
   Begin
      BtCancDet.Click;
      Exit;
   End;

   If Trim(dblCorretora.Text) = '' Then
   Begin
      MsgDlg('Selecionar a Corretora.                 ',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If Trim(dblkBoleta.Text) = '' Then
   Begin
      MsgDlg('Selecionar a Boleta.                    ',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   Try
      If (QryConsulta.FieldByName('QTDEOPERACAO').OldValue -
                          QryConsulta.FieldByName('QTDEOPERACAO').AsFloat) = 0 Then
          bTestaPendencia := True
      Else
          bTestaPendencia := False;

      If dblLiquidacao.Text <> '' Then
      Begin
         If Not TestaExisteIDOperPendente Then
         Begin
            QryOperacaoPendente.Insert;
            QryOperacaoPendente.FieldByName('IDOPERACAOINVEST').AsInteger :=
                             QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
         End
         Else
            QryOperacaoPendente.Edit;
      End
      Else
      Begin
         If Not bAlteraPendencia Then
         Begin
            If Not TestaExisteIDOperPendente Then
            Begin
               QryOperacaoPendente.Insert;
               QryOperacaoPendente.FieldByName('IDOPERACAOINVEST').AsInteger :=
                                QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
            End
            Else
               QryOperacaoPendente.Edit;
         End
         Else
            QryOperacaoPendente.Edit;
      End;

      fQtdPendente :=(QryConsulta.FieldByName('QTDEOPERACAO').OldValue -
                                  QryConsulta.FieldByName('QTDEOPERACAO').AsFloat);
      QryOperacaoPendente.FieldByName('QTDEPENDENTE').AsFloat := fQtdPendente;
      QryOperacaoPendente.Post;

      If QryOperacaoPendente.State <> DsInsert Then
      Begin
         If dblLiquidacao.Text <> '' Then
            QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger
         Else
            QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      End;
      //AL_6  
      QryConsulta.FieldByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryConsulta.Post;

      QryConsultaQTDEOPERACAO.DisplayFormat := '###,###,###,###,###';
      QryConsultaVLROPERACAO.DisplayFormat  := '###,###,###,###0.00';
   Except
// Rollback a Transação
     MsgDlg('Não foi possível realizar a Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     BtCancDet.Click;
     Exit;
   End;

   TotalLiquidoDespesa;

   PgCt.Enabled          := True;
   BtAltDet.Enabled      := True;
   BtOkDet.Enabled       := False;
   BtCancDet.Enabled     := False;
   BtVoltaDet.Enabled    := False;
   Label2.Enabled        := True;
   dbDtaOperacao.Enabled := True;
   Label1.Enabled        := True;
   dblCorretora.Enabled  := True;
   Label3.Enabled        := True;
   dblLiquidacao.Enabled := True;
   //AL_6
   lblPlanoPatroOrigem.Enabled := True;
   dblkPlanPatro.Enabled := True;
   lblBoleta.Enabled     := True;
   dblkBoleta.Enabled    := True;

   DBGrid1.Options       := DBGrid1.Options - [TwwDBgridOption(dgEditing)];
   DBGrid1.Color         := clSilver;
end;

procedure TfrmPendenciaBolsa.BtCancDetClick(Sender: TObject);
begin
   bOK                := False;
   bTrocaLine         := True;
   DBGrid1.Options    := DBGrid1.Options - [TwwDBgridOption(dgEditing)];
   DBGrid1.Font.Color := clGray;
   DBGrid1.Color      := clSilver;

   QryOperacaoPendente.Cancel;
   QryConsulta.Cancel;
   QryConsultaQTDEOPERACAO.DisplayFormat := '###,###,###,###,###';
   QryConsultaVLROPERACAO.DisplayFormat  := '###,###,###,###0.00';   
   PgCt.Enabled          := True;
   BtAltDet.Enabled      := True;
   BtOkDet.Enabled       := False;
   BtCancDet.Enabled     := False;
   BtVoltaDet.Enabled    := False;
   Label2.Enabled        := True;
   dbDtaOperacao.Enabled := True;
   Label1.Enabled        := True;
   dblCorretora.Enabled  := True;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Label3.Enabled        := True;
   dblLiquidacao.Enabled := True;
   //AL_6
   lblPlanoPatroOrigem.Enabled := True;
   dblkPlanPatro.Enabled := True;
   lblBoleta.Enabled     := True;
   dblkBoleta.Enabled    := True;   
end;

procedure TfrmPendenciaBolsa.QryConsultaBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.',
            'Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmPendenciaBolsa.DBGrid1Enter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmPendenciaBolsa.DBGrid1Exit(Sender: TObject);
begin
  inherited;
   //AL_11
   with qryConsulta, OperComum do
   begin
      KeyPreview := True;
      If (State = DsEdit) And ((FieldByName('QTDEOPERACAO').OldValue -
                                FieldByName('QTDEOPERACAO').AsFloat) <> 0) And (Not bTrue) Then
      Begin
         If FieldByName('QTDEOPERACAO').AsFloat <> 0 Then
            FieldByName('VLROPERACAO').AsFloat :=
                       Trunca(((DivValorZero(FieldByName('QTDEOPERACAO').AsFloat, FieldByName('QTDELOTE').AsFloat) *
                               FieldByName('PRECOUNITOPERACAO').AsFloat)-0.0049), 2)
         Else
            QryConsulta.FieldByName('VLROPERACAO').AsFloat := 0;
      End;
   end;
end;

procedure TfrmPendenciaBolsa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (DBGrid1.Options = [TwwDBgridOption(dgEditing),
                              TwwDBgridOption(dgAlwaysShowEditor),
                              TwwDBgridOption(dgTitles),
                              TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),
                              TwwDBgridOption(dgColLines),
                              TwwDBgridOption(dgRowLines),
                              TwwDBgridOption(dgAlwaysShowSelection),
                              TwwDBgridOption(dgCancelOnExit),
                              TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;
  inherited;
end;

procedure TfrmPendenciaBolsa.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (DBGrid1.Options = [TwwDBgridOption(dgEditing),
                              TwwDBgridOption(dgAlwaysShowEditor),
                              TwwDBgridOption(dgTitles),
                              TwwDBgridOption(dgIndicator),
                              TwwDBgridOption(dgColumnResize),
                              TwwDBgridOption(dgColLines),
                              TwwDBgridOption(dgRowLines),
                              TwwDBgridOption(dgAlwaysShowSelection),
                              TwwDBgridOption(dgCancelOnExit),
                              TwwDBgridOption(dgWordWrap)]) Then
      Key := 0;

  inherited;
end;

procedure TfrmPendenciaBolsa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      
     SelectNext(ActiveControl,True,True);
end;

procedure TfrmPendenciaBolsa.DBGrid1ColExit(Sender: TObject);
var
  fValDif  : Double;
begin
   //AL_11
   with qryConsulta, OperComum do
   begin
      If (State = DsEdit) And (Not bTrue) Then
      Begin
         If FieldByName('QTDEOPERACAO').AsFloat <> 0 Then
            FieldByName('VLROPERACAO').AsFloat :=
                       Trunca(((DivValorZero(FieldByName('QTDEOPERACAO').AsFloat, FieldByName('QTDELOTE').AsFloat) *
                               FieldByName('PRECOUNITOPERACAO').AsFloat)-0.0049), 2)
         Else
            QryConsulta.FieldByName('VLROPERACAO').AsFloat := 0;
      End;
      fValDif := QryConsulta.FieldByName('VLROPERACAO').AsFloat;
      bTrue := False;
   end;
end;

function TfrmPendenciaBolsa.OperacaoNormal;
var wDataVenc : TDateTime;
    I: Byte;
begin
   Result := False;
   try
      //AL_6  
      // Exclui a Operação Pendente
      OperComum.LimpaParametros(QryDelOperacaoPendente);
      QryDelOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                        QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryDelOperacaoPendente.ExecSQL;

      //AL_6  
      // Busca Dados da Operação Original
      OperComum.LimpaParametros(QryHistCartInv);
      QryHistCartInv.ParamByName('IDOPERACAOINVEST').AsInteger :=
                        QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryHistCartInv.Open;

      //AL_6  
      OperComum.LimpaParametros(QryBuscaTipoOper);
      QryBuscaTipoOper.ParamByName('TIPOOPERACAO').AsInteger :=
                        QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger;
      QryBuscaTipoOper.Open;

      //AL_6  
      // AL_1 - Ajuste na captação da data de liquidação original
      // Pega data de Vencimento Original
      I := 1;
      wDataVenc   :=  QryConsulta.FieldByName('DATAOPERACAO').AsDateTime;

      while I <= QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger do
      begin
         wDataVenc := wDataVenc + 1;
         while not DiasUteisInv.DiaUtil(wDataVenc,-1,1,'',True,False,False) do
           wDataVenc := wDataVenc + 1;   // Achar o próximo dia útil
         Inc(I);
      end;

      //AL_6
      // Atualiza a Operação com os valores originais
      OperComum.LimpaParametros(QryUpdOperacaoInvest_2);
      QryUpdOperacaoInvest_2.ParamByName('VLROPERACAO').AsFloat     :=
                         ABS(QryHistCartInv.FieldByName('VLRMOVCARTINV').AsFloat);
      QryUpdOperacaoInvest_2.ParamByName('QTDEOPERACAO').AsFloat    :=
                             QryHistCartInv.FieldByName('QTDEMOVINVCART').AsFloat;
      QryUpdOperacaoInvest_2.ParamByName('DATAVENCOPER').AsDateTime  := wDataVenc;
      QryUpdOperacaoInvest_2.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryUpdOperacaoInvest_2.ParamByName('IDTIPOOPERACAO').AsInteger := pRPI.IDTIPOOPERLIQPEND;
      QryUpdOperacaoInvest_2.ParamByName('LIMPADOC').AsString := 'S';
      QryUpdOperacaoInvest_2.ExecSql;

      //AL_9
      //AL_10
      // Excluir o Documento de Pendencia      
      if not OperComum.EstornaFinanPendencia(QryConsulta.FieldByName('CODDOCUMENTO').AsInteger,
                                             QryConsulta.FieldByName('DATAOPERACAO').AsDateTime) then
         Raise Exception.Create('Não foi Possível Excluir o Financeiro da Pendência');

      Result := True;

   finally
      //AL_6  
      OperComum.LimpaParametros(QryUpdOperacaoInvest_2);
      OperComum.LimpaParametros(QryHistCartInv);
      OperComum.LimpaParametros(QryBuscaTipoOper);
      OperComum.LimpaParametros(QryDelOperacaoPendente);      
   end;
end;

function TfrmPendenciaBolsa.ExcluirPendencia : Boolean;
begin
   Try 
     //AL_6  
     Try
        QryConsulta.First;
        While Not QryConsulta.EOF Do
        Begin
          //AL_6  
          OperComum.LimpaParametros(QryVerOperInvPendente);
          QryVerOperInvPendente.ParambyName('IDOPERACAOORIGEM').AsInteger :=
                                QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
          QryVerOperInvPendente.ParambyName('IDTIPOOPERACAO').AsInteger   := pRPI.IDTIPOOPERLIQPEND;
          QryVerOperInvPendente.Open;

          // Procura a Pendencia da Pendencia com TipoOperacao = pRPI.IDTIPOOPERLIQPEND
          If (Not QryVerOperInvPendente.EOF) Then
          Begin
             //AL_6  
             OperComum.LimpaParametros(QryUpdOperacaoPendente);
             QryUpdOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                            QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
             QryUpdOperacaoPendente.ParamByName('QTDEPENDENTE').AsFloat       :=
                            QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
             QryUpdOperacaoPendente.ExecSql;
             //AL_6  
             // Exclui OperacaoInvest (Operacao Pendente)
             OperComum.LimpaParametros(QryDelOperacaoInvestPend);
             QryDelOperacaoInvestPend.ParamByName('DATAVENCOPER').AsDateTime    :=
                                      QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;
             QryDelOperacaoInvestPend.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                      QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
             QryDelOperacaoInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger   := pRPI.IDTIPOOPERLIQPEND;
             QryDelOperacaoInvestPend.ExecSql;
             //AL_6  
             //AL_9
             //AL_10
             // Excluir o Documento de Pendencia
             if not OperComum.EstornaFinanPendencia(QryConsulta.FieldByName('CODDOCUMENTO').AsInteger,
                                                    QryConsulta.FieldByName('DATAOPERACAO').AsDateTime) Then
                Raise Exception.Create('Não é possível fazer a Exclusão do Financeiro.');

             if Trim(dblLiquidacao.Text) <> '' then
                DeletaQtdZeradas;
          end
          else
             // Somente uma Pendencia (Simples)
             OperacaoNormal;
          //AL_6  
          QryConsulta.Next;
        end;

        //AL_6  
        OperComum.LimpaParametros(QryLiquidacao);
        QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                      QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
        QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
        //AL_5
        QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
        QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;        
        QryLiquidacao.Open;

        AbreQry;
        // Calcula valor liquido da operação
        TotalLiquidoDespesa;

        // Excluiu a Origem (Todas as Pendencias)
        // Faz financeiro atualizando documento na boleta (Situação Original)
        if not FinanceiroAtual('B') then
           Raise Exception.Create('Não foi Possível Lançar o Financeiro desta Pendência');
        Result := True;
     except
        Result := false;
     end;
   //AL_6  
   finally
     OperComum.LimpaParametros(QryVerOperInvPendente);
     OperComum.LimpaParametros(QryUpdOperacaoPendente);
     OperComum.LimpaParametros(QryDelOperacaoInvestPend);
   end;
end;

function  TfrmPendenciaBolsa.ExcluirLiqPendencia : Boolean;
begin
   Try
     //AL_6
     Try
        QryConsulta.First;
        While Not QryConsulta.EOF Do
        Begin
          //AL_6  
          OperComum.LimpaParametros(QryOperacaoPendente);
          QryOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                              QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
          QryOperacaoPendente.Open;
          If QryOperacaoPendente.EOF Then
          Begin
            //AL_6  
            OperComum.LimpaParametros(QryInsOperacaoPendente);
            QryInsOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                    QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
            QryInsOperacaoPendente.ParamByName('QTDEPENDENTE').AsFloat       :=
                                    QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
            QryInsOperacaoPendente.ExecSQL;
          End
          Else
          Begin
             //AL_6  
             OperComum.LimpaParametros(QryUpdOperacaoPendente);
             QryUpdOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                    QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
             QryUpdOperacaoPendente.ParamByName('QTDEPENDENTE').AsFloat       :=
                                   (QryConsulta.FieldByName('QTDEOPERACAO').AsFloat+
                                    QryOperacaoPendenteQTDEPENDENTE.AsFloat);
             QryUpdOperacaoPendente.ExecSql;
             //AL_6  
          End;
          //AL_6  
          //Delete OperacaoInvest (Operacao Pendente)
          OperComum.LimpaParametros(QryDelOperacaoInvestPend);
          QryDelOperacaoInvestPend.ParamByName('DATAVENCOPER').AsDateTime    :=
                                   QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;
          QryDelOperacaoInvestPend.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                   QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
          QryDelOperacaoInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger   := pRPI.IDTIPOOPERLIQPEND;
          QryDelOperacaoInvestPend.ExecSql;
          //AL_6  
          //AL_9
          //AL_10
          // Excluir o Documento de Pendencia
          if not OperComum.EstornaFinanPendencia(QryConsulta.FieldByName('CODDOCUMENTO').AsInteger,
                                                 QryConsulta.FieldByName('DATAOPERACAO').AsDateTime) Then
             Raise Exception.Create('Não é possível fazer a Exclusão do Financeiro.');

          DeletaQtdZeradas;

          QryConsulta.Next;
        end;

        QryConsulta.First;

        //AL_6  
        // Busca todas as Datas de Liquidação desta pendencia
        OperComum.LimpaParametros(QryLiquidacao1);
        QryLiquidacao1.ParamByName('IDTIPOOPERACAO').AsInteger  := pRPI.IDTIPOOPERLIQPEND;
        QryLiquidacao1.ParamByName('IDCORRETVALORES').AsInteger :=
                          QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
        QryLiquidacao1.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
        //AL_5
        QryLiquidacao1.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
        QryLiquidacao1.Open;

        If (Not QryLiquidacao1.EOF) And (QryLiquidacao1.RecordCount > 1) Then
        Begin
           //AL_6  
           // Se tiver mais alguma pendencia de pendencia
           OperComum.LimpaParametros(QryLiquidacao);
           QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                          QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
           QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
           //AL_5
           QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
           QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;           
           QryLiquidacao.Open;
           QryLiquidacao.Last;
           dblLiquidacao.Text := QryLiquidacao.FieldByName('DATAVENCOPER').AsString;
           AbreQryConsLiq;
           sTipoOperacao  := 'L';
        End
        Else
        Begin
           //AL_6  
           OperComum.LimpaParametros(QryLiquidacao);
           QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                       QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
           QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
           //AL_5
           QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
           QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;
           QryLiquidacao.Open;

           If (Not QryLiquidacao.EOF) Then
           Begin
              QryLiquidacao.Last;
              If QryLiquidacao.RecordCount > 1 Then
                 dblLiquidacao.Text := QryLiquidacao.FieldByName('DATAVENCOPER').AsString
              Else
                 dblLiquidacao.Text := '';
              sTipoOperacao         := 'L';
           End
           Else
           Begin
              AbreQry;
              bAlteraPendencia := True;
           End;
        End;
        Result := True;
     Except
       // Deixa o Tratamento para a chamada no Botão
       Result := False;
     End;
   //AL_6  
   finally
     OperComum.LimpaParametros(QryOperacaoPendente);
     OperComum.LimpaParametros(QryInsOperacaoPendente);
     OperComum.LimpaParametros(QryUpdOperacaoPendente);
     OperComum.LimpaParametros(QryDelOperacaoInvestPend);
   end;
end;

procedure TfrmPendenciaBolsa.BtDelDetClick(Sender: TObject);
var
   fQtdOperacao    : Double;
   wDataVenc       : TDateTime;
   iIDTipoOperacao : Integer;
   bMenorData      : Boolean;
begin
   if MsgDlg('Confirma a Exclusão ?', 'Mensagem do Sistema ', mtConfirmation , [mbYes, mbNo], 0) = mrNo Then
   begin
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   end;

   //AL_6  
   If Trim(dbDtaOperacao.Text) = '' Then
   Begin
      MsgDlg('Selecionar a Data de Operacao.          ',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If Trim(dblkPlanPatro.Text) = '' Then
   Begin
      MsgDlg('Selecionar Plano / Patrocinadora.       ',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If Trim(dblCorretora.Text) = '' Then
   Begin
      MsgDlg('Selecionar a Corretora.                 ',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If Trim(dblkBoleta.Text) = '' Then
   Begin
      MsgDlg('Selecionar a Boleta.                    ',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   End;

   If QryConsulta.FieldByName('IDOPERACAOORIGEM').IsNull Then
   Begin
      MsgDlg('Não é possível Excluir uma Operação que não está Pendente.',
             'Mensagem do Sistema', mtWarning,[MbOk],0);
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;
   //AL_6  
   OperComum.LimpaParametros(QryVerDtaVenc);
   QryVerDtaVenc.ParamByName('IDOPERACAOORIGEM').AsInteger  :=
                     QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
   QryVerDtaVenc.Open;

   If (Not QryVerDtaVenc.Eof) And (QryVerDtaVenc.FieldByName('DATAVENCOPER').AsDateTime >
                                   QryLiquidacao.FieldByName('DATAVENCOPER').AsDateTime) Then
   Begin
      MsgDlg('Não é possível Excluir esta Operação. Existe uma Data de Liquidação maior que a escolhida. ',
             'Mensagem do Sistema', mtWarning,[MbOk],0);
      BtDelDet.Down := False;
      bTrocaLine    := True;
      //AL_6  
      OperComum.LimpaParametros(QryVerDtaVenc);
      Exit;
   End
   Else
   Begin
      If Not QryLiquidacao.Eof Then
      Begin
         QryLiquidacao.Last;
         If (QryLiquidacao.FieldByName('DATAVENCOPER').AsDateTime >
                          QryConsulta.FieldByName('DATAVENCOPER').AsDateTime) Then
         Begin
            MsgDlg('Não é possível Excluir esta Operação. Existe uma Data de Liquidação maior. ',
                   'Mensagem do Sistema', mtWarning,[MbOk],0);
            BtDelDet.Down := False;
            bTrocaLine    := True;
            //AL_6  
            OperComum.LimpaParametros(QryVerDtaVenc);
            Exit;
         End;
      End;
   End;
   //AL_6  
   OperComum.LimpaParametros(QryVerDtaVenc);

   If (dblLiquidacao.Text <> '') And (QryLiquidacao.RecordCount = 1) And
      (QryLiquidacao.FieldByName('DATAVENCOPER').AsDateTime = QryConsulta.FieldByName('DATAVENCOPER').AsDateTime) Then
   Begin
       MsgDlg('Não é possível Excluir esta Liquidação, exclua a Pendência.',
              'Mensagem do Sistema', mtWarning,[MbOk],0);
       BtDelDet.Down := False;
       bTrocaLine    := True;
       Exit;
   End;

   GuardaVariaveis;

   QryConsulta.DisableControls;

   Try
      if Not DtmBaseDados.dbBaseDados.InTransaction Then
          DtmBaseDados.dbBaseDados.StartTransaction;

      // AL_1 
      if Trim(dblLiquidacao.Text) = '' then
      begin
         if not ExcluirPendencia then
            Raise Exception.Create('Problemas com o registro de Pendência');
      end
      else
      begin
         if not ExcluirLiqPendencia then
            Raise Exception.Create('Problemas com o registro de Liquidação de Pendência');
      end;

      bAlteraPendencia := True;
      //AL_6  
      if DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Commit;

      QryConsulta.Close;
      QryConsulta.Open;
      //AL_6  
      OperComum.LimpaParametros(QryLiquidacao);
      QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
      //AL_5
      QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;      
      QryLiquidacao.Open;

      QryConsulta.EnableControls;

      TotalLiquidoDespesa;

      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      BtDelDet.Down         := False;

   except on E: Exception do
      begin
         // Rollback a Transação
         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;

         MsgDlg('Não é possível Excluir essa Operação.'+ #13 +
                 E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);

         QryConsulta.Close;
         QryConsulta.Open;
         QryConsulta.EnableControls;
         TotalLiquidoDespesa;
      end;
   end;
end;

procedure TfrmPendenciaBolsa.OrdenaQryConsulta(wTotalLiquido : Double);
begin
   With QryConsulta Do
   Begin
      Close;
      Open;
   End;
end;

//AL_6

Function  TfrmPendenciaBolsa.ApuraValorLiquido : Double;
Begin
   Result := 0;
   QryConsulta.First;
   While Not QryConsulta.EOF Do
   Begin
   // Soma de Acordo com Tipo de Natureza(Venda/Compra)
     If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
        (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
        (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
        (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
         Result := Result +
                          QryConsulta.FieldByName('VLROPERACAO').AsFloat
     Else If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
         Result := Result -
                        QryConsulta.FieldByName('VLROPERACAO').AsFloat;

     // Pula Registro
     QryConsulta.Next;
   End;
   QryConsulta.First;
End;

Procedure TfrmPendenciaBolsa.Contabiliza;
Var
  wMensErro, wRecPagBol, wTipoRecDesBol : String;
  wPlanilha, wDocumCont, wPlano : Integer;
  wTotalContab : Double;
  bCriaLancto  : boolean;
Begin
   // Trata variáveis da Integração Contábil-Financeira
   wPlanilha  :=-1;
   wPlano     :=-1;
   wDocumCont :=-1;

   bCriaLancto    := true;

   If (wTotalLiquido < 0) Then
       wRecPagBol := 'R'
   Else
       wRecPagBol := 'P';

   wTotalContab   := Abs(wTotalLiquido);

   // Contabiliza Operação
   QryConsulta.First;

   While Not QryConsulta.EOF Do
   Begin
      wTipoRecDesBol := 'N'+QryConsulta.FieldByName('RECPAGBOL').AsString;
      If QryConsulta.FieldByName('RECPAGBOL').AsString = 'R' then
      Begin
         If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
             OperComum.LancaOperRFRV(
                           Sistema.IdEmpresa, Sistema.IdModulo,
                           QryConsulta.FieldByName('IDTIPOINVEST').AsInteger,
                           QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                           QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger,
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                           QryConsulta.FieldByName('IDFORCLI').AsInteger,
                           QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryConsulta.FieldByName('MOECODIGO').AsInteger,
                           QryConsulta.FieldByName('CODTIPOACAO').AsString,
                           QryConsulta.FieldByName('IDLOTE').AsString,
                           '',
                           QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                           wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                           QryConsulta.FieldByName('VLROPERACAO').AsFloat,
                           QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                           QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                           wPlano, wPlanilha, wDocumCont, wMensErro);
      End
      Else
      Begin
         If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
            (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
             OperComum.LancaOperRFRV(
                           Sistema.IdEmpresa, Sistema.IdModulo,
                           QryConsulta.FieldByName('IDTIPOINVEST').AsInteger,
                           QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                           QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger,
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                           QryConsulta.FieldByName('IDFORCLI').AsInteger,
                           QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryConsulta.FieldByName('MOECODIGO').AsInteger,
                           QryConsulta.FieldByName('CODTIPOACAO').AsString,
                           QryConsulta.FieldByName('IDLOTE').AsString,
                           '',
                           QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                           wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                           QryConsulta.FieldByName('VLROPERACAO').AsFloat,
                           QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                           QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                           wPlano, wPlanilha, wDocumCont, wMensErro);
      End;
      QryConsulta.Next;
   End;
End;

//AL_6

procedure TfrmPendenciaBolsa.PgCtChange(Sender: TObject);
Var
   wValCorretagemLiq, wValCorretagemLiqCons : Double;
   iIDOPERACAOINVEST : Integer;
begin
  inherited;
  wValCorretagemLiqCons := 0;
  iIDOPERACAOINVEST     := QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
  If (PgCt.ActivePage = TbObs) And (mmoObs.Enabled) Then
    mmoObs.SetFocus;
  If sTipoOperacao    <> 'P' Then
  Begin
    If (PgCt.ActivePage = TbConsolidado) Then
    Begin
       With QryConsulta Do
       Begin
          DisableControls;
          First;
          While Not EOF Do
          Begin
             wValCorretagemLiqCons := wValCorretagemLiqCons + CorretagemLiquida;
             Next;
          End;
          EnableControls;
       End;
       pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(wValCorretagemLiqCons))+' ';
       QryConsulta.Locate('IDOPERACAOINVEST', iIDOPERACAOINVEST, [loPartialKey]);
    End
    Else
       pnlCorretLiquida.Caption := FormatFloat('###,###,###,##0.00',Abs(CorretagemLiquida))+' ';
  End
  Else
    pnlCorretLiquida.Caption := '0,00';
end;

procedure TfrmPendenciaBolsa.TotalLiquidoDespesa;
Var
   iIDOPERACAOINVEST : Integer;
   sNATUREZAOPERACAO : String;
   valor : double;
Begin
   QryConsulta.DisableControls;
   wTotalDespesa     := 0;
   wTotalLiquido     := 0;
   iIDOPERACAOINVEST := QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryConsulta.First;
   While Not QryConsulta.EOF Do Begin
        wTotalDespesa := wTotalDespesa+QryConsulta.FieldByName('TOTALDESPESAS').AsFloat;
     If (dblLiquidacao.Text <> '') And (Not QryConsulta.FieldByName('IDOPERACAOORIGEM').IsNull) Then
        sNATUREZAOPERACAO := Natureza(QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger)
     Else
        sNATUREZAOPERACAO := QryConsulta.FieldByName('NATUREZAOPERACAO').AsString;

// Soma de Acordo com Tipo de Natureza(Venda/Compra)
     If (sNATUREZAOPERACAO = 'A') Or (sNATUREZAOPERACAO = 'V') Or
        (sNATUREZAOPERACAO = 'U') Or (sNATUREZAOPERACAO = 'M') Then
         wTotalLiquido := wTotalLiquido +
                          QryConsulta.FieldByName('VLROPERACAO').AsFloat

     Else If (sNATUREZAOPERACAO = 'D') Or (sNATUREZAOPERACAO = 'S') Or
             (sNATUREZAOPERACAO = 'O') Or (sNATUREZAOPERACAO = 'R') Or
             (sNATUREZAOPERACAO = 'I') Then
         wTotalLiquido := wTotalLiquido -
                          QryConsulta.FieldByName('VLROPERACAO').AsFloat ;
// Pula Registro
     QryConsulta.Next;
   End;
   QryConsulta.Locate('IDOPERACAOINVEST', iIDOPERACAOINVEST, [loPartialKey]);
   QryConsulta.EnableControls;

   If (wTotalLiquido < 0) Then
      Label6.Caption :='Total Líquido à Receber '
   Else
      Label6.Caption :='Total Líquido à Pagar';

   If (Trim(dblLiquidacao.Text) <> '') And
      (StrToDate(dblLiquidacao.Text) <> dDataVencMenor) Then
       wTotalDespesa := 0;

   wTotalLiquido     := wTotalLiquido + wTotalDespesa;

   PnlDespesas.Caption  :=FormatFloat('###,###,##0.00',wTotalDespesa)+' ';

   PnlTotLiquido.Caption:=FormatFloat('###,###,##0.00',Abs(wTotalLiquido))+' ';
End;

function TfrmPendenciaBolsa.TestaExisteIDOperPendente : Boolean;
begin
   Result := False;
   With QryOperacaoPendente Do
   Begin
      First;
      While Not EOF Do
      Begin
         If (FieldByName('IDOPERACAOINVEST').AsInteger =
             QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger) Then
         Begin
            Result := True;
            Exit;
         End;
         Next;
      End;
   End;
end;

function TfrmPendenciaBolsa.VerificaQtde : Boolean;
begin
   Result := False;
   With QryOperacaoPendente Do
   Begin
      First;
      While Not EOF Do
      Begin
         If (FieldByName('IDOPERACAOINVEST').AsInteger =
             QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger) Then
         Begin
            If OperComum.Round(FieldByName('QTDEPENDENTE').AsFloat,2) =
               OperComum.Round(QryConsulta.FieldByName('QTDEOPERACAO').AsFloat,2) Then
               Result := True;
            Exit;
         End;
         Next;
      End;
   End;
   QryOperacaoPendente.First;
   If Not QryOperacaoPendente.EOF Then
      QryOperacaoPendente.Locate('IDOPERACAOINVEST',
        QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger, [loPartialKey]);
end;

procedure TfrmPendenciaBolsa.QryConsultaVLROPERACAOValidate(
  Sender: TField);
begin
  inherited;
  bTrue := True;
end;

procedure TfrmPendenciaBolsa.dbDtaOperacaoExit(Sender: TObject);
var sPlano: String;
begin
  inherited;
  //AL_6
  OperComum.LimpaParametros(QryConsulta);
  //AL_7
  if (dbDtaOperacao.Text <> '') then
  begin
     sPlano := Trim(dblkPlanPatro.Text);
     OperComum.LimpaParametros(qryPlanoPatro);
     qryPlanoPatro.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
     qryPlanoPatro.Open;
     if qryPlanoPatro.Locate('PLANPRVCONTABPATRO', sPlano, []) then
     begin
        dblkPlanPatro.Text := sPlano;
        dblkPlanPatro.PerformSearch;
     end
     else
     begin
        if qryPlanoPatro.RecordCount = 1 then
        begin
           dblkPlanPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
           dblkPlanPatro.PerformSearch;
        end;
     end;

     if Trim(dblkPlanPatro.Text) <> '' then
     begin
        OperComum.LimpaParametros(QryCorretValores);
        QryCorretValores.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
        QryCorretValores.ParamByName('P_DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
        QryCorretValores.Open;
        If QryCorretValores.RecordCount = 1 Then
        Begin
           //AL_6
           dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;
           dblCorretora.PerformSearch;

           OperComum.LimpaParametros(QryBoleta);
           QryBoleta.ParamByName('IDFORCLI').AsInteger :=
                              QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
           QryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
           QryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
           QryBoleta.Open;

           If QryBoleta.RecordCount = 1 Then
           begin
              dblkBoleta.Text := QryBoleta.FieldByName('IDBOLETA').AsString;
              dblkBoleta.PerformSearch;
           end;

           OperComum.LimpaParametros(QryLiquidacao);
           QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                              QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
           QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
           //AL_4
           If Trim(dblkBoleta.Text) <> '' Then
              QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString  := QryBoleta.FieldByName('IDBOLETA').AsString;
           //AL_5
           QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
           QryLiquidacao.Open;
        End;
     end;
  End;
end;

//AL_6

procedure TfrmPendenciaBolsa.AbreQryConsLiq;
Var
   bMenorData : Boolean;
Begin
   bMenorData := TestaMenorData(StrToDate(dbDtaOperacao.Text), StrToDate(dblLiquidacao.Text));

   With QryAux Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT MIN(DATAVENCOPER) AS DATAVENCOPER FROM OPERACAOINVEST WHERE  ');
      Sql.Add('   (IDCARTEIRAGERENC IS NULL)                                    AND ');

      //AL_6
      If Trim(dblkPlanPatro.Text) <> '' Then
         Sql.Add('(IDPLANPREVCTBPATR  = '+
                  qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')    AND ')
      Else
         Sql.Add('(IDPLANPREVCTBPATR  > 0)                                      AND ');
      //AL_6
      If Trim(dblCorretora.Text) <> '' Then
         Sql.Add('(IDCORRETVALORES  = '+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+')   AND ')
      Else
         Sql.Add('(IDCORRETVALORES > 0)                                         AND ');

      //AL_4
      If Trim(dblkBoleta.Text) <> '' Then
         Sql.Add('   (NUMDOCUMENTO     = '''+QryBoleta.FieldByName('IDBOLETA').AsString+''') AND ');

      //AL_6
      If dbDtaOperacao.Text <> '' Then
         Sql.Add('(DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) ')
      Else
         Sql.Add('(NOT DATAOPERACAO IS NULL)                                        ');

      Open;
      dDataVencMenor := FieldByName('DATAVENCOPER').AsDateTime;
      Close;
   End;

   With QryConsulta Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT                                                                    ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,               ');
      Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, OI.PRECOUNITOPERACAO,         ');
      Sql.Add('      OI.VLROPERACAO, SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,         ');
      Sql.Add('      PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,12) AS DESCINVESTIMENTO,      ');
      Sql.Add('      SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,                 ');
      Sql.Add('      TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST,            ');
      Sql.Add('      OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,                ');
      Sql.Add('      AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOTE,         ');
      Sql.Add('      OI.IDCORRETVALORES, OI.EMPRESAPROP, OI.IDOPERACAOORIGEM,            ');
      Sql.Add('      AB.QTDELOTE, OI.IDCUSTODIANTE, OI.IDMODULO,                         ');
      If bMenorData Then
         Sql.Add('      DS.TOTALDESPESAS,                                                ')
      Else
         Sql.Add('      0 AS TOTALDESPESAS,                                              ');
      SQL.Add('      DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',                            ');
      SQL.Add('        DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',                          ');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',                        ');
      SQL.Add('            DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',                      ');
      SQL.Add('              DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL,');
      Sql.Add('      HC.PLNCODIGO, OI.CODDOCUMENTO, HC.IDHISTCARTINV, HC.PLANO,          ');
      SQL.Add('      OI.CODFINANCEIRO, OI.IDPLANPREVCTBPATR                              ');
      Sql.Add('FROM                                                                      ');
      Sql.Add('       PESSOA PS, OPERACAOINVEST OI, OPRACAO OA, BOLSAVALORES BV,  INVESTIMENTO IV,');
      If bMenorData Then
      Begin
         Sql.Add('      (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS                ');
         Sql.Add('       FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI                                  ');
         Sql.Add('       WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND                            ');
         Sql.Add('              TDI.NATUREZAOPERACAO NOT IN ('+'''N'''+')                                  ');
         Sql.Add('       GROUP BY DOI.IDOPERACAOINVEST) DS,              ');
      End;
      Sql.Add('       TIPOOPERACAO TI, MERCADO ME, ACAO AC, ACOESXBOLSA AB, HISTCARTINV HC   ');
      Sql.Add('WHERE (OI.IDCARTEIRAGERENC IS NULL)                                  AND    ');

      //AL_6
      If Trim(dblkPlanPatro.Text) <> '' Then
         Sql.Add('   (OI.IDPLANPREVCTBPATR  = '+
                  qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')       AND ')
      Else
         Sql.Add('   (OI.IDPLANPREVCTBPATR  > 0)                                   AND ');

      If Trim(dblCorretora.Text) <> '' Then
         Sql.Add('   (OI.IDCORRETVALORES  = '+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+')      AND ')
      Else
         Sql.Add('   (OI.IDCORRETVALORES > 0)                                      AND ');

      //AL_6
      //AL_4
      Sql.Add('   (OI.NUMDOCUMENTO     = '''+QryBoleta.FieldByName('IDBOLETA').AsString+''') AND ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('   (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('   (NOT OI.DATAOPERACAO IS NULL)                               AND ');

      Sql.Add('      (OI.DATAVENCOPER     = TO_DATE('''+dblLiquidacao.Text+''',''DD/MM/YYYY'')) AND ');

      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA)                         AND ');
      Sql.Add('      (DECODE(OI.IDOPERACAOORIGEM, NULL, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIGEM)= OA.IDOPERACAOINVEST(+)) AND ');
      If bMenorData Then
         Sql.Add('   (DECODE(OI.IDOPERACAOORIGEM, NULL, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIGEM)= DS.IDOPERACAOINVEST(+)) AND ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES(+))                AND ');
      Sql.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO(+))                AND ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO(+))                AND ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO(+))	                 AND ');
      If Not bMenorData Then
      Begin
         Sql.Add('   (OI.IDINVESTIMENTO   = AC.IDACAO(+))                        AND ');
         Sql.Add('   (OI.IDTIPOOPERACAO IN (SELECT IDTIPOOPERLIQPEND FROM PARAMINVEST))  AND      ');
      End
      Else
         Sql.Add('   (OI.IDINVESTIMENTO   = AC.IDACAO(+))  AND                       ');

      Sql.Add('      (AB.IDACAO           = AC.IDACAO)                              AND ');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                      AND ');

      If StrToDate(dblLiquidacao.Text) = dDataVencMenor Then
         Sql.Add('   (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)                 AND ')
      Else
         Sql.Add('   (HC.IDOPERACAOINVEST = OI.IDOPERACAOORIGEM)                 AND ');
      Sql.Add('      (HC.TIPMOVCARTINV    = ''OPE'')                                    ');
      Sql.Add('      ORDER BY IV.DESCINVESTIMENTO,SIGLATIPOOPER,OI.PRECOUNITOPERACAO    ');
      Open;
      If bMenorData Then
         QryConsultaTOTALDESPESAS.Visible := True
      Else
         QryConsultaTOTALDESPESAS.Visible := False;

      DBGrid1.FixedCols        := 4; //Altera a data liquidacao
      Panel6.Caption           := 'Operações de Pendência';
      sTipoOperacao            := 'P';
      pnlCorretLiquida.Caption := '0,00';
      If Not bMenorData Then
         PnlDespesas.Caption   := '0,00';

      QryDespesasOperacao.Close;

      QryConsolidado.Close;

      //AL_6  
      OperComum.LimpaParametros(QryOperacaoPendente);
      QryOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                       QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryOperacaoPendente.Open;
   End;
End;

//AL_6

function  TfrmPendenciaBolsa.GravaOperNormal : Boolean;
var
   QtdOld, QtdNew : Double;
   iCodDoumento, iPlano, iPlnCodigo : Integer;
begin
   Result := True;

   pnlCorretLiquida.Caption := '0,00';

   iAlteracao  := 0;

   bTrocaLine  := True;

   BtDelDet.Enabled := False;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   Try
      If DBGrid1.FixedCols = 5 Then
         QryConsulta.ApplyUpdates;

      QryOperacaoPendente.ApplyUpdates;

      if not OperComum.EstornaFinanPendencia(QryBuscaBoleta.FieldByName('CODDOCUMENTO').AsInteger,
                                             QryBuscaBoleta.FieldByName('DATABOLETA').AsDateTime) Then
         Raise Exception.Create('Problemas ao Excluir o Documento Original da Boleta.');

      if not FinanceiroAtual then
         Raise Exception.Create('Problemas com o registro Financeiro da Pendência.');

      //AL_6
      if DtmBaseDados.dbBaseDados.InTransaction then
         DtmBaseDados.dbBaseDados.Commit;
   except on E: Exception do
      begin
         // Rollbacka Transação
         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não é possível efetuar a gravação dessa Operação.'+#13+
                 E.Message,'Mensagem do Sistema', mtWarning,[MbOk],0);
         Result := False;
      end;   
   End;
end;

function  TfrmPendenciaBolsa.GravaOperPendente : Boolean;
Var QtdOld, QtdNew  : Double;
    wIdNovaOperacao : Integer;
    dDataLiq        : TDateTime;
begin
   dDataLiq    := Date;
   bTrocaLine  := True;
   //AL_6  
   Try
     Try
       If Not DtmBaseDados.dbBaseDados.InTransaction Then
          DtmBaseDados.dbBaseDados.StartTransaction;

       QryConsulta.DisableControls;
       QryConsulta.First;
       While Not QryConsulta.EOF Do
       Begin
          //AL_6  
          dDataLiq := QryConsulta.FieldByname('DATAVENCOPER').AsDateTime;
          OperComum.LimpaParametros(QryInsOperacaoInvest);
          With QryInsOperacaoInvest Do
          Begin
             wIdNovaOperacao := LeUltRegistro(Nil,'OPERACAOINVEST');

             ParamByname('IDOPERACAOINVEST').AsInteger  := wIdNovaOperacao;
             ParamByname('IDCUSTODIANTE').AsInteger     :=
                          QryConsulta.FieldByname('IDCUSTODIANTE').AsInteger;
             ParamByname('IDMODULO').AsInteger          :=
                          QryConsulta.FieldByname('IDMODULO').AsInteger;
             ParamByname('EMPRESAPROP').AsInteger          :=
                          QryConsulta.FieldByname('EMPRESAPROP').AsInteger;
             ParamByname('IDCORRETVALORES').AsInteger   :=
                          QryConsulta.FieldByname('IDCORRETVALORES').AsInteger;
             ParamByname('MOECODIGO').AsInteger         :=
                          QryConsulta.FieldByname('MOECODIGO').AsInteger;
             ParamByname('IDCARTEIRAINVEST').AsInteger  :=
                          QryConsulta.FieldByname('IDCARTEIRAINVEST').AsInteger;
             ParamByname('IDINVESTIMENTO').AsInteger    :=
                          QryConsulta.FieldByname('IDINVESTIMENTO').AsInteger;
             ParamByname('IDTIPOINVEST').AsInteger      :=
                          QryConsulta.FieldByname('IDTIPOINVEST').AsInteger;
             ParamByname('IDTIPOOPERACAO').AsInteger    := pRPI.IDTIPOOPERLIQPEND;
             ParamByname('DATAOPERACAO').AsDateTime     :=
                          QryConsulta.FieldByname('DATAOPERACAO').AsDateTime;
             ParamByname('NUMDOCUMENTO').AsString       :=
                          QryConsulta.FieldByname('NUMDOCUMENTO').AsString;
             ParamByname('QTDEOPERACAO').AsFloat        :=
                          QryConsulta.FieldByname('QTDEOPERACAO').AsFloat;
             ParamByname('PRECOUNITOPERACAO').AsFloat   :=
                          QryConsulta.FieldByname('PRECOUNITOPERACAO').AsFloat;
             ParamByname('VLROPERACAO').AsFloat         :=
                          QryConsulta.FieldByname('VLROPERACAO').AsFloat;
             ParamByname('DATAVENCOPER').AsDateTime     :=
                          QryConsulta.FieldByname('DATAVENCOPER').AsDateTime;
             ParamByname('IDFORCLI').AsInteger          :=
                          QryConsulta.FieldByname('IDFORCLI').AsInteger;
             ParamByname('IDLOTE').AsString             :=
                          QryConsulta.FieldByname('IDLOTE').AsString;
             ParamByname('IDOPERACAOORIGEM').AsInteger  :=
                          QryConsulta.FieldByname('IDOPERACAOINVEST').AsInteger;
             ParamByname('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
             ExecSQL;
          End;

          //AL_6  
          OperComum.LimpaParametros(QryBuscaInvestimento);
          QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                           QryConsulta.FieldByname('IDINVESTIMENTO').AsInteger;
          QryBuscaInvestimento.Open;

          //AL_6  
          // Inclui Dados na Tabela de SubTipo, OPRACAO
          OperComum.LimpaParametros(QryInsertOprAcao);
          QryInsertOprAcao.ParamByName('IDOPERACAOINVEST').AsInteger := wIdNovaOperacao;
          QryInsertOprAcao.ParamByName('IDBOLSAVALORES').AsInteger   :=
                           QryBuscaInvestimento.FieldByName('IDBOLSAVALORES').AsInteger;
          QryInsertOprAcao.ParamByName('IDACAO').AsInteger           :=
                           QryConsulta.FieldByname('IDINVESTIMENTO').AsInteger;
          QryInsertOprAcao.ParamByName('IDEMISSOR').AsInteger        :=
                           QryBuscaInvestimento.FieldByName('IDEMISSOR').AsInteger;
          QryInsertOprAcao.ExecSQL;

          If Not bAlteraPendencia Then
          Begin
             //AL_6  
             OperComum.LimpaParametros(QryDelOperacaoPendente);
             QryDelOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
             QryDelOperacaoPendente.ExecSQL;
          End
          Else
          Begin
             QtdOld := QryConsulta.FieldByName('QTDEOPERACAO').OldValue;
             QtdNew := QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
             If ((QtdOld - QtdNew) <> 0) Then
             Begin
                //AL_6  
                OperComum.LimpaParametros(QryAltOperacaoPendente);
                QryAltOperacaoPendente.ParamByName('QTDEPENDENTE').AsFloat   :=
                            (QryConsulta.FieldByName('QTDEOPERACAO').OldValue -
                             QryConsulta.FieldByName('QTDEOPERACAO').AsFloat);
                QryAltOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                             QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
                QryAltOperacaoPendente.ExecSQL;
             End
             Else
             Begin
                //AL_6  
                OperComum.LimpaParametros(QryDelOperacaoPendente);
                QryDelOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
                QryDelOperacaoPendente.ExecSQL;
             End;
          End;
          QryConsulta.Next;
       End;

       If bAlteraPendencia Then
       Begin
          If DBGrid1.FixedCols = 5 Then
             QryConsulta.ApplyUpdates;

          if not FinanceiroPendencia then
             Raise Exception.Create('Probelmas com o registro Financeiro dessa Pendência.');
       End;

       QryConsulta.First;
       QryConsulta.EnableControls;

   //AL_6  
       If DtmBaseDados.dbBaseDados.InTransaction Then
          DtmBaseDados.dbBaseDados.Commit;

       Result := True;

     except on E: Exception do
        begin
           If DtmBaseDados.dbBaseDados.InTransaction Then
              DtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Não é possível lançar essa Operação.'+#13+
                  E.Message,'Mensagem do Sistema', mtWarning ,[MbOk],0);
           Result := False;
        end;
     End;
   finally
     OperComum.LimpaParametros(QryInsOperacaoInvest);
     OperComum.LimpaParametros(QryBuscaInvestimento);
     OperComum.LimpaParametros(QryInsertOprAcao);
     OperComum.LimpaParametros(QryDelOperacaoPendente);
     OperComum.LimpaParametros(QryAltOperacaoPendente);
   end;
end;

function TfrmPendenciaBolsa.GravaOperPendenteLiquidada : Boolean;
begin
   QryConsulta.DisableControls;
   QryConsulta.First;
   try
      Try
         If Not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;
         While Not QryConsulta.EOF Do
         Begin
            With QryInsOperacaoInvest Do
            Begin
               Close;
               ParamByname('IDOPERACAOINVEST').AsInteger  :=
                            LeUltRegistro(Nil,'OPERACAOINVEST');
               ParamByname('IDCORRETVALORES').AsInteger   :=
                            QryConsulta.FieldByname('IDCORRETVALORES').AsInteger;
               ParamByname('MOECODIGO').AsInteger         :=
                            QryConsulta.FieldByname('MOECODIGO').AsInteger;
               ParamByname('IDCARTEIRAINVEST').AsInteger  :=
                            QryConsulta.FieldByname('IDCARTEIRAINVEST').AsInteger;
               ParamByname('IDINVESTIMENTO').AsInteger    :=
                            QryConsulta.FieldByname('IDINVESTIMENTO').AsInteger;
               ParamByname('IDTIPOINVEST').AsInteger      :=
                            QryConsulta.FieldByname('IDTIPOINVEST').AsInteger;
               ParamByname('IDTIPOOPERACAO').AsInteger    := pRPI.IDTIPOOPERLIQPEND;
               ParamByname('DATAOPERACAO').AsDateTime     :=
                            QryConsulta.FieldByname('DATAOPERACAO').AsDateTime;
               ParamByname('NUMDOCUMENTO').AsString       :=
                            QryConsulta.FieldByname('NUMDOCUMENTO').AsString;
               ParamByname('QTDEOPERACAO').AsFloat        :=
                            QryConsulta.FieldByname('QTDEOPERACAO').AsFloat;
               ParamByname('PRECOUNITOPERACAO').AsFloat   :=
                            QryConsulta.FieldByname('PRECOUNITOPERACAO').AsFloat;
               ParamByname('VLROPERACAO').AsFloat         :=
                            QryConsulta.FieldByname('VLROPERACAO').AsFloat;
               ParamByname('DATAVENCOPER').AsDateTime     :=
                            QryConsulta.FieldByname('DATAVENCOPER').AsDateTime;
               ParamByname('IDFORCLI').AsInteger          :=
                            QryConsulta.FieldByname('IDFORCLI').AsInteger;
               ParamByname('IDLOTE').AsString             :=
                            QryConsulta.FieldByname('IDLOTE').AsString;
               ParamByname('IDOPERACAOORIGEM').AsInteger  :=
                            QryConsulta.FieldByname('IDOPERACAOORIGEM').AsInteger;
               //AL_6  
               ParamByname('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
               ExecSQL;
               Close;
            End;
            QryOperacaoPendente.ApplyUpdates;
            QryConsulta.Next;
         End;

         QryConsulta.First;

         if not FinanceiroPendencia then
            Raise Exception.Create('Não foi Possível Lançar o Financeiro desta Pendência');

         //AL_6  
         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Commit;

         Result := True;

      Except
         //AL_6
         if DtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         Result := False;
      End;
   finally
      QryConsulta.EnableControls;
   end;
end;

function  TfrmPendenciaBolsa.Natureza(IDORIGEM : Integer) : String;
begin
   //AL_6  
   OperComum.LimpaParametros(QryOperacaoInvest);
   QryOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger := IDORIGEM;
   QryOperacaoInvest.Open;
   Result := QryOperacaoInvest.FieldByName('NATUREZAOPERACAO').AsString;
   OperComum.LimpaParametros(QryOperacaoInvest);
end;

function TfrmPendenciaBolsa.TestaMenorData(dData, dDataVenc : TDateTime)  : Boolean;
begin
   //AL_6  
   OperComum.LimpaParametros(QryTestaMenorData);
   QryTestaMenorData.ParamByName('IDCORRETVALORES').AsInteger   := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
   QryTestaMenorData.ParamByName('DATAOPERACAO').AsDateTime     := dData;
   //AL_5
   QryTestaMenorData.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
   QryTestaMenorData.Open;
   Result := True;
   While Not QryTestaMenorData.Eof Do
   Begin
      If (dDataVenc > QryTestaMenorData.FieldbyName('DATAVENCOPER').AsDateTime) Then
          Result := False;
      QryTestaMenorData.Next;
   End;
   OperComum.LimpaParametros(QryTestaMenorData);
end;

Procedure  TfrmPendenciaBolsa.DeletaQtdZeradas;
var i : integer;
begin
   //AL_6  
   Try
     i := 1;
     While i = 1 Do
     Begin
        //AL_6  
        OperComum.LimpaParametros(QryTestaQtdZerada);
        QryTestaQtdZerada.ParamByName('IDCORRETVALORES').AsInteger  :=
                             QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
        QryTestaQtdZerada.ParamByName('DATAOPERACAO').AsDateTime    := StrToDate(dbDtaOperacao.Text);
        QryTestaQtdZerada.ParamByName('DATAVENCOPER').AsDateTime    := StrToDate(dblLiquidacao.Text);
        QryTestaQtdZerada.ParamByName('IDOPERACAOORIGEM').AsInteger :=
                             QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
        QryTestaQtdZerada.ParamByName('IDTIPOOPERACAO').AsInteger   := pRPI.IDTIPOOPERLIQPEND;
        //AL_5
        QryTestaQtdZerada.ParamByName('IDPLANPREVCTBPATR').AsInteger:= StrToInt(dblkPlanPatro.LookupValue);
        QryTestaQtdZerada.Open;
        If Not QryTestaQtdZerada.Eof Then
        Begin
           //AL_6  
           //Delete OperacaoInvest (Operacao Pendente)
           OperComum.LimpaParametros(QryDelOperacaoInvestPend);
           QryDelOperacaoInvestPend.ParamByName('DATAVENCOPER').AsDateTime    :=
                             QryTestaQtdZerada.FieldByName('DATAVENCOPER').AsDateTime;;
           QryDelOperacaoInvestPend.ParamByName('IDOPERACAOINVEST').AsInteger :=
                             QryTestaQtdZerada.FieldByName('IDOPERACAOINVEST').AsInteger;
           QryDelOperacaoInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger   := pRPI.IDTIPOOPERLIQPEND;
           QryDelOperacaoInvestPend.ExecSql;
        End
        Else
           i := 2;
     End;
   //AL_6  
   finally
     OperComum.LimpaParametros(QryDelOperacaoInvestPend);
     OperComum.LimpaParametros(QryTestaQtdZerada);
   end;  
end;

procedure TfrmPendenciaBolsa.GuardaVariaveis;
begin
    iIDCORRETVALORES   := QryConsulta.FieldByname('IDCORRETVALORES').AsInteger;
    iMOECODIGO         := QryConsulta.FieldByname('MOECODIGO').AsInteger;
    iIDCARTEIRAINVEST  := QryConsulta.FieldByname('IDCARTEIRAINVEST').AsInteger;
    iIDINVESTIMENTO    := QryConsulta.FieldByname('IDINVESTIMENTO').AsInteger;
    iIDTIPOINVEST      := QryConsulta.FieldByname('IDTIPOINVEST').AsInteger;
    iIDTIPOOPERLIQPEND := pRPI.IDTIPOOPERLIQPEND;
    dDATAOPERACAO      := QryConsulta.FieldByname('DATAOPERACAO').AsDateTime;
    dDATAVENCOPER      := QryConsulta.FieldByname('DATAVENCOPER').AsDateTime;
    sNUMDOCUMENTO      := QryConsulta.FieldByname('NUMDOCUMENTO').AsString;
    fQTDEOPERACAO      := QryConsulta.FieldByname('QTDEOPERACAO').AsFloat;
    fPRECOUNITOPERACAO := QryConsulta.FieldByname('PRECOUNITOPERACAO').AsFloat;
    fVLROPERACAO       := QryConsulta.FieldByname('VLROPERACAO').AsFloat;
    iIDFORCLI          := QryConsulta.FieldByname('IDFORCLI').AsInteger;
    sIDLOTE            := QryConsulta.FieldByname('IDLOTE').AsString;
    iIDOPERACAOORIGEM  := QryConsulta.FieldByname('IDOPERACAOORIGEM').AsInteger;
end;

function TfrmPendenciaBolsa.BuscaPlanilhaOrigem(Var Plano : Integer) : Integer;
begin
   With QryBuscaPlanilhaOrigem Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT DISTINCT                                                              ');
      Sql.Add('       HC.PLNCODIGO, OI.CODDOCUMENTO, HC.PLANO, OI.CODFINANCEIRO             ');
      Sql.Add('FROM   OPERACAOINVEST OI, OPRACAO OA, BOLSAVALORES BV,                 ');
      Sql.Add('        INVESTIMENTO IV, TIPOOPERACAO TI, MERCADO ME, ACAO AC,   ');
      Sql.Add('        ACOESXBOLSA AB,                                                   ');
      Sql.Add('     	(SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
      Sql.Add('	 FROM   DESPOPERINVEST DOI, TIPODESPINVEST TDI                           ');
      Sql.Add('	 WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST 	            AND     ');
      Sql.Add('	        TDI.NATUREZAOPERACAO NOT IN (''N'')                                 ');
      Sql.Add('	 GROUP BY DOI.IDOPERACAOINVEST) DS, HISTCARTINV HC                          ');
      Sql.Add('WHERE (OI.IDCARTEIRAGERENC IS NULL)                                  AND     ');

      //AL_6  
      If Trim(dblkPlanPatro.Text) <> '' Then
         Sql.Add('   (OI.IDPLANPREVCTBPATR  = '+
                  qryPlanoPatro.FieldByName('IDPLANPREVCTBPATR').AsString+')        AND     ')
      Else
         Sql.Add('   (OI.IDPLANPREVCTBPATR  > 0)                                    AND     ');

      If Trim(dblCorretora.Text) <> '' Then
         Sql.Add('   (OI.IDCORRETVALORES  = '+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+')       AND     ')
      Else
         Sql.Add('   (OI.IDCORRETVALORES > 0)                                       AND     ');

      If Trim(dbDtaOperacao.Text) <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');
      Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND ');
      Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	    AND ');
      Sql.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO)      AND ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	    AND ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND ');
      Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)              AND ');
      Sql.Add('      (AB.IDACAO           = AC.IDACAO)              AND ');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)      AND ');
      Sql.Add('      (HC.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)    AND ');
      Sql.Add('      (HC.TIPMOVCARTINV    = ''OPE'')                AND ');
      Sql.Add('      (HC.PLNCODIGO IS NOT NULL)                         ');
      Open;
      Plano  := FieldByName('PLANO').AsInteger;
      Result := FieldByName('PLNCODIGO').AsInteger;
      Close;
   End;
end;

function TfrmPendenciaBolsa.FinanceiroAtual(sTipo: String = 'O'): Boolean;
Var
  wHistorico, wMensErro, wSQL, wRecPagBol, wTipoRecDesBol :String;
  wQtdCotaIni, wPlanilha, wDocumCont, wPlanilhaAC, wIdOperacao,
  wOprContabil, wPlano, wPlanoAC, wIdDespesa, wFatura, wMoeCodigo, wIdHistCartInv, wIdTipoDespInvest:Integer;
  wNoDoc    :Extended;
  wValorAContabilizar, wTotalContab : Double;
  bCriaLancto: boolean;
begin
   // Trata variáveis da Integração Contábil-Financeira
   wPlanilhaAC  :=-1;
   wPlanoAC     :=-1;
   wDocumContAC :=-1;

   bCriaLancto    := true;
   wTipoRecDesBol := '';

   wTotalContab   := Abs(wTotalLiquido);
   If (wTotalLiquido < 0) Then
       wRecPagBol   := 'R'
   Else
       wRecPagBol := 'P';

   // Faz Todas as Despesas
   wTipoRecDesBol:= wRecPagBol;

   if (qryBuscaBoleta.FieldByName('PLNCODIGO').IsNull) or
      (sTipo = 'O') then
   begin
      wPlanilhaAC  := -1;
      wPlanoAC     := -1;
   end
   else
   begin
      wPlanoAC     := qryBuscaBoleta.FieldByName('PLANO').AsInteger;
      wPlanilhaAC  := qryBuscaBoleta.FieldByName('PLNCODIGO').AsInteger;
   end;

   QryConsulta.DisableControls;

   try
      try
         QryConsulta.First;

         While Not QryConsulta.Eof Do
         Begin
            If QryConsulta.FieldByName('QTDEOPERACAO').AsFloat = 0 Then
               QryConsulta.Next
            Else
            Begin
               //AL_3
               If OperComum.LancaOperPendRV(QryConsulta.FieldByName('IDCORRETVALORES').AsInteger,
                                            QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                            Sistema.IdEmpresa,
                                            79,
                                            QryConsulta.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                                            pRPI.IDTIPOOPERLIQPEND,
                                            QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                                            QryConsulta.FieldByName('IDFORCLI').AsInteger,
                                            QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            -1,
                                            //AL_6
                                            StrToInt(dblkPlanPatro.LookupValue),
                                            QryConsulta.FieldByName('CODTIPOACAO').AsString,
                                            QryConsulta.FieldByName('IDLOTE').AsString,
                                            QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                                            wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                                            wTotalContab,
                                            QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                                            QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                                            wPlanoAC, wPlanilhaAC, wDocumContAC,
                                            wMensErro) < 0 Then
               begin
                  MsgDlg('Ocorreu um problema na contabilização da operação : '+
                        wMensErro,'Mensagem do Sistema', mtWarning, [mbOk], 0);
                  Result := False;
                  Exit;
               end;

               // Atualiza CodDocumento as Operações de Pendência
               if wDocumContAC > 0 then
               begin
                  if sTipo = 'O' then
                  begin
                     // Grava Documento na Operação de Pendencia
                     OperComum.LimpaParametros(qryAtuFinContOperPend);
                     qryAtuFinContOperPend.ParamByName('IDBOLETA').AsString := qryBuscaBoleta.FieldByName('IDBOLETA').AsString;
                     qryAtuFinContOperPend.ParamByName('CODDOCUMENTO').AsInteger := wDocumContAC;
                     qryAtuFinContOperPend.ExecSQL;
                  end
                  else
                  begin
                     // Grava Documento na Boleta ( Operação Original )
                     OperComum.LimpaParametros(qryAtualizaBoleta);
                     qryAtualizaBoleta.ParamByName('IDBOLETA').AsString := qryBuscaBoleta.FieldByName('IDBOLETA').AsString;
                     qryAtualizaBoleta.ParamByName('CODDOCUMENTO').AsInteger := wDocumContAC;
                     qryAtualizaBoleta.ExecSQL;
                  end;
               end;
               QryConsulta.Last;
            End;
         End;
         Result := True;
      except
         Result := False;
      end;
   finally
      QryConsulta.EnableControls;
   end;
end;

function TfrmPendenciaBolsa.FinanceiroPendencia: Boolean;
Var
  wHistorico, wMensErro, wSQL, wRecPagBol, wTipoRecDesBol :String;
  wQtdCotaIni, wPlanilha, wDocumCont, wPlanilhaAC, wIdOperacao,
  wOprContabil, wPlano, wPlanoAC, wIdDespesa, wFatura, wMoeCodigo, wIdHistCartInv, wIdTipoDespInvest:Integer;
  wNoDoc    :Extended;
  wValorAContabilizar, wTotalContab : Double;
  bCriaLancto: boolean;
begin
   // Trata variáveis da Integração Contábil-Financeira
   wPlanilhaAC  :=-1;
   wPlanoAC     :=-1;
   wDocumContAC :=-1;

   bCriaLancto    := true;
   wTipoRecDesBol := '';

   wTotalContab   := Abs(wTotalLiquido);
   If (wTotalLiquido < 0) Then
       wRecPagBol   := 'R'
   Else
       wRecPagBol := 'P';

   wTipoRecDesBol:= wRecPagBol;

   QryConsulta.DisableControls;

   try
      try
         QryConsulta.First;

         While Not QryConsulta.Eof Do
         Begin
            If QryConsulta.FieldByName('QTDEOPERACAO').AsFloat = 0 Then
               QryConsulta.Next
            Else
            Begin
               //AL_3
               If OperComum.LancaOperPendRV(QryConsulta.FieldByName('IDCORRETVALORES').AsInteger,
                                            QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger,
                                            Sistema.IdEmpresa,
                                            79,
                                            QryConsulta.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryConsulta.FieldByName('IDINVESTIMENTO').AsInteger,
                                            pRPI.IDTIPOOPERLIQPEND,
                                            QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                                            QryConsulta.FieldByName('IDFORCLI').AsInteger,
                                            QryConsulta.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            -1,
                                            //AL_6  
                                            StrToInt(dblkPlanPatro.LookupValue),                                            
                                            QryConsulta.FieldByName('CODTIPOACAO').AsString,
                                            QryConsulta.FieldByName('IDLOTE').AsString,
                                            QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                                            wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                                            wTotalContab,
                                            QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                                            QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                                            wPlanoAC, wPlanilhaAC, wDocumContAC,
                                            wMensErro) < 0 Then
               begin
                  MsgDlg('Ocorreu um erro na contabilisação da operação : '+
                        wMensErro,'Mensagem do Sistema', mtWarning, [mbOk], 0);
                  Result := False;
                  Exit;
               end;

               QryConsulta.Last;
            End;
         End;

         // Atualiza CodDocumento as Operações de Pendência
         if wDocumContAC > 0 then
         begin
            // Grava Documento nas Operação de Pendencia da Pendência
            OperComum.LimpaParametros(qryAtuFinContOperPend);
            qryAtuFinContOperPend.ParamByName('IDBOLETA').AsString  :=
                                  qryBuscaBoleta.FieldByName('IDBOLETA').AsString;
            qryAtuFinContOperPend.ParamByName('CODDOCUMENTO').AsInteger := wDocumContAC;
            qryAtuFinContOperPend.ExecSQL;
         end;
         Result := True;
      except
         Result := False;
      end;
   finally
      QryConsulta.EnableControls;
   end;
end;

Function TfrmPendenciaBolsa.TestaOperacaoLiquida : Boolean;
Begin
   //AL_6  
   OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
   QryBuscaUltDtaOperInv.ParamByName('DATAOPERACAO').AsdateTime   := StrToDate(dbDtaOperacao.Text);
   QryBuscaUltDtaOperInv.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValoresIDCORRETVALORES.AsInteger;
   //AL_5
   QryBuscaUltDtaOperInv.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
   QryBuscaUltDtaOperInv.Open;

   QryConsulta.First;
   While Not QryConsulta.Eof Do
   Begin
      If ((QryConsultaDATAVENCOPER.AsDateTime <=
           QryBuscaUltDtaOperInv.FieldByName('DATAVENCOPER').AsDateTime) And
          (QryConsultaQTDEOPERACAO.AsFloat <> 0)) Then
      Begin
          //AL_6  
          OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
          Result := False;
          Exit;
      End;
      QryConsulta.Next;
   End;
   //AL_6  
   OperComum.LimpaParametros(QryBuscaUltDtaOperInv);
   Result := True;
End;

//AL_6  
procedure TfrmPendenciaBolsa.dblkPlanPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;

   OperComum.LimpaParametros(QryConsulta);
   
   if ((modified) and (Trim(dbDtaOperacao.Text) <> '') and (Trim(dblkPlanPatro.Text) <> '')) then
   begin
      OperComum.LimpaParametros(QryCorretValores);
      QryCorretValores.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryCorretValores.ParamByName('P_DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
      QryCorretValores.Open;
      If QryCorretValores.RecordCount = 1 Then
      Begin
         dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;
         dblCorretora.PerformSearch;

         OperComum.LimpaParametros(QryBoleta);
         QryBoleta.ParamByName('IDFORCLI').AsInteger :=
                            QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
         QryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
         QryBoleta.Open;

         If QryBoleta.RecordCount = 1 Then
         begin
            dblkBoleta.Text := QryBoleta.FieldByName('IDBOLETA').AsString;
            dblkBoleta.PerformSearch;
         end;

         OperComum.LimpaParametros(QryLiquidacao);
         QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                            QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
         //AL_4
         If Trim(dblkBoleta.Text) <> '' Then
            QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString  := QryBoleta.FieldByName('IDBOLETA').AsString;
         //AL_5
         QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
         QryLiquidacao.Open;

         AbreQry;
         TotalLiquidoDespesa;
         bAlteraPendencia := True;
         //AL_7 = Fim
      End;
   End;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblkPlanPatroEnter(Sender: TObject);
begin
  inherited;
   wValAnt := dblkPlanPatro.LookupValue;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblkPlanPatroExit(Sender: TObject);
begin
  inherited;

   if ((Not bModif) and (Trim(dbDtaOperacao.Text) <> '') and (Trim(dblkPlanPatro.Text) <> '') and
       (wValAnt <> dblkPlanPatro.LookupValue)) then
   begin
      OperComum.LimpaParametros(QryCorretValores);
      QryCorretValores.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryCorretValores.ParamByName('P_DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
      QryCorretValores.Open;
      If QryCorretValores.RecordCount = 1 Then
      Begin
         dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;
         dblCorretora.PerformSearch;

         OperComum.LimpaParametros(QryBoleta);
         QryBoleta.ParamByName('IDFORCLI').AsInteger :=
                            QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
         QryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
         QryBoleta.Open;

         If QryBoleta.RecordCount = 1 Then
         begin
            dblkBoleta.Text := QryBoleta.FieldByName('IDBOLETA').AsString;
            dblkBoleta.PerformSearch;
         end;

         OperComum.LimpaParametros(QryLiquidacao);
         QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                            QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
         //AL_4
         If Trim(dblkBoleta.Text) <> '' Then
            QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString  := QryBoleta.FieldByName('IDBOLETA').AsString;
         //AL_5
         QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
         QryLiquidacao.Open;

         //AL_7
         AbreQry;
         TotalLiquidoDespesa;
         bAlteraPendencia := True;

      End;
   End;
   bModif := false;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblCorretoraCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   //AL_6
   bModif := modified;
   OperComum.LimpaParametros(QryConsulta);
   //AL_6
   if ((modified) and (Trim(dbDtaOperacao.Text) <> '') and (Trim(dblkPlanPatro.Text) <> '') and
       (Trim(dblCorretora.Text) <> '')) then
   begin
      //AL_4
      OperComum.LimpaParametros(QryBoleta);
      QryBoleta.ParamByName('IDFORCLI').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
      QryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryBoleta.Open;
      //AL_6
      If QryBoleta.RecordCount = 1 Then
      begin
         dblkBoleta.Text := QryBoleta.FieldByName('IDBOLETA').AsString;
         dblkBoleta.PerformSearch;

         OperComum.LimpaParametros(QryLiquidacao);
         QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                              QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
         QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;
         //AL_5
         QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
         QryLiquidacao.Open;

         AbreQry;

         TotalLiquidoDespesa;

         bAlteraPendencia := True;         
      end;
   end;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblCorretoraEnter(Sender: TObject);
begin
  inherited;
   wValAnt := dblCorretora.LookupValue;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblCorretoraExit(Sender: TObject);
begin
  inherited;

   if ((Not bModif) and (Trim(dbDtaOperacao.Text) <> '') and  (Trim(dblkPlanPatro.Text) <> '') and
      (Trim(dblCorretora.Text) <> '') and (wValAnt <> dblCorretora.LookupValue)) then
   begin
      //AL_4
      OperComum.LimpaParametros(QryBoleta);
      QryBoleta.ParamByName('IDFORCLI').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
      QryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryBoleta.Open;
      //AL_6
      If QryBoleta.RecordCount = 1 Then
      begin
         dblkBoleta.Text := QryBoleta.FieldByName('IDBOLETA').AsString;
         dblkBoleta.PerformSearch;

         OperComum.LimpaParametros(QryLiquidacao);
         QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                              QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
         QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
         QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;
         //AL_5
         QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
         QryLiquidacao.Open;
         //AL_4

         AbreQry;

         TotalLiquidoDespesa;

         bAlteraPendencia := True;
      end;
   end;
   bModif := false;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblkBoletaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   //AL_6
   bModif := modified;

   OperComum.LimpaParametros(QryConsulta);

   if ((modified) and  (Trim(dbDtaOperacao.Text) <> '') and (Trim(dblkPlanPatro.Text) <> '') and
       (Trim(dblCorretora.Text) <> '') and (Trim(QryBoleta.Text) <> '')) then
   begin
      OperComum.LimpaParametros(QryLiquidacao);
      QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                           QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
      QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;
      //AL_6
      //AL_5
      QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryLiquidacao.Open;

      AbreQry;

      bAlteraPendencia := True;

      TotalLiquidoDespesa;
   end;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblkBoletaEnter(Sender: TObject);
begin
  inherited;
   wValAnt := dblkBoleta.LookupValue;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblkBoletaExit(Sender: TObject);
begin
  inherited;

   if ((Not bModif) and (Trim(dbDtaOperacao.Text) <> '') and  (Trim(dblkPlanPatro.Text) <> '') and
      (Trim(dblCorretora.Text) <> '') and (Trim(dblkBoleta.Text) <> '') and (wValAnt <> dblkBoleta.LookupValue)) then
   begin
      OperComum.LimpaParametros(QryLiquidacao);
      QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger :=
                           QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
      QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
      QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString     := QryBoleta.FieldByName('IDBOLETA').AsString;
      //AL_6
      //AL_5
      QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
      QryLiquidacao.Open;

      AbreQry;
      TotalLiquidoDespesa;
      bAlteraPendencia := True;
   end;
   bModif := false;
end;

procedure TfrmPendenciaBolsa.dblLiquidacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if modified then
   begin
      If dblLiquidacao.Text <> '' Then
      Begin
         AbreQryConsLiq;
         BtAltDet.Enabled := False;
         sTipoOperacao    := 'L';
      End
      Else
      Begin
         AbreQry;
         bAlteraPendencia := True;
      End;
      TotalLiquidoDespesa;
   End;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
end;

procedure TfrmPendenciaBolsa.dblLiquidacaoEnter(Sender: TObject);
begin
  inherited;
   wValAnt := dblLiquidacao.Text;
end;

//AL_6
procedure TfrmPendenciaBolsa.dblLiquidacaoExit(Sender: TObject);
begin
  inherited;
   if ((not bModif) or ((bModif) and (wValAnt = dblLiquidacao.Text))) then
   begin
      If ((dblLiquidacao.Text <> '') and (wValAnt <> dblLiquidacao.Text)) Then
      Begin
         AbreQryConsLiq;
         BtAltDet.Enabled := False;
         sTipoOperacao    := 'L';
      End
      Else
      Begin
         AbreQry;
         bAlteraPendencia := True;
      End;
      TotalLiquidoDespesa;
   End;
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   bModif := false;
end;

//AL_7
function TfrmPendenciaBolsa.BuscaPendencia(iTipo: Byte; bRefaz: Boolean): Boolean;
var sPlano, sCorret, sBoleta, sDataLiq: String;
begin
   try
      if bRefaz then
         OperComum.LimpaParametros(QryConsulta);

      sPlano   := Trim(dblkPlanPatro.Text);
      sCorret  := Trim(dblCorretora.Text);
      sBoleta  := Trim(dblkBoleta.Text);
      sDataLiq := Trim(dblLiquidacao.Text);

      if (Trim(dbDtaOperacao.Text) <> '') then
      begin
         if iTipo < 1 then
         begin
            OperComum.LimpaParametros(qryPlanoPatro);
            qryPlanoPatro.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
            qryPlanoPatro.Open;
            if qryPlanoPatro.Locate('PLANPRVCONTABPATRO', sPlano, []) then
            begin
               dblkPlanPatro.Text := sPlano;
               dblkPlanPatro.PerformSearch;
            end
            else
            begin
               if qryPlanoPatro.RecordCount = 1 then
               begin
                  dblkPlanPatro.Text := qryPlanoPatro.FieldByName('PLANPRVCONTABPATRO').AsString;
                  dblkPlanPatro.PerformSearch;
               end;
            end;
         end;

         if (Trim(dblkPlanPatro.Text) <> '') then
         begin
            if iTipo < 2 then
            begin
               OperComum.LimpaParametros(QryCorretValores);
               QryCorretValores.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
               QryCorretValores.ParamByName('P_DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
               QryCorretValores.Open;
               if QryCorretValores.Locate('SGLCORRETVALORES', sCorret, []) then
               begin
                  dblCorretora.Text := sPlano;
                  dblCorretora.PerformSearch;
               end
               else
               begin
                  if QryCorretValores.RecordCount = 1 then
                  begin
                     dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;
                     dblCorretora.PerformSearch;
                  end;
               end;
            end;

            if Trim(dblCorretora.Text) <> '' then
            begin
               if iTipo < 3 then
               begin
                  OperComum.LimpaParametros(QryBoleta);
                  QryBoleta.ParamByName('IDFORCLI').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
                  QryBoleta.ParamByName('DDATAREF').AsString  := dbDtaOperacao.Text;
                  QryBoleta.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
                  QryBoleta.Open;
                  if QryBoleta.Locate('IDBOLETA', sBoleta, []) then
                  begin
                     dblkBoleta.Text := sBoleta;
                     dblkBoleta.PerformSearch;
                  end
                  else
                  begin
                     if QryBoleta.RecordCount = 1 then
                     begin
                        dblkBoleta.Text := QryBoleta.FieldByName('IDBOLETA').AsString;
                        dblkBoleta.PerformSearch;
                     end;
                  end;
               end;

               if Trim(dblkBoleta.Text) <> '' then
               begin
                  if iTipo < 4 then
                  begin
                     OperComum.LimpaParametros(QryLiquidacao);
                     QryLiquidacao.ParamByName('IDCORRETVALORES').AsInteger := QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
                     QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
                     QryLiquidacao.ParamByName('NUMDOCUMENTO').AsString  := QryBoleta.FieldByName('IDBOLETA').AsString;
                     QryLiquidacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := StrToInt(dblkPlanPatro.LookupValue);
                     QryLiquidacao.Open;

                     if QryLiquidacao.Locate('DATAVENCOPER', sDataLiq, []) then
                     begin
                        dblLiquidacao.Text := sDataLiq;
                        dblLiquidacao.PerformSearch;
                     end
                     else
                     begin
                        if QryLiquidacao.RecordCount = 1 then
                        begin
                           dblLiquidacao.Text := QryLiquidacao.FieldByName('DATAVENCOPER').AsString;
                           dblLiquidacao.PerformSearch;
                        end;
                     end;
                  end;
               end
               else
               begin
                  // Se a Boleta não está preenchida, limpa os combos seguintes e a consulta
                  OperComum.LimpaParametros(QryLiquidacao);
                  QryLiquidacao.Open;
                  OperComum.LimpaParametros(QryConsulta);
                  QryConsulta.Open;
               end;
            end
            else
            begin
               // Se a Corretora não está preenchida, limpa os combos seguintes e a consulta
               OperComum.LimpaParametros(QryBoleta);
               QryBoleta.Open;
               OperComum.LimpaParametros(QryLiquidacao);
               QryLiquidacao.Open;
               OperComum.LimpaParametros(QryConsulta);
               QryConsulta.Open;
            end;
         end
         else
         begin
            // Se o Plano não está preenchido, limpa os combos seguintes e a consulta
            OperComum.LimpaParametros(QryCorretValores);
            QryCorretValores.Open;
            OperComum.LimpaParametros(QryBoleta);
            QryBoleta.Open;
            OperComum.LimpaParametros(QryLiquidacao);
            QryLiquidacao.Open;
            OperComum.LimpaParametros(QryConsulta);
            QryConsulta.Open;
         end;
      end
      else
      begin
         // Se a Data não está preenchida, limpa os combos seguintes e a consulta
         OperComum.LimpaParametros(qryPlanoPatro);
         qryPlanoPatro.Open;
         OperComum.LimpaParametros(QryCorretValores);
         QryCorretValores.Open;
         OperComum.LimpaParametros(QryBoleta);
         QryBoleta.Open;
         OperComum.LimpaParametros(QryLiquidacao);
         QryLiquidacao.Open;
         OperComum.LimpaParametros(QryConsulta);
         QryConsulta.Open;
      end;
   except

   end;

end;

end.
