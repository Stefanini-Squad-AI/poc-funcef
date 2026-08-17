//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_22
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores a transferência
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_20
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_19
// Pendencia : 22781
// Motivo    : Implementação do IDTIPOINVEST nas querys qryDetOrigem e qryDetDestino
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_18
// Pendencia : 22781
// Motivo    : Implementação da inicialização do valor a transferir zerado
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_17
// Pendencia : 22781
// Motivo    : Retirada a gravação da cota de aplicação após a gravação da atualização
//             do historico da operação
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_16
// Pendencia : 22781
// Motivo    : Alterada a data de aplicação para a data de transferencia na gravação
//             do historico de destino da transferência
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_15
// Pendencia : 22781
// Motivo    : Implementação da verificação do idforcli, se for igual a zero aborta
//             a operação
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_14
// Pendencia : 22781
// Motivo    : Implementação da gravação do id da operação origem, na baixa .
//******************************************************************************
// Data      : 02/08/2006
// Código    : AL_13
// Pendencia : 22781
// Motivo    : Alterada as mensagens do form
//******************************************************************************
// Data      : 27/07/2006
// Código    : AL_12
// Pendencia : 22781
// Motivo    : Retirada dos fields das querys QryFundoDestino e QryFundoOrigem e
//             implementado apenas os que são usados.
//******************************************************************************
// Data      : 27/07/2006
// Código    : AL_11
// Pendencia : 22781
// Motivo    : Alteração na rotina de "ExcluiMovimento" com implementação de mais parametros e
//             alteração na mensagem caso ocorra um problema
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_10
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_9
// Motivo    : Retirado a critica de data de operação igual ao dia  para acionar
//             o reprocessamento.
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_8
// Motivo    : Alterada a mensagem de erro no reprocessamento
//******************************************************************************
// Data      : 28/03/2006
// Código    : AL_7
// Motivo    : Ajuste na exclusão
//******************************************************************************
// Data      : 28/03/2006
// Código    : AL_6
// Motivo    : Ajuste das mensagens, implementação do reprocessamento,
//             do carimbo da integralização contábil/finaceira na tabela OPERACAOFUNDO
//             e acerto na gravação da cota de aplicação na tabela COTAFUNDO
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_5
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 15/06/2005
// Código   : Al_4
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 25/05/2005
// Linha(s) : Al_3
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_2
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 10/09/2004
//          : Alt_1
// Motivo   : Retirado o valor defoult dos parametros da QryFundoOrigem
//******************************************************************************

unit FCadTransfFundos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, DBCtrls, wwdblook, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, Menus, UOperacaoInvest, FPreview, FCadastroCSInv, fcLabel,
  uCtrlInvContab;

type
  TfrmCadTransfFundos = class(TfrmCadastroCSInv)
    pnlData: TPanel;
    dbDtaTransf: TCMDateTimePicker;
    lblDataTransf: TLabel;
    QryTipoOperTransf: TwwQuery;
    QryTipoFundoOrigem: TwwQuery;
    QryFundoOrigem: TwwQuery;
    Panel2: TPanel;
    pnlOrigem: TPanel;
    pnlTitOrigem: TPanel;
    pnlDetalheFndOrigem: TPanel;
    lblDtAplicacaoOrigem: TLabel;
    lblQtdOrigem: TLabel;
    lblPreco: TLabel;
    lblVlrApliOrigem: TLabel;
    dbDtaAplicacaoOrigem: TCMDateTimePicker;
    pnlDestino: TPanel;
    pnlTitDestino: TPanel;
    lblLotePadrao: TLabel;
    QryGestorDestino: TwwQuery;
    QryGestorDestinoNOME: TStringField;
    lblSaldoOrigem: TLabel;
    QryCotaFundo: TwwQuery;
    dsCotaFundo: TwwDataSource;
    updCotaFundo: TUpdateSQL;
    QryCotaFundoVLRCOTA: TFloatField;
    qryOperacaoFundo: TwwQuery;
    QryTipoFundoOrigemIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoOrigemIDTIPOINVEST: TFloatField;
    QryTipoFundoOrigemDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoOrigemDATAULTFECH: TDateTimeField;
    dsTipoFundoOrigem: TDataSource;
    //AL_12
    dbgDetOrigem: TwwDBGrid;
    qryDetOrigem: TwwQuery;
    qryDetOrigemIDTIPOINVEST: TFloatField;
    qryDetOrigemDATAULTPGTOIR: TDateTimeField;
    qryDetOrigemIDCARTEIRAINVEST: TFloatField;
    qryDetOrigemIDFUNDOINVEST: TFloatField;
    qryDetOrigemDATAAPLICACAO: TDateTimeField;
    qryDetOrigemDATAMOVFUNDO: TDateTimeField;
    qryDetOrigemVLRCOTAAPLICACAO: TFloatField;
    qryDetOrigemVLRAPLICADO: TFloatField;
    qryDetOrigemSALDOVLRFUNDO: TFloatField;
    qryDetOrigemIDPLANPREVCTBPATR: TFloatField;
    qryDetOrigemSALDOQTDCOTAS: TFloatField;
    qryDetOrigemVLRIRPROV: TFloatField;
    qryDetOrigemVLRIOFPROV: TFloatField;
    qryDetOrigemVLRVARIACAO: TFloatField;
    dsDetOrigem: TDataSource;
    qryDetDestino: TwwQuery;
    qryDetDestinoIDTIPOINVEST: TFloatField;
    qryDetDestinoDATAULTPGTOIR: TDateTimeField;
    qryDetDestinoIDCARTEIRAINVEST: TFloatField;
    qryDetDestinoIDFUNDOINVEST: TFloatField;
    qryDetDestinoDATAAPLICACAO: TDateTimeField;
    qryDetDestinoDATAMOVFUNDO: TDateTimeField;
    qryDetDestinoVLRCOTAAPLICACAO: TFloatField;
    qryDetDestinoVLRAPLICADO: TFloatField;
    qryDetDestinoSALDOVLRFUNDO: TFloatField;
    qryDetDestinoIDPLANPREVCTBPATR: TFloatField;
    qryDetDestinoSALDOQTDCOTAS: TFloatField;
    qryDetDestinoVLRIRPROV: TFloatField;
    qryDetDestinoVLRIOFPROV: TFloatField;
    qryDetDestinoVLRVARIACAO: TFloatField;
    qryDetDestinoIDOPERACAOFUNDO: TFloatField;
    edtVlrTransfOrigem: TRealEdit;
    dbgDetDestino: TwwDBGrid;
    qryGestorOrigem: TwwQuery;
    StringField3: TStringField;
    btnVoltarDetOrigem: TBitBtn;
    mnuTransfFundosOrigem: TPopupMenu;
    mnuTrfFndParcial: TMenuItem;
    mnuTrfFndTotal: TMenuItem;
    dsTipoFundoDestino: TDataSource;
    dsDetDestino: TDataSource;
    dbeQtdOrigem: TDBRealEdit;
    dbeCotaAplicOrigem: TDBRealEdit;
    dbeVlrAplicOrigem: TDBRealEdit;
    dbeSaldoOrigem: TDBRealEdit;
    QryTipoOperTransfIDTIPOOPERACAO: TFloatField;
    QryTipoOperTransfDESCTIPOOPERACAO: TStringField;
    QryTipoOperTransfNATUREZAOPERACAO: TStringField;
    QryTipoOperTransfFLGTRATAIR: TStringField;
    QryTipoOperTransfIDMERCADO: TFloatField;
    updOperacaoFundo: TUpdateSQL;
    dbeValorOperado: TDBRealEdit;
    qryDetOrigemIDOPERACAOFUNDO: TFloatField;
    qryExcluiIRLitigio: TwwQuery;
    qryDTAplOrigem: TwwQuery;
    qryDTAplDestino: TwwQuery;
    dsOperacaoFundo: TwwDataSource;
    lblValorOperado: TLabel;
    QryFundoDestino: TwwQuery;
    //AL_12
    QryTipoFundoDestino: TwwQuery;
    QryTipoFundoDestinoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoDestinoIDTIPOINVEST: TFloatField;
    QryTipoFundoDestinoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoDestinoDATAULTFECH: TDateTimeField;
    pnlOrigemGeral: TPanel;
    lblTipFndOrigem: TLabel;
    dblTipoFundoOrigem: TwwDBLookupCombo;
    lblFundoOrigem: TLabel;
    dblFundoOrigem: TwwDBLookupCombo;
    lblGestorOrigemTit: TLabel;
    lblGestorOrigem: TStaticText;
    pnlDestinoGeral: TPanel;
    BtOkTransf: TBitBtn;
    lblGestorDestino: TStaticText;
    dblFundoDestino: TwwDBLookupCombo;
    dblTipoFundoDestino: TwwDBLookupCombo;
    lblGestorDestinoTit: TLabel;
    lblFundoDesino: TLabel;
    lblTipFndDestino: TLabel;
    qryDTAplDestinoDATAULTMOV: TDateTimeField;
    qryDTAplOrigemDATAULTMOV: TDateTimeField;
    lblResgatando: TLabel;
    lblAplicando: TLabel;
    sttValorResgatado: TStaticText;
    sbtnImprime: TToolbarButton97;
    QryAux: TwwQuery;
    QryInsertCota: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    //AL_12
    QryFundoDestinoDESCFUNDOINVEST: TStringField;
    QryFundoDestinoDESCTIPOFUNDOINV: TStringField;
    QryFundoDestinoIDFUNDOINVEST: TFloatField;
    QryFundoDestinoIDTIPOFUNDOINVEST: TFloatField;
    QryFundoDestinoDTAINIPROC: TDateTimeField;
    QryFundoDestinoQTDDECVALOR: TFloatField;
    QryFundoDestinoIDGESTORCARTEIRA: TFloatField;
    QryFundoDestinoIDCARTEIRAINVEST: TFloatField;
    QryFundoOrigemDESCFUNDOINVEST: TStringField;
    QryFundoOrigemDESCTIPOFUNDOINV: TStringField;
    QryFundoOrigemIDFUNDOINVEST: TFloatField;
    QryFundoOrigemIDTIPOFUNDOINVEST: TFloatField;
    QryFundoOrigemDTAINIPROC: TDateTimeField;
    QryFundoOrigemQTDDECVALOR: TFloatField;
    QryFundoOrigemIDGESTORCARTEIRA: TFloatField;
    QryFundoOrigemIDCARTEIRAINVEST: TFloatField;
    QryTipoOperTransfORDEM: TFloatField;
    //AL_12
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblFundoOrigemChange(Sender: TObject);
    procedure dbgDetOrigemDblClick(Sender: TObject);
    procedure btnVoltarDetOrigemClick(Sender: TObject);
    procedure dblFundoDestinoChange(Sender: TObject);
    procedure dblTipoFundoDestinoChange(Sender: TObject);
    procedure dblFundoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoOrigemChange(Sender: TObject);
    procedure dblFundoDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure qryDetOrigemAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblTipoFundoDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edtVlrTransfOrigemChange(Sender: TObject);
    procedure BtOkTransfClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dsDetOrigemStateChange(Sender: TObject);
    procedure mnuTrfFndTotalClick(Sender: TObject);
    procedure dbeValorOperadoChange(Sender: TObject);
    procedure dbDtaTransfEnter(Sender: TObject);
    procedure dbDtaTransfExit(Sender: TObject);
    procedure dbgDetDestinoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDetOrigemStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure dbgDetOrigemEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDetOrigemDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pnlTitDestinoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDetOrigemMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbtnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    wbMudouOr,wbMudouDe: Boolean;
    wValTransf: Double;
    dDataTransf: TDateTime;
    function  Transfere:boolean;
    function  VerificaDados:boolean;
    function  VerificaDataFechamento: Char;
    procedure LimpaCampos(pAtua: Char; pData: Char);
    procedure HabilitaControles(pAcao, pAtua: Char);
    procedure AjustaQtdDec(OriDest: Byte; nDec: Integer);
  public
    { Public declarations }
  end;

const
  crTransf = 5;

var
  frmCadTransfFundos: TfrmCadTransfFundos;
  iPlanilha, iPlano, iDocumento : integer;
  iIdOperacaoFundoOrigem: integer;

implementation

uses UDatabase, DBaseDados,UMensErro,USistema,UOperComum, FPrincipal,
     UImpostos,UBibliotecaInvest,UFundoComum, UDiasUteisInv,
     FDmRelatoriosFundos, FParamOperTransf, FTelaAut, dFundoComum;

{$R *.DFM}

procedure TfrmCadTransfFundos.FormCreate(Sender: TObject);
begin
   inherited;

   MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));

   if iTipoInvestUsu <> 0 then
      MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST = ' + IntToStr(iTipoInvestUsu));

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;      

end;

procedure TfrmCadTransfFundos.FormShow(Sender: TObject);
begin
  inherited;
    btnVoltarDetOrigemClick(Self);
    if dbDtaTransf.CanFocus then
       dbDtaTransf.SetFocus;

    HabilitaControles('D','T');
    //Alt_1
    OperComum.LimpaParametros(QryTipoFundoOrigem);
    QryTipoFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    QryTipoFundoOrigem.Open;
    OperComum.LimpaParametros(QryTipoFundoDestino);
    QryTipoFundoDestino.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    QryTipoFundoDestino.Open;
    OperComum.LimpaParametros(QryFundoOrigem);
    QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString  := DateToStr(Date);
    QryFundoOrigem.Open;
    OperComum.LimpaParametros(QryFundoDestino);
    QryFundoDestino.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    QryFundoDestino.ParamByName('DATAMOVFUNDO').AsString  := DateToStr(Date);
    QryFundoDestino.Open;
    QryOperacaoFundo.Open;

    HabilitaControles('H','T');

    MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
end;

procedure TfrmCadTransfFundos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If dtmBaseDados.dbBaseDados.InTransaction then
       DtmBaseDados.dbBaseDados.Rollback;
    HabilitaControles('D','T');
    QryTipoFundoOrigem.Close;
    QryTipoFundoDestino.Close;
    QryFundoOrigem.Close;
    QryFundoDestino.Close;
    qryDetOrigem.Close;
    qryDetDestino.Close;
    QryOperacaoFundo.Close;
    qry.Close;
end;

procedure TfrmCadTransfFundos.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
    if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.Commit
    else
       MsgDlg('Não há Operações Pendentes para Confirmar.','Mensagem do Sistema',mtConfirmation,[MbOk],0);

    //AL_6
    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                           QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    //Al_9
    if StrToDate(dbDtaTransf.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       if Not Reprocessamento(iTipoInvestUsu,
                              QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                              -1,
                              dbDtaTransf.Date,
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
  //AL_13
          //Al_8
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0);
    end;
    QryTipoFundoInvest.Close;
    QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                           QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
    QryTipoFundoInvest.Open;

    //AL_9
    if StrToDate(dbDtaTransf.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
    begin
       if Not Reprocessamento(iTipoInvestUsu,
                              QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                              QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger,
                              -1,
                              dbDtaTransf.Date,
                              QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                              QryFundoDestino.FieldByName('DTAINIPROC').AsDateTime,
                              True) Then
  //AL_13
          //Al_8
          MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                 'Mensagem do Sistema', MtInformation,[MbOk],0)
       else
          MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
    end
    else
       MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

    QryTipoFundoInvest.Close;

    bbtnCancelarClick(Sender);
end;

function TfrmCadTransfFundos.VerificaDados:boolean;
begin
   Result := True;
   if Trim(dbDtaTransf.Text) = '' then
   begin
      MsgDlg('Data da tranferência não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   // AL_3
   //AL_10
   if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if Trim(dblFundoOrigem.Text) = '' then
   begin
      MsgDlg('Fundo de Investimento Origem não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(dblFundoDestino.Text) = '' then
   begin
      MsgDlg('Fundo de Investimento Destino não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   If edtVlrTransfOrigem.Value > qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat Then
   begin
      MsgDlg('Valor da transferência maior que o saldo da aplicação.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
end;

function TfrmCadTransfFundos.Transfere:boolean;
var
    wQtdOrigem, wQtdDestino, wCotApliDestino : Double;
    iIdOperacaoFundoDestino, iIdForCli       : Integer;
    fVlrCustoAcoes, fVlrVarAcoes             : Currency;
    //AL_20
    sMens: String;
begin
   iPlano     := -1;
   iPlanilha  := -1;
   iDocumento := -1;
   fVlrCustoAcoes         := 0;
   fVlrVarAcoes           := 0;
   iIdOperacaoFundoOrigem := 0;

   Try
      lblResgatando.Visible := True;
      lblResgatando.Refresh;

      QryTipoOperTransf.Close;
      QryTipoOperTransf.ParamByName('IDTIPOINVESTORIGEM').AsInteger :=
                                     QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
      QryTipoOperTransf.ParamByName('IDTIPOINVESTDESTINO').AsInteger :=
                                     QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
      QryTipoOperTransf.Open;
      QryTipoOperTransf.First;

      QryCotaFundo.Close;
      QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.ParamByName('DATACOTA').AsDateTime := dbDtaTransf.DateTime;
      QryCotaFundo.Open;
      //AL_6
      if QryCotaFundo.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'a cota do dia '+dbDtaTransf.Text+' não foi cadastrada para o Fundo de Origem.');

      // Se resgatar o Saldo total do certificado, o resgate despreza dif de arredondamento
      if edtVlrTransfOrigem.Value = qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat then
         wQtdOrigem := qryDetOrigem.FieldByName('SALDOQTDCOTAS').AsFloat
      else
         wQtdOrigem := OperComum.Trunca(edtVlrTransfOrigem.Value / QryCotaFundo.FieldByName('VLRCOTA').AsFloat,
                                        QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger);

      wValTransf := edtVlrTransfOrigem.Value;

      // Grava na OPERACAOFUNDO
      with QryOperacaoFundo do
      begin
         Insert;
         iIdOperacaoFundoOrigem := LeUltRegistro(nil,'OPERACAOFUNDO');
         FieldByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
         //AL_14
         FieldByName('IDOPERACAOORIGEM').AsInteger  := qryDetOrigem.FieldByName('IDOPERACAOFUNDO').AsInteger;
         FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
         FieldByName('IDTIPOINVEST').AsInteger      := QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
         FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger;
         FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
         FieldByName('DATAOPERACAO').AsDateTime     := dbDtaTransf.DateTime;
         FieldByName('DATALIQUIDACAO').AsDateTime   := dbDtaTransf.DateTime;
         FieldByName('QTDOPERACAO').AsFloat         := wQtdOrigem;
         FieldByName('VLROPERACAO').AsFloat         := edtVlrTransfOrigem.Value;
         FieldByName('VLRCOTA').AsFloat             := QryCotaFundo.FieldByName('VLRCOTA').AsFloat;
         FieldByName('STACONFIRMA').AsString        := 'S';
         FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         Post;
         ApplyUpdates;
         CommitUpdates;
      end;

      // Grava Resgate
      QryTipoOperTransf.Next;

      iIdForCli := OperComum.BuscaForCli(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                         QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                         QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         pRPI.IDTIPOCLIENTEEMI);
      //AL_15
      if iIdForCli = 0 then
         exit;

      //AL_20
      If Not AlimentaFundo(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                           QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                           qryDetOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                           iPlanoPrevContab,
                           iPatrocinadora,
                           iIdOperacaoFundoOrigem,
                           qryDetOrigem.FieldByName('IDOPERACAOFUNDO').AsInteger,
                           QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger,
                           QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           iIdForCli,
                           qryDetOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                           dbDtaTransf.DateTime,
                           dbDtaTransf.DateTime,
                           wQtdOrigem,
                           0,
                           edtVlrTransfOrigem.Value,
                           qryDetOrigem.FieldByName('VLRIRPROV').AsFloat,
                           qryDetOrigem.FieldByName('VLRIOFPROV').AsFloat,
                           QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                           Trim(QryTipoOperTransf.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString,
                           'OPE', True,
                           iPlanPrevCtbPatro,-1, -1, 0, sMens) Then
      begin
         //AL_6
         //AL_13
         //AL_20
         if sMens <> '' then
            Raise Exception.Create('Não foi possível efetuar o Resgate por Transferência do Fundo de Origem' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível efetuar o Resgate por Transferência do Fundo de Origem' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');
      end;

      //Al_2
      If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                      QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                      qryDetOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                      iIdForCli,
                                      QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                      StrToDate(dbDtaTransf.Text),
                                      StrToDate(dbDtaTransf.Text),
                                      'OPE', QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                                      QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                      True,
                                      edtVlrTransfOrigem.Value, 0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes) Then
    //AL_13
         //AL_6
         Raise Exception.Create('Não foi possível efetuar a contabilização do Resgate por Transferência do Fundo de Origem. '+#13+
                                'Esta operação será Cancelada.');
      //AL_6
      With DmFundoComum.QryUpdOpeFinCtb Do
      Begin
        Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
        ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
        ParamByName('PLANO').AsInteger             := iPlano;
        ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
        ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
        ExecSQL;
      End;

      lblResgatando.Visible := False;
      lblResgatando.Refresh;
      pnlTitOrigem.Refresh;

      // Grava Aplicação
      lblAplicando.Visible := True;
      lblAplicando.Refresh;

      QryCotaFundo.Close;
      QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.ParamByName('DATACOTA').AsDateTime := dbDtaTransf.DateTime;
      QryCotaFundo.Open;
      wQtdDestino := OperComum.Trunca(edtVlrTransfOrigem.Value / QryCotaFundo.FieldByName('VLRCOTA').AsFloat,
                                     QryFundoDestino.FieldByName('QTDDECVALOR').AsInteger);

      wCotApliDestino := (wValTransf / wQtdDestino );

      QryTipoOperTransf.Next;

      iIdForCli := OperComum.BuscaForCli(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                       QryFundoDestino.FieldByName('IDGESTORCARTEIRA').AsInteger,
                       QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                       pRPI.IDTIPOCLIENTEEMI);

      //AL_15
      if iIdForCli = 0 then
         exit;

      with QryOperacaoFundo do
      begin
         Insert;
         iIdOperacaoFundoDestino := LeUltRegistro(nil,'OPERACAOFUNDO');
         FieldByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoDestino;
         FieldByName('IDOPERACAOORIGEM').AsInteger  := iIdOperacaoFundoOrigem;
         FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoDestino.FieldByName('IDCARTEIRAINVEST').AsInteger;
         FieldByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
         FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger;
         FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger;
         FieldByName('DATAOPERACAO').AsDateTime     := dbDtaTransf.DateTime;
         FieldByName('DATALIQUIDACAO').AsDateTime   := dbDtaTransf.DateTime;
         FieldByName('QTDOPERACAO').AsFloat         := wQtdDestino;
         FieldByName('VLROPERACAO').AsFloat         := edtVlrTransfOrigem.Value;
         FieldByName('VLRCOTA').AsFloat             := wCotApliDestino;
         FieldByName('STACONFIRMA').AsString        := 'S';
         FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         Post;
         ApplyUpdates;
         CommitUpdates;
      end;

      //AL_20
      If Not AlimentaFundo(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                           QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                           QryFundoDestino.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger,
                           iPlanoPrevContab,
                           iPatrocinadora,
                           iIdOperacaoFundoOrigem,
                           iIdOperacaoFundoOrigem,
                           QryFundoDestino.FieldByName('QTDDECVALOR').AsInteger,
                           QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           iIdForCli,
                           { A data de Aplicação é a Data da aplicação original}
                           qryDetOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                           dbDtaTransf.DateTime,
                           dbDtaTransf.DateTime,
                           wQtdDestino,
                           wCotApliDestino,
                           edtVlrTransfOrigem.Value,
                           qryDetOrigem.FieldByName('VLRIRPROV').AsFloat,
                           qryDetOrigem.FieldByName('VLRIOFPROV').AsFloat,
                           QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                           Trim(QryTipoOperTransf.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                QryFundoDestino.FieldByName('DESCFUNDOINVEST').AsString,
                           'OPE', True,
                           iPlanPrevCtbPatro,-1,-1,0, sMens) Then
      begin
         //AL_6
         //AL_13
         //AL_20
         if sMens <> '' then
            Raise Exception.Create('Não foi possível efetuar a Aplicação por Transferência do Fundo de Destino' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível efetuar a Aplicação por Transferência do Fundo de Destino' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');
      end;

      //AL_17
      QryCotaFundo.Close;
      QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger :=
                              QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.ParamByName('DATACOTA').AsDateTime     :=
                              QryDetOrigem.FieldByName('DATAAPLICACAO').AsDateTime;
      QryCotaFundo.Open;

      If QryCotaFundo.IsEmpty Then
      Begin
         //AL_6
         QryInsertCota.Close;
         QryInsertCota.ParamByName('IDCOTAFUNDO').AsInteger   := LeUltRegistro(NIL,'COTAFUNDO');
         QryInsertCota.ParamByName('IDFUNDOINVEST').AsInteger :=
                              QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger;
         QryInsertCota.ParamByName('DATACOTA').AsDateTime     :=
                              QryDetOrigem.FieldByName('DATAAPLICACAO').AsDateTime;
         QryInsertCota.ParamByName('VLRCOTA').AsFloat         := wCotApliDestino;
         QryInsertCota.ExecSQL;
         QryInsertCota.Close;
      End;
      QryCotaFundo.Close;

      //UFundoComum.ContabilizaOperFundos;

      lblAplicando.Visible := False;
      lblAplicando.Refresh;
      pnlTitDestino.Refresh;

      Result     := True;

   Except
       On E:Exception Do Begin
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         lblResgatando.Visible := False;
         lblResgatando.Refresh;

         lblAplicando.Visible := False;
         lblAplicando.Refresh;

         Result := False;
       end;
   end
end;

procedure TfrmCadTransfFundos.sbtnInserirClick(Sender: TObject);
begin
//  inherited;
    sbtnApagar.Enabled   := False;
    sbtnProcurar.Enabled := False;
    sbtnImprime.Enabled  := False;

    //AL_18
    OperComum.LimpaParametros(QryOperacaoFundo);
    QryOperacaoFundo.Open;

    dbeValorOperado.Value:=0;

    if not bbtnCancelar.Enabled then
    begin
       dbDtaTransf.Clear;
       LimpaCampos('A','A');
       pnlFundo.Enabled := True;

       bbtnCancelar.Enabled := True;

       lblValorOperado.Visible := True;
       dbeValorOperado.Visible := True;

       dbDtaTransf.SetFocus;
    end
    else sbtnInserir.Down := True;
end;

procedure TfrmCadTransfFundos.LimpaCampos(pAtua: Char; pData: Char);
begin
   HabilitaControles('D','T');
   if pAtua in ['A', 'O'] then
   begin
      dblTipoFundoOrigem.Text := '';
      dblFundoOrigem.Text := '';
      lblGestorOrigem.Caption := '';
      with qryDetOrigem do
      begin
         Close;
         ParamByName('IDFUNDOINVEST').Clear;
         ParamByName('DATAMOVFUNDO').Clear;
         //AL_19
         ParamByName('IDTIPOINVEST').Clear;
         ParamByName('IDPLANPREVCTBPATR').Clear;
      end;

      QryTipoFundoOrigem.Close;
      QryTipoFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').Clear;
      QryTipoFundoOrigem.Open;

      QryFundoOrigem.Close;
      QryFundoOrigem.ParamByName('IDFUNDOINVEST').Clear;
      QryFundoOrigem.ParamByName('DATAMOVFUNDO').Clear;
      QryFundoOrigem.Open;
   end;

   if pAtua in ['A', 'O'] then
   begin
      dblTipoFundoDestino.Text := '';
      dblFundoDestino.Text := '';
      lblGestorDestino.Caption := '';
      with qryDetDestino do
      begin
         Close;
         ParamByName('IDFUNDOINVEST').Clear;
         ParamByName('DATAMOVFUNDO').Clear;
         //AL_19
         ParamByName('IDTIPOINVEST').Clear;
         ParamByName('IDPLANPREVCTBPATR').Clear;
      end;

      QryTipoFundoDestino.Close;
      QryTipoFundoDestino.ParamByName('IDTIPOFUNDOINVEST').Clear;
      QryTipoFundoDestino.Open;
      
      QryFundoDestino.Close;
      QryFundoDestino.ParamByName('IDFUNDOINVEST').Clear;
      QryFundoDestino.ParamByName('DATAMOVFUNDO').Clear;
      QryFundoDestino.Open;
   end;

   if (pData = 'S') then
      dbDtaTransf.Clear;

   lblValorOperado.Visible := False;
   dbeValorOperado.Visible := False;
   sbtnApagar.Enabled := False;
   HabilitaControles('H','T');
end;

procedure TfrmCadTransfFundos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   LimpaCampos('A','A');

   lblResgatando.Visible := False;
   lblResgatando.Refresh;

   lblAplicando.Visible  := False;
   lblAplicando.Refresh;

   pnlDetalheFndOrigem.SendToBack;

   bbtnConfirmar.Enabled      := False;
   bbtnCancelar.Enabled       := False;
   BtOkTransf.Enabled         := False;
   btnVoltarDetOrigem.Enabled := False;
   lblValorOperado.Visible    := False;
   dbeValorOperado.Visible    := False;
   sbtnApagar.Enabled         := False;
   sbtnProcurar.Enabled       := True;
   sbtnImprime.Enabled        := False;
end;

procedure TfrmCadTransfFundos.sbtnApagarClick(Sender: TObject);
var wStr : string;
begin
//   inherited;
   if not VerificaFechamentoOperacao(DateToStr(dbDtaTransf.Date)) then
      Exit;

   // AL_3
   //AL_10
   if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
   begin
      //AL_13
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
      Exit;
   end;

   //AL_5
   if VerEmAbertura(QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   Try
      //AL_7
      // Exclui Contábil das aplicações referentes a transferencia
      FazQuery(QryAux,'SELECT PLANO, PLNCODIGO, CODDOCUMENTO FROM HISTFUNDO WHERE IDOPERACAOFUNDO = '+ MontaSelect.ValoresChave[0]);

      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;     

      While Not QryAux.Eof Do
      begin
         if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                QryAux.FieldByName('PLNCODIGO').AsInteger,
                                QryAux.FieldByName('PLANO').AsInteger,
                                iTipoInvestUsu,
                                dbDtaTransf.Date, True) Then
         //AL_13
            Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

         QryAux.Next;

      end;

      QryAux.Close;

      qry.First;
      // Exclui Contábil/Financeiro do Fundo - Operacao origem
      if not ProcExcluiFundo(Qry.FieldByName('CODDOCUMENTO').AsInteger,
                             Qry.FieldByName('PLNCODIGO').AsInteger,
                             Qry.FieldByName('PLANO').AsInteger,
                             Qry.FieldByName('IDTIPOINVEST').AsInteger,
                             Qry.FieldByName('DATAOPERACAO').AsDateTime, True) Then
      //AL_13
         Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

      qryOperacaoFundo.First;
      // Exclui Contábil/Financeiro da operação do Fundo - operacao de Destino
      if not ProcExcluiFundo(qryOperacaoFundo.FieldByName('CODDOCUMENTO').AsInteger,
                             qryOperacaoFundo.FieldByName('PLNCODIGO').AsInteger,
                             qryOperacaoFundo.FieldByName('PLANO').AsInteger,
                             qryOperacaoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                             qryOperacaoFundo.FieldByName('DATAOPERACAO').AsDateTime, True) Then
         Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

      qryExcluiIRLitigio.Close;
      qryExcluiIRLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger  := StrToInt(MontaSelect.ValoresChave[0]);
      qryExcluiIRLitigio.ExecSQL;

      //AL_13
      if not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO      = '+ MontaSelect.ValoresChave[0]) then
         Raise Exception.Create('Ocorreu um problema ao excluir o histórico da operação.');

      //AL_13
      if not ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE IDOPERACAOORIGEM = '+ MontaSelect.ValoresChave[0]) then
         Raise Exception.Create('Ocorreu um problema ao excluir a operação de origem.');

      qry.Delete;
      qry.ApplyUpdates;
      //Al_7 - Fim

      DtmBaseDados.dbBaseDados.Commit;

      //AL_6
      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                             QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      if StrToDate(dbDtaTransf.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         if Not Reprocessamento(iTipoInvestUsu,
                                QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                dbDtaTransf.Date,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
         //AL_13
            //AL_8
            Raise Exception.Create('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!');
      end;

      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                             QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      if StrToDate(dbDtaTransf.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         if Not Reprocessamento(iTipoInvestUsu,
                                QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                dbDtaTransf.Date,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoDestino.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
      //AL_13
            //AL_8
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0)
         else
            MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
      end
      else
         MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      QryTipoFundoInvest.Close;

   Except
      // AL_3
      on E: Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível Excluir a Transferência.' + #13 + E.Message, 'Mensagem do Sistema ',MtWarning,[mbOK],0);
      end;
   end;
   QryAux.Close;
   sbtnApagar.Enabled := False;
   LimpaCampos('A','A');
   bbtnCancelarClick(Sender);
end;

procedure TfrmCadTransfFundos.sbtnProcurarClick(Sender: TObject);
var OpInc: String;
begin
  OpInc := '';
  inherited;
  If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  begin
     qry.Close;
     qry.ParamByName('IDOPERACAOFUNDO').AsString := MontaSelect.ValoresChave[0];
     qry.Open;

     qryOperacaoFundo.Close;
     qryOperacaoFundo.ParamByName('IDOPERACAOFUNDO').AsString := MontaSelect.ValoresChave[0];
     qryOperacaoFundo.Open;

     lblValorOperado.Visible := True;
     dbeValorOperado.Visible := True;

     if qry.IsEmpty then
     begin
        MsgDlg('As Operações da Transferência Registrada não foram Encontradas.','Mensagem do Sistema',MtWarning,[MbOk],0);
        Exit;
     end;

     if qry.RecordCount < 2 then
     begin
        case qry.FieldByName('IDTIPOOPERACAO').AsInteger of
        -39,-41: begin
                 MsgDlg('Operação de Aplicação por Transferência não Encontrada.','Mensagem do Sistema',MtWarning,[MbOk],0);
                 OpInc := 'RESG';
                 end;
        -38,-40: begin
                 MsgDlg('Operação de Resgate por Transferência não Encontrada.','Mensagem do Sistema',MtWarning,[MbOk],0);
                 OpInc := 'APLI';
                 end;
        end;
     end
     else OpInc := '';


     dbDtaTransf.DateTime   := qry.FieldByName('DATAOPERACAO').AsDateTime;

     // Dados de Origem - Resgate
     qry.First;

     if not (OpInc = 'APLI') then
     begin

        HabilitaControles('D','O');
        QryFundoOrigem.Close;
        QryFundoOrigem.UnPrepare;
        QryFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').Clear;
        QryFundoOrigem.ParamByName('IDFUNDOINVEST').AsInteger := qry.FieldByName('IDFUNDOINVEST').AsInteger;
        QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString   := dbDtaTransf.Text;
        QryFundoOrigem.Prepare;
        QryFundoOrigem.Open;
        dblFundoOrigem.LookupValue := qry.FieldByName('IDFUNDOINVEST').AsString;
        dblFundoOrigem.Text := QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString;

        QryTipoFundoOrigem.Close;
        QryTipoFundoOrigem.UnPrepare;
        QryTipoFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                           QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        QryTipoFundoOrigem.Prepare;
        QryTipoFundoOrigem.Open;
        dblTipoFundoOrigem.LookupValue := QryTipoFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsString;
        dblTipoFundoOrigem.Text := QryTipoFundoOrigem.FieldByName('DESCTIPOFUNDOINV').AsString;

        HabilitaControles('H','O');
        dblFundoOrigemChange(Self);
        dblFundoOrigemCloseUp(Self,QryFundoOrigem,nil,True);
        sbtnApagar.Enabled      := True;
        sbtnProcurar.Enabled    := True;
        sbtnImprime.Enabled     := True;
     end
     else
     begin
        dblTipoFundoOrigem.Text := '';
        dblFundoOrigem.Text := '';
        lblGestorOrigem.Caption := '';
     end;

     // Dados de Destino - Aplicação
     if not (OpInc = 'RESG') then
     begin
        HabilitaControles('D','D');
        QryFundoDestino.Close;
        QryFundoDestino.UnPrepare;
        QryFundoDestino.ParamByName('IDTIPOFUNDOINVEST').Clear;
        QryFundoDestino.ParamByName('IDFUNDOINVEST').AsInteger := qryOperacaoFundo.FieldByName('IDFUNDOINVEST').AsInteger;
        QryFundoDestino.ParamByName('DATAMOVFUNDO').AsString   := dbDtaTransf.Text;
        QryFundoDestino.Prepare;
        QryFundoDestino.Open;
        dblFundoDestino.LookupValue := QryFundoDestino.FieldByName('IDFUNDOINVEST').AsString;
        dblFundoDestino.Text := QryFundoDestino.FieldByName('DESCFUNDOINVEST').AsString;

        QryTipoFundoDestino.Close;
        QryTipoFundoDestino.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                            QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
        QryTipoFundoDestino.Open;
        dblTipoFundoDestino.LookupValue := QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsString;
        dblTipoFundoDestino.Text := QryTipoFundoDestino.FieldByName('DESCTIPOFUNDOINV').AsString;

        HabilitaControles('H','D');
        dblFundoDestinoChange(Self);
        dblFundoDestinoCloseUp(Self,QryFundoDestino,nil,True);

        sbtnApagar.Enabled := True;
     end
     else
     begin
        dblTipoFundoDestino.Text := '';
        dblFundoDestino.Text := '';
        lblGestorDestino.Caption := '';
     end;
  end;

end;

procedure TfrmCadTransfFundos.dblFundoOrigemChange(Sender: TObject);
begin
  inherited;
  wbMudouOr := True;
end;

procedure TfrmCadTransfFundos.dbgDetOrigemDblClick(Sender: TObject);
begin
  inherited;
  // Transferencia
  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
     dbgDetOrigem.SendToBack;
     pnlDetalheFndOrigem.Enabled := True;
     edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
     edtVlrTransfOrigem.SetFocus;
     edtVlrTransfOrigem.SelectAll;
  end
  //AL_13
  else MsgDlg('É Necessário Confirmar ou Cancelar a Operação Pendente.','Mensagem do Sistema',mtWarning,[mbOk],0);

end;

procedure TfrmCadTransfFundos.btnVoltarDetOrigemClick(Sender: TObject);
begin
  inherited;
  pnlDetalheFndOrigem.SendToBack;
  pnlDetalheFndOrigem.Enabled := False;
end;

procedure TfrmCadTransfFundos.dblFundoDestinoChange(Sender: TObject);
begin
  inherited;
  wbMudouDe := True;
end;

procedure TfrmCadTransfFundos.AjustaQtdDec(OriDest: Byte; nDec: Integer);
var x: Integer;
begin
  // Alterar a quantidade de casas decimais

  if OriDest = 1 then
  begin
     dbeQtdOrigem.DecDigits := nDec;
     qryDetOrigemSALDOQTDCOTAS.DisplayFormat := '###,###,###,##0.';
     for x := 1 to nDec do
         qryDetOrigemSALDOQTDCOTAS.DisplayFormat := qryDetOrigemSALDOQTDCOTAS.DisplayFormat + '0';

     qryDetOrigemSALDOQTDCOTAS.EditFormat := qryDetOrigemSALDOQTDCOTAS.DisplayFormat;

  end;

end;

procedure TfrmCadTransfFundos.dblTipoFundoDestinoChange(Sender: TObject);
begin
  inherited;
  wbMudouDe := True;
end;

procedure TfrmCadTransfFundos.dblFundoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if wbMudouOr then begin
     HabilitaControles('D','T');
     with qryDetOrigem do
     begin
        Close;
        ParamByName('IDFUNDOINVEST').Clear;
        ParamByName('DATAMOVFUNDO').Clear;
        //AL_19
        ParamByName('IDTIPOINVEST').Clear;
        ParamByName('IDPLANPREVCTBPATR').Clear;
     end;

     if not (Trim(dblFundoOrigem.Text) = '') then
     begin
        with qryGestorOrigem do
        begin
           Close;
           ParamByName('iIdGestor').AsInteger := QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger;
           Open;
           lblGestorOrigem.Caption := qryGestorOrigem.FieldByName('NOME').AsString;
           Close;
        end;

        VerificaDataFechamento;

        with qryDetOrigem do
        begin
           //AL_19
           ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
           ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
           ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
           ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
           qryDetOrigemSALDOQTDCOTAS.DisplayFormat    := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));
           Open;
           edtVlrTransfOrigem.Value := FieldByName('SALDOVLRFUNDO').AsFloat;
           pnlDestinoGeral.Enabled := True;
        end;
     end
     else begin
        qryDetOrigem.Open;
        lblGestorOrigem.Caption := '';
        pnlDestinoGeral.Enabled := False;
     end;
     wbMudouOr := False;
     HabilitaControles('H','T');
  end;

end;

procedure TfrmCadTransfFundos.dblTipoFundoOrigemChange(Sender: TObject);
begin
  inherited;
  wbMudouOr := True;
end;

procedure TfrmCadTransfFundos.dblFundoDestinoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if wbMudouDe then begin
     HabilitaControles('D','T');
     with qryDetDestino do
     begin
        Close;
        ParamByName('IDFUNDOINVEST').Clear;
        ParamByName('DATAMOVFUNDO').Clear;
        //AL_19
        ParamByName('IDTIPOINVEST').Clear;
        ParamByName('IDPLANPREVCTBPATR').Clear;
     end;

     if not (Trim(dblFundoDestino.Text) = '') then
     begin
        with QryGestorDestino do
        begin
           Close;
           ParamByName('iIdGestor').AsInteger := QryFundoDestino.FieldByName('IDGESTORCARTEIRA').AsInteger;
           Open;
           lblGestorDestino.Caption := QryGestorDestino.FieldByName('NOME').AsString;
           Close;
        end;
        VerificaDataFechamento;
        with qryDetDestino do
        begin
           //AL_19
           ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoDestino.LookupValue);
           ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
           ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
           ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
           qryDetDestinoSALDOQTDCOTAS.DisplayFormat   := MontaMascaraDecQtd(StrToInt(dblFundoDestino.LookupValue));
           Open;
        end;
     end
     else begin
        qryDetDestino.Open;
        lblGestorDestino.Caption := '';
     end;
     wbMudouDe := False;
     HabilitaControles('H','T');
  end;

end;

procedure TfrmCadTransfFundos.qryDetOrigemAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (sbtnInserir.Down) and (not dtmBaseDados.dbBaseDados.InTransaction) then
     dbeValorOperado.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
  edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
end;

procedure TfrmCadTransfFundos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

function TfrmCadTransfFundos.VerificaDataFechamento: Char;
var wbOrigem, wbDestino: Boolean;
begin
  wbOrigem := False;
  wbDestino:= False;
  Result   := 'F';
  if not (Trim(dblFundoOrigem.Text) = '') then
  begin
     qryDTAplOrigem.Close;
     qryDTAplOrigem.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
     qryDTAplOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     qryDTAplOrigem.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
     qryDTAplOrigem.ParamByName('DATAMOVFUNDO').AsString       := dbDtaTransf.Text;
     qryDTAplOrigem.Open;
     dDataTransf := qryDTAplOrigem.FieldByName('DATAULTMOV').AsDateTime;
     if Trim(dbDtaTransf.Text) = '' then
        dbDtaTransf.DateTime := qryDTAplOrigem.FieldByName('DATAULTMOV').AsDateTime;
     wbOrigem := True;
  end;

  if not (Trim(dblFundoDestino.Text) = '') then
  begin
     qryDTAplDestino.Close;
     qryDTAplDestino.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
     qryDTAplDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     qryDTAplDestino.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoDestino.LookupValue);
     qryDTAplDestino.ParamByName('DATAMOVFUNDO').AsString       := dbDtaTransf.Text;
     qryDTAplDestino.Open;
     wbDestino := True;
  end;

  if (wbOrigem) and (wbDestino) then
  begin
     if dbDtaTransf.DateTime > qryDTAplOrigem.FieldByName('DATAULTMOV').AsDateTime then
     begin
        MsgDlg('O Fundo Origem está com o saldo atualizando em '+qryDTAplOrigem.FieldByName('DATAULTMOV').AsString+'.'#13+
               'Faça a atualização do saldo para essa data de transferência.','Mensagem do Sistema',MtWarning,[MbOk],0);
        dbgDetOrigem.Enabled := False;
        Result := 'O';
     end
     else dbgDetOrigem.Enabled := True;

     if dbDtaTransf.DateTime > qryDTAplDestino.FieldByName('DATAULTMOV').AsDateTime then
     begin
        MsgDlg('O Fundo Destino está com o saldo atualizado em '+qryDTAplDestino.FieldByName('DATAULTMOV').AsString+'.'#13+
               'Faça a atualização do saldo para essa data de transferência.','Mensagem do Sistema',MtWarning,[MbOk],0);
              // AL_22
              dbgDetDestino.Enabled := False;
        Result := 'D'
     end
     // AL_22
     else
        dbgDetDestino.Enabled := True;

  end;

end;

procedure TfrmCadTransfFundos.dblTipoFundoDestinoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if sbtnInserir.Down then
  begin
     QryFundoDestino.Close;
     QryFundoDestino.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                              QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     if Trim(dblFundoOrigem.Text) <> '' then
        QryFundoDestino.ParamByName('IDFUNDOINVORIGEM').AsString := dblFundoOrigem.LookupValue
     else
        QryFundoDestino.ParamByName('IDFUNDOINVORIGEM').Clear;
        
     QryFundoDestino.ParamByName('DATAMOVFUNDO').AsString   := dbDtaTransf.Text;

     QryFundoDestino.Open;
  end;

end;

procedure TfrmCadTransfFundos.dblTipoFundoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if sbtnInserir.Down then
  begin
     QryFundoOrigem.Close;
     QryFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                              QryTipoFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString   := dbDtaTransf.Text;
     QryFundoOrigem.Open;
  end;

end;

procedure TfrmCadTransfFundos.edtVlrTransfOrigemChange(Sender: TObject);
begin
  inherited;
  if (sbtnInserir.Down) and (not dtmBaseDados.dbBaseDados.InTransaction) then
     dbeValorOperado.Value := edtVlrTransfOrigem.Value;
end;

procedure TfrmCadTransfFundos.BtOkTransfClick(Sender: TObject);
begin
//  inherited;
    if not VerificaDados then
       Exit;

    //AL_3
    //AL_10
    if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
    begin
       //AL_13
       MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
       Exit;
    end;

    //AL_5
    if VerEmAbertura(QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
       Exit;

    // Al_22
    // Verifica se existem Transferência entre planos posterior a data a ser transferida
    If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                               QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                               iPlanPrevCtbPatro,
                                               dbDtaTransf.DateTime) then
    Begin
        MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
               'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
        Exit;
    End; // Fim AL_22

    try
       // Inicia processo
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       // Resgate Retroativo
       // Exclui movimentação Posterior - Origem/Destino obrigatóriamente na mesma data
       if dbDtaTransf.Date < qryDTAplOrigem.FieldByName('DATAULTMOV').AsDateTime then
       begin
          //Al_11
          // Exclui Origem
          if not ExcluiMovimento(iTipoInvestUsu,
                                 qryDetOrigemIDPLANPREVCTBPATR.AsInteger,
                                 qryDetOrigemIDFUNDOINVEST.AsInteger,
                                 qryDetOrigemDATAAPLICACAO.AsDateTime,
                                 qryDetOrigemDATAMOVFUNDO.AsDateTime, False, True) then
          //AL_13
             Raise Exception.Create('Não foi possível excluir uma movimentação posterior para o Fundo Origem.');

          //Al_11
          // Exclui Destino
          if not ExcluiMovimento(iTipoInvestUsu,
                                 qryDetDestinoIDPLANPREVCTBPATR.AsInteger,
                                 qryDetDestinoIDFUNDOINVEST.AsInteger,
                                 qryDetDestinoDATAAPLICACAO.AsDateTime,
                                 qryDetDestinoDATAMOVFUNDO.AsDateTime, False, True) then
          //AL_13
             Raise Exception.Create('Não foi possível excluir uma movimentação posterior para o Fundo Destino.');

       end;

       //AL_13       
       if not Transfere then
          Raise Exception.Create('Não foi possível efetuar a transferência entre Fundos.')
       else
          MsgDlg('Transferência concluído com sucesso.','Mensagem do Sistema',mtInformation,[MbOk],0);

       BtOkTransf.Enabled := False;
       btnVoltarDetOrigem.Enabled := False;
       bbtnConfirmar.Enabled := True;
       bbtnCancelar.Enabled := True;
    except
       on E: Exception do
       begin
          DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg('Ocorreu problema na operação ...'+
                 #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
       end;
    end;

    HabilitaControles('D','T');
    btnVoltarDetOrigemClick(Self);
    qryDetOrigem.Close;
    qryDetOrigem.Open;
    qryDetDestino.Close;
    qryDetDestino.Open;
    dbgDetOrigem.Refresh;
    dbgDetDestino.Refresh;
    HabilitaControles('H','T');
    //Al_11 
end;

procedure TfrmCadTransfFundos.bbtnSairClick(Sender: TObject);
begin
  if DtmBaseDados.dbBaseDados.InTransaction then
     DtmBaseDados.dbBaseDados.Rollback;
  Close;
end;

procedure TfrmCadTransfFundos.dsDetOrigemStateChange(Sender: TObject);
begin
  inherited;
  case dsDetOrigem.State of
       dsInactive: begin
                   BtOkTransf.Enabled := False;
                   btnVoltarDetOrigem.Enabled := False;
                   end
       else begin
                   BtOkTransf.Enabled := True;
                   btnVoltarDetOrigem.Enabled := True;
       end;
  end;
end;

procedure TfrmCadTransfFundos.mnuTrfFndTotalClick(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
  begin
     BtOkTransfClick(Sender)
  end
  else MsgDlg('É Necessário Confirmar ou Cancelar a Operação Pendente.','Mensagem do Sistema',mtWarning,[mbOk],0);
end;

procedure TfrmCadTransfFundos.dbeValorOperadoChange(Sender: TObject);
begin
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
     dbeValorOperado.Value := wValTransf;
end;

procedure TfrmCadTransfFundos.dbDtaTransfEnter(Sender: TObject);
begin
  inherited;
  dDataTransf := dbDtaTransf.DateTime;
end;

procedure TfrmCadTransfFundos.dbDtaTransfExit(Sender: TObject);
begin
  inherited;
  if dDataTransf <> dbDtaTransf.DateTime then
  begin
     if VerificaDataFechamento = 'A' then
        LimpaCampos('A','A')
     else
     begin
        wbMudouOr := True;
     end;

     wbMudouDe := True;
  end;
end;

procedure TfrmCadTransfFundos.dbgDetDestinoDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  sttValorResgatado.Left := 350 + X;
  sttValorResgatado.Top  := TControl(Sender).Top + 238 + Y;
  Accept := True;
end;

procedure TfrmCadTransfFundos.dbgDetOrigemStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  inherited;
  if not qryDetDestino.IsEmpty then
     sttValorResgatado.Caption := FormatFloat('##,###,###,###,##0.00', qryDetOrigemSALDOVLRFUNDO.AsFloat)
  else
     sttValorResgatado.Caption := FormatFloat('##,###,###,###,##0.00', 0);

  sttValorResgatado.Left := 9 + Mouse.CursorPos.x;
  sttValorResgatado.Top  := Mouse.CursorPos.y - 125;
  sttValorResgatado.Visible := True;
  sttValorResgatado.Refresh;
end;

procedure TfrmCadTransfFundos.dbgDetOrigemEndDrag(Sender, Target: TObject;
  X, Y: Integer);
begin
  inherited;
  sttValorResgatado.Visible := False;
  sttValorResgatado.Caption := FormatFloat('##,###,###,###,##0.00', 0);
  sttValorResgatado.Refresh;
  if Target <> nil then
    if not dtmBaseDados.dbBaseDados.InTransaction then
       BtOkTransfClick(Sender)
    //AL_13
    else MsgDlg('É Necessário Confirmar ou Cancelar a Operação Pendente.','Mensagem do Sistema',mtWarning,[mbOk],0);
end;

procedure TfrmCadTransfFundos.dbgDetOrigemDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  sttValorResgatado.Left := TControl(Sender).Left + 20 + X;
  sttValorResgatado.Top  := TControl(Sender).Top + 37 + Y;
  sttValorResgatado.Refresh;
  Accept := False;
end;

procedure TfrmCadTransfFundos.pnlTitDestinoDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  if X < 329 then
     sttValorResgatado.Left := 330
  else
     sttValorResgatado.Left := 20 + X;
  sttValorResgatado.Top  := TControl(Sender).Top + 238 + Y;
  sttValorResgatado.Refresh;
  Accept := False;
end;

procedure TfrmCadTransfFundos.dbgDetOrigemMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssLeft in Shift then
     dbgDetOrigem.BeginDrag(False);         
end;

procedure TfrmCadTransfFundos.sbtnImprimeClick(Sender: TObject);
var Acao: Integer;
begin
  inherited;
  Acao := mrYes;
  if Trim(dbDtaTransf.Text) = '' then
     Acao := AbrirFormModal(frmParamOperTransf,TfrmParamOperTransf);

  if Acao in [mrOk, mrYes] then
  begin
     OperComum.LimpaParametros(DmRelatoriosFundo.qryTransferencia);
     with DmRelatoriosFundo.qryTransferencia do
     begin
        ParamByName('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
        ParamByName('IDPLANPREVCTBPATR').AsInteger  := iPlanPrevCtbPatro;
        ParamByName('DATAMOVFUNDO').AsString        := dbDtaTransf.Text;
        Open;
     end;
     DmRelatoriosFundo.lblTransfDataCabTxt.Caption  := dbDtaTransf.Text;
     TfrmPreview.CreateModalPreview(Application,
                                    DmRelatoriosFundo.rptTransferencia,
                                    DmRelatoriosFundo.rptTransferencia.PrinterSetup.DocumentName);
  end;
  if Acao = mrOk then
     dbDtaTransf.Clear;
  sbtnImprime.Down := False;
end;

procedure TfrmCadTransfFundos.HabilitaControles(pAcao, pAtua: Char);
begin
   if pAcao = 'H' then
   begin
      if pAtua in ['O', 'A'] then
      begin
         QryTipoFundoOrigem.EnableControls;
         QryFundoOrigem.EnableControls;
         qryDetOrigem.EnableControls;
      end;
      if pAtua in ['D', 'A'] then
      begin
         QryTipoFundoDestino.EnableControls;
         QryFundoDestino.EnableControls;
         qryDetDestino.EnableControls;
      end;
   end
   else if pAcao = 'D' then
   begin
      if pAtua in ['O', 'A'] then
      begin
         QryTipoFundoOrigem.DisableControls;
         QryFundoOrigem.DisableControls;
         qryDetOrigem.DisableControls;
      end;
      if pAtua in ['D', 'A'] then
      begin
         QryTipoFundoDestino.DisableControls;
         QryFundoDestino.DisableControls;
         qryDetDestino.DisableControls;
      end;
   end;
end;

end.