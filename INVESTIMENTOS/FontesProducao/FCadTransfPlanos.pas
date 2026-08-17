//******************************************************************************
// Autor     : Monica Silva
// Data      : 10/01/2008
// Código    : AL_22
// Pendencia : 26743
// SOL       :
// Desc      : Verificar se existem transferências entre Planos posteriores a transferência
//******************************************************************************
// Data      : 25/01/2007
// Código    : AL_21
// Pendencia : 26562
// SOL       : 70938
// Desc      : Implementação de otimização na exclusão dos resgistros de transferência
//******************************************************************************
// Autor     : Marco Turon
// Data      : 01/02/2007
// Código    : AL_20
// Pendencia : 24349
// SOL       : 52712
// Desc      : Ajuste no tratamento de erro da rotina AlimentaFundo
//             Criado um parametro novo dom variável para retorno da
//               mensagem de erro
//******************************************************************************
// Data      : 23/08/2006
// Código    : AL_19
// Motivo    : Implementação do tipo de cota
//******************************************************************************
// Data      : 01/08/2006
// Código    : AL_18
// Pendencia : 22781
// Motivo    : Implementação da verificação de transferência com data superior ao lançamento
//******************************************************************************
// Data      : 10/07/2006
// Código    : AL_17
// Pendencia : 20453
// SOL       : 33866
// Desc      : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data      : 19/06/2006
// Código    : AL_16
// Pendencia : 22589
// SOL       : 44014
// Motivo    : Implementação da gravação das operações e na contabilização do IOF e do IRRF.
//******************************************************************************
// Data      : 12/06/2006
// Código    : AL_15
// Motivo    : Implementação do plano e patrocinadora para a rotina contabilização
//******************************************************************************
// Data      : 08/06/2006
// Código    : AL_14
// Pendencia : 22439
// SOL       : 43516
// Motivo    : Gravar no histórico contábil o plano destino
//******************************************************************************
// Data      : 30/05/2006
// Código    : AL_13
// Motivo    : Ajustes nas rotinas, com retirada de variaveis, funções  e query´s,
 ///           que não são utilizadas
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_12
// Motivo    : Retirado a critica de data de operação igual ao dia  para acionar
//             o reprocessamento.
//******************************************************************************
// Data      : 26/05/2006
// Código    : AL_11
// Motivo    : Alterada a mensagem de erro no reprocessamento
//******************************************************************************
// Data      : 28/03/2006
// Código    : AL_10
// Motivo    : Ajuste na exclusão
//******************************************************************************
// Data      : 28/03/2006
// Código    : AL_9
// Motivo    : Ajuste das mensagens, implementação do reprocessamento,
//             do carimbo da integralização contábil/finaceira na tabela OPERACAOFUNDO
//             e acerto na gravação da cota de aplicação na tabela COTAFUNDO
//******************************************************************************
// Data      : 28/03/2006
// Código    : AL_8
// Motivo    : Implementação do carimbo da integralização contábil/finaceira na
//             tabela OPERACAOFUNDO
//******************************************************************************
// Data     : 25/05/2005
// Linha(s) : Al_8
// Motivo   : Implementação do teste de período contabil em 3 camadas
//******************************************************************************
// Data     : 29/04/2005
// Linha(s) : Al_7
// Motivo   : Alterado a descrição do histórico, para passar apenas o nome do fundo e o plano
//******************************************************************************
// Data     : 29/10/2004
// Linha(s) : Alt_6
// Motivo   : Acerto no Gravaoperacao e MSBuscaSaldos
//******************************************************************************
// Data     : 28/10/2004
// Alt      : Alt_5
// Motivo   : Implementacao de Reprocessamento na exclusão
//******************************************************************************
// Data     : 27/10/2004
// Alt      : Alt_4
// Motivo   : Implementação dos valores de iof, ir e variação
//******************************************************************************
// Data     : 21/10/2004
// Alt      : Alt_3
// Motivo   : Tratamento das variaveis devido a precisão de decimais
//******************************************************************************
// Data     : 07/10/2004
// Alt      : Alt_2
// Motivo   : Sugestao de Data de TRC no Formshow
//            Implementacao do fSldVlrFundo na funcao AlimentaFundo
//******************************************************************************
// Data      : 06/10/2004
// Alteracao : AL_1
// Motivo    : Acerto na passagem de valores proporcionais de Transferencia (-108)
//******************************************************************************
// Data     : 21/09/2004
// Motivo   : Melhorias diversas
//******************************************************************************

unit FCadTransfPlanos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSInv, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, fcLabel, ExtCtrls, wwdblook, Grids,
  Wwdbigrd, Wwdbgrid, TREdit, wwdbdatetimepicker, CMDateTimePicker, Menus,
  FPreview, DBCtrls, ComCtrls, uCtrlInvContab,
  {$IFNDEF VERSAO0505} uCMTypes{$ENDIF};

type
  TfrmCadTransfPlanos = class(TfrmCadastroCSInv)
    QryTipoFundoOrigem: TwwQuery;
    QryTipoFundoOrigemDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoOrigemIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoOrigemIDTIPOINVEST: TFloatField;
    QryTipoFundoOrigemDATAULTFECH: TDateTimeField;
    QryFundoOrigem: TwwQuery;
    QryFundoOrigemDESCFUNDOINVEST: TStringField;
    QryFundoOrigemIDFUNDOINVEST: TFloatField;
    QryFundoOrigemIDGESTORCARTEIRA: TFloatField;
    QryFundoOrigemTRGDTINCLUSAO: TDateTimeField;
    QryFundoOrigemTRGUSERINCLUSAO: TStringField;
    QryFundoOrigemMOECODIGO: TFloatField;
    QryFundoOrigemIDCARTEIRAINVEST: TFloatField;
    QryFundoOrigemIDTIPOFUNDOINVEST: TFloatField;
    QryFundoOrigemCNPJFUNDO: TStringField;
    QryFundoOrigemSTAEXCLUSIVO: TStringField;
    QryFundoOrigemPZOCARENCIA: TFloatField;
    QryFundoOrigemPZOANIVERSARIO: TFloatField;
    QryFundoOrigemPZOLIQAPLIC: TFloatField;
    QryFundoOrigemPZOLIQRESG: TFloatField;
    QryFundoOrigemQTDDECQTD: TFloatField;
    QryFundoOrigemQTDDECVALOR: TFloatField;
    QryFundoOrigemSTAFUNDO: TStringField;
    QryFundoOrigemPZOAMORTIZACAO: TFloatField;
    QryFundoOrigemPERCTXPERFORM: TFloatField;
    QryFundoOrigemPERCTXADM: TFloatField;
    QryFundoOrigemCODFUNCETIP: TStringField;
    QryFundoOrigemSTAPROVISIONAIR: TStringField;
    QryFundoOrigemSTAPROVISIONAIOF: TStringField;
    QryFundoOrigemCONTRCETIP: TStringField;
    QryFundoOrigemIDCATEGORIAFUNDO: TFloatField;
    QryTipoOperTransf: TwwQuery;
    QryTipoOperTransfIDTIPOOPERACAO: TFloatField;
    QryTipoOperTransfDESCTIPOOPERACAO: TStringField;
    QryTipoOperTransfNATUREZAOPERACAO: TStringField;
    QryTipoOperTransfFLGTRATAIR: TStringField;
    QryTipoOperTransfIDMERCADO: TFloatField;
    QryCotaFundo: TwwQuery;
    QryCotaFundoVLRCOTA: TFloatField;
    updCotaFundo: TUpdateSQL;
    dsCotaFundo: TwwDataSource;
    QryAux: TwwQuery;
    qryPlanoDestino: TwwQuery;
    pnlDetalhe: TPanel;
    pnlObs: TPanel;
    Panel3: TPanel;
    memoObs: TMemo;
    sbtnBuscaSaldos: TToolbarButton97;
    MSBuscaSaldos: TMontaSelect;
    qryBuscaOperDestino: TwwQuery;
    qryBuscaOperDestinoIDOPERACAOFUNDO: TFloatField;
    qryBuscaOperDestinoIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperDestinoIDPEDIDOFUNDO: TFloatField;
    qryBuscaOperDestinoIDTIPOINVEST: TFloatField;
    qryBuscaOperDestinoIDTIPOOPERACAO: TFloatField;
    qryBuscaOperDestinoIDFUNDOINVEST: TFloatField;
    qryBuscaOperDestinoDATAOPERACAO: TDateTimeField;
    qryBuscaOperDestinoDATALIQUIDACAO: TDateTimeField;
    qryBuscaOperDestinoQTDOPERACAO: TFloatField;
    qryBuscaOperDestinoVLROPERACAO: TFloatField;
    qryBuscaOperDestinoVLRCOTA: TFloatField;
    qryBuscaOperDestinoVLRIR: TFloatField;
    qryBuscaOperDestinoVLRIOF: TFloatField;
    qryBuscaOperDestinoVLRRENDIMENTO: TFloatField;
    qryBuscaOperDestinoSTACONFIRMA: TStringField;
    qryBuscaOperDestinoIDOPERACAOORIGEM: TFloatField;
    qryBuscaOperDestinoIDPLANPREVCTBPATR: TFloatField;
    qryBuscaOperDestinoDATACOTIZACAO: TDateTimeField;
    qryBuscaOperDestinoVLRDESCONTO: TFloatField;
    qryBuscaOperDestinoIDCOMPOSICAOFUNDO: TFloatField;
    qryBuscaOperDestinoSTAESPECIFICADO: TStringField;
    qryBuscaOperDestinoVLRCOLOCACAO: TFloatField;
    qryBuscaOperDestinoVLRTAXAS: TFloatField;
    qryBuscaOperDestinoVLRCORRETAGEM: TFloatField;
    qryBuscaOperDestinoTRGDTINCLUSAO: TDateTimeField;
    qryBuscaOperDestinoTRGUSERINCLUSAO: TStringField;
    qryBuscaOperDestinoOBSERVACAO: TMemoField;
    qryBuscaOperDestinoPLANO: TFloatField;
    qryBuscaOperDestinoPLNCODIGO: TFloatField;
    qryBuscaOperDestinoCODDOCUMENTO: TFloatField;
    qryBuscaOperDestinoIDOPERACAODIREITO: TFloatField;
    qryBuscaOperDestinoQTDUSUFRUTO: TFloatField;
    qryBuscaOperDestinoIDTIPOCOTA: TFloatField;
    qryBuscaOperDestinoIDCOTAINTEGRALIZA: TFloatField;
    //Al_13
    QryInsertCota: TwwQuery;
    StringField11: TStringField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    DateTimeField2: TDateTimeField;
    StringField12: TStringField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    StringField15: TStringField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    FloatField30: TFloatField;
    qryExcluiIRLitigio: TwwQuery;
    QryTipoFundoInvest: TwwQuery;
    qryIDOPERACAOFUNDO: TFloatField;
    qryIDCARTEIRAINVEST: TFloatField;
    qryIDPEDIDOFUNDO: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDFUNDOINVEST: TFloatField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryQTDOPERACAO: TFloatField;
    qryVLROPERACAO: TFloatField;
    qryVLRCOTA: TFloatField;
    qryVLRIR: TFloatField;
    qryVLRIOF: TFloatField;
    qryVLRRENDIMENTO: TFloatField;
    qrySTACONFIRMA: TStringField;
    qryIDOPERACAOORIGEM: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryDATACOTIZACAO: TDateTimeField;
    qryVLRDESCONTO: TFloatField;
    qryIDCOMPOSICAOFUNDO: TFloatField;
    qrySTAESPECIFICADO: TStringField;
    qryVLRCOLOCACAO: TFloatField;
    qryVLRTAXAS: TFloatField;
    qryVLRCORRETAGEM: TFloatField;
    qryOBSERVACAO: TMemoField;
    qryPLANO: TFloatField;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryIDOPERACAODIREITO: TFloatField;
    qryQTDUSUFRUTO: TFloatField;
    qryIDTIPOCOTA: TFloatField;
    qryIDCOTAINTEGRALIZA: TFloatField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    QryFundoOrigemDATAINICIOFUNDO: TDateTimeField;
    QryFundoOrigemPZOCOTAPLIC: TFloatField;
    QryFundoOrigemPZOCOTRESG: TFloatField;
    QryFundoOrigemDATACOTIZACAO: TDateTimeField;
    QryFundoOrigemIDREGRA: TFloatField;
    QryFundoOrigemVLRCOTAINICIAL: TFloatField;
    QryFundoOrigemMOECORCOTA: TFloatField;
    QryFundoOrigemSTAVERCOTA: TStringField;
    QryFundoOrigemDATAINIAPLIC: TDateTimeField;
    QryFundoOrigemDTAVIGENCIA: TDateTimeField;
    QryFundoOrigemIDCARTEIRASPC: TFloatField;
    QryFundoOrigemDTAINIPROC: TDateTimeField;
    QryFundoOrigemQTDTOTINTEGRALIZA: TFloatField;
    QryFundoOrigemIDTIPOCOTA: TFloatField;
    QryFundoOrigemIDCLASSIFANBID: TFloatField;
    QryFundoOrigemIDADMFDOINVEST: TFloatField;
    QryFundoOrigemIDTIPOFUNDOINVEST_1: TFloatField;
    QryFundoOrigemIDTIPOINVEST: TFloatField;
    QryFundoOrigemDESCTIPOFUNDOINV: TStringField;
    QryFundoOrigemDATAULTFECH: TDateTimeField;
    QryFundoOrigemTRGDTINCLUSAO_1: TDateTimeField;
    QryFundoOrigemTRGUSERINCLUSAO_1: TStringField;
    pnlOrigDest: TPanel;
    pnlOrigem: TPanel;
    pnlTitOrigem: TPanel;
    pnlOrigemGeral: TPanel;
    dbeVlrAplicado: TDBRealEdit;
    dbeVlrCusto: TDBRealEdit;
    pnlDestino: TPanel;
    pnlDestinoGeral: TPanel;
    lblPlanDestino: TLabel;
    lblPercentual: TLabel;
    lblQtdDestino: TLabel;
    lblVlrDestino: TLabel;
    dblPlanoDestino: TwwDBLookupCombo;
    redtPercentual: TRealEdit;
    redtQtdDestino: TRealEdit;
    redtVlrDestino: TRealEdit;
    pnlTitDestino: TPanel;
    pnlDataTransf: TPanel;
    lblDataTransf: TLabel;
    dbDtaTransf: TCMDateTimePicker;
    lblFundoOrigem: TLabel;
    dblFundoOrigem: TwwDBLookupCombo;
    lblTipFndOrigem: TLabel;
    dblTipoFundoOrigem: TwwDBLookupCombo;
    lblPlanOrigem: TLabel;
    lblPlanoOrigem: TStaticText;
    lblVlrApliOrigem: TLabel;
    dbeVlrAplicOrigem: TDBRealEdit;
    lblVlrIOFOrigem: TLabel;
    dbeVlrIOFOrigem: TDBRealEdit;
    lblVlrIRRFOrigem: TLabel;
    dbeVlrIRRFOrigem: TDBRealEdit;
    lblVlrCota: TLabel;
    dbeVlrcota: TDBRealEdit;
    lblQtdOrigem: TLabel;
    dbeQtdOrigem: TDBRealEdit;
    lblSaldoOrigem: TLabel;
    dbeSaldoOrigem: TDBRealEdit;
    lblDtAplicacaoOrigem: TLabel;
    dbDtaAplicacaoOrigem: TCMDateTimePicker;
    dbeCotaAplicOrigem: TDBRealEdit;
    lblPreco: TLabel;
    //AL_19
    QryTipoCota: TwwQuery;
    dblkTipoCota: TwwDBLookupCombo;
    lblTipoCota: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnBuscaSaldosClick(Sender: TObject);
    procedure dbDtaTransfExit(Sender: TObject);
    procedure dblTipoFundoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblFundoOrigemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure redtPercentualExit(Sender: TObject);
    procedure redtQtdDestinoExit(Sender: TObject);
    procedure redtVlrDestinoExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //AL_19
    procedure dblkTipoCotaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkTipoCotaExit(Sender: TObject);
  private
    { Private declarations }
    //AL_19
    bModif : Boolean;
    procedure VerificaBuscaSaldos;
    procedure LimpaCampos(dDataRef : String);
    function  VerificaValores:boolean;
    function  Transfere:boolean;

  public
    { Public declarations }
  end;

var
  frmCadTransfPlanos: TfrmCadTransfPlanos;
  //AL_16
  fVlrVar : Currency;

implementation

uses UDatabase, dBaseDados,UMensErro, USistema, UOperComum, UBibliotecaInvest,
     uFundoComum, dFundoComum, FPrincipal;


{$R *.DFM}

procedure TfrmCadTransfPlanos.FormShow(Sender: TObject);
begin
  inherited;
   // Simula o Padrão
   CmeCadastro.Cancel(Self); // Limpa o CachedUpdates
   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);
   sbtnProcurar.Enabled := True;
   bbtnConfirmar.Enabled := False;
   pnlOrigemGeral.Enabled := False;


   OperComum.LimpaParametros(QryTipoFundoOrigem);
   QryTipoFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundoOrigem.Open;

   OperComum.LimpaParametros(QryFundoOrigem);
   QryFundoOrigem.ParamByName('IDTIPOINVEST').AsInteger     := iTipoInvestUsu;
   QryFundoOrigem.Open;

   MontaSelect.Filtro.Add('OPERACAOFUNDO.IDTIPOINVEST      = ' + IntToStr(iTipoInvestUsu));
   MontaSelect.Filtro.Add('OPERACAOFUNDO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));

   //AL_19
   VerificaBuscaSaldos;
   QryTipoCota.Open;
   if iTipoInvestUsu in [9,10] then
   begin
      lblTipoCota.Visible  := True;
      dblkTipoCota.Visible := True;
   end;

   //Alt_2
   if dbDtaTransf.CanFocus then
      dbDtaTransf.SetFocus;
end;

procedure TfrmCadTransfPlanos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   QryTipoFundoOrigem.Close;
   QryFundoOrigem.Close;
   qry.Close;
   qryBuscaOperDestino.Close;
   QryCotaFundo.Close;
   QryAux.Close;
   qryPlanoDestino.Close;
   QryTipoOperTransf.Close;

end;

procedure TfrmCadTransfPlanos.sbtnBuscaSaldosClick(Sender: TObject);
begin
  inherited;
   msBuscaSaldos.Executar;
   if msBuscaSaldos.RetornouValor then
   begin
      //Al_13
      if StrToFloat(msBuscaSaldos.ValoresChave[24]) > 0 then
      begin
         MsgDlg('Há Cotas Bloqueadas para esse Fundo.','Mensagem do Sistema',mtConfirmation,[MbOk],0);
         pnlDestinoGeral.Enabled := False;
         pnlOrigemGeral.Enabled  := False;
         LimpaCampos('');
         if dbDtaTransf.CanFocus then
            dbDtaTransf.SetFocus;
         exit;
      end;

      sbtnBuscaSaldos.Enabled := True;
      sbtnBuscaSaldos.Down    := True;
      pnlDestinoGeral.Enabled := True;
      pnlOrigemGeral.Enabled  := True;

      // Simula o Padrão
      CmeCadastro.Cancel(Self); // Limpa o CachedUpdates
      CmeCadastro.Operacao := opInserir;
      CmeCadastro.RepetirInsert := True;
      CmeCadastro.Insert(Self);
      CmeCadastro.AtualizaBotoes(Self);
      sbtnInserir.Down := True;

      dbDtaTransf.Text          := msBuscaSaldos.ValoresChave[15];

      // Seleciona o Investimento
      dblTipoFundoOrigem.LookupValue := msBuscaSaldos.ValoresChave[16];
      dblTipoFundoOrigem.Text := msBuscaSaldos.ValoresChave[18];
      OperComum.PosicionaWWLookUpQry(dblTipoFundoOrigem, QryTipoFundoOrigem);

      dblFundoOrigem.LookupValue := msBuscaSaldos.ValoresChave[9];
      dblFundoOrigem.Text        := msBuscaSaldos.ValoresChave[17];
      OperComum.PosicionaWWLookUpQry(dblFundoOrigem, QryFundoOrigem);

      dbeQtdOrigem.DecDigits:= QryFundoOrigem.FieldByName('QTDDECQTD').AsInteger;
      redtQtdDestino.DecDigits:= QryFundoOrigem.FieldByName('QTDDECQTD').AsInteger;
      dbeCotaAplicOrigem.DecDigits:= QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger;
      dbeVlrcota.DecDigits:= QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger;      

      // Origem
      lblPlanoOrigem.Caption    := sPlanPrevCtbPatro;
      dbDtaAplicacaoOrigem.Text := msBuscaSaldos.ValoresChave[3];
      dbeCotaAplicOrigem.Text   := msBuscaSaldos.ValoresChave[6];
      dbeVlrAplicOrigem.Text    := msBuscaSaldos.ValoresChave[10];
      dbeQtdOrigem.Text         := msBuscaSaldos.ValoresChave[4];
      dbeSaldoOrigem.Text       := msBuscaSaldos.ValoresChave[11];
      dbeVlrcota.Text           := msBuscaSaldos.ValoresChave[12];
      dbeVlrAplicado.Text       := msBuscaSaldos.ValoresChave[14];
      dbeVlrCusto.Text          := msBuscaSaldos.ValoresChave[13];
      //AL_16
      //Al_4
      dbeVlrIRRFOrigem.Value    := StrToFloat(msBuscaSaldos.ValoresChave[20]);
      dbeVlrIOFOrigem.Value     := StrToFloat(msBuscaSaldos.ValoresChave[21]);
      fVlrVar                   := StrToFloat(msBuscaSaldos.ValoresChave[22]);

      // Destino
      qryPlanoDestino.Close;
      qryPlanoDestino.SQL.Clear;
      qryPlanoDestino.SQL.Add('SELECT PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.IDPATRO, (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO');
      qryPlanoDestino.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
      qryPlanoDestino.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR <> ' + IntToStr(iPlanPrevCtbPatro) +') AND');
      qryPlanoDestino.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
      qryPlanoDestino.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
      qryPlanoDestino.Open;

      redtVlrDestino.Text := msBuscaSaldos.ValoresChave[11];
      redtQtdDestino.Text := msBuscaSaldos.ValoresChave[4];
      redtPercentual.Text := '100,0000';

      pnlDataTransf.Enabled := False;

   end
   else
   begin
     pnlDestinoGeral.Enabled := False;
     pnlOrigemGeral.Enabled  := False;
     LimpaCampos('');
     if dbDtaTransf.CanFocus then
        dbDtaTransf.SetFocus;
   end;

   pnlOrigemGeral.Enabled := False;

end;

procedure TfrmCadTransfPlanos.dbDtaTransfExit(Sender: TObject);
begin
  inherited;
   LimpaCampos(dbDtaTransf.Text);
   //AL_19
   if ((not dblkTipoCota.Visible) or ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> ''))) then
      VerificaBuscaSaldos;
end;

procedure TfrmCadTransfPlanos.VerificaBuscaSaldos;
begin
   sbtnBuscaSaldos.Enabled := False;
   sbtnBuscaSaldos.Down    := False;
   sbtnInserir.Enabled     := False;
   sbtnInserir.Down        := False;
   //AL_19
   msBuscaSaldos.Filtro.Clear;
   msBuscaSaldos.Filtro.Add('HISTFUNDO.IDHISTFUNDO IN (SELECT MAX(HI.IDHISTFUNDO)' +
                            '    FROM HISTFUNDO HI, TIPOOPERACAO TP ' +
                            '    WHERE     (HI.IDTIPOINVEST      = ' + IntToStr(iTipoInvestUsu) + ')' +
                            '          AND (HI.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro) + ')' +
                            '          AND (HI.DATAMOVFUNDO      = TO_DATE('+ QuotedStr(dbDtaTransf.Text) +  ', ''DD/MM/YYYY''))' +
                            '          AND ((HI.DATAMOVFUNDO     < TO_DATE('+ QuotedStr(dbDtaTransf.Text) + ', ''DD/MM/YYYY'')) OR IDHISTFUNDO < 999999999)' +
                            '          AND (HI.TIPMOVFUNDO      <> ''PIR'') '+
                            '          AND  (HI.IDTIPOOPERACAO   <> -43) '+
                            OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                            '          AND  (HI.IDTIPOCOTA        = '+dblkTipoCota.LookupValue+') ',' ')+
                            '          AND  (TP.IDTIPOINVEST      = HI.IDTIPOINVEST) '+
                            '          AND  (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO) '+
                            '          AND  (TP.NATUREZAOPERACAO <> ''R'') '+
                            '    GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDOINVEST, HI.DATAAPLICACAO, HI.DATAMOVFUNDO, HI.IDTIPOCOTA)');
   msBuscaSaldos.Filtro.Add('HISTFUNDO.SALDOQTDCOTAS > 0');
   msBuscaSaldos.Filtro.Add('COTAFUNDO.IDFUNDOINVEST = HISTFUNDO.IDFUNDOINVEST');
   msBuscaSaldos.Filtro.Add('COTAFUNDO.DATACOTA      = HISTFUNDO.DATAAPLICACAO');
   msBuscaSaldos.Filtro.Add('(HISTFUNDO.IDTIPOINVEST NOT IN (9,10)) OR (COTAFUNDO.IDTIPOCOTA = HISTFUNDO.IDTIPOCOTA)');
   msBuscaSaldos.Filtro.Add('FUNDOINVEST.IDFUNDOINVEST = HISTFUNDO.IDFUNDOINVEST');
   msBuscaSaldos.Filtro.Add('TIPOFUNDOINVEST.IDTIPOINVEST = HISTFUNDO.IDTIPOINVEST');
   msBuscaSaldos.Filtro.Add('TIPOFUNDOINVEST.IDTIPOFUNDOINVEST = FUNDOINVEST.IDTIPOFUNDOINVEST');
   if (((Trim(dbDtaTransf.Text) <> '') and (not dblkTipoCota.Visible)) or
       ((Trim(dbDtaTransf.Text) <> '') and ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')))) then
   begin    
      sbtnBuscaSaldos.Enabled := True;
      sbtnBuscaSaldos.Down    := False;
   end;
end;

procedure TfrmCadTransfPlanos.LimpaCampos(dDataRef : String);
begin
   dbDtaTransf.Text          := dDataRef;
   //AL_19
   dblkTipoCota.Text         := '';
   dblTipoFundoOrigem.Text   := '';
   dblFundoOrigem.Text       := '';
   // Origem
   lblPlanoOrigem.Caption    := '';
   dbDtaAplicacaoOrigem.Text := '';
   dbeCotaAplicOrigem.Text   := '';
   //AL_16
   dbeVlrIOFOrigem.Text      := '';
   dbeVlrIRRFOrigem.Text     := '';
   dbeVlrAplicOrigem.Text    := '';
   dbeQtdOrigem.Text         := '';
   dbeSaldoOrigem.Text       := '';
   dbeVlrcota.Text           := '';
   // Destino
   dblPlanoDestino.Text      := '';
   redtVlrDestino.Text       := '';
   redtQtdDestino.Text       := '';

   memoObs.Text := '';

   //AL_19
end;

procedure TfrmCadTransfPlanos.dblTipoFundoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
//   VerificaBuscaSaldos;
end;

procedure TfrmCadTransfPlanos.dblFundoOrigemCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
//   VerificaBuscaSaldos;
end;

procedure TfrmCadTransfPlanos.bbtnCancelarClick(Sender: TObject);
begin
   LimpaCampos('');
  inherited;
   // Simula o Padrão
   CmeCadastro.Cancel(Self); // Limpa o CachedUpdates
   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.Insert(Self);
   CmeCadastro.AtualizaBotoes(Self);
   sbtnProcurar.Enabled := True;
   //AL_19
   sbtnBuscaSaldos.Enabled := False;
   bbtnConfirmar.Enabled := False;
   sbtnInserir.Enabled := False;
   pnlOrigemGeral.Enabled := False;
   pnlDataTransf.Enabled := True;
end;

procedure TfrmCadTransfPlanos.bbtnConfirmarClick(Sender: TObject);
begin
//  inherited;
   Try
     if not VerificaValores then
        Exit;

     if VerEmAbertura(QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger) then
        Exit;

     //AL_22
     //AL_18 - Ricardo - 01/08/2006
     //Verifica Transferência entre Planos
     {If FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE '+
                        ' IDTIPOINVEST      = '+IntToStr(iTipoInvestUsu)+' AND '+
                        ' IDPLANPREVCTBPATR > 0 AND '+
                        ' IDFUNDOINVEST     = '+QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsString+'  AND '+
                        ' DATAOPERACAO      > TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'') AND '+
                        '((IDTIPOOPERACAO   = -107) OR (IDTIPOOPERACAO   = -108)) ') Then
     begin
        MsgDlg('Existe tranferência para esse Fundo com data superior a data de operação. '+#13+
               'A Operação não será executada!', 'Mensagem do Sistema', mtInformation, [mbOk], 0);
        QryAux.Close;
        Exit;
     end;}
     // Verifica se existem Transferência entre planos posterior a data a ser transferida
     If ufundocomum.VerificaTranferenciaPlanos( iTipoInvestUsu,
                                                QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                                iPlanPrevCtbPatro,
                                                dbDtaTransf.Date) then
     Begin
        MsgDlg('Já há Lançamentos de Transferências entre planos para o Fundo com data superior a data de operação'+'.'#13+
               'A operação não será efetuada!','Mensagem do Sistema',mtWarning,[mbOk],0);
        Exit;
     End; // Fim AL_22

     QryAux.Close;

     Try
       if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

          if not Transfere then
             Raise Exception.Create('Não foi Possível executar a Transferência.');

         dtmBaseDados.dbBaseDados.Commit;

         QryTipoFundoInvest.Close;
         QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=
                                                QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger;
         QryTipoFundoInvest.Open;

         //AL_3
         //AL_12
         //AL_19
         if StrToDate(dbDtaTransf.Text) < QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
         begin
            if Not Reprocessamento(iTipoInvestUsu,
                                   QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                                   QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                   -1,
                                   dbDtaTransf.Date,
                                   QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                   QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime, True,
                                   OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                             QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then                                   
               //AL_11
               MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                      'Mensagem do Sistema', MtInformation,[MbOk],0)
            else
               MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
         end
         else
            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

         QryTipoFundoInvest.Close;
     except
        on E: Exception do
        begin
           DtmBaseDados.dbBaseDados.Rollback;
           MsgDlg('Ocorreu problema na operação ...'+
                  #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
        end;
     end;
   Finally
     LimpaCampos('');
     bbtnCancelarClick(Sender);
   end;
end;

function TfrmCadTransfPlanos.Transfere:boolean;
var
   //Al_13
   fVlrCustoAcoes, fVlrVarAcoes    : Currency;
   iPlano , iPlanilha , iDocumento : Integer;
   iIdForCli, iIdOperacaoFundoOrigem, iIdOperacaoFundoDestino : Integer;
   //AL_20
   sMens: String;
begin
   //AL_20 - Melhora o tratamento de mensgens e erros
   Result     := False;

//AL_20
      iIdForCli := OperComum.BuscaForCli(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                         QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                         -107,
                                         pRPI.IDTIPOCLIENTEEMI);

      // Grava o Resgate (Transferência Saída)
      OperComum.LimpaParametros(QryTipoOperTransf);
      QryTipoOperTransf.ParamByName('IDTIPOOPERACAO').AsInteger := -107;
      QryTipoOperTransf.Open;

      OperComum.LimpaParametros(QryCotaFundo);
      QryCotaFundo.ParamByName('IDFUNDOINVEST').AsInteger := QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger;
      QryCotaFundo.ParamByName('DATACOTA').AsDateTime     := dbDtaTransf.DateTime;
      QryCotaFundo.Open;
      //Baixa
      //Alt_6
      //AL_19
      if not GravaOperacaoFundo(StrToInt(msBuscaSaldos.ValoresChave[7]),
                                QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                -1, -107, QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1, iPlanPrevCtbPatro,
                                dbDtaTransf.DateTime, dbDtaTransf.DateTime, dbDtaTransf.DateTime,
                                redtVlrDestino.Value,
                                //AL_16
                                OperComum.Round(OperComum.DivValorZero(
                                (dbeVlrIRRFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                                OperComum.Round(OperComum.DivValorZero(
                                (dbeVlrIOFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                                OperComum.Round(OperComum.DivValorZero((fVlrVar *  redtQtdDestino.Value),
                                                        dbeQtdOrigem.value),2),
                                redtQtdDestino.Value,
                                QryCotaFundo.FieldByName('VLRCOTA').AsFloat, iIdOperacaoFundoOrigem,
                                OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                          QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
         Raise Exception.Create('Não foi Possível gravar a Operação de Origem.');

      //Alt_2
      //AL_19
      //AL_20
      If Not AlimentaFundo(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                           -107,
                           QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                           iPlanoPrevContab,
                           iPatrocinadora,
                           iIdOperacaoFundoOrigem,
                           StrToInt(msBuscaSaldos.ValoresChave[7]),
                           QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger,
                           QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           //Al_13
                           -1,
                           StrToDate(msBuscaSaldos.ValoresChave[3]),
                           dbDtaTransf.Date,
                           dbDtaTransf.Date,
                           redtQtdDestino.Value,
                           dbeCotaAplicOrigem.Value,
                           redtVlrDestino.Value,
                           //AL_16
                           OperComum.Round(OperComum.DivValorZero(
                           (dbeVlrIRRFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                           OperComum.Round(OperComum.DivValorZero(
                           (dbeVlrIOFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                           QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
                           Trim(QryTipoOperTransf.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString,
                           'TRP', True,
                           iPlanPrevCtbPatro,-1, -1, 0, sMens,
                           OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                      QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                           0, 0,
                           (dbeSaldoOrigem.Value - OperComum.DivValorZero((dbeSaldoOrigem.Value *  redtQtdDestino.Value),
                                                                          dbeQtdOrigem.value))) Then
      begin
         //AL_20
         if sMens <> '' then
            Raise Exception.Create('Não foi possível confirmar a operação Origem' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível confirmar a operação Origem' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');
      end;

      iPlano         := -1;
      iPlanilha      := -1;
      iDocumento     := -1;
      fVlrCustoAcoes := 0;
      fVlrVarAcoes   := 0;

      //Al_7
      If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
            -107,
            QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
            QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
            iIdForCli,
            QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
            StrToDate(dbDtaTransf.Text),
            StrToDate(dbDtaTransf.Text),
            'OPE', QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
            QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString+' / '+sPlanPrevCtbPatro,
            True,
            redtVlrDestino.Value,
            //AL_16
            OperComum.Round(OperComum.DivValorZero(
            (dbeVlrIRRFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
            0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
            //Al_15
            //Al_19
            OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                      QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
            0{fVlrUsufruto}, 0{fVlrVarFDIC}, 0{fVlrTxPerf},
            0{iFlgContaInvest}, 0{wiPlanoPrevContab}, 0{wiPatrocinadora},
            //AL_16
            OperComum.Round(OperComum.DivValorZero(
            (dbeVlrIOFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2)*-1) Then
         Raise Exception.Create('Não foi Possível Contabilizar a Operação de Origem.');

      //Al_8
      With DmFundoComum.QryUpdOpeFinCtb Do
      Begin
        Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
        ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoOrigem;
        ParamByName('PLANO').AsInteger             := iPlano;
        ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
        ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
        ExecSQL;
      End;

      //Al_13
      iIdForCli := OperComum.BuscaForCli(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                         QryFundoOrigem.FieldByName('IDGESTORCARTEIRA').AsInteger,
                                         -108,
                                         pRPI.IDTIPOCLIENTEEMI);

      // Grava Aplicação (Transferência Entrada)
      OperComum.LimpaParametros(QryTipoOperTransf);
      QryTipoOperTransf.ParamByName('IDTIPOOPERACAO').AsInteger := -108;
      QryTipoOperTransf.Open;
       //Al_4
       //Acrescimo
      if not GravaOperacaoFundo(StrToInt(msBuscaSaldos.ValoresChave[7]),
                                QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                                -1, -108,
                                QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                                -1,
                                qryPlanoDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                dbDtaTransf.DateTime, dbDtaTransf.DateTime, dbDtaTransf.DateTime,
                                redtVlrDestino.Value,
                                //AL_16
                                OperComum.Round(OperComum.DivValorZero(
                                (dbeVlrIRRFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                                OperComum.Round(OperComum.DivValorZero(
                                (dbeVlrIOFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                                OperComum.Round(OperComum.DivValorZero((fVlrVar *  redtQtdDestino.Value),
                                                        dbeQtdOrigem.value),2),
                                redtQtdDestino.Value,
                                QryCotaFundo.FieldByName('VLRCOTA').AsFloat,
                                //AL_19
                                iIdOperacaoFundoDestino,
                                OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                          QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
         Raise Exception.Create('Não foi Possível gravar a Operação de Destino.');

      //Al_4
      //AL_1
      //A_20
      if not AlimentaFundo(QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
                           -108,
                           QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
                           QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
                           qryPlanoDestino.FieldByName('IDPLANOPREV').AsInteger,
                           qryPlanoDestino.FieldByName('IDPATRO').AsInteger,
                           iIdOperacaoFundoDestino,
                           StrToInt(msBuscaSaldos.ValoresChave[7]),
                           QryFundoOrigem.FieldByName('QTDDECVALOR').AsInteger,
                           QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
                           //Al_13
                           -1,
                           StrToDate(msBuscaSaldos.ValoresChave[3]),
                           dbDtaTransf.DateTime,
                           StrToDate(msBuscaSaldos.ValoresChave[23]),
                           redtQtdDestino.Value,
                           dbeCotaAplicOrigem.Value,
                           redtVlrDestino.Value,
                           //AL_16
                           OperComum.Round(OperComum.DivValorZero(
                           (dbeVlrIRRFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                           OperComum.Round(OperComum.DivValorZero(
                           (dbeVlrIOFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
                           'A',
                           Trim(QryTipoOperTransf.FieldByName('DESCTIPOOPERACAO').AsString)+' / '+
                                QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString,
                           'TRP', True,
                           qryPlanoDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger,-1,-1,
                           OperComum.DivValorZero((fVlrVar *  redtQtdDestino.Value),
                                                   dbeQtdOrigem.value), sMens,
                           //AL_19
                           OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                           QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
                           OperComum.DivValorZero((dbeVlrAplicado.Value *  redtQtdDestino.Value),
                                                   dbeQtdOrigem.value),
                           OperComum.DivValorZero((dbeVlrCusto.Value *  redtQtdDestino.Value),
                                                   dbeQtdOrigem.value)) Then
      begin
         //AL_20
         if sMens <> '' then
            Raise Exception.Create('Não foi possível confirmar a operação Destino' + #13 +
                                   'Mensagem: ' + sMens)
         else
            Raise Exception.Create('Não foi possível confirmar a operação Destino' + #13 +
                                   'Ocorreu um problema durante o processo de gravação' + #13 +
                                   'Refaça a operação');
      end;

      iPlano         := -1;
      iPlanilha      := -1;
      iDocumento     := -1;
      fVlrCustoAcoes := 0;
      fVlrVarAcoes   := 0;

      //Al_7
      //Al_14

      If Not ContabilizacaoFinanceiro(iPlano, iPlanilha, iDocumento,
            -108,
            QryTipoFundoOrigem.FieldByName('IDTIPOINVEST').AsInteger,
            QryFundoOrigem.FieldByName('IDCARTEIRAINVEST').AsInteger,
            QryFundoOrigem.FieldByName('IDTIPOFUNDOINVEST').AsInteger,
            iIdForCli,
            QryFundoOrigem.FieldByName('IDFUNDOINVEST').AsInteger,
            StrToDate(dbDtaTransf.Text),
            StrToDate(dbDtaTransf.Text),
            'OPE', QryTipoOperTransf.FieldByName('NATUREZAOPERACAO').AsString,
            QryFundoOrigem.FieldByName('DESCFUNDOINVEST').AsString+' / '+
            QryPlanoDestino.FieldByName('PLANPRVCONTABPATRO').AsString,
            True,
            redtVlrDestino.Value,
            //AL_16
            OperComum.Round(OperComum.DivValorZero(
                           (dbeVlrIRRFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2),
            0, 0, 0, fVlrCustoAcoes, fVlrVarAcoes,
            //Al_15
            //AL_19
            OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                      QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1),
            0{fVlrUsufruto}, 0{fVlrVarFDIC}, 0{fVlrTxPerf},
            0{iFlgContaInvest},
            qryPlanoDestino.FieldByName('IDPLANOPREV').AsInteger,
            qryPlanoDestino.FieldByName('IDPATRO').AsInteger,
            //AL_16
            OperComum.Round(OperComum.DivValorZero(
                           (dbeVlrIOFOrigem.Value *  redtQtdDestino.Value), dbeQtdOrigem.value),2)) Then
         Raise Exception.Create('Não foi Possível Contabilizar a Operação de Destino.');

      With DmFundoComum.QryUpdOpeFinCtb Do
      Begin
        Opercomum.LimpaParametros(DmFundoComum.QryUpdOpeFinCtb);
        ParamByName('IDOPERACAOFUNDO').AsInteger   := iIdOperacaoFundoDestino;
        ParamByName('PLANO').AsInteger             := iPlano;
        ParamByName('PLNCODIGO').AsInteger         := iPlanilha;
        ParamByName('CODDOCUMENTO').AsInteger      := iDocumento;
        ExecSQL;
      End;

      //AL_20
      Result := True;

      //Al_13
end;

function TfrmCadTransfPlanos.VerificaValores:boolean;
begin
   Result := True;
   if Trim(dbDtaTransf.Text) = '' then
   begin
      MsgDlg('Data da tranferência não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end
   // AL_8
   //AL_17
   else if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo, 'Mensagem do Sistema', mtWarning, [mbOk], 0);
      Result := False;
      Exit;
   end
   else if Trim(dblTipoFundoOrigem.Text) = '' then
   begin
      MsgDlg('Tipo de Fundo de Investimento não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end
   else if Trim(dblFundoOrigem.Text) = '' then
   begin
      MsgDlg('Fundo de Investimento Origem não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end
   else if Trim( redtVlrDestino.Text) = '' then
   begin
      MsgDlg('Valor a ser Transferido não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end
   else if Trim(redtQtdDestino.Text) = '' then
   begin
      MsgDlg('Quantidade a ser Transferida não informada.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end
   else if Trim(dblPlanoDestino.Text) = '' then
   begin
      MsgDlg('O Plano de Destino não informado.','Mensagem do Sistema',MtWarning,[MbOk],0);
      Result := False;
      Exit;
   end
   else
   begin
      // Verifica se já houve Tranf. do Certificado no Dia
      QryAux.SQL.Clear;
      //AL_19
      QryAux.SQL.Add('SELECT DATAAPLICACAO FROM HISTFUNDO WHERE ');
      QryAux.SQL.Add('       IDTIPOINVEST      = ' + IntToStr(iTipoInvestUsu));
      QryAux.SQL.Add(' AND IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevCtbPatro));
      QryAux.SQL.Add(' AND   IDFUNDOINVEST     = ' + dblFundoOrigem.LookupValue);
      QryAux.SQL.Add(' AND   DATAAPLICACAO     = ' + QuotedStr(msBuscaSaldos.ValoresChave[3]));
      QryAux.SQL.Add(' AND   DATAMOVFUNDO     >= ' + QuotedStr(dbDtaTransf.Text));
      QryAux.SQL.Add(' AND ((IDTIPOOPERACAO = -107) OR (IDTIPOOPERACAO = -108))');
      QryAux.Open;
      if not qryAux.IsEmpty then
      begin
         MsgDlg('Já existe transferência nesta Data para este Certificado.','Mensagem do Sistema',MtWarning,[MbOk],0);
         Result := False;
         Exit;
      end;
      QryAux.Close;
   end;
end;

procedure TfrmCadTransfPlanos.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   sbtnInserir.Enabled := False;
   LimpaCampos('');
   if MontaSelect.RetornouValor then
   begin
      dbDtaTransf.Text          := MontaSelect.ValoresChave[1];
      //AL_19      
      dblTipoFundoOrigem.Text   := MontaSelect.ValoresChave[6];
      dblTipoFundoOrigem.PerformSearch;
      if dblkTipoCota.Visible then
      begin
         dblkTipoCota.Text      := MontaSelect.ValoresChave[15];
         dblkTipoCota.PerformSearch;
      end;
      dblFundoOrigem.Text       := MontaSelect.ValoresChave[7];
      dblFundoOrigem.PerformSearch;

      // Origem
      lblPlanoOrigem.Caption    := sPlanPrevCtbPatro;
      dbDtaAplicacaoOrigem.Text := MontaSelect.ValoresChave[1];
      //AL_16
      dbeCotaAplicOrigem.Text   := ' ';
      dbeVlrAplicOrigem.Text    := MontaSelect.ValoresChave[3];
      dbeQtdOrigem.Text         := MontaSelect.ValoresChave[2];
      //AL_16
      dbeSaldoOrigem.Text       := FloatToStr(OperComum.Round((StrToFloat(MontaSelect.ValoresChave[4])*StrToFloat(MontaSelect.ValoresChave[2])),2));
      dbeVlrcota.Text           := MontaSelect.ValoresChave[4];

      dbeVlrIRRFOrigem.Text     := MontaSelect.ValoresChave[13];
      dbeVlrIOFOrigem.Text      := MontaSelect.ValoresChave[14];

      // Destino
      OperComum.LimpaParametros(qryBuscaOperDestino);
      //AL_16
      qryBuscaOperDestino.ParamByName('IDOPERACAOFUNDO').AsInteger := StrToInt(MontaSelect.ValoresChave[12]);
      qryBuscaOperDestino.Open;

      qryPlanoDestino.Close;
      qryPlanoDestino.SQL.Clear;
      qryPlanoDestino.SQL.Add('SELECT IDPLANPREVCTBPATR, (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO');
      qryPlanoDestino.SQL.Add('FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL');
      qryPlanoDestino.SQL.Add('WHERE (PA.IDPLANPREVCTBPATR = ' + IntToStr(qryBuscaOperDestinoIDPLANPREVCTBPATR.AsInteger) +') AND');
      qryPlanoDestino.SQL.Add('(PA.IDPATRO = PE.IDPESSOA(+)) AND');
      qryPlanoDestino.SQL.Add('(PA.IDPLANOPREV = PL.IDPLANOPREV)');
      qryPlanoDestino.Open;
      dblPlanoDestino.LookupValue := IntToStr(qryPlanoDestino.FieldByName('IDPLANPREVCTBPATR').AsInteger);
      dblPlanoDestino.Text        := qryPlanoDestino.FieldByName('PLANPRVCONTABPATRO').AsString;
      OperComum.PosicionaWWLookUpQry(dblPlanoDestino, qryPlanoDestino);
      qryPlanoDestino.Close;

      redtVlrDestino.Value := qryBuscaOperDestinoVLROPERACAO.AsFloat;
      redtQtdDestino.Value := qryBuscaOperDestinoQTDOPERACAO.AsFloat;
      //AL_16
      redtPercentual.Text  := FloatToStr(OperComum.Round(OperComum.DivValorZero(qryBuscaOperDestinoQTDOPERACAO.AsFloat, StrToFloat(MontaSelect.ValoresChave[2]))*100,4));

      bbtnCancelar.Enabled := True;
   end
   else
   begin
      pnlDestinoGeral.Enabled := False;
      pnlOrigemGeral.Enabled  := False;
      if dbDtaTransf.CanFocus then
         dbDtaTransf.SetFocus;

      sbtnApagar.Enabled := False;
      bbtnCancelarClick(Sender);
   end;
end;

procedure TfrmCadTransfPlanos.redtPercentualExit(Sender: TObject);
begin
  inherited;
   if redtPercentual.Value = 0 then
      redtPercentual.Text := '100,000';

   if redtPercentual.Value > 100 then
   begin
      MsgDlg('O percentual não pode ser superior a 100%.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtPercentual.Text := '100,000';
      if redtPercentual.CanFocus then
         redtPercentual.SetFocus;
   end
   else if redtPercentual.Value = 100 then
   begin
      redtQtdDestino.Value := StrToFloat(msBuscaSaldos.ValoresChave[4]);
      redtVlrDestino.Value := StrToFloat(msBuscaSaldos.ValoresChave[11]);
   end
   else
   begin
      redtQtdDestino.Value := OperComum.Round(OperComum.DivValorZero(
                          (redtPercentual.Value * StrToFloat(msBuscaSaldos.ValoresChave[4])),100),
                                             QryFundoOrigem.FieldByName('QTDDECQTD').AsInteger);
      redtVlrDestino.Value := OperComum.Round(OperComum.DivValorZero((redtPercentual.Value * StrToFloat(msBuscaSaldos.ValoresChave[11])),100),2);
   end;

end;

procedure TfrmCadTransfPlanos.redtQtdDestinoExit(Sender: TObject);
var
   fSaldo : Double;
begin
  inherited;
   //Alt_3
   fSaldo := StrToFloat(msBuscaSaldos.ValoresChave[4]);
   if redtQtdDestino.Value > fSaldo then
   begin
      MsgDlg('Quantidade maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtQtdDestino.Value := fSaldo;
      if redtQtdDestino.CanFocus then
         redtQtdDestino.SetFocus;
   end
   else if redtQtdDestino.Value = fSaldo then
   begin
      redtPercentual.Text := '100,0000';
      redtQtdDestino.Value := fSaldo;
      redtVlrDestino.Value := StrToFloat(msBuscaSaldos.ValoresChave[11]);
   end
   else if redtQtdDestino.Value <> fSaldo then
   begin
      redtVlrDestino.Value  := OperComum.Round(OperComum.DivValorZero((redtQTDDestino.Value * StrToFloat(msBuscaSaldos.ValoresChave[11])),fSaldo),2);
      redtPercentual.Text   := FloatToStr(OperComum.Round(OperComum.DivValorZero((redtQTDDestino.Value * 100),fSaldo),4));
   end;
   //Alt_3
end;

procedure TfrmCadTransfPlanos.redtVlrDestinoExit(Sender: TObject);
var
  fSaldo : Double;
begin
  inherited;
   //Alt_3
   fSaldo := StrToFloat(msBuscaSaldos.ValoresChave[11]);
   if redtVlrDestino.Value > fSaldo then
   begin
      MsgDlg('Valor maior que o Saldo do Investimento.','Mensagem do Sistema',mtWarning,[MbOk],0);
      redtVlrDestino.Value := fSaldo;
      if redtVlrDestino.CanFocus then
         redtVlrDestino.SetFocus;
   end
   else if redtVlrDestino.Value = fSaldo then
   begin
      redtPercentual.Text := '100,0000';
      redtQtdDestino.Value := StrToFloat(msBuscaSaldos.ValoresChave[4]);
      redtVlrDestino.Value := fSaldo;
   end
   else if redtVlrDestino.Value <> fSaldo then
   begin
      redtQTDDestino.Value := OperComum.Round(OperComum.DivValorZero(
                    (redtVlrDestino.Value * StrToFloat(msBuscaSaldos.ValoresChave[4])),fSaldo),
                                              QryFundoOrigem.FieldByName('QTDDECQTD').AsInteger);
      redtPercentual.Text  := FloatToStr(OperComum.Round(OperComum.DivValorZero((redtVlrDestino.Value * 100),fSaldo),4));
   end;
   //Alt_3
end;

procedure TfrmCadTransfPlanos.sbtnApagarClick(Sender: TObject);
var wStr : string;
    //AL_21
    iIdOperacao : Integer;
begin
//   inherited;
   if not VerificaFechamentoOperacao(dbDtaTransf.Text) then
      Exit;

   if VerEmAbertura(StrToInt(MontaSelect.ValoresChave[9])) then
      Exit;

   //AL_8
   //AL_17
   if not CtrlInvContab.TestaPeriodo(dbDtaTransf.Text, iTipoInvestUsu) then
   begin
      MsgDlg(CtrlInvContab.MessageInfo,'Mensagem do Sistema',mtInformation,[mbOK],0);
      Exit;
   end;

   Try
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
      //AL_10
      //ORIGEM
      FazQuery(QryAux,'SELECT PLANO, PLNCODIGO, CODDOCUMENTO FROM OPERACAOFUNDO WHERE IDTIPOOPERACAO IN (-107,-108) AND '+
                      'DATAOPERACAO     = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')'+' AND '+
                      'IDOPERACAOORIGEM = '+ MontaSelect.ValoresChave[12]);

      While Not QryAux.Eof do
      begin
         // Exclui Contábil/Financeiro da operação do Fundo - Origem
         if not ProcExcluiFundo(QryAux.FieldByName('CODDOCUMENTO').AsInteger,
                                QryAux.FieldByName('PLNCODIGO').AsInteger,
                                QryAux.FieldByName('PLANO').AsInteger,
                                iTipoInvestUsu,
                                dbDtaTransf.Date, True) Then
         begin
            MsgDlg('Não foi possível excluir a integração Contábil e Financeira.','Mensagem do Sistema',mtInformation,[mbOk],0);
            DtmBaseDados.dbBaseDados.Rollback;
            QryAux.Close;
            Exit;
         end;
         QryAux.Next;
      end;

      qryExcluiIRLitigio.Close;
      qryExcluiIRLitigio.ParamByName('IDOPERACAOFUNDO').AsInteger           := StrToInt(MontaSelect.ValoresChave[0]);
      qryExcluiIRLitigio.ExecSQL;

      //AL_21
      FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                      ' IDTIPOOPERACAO = -107 AND DATAOPERACAO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')'+' AND '+
                      ' IDOPERACAOORIGEM = '+ MontaSelect.ValoresChave[12]);
      //AL_21
      iIdOperacao := QryAux.FieldByName('IDOPERACAOFUNDO').AsInteger;

      //ORIGEM
      ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'IDPLANPREVCTBPATR  = '+IntToStr(iPlanPrevCtbPatro)+' AND '+
                          'IDFUNDOINVEST      = '+MontaSelect.ValoresChave[8]+' AND '+
                          'DATAMOVFUNDO       = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')'+' AND '+
                          'IDTIPOOPERACAO     = -107 AND '+
                          'IDOPERACAOFUNDO    = '+IntToStr(iIdOperacao));//AL_21

      //AL_21
      FazQuery(QryAux,'SELECT IDOPERACAOFUNDO FROM OPERACAOFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                      ' IDTIPOOPERACAO = -108 AND DATAOPERACAO = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')'+' AND '+
                      ' IDOPERACAOORIGEM = '+ MontaSelect.ValoresChave[12]);
      //AL_21
      iIdOperacao := QryAux.FieldByName('IDOPERACAOFUNDO').AsInteger;

      //DESTINO
      ExecutaQuery(QryAux,'DELETE FROM HISTFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'IDPLANPREVCTBPATR  > 0 AND '+
                          'IDFUNDOINVEST      = '+MontaSelect.ValoresChave[8]+' AND '+
                          'DATAMOVFUNDO       = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')'+' AND '+
                          'IDTIPOOPERACAO     = -108 AND '+
                          'IDOPERACAOFUNDO    = '+IntToStr(iIdOperacao));//AL_21

      //DESTINO - ORIGEM
      ExecutaQuery(QryAux,'DELETE FROM OPERACAOFUNDO WHERE IDTIPOINVEST = '+IntToStr(iTipoInvestUsu)+' AND '+
                          'IDTIPOOPERACAO IN (-107,-108) AND '+
                          'DATAOPERACAO     = TO_DATE('+QuotedStr(dbDtaTransf.Text)+',''DD/MM/YYYY'')'+' AND '+
                          'IDOPERACAOORIGEM = '+ MontaSelect.ValoresChave[12]);

      DtmBaseDados.dbBaseDados.Commit;

      //Al_15
      QryTipoFundoInvest.Close;
      QryTipoFundoInvest.ParamByname('IDTIPOFUNDOINVEST').AsInteger :=StrToInt(MontaSelect.ValoresChave[9]);
      QryTipoFundoInvest.Open;
      //AL_10 - Fim

      //AL_9
      if StrToDate(dbDtaTransf.Text) <= QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime Then
      begin
         //Al_15
         if Not Reprocessamento(iTipoInvestUsu,
                                StrToInt(MontaSelect.ValoresChave[9]),
                                StrToInt(MontaSelect.ValoresChave[8]),
                                -1,
                                dbDtaTransf.Date,
                                QryTipoFundoInvest.FieldByName('DATAULTFECH').AsDateTime,
                                QryFundoOrigem.FieldByName('DTAINIPROC').AsDateTime, True,
                                //AL_19
                                OperComum.IIF(((dblkTipoCota.Visible) And (Trim(dblkTipoCota.Text) <> '')),
                                          QryTipoCota.FieldByName('IDTIPOCOTA').AsInteger, -1)) Then
            //AL_11
            MsgDlg('Atenção : Não foi possível efetuar o Reprocessamento para esse Fundo!',
                   'Mensagem do Sistema', MtInformation,[MbOk],0)
         else
            MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);
      end
      else
         MsgDlg('Operação Concluida com Sucesso.','Mensagem do Sistema', MtConfirmation,[MbOk],0);

      QryTipoFundoInvest.Close;
   Except
      Raise;
         //AL_10 
         if dtmBaseDados.dbBaseDados.InTransaction then
            DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Não foi possível Excluir esta Transferência.','Mensagem do Sistema',mtInformation,[mbOK],0);
   end;
   sbtnApagar.Enabled := False;
   bbtnCancelarClick(Sender);
end;

procedure TfrmCadTransfPlanos.FormCreate(Sender: TObject);
begin
   inherited;

   if (TForm(Sender).Height > FrmPrincipal.ClientHeight - 50{Tamanho da barra de tarefas e barra de staus}) or
      (TForm(Sender).Width > FrmPrincipal.ClientWidth - 4 {Margem de segurança}) then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;    

end;

//AL_19
procedure TfrmCadTransfPlanos.dblkTipoCotaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   bModif := modified;
   if modified then
   begin
      if (Trim(dblkTipoCota.Text) <> '') then
         VerificaBuscaSaldos;
   end;
end;

//AL_19
procedure TfrmCadTransfPlanos.dblkTipoCotaExit(Sender: TObject);
begin
  inherited;
   if not bModif then
   begin
      if ((dblkTipoCota.Visible) and (Trim(dblkTipoCota.Text) <> '')) then
         VerificaBuscaSaldos;
   end;
   bModif := false;
end;

end.



