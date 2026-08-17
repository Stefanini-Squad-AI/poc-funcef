//------------------------------------------------------------------
// Sistema  .: INVESTIMENTOS
// Objetivo .: Formulário para executar a Pendência de Bolsa, criação, liquidação e consulta

// Form     .: FrmPendenciaBolsa - Unit .: FCadPendenciaBolsa
// Data     .: 20/11/2000
// Autor    .: Ricardo
//------------------------------------------------------------------
unit FCadPendenciaBolsaSub;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, DBGrids, Mask, DBCtrls, Db, DBTables,
  Wwquery, Wwdatsrc, wwdbedit, Wwdbspin, ComCtrls, PpPrvDlg, PPforms, Menus,
  MontaSelect, Wwdbigrd, Wwdbgrid, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmPendenciaBolsaSub = class(TfrmSairAjuda)
    Panel2: TPanel;
    Panel3: TPanel;
    DsConsulta: TwwDataSource;
    QryAux: TwwQuery;
    QryBuscaDespesa: TwwQuery;
    QryBuscaDespesaIDTIPODESPINVEST: TFloatField;
    QryBuscaDespesaMOECODIGO: TFloatField;
    QryBuscaDespesaDESCTIPODESPINV: TStringField;
    QryBuscaDespesaNATUREZAOPERACAO: TStringField;
    QryBuscaCredor: TwwQuery;
    QryBuscaCredorIDPESSOA: TFloatField;
    QryBuscaCredorRAZAOSOCIAL: TStringField;
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
    QryConsolidado: TwwQuery;
    QryConsolidadoDESCTIPODESPINV: TStringField;
    QryConsolidadoVLRDESPOPER: TFloatField;
    DtsConsolidado: TwwDataSource;
    QryBoleta: TwwQuery;
    QryDespesasOperacaoNOME: TStringField;
    QryDespesasOperacaoDESCTIPODESPINV: TStringField;
    PopDespesas: TPopupMenu;
    Alterar1: TMenuItem;
    MSBuscaCredor: TMontaSelect;
    QryConsulta: TwwQuery;
    qryAtualizaBoleta: TwwQuery;
    QryAtualizaOperacoes: TwwQuery;
    QryCorretagemDevol: TwwQuery;
    QryCorretValores: TwwQuery;
    QryCorretValoresIDCORRETVALORES: TFloatField;
    QryCorretValoresSGLCORRETVALORES: TStringField;
    DsFinalizar: TwwDataSource;
    DBGrid1: TwwDBGrid;
    updConsulta: TUpdateSQL;
    QryOperacaoPendente: TwwQuery;
    DsOperacaoPendente: TwwDataSource;
    UpdOperacaoPendente: TUpdateSQL;
    QryParamInvest: TwwQuery;
    Panel7: TPanel;
    QryUpdOperacaoInvest: TwwQuery;
    QryDelOperacaoPendente: TwwQuery;
    QryOperacaoInvest: TwwQuery;
    Panel9: TPanel;
    ProgressBar1: TProgressBar;
    QryInsOperacaoInvest: TwwQuery;
    QryBuscaTipoOper: TwwQuery;
    QryBuscaTipoOperIDTIPOINVEST: TFloatField;
    QryBuscaTipoOperIDTIPOOPERACAO: TFloatField;
    QryBuscaTipoOperIDMERCADO: TFloatField;
    QryBuscaTipoOperDESCTIPOOPERACAO: TStringField;
    QryBuscaTipoOperNATUREZAOPERACAO: TStringField;
    QryBuscaTipoOperTIPOCUSTODIA: TStringField;
    QryBuscaTipoOperVENCIMENTO: TFloatField;
    QryBuscaTipoOperTIPCREDOR: TStringField;
    QryBuscaTipoOperFLGTRANSF: TStringField;
    QryBuscaTipoOperFLGCORRET: TStringField;
    QryBuscaTipoOperFLGORDMOVINV: TStringField;
    QryBuscaTipoOperFLGTRATAIR: TStringField;
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
    Label2: TLabel;
    dbDtaOperacao: TCMDateTimePicker;
    QryOperacaoPendenteIDOPERACAOINVEST: TFloatField;
    QryAltOperacaoPendente: TwwQuery;
    QryBuscaQtdOperPendente: TwwQuery;
    QryDelOperacaoInvest: TwwQuery;
    QryUpdOperacaoPendente: TwwQuery;
    QryHistCartInv: TwwQuery;
    QryBuscaUltDataOper: TwwQuery;
    QryBuscaOperPendente: TwwQuery;
    QryHistCartInvVLRMOVCARTINV: TFloatField;
    QryHistCartInvQTDEMOVINVCART: TFloatField;
    QryHistCartInvPLNCODIGO: TDateTimeField;
    QryHistCartInvCODDOCUMENTO: TFloatField;
    QryHistCartInvPLANO: TFloatField;
    QryUpdOperacaoInvest_2: TwwQuery;
    QryUpdOperInvestNull: TwwQuery;
    dblLiquidacao: TwwDBLookupCombo;
    Label3: TLabel;
    QryLiquidacao: TwwQuery;
    QryLiquidacaoDATAVENCOPER: TDateTimeField;
    DsLiquidacao: TwwDataSource;
    QryDelOperacaoInvestPend: TwwQuery;
    QryTestaMenorData: TwwQuery;
    DateTimeField1: TDateTimeField;
    QryTestaQtdZerada: TwwQuery;
    DateTimeField2: TDateTimeField;
    QryTestaQtdZeradaIDOPERACAOINVEST: TFloatField;
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
    QryBuscaDataVenc: TwwQuery;
    QryVerOperInvPendente: TwwQuery;
    QryVerDtaVenc: TwwQuery;
    QryOperacaoPendenteVLRPENDENTE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryConsultaAfterOpen(DataSet: TDataSet);
    procedure QryDespesasOperacaoUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure QryDespesasOperacaoBeforePost(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure GridDespesasColExit(Sender: TObject);
    procedure QryDespesasOperacaoAfterPost(DataSet: TDataSet);
    procedure GridDespesasExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure QryDespesasOperacaoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure SB1Click(Sender: TObject);
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
    procedure BtDelDetClick(Sender: TObject);
    procedure QryConsultaVLROPERACAOValidate(Sender: TField);
    procedure dblCorretoraChange(Sender: TObject);
    procedure dblCorretoraExit(Sender: TObject);
    procedure dblLiquidacaoChange(Sender: TObject);
    procedure dbDtaOperacaoChange(Sender: TObject);
  private

     procedure AbreQry;
     procedure MovimentaCarteira;
     procedure ContabilizaPendencia;
     procedure MontaQryConsulta(wTotalLiquido : Double);
     procedure MontaQryConsultaLiq(wTotalLiquido : Double);
     procedure AbreQryLiq;
     procedure OperacaoNormal;
     procedure TotalLiquidoDespesa;
     procedure AbreQryConsLiq;
     procedure OperacaoPendenciaLiquidada;
     procedure DeletaQtdZeradas;
     procedure GuardaVariaveis;
     procedure LancaOperacaoPendente;          

     function  ExcluirPendencia    : Boolean;
     function  ExcluirLiqPendencia : Boolean;
     function  GravaOperNormal     : Boolean;
     function  GravaOperPendente   : Boolean;
     function  VerColunaAlterada   : Boolean;
     function  VerificaQtde        : Boolean;
     function  GravaOperPendenteLiquidada : Boolean;
     function  TestaExisteIDOperPendente  : Boolean;
     function  TestaMenorData(dData : TDateTime)  : Boolean;

     function  CorretagemLiquida   : Double;
     function  ApuraValorLiquido   : Double;

     function  Natureza(IDORIGEM : Integer) : String;

     function  CalculaVencimento(DataInicial:TDateTime;
                                              DiasUteis:Integer):TDateTime;

    { Private declarations }
  public
    { Public declarations }
     iIDCorretora : Integer;
     dData        : TDateTime;
  end;

var frmPendenciaBolsaSub: TfrmPendenciaBolsaSub;

  Const
    wMensagem: Array[-9..0] Of String =
           (' ',
            ' ',
            'Não foi possível efetuar o lançamento de CAP/CAR.',
            'Não foi possível efetuar o lançamento contábil.',
            'Não foi encontrado Padrão de Lançamento que atenda os parâmetros passados.',
            'Erro de gravação.',
            'Ambigüidade no Padrão de Lançamento.',
            'Operação com valor igual a "ZERO".',
            'Tipo de Operação não gera Lançamento Contábil nem Lançamento CAP/CAR.',
            'Lançamento(s) realizados com sucesso.');

implementation

{$R *.DFM}

Uses FDmRelatorios, USistema, UOperacaoInvest, UOperComum, DOpercomum, UBibliotecaInvest,
     UFuncoesRendaFixa, DBasedados, UMensErro, UDataBase;

Var wTotalLiquido, wTotalDespesa : Double;
    bAlteraPendencia, bTestaPendencia, bOK, bTrocaLine : Boolean;
    sTipoOperacao : String; //P -> Pendencia, N -> Normal
    iAlteracao    : Integer;
    bTrue         : Boolean;
    iIDCORRETVALORES, iMOECODIGO, iIDCARTEIRAINVEST, iIDINVESTIMENTO, iIDTIPOINVEST,
    iIDTIPOOPERLIQPEND, iIDFORCLI, iIDOPERACAOORIGEM : Integer;
    fQTDEOPERACAO, fPRECOUNITOPERACAO, fVLROPERACAO : Double;
    dDATAVENCOPER, dDATAOPERACAO : TDateTime;
    sNUMDOCUMENTO, sIDLOTE : String;

procedure TfrmPendenciaBolsaSub.FormShow(Sender: TObject);
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

  QryCorretValores.Close;
  QryCorretValores.ParamByName('P_DATAOPERACAO').AsDateTime := StrToDate(dbDtaOperacao.Text);
  QryCorretValores.Open;

  QryParamInvest.Open;

  If iIDCorretora <> 0 Then
  Begin
     QryCorretValores.Locate('IDCORRETVALORES',iIDCorretora,[]);
    { dblCorretora.Text := QryCorretValores.FieldByName('SGLCORRETVALORES').AsString;}
     QryLiquidacao.Close;
//     QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                          QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
     QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
     QryLiquidacao.Open;
  End
  Else
  Begin
     QryLiquidacao.Close;
//     QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                          QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;

     QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
     QryLiquidacao.Open;
  End;
  
  AbreQry;

  QryBuscaDespesa.Open;
  QryDespesasOperacao.Open;

  bbtnConfirmar.Enabled   := False;
  bbtnCancelar.Enabled    := False;
end;

procedure TfrmPendenciaBolsaSub.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryConsulta.Close;
  QryConsolidado.Close;
  QryDespesasOperacao.Close;
  QryBuscaDespesa.Close;
  QryBuscaCredor.Close;
end;

procedure TfrmPendenciaBolsaSub.QryConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
   TotalLiquidoDespesa;
end;

procedure TfrmPendenciaBolsaSub.QryDespesasOperacaoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  inherited;
  If UpdateKind    = ukInsert Then Begin
     UpdateAction := uaSkip;
  End;
end;

procedure TfrmPendenciaBolsaSub.QryDespesasOperacaoBeforePost(DataSet: TDataSet);
begin
  inherited;
// Inicia uma Transaçao no Banco de Dados \\
  If Not DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmPendenciaBolsaSub.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bOK        := False;
  bTrocaLine := True;
// Confirma Cancelamento
  If (MsgDlg('Deseja realmente cancelar esta operação ?',
    'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo) Then
     Exit;

// Caso Esteja em uma Transacao Cancela a Mesma
  If DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.Rollback;

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   DBGrid1.Options       := DBGrid1.Options - [TwwDBgridOption(dgEditing)];
   DBGrid1.Font.Color    := clGray;
   DBGrid1.Color         := clSilver;
end;

procedure TfrmPendenciaBolsaSub.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Not bOK Then
  Begin
     MsgDlg('Falta confirmar a Operação.             ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Exit;
  End;
  Panel7.Caption  := '';
  If (sTipoOperacao = 'N') Then
  Begin
     If Not GravaOperNormal Then
     Begin
        MsgDlg('Não foi possível realizar a Operação.',
               'Mensagem do Sistema ',mtWarning,[mbOK],0);
        Exit;
     End;
  End
  Else If sTipoOperacao = 'P' Then
  Begin
     If Not GravaOperPendente Then
     Begin
        MsgDlg('Não foi possível realizar a Operação.',
               'Mensagem do Sistema ',mtWarning,[mbOK],0);
        Exit;
     End;
  End
  Else If sTipoOperacao = 'L' Then
  Begin
     If Not GravaOperPendenteLiquidada Then
     Begin
        MsgDlg('Não foi possível realizar a Operação.',
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
  QryLiquidacao.Close;
//  QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                    QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
  QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
  QryLiquidacao.Open;

  dblLiquidacao.Text := '';
  bTestaPendencia := True;
end;

procedure TfrmPendenciaBolsaSub.GridDespesasColExit(Sender: TObject);
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

procedure TfrmPendenciaBolsaSub.QryDespesasOperacaoAfterPost(DataSet: TDataSet);
Var
  wIdOperacao, wIdDespesa:Integer;
begin
// Heranca
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
// Aplica Alteracoes no Banco
  QryDespesasOperacao.ApplyUpdates;
  QryDespesasOperacao.CommitUpdates;

// Fecha e Abre a Query de Operacoes
  QryConsulta.Close;
  QryConsulta.Open;

  QryConsolidado.Close;
  QryConsolidado.ParamByName('NUMDOC').AsString :=
                 QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
  QryConsolidado.Open;
end;

procedure TfrmPendenciaBolsaSub.GridDespesasExit(Sender: TObject);
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

procedure TfrmPendenciaBolsaSub.bbtnSairClick(Sender: TObject);
begin
// Caso esteja em transacao mostra mensagem informando
  If DtmBaseDados.dbBaseDados.InTransaction Then Begin
     If (MsgDlg('As alterações não foram confirmadas. Deseja Sair ?',
                'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrYes) Then
         DtmBaseDados.dbBaseDados.Rollback
     Else
       Exit;
  End;
// Heranca
  inherited;
end;

procedure TfrmPendenciaBolsaSub.QryDespesasOperacaoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QryDespesasOperacao.CancelUpdates;
  QryDespesasOperacao.CommitUpdates;
end;

procedure TfrmPendenciaBolsaSub.FormCreate(Sender: TObject);
begin
  inherited;
  PpRegisterform(TppCustomPreviewer, Tppprintpreview);
end;

procedure TfrmPendenciaBolsaSub.SB1Click(Sender: TObject);
begin
  inherited;
// Executa a Pesquisa
  MSBuscaCredor.Executar;
// Teste de Retornou Algo
  If MSBuscaCredor.RetornouValor Then Begin
// Preenche os Dados 
    QryDespesasOperacao.FieldByName('IDFORCLI').AsString := MSBuscaCredor.ValoresChave[0];

  End;
end;

function TfrmPendenciaBolsaSub.CorretagemLiquida : Double   ;
begin
   Result := 0;
   QryCorretagemDevol.Close;
   QryCorretagemDevol.ParamByName('IDOPERACAOINVEST').AsInteger :=
                      QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryCorretagemDevol.Open;
   While Not QryCorretagemDevol.EOF Do
   Begin
      Result := Result + QryCorretagemDevol.Fieldbyname('VLRDESPOPER').AsFloat;
      QryCorretagemDevol.Next;
   End;
end;

procedure TfrmPendenciaBolsaSub.AbreQry;
Begin
   With QryConsulta Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT                                                                   ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
      Sql.Add('      0 AS QTDEOPERACAO, OI.IDOPERACAOINVEST,                            ');
      Sql.Add('      OI.PRECOUNITOPERACAO, AB.QTDELOTE,                                 ');
      Sql.Add('      OP.VLRPENDENTE AS VLROPERACAO,                                     ');
      Sql.Add('      0 AS TOTALDESPESAS,                                                ');
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
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
      Sql.Add('FROM PESSOA PS, CM.OPERACAOPENDENTE OP, CM.ACOESXBOLSA AB, CM.PARAMINVEST PI,');
      Sql.Add('     CM.OPERACAOINVEST OI, CM.OPRACAO OA, BOLSAVALORES BV,   ');
      Sql.Add('     CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC,  ');
      Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
      Sql.Add('	     FROM   CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI                   ');
      Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND             ');
      Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')                   ');
      Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS                                  ');
      Sql.Add('                                                                         ');
      Sql.Add('WHERE                                                                    ');      
      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (OI.DATAOPERACAO IS NULL)                   AND         ');
      Sql.Add('      (OP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)    AND         ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = PI.IDTIPOOPERDIRSUB)    AND         ');
      Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND         ');
      Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+)) AND         ');
      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	    AND         ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	    AND         ');
      Sql.Add('      (OA.IDACAO 	   = IV.IDINVESTIMENTO)     AND         ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	    AND         ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND         ');
      Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)              AND         ');
      Sql.Add('      (AB.IDACAO           = AC.IDACAO)              AND         ');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                  ');
      Open;
//      DBGrid1.FixedCols        := 3; //Altera a data liquidacao
      Panel6.Caption           := 'Operações de Pendência';
      sTipoOperacao            := 'P';
      BtAltDet.Enabled         := True;
      BtDelDet.Enabled         := True;

      QryDespesasOperacao.Close;
      QryConsolidado.Close;

      If IsEmpty Then
      Begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT                                                                   ');
         Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
         Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, QTDELOTE,                    ');
         Sql.Add('      OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO,2) AS VLROPERACAO, DS.TOTALDESPESAS, ');
         Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                        ');
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
         SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
         Sql.Add('FROM PESSOA PS, CM.OPERACAOINVEST OI, CM.OPRACAO OA, BOLSAVALORES BV,    ');
         Sql.Add('     CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC,  ');
         Sql.Add('     CM.ACOESXBOLSA AB,CM.PARAMINVEST PI,                                ');
         Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
         Sql.Add('	     FROM   CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI              ');
         Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND        ');
         Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')              ');
         Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS                             ');
         Sql.Add('                                                                         ');
         Sql.Add('WHERE                                                                    ');
         If dbDtaOperacao.Text <> '' Then
            Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
         Else
            Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');
         Sql.Add('      (OI.IDTIPOOPERACAO   = PI.IDTIPOOPERDIRSUB)                    AND ');
         Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)                    AND ');
         Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+))                 AND ');
         Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	                       AND ');
         Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	               AND ');
         Sql.Add('      (OA.IDACAO 	     = IV.IDINVESTIMENTO)                      AND ');
         Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	                       AND ');
         Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)                      AND ');
         Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)                              AND ');
         Sql.Add('      (AB.IDACAO           = AC.IDACAO)                              AND ');
         Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                          ');
         Open;
         QryDespesasOperacao.Open;
         QryConsolidado.Close;
         QryConsolidado.ParamByName('NUMDOC').AsString :=
                  QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
         QryConsolidado.Open;
         QryDespesasOperacao.DataSource := DsConsulta;
         Panel6.Caption      := 'Operações';
         sTipoOperacao       := 'N';
         If QryConsulta.RecordCount > 0 Then
            BtAltDet.Enabled := True
         Else
            BtAltDet.Enabled := False;
         BtDelDet.Enabled    := False;
//         DBGrid1.FixedCols   := 3; //Não altera a data de liquidacao,  so altera a quantidade
      End;
   End;

   If (BtDelDet.Enabled) Then
   Begin
      bbtnConfirmar.Enabled := True;
      bbtnCancelar.Enabled  := True;
   End;
   QryConsulta.FieldByName('PRECOUNITOPERACAO').ReadOnly := True;
   QryConsulta.FieldByName('TOTALDESPESAS').ReadOnly     := True;

   QryOperacaoPendente.Close;
   QryOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                       QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryOperacaoPendente.Open;

End;

procedure TfrmPendenciaBolsaSub.AbreQryLiq;
Begin
   With QryConsulta Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT                                                                   ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
      Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, QTDELOTE,                    ');
      Sql.Add('      OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO,2) AS VLROPERACAO, DS.TOTALDESPESAS,    ');
      Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                        ');
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
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
      Sql.Add('FROM CM.OPERACAOINVEST OI, CM.OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,   ');
      Sql.Add('     CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC,  ');
      Sql.Add('     CM.ACOESXBOLSA AB, OPERACAOPENDENTE  OP, CM.PARAMINVEST PI,         ');
      Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
      Sql.Add('	     FROM   CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI                   ');
      Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND             ');
      Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')                   ');
      Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS                                  ');
      Sql.Add('                                                                         ');
      Sql.Add('WHERE                                                                    ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');
         
      Sql.Add('      (OI.IDTIPOOPERACAO   = PI.IDTIPOOPERDIRSUB)                    AND ');
      Sql.Add('      (OP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST(+))                 AND ');
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
      Sql.Add('      (OI.IDOPERACAOORIGEM IS NOT NULL)                                  ');
      Open;
      QryDespesasOperacao.Open;
      QryDespesasOperacao.DataSource := DsConsulta;
      Panel6.Caption      := 'Operações';
      sTipoOperacao       := 'N';
      If QryConsulta.RecordCount > 0 Then
         BtAltDet.Enabled := True
      Else
         BtAltDet.Enabled := False;
      BtDelDet.Enabled    := False;
//      DBGrid1.FixedCols   := 4; //Não altera a data de liquidacao,  so altera a quantidade
   End;
   QryConsulta.FieldByName('PRECOUNITOPERACAO').ReadOnly := True;
   QryConsulta.FieldByName('TOTALDESPESAS').ReadOnly     := True;
End;


procedure TfrmPendenciaBolsaSub.BtAltDetClick(Sender: TObject);
begin
   Panel7.Caption        := '';
   bOK                   := False;
   Label2.Enabled        := False;
   dbDtaOperacao.Enabled := False;
{   Label1.Enabled        := False;
   dblCorretora.Enabled  := False;}
   Label3.Enabled        := False;
   dblLiquidacao.Enabled := False;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

   bTrocaLine            := False;

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

   QryConsultaQTDEOPERACAO.DisplayFormat := '';
   QryConsultaVLROPERACAO.DisplayFormat  := '#0.00';

   iAlteracao := iAlteracao + 1;
   bTrue := False;
end;

function TfrmPendenciaBolsaSub.VerColunaAlterada : Boolean;
Begin
   Result := True;
   If (QryConsulta.FieldByName('SGLBOLSAVALORES').AsString <>
       QryConsulta.FieldByName('SGLBOLSAVALORES').OldValue) Then
   Begin
      MsgDlg('Não pode alterar o Campo Bolsa.         ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('DESCINVESTIMENTO').AsString <>
       QryConsulta.FieldByName('DESCINVESTIMENTO').OldValue) Then
   Begin
      MsgDlg('Não pode alterar o Campo Investimento.  ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('DESCTIPOOPERACAO').AsString <>
       QryConsulta.FieldByName('DESCTIPOOPERACAO').OldValue) Then
   Begin
      MsgDlg('Não pode alterar o Campo Operação.      ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('DESCMERCADO').AsString <>
       QryConsulta.FieldByName('DESCMERCADO').OldValue) Then
   Begin
      MsgDlg('Não pode alterar o Campo Mercado.       ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('PRECOUNITOPERACAO').AsFloat <>
       QryConsulta.FieldByName('PRECOUNITOPERACAO').OldValue) Then
   Begin
      MsgDlg('Não pode alterar o Campo PU.            ',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Result := False;
   End;

   If (QryConsulta.FieldByName('TOTALDESPESAS').AsFloat <>
       QryConsulta.FieldByName('TOTALDESPESAS').OldValue) Then
   Begin
      MsgDlg('Não pode alterar o Campo Tot. de Desp.',
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

procedure TfrmPendenciaBolsaSub.BtOkDetClick(Sender: TObject);
Var
   fVlrPendente      : Double;
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

      fVlrPendente :=(QryConsulta.FieldByName('VLROPERACAO').OldValue -
                                  QryConsulta.FieldByName('VLROPERACAO').AsFloat);
      QryOperacaoPendente.FieldByName('VLRPENDENTE').AsFloat := fVlrPendente;
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

   BtAltDet.Enabled      := True;
   BtOkDet.Enabled       := False;
   BtCancDet.Enabled     := False;
   BtVoltaDet.Enabled    := False;
   Label2.Enabled        := True;
   dbDtaOperacao.Enabled := True;
{   Label1.Enabled        := True;
   dblCorretora.Enabled  := True;}
   Label3.Enabled        := True;
   dblLiquidacao.Enabled := True;
   DBGrid1.Options       := DBGrid1.Options - [TwwDBgridOption(dgEditing)];
   DBGrid1.Color         := clSilver;
end;

procedure TfrmPendenciaBolsaSub.BtCancDetClick(Sender: TObject);
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

   BtAltDet.Enabled      := True;
   BtOkDet.Enabled       := False;
   BtCancDet.Enabled     := False;
   BtVoltaDet.Enabled    := False;
   Label2.Enabled        := True;
   dbDtaOperacao.Enabled := True;
{   Label1.Enabled        := True;
   dblCorretora.Enabled  := True;}
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Label3.Enabled        := True;
   dblLiquidacao.Enabled := True;   
end;

procedure TfrmPendenciaBolsaSub.QryConsultaBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmPendenciaBolsaSub.DBGrid1Enter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmPendenciaBolsaSub.DBGrid1Exit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;

end;

procedure TfrmPendenciaBolsaSub.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPendenciaBolsaSub.DBGrid1KeyUp(Sender: TObject; var Key: Word;
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

procedure TfrmPendenciaBolsaSub.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

Function TfrmPendenciaBolsaSub.CalculaVencimento(DataInicial:TDateTime;
                                              DiasUteis:Integer):TDateTime;
Var
  wSoma,I:Integer;
  wDataLocal:TDateTime;
begin
  Result:= DataInicial;
  wDataLocal:=DataInicial;

// Soma os Dias
  For I:= 1 To DiasUteis Do Begin
    wDataLocal:= wDataLocal+1;
// Caso Sabado Soma 1 dia
    If DayOfWeek(wDataLocal) = 7 Then Begin
      wDataLocal:= wDataLocal+1;
    End;
// Caso Domingo Soma 1 dia
    If DayOfWeek(wDataLocal) = 1 Then Begin
      wDataLocal:= wDataLocal+1;
    End;
  End;
// Caso Resultado caia no Sabado
  If DayOfWeek(wDataLocal) In [7] Then Begin
    wDataLocal:= wDataLocal+1;
  End;
// Caso Resultado caia no Domingo
  If DayOfWeek(wDataLocal) In [1] Then Begin
    wDataLocal:= wDataLocal+1;
  End;
  Result:=wDataLocal;
end;

procedure TfrmPendenciaBolsaSub.OperacaoNormal;
begin
   QryDelOperacaoPendente.Close;
   QryDelOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                     QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryDelOperacaoPendente.ExecSQL;
   QryDelOperacaoPendente.Close;

   QryHistCartInv.Close;
   QryHistCartInv.ParamByName('IDOPERACAOINVEST').AsInteger :=
                     QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryHistCartInv.Open;

   QryBuscaTipoOper.Close;
   QryBuscaTipoOper.ParamByName('TIPOOPERACAO').AsInteger :=
                     QryConsulta.FieldByName('IDTIPOOPERACAO').AsInteger;
   QryBuscaTipoOper.Open;

   QryUpdOperacaoInvest_2.Close;
   QryUpdOperacaoInvest_2.ParamByName('VLROPERACAO').AsFloat     :=
               QryHistCartInv.FieldByName('VLRMOVCARTINV').AsFloat;
   QryUpdOperacaoInvest_2.ParamByName('QTDEOPERACAO').AsFloat    :=
               QryHistCartInv.FieldByName('QTDEMOVINVCART').AsFloat;
   QryUpdOperacaoInvest_2.ParamByName('DATAVENCOPER').AsDateTime :=
               CalculaVencimento(QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                        QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger);
   QryUpdOperacaoInvest_2.ParamByName('IDOPERACAOINVEST').AsInteger :=
                        QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
   QryUpdOperacaoInvest_2.ParamByName('IDTIPOOPERACAO').AsInteger :=
                        QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
   QryUpdOperacaoInvest_2.ExecSql;
   QryUpdOperacaoInvest_2.Close;
   QryHistCartInv.Close;
   QryBuscaTipoOper.Close;
end;

function  TfrmPendenciaBolsaSub.ExcluirPendencia : Boolean;
begin
   Result := True;
   Try
     If Not DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.StartTransaction;

     QryVerOperInvPendente.Close;
     QryVerOperInvPendente.ParambyName('IDOPERACAOORIGEM').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
     QryVerOperInvPendente.ParambyName('IDTIPOOPERACAO').AsInteger   :=
                           QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
     QryVerOperInvPendente.Open;

     If (Not QryVerOperInvPendente.EOF) Then
     Begin
        QryUpdOperacaoPendente.Close;
        QryUpdOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                       QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
        QryUpdOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat        :=
                       QryConsulta.FieldByName('VLROPERACAO').AsFloat;
        QryUpdOperacaoPendente.ExecSql;
        QryUpdOperacaoPendente.Close;

        QryDelOperacaoInvestPend.Close; //Delete OperacaoInvest (Operacao Pendente)
        QryDelOperacaoInvestPend.ParamByName('DATAVENCOPER').AsDateTime    :=
                                 QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;
        QryDelOperacaoInvestPend.ParamByName('IDOPERACAOINVEST').AsInteger :=
                                 QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
        QryDelOperacaoInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger   :=
                                 QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
        QryDelOperacaoInvestPend.ExecSql;
        QryDelOperacaoInvestPend.Close;

        DeletaQtdZeradas;
     End
     Else
        OperacaoNormal;

     QryVerOperInvPendente.Close;

     DtmBaseDados.dbBaseDados.Commit;
   Except
// Rollbacka Transação
     DtmBaseDados.dbBaseDados.Rollback;
     MsgDlg('Não foi possível excluir a Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Result := False;
     Exit;
   End;

   {If sTipoOperacao = 'P' Then
   Begin
      Try
        If Not DtmBaseDados.dbBaseDados.InTransaction Then
           DtmBaseDados.dbBaseDados.StartTransaction;

        QryDelOperacaoInvest.Close; //Delete OperacaoInvest (Operacao Pendente)
        QryDelOperacaoInvest.ParamByName('DATAVENCOPER').AsDateTime :=
                           QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;
        QryDelOperacaoInvest.ParamByName('IDOPERACAOORIGEM').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
        QryDelOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger :=
                           QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
        QryDelOperacaoInvest.ExecSql;
        QryDelOperacaoInvest.Close;
        DtmBaseDados.dbBaseDados.Commit;
      Except
// Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível excluir a Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
      End;
      AbreQry;
      Try
         QryBuscaUltDataOper.Close;
         QryBuscaUltDataOper.ParamByName('DATAOPERACAO').AsDateTime    :=
                           QryConsulta.FieldByName('DATAOPERACAO').AsDateTime;
         QryBuscaUltDataOper.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
         QryBuscaUltDataOper.ParamByName('IDTIPOOPERACAO').AsInteger   :=
                           QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
         QryBuscaUltDataOper.Open;

         QryBuscaOperPendente.Close;
         QryBuscaOperPendente.ParambyName('DATAVENCOPER').AsDateTime    :=
                 QryBuscaUltDataOper.FieldByName('DATAVENCOPER').AsDateTime;
         QryBuscaOperPendente.ParambyName('IDOPERACAOORIGEM').AsInteger :=
                 QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
         QryBuscaOperPendente.ParambyName('IDTIPOOPERACAO').AsInteger   :=
                 QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
         QryBuscaOperPendente.Open;
         QryBuscaUltDataOper.Close;

         If Not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;

         If Not QryBuscaOperPendente.EOF Then //Existir Operação Pendente
         Begin
            QryUpdOperacaoPendente.Close;
            QryUpdOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                              QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
            QryUpdOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat       :=
                              QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
            QryUpdOperacaoPendente.ExecSql;
            QryUpdOperacaoPendente.Close;

            QryUpdOperacaoInvest.Close;
            QryUpdOperacaoInvest.ParamByName('VLROPERACAO').AsFloat     :=
                              QryBuscaOperPendente.FieldByName('VLROPERACAO').AsFloat;
            QryUpdOperacaoInvest.ParamByName('QTDEOPERACAO').AsFloat    :=
                              QryBuscaOperPendente.FieldByName('QTDEOPERACAO').AsFloat;
            QryUpdOperacaoInvest.ParamByName('DATAVENCOPER').AsDateTime :=
                              QryBuscaOperPendente.FieldByName('DATAVENCOPER').AsDateTime;
            QryUpdOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger :=
                              QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
            QryUpdOperacaoInvest.ParamByName('IDTIPOOPERACAO').AsInteger :=
                              QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
            QryUpdOperacaoInvest.ExecSql;
            QryUpdOperacaoInvest.Close;

            QryUpdOperacaoPendente.Close;
            QryUpdOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat :=
                          QryBuscaOperPendente.FieldByName('QTDEOPERACAO').AsFloat;
            QryUpdOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                              QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
            QryUpdOperacaoPendente.ExecSql;
            QryUpdOperacaoPendente.Close;
         End
         Else
            OperacaoNormal;

         QryBuscaOperPendente.Close;
         DtmBaseDados.dbBaseDados.Commit;
      Except
// Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível excluir a Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
      End;
   End
   Else
   Begin
      Try
         If Not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;
         OperacaoNormal;
         DtmBaseDados.dbBaseDados.Commit;
      Except
// Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível excluir a Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
      End;
   End;}
end;

function  TfrmPendenciaBolsaSub.ExcluirLiqPendencia : Boolean;
begin
   Result := True;
   Try
     If Not DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.StartTransaction;
     QryOperacaoPendente.Close;
     QryOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                         QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
     QryOperacaoPendente.Open;
     If QryOperacaoPendente.EOF Then
     Begin
       QryInsOperacaoPendente.Close;
       QryInsOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                              QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
       QryInsOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat       :=
                              QryConsulta.FieldByName('VLROPERACAO').AsFloat;
       QryInsOperacaoPendente.ExecSQL;
     End
     Else
     Begin
        QryUpdOperacaoPendente.Close;
        QryUpdOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                               QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
        QryUpdOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat       :=
                               QryConsulta.FieldByName('VLROPERACAO').AsFloat;
        QryUpdOperacaoPendente.ExecSql;
        QryUpdOperacaoPendente.Close;
     End;
     QryOperacaoPendente.Close;
     {QryDelOperacaoPendente.Close;
     QryDelOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                         QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
     QryDelOperacaoPendente.ExecSQL;}

     QryDelOperacaoInvestPend.Close; //Delete OperacaoInvest (Operacao Pendente)
     QryDelOperacaoInvestPend.ParamByName('DATAVENCOPER').AsDateTime    :=
                              QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;
     QryDelOperacaoInvestPend.ParamByName('IDOPERACAOINVEST').AsInteger :=
                              QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
     QryDelOperacaoInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger   :=
                              QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
     QryDelOperacaoInvestPend.ExecSql;
     QryDelOperacaoInvestPend.Close;

     DeletaQtdZeradas;

     DtmBaseDados.dbBaseDados.Commit;
   Except
// Rollbacka Transação
     DtmBaseDados.dbBaseDados.Rollback;
     MsgDlg('Não foi possível excluir a Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Result := False;
     Exit;
   End;
   QryLiquidacao1.Close;
   QryLiquidacao1.ParamByName('IDTIPOOPERACAO').AsInteger  :=
                     QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
   QryLiquidacao1.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
   QryLiquidacao1.Open;

   If (Not QryLiquidacao1.EOF) And (QryLiquidacao1.RecordCount > 1) Then
   Begin
      QryLiquidacao.Close;
//      QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                     QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
      QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
      QryLiquidacao.Open;
      QryLiquidacao.Last;
      dblLiquidacao.Text := QryLiquidacao.FieldByName('DATAVENCOPER').AsString;
{      Try
         If Not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;

         LancaOperacaoPendente;
         DtmBaseDados.dbBaseDados.Commit;
      Except
// Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível excluir a Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
      End;}
      AbreQryConsLiq;
      sTipoOperacao      := 'L';
   End
   Else
   Begin
      Try
{         If Not DtmBaseDados.dbBaseDados.InTransaction Then
            DtmBaseDados.dbBaseDados.StartTransaction;

         OperacaoPendenciaLiquidada;

         DtmBaseDados.dbBaseDados.Commit;}
         QryLiquidacao.Close;
//         QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                     QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
         QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
         QryLiquidacao.Open;
//         LancaOperacaoPendente;
         If (Not QryLiquidacao.EOF) Then
         Begin
            QryLiquidacao.Last;
            dblLiquidacao.Text := QryLiquidacao.FieldByName('DATAVENCOPER').AsString;
            AbreQryConsLiq;
            sTipoOperacao      := 'L';
         End
         Else
         Begin
            AbreQry;
            bAlteraPendencia := True;
         End;
      Except
// Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível excluir a Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Result := False;
      End;
   End;
end;

procedure TfrmPendenciaBolsaSub.BtDelDetClick(Sender: TObject);
var
   fQtdOperacao    : Double;
   wDataVenc       : TDateTime;
   iIDTipoOperacao : Integer;
   bMenorData      : Boolean;
begin
  inherited;
   If MsgDlg('Confirma a Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   If QryConsulta.FieldByName('IDOPERACAOORIGEM').IsNull Then
   Begin
      MsgDlg('Não é possiível Excluir essa Operação. Essa não está Pendente.',
             'Mensagem do Sistema', MtError,[MbOk],0);
      BtDelDet.Down := False;
      bTrocaLine    := True;
      Exit;
   End;

   QryVerDtaVenc.Close;
   QryVerDtaVenc.ParamByName('IDOPERACAOORIGEM').AsInteger  :=
                     QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
   QryVerDtaVenc.Open;

   If (Not QryVerDtaVenc.Eof) And (QryVerDtaVenc.FieldByName('DATAVENCOPER').AsDateTime >
                                   QryLiquidacao.FieldByName('DATAVENCOPER').AsDateTime) Then
   Begin
      MsgDlg('Não é possível Excluir essa Operação. Existe uma Data de Liquidação maior que a escolhida. ',
             'Mensagem do Sistema', MtError,[MbOk],0);
      BtDelDet.Down := False;
      bTrocaLine    := True;
      QryVerDtaVenc.Close;
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
            MsgDlg('Não é possível Excluir essa Operação. Existe uma Data de Liquidação maior. ',
                   'Mensagem do Sistema', MtError,[MbOk],0);
            BtDelDet.Down := False;
            bTrocaLine    := True;
            QryVerDtaVenc.Close;
            Exit;
         End;
      End;
   End;
   QryVerDtaVenc.Close;

   If (dblLiquidacao.Text <> '') And (QryLiquidacao.RecordCount = 1) And
      (QryLiquidacao.FieldByName('DATAVENCOPER').AsDateTime = QryConsulta.FieldByName('DATAVENCOPER').AsDateTime) Then
   Begin
       MsgDlg('Não é possível Excluir essa Operação.',
              'Mensagem do Sistema', MtError,[MbOk],0);
       BtDelDet.Down := False;
       bTrocaLine    := True;
       Exit;
   End;

   GuardaVariaveis;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   QryConsulta.DisableControls;
   MovimentaCarteira;

// Caso Esteja em uma Transacao Confirma a Mesma
   If DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Commit;

   If dblLiquidacao.Text = '' Then
   Begin
      If Not ExcluirPendencia Then
         Exit;

      AbreQry;
   End
   Else
   Begin
      If Not ExcluirLiqPendencia Then
         Exit;
   End;
   QryConsulta.EnableControls;

   QryLiquidacao.Close;
//  QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                    QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
   QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
   QryLiquidacao.Open;
   If QryLiquidacao.Eof Then
   Begin
      AbreQry;
      bAlteraPendencia := True;
   End;

   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   BtDelDet.Down         := False;
end;

procedure TfrmPendenciaBolsaSub.MontaQryConsulta(wTotalLiquido : Double);
begin
   With QryConsulta Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT                                                                   ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
      Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, QTDELOTE,                    ');
      Sql.Add('      OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO,2) AS VLROPERACAO, DS.TOTALDESPESAS,            ');
      Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                        ');
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
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
      Sql.Add('FROM CM.OPERACAOINVEST OI, CM.OPRACAO OA,  PESSOA PS, BOLSAVALORES BV,   ');
      Sql.Add('     CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC,  ');
      Sql.Add('     CM.ACOESXBOLSA AB, OPERACAOPENDENTE  OP,                            ');
      Sql.Add('     (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS ');
      Sql.Add('	     FROM   CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI                   ');
      Sql.Add('	     WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND             ');
      Sql.Add('	            TDI.NATUREZAOPERACAO NOT IN ('''+'N'+''')                   ');
      Sql.Add('	     GROUP BY DOI.IDOPERACAOINVEST) DS                                  ');
      Sql.Add('                                                                         ');
      Sql.Add('WHERE                                                                AND ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');

      Sql.Add('      (OP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST(+))                 AND ');
      Sql.Add('      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)                    AND ');
      Sql.Add('      (OI.IDOPERACAOINVEST = DS.IDOPERACAOINVEST(+))                 AND ');
      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) 	                    AND ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)	                    AND ');
      Sql.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO)                   AND ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	                    AND ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)                      AND ');
      Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)                              AND ');
      Sql.Add('      (AB.IDACAO           = AC.IDACAO)                              AND ');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                      AND ');
      Sql.Add('      (OI.IDOPERACAOORIGEM IS NOT NULL)                                  ');

      If (wTotalLiquido < 0) Then
         SQL.Add('   ORDER BY RECPAGBOL DESC')
      Else
         SQL.Add('   ORDER BY RECPAGBOL     ');
      Open;
   End;
end;

procedure TfrmPendenciaBolsaSub.MontaQryConsultaLiq(wTotalLiquido : Double);
begin
   With QryConsulta Do
   Begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT                                                                   ');
      Sql.Add('      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,              ');
      Sql.Add('      OI.QTDEOPERACAO, OI.IDOPERACAOINVEST, QTDELOTE,                    ');
      Sql.Add('      OI.PRECOUNITOPERACAO, ROUND(OI.VLROPERACAO) AS VLROPERACAO,        ');
      Sql.Add('      0 AS TOTALDESPESAS,                                                ');
      Sql.Add('      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,                        ');
      Sql.Add('      PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,12) AS DESCINVESTIMENTO,     ');
      Sql.Add('      SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,                ');
      Sql.Add('      TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST,           ');
      Sql.Add('      OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,               ');
      Sql.Add('      AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOTE,        ');
      Sql.Add('      OI.IDCORRETVALORES, AB.QTDELOTE, OI.EMPRESAPROP, OI.IDOPERACAOORIGEM,');
      SQL.Add('       DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',                          ');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',                       ');
      SQL.Add('             DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',                    ');
      SQL.Add('                DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',                 ');
      SQL.Add('                   DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
      Sql.Add('FROM PESSOA PS, CM.OPERACAOINVEST OI, CM.OPRACAO OA, BOLSAVALORES BV,    ');
      Sql.Add('     CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC,  ');
      Sql.Add('     CM.ACOESXBOLSA AB, PARAMINVEST PI                                   ');
      Sql.Add('                                                                         ');
      Sql.Add('WHERE                                                                AND ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');

      Sql.Add('      (OI.DATAVENCOPER     = TO_DATE('''+dblLiquidacao.Text+''',''DD/MM/YYYY'')) AND ');
      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA) 	                AND');
      Sql.Add('      (OA.IDOPERACAOINVEST = OI.IDOPERACAOORIGEM)                AND');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES(+))               AND');
      Sql.Add('      (OA.IDACAO 	   = IV.IDINVESTIMENTO(+))              AND');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)                  AND');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO)	                AND');
      Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO)                          AND');
      Sql.Add('      (AB.IDACAO           = AC.IDACAO)                          AND');
      Sql.Add('      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                  AND');
      Sql.Add('      (OI.IDTIPOOPERACAO   = PI.IDTIPOOPERLIQPEND)                  ');

      If (wTotalLiquido < 0) Then
         SQL.Add('   ORDER BY RECPAGBOL DESC')
      Else
         SQL.Add('   ORDER BY RECPAGBOL     ');
      Open;
   End;
end;

Function  TfrmPendenciaBolsaSub.ApuraValorLiquido : Double;
Var wTotalLiquido : Double;
Begin
   QryConsulta.First;
   wTotalLiquido := 0;
   While Not QryConsulta.EOF Do
   Begin
   // Soma de Acordo com Tipo de Natureza(Venda/Compra)
     If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
        (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
        (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
        (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then
         wTotalLiquido := wTotalLiquido +
                          QryConsulta.FieldByName('VLROPERACAO').AsFloat
     Else If (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
             (QryConsulta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then
         wTotalLiquido := wTotalLiquido -
                        QryConsulta.FieldByName('VLROPERACAO').AsFloat;

     // Pula Registro
     QryConsulta.Next;
   End;
   QryConsulta.First;
   Result := wTotalLiquido;
End;

Procedure TfrmPendenciaBolsaSub.ContabilizaPendencia;
Var
  wMensErro, wRecPagBol, wTipoRecDesBol : String;
  wPlanilha, wDocumCont, wPlano : Integer;
  wTotalContab, wTotalLiquido   : Double;
  bCriaLancto                   : boolean;
Begin
   // Trata variáveis da Integração Contábil-Financeira
   wPlanilha  :=-1;
   wPlano     :=-1;
   wDocumCont :=-1;

   bCriaLancto    := true;
   wTipoRecDesBol := '';
   // Acha Valor Líqiuido da Boleta de define sRecPagBol (Se a Boleta é a pagar ou receber)
   wTotalLiquido := ApuraValorLiquido;

   If (wTotalLiquido < 0) Then
       wRecPagBol := 'R'
   Else
       wRecPagBol := 'P';

   MontaQryConsulta(wTotalLiquido);     //Ordenando pelo tipo de Natureza (P/R)

   wTotalContab   := Abs(wTotalLiquido);

   // Contabiliza Operação
   QryConsulta.First;

   While Not QryConsulta.EOF Do
   Begin
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

procedure TfrmPendenciaBolsaSub.MovimentaCarteira;
Var
  wHistorico, wMensErro, wSQL, wRecPagBol, wTipoRecDesBol :String;
  wQtdCotaIni, wPlanilha, wDocumCont, wIdOperacao,
  wOprContabil, wPlano, wIdDespesa, wFatura, wMoeCodigo, wIdHistCartInv, wIdTipoDespInvest:Integer;
  wNoDoc    :Extended;
  wValorAContabilizar, wTotalContab : Double;
  bCriaLancto: boolean;
begin
  inherited;

// TESTA SE LANCAMENTO É RETROATIVO
  If Not VerificaFechamentoOperacao(dbDtaOperacao.Text) Then Begin
    Exit;
  End;

  Panel7.Visible:=True;

  wIdOperacao:=QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
  wIdDespesa :=QryDespesasOperacao.FieldByName('IDDESPOPERINVEST').AsInteger;

// Trata variáveis da Integração Contábil-Financeira
  wPlanilha  :=-1;
  wPlano     :=-1;
  wDocumCont :=-1;

  bCriaLancto    := true;
  wTipoRecDesBol := '';

  // Acha Valor Líqiuido da Boleta de define sRecPagBol (Se a Boleta é a pagar ou receber)
  wTotalLiquido := ApuraValorLiquido;

  If (wTotalLiquido < 0) Then
      wRecPagBol := 'R'
  Else
      wRecPagBol := 'P';

  If dblLiquidacao.Text = '' Then
     MontaQryConsulta(wTotalLiquido)     //Ordenando pelo tipo de Natureza (P/R)
  Else
     MontaQryConsultaLiq(wTotalLiquido); //Ordenando pelo tipo de Natureza (P/R)

  wTotalContab   := Abs(wTotalLiquido);

// Inicia Processamento
  QryConsulta.First;
// Faz Todas as Despesas

  While Not QryConsulta.EOF Do Begin
// Mostra Progresso
    Panel7.Caption:= ' Processando Documento : '+
      QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
    Panel7.Repaint;

    If Not DtmBaseDados.dbBaseDados.InTransaction Then
       DtmBaseDados.dbBaseDados.StartTransaction;

    If Not OperComum.ProcEstorna(QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger,
                     QryConsulta.FieldByName('EMPRESAPROP').AsInteger, 79,
                     QryConsulta.FieldByName('DATAOPERACAO').AsDateTime, true) Then
    Begin
       MsgDlg('Não foi possível fazer Estorno. Cancele a Operação.',
             'Mensagem do Sistema', MtError,[MbOk],0);
       bbtnCancelar.Click;
       Exit;
    End;

// Caso Operacao de Venda (NATURMOV = 'D') MArca o Regsitro de Lucro Com Flag (1)
// Para ser Recalculado
    ExecutaQuery(QryAux,'UPDATE HISTCARTINV SET FLGCALCSALDO = ''1'' '+
                        'WHERE 	(TIPMOVCARTINV    = ''LUC'') AND '+
                        '      	(IDOPERACAOINVEST = '+
              QuotedStr(QryConsulta.FieldByName('IDOPERACAOINVEST').AsString)+')');
    QryAux.Close;
// Alimenta os Saldos da Carteira
    OperComum.AtualizaSaldos(wQtdCotaini,-1);

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
                         QryConsulta.FieldByName('NUMDOCUMENTO').AsString,
                         wRecPagBol, wTipoRecDesBol, bCriaLancto, wTotalContab,
                         QryConsulta.FieldByName('VLROPERACAO').AsFloat,
                         QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                         QryConsulta.FieldByName('DATAVENCOPER').AsDateTime,
                         wPlano, wPlanilha, wDocumCont, wMensErro);
    End;
    If DtmBaseDados.dbBaseDados.InTransaction Then
       DtmBaseDados.dbBaseDados.Commit;

   // Proximo Registro de Operacao
    QryConsulta.Next;
  End;

  If Not DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.StartTransaction;

  // Busca Inicio da Cota na Carteira
  FazQuery(QryAux,'SELECT * FROM PARAMINVEST');

  wQtdCotaIni:= QryAux.FieldByName('VLRCOTAINICART').AsInteger;
  QryAux.Close;
// Alimenta os Saldos da Carteira
  OperComum.AtualizaSaldos(wQtdCotaini,-1);

// Atualiza Status da Boleta e das Operações.
  with qryAtualizaBoleta do begin
     Close;
     if not(Prepared) then Prepare;
     ParamByName('BOLETA').asString := QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
     ExecSQL;
     Close;
  end;

  with qryAtualizaOperacoes do begin
     Close;
     if not(Prepared) then Prepare;
     ParamByName('BOLETA').asString := QryConsulta.FieldByName('NUMDOCUMENTO').AsString;
     ExecSQL;
     Close;
  end;

  If DtmBaseDados.dbBaseDados.InTransaction Then
     DtmBaseDados.dbBaseDados.Commit;

// Busca Regs Guardados
  QryConsulta.Locate('IDOPERACAOINVEST',wIdOperacao,[loPartialKey]);
  Panel7.Caption  := ' Processamento Terminado .';
end;

procedure TfrmPendenciaBolsaSub.TotalLiquidoDespesa;
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
End;

function TfrmPendenciaBolsaSub.TestaExisteIDOperPendente : Boolean;
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

function TfrmPendenciaBolsaSub.VerificaQtde : Boolean;
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
            If OperComum.Round(FieldByName('VLRPENDENTE').AsFloat,2) =
               OperComum.Round(QryConsulta.FieldByName('VLROPERACAO').AsFloat,2) Then
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

procedure TfrmPendenciaBolsaSub.QryConsultaVLROPERACAOValidate(
  Sender: TField);
begin
  inherited;
  bTrue := True;
end;

procedure TfrmPendenciaBolsaSub.dblCorretoraChange(Sender: TObject);
begin
  inherited;
   AbreQry;
   bAlteraPendencia := True;
end;

procedure TfrmPendenciaBolsaSub.dblCorretoraExit(Sender: TObject);
begin
  inherited;
   QryLiquidacao.Close;
//   QryLiquidacao.ParamByName('IDTIPOOPERACAO').AsInteger  :=
//                        QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
   QryLiquidacao.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
   QryLiquidacao.Open;
end;

procedure TfrmPendenciaBolsaSub.AbreQryConsLiq;
Var
   bMenorData : Boolean;
Begin
   bMenorData := TestaMenorData(StrToDate(dblLiquidacao.Text));

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
      Sql.Add('      AB.QTDELOTE,                                                      ');
      If bMenorData Then
         Sql.Add('      DS.TOTALDESPESAS,                                                ')
      Else
         Sql.Add('      0 AS TOTALDESPESAS,                                              ');

      SQL.Add('      DECODE(TI.NATUREZAOPERACAO, ''D'',''R'',                            ');
      SQL.Add('        DECODE(TI.NATUREZAOPERACAO, ''S'',''R'',                          ');
      SQL.Add('          DECODE(TI.NATUREZAOPERACAO, ''O'',''R'',                        ');
      SQL.Add('            DECODE(TI.NATUREZAOPERACAO, ''R'',''R'',                      ');
      SQL.Add('              DECODE(TI.NATUREZAOPERACAO, ''I'',''R'',''P''))))) AS  RECPAGBOL');
      Sql.Add('                                                                          ');
      Sql.Add('FROM                                                                      ');
      Sql.Add('       PESSOA PS, OPERACAOINVEST OI, CM.OPRACAO OA, BOLSAVALORES BV,  CM.INVESTIMENTO IV,');
      If bMenorData Then
      Begin
         Sql.Add('      (SELECT DOI.IDOPERACAOINVEST, SUM(DOI.VLRDESPOPER) AS TOTALDESPESAS                ');
         Sql.Add('       FROM   CM.DESPOPERINVEST DOI, TIPODESPINVEST TDI                                  ');
         Sql.Add('       WHERE  DOI.IDTIPODESPINVEST = TDI.IDTIPODESPINVEST AND                            ');
         Sql.Add('              TDI.NATUREZAOPERACAO NOT IN ('+'''N'''+')                                  ');
         Sql.Add('       GROUP BY DOI.IDOPERACAOINVEST) DS,                                                ');
      End;
      Sql.Add('       CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC, CM.ACOESXBOLSA AB   ');
{      Else
         Sql.Add('       CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.ACAO AC                                     ');}

      Sql.Add('                                                                                            ');
      Sql.Add('WHERE                                                                  ');

      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');

      Sql.Add('         (OI.DATAVENCOPER     = TO_DATE('''+dblLiquidacao.Text+''',''DD/MM/YYYY'')) AND ');

      Sql.Add('      (OI.IDCORRETVALORES  = PS.IDPESSOA)                         AND ');
      Sql.Add('      (DECODE(OI.IDOPERACAOORIGEM, NULL, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIGEM)= OA.IDOPERACAOINVEST(+)) AND ');
      If bMenorData Then
         Sql.Add('      (DECODE(OI.IDOPERACAOORIGEM, NULL, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIGEM)= DS.IDOPERACAOINVEST(+)) AND ');
      Sql.Add('      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES(+))                AND ');
      Sql.Add('      (OA.IDACAO 	  = IV.IDINVESTIMENTO(+))                AND ');
      Sql.Add('      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO(+))                AND ');
      Sql.Add('      (TI.IDMERCADO        = ME.IDMERCADO(+))	                 AND ');
      If Not bMenorData Then
      Begin
         Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO(+))                        AND ');
         Sql.Add('      (OI.IDTIPOOPERACAO IN (SELECT IDTIPOOPERLIQPEND FROM PARAMINVEST))  AND      ');
      End
      Else
      Begin
         Sql.Add('      (OI.IDINVESTIMENTO   = AC.IDACAO(+))  AND                       ');
{         If QryLiquidacao.RecordCount = 1 Then
            Sql.Add('      (OI.IDTIPOOPERACAO IN (SELECT IDTIPOOPERLIQPEND FROM PARAMINVEST))          ')
         Else
            Sql.Add('      (OI.QTDEOPERACAO > 0)                                         ');}
      End;
      Sql.Add('      (OI.QTDEOPERACAO > 0)                    AND                       ');
{      Sql.Add('      (OI.IDOPERACAOINVEST NOT IN                                        ');
      Sql.Add('      (SELECT IDOPERACAOORIGEM                                           ');
      Sql.Add('      FROM  OPERACAOINVEST                                               ');
      If Not QryCorretValores.FieldByName('IDCORRETVALORES').IsNull Then
         Sql.Add('WHERE (OI.IDCORRETVALORES  ='''+
                  QryCorretValores.FieldByName('IDCORRETVALORES').AsString+''')     AND ')
      Else
         Sql.Add('WHERE (NOT OI.IDCORRETVALORES IS NULL )                           AND ');
      If dbDtaOperacao.Text <> '' Then
         Sql.Add('      (OI.DATAOPERACAO     = TO_DATE('''+dbDtaOperacao.Text+''',''DD/MM/YYYY'')) AND ')
      Else
         Sql.Add('      (NOT OI.DATAOPERACAO IS NULL)                               AND ');

      Sql.Add('         (OI.DATAVENCOPER     = TO_DATE('''+dblLiquidacao.Text+''',''DD/MM/YYYY'')) AND ');
      Sql.Add('         (IDOPERACAOORIGEM IS NOT NULL)))                            AND ');}
      Sql.Add('         (AB.IDACAO           = AC.IDACAO)                           AND ');
      Sql.Add('         (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)                       ');
      Sql.Add('          ORDER BY DESCINVESTIMENTO                                      ');
      Open;
//      DBGrid1.FixedCols        := 3; //Altera a data liquidacao
      Panel6.Caption           := 'Operações de Pendência';
      sTipoOperacao            := 'P';
      BtAltDet.Enabled         := True;
      BtDelDet.Enabled         := True;

      QryDespesasOperacao.Close;
      QryConsolidado.Close;
      QryOperacaoPendente.Close;
      QryOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                       QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
      QryOperacaoPendente.Open;
   End;
End;

procedure TfrmPendenciaBolsaSub.dblLiquidacaoChange(Sender: TObject);
begin
  inherited;
  If dblLiquidacao.Text <> '' Then
  Begin
     AbreQryConsLiq;
     BtAltDet.Enabled := False;
     sTipoOperacao    := 'L';

{     QryBuscaDataVenc.Close;
     QryBuscaDataVenc.ParamByName('IDTIPOOPERACAO').AsInteger  :=
                        QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
     QryBuscaDataVenc.ParamByName('IDCORRETVALORES').AsInteger :=
                        QryCorretValores.FieldByName('IDCORRETVALORES').AsInteger;
     QryBuscaDataVenc.ParamByName('DATAOPERACAO').AsDateTime   := StrToDate(dbDtaOperacao.Text);
     QryBuscaDataVenc.Open;

     If dbDtaOperacao.Text < QryBuscaDataVenc.FieldByName('DATAVENCOPER').AsString Then
     Begin
        BtAltDet.Enabled      := False;
        BtDelDet.Enabled      := False;
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
     End
     Else
     Begin
        BtAltDet.Enabled      := True;
        BtDelDet.Enabled      := True;
     End;}
  End
  Else
  Begin
     AbreQry;
     bAlteraPendencia := True;
  End;
  bbtnConfirmar.Enabled := False;
  bbtnCancelar.Enabled  := False;
end;

function  TfrmPendenciaBolsaSub.GravaOperNormal : Boolean;
Var QtdOld, QtdNew : Double;
begin
   Result := True;

   iAlteracao  := 0;

   bTrocaLine  := True;

   Try
     If DBGrid1.FixedCols = 4 Then
        QryConsulta.ApplyUpdates;
     QryOperacaoPendente.ApplyUpdates;
     DtmBaseDados.dbBaseDados.Commit;
   Except
// Rollbacka Transação
     DtmBaseDados.dbBaseDados.Rollback;
     Result := False;
     Exit;
   End;

   BtDelDet.Enabled := False;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;
   Try
     QryConsulta.DisableControls;
     ContabilizaPendencia;
     QryConsulta.EnableControls;
     DtmBaseDados.dbBaseDados.Commit;
   Except
// Rollbacka Transação
     DtmBaseDados.dbBaseDados.Rollback;
     If Not DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.StartTransaction;
     BtDelDet.Enabled := True;
     BtDelDet.Click;
     BtDelDet.Enabled := True;
     DtmBaseDados.dbBaseDados.Commit;
     Result := False;
     Exit;
   End;
end;

function  TfrmPendenciaBolsaSub.GravaOperPendente : Boolean;
Var QtdOld, QtdNew : Double;
begin
   bTrocaLine  := True;
   Try
     If Not DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.StartTransaction;

     QryConsulta.DisableControls;
     QryConsulta.First;
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
           ParamByname('IDTIPOOPERACAO').AsInteger    :=
                        QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
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
           ExecSQL;
        End;

        If Not bAlteraPendencia Then
        Begin
           QryDelOperacaoPendente.Close;
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
              QryAltOperacaoPendente.Close;
              QryAltOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat   :=
                          (QryConsulta.FieldByName('VLROPERACAO').OldValue -
                           QryConsulta.FieldByName('VLROPERACAO').AsFloat);
              QryAltOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
              QryAltOperacaoPendente.ExecSQL;
              QryAltOperacaoPendente.Close;
           End
           Else
           Begin
              QryDelOperacaoPendente.Close;
              QryDelOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger :=
                         QryConsulta.FieldByName('IDOPERACAOINVEST').AsInteger;
              QryDelOperacaoPendente.ExecSQL;
           End;
        End;
        QryConsulta.Next;
     End;
     QryConsulta.EnableControls;

     If bAlteraPendencia Then
     Begin
        Try
          If DBGrid1.FixedCols = 4 Then
             QryConsulta.ApplyUpdates;
          DtmBaseDados.dbBaseDados.Commit;
        Except
// Rollbacka Transação
          DtmBaseDados.dbBaseDados.Rollback;
          Result := False;
          Exit;
        End;

        If Not DtmBaseDados.dbBaseDados.InTransaction Then
           DtmBaseDados.dbBaseDados.StartTransaction;
        Try
           QryConsulta.DisableControls;
           ContabilizaPendencia;
           QryConsulta.EnableControls;
           DtmBaseDados.dbBaseDados.Commit;
        Except
// Rollbacka Transação
           DtmBaseDados.dbBaseDados.Rollback;
           If Not DtmBaseDados.dbBaseDados.InTransaction Then
              DtmBaseDados.dbBaseDados.StartTransaction;
           BtDelDet.Enabled := True;
           BtDelDet.Click;
           BtDelDet.Enabled := True;
           DtmBaseDados.dbBaseDados.Commit;
           Result := False;
           Exit;
        End;
     End;
     If DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.Commit;
   Except
// Rollbacka Transação
     DtmBaseDados.dbBaseDados.Rollback;
     Result := False;
     Exit;
   End;
   Result := True;
end;

function  TfrmPendenciaBolsaSub.GravaOperPendenteLiquidada : Boolean;
begin
   QryConsulta.DisableControls;
   QryConsulta.First;
   While Not QryConsulta.EOF Do
   Begin
      If Not DtmBaseDados.dbBaseDados.InTransaction Then
         DtmBaseDados.dbBaseDados.StartTransaction;
      Try
         With QryUpdOperacaoInvest Do
         Begin
            Close;
            ParamByName('VLROPERACAO').AsFloat     :=
                  QryConsulta.FieldByName('VLROPERACAO').AsFloat;
            ParamByName('QTDEOPERACAO').AsFloat    :=
                  QryConsulta.FieldByName('QTDEOPERACAO').AsFloat;
            ParamByName('DATAVENCOPER').AsDateTime :=
                  QryConsulta.FieldByName('DATAVENCOPER').AsDateTime;
            ParamByName('IDOPERACAOINVEST').AsInteger :=
                  QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
            ParamByName('IDTIPOOPERACAO').AsInteger :=
                  QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
            ExecSql;
            Close;
         End;

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
            ParamByname('IDTIPOOPERACAO').AsInteger    :=
                         QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
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
            ExecSQL;
            Close;
         End;
         QryOperacaoPendente.ApplyUpdates;
         DtmBaseDados.dbBaseDados.Commit;
      Except
// Rollbacka Transação
         DtmBaseDados.dbBaseDados.Rollback;
         Result := False;
         Exit;
      End;
      QryConsulta.Next;
   End;
   QryConsulta.EnableControls;
   Try
     If Not DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.StartTransaction;
      QryConsulta.DisableControls;
      ContabilizaPendencia;
      QryConsulta.EnableControls;
      DtmBaseDados.dbBaseDados.Commit;
   Except
// Rollbacka Transação
      DtmBaseDados.dbBaseDados.Rollback;
      Result := False;
      Exit;
   End;
   Result := True;
end;

function  TfrmPendenciaBolsaSub.Natureza(IDORIGEM : Integer) : String;
begin
   QryOperacaoInvest.Close;
   QryOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger := IDORIGEM;
   QryOperacaoInvest.Open;
   Result := QryOperacaoInvest.FieldByName('NATUREZAOPERACAO').AsString;
end;

function  TfrmPendenciaBolsaSub.TestaMenorData(dData : TDateTime)  : Boolean;
begin
   QryTestaMenorData.Close;
   QryTestaMenorData.ParamByName('IDTIPOOPERACAO').AsInteger  :=
                        QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
   QryTestaMenorData.ParamByName('DATAVENCOPER').AsDateTime   := dData;
   QryTestaMenorData.Open;
   Result := True;
   While Not QryTestaMenorData.Eof Do
   Begin
      If (dData > QryTestaMenorData.FieldbyName('DATAVENCOPER').AsDateTime) Then
          Result := False;
      QryTestaMenorData.Next;
   End;
   QryTestaMenorData.Close;
end;

Procedure  TfrmPendenciaBolsaSub.OperacaoPendenciaLiquidada;
begin
   QryHistCartInv.Close;
   QryHistCartInv.ParamByName('IDOPERACAOINVEST').AsInteger :=
                     QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
   QryHistCartInv.Open;

   QryOperacaoInvest.Close;
   QryOperacaoInvest.ParamByName('IDOPERACAOINVEST').AsInteger :=
                     QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
   QryOperacaoInvest.Open;

   QryBuscaTipoOper.Close;
   QryBuscaTipoOper.ParamByName('TIPOOPERACAO').AsInteger :=
                     QryOperacaoInvest.FieldByName('IDTIPOOPERACAO').AsInteger;
   QryBuscaTipoOper.Open;

   QryUpdOperacaoInvest_2.Close;
   QryUpdOperacaoInvest_2.ParamByName('VLROPERACAO').AsFloat     :=
               QryHistCartInv.FieldByName('VLRMOVCARTINV').AsFloat;
   QryUpdOperacaoInvest_2.ParamByName('QTDEOPERACAO').AsFloat    :=
               QryHistCartInv.FieldByName('QTDEMOVINVCART').AsFloat;
   QryUpdOperacaoInvest_2.ParamByName('DATAVENCOPER').AsDateTime :=
               CalculaVencimento(QryConsulta.FieldByName('DATAOPERACAO').AsDateTime,
                        QryBuscaTipoOper.FieldByName('VENCIMENTO').AsInteger);
   QryUpdOperacaoInvest_2.ParamByName('IDOPERACAOINVEST').AsInteger :=
                        QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
   QryUpdOperacaoInvest_2.ParamByName('IDTIPOOPERACAO').AsInteger :=
                        QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
   QryUpdOperacaoInvest_2.ExecSql;
   QryUpdOperacaoInvest_2.Close;
   QryHistCartInv.Close;
   QryBuscaTipoOper.Close;
   QryOperacaoInvest.Close;
end;

Procedure  TfrmPendenciaBolsaSub.DeletaQtdZeradas;
var i : integer;
begin
   i := 1;
   While i = 1 Do
   Begin
      QryTestaQtdZerada.Close;
      QryTestaQtdZerada.ParamByName('DATAOPERACAO').AsDateTime    := StrToDate(dbDtaOperacao.Text);
      QryTestaQtdZerada.ParamByName('DATAVENCOPER').AsDateTime    := StrToDate(dblLiquidacao.Text);
      QryTestaQtdZerada.ParamByName('IDOPERACAOORIGEM').AsInteger :=
                           QryConsulta.FieldByName('IDOPERACAOORIGEM').AsInteger;
      QryTestaQtdZerada.ParamByName('IDTIPOOPERACAO').AsInteger   :=
                           QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
      QryTestaQtdZerada.Open;
      If Not QryTestaQtdZerada.Eof Then
      Begin
         QryDelOperacaoInvestPend.Close; //Delete OperacaoInvest (Operacao Pendente)
         QryDelOperacaoInvestPend.ParamByName('DATAVENCOPER').AsDateTime    :=
                           QryTestaQtdZerada.FieldByName('DATAVENCOPER').AsDateTime;;
         QryDelOperacaoInvestPend.ParamByName('IDOPERACAOINVEST').AsInteger :=
                           QryTestaQtdZerada.FieldByName('IDOPERACAOINVEST').AsInteger;
         QryDelOperacaoInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger   :=
                           QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
         QryDelOperacaoInvestPend.ExecSql;
         QryDelOperacaoInvestPend.Close;
         QryTestaQtdZerada.Close;
      End
      Else
      Begin
         QryTestaQtdZerada.Close;
         i := 2;
      End;
   End;
end;

procedure TfrmPendenciaBolsaSub.GuardaVariaveis;
begin
    iIDCORRETVALORES   := QryConsulta.FieldByname('IDCORRETVALORES').AsInteger;
    iMOECODIGO         := QryConsulta.FieldByname('MOECODIGO').AsInteger;
    iIDCARTEIRAINVEST  := QryConsulta.FieldByname('IDCARTEIRAINVEST').AsInteger;
    iIDINVESTIMENTO    := QryConsulta.FieldByname('IDINVESTIMENTO').AsInteger;
    iIDTIPOINVEST      := QryConsulta.FieldByname('IDTIPOINVEST').AsInteger;
    iIDTIPOOPERLIQPEND := QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
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

procedure TfrmPendenciaBolsaSub.LancaOperacaoPendente;
begin
   QryBuscaUltDtaOperInv.Close;
   QryBuscaUltDtaOperInv.ParamByName('IDOPERACAOORIGEM').AsInteger  := iIDOPERACAOORIGEM;
   QryBuscaUltDtaOperInv.ParamByName('DATAVENCOPER').AsDateTime     := dDATAVENCOPER;
   QryBuscaUltDtaOperInv.Open;

   With QryUpdOperacaoInvest Do
   Begin
      Close;
      ParamByname('VLROPERACAO').AsFloat        := fVLROPERACAO;
      ParamByname('QTDEOPERACAO').AsFloat       := fQTDEOPERACAO;
      ParamByname('DATAVENCOPER').AsDateTime    :=
                   QryBuscaUltDtaOperInv.FieldByname('DATAVENCOPER').AsDateTime;
      ParamByname('IDOPERACAOINVEST').AsInteger := iIDOPERACAOORIGEM;
      ParamByname('IDTIPOOPERACAO').AsInteger   :=
                   QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
      ExecSQL;
   End;

{   With QryInsOperacaoInvest Do
   Begin
      Close;
      ParamByname('IDOPERACAOINVEST').AsInteger  :=
                   LeUltRegistro(Nil,'OPERACAOINVEST');
      ParamByname('IDCORRETVALORES').AsInteger   := iIDCORRETVALORES;
      ParamByname('MOECODIGO').AsInteger         := iMOECODIGO;
      ParamByname('IDCARTEIRAINVEST').AsInteger  := iIDCARTEIRAINVEST;
      ParamByname('IDINVESTIMENTO').AsInteger    := iIDINVESTIMENTO;
      ParamByname('IDTIPOINVEST').AsInteger      := iIDTIPOINVEST;
      ParamByname('IDTIPOOPERACAO').AsInteger    :=
                   QryParamInvest.FieldByname('IDTIPOOPERLIQPEND').AsInteger;
      ParamByname('DATAOPERACAO').AsDateTime     := dDATAOPERACAO;
      ParamByname('NUMDOCUMENTO').AsString       := sNUMDOCUMENTO;
      ParamByname('QTDEOPERACAO').AsFloat        := fQTDEOPERACAO;
      ParamByname('PRECOUNITOPERACAO').AsFloat   := fPRECOUNITOPERACAO;
      ParamByname('VLROPERACAO').AsFloat         := fVLROPERACAO;
      ParamByname('DATAVENCOPER').AsDateTime     :=
                   QryBuscaUltDtaOperInv.FieldByname('DATAVENCOPER').AsDateTime;
      ParamByname('IDFORCLI').AsInteger          := iIDFORCLI;
      ParamByname('IDLOTE').AsString             := sIDLOTE;
      ParamByname('IDOPERACAOORIGEM').AsInteger  := iIDOPERACAOORIGEM;
      ExecSQL;
   End;}

   QryInsOperacaoPendente.Close;
   QryInsOperacaoPendente.ParamByName('IDOPERACAOINVEST').AsInteger := iIDOPERACAOORIGEM;
   QryInsOperacaoPendente.ParamByName('VLRPENDENTE').AsFloat        := fVLROPERACAO;
   QryInsOperacaoPendente.ExecSQL;

end;

procedure TfrmPendenciaBolsaSub.dbDtaOperacaoChange(Sender: TObject);
begin
  inherited;
   AbreQry;
end;

end.

