//******************************************************************************
// Data      : 01/02/2007
// Código    : AL_7
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento da rotina de "AlimentaFundo". Criado um
//             novo parametro para retorno da mensagem de erro
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_6
// Pendencia : 20453
// SOL       : 33866
// Desc      : Acerto na Trava Contábil que não estava passando o paramentro
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 05/07/2006
// Código    : AL_4
// Pendencia :
// SOL       :
// Motivo    : Implementação do teste de período contabil em 3 camadas e
//             da verificação de processo de atualização em andamento
//******************************************************************************
// Data      : 05/04/2006
// Código    : AL_3
// Pendencia :
// SOL       :
// Motivo    : Atualização de rotinas e implementação do reprocessamento
//******************************************************************************
// Data     : 15/06/2005
// Código   : Al_2
// Motivo   : Implementado o parametro IDPEDIDOFUNDO na query "qryConfirmação"
//******************************************************************************
// Data     : 12/01/2005
// Linha(s) : QryResg, QryDetalheResg, QryDetalhe, QryDetalheAplTotal, QryDetalheResgTotal, QryComposicaoFundo
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais recente
//            registro
//******************************************************************************
// Data     : 20/09/2004
// Código   : Alt_1
// Motivo   : Inclusão da nova concepção para apuração de CPMF sobre as operações de
//            resgate
//******************************************************************************

unit FCadEspLancamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, wwdblook, uCtrlInvContab;

type

//******************************************************************************
  TDadosCotas = Record
                 DataCota:TDate;
                 VlrCota :Double
               End;

//******************************************************************************

  TfrmEspLancamento = class(TfrmCadastroCS)
    PnlData: TPanel;
    dbDtaOperacao: TCMDateTimePicker;
    Label1: TLabel;
    PnlEspecificar: TPanel;
    PnlEspecificado: TPanel;
    dbgEspecificar: TwwDBGrid;
    dbgEspecificada: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    QryDetalhe: TwwQuery;
    DsDetalhe: TwwDataSource;
    Toolbar972: TToolbar97;
    UpdDetalhe: TUpdateSQL;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    QryAux: TwwQuery;
    QryComposicaoFundo: TwwQuery;
    Label2: TLabel;
    qryDESCFUNDOINVEST: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryVLROPERACAO: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    QryTipoFundo: TwwQuery;
    DblTipoFundo: TwwDBLookupCombo;
    DblCarteiraDetalhe: TwwDBLookupCombo;
    QryDetalheIDOPERACAOFUNDO: TFloatField;
    QryDetalheIDCARTEIRAINVEST: TFloatField;
    QryDetalheIDPEDIDOFUNDO: TFloatField;
    QryDetalheIDTIPOINVEST: TFloatField;
    QryDetalheIDTIPOOPERACAO: TFloatField;
    QryDetalheIDFUNDOINVEST: TFloatField;
    QryDetalheDATAOPERACAO: TDateTimeField;
    QryDetalheDATALIQUIDACAO: TDateTimeField;
    QryDetalheQTDOPERACAO: TFloatField;
    QryDetalheVLROPERACAO: TFloatField;
    QryDetalheVLRCOTA: TFloatField;
    QryDetalheVLRIR: TFloatField;
    QryDetalheVLRIOF: TFloatField;
    QryDetalheVLRRENDIMENTO: TFloatField;
    QryDetalheSTACONFIRMA: TStringField;
    QryDetalheIDOPERACAOORIGEM: TFloatField;
    QryDetalheIDPLANPREVCTBPATR: TFloatField;
    QryDetalheDATACOTIZACAO: TDateTimeField;
    QryDetalheVLRDESCONTO: TFloatField;
    QryDetalheIDCOMPOSICAOFUNDO: TFloatField;
    QryDetalheIDFUNDOINVEST_1: TFloatField;
    QryDetalheDESCFUNDOINVEST: TStringField;
    QryDetalheIDGESTORCARTEIRA: TFloatField;
    QryDetalheTRGDTINCLUSAO: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO: TStringField;
    QryDetalheMOECODIGO: TFloatField;
    QryDetalheIDCARTEIRAINVEST_1: TFloatField;
    QryDetalheIDTIPOFUNDOINVEST: TFloatField;
    QryDetalheCNPJFUNDO: TStringField;
    QryDetalheSTAEXCLUSIVO: TStringField;
    QryDetalhePZOCARENCIA: TFloatField;
    QryDetalhePZOANIVERSARIO: TFloatField;
    QryDetalhePZOLIQAPLIC: TFloatField;
    QryDetalhePZOLIQRESG: TFloatField;
    QryDetalheQTDDECQTD: TFloatField;
    QryDetalheQTDDECVALOR: TFloatField;
    QryDetalheSTAFUNDO: TStringField;
    QryDetalhePZOAMORTIZACAO: TFloatField;
    QryDetalhePERCTXPERFORM: TFloatField;
    QryDetalhePERCTXADM: TFloatField;
    QryDetalheCODFUNCETIP: TStringField;
    QryDetalheSTAPROVISIONAIR: TStringField;
    QryDetalheSTAPROVISIONAIOF: TStringField;
    QryDetalheCONTRCETIP: TStringField;
    QryDetalheIDCATEGORIAFUNDO: TFloatField;
    QryDetalheDATAINICIOFUNDO: TDateTimeField;
    QryDetalhePZOCOTAPLIC: TFloatField;
    QryDetalhePZOCOTRESG: TFloatField;
    QryDetalheDATACOTIZACAO_1: TDateTimeField;
    QryDetalheIDTIPOINVEST_1: TFloatField;
    QryDetalheIDTIPOOPERACAO_1: TFloatField;
    QryDetalheIDMERCADO: TFloatField;
    QryDetalheCODTIPDOC: TFloatField;
    QryDetalheDESCTIPOOPERACAO: TStringField;
    QryDetalheNATUREZAOPERACAO: TStringField;
    QryDetalheTIPOCUSTODIA: TStringField;
    QryDetalheVENCIMENTO: TFloatField;
    QryDetalheFLGGERACONTAB: TFloatField;
    QryDetalheFLGGERACAPCAR: TFloatField;
    QryDetalheRECPAG: TStringField;
    QryDetalheTIPCREDOR: TStringField;
    QryDetalheFLGGERACAF: TFloatField;
    QryDetalheFLGTRANSF: TStringField;
    QryDetalheFLGCORRET: TStringField;
    QryDetalheTRGDTINCLUSAO_1: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO_1: TStringField;
    QryDetalheFLGORDMOVINV: TStringField;
    QryDetalheIDMOTIVOBLOQUEIO: TFloatField;
    QryDetalheFLGOPDIREITO: TStringField;
    QryDetalheFLGAGE: TStringField;
    QryDetalheFLGDATAEX: TStringField;
    QryDetalheFLGDATACOM: TStringField;
    QryDetalheFLGINVORIGEM: TStringField;
    QryDetalheFLGPERC: TStringField;
    QryDetalheFLGPARIDADE: TStringField;
    QryDetalheFLGPRZBOLSA: TStringField;
    QryDetalheFLGPRZEMP: TStringField;
    QryDetalheFLGATADEC: TStringField;
    QryDetalheFLGFORMAPAGREC: TStringField;
    QryDetalheFLGDIVACAO: TStringField;
    QryDetalheFLGINIPAG: TStringField;
    QryDetalheFLGJUROS: TStringField;
    QryDetalheMOTBLOQCARTORIG: TFloatField;
    QryDetalheMOTBLOQCARTDEST: TFloatField;
    QryDetalheTIPSALDOCARTORIG: TStringField;
    QryDetalheTIPSALDOCARTDEST: TStringField;
    QryDetalheFLGTRATAIR: TStringField;
    QryDetalheSIGLATIPOOPER: TStringField;
    QryDetalheFLGISENTOIR: TStringField;
    QryDetalheFLGGRAVAIRLITIGIO: TStringField;
    QryDetalheFLGOPGERENC: TStringField;
    Label3: TLabel;
    DblTipoOperacao: TwwDBLookupCombo;
    QryTipoOperacao: TwwQuery;
    qryDATAOPERACAO: TDateTimeField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryVALOR: TFloatField;
    QryVerFundoApl: TwwQuery;
    dbgEspecificarResg: TwwDBGrid;
    QryResg: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DsResg: TwwDataSource;
    UpdResg: TUpdateSQL;
    QryDetalheResg: TwwQuery;
    DsDetalheResg: TwwDataSource;
    UpdDetalheResg: TUpdateSQL;
    dbgEspecificadaResg: TwwDBGrid;
    QryResgSTAESPECIFICADO: TStringField;
    qrySTAESPECIFICADO: TStringField;
    qryIDOPERACAOFUNDO: TFloatField;
    QryDetalheAplTotal: TwwQuery;
    QryDetalheResgTotal: TwwQuery;
    QryVerFundoResg: TwwQuery;
    QryResgIDPEDIDOFUNDO: TFloatField;
    QryDetalheResgDESCFUNDOINVEST: TStringField;
    QryDetalheResgDESCTIPOOPERACAO: TStringField;
    QryDetalheResgIDPEDIDOFUNDO: TFloatField;
    QryDetalheResgIDTIPOINVEST: TFloatField;
    QryDetalheResgIDTIPOOPERACAO: TFloatField;
    QryDetalheResgIDFUNDOINVEST: TFloatField;
    QryDetalheResgDATAPEDIDO: TDateTimeField;
    QryDetalheResgDATALIQUIDACAO: TDateTimeField;
    QryDetalheResgIDPLANPREVCTBPATR: TFloatField;
    QryDetalheResgDATACOTIZACAO: TDateTimeField;
    QryDetalheResgCODDOCUMENTO: TFloatField;
    QryDetalheResgNUMLANCTO: TFloatField;
    QryDetalheResgPLNCODIGO: TFloatField;
    QryDetalheResgPLANO: TFloatField;
    QryDetalheResgIDCOMPOSICAOFUNDO: TFloatField;
    QryDetalheResgSTAESPECIFICADO: TStringField;
    QryDetalheResgVLROPERACAO: TFloatField;
    //AL_3
    QryDetalheResgFLGCONTAINVEST: TFloatField;
    QryDetalheResgIDTIPOFUNDOINVEST: TFloatField;
    QryDetalheResgDTAINIPROC: TDateTimeField;
    QryDetalheResgDATAULTFECH: TDateTimeField;
    QryResgIDTIPOFUNDOINVEST: TFloatField;
    QryResgDTAINIPROC: TDateTimeField;
    QryResgFLGCONTAINVEST: TFloatField;
    QryDetalheSTAESPECIFICADO: TStringField;
    QryDetalheVLRCOLOCACAO: TFloatField;
    QryDetalheVLRTAXAS: TFloatField;
    QryDetalheVLRCORRETAGEM: TFloatField;
    QryDetalheOBSERVACAO: TMemoField;
    QryDetalhePLANO: TFloatField;
    QryDetalhePLNCODIGO: TFloatField;
    QryDetalheCODDOCUMENTO: TFloatField;
    QryDetalheIDOPERACAODIREITO: TFloatField;
    QryDetalheQTDUSUFRUTO: TFloatField;
    QryDetalheIDTIPOCOTA: TFloatField;
    QryDetalheIDCOTAINTEGRALIZA: TFloatField;
    QryDetalheMOECORCOTA: TFloatField;
    QryDetalheIDREGRA: TFloatField;
    QryDetalheVLRCOTAINICIAL: TFloatField;
    QryDetalheSTAVERCOTA: TStringField;
    QryDetalheDATAINIAPLIC: TDateTimeField;
    QryDetalheDTAVIGENCIA: TDateTimeField;
    QryDetalheIDCARTEIRASPC: TFloatField;
    QryDetalheDTAINIPROC: TDateTimeField;
    QryDetalheQTDTOTINTEGRALIZA: TFloatField;
    QryDetalheIDCLASSIFANBID: TFloatField;
    QryDetalheIDADMFDOINVEST: TFloatField;
    QryDetalheIDCOMPOSICAOFUNDO_1: TFloatField;
    QryDetalheIDFUNDOINVEST_2: TFloatField;
    QryDetalheIDFUNDOINVESTCOMP: TFloatField;
    QryDetalheTRGDTINCLUSAO_2: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO_2: TStringField;
    QryDetalheTRGDTINCLUSAO_3: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO_3: TStringField;
    QryDetalheTIPOMOVTO: TStringField;
    QryDetalheSTAATIVO: TStringField;
    QryDetalheFLGRENTABILIDADE: TStringField;
    QryDetalheFLGCONTAINVEST: TFloatField;
    QryDetalheFLGMOVCOTA: TStringField;
    QryDetalheFLGCOTARECDES: TStringField;
    QryDetalheFLGDATAVENCIMENTO: TStringField;
    QryDetalheFLGOBRIGAOBS: TStringField;
    QryDetalheIDTIPOFUNDOINVEST_1: TFloatField;
    QryDetalheIDTIPOINVEST_2: TFloatField;
    QryDetalheDESCTIPOFUNDOINV: TStringField;
    QryDetalheDATAULTFECH: TDateTimeField;
    QryDetalheTRGDTINCLUSAO_4: TDateTimeField;
    QryDetalheTRGUSERINCLUSAO_4: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure QryDetalheBeforePost(DataSet: TDataSet);
    procedure dbgEspecificadaEnter(Sender: TObject);
    procedure dbgEspecificadaExit(Sender: TObject);
    procedure dbgEspecificadaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEspecificadaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbDtaOperacaoExit(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure QryDetalheResgBeforePost(DataSet: TDataSet);
    procedure DsResgDataChange(Sender: TObject; Field: TField);
    procedure dbgEspecificadaResgEnter(Sender: TObject);
    procedure dbgEspecificadaResgExit(Sender: TObject);
    procedure dbgEspecificadaResgKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEspecificadaResgKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgEspecificadaResgRowChanged(Sender: TObject);
    procedure dbgEspecificadaRowChanged(Sender: TObject);
    //AL_3
    procedure DblTipoFundoExit(Sender: TObject);
    procedure DblTipoOperacaoExit(Sender: TObject);
    procedure DblTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

     function VerificaFundoApl  : Boolean;
     function VerificaFundoResg : Boolean;
     function Aplicacao         : Boolean;
     function Resgate           : Boolean;
     function ConfirmacaoApl    : Boolean;
     function ConfirmacaoResg   : Boolean;

     procedure AbreQueryAplicacao;
     procedure AbreQueryResgate;
     procedure HabilitaBotoes(QryPar, QryDetalhePar : TQuery);

  public
    {Public declarations }

     procedure AbreTodasQry;

  end;

var
  frmEspLancamento : TfrmEspLancamento;
  //AL_3
  bModif, bTrocaLine       : Boolean;
  sTipoOperacao    : String;   //A -> Aplicação    -     R -> Resgate

implementation

uses UBibliotecaInvest, UOperComum, DBaseDados, UMensErro, UDataBase, uSistema,
  UFundoComum, dFundoComum, FPrincipal;

{$R *.DFM}

procedure TfrmEspLancamento.FormActivate(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  dbDtaOperacao.SetFocus;
end;

procedure TfrmEspLancamento.HabilitaBotoes(QryPar, QryDetalhePar : TQuery);
Var
   fValorDet : Currency;
begin
   //AL_3
   If ( (not QryPar.IsEmpty) and (QryPar.FieldByName('VLROPERACAO').AsCurrency <> 0) )Then
   Begin
      If QryPar.FieldByName('STAESPECIFICADO').AsString <> 'S' Then
         BtIncDet.Enabled  := True
      Else
         BtIncDet.Enabled  := False;

      fValorDet := 0;
      QryDetalhePar.DisableControls;
      QryDetalhePar.First;
      While Not QryDetalhePar.Eof Do
      Begin
         fValorDet := fValorDet + QryDetalhePar.FieldByName('VLROPERACAO').AsCurrency;
         QryDetalhePar.Next;
      End;
      QryDetalhePar.First;
      QryDetalhePar.EnableControls;

      if (QryPar.FieldByName('VLROPERACAO').AsCurrency - fValorDet) > 0 Then
         BtIncDet.Enabled   := True
      else if (QryPar.FieldByName('VLROPERACAO').AsCurrency - fValorDet) = 0 Then
         BtAltDet.Enabled   := False
      else if (QryPar.FieldByName('VLROPERACAO').AsCurrency - fValorDet) < 0 Then
         BtAltDet.Enabled   := True;

      BtDelDet.Enabled      := True;

      If ( (not QryDetalhePar.IsEmpty) and
          ((QryPar.FieldByName('VLROPERACAO').AsCurrency - fValorDet) <> 0) )Then
      begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      end
      else
      begin
         bbtnConfirmar.Enabled := False;
         bbtnCancelar.Enabled  := False;
      end;
   end
   else
   begin
      BtIncDet.Enabled      := False;
      BtAltDet.Enabled      := False;
      BtDelDet.Enabled      := False;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
   end;

end;

procedure TfrmEspLancamento.BtIncDetClick(Sender: TObject);
begin
   If sTipoOperacao = 'A' Then
   Begin
      QryDetalheAplTotal.Close;
      QryDetalheAplTotal.ParamByName('DATAOPERACAO').AsString       := dbDtaOperacao.Text;
      QryDetalheAplTotal.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                   Qry.FieldByName('IDFUNDOINVEST').AsInteger;
      QryDetalheAplTotal.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                      QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger;
      QryDetalheAplTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDetalheAplTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryDetalheAplTotal.Open;
      If QryDetalheAplTotal.FieldByName('VLROPERACAOTOTAL').AsCurrency =
         Qry.FieldByName('VLROPERACAO').AsCurrency Then
      Begin
         MsgDlg('Esse lançamento já está especificado.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Exit;
      End;
      QryComposicaoFundo.Close;
      QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger :=
                                  Qry.FieldByName('IDFUNDOINVEST').AsInteger;
      QryComposicaoFundo.ParamByName('DATAOPERACAO').AsString   := dbDtaOperacao.Text;
      QryComposicaoFundo.Open;
   End
   Else
   Begin
      QryDetalheResgTotal.Close;
      QryDetalheResgTotal.ParamByName('DATAOPERACAO').AsString       := dbDtaOperacao.Text;
      QryDetalheResgTotal.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                   QryResg.FieldByName('IDFUNDOINVEST').AsInteger;
      QryDetalheResgTotal.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                      QryDetalheResg.ParamByName('IDTIPOOPERACAO').AsInteger;
      QryDetalheResgTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDetalheResgTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryDetalheResgTotal.Open;
      If QryDetalheResgTotal.FieldByName('VLROPERACAOTOTAL').AsCurrency =
         QryResg.FieldByName('VLROPERACAO').AsCurrency Then
      Begin
         MsgDlg('Esse lançamento já está especificado.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         Exit;
      End;
      QryComposicaoFundo.Close;
      QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger :=
                                  QryResg.FieldByName('IDFUNDOINVEST').AsInteger;
      QryComposicaoFundo.ParamByName('DATAOPERACAO').AsString   := dbDtaOperacao.Text;
      QryComposicaoFundo.Open;
   End;

   bTrocaLine   := False;

  inherited;


   PnlData.Enabled        := False;
   PnlEspecificar.Enabled := False;

   //Habilita botões do Detalhe
   BtOkDet.Enabled        := True;
   BtCancDet.Enabled      := True;
   BtVoltaDet.Enabled     := True;

   BtIncDet.Enabled       := False;
   BtAltDet.Enabled       := False;
   BtDelDet.Enabled       := False;

   If sTipoOperacao = 'A' Then
   Begin
      Qry.Edit;
      QryDetalhe.Append;
      //Prepara Grid para Inserir Dados
      dbgEspecificada.SelectedIndex := 0;
      dbgEspecificada.Options       := dbgEspecificada.Options + [TwwDBgridOption(dgEditing)];
      dbgEspecificada.Font.Color    := clBlack;
      dbgEspecificada.SetFocus;

      //Trata Máscara
      QryDetalheVLROPERACAO.DisplayFormat := '';

      QryDetalhe.FieldByName('DESCTIPOOPERACAO').AsString   :=
                      Qry.FieldByName('DESCTIPOOPERACAO').AsString;
      QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger      :=
                      Qry.FieldByname('IDTIPOINVEST').AsInteger;
      QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger  :=
                      Qry.FieldByname('IDCARTEIRAINVEST').AsInteger;
      QryDetalhe.FieldByname('IDTIPOOPERACAO').AsInteger    :=
                      Qry.FieldByname('IDTIPOOPERACAO').AsInteger;
      QryDetalhe.FieldByname('VLROPERACAO').AsCurrency      :=
         Qry.FieldByName('VLROPERACAO').AsCurrency -
             QryDetalheAplTotal.FieldByName('VLROPERACAOTOTAL').AsCurrency;

      QryDetalhe.FieldByname('DATAOPERACAO').AsDateTime     := dbDtaOperacao.Date;
      QryDetalhe.FieldByname('DATALIQUIDACAO').AsDateTime   :=
                   OperComum.DataPrazo(dbDtaOperacao.Date,
                           QryComposicaoFundo.FieldByName('PZOLIQAPLIC').AsInteger);
      QryDetalhe.FieldByname('DATACOTIZACAO').AsDateTime    :=
                   OperComum.DataPrazo(dbDtaOperacao.Date,
                           QryComposicaoFundo.FieldByName('PZOCOTAPLIC').AsInteger);
      QryDetalhe.FieldByname('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   End
   Else
   Begin
      QryResg.Edit;
      QryDetalheResg.Append;
      //Prepara Grid para Inserção de Dados
      dbgEspecificadaResg.SelectedIndex := 0;
      dbgEspecificadaResg.Options       := dbgEspecificadaResg.Options + [TwwDBgridOption(dgEditing)];
      dbgEspecificadaResg.Font.Color    := clBlack;
      dbgEspecificadaResg.SetFocus;

      //Trata Máscara
      QryDetalheResgVLROPERACAO.DisplayFormat := '';

      QryDetalheResg.FieldByName('DESCTIPOOPERACAO').AsString   :=
                      QryResg.FieldByName('DESCTIPOOPERACAO').AsString;
      QryDetalheResg.FieldByName('IDTIPOINVEST').AsInteger      :=
                      QryResg.FieldByname('IDTIPOINVEST').AsInteger;
      QryDetalheResg.FieldByname('IDTIPOOPERACAO').AsInteger    :=
                      QryResg.FieldByname('IDTIPOOPERACAO').AsInteger;
      QryDetalheResg.FieldByname('VLROPERACAO').AsCurrency      :=
         (QryResg.FieldByName('VLROPERACAO').AsCurrency -
             QryDetalheResgTotal.FieldByName('VLROPERACAOTOTAL').AsCurrency);
      QryDetalheResg.FieldByname('DATAPEDIDO').AsDateTime     := dbDtaOperacao.Date;
      QryDetalheResg.FieldByname('DATALIQUIDACAO').AsDateTime   :=
                   OperComum.DataPrazo(dbDtaOperacao.Date,
                           QryComposicaoFundo.FieldByName('PZOLIQAPLIC').AsInteger);
      QryDetalheResg.FieldByname('DATACOTIZACAO').AsDateTime    :=
                   OperComum.DataPrazo(dbDtaOperacao.Date,
                           QryComposicaoFundo.FieldByName('PZOCOTAPLIC').AsInteger);
      QryDetalheResg.FieldByname('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;

   End;
   //AL_3
end;

procedure TfrmEspLancamento.BtCancDetClick(Sender: TObject);
begin
  inherited;

   bTrocaLine := True;

   If sTipoOperacao = 'A' Then
   Begin
      Qry.Cancel;

      QryDetalhe.Cancel;

      //Trata Máscara
      QryDetalheVLROPERACAO.DisplayFormat := '###,###,###,###0.00';

      dbgEspecificada.Options := dbgEspecificada.Options - [TwwDBgridOption(dgEditing)];
      dbgEspecificada.Color   := clSilver;

      BtIncDet.Down           := False;
      BtAltDet.Down           := False;

      HabilitaBotoes(Qry,QryDetalhe);

      BtOkDet.Enabled        := False;
      BtCancDet.Enabled      := False;
      BtVoltaDet.Enabled     := False;

      If QryDetalhe.RecordCount = 0 Then
      Begin
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack ;

         AbreQueryAplicacao;

         PnlFundo.Enabled       := True;
         PnlData.Enabled        := True;
         PnlEspecificar.Enabled := True;
      End;
   End
   Else
   Begin
      QryResg.Cancel;

      QryDetalheResg.Cancel;

      //Trata Máscara
      QryDetalheResgVLROPERACAO.DisplayFormat := '###,###,###,###0.00';

      dbgEspecificadaResg.Options := dbgEspecificadaResg.Options - [TwwDBgridOption(dgEditing)];
      dbgEspecificadaResg.Color   := clSilver;

      BtIncDet.Down          := False;
      BtAltDet.Down          := False;

      HabilitaBotoes(QryResg,QryDetalheResg);

      BtOkDet.Enabled        := False;
      BtCancDet.Enabled      := False;
      BtVoltaDet.Enabled     := False;

      If QryDetalheResg.RecordCount = 0 Then
      Begin
         If dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.RollBack ;

         AbreQueryResgate;

         PnlFundo.Enabled       := True;
         PnlData.Enabled        := True;
         PnlEspecificar.Enabled := True;
      End;
   End;
end;

procedure TfrmEspLancamento.FormShow(Sender: TObject);
begin
  inherited;

  OperComum.LimpaParametros(Qry);
  Qry.Open;
  OperComum.LimpaParametros(QryResg);
  QryResg.Open;
  OperComum.LimpaParametros(QryDetalhe);
  QryDetalhe.Open;
  OperComum.LimpaParametros(QryDetalheResg);
  QryDetalheResg.Open;

  bTrocaLine  := True;

  QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger    := iTipoInvestUsu;
  QryTipoFundo.Open;

  QryTipoOperacao.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
  QryTipoOperacao.Open;

  MontaSelect.Filtro.Add('( TIPOFUNDOINVEST.IDTIPOINVEST = '''+IntToStr(iTipoInvestUsu)+''')');

end;

procedure TfrmEspLancamento.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  PnlFundo.Enabled := True;
  If MontaSelect.RetornouValor Then
  Begin
     bbtnCancelar.Enabled := True;

     dbDtaOperacao.Text   := MontaSelect.ValoresChave[0];

     DblTipoFundo.Clear;

     If QryTipoFundo.Locate('IDTIPOFUNDOINVEST',MontaSelect.ValoresChave[1], [loPartialKey]) Then
     Begin
        DblTipoFundo.Text        := QryTipoFundo.FieldByName('DESCTIPOFUNDOINV').AsString;
        DblTipoFundo.LookupValue := MontaSelect.ValoresChave[1];
     End;

     DblTipoOperacao.Clear;

     If QryTipoOperacao.Locate('IDTIPOOPERACAO',MontaSelect.ValoresChave[2], [loPartialKey]) Then
     Begin
        DblTipoOperacao.Text        := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;
        DblTipoOperacao.LookupValue := MontaSelect.ValoresChave[2];
     End;

     If pos('APLI', DblTipoOperacao.Text) > 0 Then
        sTipoOperacao := 'A'
     Else
        sTipoOperacao := 'R';

     If sTipoOperacao = 'A' Then
     Begin
        dbgEspecificar.Visible        := True;
        dbgEspecificada.Visible       := True;
        dbgEspecificarResg.Visible    := False;
        dbgEspecificadaResg.Visible   := False;
        DblCarteiraDetalhe.DataSource := DsDetalhe;
        AbreQueryAplicacao;
     End
     Else
     Begin
        dbgEspecificarResg.Visible    := True;
        dbgEspecificadaResg.Visible   := True;
        dbgEspecificar.Visible        := False;
        dbgEspecificada.Visible       := False;
        DblCarteiraDetalhe.DataSource := DsDetalheResg;
        AbreQueryResgate;
     End;
  End;
end;

procedure TfrmEspLancamento.BtOkDetClick(Sender: TObject);
begin
  inherited;

   bTrocaLine := True;

   BtIncDet.Down          := False;
   BtAltDet.Down          := False;

   If sTipoOperacao = 'A' Then
   Begin
      If Trim(QryDetalhe.FieldByName('DESCFUNDOINVEST').AsString) = '' Then
      Begin
         MsgDlg('Falta indicar o Fundo de Investimentos.',
                'Mensagem do Sistema ',mtInformation,[mbOK],0);
         Exit;
      End;

      If QryDetalhe.FieldByName('VLROPERACAO').AsCurrency >
         Qry.FieldByName('VLROPERACAO').AsCurrency   Then
      Begin
         MsgDlg('Valor da Especificado maior que o Valor à Especificar.',
                'Mensagem do Sistema ',mtInformation,[mbOK],0);
         Exit;
      End;

      If QryDetalhe.State In [DsInsert] Then
      Begin
         If Not VerificaFundoApl Then
         Begin
            MsgDlg('Já existe Lançamento Especificado para esse Fundo.',
                   'Mensagem do Sistema ',mtInformation,[mbOK],0);
            BtCancDetClick(Sender);
            Exit;
         End;
      End;

      QryDetalheVLROPERACAO.DisplayFormat   := '###,###,###,###0.00';

      If Not Aplicacao Then
      Begin
         BtCancDetClick(Sender);
         Exit;
      End;
   End
   Else
   Begin
      If Trim(QryDetalheResg.FieldByName('DESCFUNDOINVEST').AsString) = '' Then
      Begin
         MsgDlg('Falta indicar o Fundo de Investimentos.',
                'Mensagem do Sistema ',mtInformation,[mbOK],0);
         Exit;
      End;

      If QryDetalheResg.FieldByName('VLROPERACAO').AsCurrency >
         QryResg.FieldByName('VLROPERACAO').AsCurrency   Then
      Begin
         MsgDlg('Valor da Especificado maior que o Valor à Especificar.',
                'Mensagem do Sistema ',mtInformation,[mbOK],0);
         Exit;
      End;

      If QryDetalheResg.State In [DsInsert] Then
      Begin
         If Not VerificaFundoResg Then
         Begin
            MsgDlg('Já existe Lançamento Especificado para esse Fundo.',
                   'Mensagem do Sistema ',mtInformation,[mbOK],0);
            BtCancDetClick(Sender);
            Exit;
         End;
      End;

      QryDetalheResgVLROPERACAO.DisplayFormat := '###,###,###,###0.00';

      If Not Resgate Then
      Begin
         BtCancDetClick(Sender);
         Exit;
      End;
   End;

   BtOkDet.Enabled        := False;
   BtCancDet.Enabled      := False;
   BtVoltaDet.Enabled     := False;

end;

procedure TfrmEspLancamento.bbtnConfirmarClick(Sender: TObject);
begin
   //Al_4
   //AL_5
   //AL_6
   if not CtrlInvContab.TestaPeriodo(QryDetalhe.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
      BtDelDet.Down := False;
      Exit;
   End;

   if VerEmAbertura(QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
   begin
      BtDelDet.Down := False;
      Exit;
   end;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   If sTipoOperacao = 'A' Then
   Begin
      If Not ConfirmacaoApl Then
      Begin
         MsgDlg('Especificação do Lançamento será Cancelada!',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         bbtnCancelarClick(Sender);
         Exit;
      End;
   End
   Else
   Begin
      If Not ConfirmacaoResg Then
      Begin
         MsgDlg('Especificação do Lançamento será Cancelada!',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         bbtnCancelarClick(Sender);
         Exit;
      End;
   End;

   If dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Commit;

   bbtnCancelarClick(Sender);

   //AL_3
   If sTipoOperacao = 'A' Then
   begin
      QryDetalhe.DisableControls;
      QryDetalhe.First;
      While Not QryDetalhe.Eof Do
      Begin
         if StrToDate(dbDtaOperacao.Text) < QryDetalhe.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            If Not Reprocessamento(iTipoInvestUsu,
                                   QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanPrevCtbPatro,
                                   StrToDate(dbDtaOperacao.Text),
                                   QryDetalhe.FieldByName('DATAULTFECH').AsDateTime,
                                   QryDetalhe.FieldByName('DTAINIPROC').AsDateTime,
                                   True) Then
               MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                      'Mas o Reprocessamento foi cancelado!'+#13+
                      'Faça o Reprocessamento para esse Fundo e dia!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
         end;
         QryDetalhe.Next;
      end;
      QryDetalhe.First;
      QryDetalhe.EnableControls;
   end
   else
   begin
      QryDetalheResg.DisableControls;
      QryDetalheResg.First;
      While Not QryDetalheResg.Eof Do
      Begin
         if StrToDate(dbDtaOperacao.Text) < QryDetalheResg.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            //Alt_3
            If Not Reprocessamento(iTipoInvestUsu,
                                   QryDetalheResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryDetalheResg.FieldByName('IDFUNDOINVEST').AsInteger,
                                   iPlanPrevCtbPatro,
                                   StrToDate(dbDtaOperacao.Text),
                                   QryDetalheResg.FieldByName('DATAULTFECH').AsDateTime,
                                   QryDetalheResg.FieldByName('DTAINIPROC').AsDateTime,
                                   True) Then
               MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                      'Mas o Reprocessamento foi cancelado!'+#13+
                      'Faça o Reprocessamento para esse Fundo e dia!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0);
         end;
         QryDetalheResg.Next;
      end;
      QryDetalheResg.First;
      QryDetalheResg.EnableControls;
   end;

   MsgDlg('Operação Confirmada!',
          'Mensagem do Sistema ',mtWarning,[mbOK],0);

   PnlFundo.Enabled       := True;
   PnlData.Enabled        := True;
   PnlEspecificar.Enabled := True;
end;

procedure TfrmEspLancamento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
    //AL_3
    bTrocaLine := True;

    If sTipoOperacao = 'A' Then
    Begin
       Qry.Cancel;

       QryDetalhe.Cancel;

       QryDetalheVLROPERACAO.DisplayFormat := '###,###,###,###0.00';

       dbgEspecificada.Options := dbgEspecificada.Options - [TwwDBgridOption(dgEditing)];
       dbgEspecificada.Color   := clSilver;

       BtIncDet.Down           := False;
       BtAltDet.Down           := False;

       BtOkDet.Enabled         := False;
       BtCancDet.Enabled       := False;
       BtVoltaDet.Enabled      := False;

       If QryDetalhe.RecordCount = 0 Then
       Begin
          PnlFundo.Enabled       := True;
          PnlData.Enabled        := True;
          PnlEspecificar.Enabled := True;
       End;
    End
    Else
    Begin
       QryResg.Cancel;

       QryDetalheResg.Cancel;

       QryDetalheResgVLROPERACAO.DisplayFormat := '###,###,###,###0.00';

       dbgEspecificadaResg.Options := dbgEspecificadaResg.Options - [TwwDBgridOption(dgEditing)];
       dbgEspecificadaResg.Color   := clSilver;

       BtIncDet.Down          := False;
       BtAltDet.Down          := False;

       BtOkDet.Enabled        := False;
       BtCancDet.Enabled      := False;
       BtVoltaDet.Enabled     := False;

       If QryDetalheResg.RecordCount = 0 Then
       Begin
          PnlFundo.Enabled       := True;
          PnlData.Enabled        := True;
          PnlEspecificar.Enabled := True;
       End;
    End;

    if dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.RollBack ;

    if ( (Trim(dbDtaOperacao.text)   <> '')   and (Trim(DblTipoFundo.text) <> '') and
         (Trim(DblTipoOperacao.text) <> '') ) then
    begin
       if sTipoOperacao = 'A' then
          AbreQueryAplicacao
       else
          AbreQueryResgate;
    end;

    PnlFundo.Enabled       := True;
    PnlData.Enabled        := True;
    PnlEspecificar.Enabled := True;

end;

procedure TfrmEspLancamento.QryDetalheBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmEspLancamento.dbgEspecificadaEnter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmEspLancamento.dbgEspecificadaExit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;
end;

procedure TfrmEspLancamento.dbgEspecificadaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgEspecificada.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmEspLancamento.dbgEspecificadaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgEspecificada.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmEspLancamento.AbreQueryAplicacao;
Begin
   //AL_3
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;

   if Trim(dbDtaOperacao.Text) <> '' then
      qry.ParamByName('DATAOPERACAO').AsString    := dbDtaOperacao.Text;
   if Trim(DblTipoFundo.Text) <> '' then
      qry.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
   if Trim(DblTipoOperacao.Text) <> '' then
      qry.ParamByName('IDTIPOOPERACAO').AsInteger    := StrToInt(DblTipoOperacao.LookupValue);

   qry.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   qry.Open;

   OperComum.LimpaParametros(QryComposicaoFundo);
   QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                qry.FieldByName('IDFUNDOINVEST').AsInteger;
   if Trim(dbDtaOperacao.Text) <> '' then
      QryComposicaoFundo.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
   QryComposicaoFundo.Open;

   OperComum.LimpaParametros(QryDetalhe);
   if Trim(dbDtaOperacao.Text) <> '' then
       QryDetalhe.ParamByName('DATAOPERACAO').AsString   := dbDtaOperacao.Text;
   QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                  qry.FieldByName('IDFUNDOINVEST').AsInteger;
   //AL_3
   if Trim(DblTipoOperacao.LookupValue) <> '' then
      QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DblTipoOperacao.LookupValue);
   QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryDetalhe.Open;

   HabilitaBotoes(Qry,QryDetalhe);

End;

procedure TfrmEspLancamento.AbreQueryResgate;
//AL_3
var vlrtotdet : currency;
Begin
   QryResg.Close;
   //AL_3
   QryResg.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryResg.ParamByName('DATAOPERACAO').AsString       := dbDtaOperacao.Text;
   QryResg.ParamByName('IDTIPOOPERACAO').AsInteger    := StrToInt(DblTipoOperacao.LookupValue);
   QryResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryResg.ParamByName('IDTIPOFUNDOINVEST').AsInteger := StrToInt(DblTipoFundo.LookupValue);
   QryResg.Open;

   QryComposicaoFundo.Close;
   QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger :=
                                QryResg.FieldByName('IDFUNDOINVEST').AsInteger;
   QryComposicaoFundo.ParamByName('DATAOPERACAO').AsString   := dbDtaOperacao.Text;
   QryComposicaoFundo.Open;

   QryDetalheResg.Close;
   QryDetalheResg.ParamByName('DATAOPERACAO').AsString       := dbDtaOperacao.Text;
   QryDetalheResg.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                  QryResg.FieldByName('IDFUNDOINVEST').AsInteger;
   //AL_3
   QryDetalheResg.ParamByName('IDTIPOOPERACAO').AsInteger    := StrToInt(DblTipoOperacao.LookupValue);
   QryDetalheResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryDetalheResg.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   QryDetalheResg.Open;

   //AL_3
   QryDetalheResg.DisableControls;
   while not QryDetalheResg.eof do
   begin
      vlrtotdet := vlrtotdet + QryDetalheResg.FieldByname('VLROPERACAO').AsCurrency;
      QryDetalheResg.Next;
   end;
   QryDetalheResg.First;
   QryDetalheResg.EnableControls;

   QryResg.edit;
   QryResg.FieldByName('VALOR').AsCurrency := QryResg.FieldByName('VALOR').AsCurrency-vlrtotdet;
   QryResg.post;

   HabilitaBotoes(QryResg,QryDetalheResg);

   If QryResg.FieldByName('STAESPECIFICADO').AsString = 'S' Then
      BtAltDet.Enabled := False;

End;

procedure TfrmEspLancamento.bbtnSairClick(Sender: TObject);
begin
  If dtmBaseDados.dbBaseDados.InTransaction Then
  Begin
     If MsgDlg('Deseja sair sem confirmar a Especificação?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes Then
     Begin
        //AL_3
        dbDtaOperacao.text   := '';
        DblTipoFundo.text    := '';
        DblTipoOperacao.text := '';
        inherited;
        If dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.RollBack ;
     End;
  End
  Else
  Begin
     //AL_3
     dbDtaOperacao.text   := '';
     DblTipoFundo.text    := '';
     DblTipoOperacao.text := '';
     inherited;
     If dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.RollBack ;
  End;
end;

procedure TfrmEspLancamento.BtDelDetClick(Sender: TObject);
//AL_3
var iTpFdoInves, iFdoInvest  : Integer;
    dDataUltFec, dDataIniPro : TDateTime;
begin
  //Al_4
  //AL_5
  //AL_6
  if not CtrlInvContab.TestaPeriodo(QryDetalhe.FieldByName('DATAOPERACAO').AsString, iTipoInvestUsu) then
  begin
    MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema', mtWarning,[mbOk],0);
    BtDelDet.Down := False;
    Exit;
  End;

  if VerEmAbertura(QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
  begin
    BtDelDet.Down := False;
    Exit;
  end;

  If MsgDlg('Confirma Exclusão ?','Mensagem ',mtInformation,
            [mbYes, mbNo],0) = mrYes
  Then Begin
    inherited;
     Try
       If not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

       If sTipoOperacao = 'A' Then
       Begin
          //AL_3
          FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE (IDOPERACAOORIGEM = '''+
              IntToStr(Qry.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');
          if Not QryAux.IsEmpty then
          begin
             MsgDlg('Não é possível excluir a Aplicação. Exite outras operações vinculadas.','Mensagem do Sistema',mtInformation,[mbOk],0);
             DtmBaseDados.dbBaseDados.Rollback;
             QryAux.Close;
             Exit;
          end;

          HabilitaBotoes(Qry, QryDetalhe);

          iTpFdoInves := QryDetalhe.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
          iFdoInvest  := QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
          dDataUltFec := QryDetalhe.FieldByName('DATAULTFECH').AsDateTime;
          dDataIniPro := QryDetalhe.FieldByName('DTAINIPROC').AsDateTime;

          ExecutaQuery(QryAux,
               'UPDATE OPERACAOFUNDO SET STACONFIRMA = '' '', STAESPECIFICADO = '' '' WHERE '+
               '(IDOPERACAOFUNDO   = '''+
                     IntToStr(Qry.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');

          ExecutaQuery(QryAux,
               'UPDATE OPERACAOFUNDO SET STACONFIRMA = '' '', STAESPECIFICADO = '' '' WHERE '+
               '(IDOPERACAOFUNDO   = '''+
                     IntToStr(QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');

          FazQuery(QryAux,'SELECT PLANO, PLNCODIGO, CODDOCUMENTO FROM HISTFUNDO WHERE (IDOPERACAOFUNDO   = '''+
                          IntToStr(QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');
          while not QryAux.Eof do
          begin
             if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                    QryAux.FieldByName('PLNCODIGO').AsInteger,
                                    QryAux.FieldByName('PLANO').AsInteger,
                                    iTipoInvestUsu,
                                    dbDtaOperacao.Date, True) Then
             begin
                MsgDlg('Não foi possível excluir a integração Contábil.','Mensagem do Sistema',mtInformation,[mbOk],0);
                DtmBaseDados.dbBaseDados.Rollback;
                QryAux.Close;
                Exit;
             end;
             QryAux.Next;
          end;

          ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE (IDOPERACAOFUNDO   = '''+
                     IntToStr(QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');

          QryDetalhe.Delete;
          QryDetalhe.ApplyUpdates;
          QryDetalhe.CommitUpdates;

          BtDelDet.Down          := False;

          dtmBaseDados.dbBaseDados.Commit;

          if StrToDate(dbDtaOperacao.Text) <= dDataUltFec Then
          begin
             If Not Reprocessamento(iTipoInvestUsu, iTpFdoInves, iFdoInvest, iPlanPrevCtbPatro,
                                    StrToDate(dbDtaOperacao.Text),
                                    dDataUltFec, dDataIniPro, True) Then
                MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                       'Mas o Reprocessamento foi cancelado!'+#13+
                       'Faça o Reprocessamento para esse Fundo e dia!',
                       'Mensagem do Sistema', MtInformation,[MbOk],0);
          end;

          HabilitaBotoes(Qry, QryDetalhe);
       End
       Else
       Begin

          with qryAux do begin
            Close;
            SQL.Clear;
            SQL.Text := 'UPDATE PEDIDOFUNDO SET STAESPECIFICADO = '' '' WHERE '+
                        'IDPEDIDOFUNDO   = '+QryResg.FieldByName('IDPEDIDOFUNDO').AsString;
            ExecSQL;
            Close;
          end;

          with qryAux do begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM IRLITIGIO WHERE IDOPERACAOFUNDO IN '+
                        '(SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+
                        QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsString+')';
            ExecSQL;
            Close;
          end;

          with qryAux do begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM HISTFUNDO WHERE IDOPERACAOFUNDO IN '+
                        '(SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+
                        QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsString+')';
            ExecSQL;
            Close;
          end;

          with qryAux do begin
            Close;
            SQL.Clear;
            SQL.Text := 'DELETE FROM OPERACAOFUNDO WHERE IDPEDIDOFUNDO = '+
                        QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsString;
            ExecSQL;
            Close;
          end;

          //AL_3
          iTpFdoInves := QryDetalheResg.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
          iFdoInvest  := QryDetalheResg.FieldByName('IDFUNDOINVEST').AsInteger;
          dDataUltFec := QryDetalheResg.FieldByName('DATAULTFECH').AsDateTime;
          dDataIniPro := QryDetalheResg.FieldByName('DTAINIPROC').AsDateTime;

          QryDetalheResg.Delete;
          QryDetalheResg.ApplyUpdates;
          QryDetalheResg.CommitUpdates;

          dtmBaseDados.dbBaseDados.Commit;

          if StrToDate(dbDtaOperacao.Text) <= dDataUltFec Then
          begin
             If Not Reprocessamento(iTipoInvestUsu, iTpFdoInves, iFdoInvest, iPlanPrevCtbPatro,
                                    StrToDate(dbDtaOperacao.Text),
                                    dDataUltFec, dDataIniPro, True) Then
                MsgDlg('Atenção : A Operação foi concluída com sucesso!'+#13+
                       'Mas o Reprocessamento foi cancelado!'+#13+
                       'Faça o Reprocessamento para esse Fundo e dia!',
                       'Mensagem do Sistema', MtInformation,[MbOk],0);
          end;
          //AL_3

          HabilitaBotoes(QryResg, QryDetalheResg);

       End;
     Except
        MsgDlg('Não é possivel deletar essa operação!', 'Mensagem do Sistema ',mtWarning,[mbOK],0);
     End;

     bbtnCancelarClick(Sender);
  End;
end;

procedure TfrmEspLancamento.BtAltDetClick(Sender: TObject);
begin
  inherited;

   //Habilita botões do Detalhe
   BtOkDet.Enabled        := True;
   BtCancDet.Enabled      := True;
   BtVoltaDet.Enabled     := True;

   BtIncDet.Enabled       := False;
   BtAltDet.Enabled       := False;
   BtDelDet.Enabled       := False;

   bbtnConfirmar.Enabled  := True;

   If sTipoOperacao = 'A' Then
   Begin
      //Prepara Grid para Inserção de Dados
      dbgEspecificada.SelectedIndex := 0;
      dbgEspecificada.Options       := dbgEspecificada.Options + [TwwDBgridOption(dgEditing)];
      dbgEspecificada.Font.Color    := clBlack;
      dbgEspecificada.SetFocus;

      Qry.Edit;
      QryDetalhe.Edit;
   End
   Else
   Begin
      //Prepara Grid para Inserção de Dados
      dbgEspecificadaResg.SelectedIndex := 0;
      dbgEspecificadaResg.Options       := dbgEspecificadaResg.Options + [TwwDBgridOption(dgEditing)];
      dbgEspecificadaResg.Font.Color    := clBlack;
      dbgEspecificadaResg.SetFocus;

      QryResg.Edit;
      QryDetalheResg.Edit;
   End;
   bTrocaLine := False;
end;

procedure TfrmEspLancamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   OperComum.LimpaParametros(Qry);
   OperComum.LimpaParametros(QryAux);
   OperComum.LimpaParametros(QryResg);
   OperComum.LimpaParametros(QryDetalhe);
   OperComum.LimpaParametros(QryTipoFundo);
   OperComum.LimpaParametros(QryDetalheResg);
   OperComum.LimpaParametros(QryTipoOperacao);
   OperComum.LimpaParametros(QryDetalheAplTotal);
   OperComum.LimpaParametros(QryComposicaoFundo);
end;

procedure TfrmEspLancamento.dbDtaOperacaoExit(Sender: TObject);
begin
  inherited;
  //AL_3
  bModif := False;

  If ( (Trim(DblTipoFundo.Text) <> '') And (Trim(DblTipoOperacao.Text) <> '') ) Then
     AbreTodasQry;

end;

procedure TfrmEspLancamento.DblTipoFundoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  //AL_3
  bModif := modified;
  if ( modified and (Trim(DblTipoFundo.Text)    <> '')
                and (Trim(DblTipoOperacao.Text) <> '') ) Then
     AbreTodasQry;
end;

//AL_3
procedure TfrmEspLancamento.DblTipoOperacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bModif := modified;
  if ( modified and (Trim(DblTipoFundo.Text)    <> '')
                and (Trim(DblTipoOperacao.Text) <> '') ) Then
     AbreTodasQry;
end;

procedure TfrmEspLancamento.dsDataChange(Sender: TObject; Field: TField);
Var
   fValorDet : Currency;
begin
  inherited;
  //AL_3
  If ((Not (QryDetalhe.State In [DsInsert, DsEdit])) and
      (qry.FieldByName('IDFUNDOINVEST').AsInteger > 0)) Then
  Begin
     OperComum.LimpaParametros(QryComposicaoFundo);
     QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger  :=
                               qry.FieldByName('IDFUNDOINVEST').AsInteger;
     if Trim(dbDtaOperacao.text) <> '' then
        QryComposicaoFundo.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
     QryComposicaoFundo.Open;

     OperComum.LimpaParametros(QryDetalhe);
     if Trim(dbDtaOperacao.text) <> '' then
        QryDetalhe.ParamByName('DATAOPERACAO').AsString    := dbDtaOperacao.Text;
     QryDetalhe.ParamByName('IDFUNDOINVEST').AsInteger     :=
                               qry.FieldByName('IDFUNDOINVEST').AsInteger;
     if Trim(DblTipoOperacao.text) <> '' then
        QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DblTipoOperacao.LookupValue);
     QryDetalhe.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryDetalhe.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryDetalhe.Open;

     HabilitaBotoes(Qry,QryDetalhe);

     If QryResg.FieldByName('STAESPECIFICADO').AsString = 'S' Then
        BtAltDet.Enabled := False;
  End;
end;

Function TfrmEspLancamento.VerificaFundoApl : Boolean;
Begin
   //AL_3
   OperComum.LimpaParametros(QryVerFundoApl);
   QryVerFundoApl.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   if Trim(dbDtaOperacao.text) <> '' then
      QryVerFundoApl.ParamByName('DATAOPERACAO').AsString    := dbDtaOperacao.Text;
   QryVerFundoApl.ParamByName('IDCOMPOSICAOFUNDO').AsInteger :=
                                 QryComposicaoFundo.FieldByName('IDCOMPOSICAOFUNDO').AsInteger;
   QryVerFundoApl.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                 QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger;
   if Trim(DblTipoOperacao.text) <> '' then
      QryVerFundoApl.ParamByName('IDTIPOOPERACAO').AsInteger  := StrToInt(DblTipoOperacao.LookupValue);
   QryVerFundoApl.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryVerFundoApl.Open;

   If QryVerFundoApl.RecordCount > 0 Then
      Result := False
   else
      Result := True;

   OperComum.LimpaParametros(QryVerFundoApl);
End;

Function TfrmEspLancamento.VerificaFundoResg : Boolean;
Begin
   //AL_3
   OperComum.LimpaParametros(QryVerFundoResg);
   QryVerFundoResg.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
   if Trim(dbDtaOperacao.text) <> '' then
      QryVerFundoResg.ParamByName('DATAOPERACAO').AsString    := dbDtaOperacao.Text;
   QryVerFundoResg.ParamByName('IDCOMPOSICAOFUNDO').AsInteger :=
                          QryComposicaoFundo.FieldByName('IDCOMPOSICAOFUNDO').AsInteger;
   QryVerFundoResg.ParamByName('IDFUNDOINVEST').AsInteger     :=
                          QryDetalheResg.FieldByName('IDFUNDOINVEST').AsInteger;
   if Trim(DblTipoOperacao.text) <> '' then
      QryVerFundoResg.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DblTipoOperacao.LookupValue);
   QryVerFundoResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
   QryVerFundoResg.Open;

   If QryVerFundoResg.RecordCount > 0 Then
      Result := False
   else
      Result := True;

   OperComum.LimpaParametros(QryVerFundoResg);
   //AL_3
End;

function TfrmEspLancamento.Aplicacao : Boolean;
Var
  DadosCota : TDadosCota;
begin
   Result := True;
   Try
      Qry.FieldByName('VALOR').AsCurrency :=
             (Qry.FieldByName('VALOR').AsCurrency-QryDetalhe.FieldByName('VLROPERACAO').AsCurrency);

      DadosCota := UFundoComum.BuscaCotaFundo(QryAux,
                                  QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
                                  QryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime);

      If (QryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime = dbDtaOperacao.Date) And
         (DadosCota.DataCota = 0) Then
      Begin
         MsgDlg('Não há Cota para esse Fundo nessa data.','Mensagem do Sistema',mtWarning,[mbOk],0);
         dbgEspecificada.SetFocus;
         DblCarteiraDetalhe.SetFocus;
         Exit;
      End
      Else
      Begin
         DadosCota.DataCota := QryAux.FieldByName('DATACOTA').AsDateTime;
         DadosCota.VlrCota  := QryAux.FieldByName('VLRCOTA').AsFloat;
      End;

      If QryDetalhe.State In [DsInsert, DsEdit] Then
      Begin
         QryDetalhe.FieldByName('QTDOPERACAO').AsFloat :=
             OperComum.Round((QryDetalhe.FieldByName('VLROPERACAO').AsCurrency/DadosCota.VlrCota),
                       QryComposicaoFundo.FieldByName('QTDDECQTD').AsInteger);
         QryDetalhe.FieldByName('VLRCOTA').AsFloat     := DadosCota.VlrCota;
      End;

      QryDetalhe.FieldByName('IDCOMPOSICAOFUNDO').AsInteger :=
                      QryComposicaoFundo.FieldByName('IDCOMPOSICAOFUNDO').AsInteger;

      If QryDetalhe.State In [DsInsert] Then
         QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger := LeUltRegistro(nil,'OPERACAOFUNDO');

      QryDetalhe.Post;
      QryDetalhe.ApplyUpdates;
      QryDetalhe.CommitUpdates;

      Qry.Post;

      ExecutaQuery(QryAux,
              ' DELETE FROM HISTFUNDO WHERE IDFUNDOINVEST   = '+
                      QryDetalhe.FieldByName('IDFUNDOINVEST').AsString+' AND '+
              ' IDPLANPREVCTBPATR = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
              ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
              ' DATAAPLICACAO = '+'TO_DATE('+
                      QuotedStr(QryDetalhe.FieldByName('DATAOPERACAO').AsString)+',''DD/MM/YYYY'')');

      If Qry.RecordCount = 0 Then
      Begin
         bbtnConfirmar.Enabled := True;
         bbtnCancelar.Enabled  := True;
      End;

      dbgEspecificada.Options := dbgEspecificada.Options - [TwwDBgridOption(dgEditing)];
      dbgEspecificada.Color   := clSilver;

      HabilitaBotoes(Qry, QryDetalhe);

      QryDetalheAplTotal.Close;
      QryDetalheAplTotal.ParamByName('DATAOPERACAO').AsString       := dbDtaOperacao.Text;
      QryDetalheAplTotal.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                qry.FieldByName('IDFUNDOINVEST').AsInteger;
      QryDetalheAplTotal.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                   QryDetalhe.ParamByName('IDTIPOOPERACAO').AsInteger;
      QryDetalheAplTotal.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
      QryDetalheAplTotal.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
      QryDetalheAplTotal.Open;

      If QryDetalheAplTotal.FieldByName('VLROPERACAOTOTAL').AsCurrency = Qry.FieldByName('VLROPERACAO').AsCurrency Then
         bbtnConfirmar.Enabled := True;

      QryDetalheAplTotal.Close;
   Except
      Result := False;
   End
end;

function TfrmEspLancamento.Resgate : Boolean;
Var
   //AL_3
   iIdForCli, iTipoResgate :  Integer;
   //AL_7
   sTipoOper, sNaturezaOper, sOperacao, sMens : String;
   fVlrCustoAcoes, fVlrVarAcoes, fValorEsp : Currency;
begin
   Result    := True;
   iIdForCli := 0;
   Try
      QryResg.FieldByName('VALOR').AsCurrency :=
             (QryResg.FieldByName('VALOR').AsCurrency-
                      QryDetalheResg.FieldByName('VLROPERACAO').AsCurrency);
      QryResg.Post;
// Caso Inserindo Gera sequencial
      If QryDetalheResg.State In [DsInsert] Then
         QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsInteger:= LeUltRegistro(Nil,'PEDIDOFUNDO');

      QryDetalheResg.FieldByName('IDCOMPOSICAOFUNDO').AsInteger :=
                      QryComposicaoFundo.FieldByName('IDCOMPOSICAOFUNDO').AsInteger;

// Busca dados do Tipo de Operacao
      sNaturezaOper := QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString;
      sOperacao     := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;

      QryDetalheResg.Post;
      QryDetalheResg.ApplyUpdates;
      QryDetalheResg.CommitUpdates;

      If (QryDetalheResg.FieldByName('DATAPEDIDO').AsDateTime =
          QryDetalheResg.FieldByName('DATACOTIZACAO').AsDateTime) Then
      Begin

         If iTipoInvestUsu <> 6 Then
         begin
            fVlrCustoAcoes := 0;
            fVlrVarAcoes   := 0;
         end;

         //AL_3
         if QryTipoOperacao.FieldByName('FLGCONTAINVEST').AsInteger = 0 then
            iTipoResgate := 1
         else
            iTipoResgate := 2;

         //AL_3
         //Alt_1
         If Not ResgateFACFIF(iTipoInvestUsu,
                              QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsInteger,
                              QryDetalheResg.FieldByName('IDTIPOOPERACAO').AsInteger,
                              QryComposicaoFundo.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              QryDetalheResg.FieldByName('IDFUNDOINVEST').AsInteger,
                              QryDetalheResg.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
                              QryDetalheResg.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                              QryDetalheResg.FieldByName('DATACOTIZACAO').AsDateTime,
                              QryDetalheResg.FieldByName('DATAPEDIDO').AsDateTime,
                              QryDetalheResg.FieldByName('DATALIQUIDACAO').AsDateTime, 0,
                              QryDetalheResg.FieldByName('VLROPERACAO').AsFloat, 0,
                              fVlrCustoAcoes, fVlrVarAcoes, -1, iTipoResgate) Then
         Begin
            MsgDlg('Ocorreu um problema no resgate do Fundo : '+#13+
                   QryDetalheResg.FieldByName('DESCFUNDOINVEST').AsString,'Mensagem do Sistema',
                   MtInformation,[MbOk],0);
            QryDetalheResg.Delete;
            QryDetalheResg.ApplyUpdates;
            QryDetalheResg.CommitUpdates;
            Result := False;
            Exit;
         End;

         With DmFundoComum Do
         Begin
            QryConfirmacao.Close;
            QryConfirmacao.ParamByName('IDFUNDOINVEST').AsInteger     :=
                                       QryDetalheResg.FieldByName('IDFUNDOINVEST').AsInteger;
            QryConfirmacao.ParamByName('IDTIPOOPERACAO').AsInteger    :=
                                                 QryDetalheResg.FieldByName('IDTIPOOPERACAO').AsInteger;
            QryConfirmacao.ParamByName('DATAOPERACAO').AsString       := dbDtaOperacao.Text;
            QryConfirmacao.ParamByName('DATACOTIZACAO').AsString      :=
                                           QryDetalheResg.FieldByName('DATACOTIZACAO').AsString;
            QryConfirmacao.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
            //Al_2
            QryConfirmacao.ParamByName('IDPEDIDOFUNDO').AsInteger     :=
                                       QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsInteger;
            QryConfirmacao.Open;

            While Not QryConfirmacao.Eof Do
            Begin

               If (QryConfirmacaoDATAOPERACAO.AsDateTime <> QryConfirmacaoDATACOTIZACAO.AsDateTime) And
                  (QryConfirmacaoQTDOPERACAO.AsFloat = 0) Then
                   sTipoOper := 'CTZ'
               Else
                   sTipoOper := 'OPE';

               //AL_7
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
                      QryConfirmacaoQTDOPERACAO.AsFloat,  QryConfirmacaoVLRCOTA.AsFloat,
                      QryConfirmacaoVLRLIQUIDO.AsFloat, QryConfirmacaoVLRIR.AsFloat,
                      QryConfirmacaoVLRIOF.AsFloat,
                      sNaturezaOper,
                      sOperacao+' / '+QryConfirmacaoDESCFUNDOINVEST.AsString, sTipoOper , True,
                      iPlanPrevCtbPatro,-1,
                      QryConfirmacaoIDCOMPOSICAOFUNDO.AsInteger,
                      QryConfirmacaoVLRRENDIMENTO.AsFloat, sMens) Then
               Begin
                //AL_3
                //AL_7
                if sMens <> '' then
                   MsgDlg('Não foi possível confirmar a Operação' + #13 +
                          'Mensagem: ' + sMens,
                          'Mensagem do Sistema', mtInformation, [MbOk],0)
                else
                   MsgDlg('Não foi possível confirmar esta Operação' + #13 +
                          'Ocorreu um problema durante o processo de gravação' + #13 +
                          'Refaça a operação',
                          'Mensagem do Sistema', mtInformation,[MbOk],0);

                  QryDetalheResg.Delete;
                  QryDetalheResg.ApplyUpdates;
                  QryDetalheResg.CommitUpdates;
                  QryConfirmacao.Close;
                  Abort;
               End;

               QryAux.Close;
               QryConfirmacao.Next;

            End;

            QryConfirmacao.Close;

            dbgEspecificadaResg.Options := dbgEspecificada.Options - [TwwDBgridOption(dgEditing)];
            dbgEspecificadaResg.Color   := clSilver;

            HabilitaBotoes(QryResg, QryDetalheResg);

            //AL_3
            If QryResg.FieldByName('VALOR').AsCurrency = 0 Then
            begin
               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := True;
            end;

            QryDetalheResgTotal.Close;

         End;
      End;
   Except
      Result := False;
   End;
end;

function TfrmEspLancamento.ConfirmacaoApl : Boolean;
Var
   iIdForCli : Integer;
   //AL_7
   sTipoOper, sNaturezaOper, sOperacao, sMens : String;
   fValorEsp : Currency;
begin
   Try
      Result    := True;
      fValorEsp := 0;
      QryDetalhe.DisableControls;
      QryDetalhe.First;
      While Not QryDetalhe.Eof Do
      Begin
        QryComposicaoFundo.Locate('IDFUNDOINVESTCOMP', QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger, [loPartialKey]);

        iIdForCli := OperComum.BuscaForCli(QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
                                           QryComposicaoFundo.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                           QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger,
                                           pRPI.IDTIPOCLIENTEEMI);

        If (QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime <>
            QryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime) And
           (QryDetalhe.FieldByName('QTDOPERACAO').AsFloat = 0) Then
           sTipoOper := 'CTZ'
        Else
           sTipoOper := 'OPE';

        sNaturezaOper := QryTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString;
        sOperacao     := QryTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString;

        //AL_7
        //Rotina de confirmação das operações        
        If Not AlimentaFundo(QryDetalhe.FieldByName('IDTIPOINVEST').AsInteger,
            QryDetalhe.FieldByName('IDTIPOOPERACAO').AsInteger,
            QryDetalhe.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryDetalhe.FieldByName('IDFUNDOINVEST').AsInteger,
            iPlanoPrevContab,
            iPatrocinadora,
            QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
            QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger,
            QryComposicaoFundo.FieldByName('QTDDECQTD').AsInteger,
            QryComposicaoFundo.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
            iIdForCli,
            QryDetalhe.FieldByName('DATAOPERACAO').AsDateTime,
            QryDetalhe.FieldByName('DATACOTIZACAO').AsDateTime,
            QryDetalhe.FieldByName('DATALIQUIDACAO').AsDateTime,
            QryDetalhe.FieldByName('QTDOPERACAO').AsFloat,
            QryDetalhe.FieldByName('VLRCOTA').AsFloat,
            QryDetalhe.FieldByName('VLROPERACAO').AsFloat, 0{IRRF},  0{IOF},
            sNaturezaOper,
            Trim(sOperacao)+' / '+QryComposicaoFundo.FieldByName('DESCFUNDOINVEST').AsString,
            sTipoOper, True,
            iPlanPrevCtbPatro,-1,
            QryDetalhe.FieldByName('IDCOMPOSICAOFUNDO').AsInteger,
            0{Rendimento}, sMens) Then
        Begin
            //AL_7
            if sMens <> '' then
               MsgDlg('Não foi possível confirmar a Operação' + #13 +
                      'Mensagem: ' + sMens,
                      'Mensagem do Sistema', mtInformation, [MbOk],0)
            else
               MsgDlg('Não foi possível confirmar esta Operação' + #13 +
                      'Ocorreu um problema durante o processo de gravação' + #13 +
                      'Refaça a operação',
                      'Mensagem do Sistema', mtInformation,[MbOk],0);

            Result := False;
            Exit;
        End;

        ExecutaQuery(QryAux,'UPDATE OPERACAOFUNDO SET STACONFIRMA = ''S'', STAESPECIFICADO = ''S'' WHERE '+
                            '(IDOPERACAOFUNDO   = '''+ IntToStr(QryDetalhe.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');

        QryAux.Close;

        fValorEsp := fValorEsp + QryDetalhe.FieldByName('VLROPERACAO').AsFloat;
        QryDetalhe.Next;
      End;
      QryDetalhe.First;
      QryDetalhe.EnableControls;

      If fValorEsp = Qry.FieldByName('VLROPERACAO').AsFloat Then
         ExecutaQuery(QryAux, 'UPDATE OPERACAOFUNDO SET STAESPECIFICADO = ''S'' WHERE '+
                              '(IDOPERACAOFUNDO   = '''+ IntToStr(Qry.FieldByName('IDOPERACAOFUNDO').AsInteger)  +''')');
      QryAux.Close;
   Except
      Result := False;
   End;
end;

function TfrmEspLancamento.ConfirmacaoResg : Boolean;
Var
   fValorEsp : Currency;
begin
   Result := True;
   Try
      fValorEsp := 0;
      QryDetalheResg.DisableControls;
      QryDetalheResg.First;
      While Not QryDetalheResg.Eof Do
      Begin
         ExecutaQuery(QryAux,'UPDATE PEDIDOFUNDO SET STAESPECIFICADO = ''S'' WHERE '+
                             '(IDPEDIDOFUNDO    = '''+ IntToStr(QryDetalheResg.FieldByName('IDPEDIDOFUNDO').AsInteger)  +''')');

         QryAux.Close;

         fValorEsp := fValorEsp + QryDetalheResg.FieldByName('VLROPERACAO').AsFloat;

         QryDetalheResg.Next;
      End;
      QryDetalheResg.First;
      QryDetalheResg.EnableControls;

      If fValorEsp = QryResg.FieldByName('VLROPERACAO').AsFloat Then
         ExecutaQuery(QryAux,'UPDATE PEDIDOFUNDO SET STAESPECIFICADO = ''S'' WHERE '+
                             '(IDPEDIDOFUNDO   = '''+ IntToStr(QryResg.FieldByName('IDPEDIDOFUNDO').AsInteger)  +''')');
      QryAux.Close;
   Except
      Result := False;
   End;
end;

procedure TfrmEspLancamento.QryDetalheResgBeforePost(DataSet: TDataSet);
begin
  inherited;
  If Not bTrocaLine Then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.','Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmEspLancamento.DsResgDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  //AL_3
  If ((Not (QryDetalheResg.State In [DsInsert, DsEdit]))    and
      (QryResg.FieldByName('IDFUNDOINVEST').AsInteger > 0)) Then
  Begin
     OperComum.LimpaParametros(QryComposicaoFundo);
     QryComposicaoFundo.ParamByName('IDFUNDOINVEST').AsInteger  :=
                                  QryResg.FieldByName('IDFUNDOINVEST').AsInteger;
     if Trim(dbDtaOperacao.text) <> '' then
        QryComposicaoFundo.ParamByName('DATAOPERACAO').AsString := dbDtaOperacao.Text;
     QryComposicaoFundo.Open;

     OperComum.LimpaParametros(QryDetalheResg);
     if Trim(dbDtaOperacao.text) <> '' then
        QryDetalheResg.ParamByName('DATAOPERACAO').AsString    := dbDtaOperacao.Text;
     QryDetalheResg.ParamByName('IDFUNDOINVEST').AsInteger     := QryResg.FieldByName('IDFUNDOINVEST').AsInteger;
     If (Trim(DblTipoOperacao.text) <> '') Then
        QryDetalheResg.ParamByName('IDTIPOOPERACAO').AsInteger := StrToInt(DblTipoOperacao.LookupValue);
     QryDetalheResg.ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrevCtbPatro;
     QryDetalheResg.ParamByName('IDTIPOINVEST').AsInteger      := iTipoInvestUsu;
     QryDetalheResg.Open;

     HabilitaBotoes(QryResg,QryDetalheResg);

     If QryResg.FieldByName('STAESPECIFICADO').AsString = 'S' Then
        BtAltDet.Enabled := False;
  End;
end;

procedure TfrmEspLancamento.dbgEspecificadaResgEnter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmEspLancamento.dbgEspecificadaResgExit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;
end;

procedure TfrmEspLancamento.dbgEspecificadaResgKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgEspecificadaResg.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmEspLancamento.dbgEspecificadaResgKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;

   If ((Key = 38) Or (Key = 40)) And
      (dbgEspecificadaResg.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmEspLancamento.dbgEspecificadaResgRowChanged(Sender: TObject);
begin
  inherited;
  if (BtAltDet.Down) and (not bTrocaLine) then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmEspLancamento.dbgEspecificadaRowChanged(Sender: TObject);
begin
  inherited;
  if (BtAltDet.Down) and (not bTrocaLine) then
  Begin
     MsgDlg('Não é permetido alterar o outro registro.', 'Mensagem do Sistema', mtWarning,[MbOk],0);
     BtCancDet.Click;
     SysUtils.Abort;
  End;
end;

procedure TfrmEspLancamento.AbreTodasQry;
begin
  If pos('APLI', DblTipoOperacao.Text) > 0 Then
     sTipoOperacao := 'A'
  Else
     sTipoOperacao := 'R';

  If sTipoOperacao = 'A' Then
  Begin
     dbgEspecificar.Visible        := True;
     dbgEspecificada.Visible       := True;
     dbgEspecificarResg.Visible    := False;
     dbgEspecificadaResg.Visible   := False;
     DblCarteiraDetalhe.DataSource := DsDetalhe;
     AbreQueryAplicacao;
  End
  Else
  Begin
     dbgEspecificarResg.Visible    := True;
     dbgEspecificadaResg.Visible   := True;
     dbgEspecificar.Visible        := False;
     dbgEspecificada.Visible       := False;
     DblCarteiraDetalhe.DataSource := DsDetalheResg;
     AbreQueryResgate;
  End;
End;

//AL_3
procedure TfrmEspLancamento.DblTipoFundoExit(Sender: TObject);
begin
  inherited;
   if ( (not bModif) and (Trim(DblTipoFundo.Text)    <> '')
                     and (Trim(DblTipoOperacao.Text) <> '') ) Then
      AbreTodasQry;
end;

//AL_3
procedure TfrmEspLancamento.DblTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   if ( (not bModif) and (Trim(DblTipoFundo.Text)    <> '')
                     and (Trim(DblTipoOperacao.Text) <> '') ) Then
      AbreTodasQry;
end;

procedure TfrmEspLancamento.FormCreate(Sender: TObject);
begin
  inherited;
   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

end.
