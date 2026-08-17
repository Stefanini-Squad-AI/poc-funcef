//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_3
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores a transferência
//             Trunc nas querys de FundoOrigem 
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_2
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 23/11/2006
// Código    : AL_1
// Pendencia : 23349
// SOL       : 48910
// Motivo    : Implementação(criação)
//******************************************************************************

unit FCadTransfFundoTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, DBCtrls, wwdblook, TREdit, Grids, Wwdbigrd,
  Wwdbgrid, Menus, FPreview, FCadastroCSInv, fcLabel,
  uCtrlInvContab, faMensagem;

type
  TfrmCadTransfFundoTipo = class(TfrmCadastroCSInv)
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
    lblSaldoOrigem: TLabel;
    QryCotaFundo: TwwQuery;
    QryCotaFundoVLRCOTA: TFloatField;
    QryTipoFundoOrigemIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoOrigemIDTIPOINVEST: TFloatField;
    QryTipoFundoOrigemDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoOrigemDATAULTFECH: TDateTimeField;
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
    btnVoltarDetOrigem: TBitBtn;
    mnuTransfFundosOrigem: TPopupMenu;
    mnuTrfFndParcial: TMenuItem;
    mnuTrfFndTotal: TMenuItem;
    dsDetDestino: TDataSource;
    dbeQtdOrigem: TDBRealEdit;
    dbeCotaAplicOrigem: TDBRealEdit;
    dbeVlrAplicOrigem: TDBRealEdit;
    dbeSaldoOrigem: TDBRealEdit;
    qryDetOrigemIDOPERACAOFUNDO: TFloatField;
    qryExcluiIRLitigio: TwwQuery;
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
    pnlDestinoGeral: TPanel;
    BtOkTransf: TBitBtn;
    dblTipoFundoDestino: TwwDBLookupCombo;
    lblTipFndDestino: TLabel;
    QryTipoFundoInvest: TwwQuery;
    lbTipoCotaOrig: TLabel;
    lbTipoCotaDest: TLabel;
    dblTipoCotaDest: TwwDBLookupCombo;
    dblTipoCotaOrig: TwwDBLookupCombo;
    QryTipoCotaDestino: TwwQuery;
    QryTipoCotaDestinoIDTIPOCOTA: TFloatField;
    QryTipoCotaDestinoDESCTIPOCOTA: TStringField;
    QryTipoCotaOrigem: TwwQuery;
    QryTipoCotaOrigemIDTIPOCOTA: TFloatField;
    QryTipoCotaOrigemDESCTIPOCOTA: TStringField;
    qryOperacaoFundo: TwwQuery;
    dsOperacaoFundo: TwwDataSource;
    updOperacaoFundo: TUpdateSQL;
    qryDetDestinoIDTIPOCOTA: TFloatField;
    qryDetDestinoDESCTIPOCOTA: TStringField;
    qryDetOrigemIDTIPOCOTA: TFloatField;
    qryDetOrigemDESCTIPOCOTA: TStringField;
    QryFundoOrigemDESCFUNDOINVEST: TStringField;
    QryFundoOrigemIDFUNDOINVEST: TFloatField;
    QryFundoOrigemIDTIPOFUNDOINVEST: TFloatField;
    QryFundoOrigemDTAINIPROC: TDateTimeField;
    QryFundoOrigemQTDDECVALOR: TFloatField;
    QryFundoOrigemIDGESTORCARTEIRA: TFloatField;
    QryFundoOrigemIDCARTEIRAINVEST: TFloatField;
    QryAux: TwwQuery;
    ToolbarSep972: TToolbarSep97;
    bbtnTransferir: TBitBtn;
    fraMens: TfraMensagem;
    QryHistCotaOrigem: TwwQuery;
    QryHistCotaOrigemIDTIPOCOTA: TFloatField;
    QryHistCotaOrigemIDFUNDOINVEST: TFloatField;
    QryHistCotaOrigemIDTIPOINVEST: TFloatField;
    QryHistCotaOrigemPLNCODIGO: TFloatField;
    QryHistCotaOrigemIDCOTAINTEGRALIZA: TFloatField;
    QryHistCotaOrigemIDPLANPREVCTBPATR: TFloatField;
    QryHistCotaOrigemDATAHISTCOTAINTEG: TDateTimeField;
    QryHistCotaOrigemVLRCOTAINTEGR: TFloatField;
    QryHistCotaOrigemVLRHISTCOTAINTEGR: TFloatField;
    QryHistCotaOrigemQTDHISTCOTAINTEGR: TFloatField;
    QryHistCotaOrigemVLRVARIACAODIA: TFloatField;
    QryHistCotaOrigemTRGDTINCLUSAO: TDateTimeField;
    QryHistCotaOrigemTRGUSERINCLUSAO: TStringField;
    QryHistCotaOrigemPLANO: TFloatField;
    QryHistCotaOrigemTIPMOVCOTAINTEGR: TStringField;
    QryHistCotaOrigemQTDMOVCOTAINTEGR: TFloatField;
    QryHistCotaOrigemIDOPERACAOFUNDO: TFloatField;
    QryHistCotaOrigemDATAAPLICACAO: TDateTimeField;
    QryHistCotaOrigemDESCTIPOCOTA: TStringField;
    QryHistCotaDestino: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DateTimeField2: TDateTimeField;
    StringField1: TStringField;
    FloatField11: TFloatField;
    StringField2: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    DateTimeField3: TDateTimeField;
    StringField3: TStringField;
    QryHistAux: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dblFundoOrigemChange(Sender: TObject);
    procedure btnVoltarDetOrigemClick(Sender: TObject);
    procedure dblTipoFundoDestinoChange(Sender: TObject);
    procedure dblFundoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoOrigemChange(Sender: TObject);
    procedure qryDetOrigemAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblTipoFundoDestinoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtOkTransfClick(Sender: TObject);
    procedure dsDetOrigemStateChange(Sender: TObject);
    procedure mnuTrfFndTotalClick(Sender: TObject);
    procedure dbDtaTransfEnter(Sender: TObject);
    procedure dbDtaTransfExit(Sender: TObject);
    procedure dblTipoFundoOrigemExit(Sender: TObject);
    procedure dblFundoOrigemExit(Sender: TObject);
    procedure dblTipoCotaOrigCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaOrigExit(Sender: TObject);
    procedure dblTipoFundoDestinoExit(Sender: TObject);
    procedure dblTipoCotaDestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoCotaDestExit(Sender: TObject);
    procedure dblTipoCotaDestChange(Sender: TObject);
    procedure dblTipoCotaOrigChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnTransferirClick(Sender: TObject);
    procedure bbtnAjudaClick(Sender: TObject);
  private
    { Private declarations }
    wbMudouOr,wbMudouDe, wbModif : Boolean;
    wValTransf : Double;
    dDataTransf : TDateTime;
    function  Transfere:boolean;
    function  TransfereHistCotaIntegraliza:Boolean;  //Renan Cristiano SOL 130444 Kintana 733394
    function  VerificaDados:boolean;
    function  VerificaDataFechamento: Char;
    function  VerificaTransfPassadas: Boolean;
    procedure LimpaCampos(pAtua: Char; pData: Char);
    procedure HabilitaControles(pAcao, pAtua: Char);
    procedure AjustaQtdDec(OriDest: Byte; nDec: Integer);
  public
    { Public declarations }
  end;

var
  frmCadTransfFundoTipo: TfrmCadTransfFundoTipo;

implementation

uses UDatabase, DBaseDados,UMensErro,USistema, UOperComum, FPrincipal,
     UBibliotecaInvest, UFundoComum, UDiasUteisInv, FTelaAut, dFundoComum;

{$R *.DFM}

procedure TfrmCadTransfFundoTipo.FormCreate(Sender: TObject);
begin
   inherited;

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;

end;

procedure TfrmCadTransfFundoTipo.FormShow(Sender: TObject);
begin
  inherited;
    btnVoltarDetOrigemClick(Self);
    if dbDtaTransf.CanFocus then
       dbDtaTransf.SetFocus;

    HabilitaControles('D','T');

    OperComum.LimpaParametros(QryTipoFundoOrigem);
    QryTipoFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    QryTipoFundoOrigem.Open;

    OperComum.LimpaParametros(QryTipoFundoDestino);
    QryTipoFundoDestino.Open;

    OperComum.LimpaParametros(QryTipoCotaOrigem);
    QryTipoCotaOrigem.Open;

    OperComum.LimpaParametros(QryTipoCotaDestino);
    QryTipoCotaDestino.Open;

    OperComum.LimpaParametros(QryFundoOrigem);
    QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
    QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString  := DateToStr(pRPI.DATAULTFECHFDO);
    QryFundoOrigem.Open;

    OperComum.LimpaParametros(QryOperacaoFundo);
    QryOperacaoFundo.ParamByName('IDOPERACAOFUNDO').AsInteger := -1;
    QryOperacaoFundo.Open;

    HabilitaControles('H','T');

    MontaSelect.Filtro.Add('OPERACAODESTINO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));

    MontaSelect.Filtro.Add('OPERACAOORIGEM.IDTIPOINVEST       = ' + IntToStr(iTipoInvestUsu));
    MontaSelect.Filtro.Add('OPERACAOORIGEM.IDPLANPREVCTBPATR  = ' + IntToStr(iPlanPrevCtbPatro));

    lbTipoCotaOrig.Visible  := (iTipoInvestUsu in [9,10]);
    dblTipoCotaOrig.Visible := (iTipoInvestUsu in [9,10]);

end;

procedure TfrmCadTransfFundoTipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    If dtmBaseDados.dbBaseDados.InTransaction then
       DtmBaseDados.dbBaseDados.Rollback;

    HabilitaControles('D','T');

    QryTipoCotaOrigem.Close;
    QryTipoCotaDestino.Close;
    QryTipoFundoOrigem.Close;
    QryTipoFundoDestino.Close;
    QryFundoOrigem.Close;
    qryDetOrigem.Close;
    qryHistCotaOrigem.Close;
    qryHistCotaDestino.Close;
    qryDetDestino.Close;
    QryOperacaoFundo.Close;
    qry.Close;
    QryCotaFundo.Close;
    qryExcluiIRLitigio.Close;
    QryTipoOperTransf.Close;
    QryTipoFundoInvest.Close;
end;

procedure TfrmCadTransfFundoTipo.bbtnConfirmarClick(Sender: TObject);
var iTipoCota : Integer;
begin
   fraMens.Apaga;
   iTipoCota := -1;

   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit
   else
      MsgDlg('Não há Operações Pendentes para Confirmar.','Mensagem do Sistema',mtConfirmation,[MbOk],0);

   OperComum.LimpaParametros(QryTipoFundoInvest);
   QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                      QryTipoFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   QryTipoFundoInvest.Open;

   if StrToDate(dbDtaTransf.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
   begin
      if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
         iTipoCota := StrToInt(dblTipoCotaOrig.LookupValue)
      else iTipoCota := -1;

      if Not Reprocessamento(iTipoInvestUsu,
                             QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                             QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                             -1,
                             dbDtaTransf.Date,
                             QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                             QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime,
                             True, iTipoCota, nil, True) Then
         MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                'Mensagem do Sistema', MtInformation,[MbOk],0);
   end;

   OperComum.LimpaParametros(QryTipoFundoInvest);
   QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                          QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
   QryTipoFundoInvest.Open;

   if StrToDate(dbDtaTransf.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
   begin
      if ((dblTipoCotaDest.Visible) and (dblTipoCotaDest.Text <> '')) then
         iTipoCota := StrToInt(dblTipoCotaDest.LookupValue)
      else iTipoCota := -1;

      if Not Reprocessamento(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                             QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                             QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                             -1,
                             dbDtaTransf.Date,
                             QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                             QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime,
                             True, iTipoCota, nil, True) Then
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

function TfrmCadTransfFundoTipo.VerificaDados:boolean;
begin
   Result := True;
   if Trim(dbDtaTransf.Text) = '' then
   begin
      MsgDlg('Data da tranferência não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end;
   if Trim(dblTipoFundoOrigem.Text) = '' then
   begin
      MsgDlg('Tipo de Fundo Origem não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(dblFundoOrigem.Text) = '' then
   begin
      MsgDlg('Fundo de Investimento Origem não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   if Trim(dblTipoFundoDestino.Text) = '' then
   begin
      MsgDlg('Tipo de Fundo Destino não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;
   //Renan Cristiano SOL 130444 Kintana 733394 inicio
   {if qryDetOrigem.IsEmpty then
   begin
      MsgDlg('Não existe saldo origem.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end;}
   //Renan Cristiano SOL 130444 Kintana 733394 Fim.
end;

function TfrmCadTransfFundoTipo.Transfere:boolean;
var
    wCotApliDestino : Double;
    iTipoCota, iIdForCli,  iPlanilha, iPlano, iDocumento, iIdOperacaoFundoDestino, iIdOperacaoFundoOrigem : integer;
    fVlrCustoAcoes, fVlrVarAcoes             : Currency;
    //AL_2
    sMens: String;
begin
   iPlano     := -1;
   iPlanilha  := -1;
   iDocumento := -1;
   iTipoCota  := -1;
   iIdForCli  := -1;
   fVlrCustoAcoes          := 0;
   fVlrVarAcoes            := 0;
   iIdOperacaoFundoOrigem  := 0;
   iIdOperacaoFundoDestino := 0;

   Try
      OperComum.LimpaParametros(QryTipoOperTransf);
      QryTipoOperTransf.ParamByName('IDTIPOINVEST').AsInteger   :=
                                     QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
      QryTipoOperTransf.ParamByName('IDTIPOOPERACAO').AsInteger := -160;
      QryTipoOperTransf.Open;
      if QryTipoOperTransf.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'não foi cadastrada o tipo de operação(-160) para o Fundo de Origem.');

      OperComum.LimpaParametros(QryCotaFundo);
      QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.ParamByName('DATACOTA').AsDateTime     := dbDtaTransf.DateTime;
      if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
         QryCotaFundo.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCotaOrig.LookupValue);
      QryCotaFundo.Open;
      if QryCotaFundo.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'a cota do dia '+dbDtaTransf.Text+' não foi cadastrada para o Fundo de Origem.');
      with QryOperacaoFundo do
      begin
         Insert;
         iIdOperacaoFundoOrigem := LeUltRegistro(nil,'OPERACAOFUNDO');
         FieldByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
         FieldByName('IDOPERACAOORIGEM').AsInteger  := qryDetOrigem.FieldByName('IDOPERACAOFUNDO').AsInteger;
         FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
         FieldByName('IDTIPOINVEST').AsInteger      := QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
         FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger;
         FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
         FieldByName('DATAOPERACAO').AsDateTime     := dbDtaTransf.DateTime;
         FieldByName('DATALIQUIDACAO').AsDateTime   := dbDtaTransf.DateTime;
         FieldByName('QTDOPERACAO').AsFloat         := qryDetOrigem.FieldByName('SALDOQTDCOTAS').AsFloat;
         FieldByName('VLROPERACAO').AsFloat         := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
         FieldByName('VLRCOTA').AsFloat             := QryCotaFundo.FieldByName('VLRCOTA').AsFloat;
         FieldByName('STACONFIRMA').AsString        := 'S';
         FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
            FieldByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCotaOrig.LookupValue);
         Post;
         ApplyUpdates;
         CommitUpdates;
      end;

      QryCotaFundo.Close;

      if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
         iTipoCota := StrToInt(dblTipoCotaOrig.LookupValue);

      //AL_2
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
                           -1,
                           qryDetOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                           dbDtaTransf.DateTime,
                           dbDtaTransf.DateTime,
                           qryDetOrigem.FieldByName('SALDOQTDCOTAS').AsFloat,
                           0,
                           qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat,
                           qryDetOrigem.FieldByName('VLRIRPROV').AsFloat,
                           qryDetOrigem.FieldByName('VLRIOFPROV').AsFloat,
                           QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                           Trim(QryTipoOperTransf.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString,
                           'TRT', True,
                           iPlanPrevCtbPatro,-1, -1, 0, sMens, iTipoCota) Then
      begin
         //AL_2
         if sMens <> '' then
            Raise Exception.Create('Não foi possível confirmar o Resgate por Transferência do Fundo de Origem' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível confirmar o Resgate por Transferência do Fundo de Origem' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');

      end;

      if (QryTipoOperTransf.FieldByName('FLGGERACONTAB').AsInteger = 1) then
      begin
         iIdForCli := OperComum.BuscaForCli(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                            QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            pRPI.IDTIPOCLIENTEEMI);
         if iIdForCli = 0 then
            Raise Exception.Create('Verificar a parametrização do tipo de operação e'+#13+
                                    'o gestor da carteira para o Fundo de Origem.');

         if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
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
                                         qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat, 0, 0, 0, 0,
                                         fVlrCustoAcoes, fVlrVarAcoes, iTipoCota) Then
            Raise Exception.Create('Não foi possível efetuar a contabilização do Resgate por Transferência do Fundo de Origem. '+#13+
                                   'Esta operação será Cancelada.');

         With DmFundoComum.QryUpdOpeFinCtb Do
         Begin
            Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
            ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
            ParamByName('PLANO').AsInteger             := iPlano;
            ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
            ExecSQL;
         End;
      end;

      pnlTitOrigem.Refresh;

      // Grava Aplicação
      OperComum.LimpaParametros(QryTipoOperTransf);
      QryTipoOperTransf.ParamByName('IDTIPOINVEST').AsInteger   :=
                                     QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
      QryTipoOperTransf.ParamByName('IDTIPOOPERACAO').AsInteger := -161;
      QryTipoOperTransf.Open;
      if QryTipoOperTransf.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'não foi cadastrada o tipo de operação(-161) para o Fundo de Destino.');

      wCotApliDestino := (edtVlrTransfOrigem.Value/ dbeQtdOrigem.Value);

      with QryOperacaoFundo do
      begin
         Insert;
         iIdOperacaoFundoDestino := LeUltRegistro(nil,'OPERACAOFUNDO');
         FieldByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoDestino;
         FieldByName('IDOPERACAOORIGEM').AsInteger  := iIdOperacaoFundoOrigem;
         FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
         FieldByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
         FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger;
         FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
         FieldByName('DATAOPERACAO').AsDateTime     := dbDtaTransf.DateTime;
         FieldByName('DATALIQUIDACAO').AsDateTime   := dbDtaTransf.DateTime;
         FieldByName('QTDOPERACAO').AsFloat         := qryDetOrigem.FieldByName('SALDOQTDCOTAS').AsFloat;
         FieldByName('VLROPERACAO').AsFloat         := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
         FieldByName('VLRCOTA').AsFloat             := wCotApliDestino;
         FieldByName('STACONFIRMA').AsString        := 'S';
         FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         if ((dblTipoCotaDest.Visible) and (dblTipoCotaDest.Text <> '')) then
            FieldByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCotaDest.LookupValue);
         Post;
         ApplyUpdates;
         CommitUpdates;
      end;

      if ((dblTipoCotaDest.Visible) and (dblTipoCotaDest.Text <> '')) then
         iTipoCota := StrToInt(dblTipoCotaDest.LookupValue);

      //AL_2
      If Not AlimentaFundo(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                           QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                           QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                           iPlanoPrevContab,
                           iPatrocinadora,
                           iIdOperacaoFundoDestino,
                           iIdOperacaoFundoDestino,
                           QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger,
                           QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           -1,
                           qryDetOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                           dbDtaTransf.DateTime,
                           dbDtaTransf.DateTime,
                           qryDetOrigem.FieldByName('SALDOQTDCOTAS').AsFloat,
                           wCotApliDestino,
                           qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat,
                           qryDetOrigem.FieldByName('VLRIRPROV').AsFloat,                                                -
                           qryDetOrigem.FieldByName('VLRIOFPROV').AsFloat,
                           QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                           Trim(QryTipoOperTransf.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString,
                           'TRT', True,
                           iPlanPrevCtbPatro, -1, -1, 0, sMens, iTipoCota,
                           qryDetOrigem.FieldByName('VLRAPLICADO').AsFloat) Then
      begin
         //AL_2
         if sMens <> '' then
            Raise Exception.Create('Não foi possível confirmar o Resgate por Transferência do Fundo de Destino' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível confirmar o Resgate por Transferência do Fundo de Destino' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');
      end;

      if (QryTipoOperTransf.FieldByName('FLGGERACONTAB').AsInteger = 1) then
      begin
         iIdForCli := OperComum.BuscaForCli(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                            QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            pRPI.IDTIPOCLIENTEEMI);
         if iIdForCli = 0 then
            Raise Exception.Create('Verificar a parametrização do tipo de operação e'+#13+
                                    'o gestor da carteira para o Fundo de Origem.');

         if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                         QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                         qryDetDestino.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                         iIdForCli,
                                         QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                         StrToDate(dbDtaTransf.Text),
                                         StrToDate(dbDtaTransf.Text),
                                         'OPE', QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                                         QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                         True,
                                         qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat, 0, 0, 0, 0,
                                         fVlrCustoAcoes, fVlrVarAcoes, iTipoCota) Then
            Raise Exception.Create('Não foi possível efetuar a contabilização da Aplicação por Transferência do Fundo de Destino. '+#13+
                                   'Esta operação será Cancelada.');

         With DmFundoComum.QryUpdOpeFinCtb Do
         Begin
            Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
            ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoDestino;
            ParamByName('PLANO').AsInteger             := iPlano;
            ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
            ExecSQL;
         End;
      end;

      pnlTitDestino.Refresh;

      Result     := True;

   Except
       On E:Exception Do Begin
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         Result := False;
       end;
   end
end;

procedure TfrmCadTransfFundoTipo.sbtnInserirClick(Sender: TObject);
begin
    sbtnApagar.Enabled   := False;
    sbtnProcurar.Enabled := False;
    bbtnTransferir.Enabled := True;

    OperComum.LimpaParametros(QryOperacaoFundo);
    QryOperacaoFundo.Open;

    if not bbtnCancelar.Enabled then
    begin
       dbDtaTransf.Clear;
       LimpaCampos('A','A');
       pnlFundo.Enabled := True;

       bbtnCancelar.Enabled := True;

       dbDtaTransf.SetFocus;
    end
    else sbtnInserir.Down := True;
end;

procedure TfrmCadTransfFundoTipo.LimpaCampos(pAtua: Char; pData: Char);
begin
   HabilitaControles('D','T');
   if pAtua in ['A', 'O'] then
   begin
      dblTipoFundoOrigem.Text := '';
      dblFundoOrigem.Text := '';
      OperComum.LimpaParametros(qryDetOrigem);

      OperComum.LimpaParametros(QryTipoFundoOrigem);
      QryTipoFundoOrigem.Open;

      OperComum.LimpaParametros(QryFundoOrigem);
      QryFundoOrigem.Open;

      OperComum.LimpaParametros(QryTipoCotaOrigem);
      QryTipoCotaOrigem.Open;
   end;

   if pAtua in ['A', 'O'] then
   begin
      dblTipoFundoDestino.Text := '';
      OperComum.LimpaParametros(qryDetDestino);

      OperComum.LimpaParametros(QryTipoFundoDestino);
      QryTipoFundoDestino.Open;

      OperComum.LimpaParametros(QryTipoCotaDestino);
      QryTipoCotaDestino.Open;
   end;

   if (pData = 'S') then
      dbDtaTransf.Clear;

   sbtnApagar.Enabled := False;
   HabilitaControles('H','T');
end;

procedure TfrmCadTransfFundoTipo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   LimpaCampos('A','A');

   pnlDetalheFndOrigem.SendToBack;

   bbtnTransferir.Enabled     := False;   
   bbtnConfirmar.Enabled      := False;
   bbtnCancelar.Enabled       := False;
   BtOkTransf.Enabled         := False;
   btnVoltarDetOrigem.Enabled := False;
   sbtnApagar.Enabled         := False;
   sbtnProcurar.Enabled       := True;

   fraMens.Pos := 0; //Renan Cristiano SOL 130444 Kintana 733394

end;

procedure TfrmCadTransfFundoTipo.sbtnApagarClick(Sender: TObject);
begin
   if not VerificaFechamentoOperacao(DateToStr(dbDtaTransf.Date)) then
      Exit;

 {  if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtWarning,[mbOk],0);
      Exit;
   end;}

   if VerEmAbertura(QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   if VerEmAbertura(QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   Try
       // Inicia processo
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

      //Renan Cristiano SOL 130444 Kintana 733394 Inicio.

      //Deleta toda transferencia da histcotaintegraliza
      ExecutaQuery(QryAux, 'DELETE FROM HISTCOTAINTEGRALIZA WHERE (IDPLANPREVCTBPATR = '+ intToStr(iPlanPrevCtbPatro) +') '+
      'AND (IDFUNDOINVEST = '+dblFundoOrigem.LookupValue+') AND (DATAHISTCOTAINTEG = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY''))'+
      'AND (TIPMOVCOTAINTEGR = ''TRT'')');

      //Seleciona os dados do origem
      with QryAux do begin
        sql.Clear;
        sql.add('SELECT CODDOCUMENTO, PLNCODIGO, PLANO, IDTIPOINVEST, DATAOPERACAO  FROM OPERACAOFUNDO');
        sql.add('WHERE (DATAOPERACAO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')) ');
        sql.add('AND (IDFUNDOINVEST = '+dblFundoOrigem.LookupValue+')               ');
        sql.add('AND (IDPLANPREVCTBPATR = '+ intToStr(iPlanPrevCtbPatro) +')             ');
        sql.add('AND (IDTIPOOPERACAO IN (-190))     ');
        sql.add('AND (IDTIPOINVEST = '+ Qry.FieldByName('IDTIPOINVEST').AsString +')');
        open;
      end;

      // Exclui Contábil/Financeiro do Fundo - Operacao origem
      if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                             QryAux.FieldByName('PLNCODIGO').AsInteger,
                             QryAux.FieldByName('PLANO').AsInteger,
                             QryAux.FieldByName('IDTIPOINVEST').AsInteger,
                             QryAux.FieldByName('DATAOPERACAO').AsDateTime, True) Then
         Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

      //Seleciona os dados do destino
      with QryAux do begin
        sql.Clear;
        sql.add('SELECT CODDOCUMENTO, PLNCODIGO, PLANO, IDTIPOINVEST, DATAOPERACAO  FROM OPERACAOFUNDO');
        sql.add('WHERE (DATAOPERACAO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY''))   ');
        sql.add('AND (IDFUNDOINVEST = '+dblFundoOrigem.LookupValue+')               ');
        sql.add('AND (IDPLANPREVCTBPATR = '+ intToStr(iPlanPrevCtbPatro) +')             ');
        sql.add('AND (IDTIPOOPERACAO IN (-191))          ');
        sql.add('AND (IDTIPOINVEST = '+ qryOperacaoFundo.FieldByName('IDTIPOINVEST').AsString+')');
        open;
      end;

      // Exclui Contábil/Financeiro do Fundo - Operacao destino
      if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                             QryAux.FieldByName('PLNCODIGO').AsInteger,
                             QryAux.FieldByName('PLANO').AsInteger,
                             QryAux.FieldByName('IDTIPOINVEST').AsInteger,
                             QryAux.FieldByName('DATAOPERACAO').AsDateTime, True) Then
         Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

      //Deleta operacaofundo
      ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE (DATAOPERACAO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY''))   '+
      'AND (IDFUNDOINVEST = '+dblFundoOrigem.LookupValue+') AND (IDPLANPREVCTBPATR = '+ intToStr(iPlanPrevCtbPatro) +') AND (IDTIPOOPERACAO IN (-191,-190)) ');

      //Renan Cristiano SOL 130444 Kintana 733394 Fim.

      // Exclui Contábil/Financeiro do Fundo - Operacao origem
      if not ProcExcluiFundo(Qry.FieldByName('CODDOCUMENTO').AsInteger,
                             Qry.FieldByName('PLNCODIGO').AsInteger,
                             Qry.FieldByName('PLANO').AsInteger,
                             Qry.FieldByName('IDTIPOINVEST').AsInteger,
                             Qry.FieldByName('DATAOPERACAO').AsDateTime, True) Then
         Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

      // Exclui Contábil/Financeiro da operação do Fundo - operacao de Destino
      if not ProcExcluiFundo(qryOperacaoFundo.FieldByName('CODDOCUMENTO').AsInteger,
                             qryOperacaoFundo.FieldByName('PLNCODIGO').AsInteger,
                             qryOperacaoFundo.FieldByName('PLANO').AsInteger,
                             qryOperacaoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                             qryOperacaoFundo.FieldByName('DATAOPERACAO').AsDateTime, True) Then
         Raise Exception.Create('Ocorreu um problema ao excluir a integração Contábil e Financeira.');

      OperComum.LimpaParametros(qryExcluiIRLitigio);
      qryExcluiIRLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger := Qry.FieldByName('IDOPERACAOFUNDO').AsInteger;
      qryExcluiIRLitigio.ExecSQL;

      OperComum.LimpaParametros(qryExcluiIRLitigio);
      qryExcluiIRLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger  := QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger;
      qryExcluiIRLitigio.ExecSQL;

      if not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE (DATAMOVFUNDO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')) '+
                                 ' AND (IDOPERACAOFUNDO = '+qryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsString+')') then
         Raise Exception.Create('Ocorreu um problema ao excluir o Histórico da operação de Destino.');

      OperComum.LimpaParametros(QryAux);

      qryOperacaoFundo.Delete;
      qryOperacaoFundo.ApplyUpdates;
      qryOperacaoFundo.CommitUpdates;

      if not ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE (DATAMOVFUNDO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')) '+
                                 ' AND (IDOPERACAOFUNDO = '+qry.FieldByName('IDOPERACAOORIGEM').AsString+') '+
                                 ' AND (IDTIPOOPERACAO  = -160)') then
         Raise Exception.Create('Ocorreu um problema ao excluir o Histórico da operação de Origem');

      OperComum.LimpaParametros(QryAux);

      qry.Delete;
      qry.ApplyUpdates;
      qry.CommitUpdates;

      DtmBaseDados.dbBaseDados.Commit;

      OperComum.LimpaParametros(QryTipoFundoInvest);
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
                                True, -1, nil, True) Then
            Raise Exception.Create('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!');
      end;

      OperComum.LimpaParametros(QryTipoFundoInvest);
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                             QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      if StrToDate(dbDtaTransf.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         if Not Reprocessamento(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                dbDtaTransf.Date,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime,
                                True, -1, nil, True) Then
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0)
         else
            MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
      end
      else
         MsgDlg('Operação Excluída com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      QryTipoFundoInvest.Close;

   Except
      on E: Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível Excluir a Transferência.' + #13 + E.Message, 'Mensagem do Sistema ',MtWarning,[mbOK],0);
      end;
   end;
   sbtnApagar.Enabled := False;
   LimpaCampos('A','A');
   bbtnCancelarClick(Sender);
end;

procedure TfrmCadTransfFundoTipo.dblFundoOrigemChange(Sender: TObject);
begin
  inherited;
   wbMudouOr := True;
end;

procedure TfrmCadTransfFundoTipo.btnVoltarDetOrigemClick(Sender: TObject);
begin
  inherited;
  pnlDetalheFndOrigem.SendToBack;
  pnlDetalheFndOrigem.Enabled := False;
end;

procedure TfrmCadTransfFundoTipo.AjustaQtdDec(OriDest: Byte; nDec: Integer);
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

procedure TfrmCadTransfFundoTipo.dblTipoFundoDestinoChange(Sender: TObject);
begin
  inherited;
   wbMudouDe := True;
end;

procedure TfrmCadTransfFundoTipo.dblFundoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  wbModif := modified;

  if modified then
  begin
     OperComum.LimpaParametros(QryTipoFundoDestino);
     QryTipoFundoDestino.ParamByName('IDTIPOINVEST').AsInteger :=
                         QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
     QryTipoFundoDestino.Open;

     if ((wbMudouOr) and (not (iTipoInvestUsu in [9,10]))) then
     begin
        HabilitaControles('D','T');

        pnlDestinoGeral.Enabled := False;

        qryDetOrigem.Filter   := '';
        qryDetOrigem.Filtered := False;
        OperComum.LimpaParametros(qryDetOrigem);

        if not (Trim(dblFundoOrigem.Text) = '') then
        begin
           VerificaDataFechamento;

           qryDetOrigemSALDOQTDCOTAS.DisplayFormat    := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));

           qryDetOrigem.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
           qryDetOrigem.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
           qryDetOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
           qryDetOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
           qryDetOrigem.Open;
           edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
           pnlDestinoGeral.Enabled := True;
        end
        else
           qryDetOrigem.Open;

        wbMudouOr := False;

        HabilitaControles('H','T');
     end;

  end;

end;

procedure TfrmCadTransfFundoTipo.dblTipoFundoOrigemChange(Sender: TObject);
begin
  inherited;
   wbMudouOr := True;
end;

procedure TfrmCadTransfFundoTipo.qryDetOrigemAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
end;

procedure TfrmCadTransfFundoTipo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

function TfrmCadTransfFundoTipo.VerificaDataFechamento: Char;
var wbOrigem, wbDestino: Boolean;
begin
  wbOrigem := False;
  wbDestino:= False;
  Result   := 'F';
  if ((Trim(dblTipoFundoOrigem.Text) <> '') and (Trim(dblFundoOrigem.Text) <> '')) then
  begin
     OperComum.LimpaParametros(QryTipoFundoInvest);
     QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                        QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     QryTipoFundoInvest.Open;
     dDataTransf := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime;
     if Trim(dbDtaTransf.Text) = '' then
        dbDtaTransf.DateTime := QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime;
     wbOrigem := True;
  end;

  if ((Trim(dblTipoFundoDestino.Text) <> '')) then
  begin
     OperComum.LimpaParametros(QryTipoFundoInvest);
     QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                        QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     QryTipoFundoInvest.Open;
     wbDestino := True;
  end;

  if (wbOrigem) and (wbDestino) then
  begin
     if dbDtaTransf.DateTime > dDataTransf then
     begin
        MsgDlg('O Fundo Origem não está Fechado em '+dbDtaTransf.Text+'.','Mensagem do Sistema',MtWarning,[MbOk],0);
        dbgDetOrigem.Enabled := False;
        Result := 'O';
     end
     else dbgDetOrigem.Enabled := True;

     if dbDtaTransf.DateTime > QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime then
     begin
        MsgDlg('O Fundo Destino não está Fechado em '+dbDtaTransf.Text+'.','Mensagem do Sistema',MtWarning,[MbOk],0);
        Result := 'D'
     end;
  end;

end;

procedure TfrmCadTransfFundoTipo.dblTipoFundoDestinoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   wbModif := modified;

   if modified then
   begin
      lbTipoCotaDest.Visible  := (QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger in [9,10]);
      dblTipoCotaDest.Visible := (QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger in [9,10]);

      qryDetDestino.Filter   := '';
      qryDetDestino.Filtered := False;
      OperComum.LimpaParametros(qryDetDestino);
      if ((Trim(dblTipoFundoDestino.Text) <> '')) then
      begin
         if (wbMudouDe) then
         begin
            HabilitaControles('D','T');

            qryDetDestinoSALDOQTDCOTAS.DisplayFormat   := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));
            qryDetDestino.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
            qryDetDestino.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
            qryDetDestino.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
            qryDetDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            qryDetDestino.Open;

            wbMudouDe := False;
            HabilitaControles('H','T');
         end;
      end
      else
         qryDetDestino.Open;
   end;

end;

procedure TfrmCadTransfFundoTipo.dblTipoFundoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  wbModif := modified;

  if modified then
  begin
     OperComum.LimpaParametros(QryFundoOrigem);
     QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                              QryTipoFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString       := dbDtaTransf.Text;
     QryFundoOrigem.Open;

     OperComum.LimpaParametros(qryDetOrigem);
     OperComum.LimpaParametros(qryDetDestino);
  end;

end;

procedure TfrmCadTransfFundoTipo.BtOkTransfClick(Sender: TObject);
var iTipoCota : Integer;
begin
    iTipoCota := -1;
    if not VerificaDados then
       Exit;

    if VerEmAbertura(QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
       Exit;

    //Verifica Transferência entre Tipos de Fundo
    If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                       ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                       ' IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                       ' IDFUNDOINVEST     = '+QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                       ' DATAOPERACAO      > TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'') AND '+
                       OperComum.IIF(((dblTipoCotaOrig.Visible) And (Trim(dblTipoCotaOrig.Text) <> '')),
                                      ' IDTIPOCOTA = '+dblTipoCotaOrig.LookupValue+'  AND ','')+
                       '(IDTIPOOPERACAO = -160)') Then
    begin
       MsgDlg('Já existe tranferência para esse Fundo com data superior a data de operação. '+#13+
              'A Operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
       QryAux.Close;
       Exit;
    end;
    QryAux.Close;

    try
       // Inicia processo
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       if not Transfere then
          Raise Exception.Create('Não foi será possível efetuar a transferência entre Fundos.')
       else
          MsgDlg('Transferência efetuada com sucesso!','Mensagem do Sistema',mtInformation,[MbOk],0);

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

end;

procedure TfrmCadTransfFundoTipo.dsDetOrigemStateChange(Sender: TObject);
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

procedure TfrmCadTransfFundoTipo.mnuTrfFndTotalClick(Sender: TObject);
begin
  inherited;
  if not dtmBaseDados.dbBaseDados.InTransaction then
     BtOkTransfClick(Sender);

end;

procedure TfrmCadTransfFundoTipo.dbDtaTransfEnter(Sender: TObject);
begin
  inherited;
   dDataTransf := dbDtaTransf.DateTime;
end;

procedure TfrmCadTransfFundoTipo.dbDtaTransfExit(Sender: TObject);
begin
  inherited;
   if dDataTransf <> dbDtaTransf.DateTime then
   begin
      if VerificaDataFechamento = 'A' then
         LimpaCampos('A','A')
      else
         wbMudouOr := True;

      wbMudouDe := True;
   end;

   OperComum.LimpaParametros(QryTipoFundoOrigem);
   QryTipoFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundoOrigem.Open;

   OperComum.LimpaParametros(qryDetOrigem);
   OperComum.LimpaParametros(qryDetDestino);

end;

procedure TfrmCadTransfFundoTipo.HabilitaControles(pAcao, pAtua: Char);
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
         qryDetDestino.DisableControls;
      end;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoFundoOrigemExit(Sender: TObject);
begin
  inherited;
   if not wbModif then
   begin
      if (dblTipoFundoOrigem.Text <> '') then
      begin
         OperComum.LimpaParametros(QryFundoOrigem);
         QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
         QryFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                                 QryTipoFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString       := dbDtaTransf.Text;                                 
         QryFundoOrigem.Open;

         OperComum.LimpaParametros(qryDetOrigem);
         OperComum.LimpaParametros(qryDetDestino);
      end;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblFundoOrigemExit(Sender: TObject);
begin
  inherited;

   if not wbModif then
   begin
      if (dblFundoOrigem.Text <> '') then
      begin
         OperComum.LimpaParametros(QryTipoFundoDestino);
         QryTipoFundoDestino.ParamByName('IDTIPOINVEST').AsInteger :=
                             QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
         QryTipoFundoDestino.Open;

         if ((wbMudouOr) and (not (iTipoInvestUsu in [9,10]))) then
         begin
            HabilitaControles('D','T');

            pnlDestinoGeral.Enabled := False;

            qryDetOrigem.Filter   := '';
            qryDetOrigem.Filtered := False;
            OperComum.LimpaParametros(qryDetOrigem);

            if not (Trim(dblFundoOrigem.Text) = '') then
            begin
               VerificaDataFechamento;

               qryDetOrigemSALDOQTDCOTAS.DisplayFormat    := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));

               qryDetOrigem.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
               qryDetOrigem.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
               qryDetOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
               qryDetOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
               qryDetOrigem.Open;
               edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
               pnlDestinoGeral.Enabled := True;
            end
            else
               qryDetOrigem.Open;

            wbMudouOr := False;

            HabilitaControles('H','T');
         end;
      end;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoCotaOrigCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   wbModif := modified;
   if modified then
   begin
      if wbMudouOr then
      begin
         HabilitaControles('D','T');

         pnlDestinoGeral.Enabled := False;

         qryDetOrigem.Filter   := '';
         qryDetOrigem.Filtered := False;
         OperComum.LimpaParametros(qryDetOrigem);

         if ((Trim(dblFundoOrigem.Text) <> '') And (Trim(dblTipoCotaOrig.Text) <> '')) then
         begin
            VerificaDataFechamento;

            qryDetOrigemSALDOQTDCOTAS.DisplayFormat    := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));

            qryDetOrigem.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
            qryDetOrigem.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
            qryDetOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
            qryDetOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            qryDetOrigem.Open;
            qryDetOrigem.Filter      := 'IDTIPOCOTA = '+dblTipoCotaOrig.LookupValue;
            qryDetOrigem.Filtered    := True;

            edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
            pnlDestinoGeral.Enabled  := True;
         end
         else
            qryDetOrigem.Open;

         wbMudouOr := False;

         HabilitaControles('H','T');
      end;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoCotaOrigExit(Sender: TObject);
begin
  inherited;
   if not wbModif then
   begin
      if wbMudouOr then
      begin
         HabilitaControles('D','T');

         pnlDestinoGeral.Enabled := False;

         qryDetOrigem.Filter   := '';
         qryDetOrigem.Filtered := False;         
         OperComum.LimpaParametros(qryDetOrigem);

         if ((Trim(dblFundoOrigem.Text) <> '') And (Trim(dblTipoCotaOrig.Text) <> '')) then
         begin
            VerificaDataFechamento;

            qryDetOrigemSALDOQTDCOTAS.DisplayFormat    := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));

            qryDetOrigem.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
            qryDetOrigem.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
            qryDetOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
            qryDetOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            qryDetOrigem.Open;
            qryDetOrigem.Filter      := 'IDTIPOCOTA = '+dblTipoCotaOrig.LookupValue;
            qryDetOrigem.Filtered    := True;

            edtVlrTransfOrigem.Value := qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat;
            pnlDestinoGeral.Enabled  := True;
         end
         else
            qryDetOrigem.Open;

         wbMudouOr := False;

         HabilitaControles('H','T');
      end;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoFundoDestinoExit(Sender: TObject);
begin
  inherited;

   if not wbModif then
   begin
      qryDetDestino.Filter   := '';
      qryDetDestino.Filtered := False;
      OperComum.LimpaParametros(qryDetDestino);
      if ((Trim(dblTipoFundoDestino.Text) <> '')) then
      begin
         lbTipoCotaDest.Visible  := (QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger in [9,10]);
         dblTipoCotaDest.Visible := (QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger in [9,10]);

         if (wbMudouDe) then
         begin
            HabilitaControles('D','T');

            qryDetDestinoSALDOQTDCOTAS.DisplayFormat   := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));
            qryDetDestino.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
            qryDetDestino.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
            qryDetDestino.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
            qryDetDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            qryDetDestino.Open;

            wbMudouDe := False;
            HabilitaControles('H','T');
         end;
      end
      else
         qryDetDestino.Open;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoCotaDestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

   wbModif := modified;

   if modified then
   begin
      qryDetDestino.Filter   := '';
      qryDetDestino.Filtered := False;
      OperComum.LimpaParametros(qryDetDestino);
      if ((Trim(dblTipoCotaDest.Text) <> '')) then
      begin
         if (wbMudouDe) then
         begin
            HabilitaControles('D','T');

            qryDetDestinoSALDOQTDCOTAS.DisplayFormat   := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));
            qryDetDestino.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
            qryDetDestino.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
            qryDetDestino.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
            qryDetDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            qryDetDestino.Open;
            qryDetDestino.Filter   := 'IDTIPOCOTA = '+dblTipoCotaDest.LookupValue;
            qryDetDestino.Filtered := True;

            wbMudouDe := False;
            HabilitaControles('H','T');
         end;
      end
      else
        qryDetDestino.Open;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoCotaDestExit(Sender: TObject);
begin
  inherited;

   if not wbModif then
   begin
      qryDetDestino.Filter   := '';
      qryDetDestino.Filtered := False;
      OperComum.LimpaParametros(qryDetDestino);
      if ((Trim(dblTipoCotaDest.Text) <> '')) then
      begin
         if (wbMudouDe) then
         begin
            HabilitaControles('D','T');

            qryDetDestinoSALDOQTDCOTAS.DisplayFormat   := MontaMascaraDecQtd(StrToInt(dblFundoOrigem.LookupValue));
            qryDetDestino.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
            qryDetDestino.ParamByName('DATAMOVFUNDO').AsDateTime     := dbDtaTransf.DateTime;
            qryDetDestino.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
            qryDetDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            qryDetDestino.Open;
            qryDetDestino.Filter   := 'IDTIPOCOTA = '+dblTipoCotaDest.LookupValue;
            qryDetDestino.Filtered := True;

            wbMudouDe := False;
            HabilitaControles('H','T');
         end;
      end
      else
        qryDetDestino.Open;
   end;
end;

procedure TfrmCadTransfFundoTipo.dblTipoCotaDestChange(Sender: TObject);
begin
  inherited;
   wbMudouDe := True;
end;

procedure TfrmCadTransfFundoTipo.dblTipoCotaOrigChange(Sender: TObject);
begin
  inherited;
   wbMudouOr := True;
end;

procedure TfrmCadTransfFundoTipo.CmeCadastroFind(Sender: TObject);
var
  sSql: string;
begin
  inherited;

  if (MontaSelect.RetornouValor) And (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
  begin

     dbDtaTransf.DateTime := StrToDate(MontaSelect.ValoresChave[1]);

     //Origem
     OperComum.LimpaParametros(qry);
     qry.ParamByName('IDOPERACAOFUNDO').AsString := MontaSelect.ValoresChave[0];
     qry.Open;
     
     HabilitaControles('D','O');

     OperComum.LimpaParametros(QryFundoOrigem);
     QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger  := iTipoInvestUsu;
     QryFundoOrigem.ParamByName('IDFUNDOINVEST').AsInteger := qry.FieldByName('IDFUNDOINVEST').AsInteger;
     QryFundoOrigem.ParamByName('DATAMOVFUNDO').AsString   := dbDtaTransf.Text;
     QryFundoOrigem.Open;
     dblFundoOrigem.LookupValue := qry.FieldByName('IDFUNDOINVEST').AsString;
     dblFundoOrigem.Text        := QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString;

     OperComum.LimpaParametros(QryTipoFundoOrigem);
     QryTipoFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryTipoFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                        QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
     QryTipoFundoOrigem.Open;
     dblTipoFundoOrigem.LookupValue := QryTipoFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsString;
     dblTipoFundoOrigem.Text        := QryTipoFundoOrigem.FieldByName('DESCTIPOFUNDOINV').AsString;

     HabilitaControles('H','O');

     if (dblTipoCotaOrig.Visible) then
     begin
        OperComum.LimpaParametros(QryTipoCotaOrigem);
        QryTipoCotaOrigem.ParamByName('IDTIPOCOTA').AsInteger := qry.FieldByName('IDTIPOCOTA').AsInteger;
        QryTipoCotaOrigem.Open;
        dblTipoCotaOrig.LookupValue := qry.FieldByName('IDTIPOCOTA').AsString;
        dblTipoCotaOrig.Text        := QryTipoCotaOrigem.FieldByName('DESCTIPOCOTA').AsString;
        dblTipoCotaOrigChange(Self);
        dblTipoCotaOrigCloseUp(Self,QryTipoCotaOrigem,nil,True);
     end
     else
     begin
        dblFundoOrigemChange(Self);
        dblFundoOrigemCloseUp(Self,QryFundoOrigem,nil,True);
     end;

     sbtnApagar.Enabled    := True;
     sbtnProcurar.Enabled  := True;

     //Destino
     OperComum.LimpaParametros(qryOperacaoFundo);
     qryOperacaoFundo.ParamByName('IDOPERACAOFUNDO').AsString := MontaSelect.ValoresChave[0];
     qryOperacaoFundo.Open;

     HabilitaControles('D','D');

     OperComum.LimpaParametros(QryTipoFundoDestino);
     QryTipoFundoDestino.ParamByName('IDTIPOINVEST').AsInteger :=
                         QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
     QryTipoFundoDestino.Open;

     //Renan Cristiano
     with QryAux do begin
       Close;
       sql.Clear;
       sql.add('SELECT IDTIPOFUNDOINVEST FROM HISTFUNDOINVEST                                                 ' );
       sql.add('WHERE IDFUNDOINVEST = ' + qry.FieldByName('IDFUNDOINVEST').AsString                             );
       sql.add('AND DTAVIGENCIA = (SELECT MAX(DTAVIGENCIA) FROM HISTFUNDOINVEST                               ' );
       sql.add('                   WHERE IDFUNDOINVEST = '+ qry.FieldByName('IDFUNDOINVEST').AsString           );
       sql.add('                   AND DTAVIGENCIA <= TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY''))' );
       Open;
     end;

     QryTipoFundoDestino.Locate('IDTIPOFUNDOINVEST;IDTIPOINVEST',
                  VarArrayOf([QryAux.FieldByName('IDTIPOFUNDOINVEST').AsString , MontaSelect.ValoresChave[3]]), []);


     //Renan Cristiano
     dblTipoFundoDestino.LookupValue := QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsString;
     dblTipoFundoDestino.Text        := QryTipoFundoDestino.FieldByName('DESCTIPOFUNDOINV').AsString;

     lbTipoCotaDest.Visible  := (StrToInt(MontaSelect.ValoresChave[3]) in [9,10]);
     dblTipoCotaDest.Visible := (StrToInt(MontaSelect.ValoresChave[3]) in [9,10]);

     HabilitaControles('H','D');

     if (dblTipoCotaDest.Visible) then
     begin
        OperComum.LimpaParametros(QryTipoCotaDestino);
        QryTipoCotaDestino.ParamByName('IDTIPOCOTA').AsInteger := qryOperacaoFundo.FieldByName('IDTIPOCOTA').AsInteger;
        QryTipoCotaDestino.Open;
        dblTipoCotaDest.LookupValue := qryOperacaoFundo.FieldByName('IDTIPOCOTA').AsString;
        dblTipoCotaDest.Text        := QryTipoCotaDestino.FieldByName('DESCTIPOCOTA').AsString;
        dblTipoCotaDestChange(Self);
        dblTipoCotaDestCloseUp(Self,QryTipoCotaDestino,nil,True);
     end
     else
     begin
        dblTipoFundoDestinoChange(Self);
        dblTipoFundoDestinoCloseUp(Self,QryTipoFundoDestino,nil,True);
     end;
     qryDetDestino.Filter   := 'DATAAPLICACAO = '+QuotedStr(MontaSelect.ValoresChave[2]);
     qryDetDestino.Filtered := True;
  end;
  bbtnTransferir.Enabled    := False;
end;

procedure TfrmCadTransfFundoTipo.bbtnSairClick(Sender: TObject);
begin
   if dtmBaseDados.dbBaseDados.InTransaction then
   begin
      if MsgDlg('A operação não foi confirmada! Deseja abandonar a Operação?','Mensagem ',mtInformation,
                [mbYes, mbNo],0) = mrNo Then
         Exit;
   end;

   wbModif  := False;
   wbMudouOr:= False;
   wbMudouDe:= False;

  inherited;

end;

procedure TfrmCadTransfFundoTipo.bbtnTransferirClick(Sender: TObject);
var iTipoCota : Integer;
begin
    // Al_3
    // Verifica se existem Transferência entre planos posterior a data a ser transferida
    fraMens.Mes := 'Verificando os lançamentos do dia.';
    If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                               QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                               iPlanPrevCtbPatro,
                                               dbDtaTransf.DateTime) then
    Begin
        MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
               'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
        fraMens.Apaga;
        Exit;
    End; // Fim AL_3

    fraMens.Mostra;
    fraMens.Max := qryDetOrigem.RecordCount+1;
    fraMens.Pos := 0;
    fraMens.Mes := 'Verificando Transferência';
    iTipoCota   := -1;
    if not VerificaDados then
    begin
       fraMens.Apaga;
       Exit;
    end;

    if VerEmAbertura(QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
    begin
       fraMens.Apaga;
       Exit;
    end;

    if VerEmAbertura(QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
    begin
       fraMens.Apaga;
       Exit;
    end;

    //Verifica Transferência entre Tipos de Fundo
    If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                       ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                       ' IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                       ' IDFUNDOINVEST     = '+QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                       ' DATAOPERACAO      > TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'') AND '+
                       OperComum.IIF(((dblTipoCotaOrig.Visible) And (Trim(dblTipoCotaOrig.Text) <> '')),
                                      ' IDTIPOCOTA = '+dblTipoCotaOrig.LookupValue+'  AND ','')+
                       '(IDTIPOOPERACAO = -160)') Then
    begin
       MsgDlg('Já existe tranferência para esse Fundo com data superior a data de operação. '+#13+
              'A Operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
       QryAux.Close;
       fraMens.Apaga;
       Exit;
    end;

    //Renan Cristiano SOL 130444 Kintana 733394
    If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                       ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                       ' IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                       ' IDFUNDOINVEST     = '+QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                       ' DATAOPERACAO      > TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'') AND '+
                       OperComum.IIF(((dblTipoCotaOrig.Visible) And (Trim(dblTipoCotaOrig.Text) <> '')),
                                      ' IDTIPOCOTA = '+dblTipoCotaOrig.LookupValue+'  AND ','')+
                       '(IDTIPOOPERACAO = -190)') Then
    begin
       MsgDlg('Já existe tranferência de cotas a integralizar para esse Fundo com data superior a data de operação. '+#13+
              'A Operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
       QryAux.Close;
       fraMens.Apaga;
       Exit;
    end;
    //Renan Cristiano SOL 130444 Kintana 733394

    QryAux.Close;

    try
       // Inicia processo
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       qryDetOrigem.DisableControls;
       qryDetOrigem.First;
       fraMens.Incrementa;

       //Renan Cristiano SOL 130444 Kintana 733394
       if qryDetOrigem.IsEmpty then begin
         if MsgDlg('Não existe saldo origem.'+ chr(13) + 'Deseja continuar?',
                   'Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrNo then begin
           fraMens.Pos := 0;
           exit;
         end;
       end;
       //Renan Cristiano SOL 130444 Kintana 733394

         while not qryDetOrigem.Eof do
         begin
            fraMens.Mes := 'Tranferindo aplicação : '+qryDetOrigemDATAAPLICACAO.AsString;
            if not Transfere then
            begin
               qryDetOrigem.EnableControls;
               Raise Exception.Create('Não foi possível efetuar a transferência.');
            end;
            qryDetOrigem.Next;
            fraMens.Incrementa;
         end;

       //Renan Cristiano SOL 130444 Kintana 733394 inicio.
       OperComum.LimpaParametros(qryHistCotaOrigem);
       qryHistCotaOrigem.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
       qryHistCotaOrigem.ParamByName('DATATRANS').AsDateTime        := dbDtaTransf.DateTime;
       qryHistCotaOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
       qryHistCotaOrigem.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       qryHistCotaOrigem.Open;

       OperComum.LimpaParametros(QryHistCotaDestino);
       QryHistCotaDestino.ParamByName('IDFUNDOINVEST').AsInteger     := StrToInt(dblFundoOrigem.LookupValue);
       QryHistCotaDestino.ParamByName('DATATRANS').AsDateTime        := dbDtaTransf.DateTime;
       QryHistCotaDestino.ParamByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
       QryHistCotaDestino.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
       QryHistCotaDestino.Open;

       if qryHistCotaOrigem.IsEmpty then begin
         if MsgDlg('Não existe saldo origem de Cotas a Integralizar.'+ chr(13) + 'Deseja continuar?',
                   'Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrNo then exit;
       end;

       fraMens.Max := qryHistCotaOrigem.RecordCount;
       fraMens.Pos := 0;

       if (verificaTransfPassadas) then
         if MsgDlg('A transferência para o fundo destino já existia em outra data.'+ chr(13) + 'Deseja continuar?',
                'Mensagem do Sistema',mtConfirmation,[mbYes, mbNo],0) = mrNo then exit;

       while not qryHistCotaOrigem.Eof do
       begin
         fraMens.Mes := 'Tranferindo aplicação : '+ qryHistCotaOrigemDATAAPLICACAO.AsString;
         if not TransfereHistCotaIntegraliza then
         begin
           qryHistCotaOrigem.EnableControls;
           Raise Exception.Create('Não foi possível efetuar a transferência de Cotas a Integralizar.');
         end;
         qryHistCotaOrigem.Next;
         fraMens.Incrementa;
       end;

       qryDetOrigem.EnableControls;
       qryHistCotaOrigem.EnableControls;

       //Renan Cristiano SOL 130444 Kintana 733394 Fim.

       fraMens.Mes := 'Transferência efetuada !  Confirmar. ';

       bbtnTransferir.Enabled := False;
       BtOkTransf.Enabled := False;
       btnVoltarDetOrigem.Enabled := False;
       bbtnConfirmar.Enabled := True;
       bbtnCancelar.Enabled := True;
    except
       on E: Exception do
       begin
          DtmBaseDados.dbBaseDados.Rollback;
          MsgDlg(E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
          fraMens.Apaga;
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
end;

function TfrmCadTransfFundoTipo.TransfereHistCotaIntegraliza: Boolean;
var
    wCotApliDestino : Double;
    iTipoCota, iIdForCli,  iTipoFundoInvestOrigem, iTipoFundoInvestDestino :Integer;
    iPlanilha, iPlano, iDocumento, iIdOperacaoFundoDestino, iIdOperacaoFundoOrigem : integer;
    fVlrCustoAcoes, fVlrVarAcoes             : Currency;
    //AL_2
    sMens: String;
begin

   iPlano     := -1;
   iPlanilha  := -1;
   iDocumento := -1;
   iTipoCota  := -1;
   iIdForCli  := -1;
   fVlrCustoAcoes          := 0;
   fVlrVarAcoes            := 0;
   iIdOperacaoFundoOrigem  := 0;
   iIdOperacaoFundoDestino := 0;

   Try

      OperComum.LimpaParametros(QryTipoOperTransf);
      QryTipoOperTransf.ParamByName('IDTIPOINVEST').AsInteger   :=
                                     QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
      QryTipoOperTransf.ParamByName('IDTIPOOPERACAO').AsInteger := -190;
      QryTipoOperTransf.Open;
      if QryTipoOperTransf.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'não foi cadastrada o tipo de operação(-190) para o Fundo de Origem.');

      OperComum.LimpaParametros(QryCotaFundo);
      QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.ParamByName('DATACOTA').AsDateTime     := dbDtaTransf.DateTime;
      if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
         QryCotaFundo.ParamByName('IDTIPOCOTA').AsInteger := StrToInt(dblTipoCotaOrig.LookupValue);
      QryCotaFundo.Open;
      if QryCotaFundo.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'a cota do dia '+dbDtaTransf.Text+' não foi cadastrada para o Fundo de Origem.');

      with QryOperacaoFundo do
      begin
         Insert;
         iIdOperacaoFundoOrigem := LeUltRegistro(nil,'OPERACAOFUNDO');
         FieldByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
         FieldByName('IDOPERACAOORIGEM').AsInteger  := qryHistCotaOrigem.FieldByName('IDOPERACAOFUNDO').AsInteger;
         FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
         FieldByName('IDTIPOINVEST').AsInteger      := QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;
         FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger;
         FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
         FieldByName('DATAOPERACAO').AsDateTime     := dbDtaTransf.DateTime;
         FieldByName('DATALIQUIDACAO').AsDateTime   := dbDtaTransf.DateTime;
         FieldByName('QTDOPERACAO').AsFloat         := qryHistCotaOrigem.FieldByName('QTDHISTCOTAINTEGR').AsFloat;
         FieldByName('VLROPERACAO').AsFloat         := qryHistCotaOrigem.FieldByName('VLRHISTCOTAINTEGR').AsFloat;
         FieldByName('VLRCOTA').AsFloat             := qryHistCotaOrigem.FieldByName('VLRCOTAINTEGR').AsFloat;
         FieldByName('STACONFIRMA').AsString        := 'S';
         FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
            FieldByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCotaOrig.LookupValue);
         Post;
         ApplyUpdates;
         CommitUpdates;
      end;

      QryCotaFundo.Close;

      if ((dblTipoCotaOrig.Visible) and (dblTipoCotaOrig.Text <> '')) then
         iTipoCota := StrToInt(dblTipoCotaOrig.LookupValue)
      else iTipoCota := -1;

      iTipoFundoInvestOrigem := StrToInt(dblTipoFundoOrigem.LookupValue);

{      uFundoComum.TransfCotaIntegr(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                   QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iTipoFundoInvestOrigem,
                                   QryHistCotaOrigem.FieldByName('DATAHISTCOTAINTEG').asDateTime,
                                   False,
                                   OperComum.IIF((iTipoCota > 0), iTipoCota, -1));}

      if not GravaHistCotaIntegraliza(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                      QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                      OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                      QryHistCotaOrigem.FieldByName('PLANO').AsInteger,
                                      iPlanilha, -1,
                                      QryHistCotaOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      iIdOperacaoFundoOrigem,
                                      QryHistCotaOrigem.FieldByName('DATAHISTCOTAINTEG').asDateTime,
                                      QryHistCotaOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                                      0,//QryHistCotaOrigem.FieldByName('VLRHISTCOTAINTEGR').AsFloat,
                                      0,//QryHistCotaOrigem.FieldByName('QTDHISTCOTAINTEGR').AsFloat,
                                      0,//QryHistCotaOrigem.FieldByName('QTDMOVCOTAINTEGR').AsFloat,
                                      0,//QryHistCotaOrigem.FieldByName('VLRCOTAINTEGR').AsFloat,
                                      0,//QryHistCotaOrigem.FieldByName('VLRVARIACAODIA').AsFloat,
                                      'TRT') then
        Raise Exception.Create('Não foi possível confirmar o Resgate por Transferência do Fundo de Origem' + #13 +
                               'Ocorreu um problema durante o processo de gravação' + #13 +
                               'Refaça a operação');

      if (QryTipoOperTransf.FieldByName('FLGGERACONTAB').AsInteger = 1) then
      begin
         iIdForCli := OperComum.BuscaForCli(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                            QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            pRPI.IDTIPOCLIENTEEMI);
         if iIdForCli = 0 then
            Raise Exception.Create('Verificar a parametrização do tipo de operação e'+#13+
                                    'o gestor da carteira para o Fundo de Origem.');

         if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
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
                                         qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat, 0, 0, 0, 0,
                                         fVlrCustoAcoes, fVlrVarAcoes, iTipoCota) Then
            Raise Exception.Create('Não foi possível efetuar a contabilização do Resgate por Transferência do Fundo de Origem. '+#13+
                                   'Esta operação será Cancelada.');

         With DmFundoComum.QryUpdOpeFinCtb Do
         Begin
            Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
            ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
            ParamByName('PLANO').AsInteger             := iPlano;
            ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
            ExecSQL;
         End;
      end;

      pnlTitOrigem.Refresh;

      // Grava Aplicação
      OperComum.LimpaParametros(QryTipoOperTransf);
      QryTipoOperTransf.ParamByName('IDTIPOINVEST').AsInteger   :=
                                     QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
      QryTipoOperTransf.ParamByName('IDTIPOOPERACAO').AsInteger := -191;
      QryTipoOperTransf.Open;
      if QryTipoOperTransf.IsEmpty then
         Raise Exception.Create('Não é possível efetuar a operação de Transferência, '+#13+
                                'não foi cadastrada o tipo de operação(-191) para o Fundo de Destino.');

//      wCotApliDestino := (edtVlrTransfOrigem.Value/ dbeQtdOrigem.Value);

      with QryOperacaoFundo do
      begin
         Insert;
         iIdOperacaoFundoDestino := LeUltRegistro(nil,'OPERACAOFUNDO');
         FieldByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoDestino;
         FieldByName('IDOPERACAOORIGEM').AsInteger  := qryHistCotaOrigem.FieldByName('IDOPERACAOFUNDO').AsInteger;//iIdOperacaoFundoOrigem;
         FieldByName('IDCARTEIRAINVEST').AsInteger  := QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger;
         FieldByName('IDTIPOINVEST').AsInteger      := QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;
         FieldByName('IDTIPOOPERACAO').AsInteger    := QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger;
         FieldByName('IDFUNDOINVEST').AsInteger     := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
         FieldByName('DATAOPERACAO').AsDateTime     := dbDtaTransf.DateTime;
         FieldByName('DATALIQUIDACAO').AsDateTime   := dbDtaTransf.DateTime;
         FieldByName('QTDOPERACAO').AsFloat         := QryHistCotaOrigem.FieldByName('QTDHISTCOTAINTEGR').AsFloat;
         FieldByName('VLROPERACAO').AsFloat         := QryHistCotaOrigem.FieldByName('VLRHISTCOTAINTEGR').AsFloat;
         FieldByName('VLRCOTA').AsFloat             := qryHistCotaOrigem.FieldByName('VLRCOTAINTEGR').AsFloat;
         FieldByName('STACONFIRMA').AsString        := 'S';
         FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
         if ((dblTipoCotaDest.Visible) and (dblTipoCotaDest.Text <> '')) then
            FieldByName('IDTIPOCOTA').AsInteger     := StrToInt(dblTipoCotaDest.LookupValue);
         Post;
         ApplyUpdates;
         CommitUpdates;
      end;

      if ((dblTipoCotaDest.Visible) and (dblTipoCotaDest.Text <> '')) then
         iTipoCota := StrToInt(dblTipoCotaDest.LookupValue)
      else iTipoCota := -1;

        iTipoFundoInvestDestino := StrToInt(dblTipoFundoDestino.LookupValue);

{        uFundoComum.TransfCotaIntegr(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                     QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                     iTipoFundoInvestDestino,
                                     QryHistCotaOrigem.FieldByName('DATAHISTCOTAINTEG').asDateTime,
                                     False,
                                     OperComum.IIF((iTipoCota > 0), iTipoCota, -1));}

        if not GravaHistCotaIntegraliza(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                      QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                      OperComum.IIF((iTipoCota > 0), iTipoCota, -1),
                                      QryHistCotaOrigem.FieldByName('PLANO').AsInteger,
                                      iPlanilha, -1,
                                      QryHistCotaOrigem.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                      iIdOperacaoFundoDestino,
                                      QryHistCotaOrigem.FieldByName('DATAHISTCOTAINTEG').asDateTime,
                                      QryHistCotaOrigem.FieldByName('DATAAPLICACAO').AsDateTime,
                                      QryHistCotaOrigem.FieldByName('VLRHISTCOTAINTEGR').AsFloat,
                                      QryHistCotaOrigem.FieldByName('QTDHISTCOTAINTEGR').AsFloat,
                                      QryHistCotaOrigem.FieldByName('QTDMOVCOTAINTEGR').AsFloat,
                                      QryHistCotaOrigem.FieldByName('VLRCOTAINTEGR').AsFloat,
                                      QryHistCotaOrigem.FieldByName('VLRVARIACAODIA').AsFloat,
                                      'TRT') then
        Raise Exception.Create('Não foi possível confirmar o Resgate por Transferência do Fundo de Destino' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');

      if (QryTipoOperTransf.FieldByName('FLGGERACONTAB').AsInteger = 1) then
      begin
         iIdForCli := OperComum.BuscaForCli(QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                            QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            pRPI.IDTIPOCLIENTEEMI);
         if iIdForCli = 0 then
            Raise Exception.Create('Verificar a parametrização do tipo de operação e'+#13+
                                    'o gestor da carteira para o Fundo de Origem.');

         if Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                         QryTipoOperTransf.FieldByName('IDTIPOOPERACAO').AsInteger,
                                         QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                                         qryDetDestino.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                         QryTipoFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                         iIdForCli,
                                         QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                         StrToDate(dbDtaTransf.Text),
                                         StrToDate(dbDtaTransf.Text),
                                         'OPE', QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                                         QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                         True,
                                         qryDetOrigem.FieldByName('SALDOVLRFUNDO').AsFloat, 0, 0, 0, 0,
                                         fVlrCustoAcoes, fVlrVarAcoes, iTipoCota) Then
            Raise Exception.Create('Não foi possível efetuar a contabilização da Aplicação por Transferência do Fundo de Destino. '+#13+
                                   'Esta operação será Cancelada.');

         With DmFundoComum.QryUpdOpeFinCtb Do
         Begin
            Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
            ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoDestino;
            ParamByName('PLANO').AsInteger             := iPlano;
            ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
            ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
            ExecSQL;
         End;
      end;

      pnlTitDestino.Refresh;

      Result     := True;

    

   Except
       On E:Exception Do Begin
         MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);

         Result := False;
       end;
   end

end;

procedure TfrmCadTransfFundoTipo.bbtnAjudaClick(Sender: TObject);
begin
  bbtnConfirmar.Enabled := True;
  //inherited;

end;

function TfrmCadTransfFundoTipo.VerificaTransfPassadas: Boolean;
var
  sSql: string;
begin
  Result := False;

  if qryHistCotaOrigem.FieldByName('IDTIPOINVEST').AsString <>
     QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsString then begin

     sSql :=

     'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO'                    + #13#10 +
     'WHERE IDFUNDOINVEST = '+dblFundoOrigem.LookupValue     + #13#10 +
     'AND IDPLANPREVCTBPATR = '+ intToStr(iPlanPrevCtbPatro) + #13#10 +
     'AND DATAOPERACAO <= TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')' + #13#10 +
     'AND IDTIPOOPERACAO IN (-190)'                          + #13#10 +
     'AND IDTIPOINVEST = '+ QryTipoFundoDestino.FieldByName('IDTIPOINVEST').AsString + #13#10;

     with qryAux do begin
       Close;
       sql.Clear;
       sql.Add(sSql);
       Open;
     end;

     Result := not(QryAux.IsEmpty);
  end;

end;

end.
