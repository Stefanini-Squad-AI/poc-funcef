//******************************************************************************
// Rotina     : VerIncorporacaoFundo / QryBuscaIncorporacaoFundo
// SOL        : 106085
// Kintana    : 475364
// Data       : 13/01/2009
// Responsável: Paulo Nobre
// Motivo     : Alteração para permite o lançamento de mais de uma operação na
//               mesma data, para o mesmo fundo, porém com plano/patrocinadora diferentes.
//******************************************************************************
// Data      : 10/01/2008
// Código    : AL_18
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores a transferência
//******************************************************************************
// Data      : 13/03/2007
// Código    : AL_17
// Pendencia :
// SOL       :
// Motivo    : Ajuste na mensagem de reprocessamento
//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_16
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_15
// Pendencia : 20453
// SOL       : 33866
// Motivo    : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 14/03/2006
// Código   : Al_14
// Pendencia:
// SOL      :
// Motivo   : Acerto na exclusão, o contabil/financeiro não eram excluidos, porque
//            a tabela para verificar os identificadores era a HISTFUNDO.
//******************************************************************************
// Data      : 20/02/2005
// Código    : AL_13
// Pendencia :
// SOL       :
// Motivo    : Implementação da verificação de processo de atualização em andamento
//******************************************************************************
// Data     : 16/06/2005
// Código   : Al_12
// Motivo   : Implmentação para tratar a data da operação
//******************************************************************************
// Data     : 16/06/2005
// Código   : Al_11
// Motivo   : Substituído o comando de abort, para obter um msg mais clara
//******************************************************************************
// Data     : 16/06/2005
// Código   : Al_10
// Motivo   : Implementação do reprocessamento verificando se há mais de um resgate.
//            E acerto dos parâmetros passado para a rotina.
//******************************************************************************
// Data     : 16/06/2005
// Código   : Al_9
// Motivo   : Implementado da verificação de transação e antecipado o commit da transação.
//******************************************************************************
// Data     : 16/06/2005
// Código   : Al_8
// Motivo   : Implementado da "DTAINIPROC" nas query "qry" e "QryDestino"
//******************************************************************************
// Data     : 15/06/2005
// Código   : Al_7
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 25/05/2005
// Linha(s) : Al_6
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 03/06/2005
// Linha(s) : Al_5
// Motivo   : Alteração da mensagem de erro para uma similar
//******************************************************************************
// Data     : 03/06/2005
// Linha(s) : Al_4
// Motivo   : Implementação do tratamento da Conta Investimento para integração Financeira
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_3
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 06/10/2004
// Linha(s) : Alt_2
// Motivo   : Inclusão do campo DTAINIPROC na QryFundoOrigem , QryFundoDestino e na funcao Reprocessamento
//******************************************************************************
// Data     : 20/09/2004
// Linha(s) : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FCadIncorporacaoFundo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, StdCtrls, wwdblook, Db, CmEventosCadastro, ImgList,
  Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwquery,
  MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, DBCtrls,
  FPreview, Mask, TREdit, wwdbdatetimepicker, CMDateTimePicker, ComCtrls,
  faMensagem, Grids, Wwdbigrd, Wwdbgrid, uCtrlInvContab;

type

  TFrmCadIncorporacaoFundo = class(TfrmCadastroCSInv)
    PnlAplicacao: TPanel;
    Panel1: TPanel;
    PnlOrigem: TPanel;
    PnlData: TPanel;
    dbDDataOperacao: TCMDateTimePicker;
    Label23: TLabel;
    pgcAplicacao: TPageControl;
    tbsDadosApl: TTabSheet;
    tbsObsApl: TTabSheet;
    pnlObsAplic: TPanel;
    dbeObsApl: TDBMemo;
    QryDestino: TwwQuery;
    DsDestino: TwwDataSource;
    UpdDestino: TUpdateSQL;
    fcLOperador: TfcLabel;
    QryBuscaUsuario: TwwQuery;
    QryFundoOrigem: TwwQuery;
    QryFundoDestino: TwwQuery;
    QryTpoOperDest: TwwQuery;
    QryTpoOperOrig: TwwQuery;
    PnlFdoApl: TPanel;
    DbLkcFundoInvestApl: TwwDBLookupCombo;
    Label17: TLabel;
    QrySaldoFundoTotal: TwwQuery;
    QryAux: TwwQuery;
    QryTipoFundo: TwwQuery;
    dblTipoFundo: TwwDBLookupCombo;
    lblTipFndOrigem: TLabel;
    QryUpdPedido: TwwQuery;
    QryUpdOperacao: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    //Al_14
    QryOperacaoApl: TwwQuery;
    QryUpdIrLitigio: TwwQuery;
    sbtnImprimir: TToolbarButton97;
    fraMensagem: TfraMensagem;
    PnlResgate: TPanel;
    pgcResgate: TPageControl;
    tbsDadosResg: TTabSheet;
    PnlFdoResg: TPanel;
    Label16: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    DbDtDataCotizacaoResg: TCMDateTimePicker;
    dbrValorLiquido: TDBRealEdit;
    dbrCotaResg: TDBRealEdit;
    tbsObsResg: TTabSheet;
    pnlObsResg: TPanel;
    dbeObsResg: TDBMemo;
    Panel4: TPanel;
    DbLkcFundoInvestResg: TwwDBLookupCombo;
    Label12: TLabel;
    PnlSaldoSintetico: TPanel;
    dbrQtdFinancResg: TDBRealEdit;
    dbrSaldoFinancResg: TDBRealEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    PnlCab2: TPanel;
    Label15: TLabel;
    DbDtDataCotizacaoAplic: TCMDateTimePicker;
    Label19: TLabel;
    dbrCota: TDBRealEdit;
    Label18: TLabel;
    dbrValorAplic: TDBRealEdit;
    dbrQtdOper: TDBRealEdit;
    Label20: TLabel;
    DbgResgate: TwwDBGrid;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    Panel2: TPanel;
    dbrQtdFinancApl: TDBRealEdit;
    dbrSaldoFinancApl: TDBRealEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel3: TPanel;
    DbgAplicacao: TwwDBGrid;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    sbtnExcluiDet: TToolbarButton97;
    sbtnAltDet: TToolbarButton97;
    sbtnInsDet: TToolbarButton97;
    QryFundoInvest: TwwQuery;
    qryIDPEDIDOFUNDO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryDATAPEDIDO: TDateTimeField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryVLRPEDIDO: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryDATACOTIZACAO: TDateTimeField;
    qryCODDOCUMENTO: TFloatField;
    qryNUMLANCTO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryPLANO: TFloatField;
    qryIDCOMPOSICAOFUNDO: TFloatField;
    qrySTAESPECIFICADO: TStringField;
    qryVLRCOTA: TFloatField;
    qryVLRCOLOCACAO: TFloatField;
    qryVLRTAXAS: TFloatField;
    qryVLRCORRETAGEM: TFloatField;
    qryOBSERVACAO: TMemoField;
    //Al_14
    qryIDTIPOFUNDOINVEST: TFloatField;
    qryDESCFUNDOINVEST: TStringField;
    QryOperacaoFundo: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField2: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField3: TStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    MemoField1: TMemoField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    //Al_14
    DsOperacaoFundo: TwwDataSource;
    UpdOperacaoFundo: TUpdateSQL;
    QryDestinoIDINCORPORACAOFUNDO: TFloatField;
    QryDestinoIDOPERACAOFUNDO: TFloatField;
    QryDestinoDATAPEDIDO: TDateTimeField;
    QryDestinoIDPEDIDOFUNDO: TFloatField;
    QryDestinoIDFUNDOINVEST: TFloatField;
    QryDestinoIDTIPOINVEST: TFloatField;
    QryDestinoIDTIPOFUNDOINVEST: TFloatField;
    QryDestinoIDTIPOOPERACAO: TFloatField;
    QryDestinoIDPLANPREVCTBPATR: TFloatField;
    QryDestinoDATALIQUIDACAO: TDateTimeField;
    QryDestinoDATACOTIZACAO: TDateTimeField;
    QryDestinoVLRPEDIDO: TFloatField;
    QryDestinoVLRCOTA: TFloatField;
    QryDestinoQTDOPERACAO: TFloatField;
    QryDestinoOBSERVACAO: TMemoField;
    QryDestinoDESCFUNDOINVEST: TStringField;
    //Al_14
    QryDelIncorporacaoFundo: TwwQuery;
    QryDelOperacaoFundoApl: TwwQuery;
    QryDelHistOperacaoApl: TwwQuery;
    Toolbar973: TToolbar97;
    Panel5: TPanel;
    fcLabel6: TfcLabel;
    fclTotalApl: TfcLabel;
    QryBuscaPedidos: TwwQuery;
    QryBuscaIncorporacaoFundo: TwwQuery;
    //Al_8
    qryDTAINIPROC: TDateTimeField;
    QryDestinoDTAINIPROC: TDateTimeField;
    //Al_8
    procedure dbrValorLiquidoExit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure DbLkcFundoInvestResgCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DbLkcFundoInvestAplCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbDDataOperacaoExit(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblTipoFundoExit(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure PnlFdoResgDblClick(Sender: TObject);
  private
    { Private declarations }
     procedure MostraUsuario(sUsuario   : String);
     procedure BuscaSaldoFundo(dData    : TDateTime; iIdFundoInvest : Integer;
                               var fSaldoVlr  : Currency; var fSaldoQtd, fVlrCota : Double);
     procedure MontaValores;

     function  VerificaResgFundo(iFundoInvestResg, iOperacaoFundo : Integer) : Boolean;
     //Paulo Nobre - 13/01/2009 - N. Sol 106085 -  N. Kintana 475364
     function  VerIncorporacaoFundo(ipPlanPrevCtbPatro, iFundoInvestResg : Integer; dDataOper : TDateTime) : Boolean;

  public
    { Public declarations }
  end;

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double;
                End;
//******************************************************************************


var
  FrmCadIncorporacaoFundo    : TFrmCadIncorporacaoFundo;
  fTotalAplicado             : Currency;

implementation

uses UBibliotecaInvest, UFundoComum, uMensErro, UOperComum, dFundoComum,
     dBaseDados, UDataBase, uSistema, UDiasUteisInv, FDmRelConsIncorporacao;

{$R *.DFM}

procedure TFrmCadIncorporacaoFundo.dbrValorLiquidoExit(Sender: TObject);
begin
  inherited;
   If dbrValorLiquido.Value > dbrSaldoFinancResg.Value Then
   begin
      MsgDlg('O Valor do Resgate é maior que o Saldo para esse Fundo de Investimento!',
               'Mensagem do Sistema', MtInformation ,[MbOk],0);
      dbrValorLiquido.SetFocus;
      Exit;
   end;

   QryDestino.FieldByName('VLRPEDIDO').AsFloat         := dbrValorLiquido.Value;
   QryDestino.FieldByName('QTDOPERACAO').AsFloat       :=
      OperComum.Round(OperComum.DivValorZero(QryDestino.FieldByName('VLRPEDIDO').AsFloat,
                                             QryDestino.FieldByName('VLRCOTA').AsFloat),
                                             QryFundoDestino.FieldByName('QTDDECQTD').AsInteger);
end;

procedure TFrmCadIncorporacaoFundo.MostraUsuario(sUsuario :String);
Var
   iUsuario : Integer;
begin

   iUsuario := 0;

   Try
     iUsuario  := StrToInt(Copy(Trim(sUsuario),3, Length(Trim(sUsuario))));
   Except
     fcLOperador.Caption := sUsuario;
     Exit;
   end;

   QryBuscaUsuario.Close;
   QryBuscaUsuario.ParamByName('IDUSUARIO').AsInteger := iUsuario;
   QryBuscaUsuario.Open;

   fcLOperador.Caption := QryBuscaUsuario.FieldByName('NOMEUSUARIO').AsString;

   QryBuscaUsuario.Close;

end;

procedure TFrmCadIncorporacaoFundo.sbtnInserirClick(Sender: TObject);
begin

   fTotalAplicado := 0;

   OperComum.LimpaParametros(Qry);
   Qry.Close;
   Qry.Open;

   OperComum.LimpaParametros(QryDestino);
   QryDestino.Close;
   QryDestino.Open;

   OperComum.LimpaParametros(QryOperacaoFundo);
   QryOperacaoFundo.Close;
   QryOperacaoFundo.Open;

   OperComum.LimpaParametros(QryTipoFundo);
   QryTipoFundo.Close;
   QryTipoFundo.ParamByname('IDTIPOINVEST').AsInteger       := iTipoInvestUsu;
   QryTipoFundo.ParamByname('IDTIPOFUNDOINVEST').AsInteger  := 0;
   QryTipoFundo.Open;

   OperComum.LimpaParametros(QryFundoOrigem);
   QryFundoOrigem.Close;
   QryFundoOrigem.Open;

   OperComum.LimpaParametros(QryFundoDestino);
   QryFundoDestino.Close;
   QryFundoDestino.Open;

   QryTpoOperOrig.Close;
   QryTpoOperOrig.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTpoOperOrig.Open;
   if QryTpoOperOrig.IsEmpty then
   begin
      MsgDlg('Não foi parametrizado os tipos de operação para incorporação.',
             'Mensagem do Sistema', MtInformation ,[MbOk],0);
      exit;       
   end;

   QryTpoOperDest.Close;
   QryTpoOperDest.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTpoOperDest.Open;
   if QryTpoOperDest.IsEmpty then
   begin
      MsgDlg('Não foi parametrizado os tipos de operação para incorporação.',
             'Mensagem do Sistema', MtInformation ,[MbOk],0);
      exit;       
   end;

  inherited;

   If not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   PnlOrigem.Enabled        := True;
   Toolbar972.Enabled       := True;
   dbeObsResg.Enabled       := True;
   dbeObsApl.Enabled        := True;

   If QryTipoFundo.RecordCount = 1 Then
   begin

      dbDDataOperacao.Date     := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;
      dblTipoFundo.Text        := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
      dblTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;

      QryFundoOrigem.Close;
      QryFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
      QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryFundoOrigem.Open;

      DbLkcFundoInvestResg.Enabled := True;

   end;

   dbrSaldoFinancResg.Clear;
   dbrQtdFinancResg.Clear;

   dbrSaldoFinancApl.Clear;
   dbrQtdFinancApl.Clear;

   pgcResgate.ActivePage       := tbsDadosResg;
   pgcAplicacao.ActivePage     := tbsDadosApl;

   sbtnImprimir.Enabled        := False;
   DbLkcFundoInvestApl.Enabled := True;
   PnlData.Enabled             := True;

   sbtnInsDet.Enabled          := True;
   sbtnAltDet.Enabled          := True;
   sbtnExcluiDet.Enabled       := True;

   sbtnAltDet.Enabled          := False;
   sbtnExcluiDet.Enabled       := False;

   QryDestino.Insert;
   QryOperacaoFundo.Insert;

end;

procedure TFrmCadIncorporacaoFundo.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
   QryDestino.Edit;
end;

procedure TFrmCadIncorporacaoFundo.DbLkcFundoInvestResgCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var fSaldoVlr  : Currency;
    fSaldoQtd, fVlrCota : Double;
begin

   If Trim(DbLkcFundoInvestResg.Text) = '' Then
   begin
      DbLkcFundoInvestResg.SetFocus;
      Exit;
   end;   

   If DbLkcFundoInvestResg.LookupValue = DbLkcFundoInvestApl.LookupValue Then
   begin
      MsgDlg('O Fundo de Resgate não pode ser igual ao Fundo da Aplicação!',
             'Mensagem do Sistema', MtInformation ,[MbOk],0);
      DbLkcFundoInvestResg.Clear;
      DbLkcFundoInvestResg.SetFocus;
      Exit;
   end;
   
  inherited;

   MontaValores;

end;

procedure TFrmCadIncorporacaoFundo.bbtnConfirmarClick(Sender: TObject);
Var
   //AL_16
   sTipoOper, sMens : String;
   iIdForCli, iPlanilha, iDocumento, iPlano : Integer;
   fVlrCustoAcoes, fVlrVarAcoes, fValorIR, fTotalApl : Currency;
begin
   iIdForCli := -1;
   fTotalApl :=  0;
   If Qry.IsEmpty Then
   begin
      MsgDlg('Essa Operação será cancelada!','Mensagem do Sistema', mtInformation,[MbOk],0);
      bbtnCancelarClick(Sender);
      Exit;
   end;

   If Qry.State In [DsInsert, DsEdit] Then
   begin
      MsgDlg('Conclua a Operação antes de Confirmar!','Mensagem do Sistema', mtInformation,[MbOk],0);
      Exit;
   end;

   //AL_6
   //AL_15
   if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   //AL_13
   if VerEmAbertura(Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   if VerEmAbertura(QryDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   Try
      Qry.First;
      While Not Qry.Eof Do
      begin
         iPlanilha      := -1;
         iDocumento     := -1;
         iPlano         := -1;
         fVlrCustoAcoes := 0;
         fVlrVarAcoes   := 0;

         fraMensagem.Mostra;
         fraMensagem.Mes := 'Efetuando Resgate';

         QryFundoInvest.Close;
         QryFundoInvest.ParamByName('IDFUNDOINVEST').AsInteger :=
                        Qry.FieldByName('IDFUNDOINVEST').AsInteger;
         QryFundoInvest.Open;

         If (Qry.FieldByName('DATAPEDIDO').AsDateTime = Qry.FieldByName('DATACOTIZACAO').AsDateTime) Then
         Begin
            fraMensagem.Max := 3;
            fraMensagem.Incrementa;
            //Al_5            
            //Alt_1
            If Not ResgateFACFIF(Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                 Qry.FieldByName('IDPEDIDOFUNDO').AsInteger,
                                 QryTpoOperOrig.FieldByName('IDTIPOOPERACAO').AsInteger,
                                 QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                 Qry.FieldByName('IDFUNDOINVEST').AsInteger, -1,
                                 Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                 Qry.FieldByName('DATACOTIZACAO').AsDateTime,
                                 Qry.FieldByName('DATAPEDIDO').AsDateTime,
                                 Qry.FieldByName('DATALIQUIDACAO').AsDateTime, 0,
                                 Qry.FieldByName('VLRPEDIDO').AsFloat, 0,
                                 fVlrCustoAcoes, fVlrVarAcoes, -1, 0, fraMensagem) Then
               Raise Exception.Create('Não foi possível efetuar o Resgate do Fundo, '+#13+
                                      'Esta operação será Cancelada.');
            fraMensagem.Incrementa;

            With DmFundoComum Do
            Begin
               QryConfirmacao.Close;
               QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                          Qry.FieldByName('IDFUNDOINVEST').AsInteger;
               QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                          Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
               QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := dbDDataOperacao.Text;
               QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                          Qry.FieldByName('DATACOTIZACAO').AsString;
               QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
               //Al_7
               QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                          Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;
               QryConfirmacao.Open;

               fraMensagem.Incrementa;

               fValorIR        := 0;

               fraMensagem.Apaga;
               fraMensagem.Mostra;
               fraMensagem.Mes := 'Confirmando Resgate';
               fraMensagem.Max := (QryConfirmacao.RecordCount*4)+5;

               iIdForCli   := OperComum.BuscaForCli(
                                  QryFundoInvest.FieldByName('IDTIPOINVEST').AsInteger,
                                  QryFundoInvest.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                  QryTpoOperOrig.FieldByName('IDTIPOOPERACAO').AsInteger,
                                  pRPI.IDTIPOCLIENTEEMI);

               fraMensagem.Incrementa;

               While Not QryConfirmacao.Eof Do
               Begin
                  If (QryConfirmacaoDATAOPERACAO.AsDateTime <> QryConfirmacaoDATACOTIZACAO.AsDateTime) And
                     (QryConfirmacaoQTDOPERACAO.AsFloat = 0) Then
                      sTipoOper   := 'CTZ'
                  Else
                      sTipoOper   := 'OPE';

                  //AL_16
                  //Rotina de confirmação das operações
                  If Not AlimentaFundo(QryConfirmacaoIDTIPOINVEST.AsInteger,
                                       QryConfirmacaoIDTIPOOPERACAO.AsInteger,
                                       QryConfirmacaoIDCARTEIRAINVEST.AsInteger,
                                       QryConfirmacaoIDFUNDOINVEST.AsInteger,
                                       iPlanoPrevContab,
                                       iPatrocinadora,
                                       QryConfirmacaoIDOPERACAOFUNDO.AsInteger,
                                       QryConfirmacaoIDOPERACAOORIGEM.AsInteger,
                                       QryConfirmacaoQTDDECQTD.AsInteger,
                                       QryConfirmacaoIDTIPOFUNDOINVEST.AsInteger,
                                       iIdForCli,
                                       QryConfirmacaoDATAOPERACAO.AsDateTime,
                                       QryConfirmacaoDATACOTIZACAO.AsDateTime,
                                       QryConfirmacaoDATALIQUIDACAO.AsDateTime,
                                       QryConfirmacaoQTDOPERACAO.AsFloat,
                                       QryConfirmacaoVLRCOTA.AsFloat,
                                       QryConfirmacaoVLRLIQUIDO.AsFloat,
                                       QryConfirmacaoVLRIR.AsFloat,
                                       QryConfirmacaoVLRIOF.AsFloat,
                                       QryTpoOperOrig.FieldByName('NATUREZAOPERACAO').AsString,
                                       QryTpoOperOrig.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                           DbLkcFundoInvestResg.Text,
                                       sTipoOper , True,
                                       iPlanPrevCtbPatro,-1,-1,
                                       QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens) Then
                  begin
                     //Al_5
                     //AL_16
                     if sMens <> '' then
                        Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +
                                               'Mensagem: ' + sMens)
                     else
                        Raise Exception.Create('Não foi possível confirmar o Resgate' + #13 +
                                               'Ocorreu um problema durante o processo de gravação' + #13 +
                                               'Refaça a operação');
                  end;

                  fraMensagem.Incrementa;

                  fValorIR       := fValorIR + QryConfirmacaoVLRIR.AsFloat;

                  ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'' WHERE '+
                                      '(IDOPERACAOFUNDO   = '''+
                                         IntToStr(QryConfirmacaoIDOPERACAOFUNDO.AsInteger)  +''')');

                  fraMensagem.Incrementa;

                  QryConfirmacao.Next;

               End;

               If iTipoInvestUsu <> 6 Then
               Begin
                  fVlrCustoAcoes := 0;
                  fVlrVarAcoes   := 0;
               End;

               fraMensagem.Mes := 'Contabilizando Resgate';
               fraMensagem.Incrementa;

               //Al_4
               //Al_3
               If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                               Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                                               Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                               QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                               QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                               iIdForCli,
                                               Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                               StrToDate(dbDDataOperacao.Text),
                                               Qry.FieldByName('DATALIQUIDACAO').AsDateTime,
                                               sTipoOper,
                                               QryTpoOperOrig.FieldByName('NATUREZAOPERACAO').AsString,
                                               QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                               True, Qry.FieldByName('VLRPEDIDO').AsFloat,
                                               fValorIR, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
                                               -1, 0, 0, 0,
                                               QryTpoOperOrig.FieldByName('FLGCONTAINVEST').AsInteger) Then
               begin
                  //Al_5
                  dtmBaseDados.dbBaseDados.Rollback;
                  fraMensagem.Apaga;
                  bbtnCancelarClick(Sender);
                  Exit;
               end;
               fraMensagem.Incrementa;
            End;
         End
         Else
         Begin
            fraMensagem.Mes := 'Contabilizando Resgate';

            //Al_4
            //Al_3
            If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                            Qry.FieldByName('IDTIPOOPERACAO').AsInteger,
                                            Qry.FieldByName('IDTIPOINVEST').AsInteger,
                                            QryFundoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                            QryFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                            iIdForCli,
                                            Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                            StrToDate(dbDDataOperacao.Text),
                                            Qry.FieldByName('DATALIQUIDACAO').AsDateTime,
                                            'OPE',
                                            QryTpoOperOrig.FieldByName('NATUREZAOPERACAO').AsString,
                                            QryFundoInvest.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                            False, Qry.FieldByName('VLRPEDIDO').AsFloat,
                                            0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
                                            -1, 0, 0, 0,
                                            QryTpoOperOrig.FieldByName('FLGCONTAINVEST').AsInteger) Then
            begin
               //Al_5
               dtmBaseDados.dbBaseDados.Rollback;
               fraMensagem.Apaga;
               bbtnCancelarClick(Sender);
               Exit;
            end;
         End;

         fraMensagem.Mes := 'Atualizando Contábil do Resgate';
         fraMensagem.Incrementa;

         With QryUpdPedido Do
         Begin
           Close;
           ParamByName('IDPEDIDOFUNDO').AsInteger        := Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;
           If iPlanilha <> -1 then
           Begin
              ParamByName('PLANO').AsInteger             := iPlano;
              ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
           End
           Else
           Begin
              ParamByName('PLANO').Clear;
              ParamByName('PLNCODIGO').Clear;
           End;

           If iDocumento <> -1 then
              ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
           Else
              ParamByName('CODDOCUMENTO').Clear;

           ExecSQL;
           Close;
         End;
         fraMensagem.Incrementa;

         DmFundoComum.QryConfirmacao.First;
         While Not DmFundoComum.QryConfirmacao.Eof Do
         begin
            With QryUpdOperacao Do
            Begin
              Close;
              ParamByName('IDOPERACAOFUNDO').AsInteger      := DmFundoComum.QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
              If iPlanilha <> -1 then
              Begin
                 ParamByName('PLANO').AsInteger             := iPlano;
                 ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
              End
              Else
              Begin
                 ParamByName('PLANO').Clear;
                 ParamByName('PLNCODIGO').Clear;
              End;

              If iDocumento <> -1 then
                 ParamByName('CODDOCUMENTO').AsInteger      := iDocumento
              Else
                 ParamByName('CODDOCUMENTO').Clear;

              ExecSQL;
              Close;
            End;
            
            fraMensagem.Incrementa;

            With QryUpdIrLitigio Do
            Begin
              Close;
              ParamByName('IDOPERACAOFUNDO').AsInteger      := DmFundoComum.QryConfirmacao.FieldByName('IDOPERACAOFUNDO').AsInteger;
              If iPlanilha <> -1 then
              Begin
                 ParamByName('PLANO').AsInteger             := iPlano;
                 ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
              End
              Else
              Begin
                 ParamByName('PLANO').Clear;
                 ParamByName('PLNCODIGO').Clear;
              End;
              ExecSQL;
              Close;
            End;

            fraMensagem.Incrementa;

            DmFundoComum.QryConfirmacao.Next;
         end;

         fTotalApl := fTotalApl + Qry.FieldByName('VLRPEDIDO').AsFloat;

         Qry.Next;
      end;

      fraMensagem.Apaga;
      fraMensagem.Mostra;
      fraMensagem.Mes := 'Efetuando Aplicação';
      fraMensagem.Max := 8;
      fraMensagem.Incrementa;

      QryOperacaoFundo.Edit;
      QryOperacaoFundo.FieldByName('QTDOPERACAO').AsFloat         :=
                       OperComum.Round(OperComum.DivValorZero(fTotalApl,
                                                              QryOperacaoFundo.FieldByName('VLRCOTA').AsFloat),
                                                              QryFundoDestino.FieldByName('QTDDECQTD').AsInteger);
      QryOperacaoFundo.FieldByName('VLROPERACAO').AsFloat         := fTotalApl;
      QryOperacaoFundo.FieldByName('STACONFIRMA').AsString        := 'S';

      QryOperacaoFundo.Post;
      QryOperacaoFundo.ApplyUpdates;
      QryOperacaoFundo.CommitUpdates;

      fraMensagem.Incrementa;

      QryDestino.First;
      While Not QryDestino.Eof Do
      begin
         QryDestino.Edit;
         QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger   :=
                      QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger;
         QryDestino.Post;
         QryDestino.Next;
      end;
      QryDestino.ApplyUpdates;
      QryDestino.CommitUpdates;

      fraMensagem.Incrementa;

      iPlanilha      := -1;
      iDocumento     := -1;
      iPlano         := -1;
      fVlrCustoAcoes := 0;
      fVlrVarAcoes   := 0;

      iIdForCli := OperComum.BuscaForCli(
                             QryFundoDestino.FieldByName('IDTIPOINVEST').AsInteger,
                             QryFundoDestino.FieldByName('IDGESTORCARTEIRA').AsInteger,
                             QryTpoOperDest.FieldByName('IDTIPOOPERACAO').AsInteger,
                             pRPI.IDTIPOCLIENTEEMI);

      fraMensagem.Incrementa;
      fraMensagem.Mes := 'Atualizando Aplicação';

      If (QryOperacaoFundo.FieldByName('DATAOPERACAO').AsDateTime <> QryDestino.FieldByName('DATACOTIZACAO').AsDateTime) And
         (QryOperacaoFundo.FieldByName('QTDOPERACAO').AsFloat = 0) Then

          sTipoOper := 'CTZ'
      Else
          sTipoOper := 'OPE';

      //AL_16
      //Rotina de confirmação das operações
      If Not AlimentaFundo(QryOperacaoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                           QryOperacaoFundo.FieldByName('IDTIPOOPERACAO').AsInteger,
                           QryFundoDestino.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger,
                           iPlanoPrevContab,
                           iPatrocinadora,
                           QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger,
                           QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger,
                           QryFundoDestino.FieldByName('QTDDECQTD').AsInteger,
                           QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           iIdForCli,
                           QryOperacaoFundo.FieldByName('DATAOPERACAO').AsDateTime,
                           QryOperacaoFundo.FieldByName('DATACOTIZACAO').AsDateTime,
                           QryOperacaoFundo.FieldByName('DATALIQUIDACAO').AsDateTime,
                           QryOperacaoFundo.FieldByName('QTDOPERACAO').AsFloat,
                           QryOperacaoFundo.FieldByName('VLRCOTA').AsFloat,
                           QryOperacaoFundo.FieldByName('VLROPERACAO').AsFloat, 0{IRRF},  0{IOF},
                           QryTpoOperDest.FieldByName('NATUREZAOPERACAO').AsString,
                           QryTpoOperDest.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                                QryFundoDestino.FieldByName('DESCFUNDOINVEST').AsString,
                           sTipoOper, True, iPlanPrevCtbPatro, -1, -1, 0{Rendimento}, sMens) Then
      begin
         //Al_5
         //AL_16
         if sMens <> '' then
            Raise Exception.Create('Não foi possível confirmar a Aplicação' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível confirmar a Aplicação' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');
      end;

      fraMensagem.Incrementa;
      fraMensagem.Mes := 'Contabilizando Aplicação';

      //Al_4
      //Al_3
      If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
                                      QryOperacaoFundo.FieldByName('IDTIPOOPERACAO').AsInteger,
                                      QryOperacaoFundo.FieldByName('IDTIPOINVEST').AsInteger,
                                      QryFundoDestino.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                      QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                      iIdForCli,
                                      QryOperacaoFundo.FieldByName('IDFUNDOINVEST').AsInteger,
                                      StrToDate(dbDDataOperacao.Text),
                                      QryOperacaoFundo.FieldByName('DATALIQUIDACAO').AsDateTime,
                                      'OPE',
                                      QryTpoOperDest.FieldByName('NATUREZAOPERACAO').AsString,
                                      QryFundoDestino.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
                                      True, QryOperacaoFundo.FieldByName('VLROPERACAO').AsFloat,
                                      0, 0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
                                      -1, 0, 0, 0,
                                      QryTpoOperDest.FieldByName('FLGCONTAINVEST').AsInteger) Then
      begin
         //Al_5
         dtmBaseDados.dbBaseDados.Rollback;
         fraMensagem.Apaga;
         bbtnCancelarClick(Sender);
         Exit;
      end;
      fraMensagem.Incrementa;

      QryOperacaoFundo.Edit;
      If iPlanilha <> -1 then
      Begin
         QryOperacaoFundo.FieldByName('PLANO').AsInteger             := iPlano;
         QryOperacaoFundo.FieldByName('PLNCODIGO').AsInteger         := iPlanilha;
      End
      Else
      Begin
         QryOperacaoFundo.FieldByName('PLANO').Clear;
         QryOperacaoFundo.FieldByName('PLNCODIGO').Clear;
      End;
      fraMensagem.Incrementa;

      If iDocumento <> -1 then
         QryOperacaoFundo.FieldByName('CODDOCUMENTO').AsInteger      := iDocumento
      Else
         QryOperacaoFundo.FieldByName('CODDOCUMENTO').Clear;
      QryOperacaoFundo.Post;
      QryOperacaoFundo.CommitUpdates;
      fraMensagem.Incrementa;

      //Al_9
      If dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                                            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      fraMensagem.Apaga;

      //Al_10
      Qry.First;
      While Not Qry.Eof Do
      begin
         If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            // Alt_2
            If Not Reprocessamento(iTipoInvestUsu,
                                   QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanPrevCtbPatro,
                                   StrToDate(dbDDataOperacao.Text),
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   Qry.FieldByName('DTAINIPROC').AsDateTime,
                                   True) Then
            begin
               //AL_17            
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
               bbtnCancelarClick(Sender);
               Exit;
            end;
         end;
         Qry.Next;
      end;

      QryDestino.First;
      If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         // Alt_2
         If Not Reprocessamento(iTipoInvestUsu,
                                QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryDestino.FieldByName('IDFUNDOINVEST').AsInteger,
                                iPlanPrevCtbPatro,
                                StrToDate(dbDDataOperacao.Text),
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryDestino.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
         begin
            //AL_17
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
            bbtnCancelarClick(Sender);
            Exit;
         end;
      end;
      //Al_10

      MsgDlg('Processo Concluído!','Mensagem do Sistema', mtInformation, [mbOk],0);

      QryTipoFundoInvest.Close;

      sbtnInserirClick(Sender);

      fclTotalApl.Caption     := '0,00';

   Except
       //Al_5
      On E:Exception Do
      Begin
        fraMensagem.Apaga;
        MsgDlg(E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
        bbtnCancelarClick(Sender);
      End;
      //Al_3
   End;

end;

procedure TFrmCadIncorporacaoFundo.DbLkcFundoInvestAplCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
   DadosCota  : TDadosCota;
   fSaldoVlr  : Currency;
   fSaldoQtd, fVlrCota : Double;
begin

  inherited;

  If (Trim(DbLkcFundoInvestApl.Text) = '') Then
  begin
     DbLkcFundoInvestApl.SetFocus;
     Exit;
  end;     

  //Paulo Nobre - 13/01/2009 - N. Sol 106085 -  N. Kintana 475364
  If VerIncorporacaoFundo(iPlanPrevCtbPatro, StrToInt(DbLkcFundoInvestApl.LookupValue),
                          dbDDataOperacao.Date) Then
  begin
     DbLkcFundoInvestApl.Clear;
     DbLkcFundoInvestApl.SetFocus;
     Exit;
  end;

  If modified Then
  begin
     // Busca dados da Cota
     DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                             StrToInt(DbLkcFundoInvestApl.LookupValue),
                                             dbDDataOperacao.Date);


     QryDestino.FieldByName('VLRCOTA').AsFloat           := DadosCota.VlrCota;
     QryDestino.FieldByName('QTDOPERACAO').AsFloat       :=
        OperComum.Round(OperComum.DivValorZero(QryDestino.FieldByName('VLRPEDIDO').AsFloat,
                                               QryDestino.FieldByName('VLRCOTA').AsFloat),
                                               QryFundoDestino.FieldByName('QTDDECQTD').AsInteger);
     fVlrCota   := 0;
     fSaldoVlr  := 0;
     fSaldoQtd  := 0;

     BuscaSaldoFundo(dbDDataOperacao.Date,
                     StrToInt(DbLkcFundoInvestApl.LookupValue),
                     fSaldoVlr, fSaldoQtd, fVlrCota);

     dbrSaldoFinancApl.Value := fSaldoVlr;
     dbrQtdFinancApl.Value   := fSaldoQtd;

  end;

end;

procedure TFrmCadIncorporacaoFundo.dbDDataOperacaoExit(Sender: TObject);
begin
  inherited;
   DbLkcFundoInvestResg.SetFocus;
   If Trim(DbLkcFundoInvestResg.Text) <> '' Then
      MontaValores;
end;

procedure TFrmCadIncorporacaoFundo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;  

   pgcResgate.ActivePage   := tbsDadosResg;
   pgcAplicacao.ActivePage := tbsDadosApl;  

   DbgResgate.BringToFront;
   DbgAplicacao.BringToFront;

   sbtnImprimir.Enabled    := False;
   sbtnApagar.Enabled      := False;

   dblTipoFundo.Clear;
   dbDDataOperacao.Clear;

   dbrCotaResg.Value       := 0;
   dbrValorLiquido.Value   := 0;
   dbrSaldoFinancResg.Value:= 0;
   dbrQtdFinancResg.Value  := 0;
   dbrSaldoFinancApl.Value := 0;
   dbrQtdFinancApl.Value   := 0;
   dbrValorAplic.Value     := 0;
   dbrCota.Value           := 0;
   dbrQtdOper.Value        := 0;
   fclTotalApl.Caption     := '0,00';

   OperComum.LimpaParametros(Qry);
   Qry.Open;
   OperComum.LimpaParametros(QryDestino);
   QryDestino.Open;
   QryTipoFundo.Close;
   QryFundoOrigem.Close;
   QryFundoDestino.Close;

   BtOkDet.Enabled    := False;
   BtCancDet.Enabled  := False;
   BtVoltaDet.Enabled := False;
      
end;

procedure TFrmCadIncorporacaoFundo.dblTipoFundoExit(Sender: TObject);
begin
  inherited;
   Qry.FieldByName('DATAPEDIDO').AsDateTime := QryTipoFundo.FieldByName('DATAULTFECH').AsDateTime;

   QryFundoOrigem.Close;
   QryFundoOrigem.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryFundoOrigem.Open;

end;

procedure TFrmCadIncorporacaoFundo.sbtnProcurarClick(Sender: TObject);
var fSaldoVlr  : Currency;
    fSaldoQtd, fVlrCota : Double;
begin
  fVlrCota   := 0;
  fSaldoVlr  := 0;
  fSaldoQtd  := 0;

  inherited;
  if MontaSelect.RetornouValor then
  begin
     OperComum.LimpaParametros(Qry);
     Qry.ParamByName('IDOPERACAOFUNDO').AsInteger := StrToInt(montaSelect.ValoresChave[0]);
     Qry.Open;

     OperComum.LimpaParametros(QryDestino);
     QryDestino.ParamByName('IDOPERACAOFUNDO').AsInteger := StrToInt(montaSelect.ValoresChave[0]);
     QryDestino.Open;


     OperComum.LimpaParametros(QryTipoFundo);
     QryTipoFundo.Close;
     QryTipoFundo.ParamByname('IDTIPOFUNDOINVEST').AsInteger   := StrToInt(MontaSelect.ValoresChave[1]);
     QryTipoFundo.ParamByname('IDTIPOINVEST').AsInteger        := iTipoInvestUsu;
     QryTipoFundo.Open;

     QryTipoFundo.Locate('IDTIPOFUNDOINVEST',
                  QryDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger, []);

     dblTipoFundo.Text        := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
     dblTipoFundo.LookupValue := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;

     dbDDataOperacao.Text     := montaSelect.ValoresChave[2];
     fclTotalApl.Caption      := FloatToStrF(
                                      StrToFloat(montaSelect.ValoresChave[3]),ffNumber,18,2);     

     OperComum.LimpaParametros(QryFundoOrigem);
     QryFundoOrigem.Open;

     OperComum.LimpaParametros(QryFundoDestino);
     QryFundoDestino.Open;

     pnlFundo.Enabled         := True;
     PnlOrigem.Enabled        := False;
     Toolbar972.Enabled       := False;

     dbeObsResg.Enabled       := False;
     dbeObsApl.Enabled        := False;

     sbtnApagar.Enabled       := True;
     sbtnImprimir.Enabled     := True;
  end
  Else
  begin
     sbtnImprimir.Enabled     := False;
     If Qry.IsEmpty  Then
     begin
        sbtnApagar.Enabled    := False;
        sbtnInserir.Enabled   := True;
        sbtnProcurar.Enabled  := True;
     end
     Else
     begin
        sbtnApagar.Enabled    := True;
        sbtnProcurar.Enabled  := True;
     end
  end;
  bbtnCancelar.Enabled        := True;
end;

procedure TFrmCadIncorporacaoFundo.sbtnApagarClick(Sender: TObject);
begin
  inherited;

  // AL_4
  //AL_15
  if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
  begin
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
     Exit;
  end;

  //AL_13
  if VerEmAbertura(Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  if VerEmAbertura(QryDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
     Exit;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrNo Then
     Exit;

   Try
      If not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;

      //Al_13
      fraMensagem.Mostra;
      fraMensagem.Max := 5;
      fraMensagem.Mes := 'Excluindo Aplicação ';
      OperComum.LimpaParametros(QryOperacaoApl);
      QryOperacaoApl.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryOperacaoApl.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryOperacaoApl.ParamByName('DATA').AsString               := dbDDataOperacao.Text;
      QryOperacaoApl.ParamByName('IDOPERACAOFUNDO').AsInteger   :=
                             QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
      QryOperacaoApl.Open;
      fraMensagem.Incrementa;

      If (QryOperacaoApl.FieldByName('CODDOCUMENTO').AsInteger > 0) Or
         (QryOperacaoApl.FieldByName('PLNCODIGO').AsInteger    > 0) Then
      begin
         If Not ProcExcluiFundo(QryOperacaoApl.FieldByName('CODDOCUMENTO').AsInteger,
                                QryOperacaoApl.FieldByName('PLNCODIGO').AsInteger,
                                QryOperacaoApl.FieldByName('PLANO').AsInteger,
                                QryOperacaoApl.FieldByName('IDTIPOINVEST').AsInteger,
                                QryOperacaoApl.FieldByName('DATAOPERACAO').AsDateTime, True) Then
         begin
            //Al_5
            If dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
            fraMensagem.Apaga;
            bbtnCancelarClick(Sender);
            Exit;
            //Al_6
         end;
      end;

      fraMensagem.Incrementa;

      OperComum.LimpaParametros(QryDelHistOperacaoApl);
      QryDelHistOperacaoApl.ParamByName('DATA').AsString               := dbDDataOperacao.Text;
      QryDelHistOperacaoApl.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDelHistOperacaoApl.ParamByName('IDOPERACAOFUNDO').AsInteger   :=
                         QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
      QryDelHistOperacaoApl.ExecSQL;

      fraMensagem.Incrementa;

      OperComum.LimpaParametros(QryDelIncorporacaoFundo);
      QryDelIncorporacaoFundo.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                              QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
      QryDelIncorporacaoFundo.ExecSQL;

      fraMensagem.Incrementa;

      OperComum.LimpaParametros(QryDelOperacaoFundoApl);
      QryDelOperacaoFundoApl.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                             QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
      QryDelOperacaoFundoApl.ExecSQL;

      fraMensagem.Incrementa;

      //Al_13
      fraMensagem.Apaga;
      fraMensagem.Mostra;
      fraMensagem.Max := 3;
      fraMensagem.Mes := 'Excluindo Resgate ';
      fraMensagem.Incrementa;
      Qry.First;
      fraMensagem.Incrementa;
      If Not ExcluiResgate(Qry.FieldByName('IDPEDIDOFUNDO').AsInteger) Then
      begin
         //Al_5
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.Rollback;
         fraMensagem.Apaga;
         bbtnCancelarClick(Sender);
         Exit;
         //Al_6
      end;

      fraMensagem.Incrementa;

      //Al_9
      If dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;

      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByName('IDTIPOFUNDOINVEST').AsInteger :=
                                            QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      QryTipoFundoInvest.Open;

      fraMensagem.Apaga;

      //Al_10
      Qry.First;
      While Not Qry.Eof Do
      begin
         If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            //Alt_2
            If Not Reprocessamento(iTipoInvestUsu,
                                   QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   Qry.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanPrevCtbPatro,
                                   StrToDate(dbDDataOperacao.Text),
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   Qry.FieldByName('DTAINIPROC').AsDateTime,
                                   True) Then
            begin
               //AL_17
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
               bbtnCancelarClick(Sender);
               Exit;
            end;
         end;
         Qry.Next;
      end;

      QryDestino.First;
      If StrToDate(dbDDataOperacao.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         If Not Reprocessamento(iTipoInvestUsu,
                                QryTipoFundoInvest.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                QryDestino.FieldByName('IDFUNDOINVEST').AsInteger,
                                iPlanPrevCtbPatro,
                                StrToDate(dbDDataOperacao.Text),
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryDestino.FieldByName('DTAINIPROC').AsDateTime,
                                True) Then
         Begin
            //AL_17
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0);
            bbtnCancelarClick(Sender);
            Exit;
         end;
      end;

      //Al_9
      QryTipoFundoInvest.Close;

      bbtnCancelarClick(Sender);

      MsgDlg('Processo Concluído.','Mensagem do Sistema', mtInformation, [mbOk],0);

   Except
       //Al_5
      On E:Exception Do
      Begin
         fraMensagem.Apaga;
         MsgDlg('Não foi possível concluir a Operação:'+#13+
                E.Message,'Mensagem do Sistema',mtWarning,[mbOk],0);
         bbtnCancelarClick(Sender);
      End;
   End;
end;

procedure TFrmCadIncorporacaoFundo.BuscaSaldoFundo(dData          : TDateTime;
                                                   iIdFundoInvest : Integer;
                                                   var fSaldoVlr  : Currency;
                                                   var fSaldoQtd, fVlrCota : Double);
var
   DadosCota  : TDadosCota;
begin
   QrySaldoFundoTotal.Close;
   QrySaldoFundoTotal.ParamByName('DATAMOVFUNDO').AsString       := DateToStr(dData);
   QrySaldoFundoTotal.ParamByName('IDFUNDOINVEST').AsInteger     := iIdFundoInvest;
   QrySaldoFundoTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QrySaldoFundoTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QrySaldoFundoTotal.Open;

   If QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat > 0 Then
   Begin
      // Busca dados da Cota
      DadosCota := UFundoComum.BuscaCotaFundo(QryAux, iIdFundoInvest, dData);

      fVlrCota  := DadosCota.VlrCota;

      fSaldoVlr := QrySaldoFundoTotal.FieldByName('SALDOVLRFUNDO').AsFloat;

      fSaldoQtd := QrySaldoFundoTotal.FieldByName('SALDOQTDCOTAS').AsFloat;
   End;
end;

procedure TFrmCadIncorporacaoFundo.sbtnImprimirClick(Sender: TObject);
begin
  inherited;

  If Not Qry.IsEmpty Then
  begin
     DmRelConsIncorporacao.QryConsIncorporacao.Close;
     DmRelConsIncorporacao.QryConsIncorporacao.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                           QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
     DmRelConsIncorporacao.QryConsIncorporacao.Open;

     DmRelConsIncorporacao.QryConsIncorporacaoResgDet.Close;
     DmRelConsIncorporacao.QryConsIncorporacaoResgDet.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                           QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
     DmRelConsIncorporacao.QryConsIncorporacaoResgDet.Open;

     DmRelConsIncorporacao.QryConsIncorporacaoAplDet.Close;
     DmRelConsIncorporacao.QryConsIncorporacaoAplDet.ParamByName('IDOPERACAOFUNDO').AsInteger :=
                           QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger;
     DmRelConsIncorporacao.QryConsIncorporacaoAplDet.Open;

     TfrmPreview.CreateModalPreview(Application,
                                    DmRelConsIncorporacao.rpConsIncorporacao,
                                    DmRelConsIncorporacao.rpConsIncorporacao.PrinterSetup.DocumentName);
  end
end;

procedure TFrmCadIncorporacaoFundo.FormShow(Sender: TObject);
begin
  inherited;
   fraMensagem.Apaga;

   DbgResgate.BringToFront;
   DbgAplicacao.BringToFront;   

   OperComum.LimpaParametros(Qry);
   Qry.Open;
   
   OperComum.LimpaParametros(QryDestino);
   QryDestino.Open;
   
end;

procedure TFrmCadIncorporacaoFundo.MontaValores;
var fSaldoVlr  : Currency;
    fSaldoQtd, fVlrCota : Double;
begin

   fVlrCota   := 0;
   fSaldoVlr  := 0;
   fSaldoQtd  := 0;

   BuscaSaldoFundo(dbDDataOperacao.Date, StrToInt(DbLkcFundoInvestResg.LookupValue),
                   fSaldoVlr, fSaldoQtd, fVlrCota);

   If fSaldoVlr > 0 Then
   begin
      dbrSaldoFinancResg.Value                            := fSaldoVlr;
      dbrQtdFinancResg.Value                              := fSaldoQtd;

      Qry.FieldByName('VLRCOTA').AsFloat                  := fVlrCota;

      Qry.FieldByName('DATAPEDIDO').AsDateTime            := dbDDataOperacao.Date;
      Qry.FieldByName('DATACOTIZACAO').AsDateTime         := dbDDataOperacao.Date;
      Qry.FieldByName('DATALIQUIDACAO').AsDateTime        := dbDDataOperacao.Date;
      Qry.FieldByName('VLRPEDIDO').AsFloat                := fSaldoVlr;

      QryDestino.FieldByName('DATAPEDIDO').AsDateTime     := dbDDataOperacao.Date;
      QryDestino.FieldByName('DATACOTIZACAO').AsDateTime  := dbDDataOperacao.Date;
      QryDestino.FieldByName('VLRPEDIDO').AsFloat         := fSaldoVlr;

      QryDestino.FieldByName('QTDOPERACAO').AsFloat       :=
        OperComum.Round(
            OperComum.DivValorZero(QryDestino.FieldByName('VLRPEDIDO').AsFloat,
                                      QryDestino.FieldByName('VLRCOTA').AsFloat),
                                         QryFundoDestino.FieldByName('QTDDECQTD').AsInteger);

      If QryDestino.RecordCount < 1 Then
         DbLkcFundoInvestApl.SetFocus;

   end
   else
   begin
      dbrSaldoFinancResg.Value := 0;
      dbrQtdFinancResg.Value   := 0;
      dbrValorLiquido.Value    := 0;
      dbrCotaResg.Value        := 0;

      MsgDlg('Não há Saldo para esse Fundo de Investimento!',
             'Mensagem do Sistema', MtInformation ,[MbOk],0);

      DbLkcFundoInvestResg.SetFocus;
   end;

   QryFundoDestino.Close;
   QryFundoDestino.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(dblTipoFundo.LookupValue);
   QryFundoDestino.ParamByName('IDFUNDOINVORIGEM').AsInteger  := StrToInt(DbLkcFundoInvestResg.LookupValue);
   QryFundoDestino.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryFundoDestino.Open;
end;

procedure TFrmCadIncorporacaoFundo.BtOkDetClick(Sender: TObject);
begin

   If (Trim(dblTipoFundo.Text)         = '') Or (dbDDataOperacao.Date        = 0) Or
      (Trim(DbLkcFundoInvestResg.Text) = '') Or (DbDtDataCotizacaoResg.Date  = 0) Or
      (dbrValorLiquido.Value           = 0 ) Or
      (Trim(DbLkcFundoInvestApl.Text)  = '') Or (DbDtDataCotizacaoAplic.Date = 0) Or
      (dbrValorAplic.Value             = 0 ) Then
   begin
      MsgDlg('Existe campos não preenchidos!','Mensagem do Sistema', MtInformation ,[MbOk],0);
      Exit;
   end;

   //AL_4
   //AL_15
   if not CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Exit;
   end;

   //AL_13
   if VerEmAbertura(Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   if VerEmAbertura(QryDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
      Exit;

   //AL_18
   // Verifica se existem Transferência entre planos posterior a data a ser transferida
   If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                              QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                              iPlanPrevCtbPatro,
                                              dbDDataOperacao.DateTime) then
    Begin
        MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação.'+'.'#13+
               'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
        BtCancDetClick(sender);
        Exit;
    End; // Fim AL_18

   If VerificaResgFundo(StrToInt(DbLkcFundoInvestResg.LookupValue),
                        QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger) Then
      Exit;

   pgcResgate.ActivePage   := tbsDadosResg;
   pgcAplicacao.ActivePage := tbsDadosApl;

   sbtnAltDet.Enabled      := True;
   sbtnExcluiDet.Enabled   := True;

   If Qry.State = DsInsert Then
      Qry.FieldByName('IDPEDIDOFUNDO').AsInteger  := LeUltRegistro(Nil,'PEDIDOFUNDO');

   Qry.FieldByName('DATAPEDIDO').AsDateTime       := dbDDataOperacao.Date;

   Qry.FieldByName('IDTIPOINVEST').AsInteger      :=
              QryFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger;

   Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger :=
              QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   Qry.FieldByName('IDTIPOOPERACAO').AsInteger    :=
              QryTpoOperOrig.FieldByName('IDTIPOOPERACAO').AsInteger;

   Qry.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

   Qry.FieldByName('DATALIQUIDACAO').AsDateTime   := dbDDataOperacao.Date;

   Qry.FieldByName('DESCFUNDOINVEST').AsString    := DbLkcFundoInvestResg.Text;

   Qry.Post;
   Qry.ApplyUpdates;
   Qry.CommitUpdates;

   If QryOperacaoFundo.State = DsInsert Then
      QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger   := LeUltRegistro(Nil,'OPERACAOFUNDO');

   If QryOperacaoFundo.State <> DsBrowse Then
   begin
      QryOperacaoFundo.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                       QryFundoDestino.FieldByName('IDCARTEIRAINVEST').AsInteger;

      QryOperacaoFundo.FieldByName('IDTIPOINVEST').AsInteger      :=
                       QryFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;

      QryOperacaoFundo.FieldByName('IDTIPOOPERACAO').AsInteger    :=
                       QryTpoOperDest.FieldByName('IDTIPOOPERACAO').AsInteger;

      QryOperacaoFundo.FieldByName('IDFUNDOINVEST').AsInteger     :=
                       QryFundoDestino.FieldByName('IDFUNDOINVEST').AsInteger;

      QryOperacaoFundo.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

      QryOperacaoFundo.FieldByName('DATAOPERACAO').AsDateTime     := dbDDataOperacao.Date;

      QryOperacaoFundo.FieldByName('DATACOTIZACAO').AsDateTime    := DbDtDataCotizacaoAplic.Date;

      QryOperacaoFundo.FieldByName('DATALIQUIDACAO').AsDateTime   := dbDDataOperacao.Date;

      QryOperacaoFundo.FieldByName('VLRCOTA').AsFloat             :=
                       QryDestino.FieldByName('VLRCOTA').AsFloat;

      QryOperacaoFundo.Post;
      QryOperacaoFundo.ApplyUpdates;
      QryOperacaoFundo.CommitUpdates;
   end;

   If QryDestino.State = DsInsert Then
      QryDestino.FieldByName('IDINCORPORACAOFUNDO').AsInteger   := LeUltRegistro(Nil,'INCORPORACAOFUNDO');

   QryDestino.FieldByName('IDPEDIDOFUNDO').AsInteger     :=
                     Qry.FieldByName('IDPEDIDOFUNDO').AsInteger;

   QryDestino.FieldByName('IDOPERACAOFUNDO').AsInteger   :=
                     QryOperacaoFundo.FieldByName('IDOPERACAOFUNDO').AsInteger;

   QryDestino.FieldByName('IDTIPOINVEST').AsInteger      :=
                     QryFundoDestino.FieldByName('IDTIPOINVEST').AsInteger;

   QryDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger :=
                     QryFundoDestino.FieldByName('IDTIPOFUNDOINVEST').AsInteger;

   QryDestino.FieldByName('IDTIPOOPERACAO').AsInteger    :=
                     QryTpoOperDest.FieldByName('IDTIPOOPERACAO').AsInteger;

   QryDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

   QryDestino.FieldByName('DATAPEDIDO').AsDateTime       := dbDDataOperacao.Date;

   QryDestino.FieldByName('DATALIQUIDACAO').AsDateTime   := dbDDataOperacao.Date;

   QryDestino.FieldByName('DESCFUNDOINVEST').AsString    := DbLkcFundoInvestApl.Text;

   QryDestino.Post;
   QryDestino.ApplyUpdates;
   QryDestino.CommitUpdates;

   Qry.First;
   fTotalAplicado    := 0;   
   While Not Qry.Eof Do
   begin
      fTotalAplicado := fTotalAplicado + Qry.FieldByName('VLRPEDIDO').AsFloat;
      Qry.Next;
   end;
   Qry.First;

   fclTotalApl.Caption := FloatToStrF(fTotalAplicado,ffCurrency,18,2);

   sbtnInsDet.Down     := False;
   sbtnAltDet.Down     := False;

   DbLkcFundoInvestApl.Enabled    := False;
   DbDtDataCotizacaoAplic.Enabled := False;

   DbgResgate.BringToFront;
   DbgAplicacao.BringToFront;

   BtOkDet.Enabled    := False;
   BtCancDet.Enabled  := False;
   BtVoltaDet.Enabled := False;

end;

procedure TFrmCadIncorporacaoFundo.BtCancDetClick(Sender: TObject);
begin

  inherited;

  If Qry.RecordCount = 0 Then
  begin
     sbtnAltDet.Enabled          := False;
     sbtnExcluiDet.Enabled       := False;
     DbLkcFundoInvestApl.Enabled := True;
     DbLkcFundoInvestApl.Clear;
     dbrCota.Clear;
  end;

  Qry.Cancel;
  Qry.ApplyUpdates;
  QryDestino.Cancel;
  QryDestino.ApplyUpdates;

  DbLkcFundoInvestResg.Clear;
  DbDtDataCotizacaoResg.Clear;
  dbrCotaResg.Clear;
  dbrValorLiquido.Clear;
  dbrSaldoFinancResg.Clear;
  dbrQtdFinancResg.Clear;

  DbDtDataCotizacaoAplic.Clear;
  dbrValorAplic.Clear;
  dbrQtdOper.Clear;
  dbrSaldoFinancApl.Clear;
  dbrQtdFinancApl.Clear;

  DbgResgate.BringToFront;
  DbgAplicacao.BringToFront;

  BtOkDet.Enabled    := False;
  BtCancDet.Enabled  := False;
  BtVoltaDet.Enabled := False;

end;

procedure TFrmCadIncorporacaoFundo.sbtnInsDetClick(Sender: TObject);
Var
   iIdFundoDestino   : Integer;
   sDescFundoDestino : String;
   fValorCotaApl     : Double;
begin
   iIdFundoDestino   := QryDestino.FieldByName('IDFUNDOINVEST').AsInteger;
   sDescFundoDestino := QryFundoDestino.FieldByName('DESCFUNDOINVEST').AsString;
   fValorCotaApl     := QryDestino.FieldByName('VLRCOTA').AsFloat;

  inherited;

   PnlData.Enabled  := True;

   If Not (Qry.State = DsInsert) Then 
   begin
      Qry.Append;
      QryDestino.Append;
      //Al_12
      Qry.FieldByName('DATAPEDIDO').AsDateTime          := dbDDataOperacao.Date;

      Qry.FieldByName('IDTIPOFUNDOINVEST').AsInteger    := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
      dblTipoFundo.LookupValue                          := QryTipoFundo.FieldByName('IDTIPOFUNDOINVEST').AsString;
      dblTipoFundo.Text                                 := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;

      QryDestino.FieldByName('IDFUNDOINVEST').AsInteger := iIdFundoDestino;
      DbLkcFundoInvestApl.LookupValue                   := IntToStr(iIdFundoDestino);
      DbLkcFundoInvestApl.Text                          := sDescFundoDestino;

      QryDestino.FieldByName('VLRCOTA').AsFloat         := fValorCotaApl;

   end;

   If Qry.RecordCount = 0 Then
   begin
      DbLkcFundoInvestApl.Enabled    := True;
      DbDtDataCotizacaoAplic.Enabled := True;
      DbDtDataCotizacaoAplic.Clear;
      DbLkcFundoInvestApl.Clear;
   end;

   PnlData.Enabled  := False;

   dbrValorAplic.Clear;

   PnlFdoResg.BringToFront;
   PnlFdoApl.BringToFront;

   BtOkDet.Enabled    := True;
   BtCancDet.Enabled  := True;
   BtVoltaDet.Enabled := True;

   DbLkcFundoInvestResg.Enabled := True;   
end;

//Paulo Nobre - 13/01/2009 - N. Sol 106085 -  N. Kintana 475364
function TFrmCadIncorporacaoFundo.VerIncorporacaoFundo(ipPlanPrevCtbPatro, iFundoInvestResg : Integer;
                                                       dDataOper : TDateTime) : Boolean;
begin
   Result := False;

   QryBuscaIncorporacaoFundo.Close;
   //Paulo Nobre - 13/01/2009 - N. Sol 106085 -  N. Kintana 475364
   QryBuscaIncorporacaoFundo.ParamByName('IDPLANPREVCTBPATR').AsInteger := ipPlanPrevCtbPatro;
   QryBuscaIncorporacaoFundo.ParamByName('IDFUNDOINVEST').AsInteger := iFundoInvestResg;
   QryBuscaIncorporacaoFundo.ParamByName('DATAPEDIDO').AsDateTime   := dDataOper;
   QryBuscaIncorporacaoFundo.Open;

   If Not QryBuscaIncorporacaoFundo.IsEmpty Then
   begin
      MsgDlg('Já existe Incorporação para esse Fundo!',
             'Mensagem do Sistema', MtInformation ,[MbOk],0);
      Result := True;
   End;

end;

function TFrmCadIncorporacaoFundo.VerificaResgFundo(iFundoInvestResg,
                                                    iOperacaoFundo : Integer) : Boolean;
begin
   Result := False;

   QryBuscaPedidos.Close;
   QryBuscaPedidos.ParamByName('IDFUNDOINVEST').AsInteger   := iFundoInvestResg;
   QryBuscaPedidos.ParamByName('IDOPERACAOFUNDO').AsInteger := iOperacaoFundo;
   QryBuscaPedidos.Open;

   If (Not QryBuscaPedidos.IsEmpty) And (Qry.State = DsInsert) Then
   begin
      MsgDlg('Já existe Resgate para esse Fundo! Esse Resgate será Cancelado.',
             'Mensagem do Sistema', MtInformation ,[MbOk],0);
      Qry.Cancel;
      Qry.ApplyUpdates;

      QryDestino.Cancel;
      QryDestino.ApplyUpdates;

      BtCancDet.Click;
      BtVoltaDet.Click;

      Result := True;
   End;

end;

procedure TFrmCadIncorporacaoFundo.sbtnExcluiDetClick(Sender: TObject);
begin
  //AL_4
  //AL_15
  if CtrlInvContab.TestaPeriodo(dbDDataOperacao.Text, iTipoInvestUsu) then
  begin
     inherited;

     QryDestino.Locate('IDPEDIDOFUNDO',Qry.FieldByName('IDPEDIDOFUNDO').AsInteger,[]);

     fTotalAplicado      := fTotalAplicado - QryDestino.FieldByName('VLRPEDIDO').AsFloat;
     fclTotalApl.Caption := FloatToStrF(fTotalAplicado,ffCurrency,18,2);

     QryDestino.Delete;
     QryDestino.ApplyUpdates;

     Qry.Delete;
     Qry.ApplyUpdates;

     If QryDestino.IsEmpty Then
     begin
        QryOperacaoFundo.Delete;
        QryOperacaoFundo.ApplyUpdates;
        bbtnCancelarClick(Sender);
        sbtnInserirClick(Sender);
     end;
  end
  else
     MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
  // AL_4 - Fim
end;

procedure TFrmCadIncorporacaoFundo.sbtnAltDetClick(Sender: TObject);
var fSaldoVlr  : Currency;
    fSaldoQtd, fVlrCota : Double;
begin

   fVlrCota   := 0;
   fSaldoVlr  := 0;
   fSaldoQtd  := 0;

   BuscaSaldoFundo(dbDDataOperacao.Date,
                   StrToInt(DbLkcFundoInvestResg.LookupValue),
                   fSaldoVlr, fSaldoQtd, fVlrCota);

   dbrSaldoFinancResg.Value := fSaldoVlr;
   dbrQtdFinancResg.Value   := fSaldoQtd;

  inherited;

   QryDestino.Locate('IDPEDIDOFUNDO',Qry.FieldByName('IDPEDIDOFUNDO').AsInteger,[]);

   Qry.Edit;
   QryDestino.Edit;
   QryOperacaoFundo.Edit;   

   PnlFdoResg.BringToFront;
   PnlFdoApl.BringToFront;

   PnlData.Enabled    := False;

   BtOkDet.Enabled    := True;
   BtCancDet.Enabled  := True;
   BtVoltaDet.Enabled := True;

   DbLkcFundoInvestResg.Enabled := False;

end;

procedure TFrmCadIncorporacaoFundo.PnlFdoResgDblClick(Sender: TObject);
begin
  inherited;
   sbtnAltDetClick(Sender);
end;

end.
