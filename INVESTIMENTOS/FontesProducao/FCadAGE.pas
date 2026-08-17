//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 29/04/2005
// Código   : AL_9
// Motivo   : A exclusao de boleta so será feita quando a mesma for um Anuncio de Proventos
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 25/01/2005
// Código   : AL_8
// Motivo   : Alterada a critica para primeiro fazer o anuncio e podendo agora continuar
//            com a operação
//******************************************************************************
// Autor    : Lucas Barth Pacini
// Data     : 09/12/2004
// Código   : AL_7
// Motivo   : Inclusão do campo Data de Vencimento.
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 08/12/2004
// Código   : AL_6
// Motivo   : Implementada a critica para primeiro fazer o anuncio da operação
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 02/12/2004
// Código   : AL_5
// Motivo   : Retirada a critica da contab/financ, para exclusão da AGE
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 26/10/2004
// Código   : AL_4
// Motivo   : Implementação da exclusao de boleta pelo idoperacaodireito
//******************************************************************************
// Autor    : Ricardo Cristiano
//Data	    : 25/10/2004
//Código    : Qry
//Motivo(S) : Implementação do campo FLGTIPODIREITO.
//******************************************************************************
// Autor    : Ricardo Cristiano
//Data	    : 22/10/2004
//Código    : Qry
//Motivo(S) : Alteração do parâmetro P_IDOPERACAORIREITO para IDOPERACAORIREITO
//******************************************************************************
// Autor    : Ricardo Cristiano
//Data	    : 22/10/2004
//Código    : AL_3
//Motivo(S) : Tratamento para o lançamento seguido de AGE
//******************************************************************************
// Autor    : Ricardo Cristiano
//Data	    : 22/10/2004
//Código    : AL_2
//Motivo(S) : Acerto para o tratamento de Anúncio e a efetivação da Operação.
//******************************************************************************
// Autor    : Ricardo Cristiano
// Data     : 14/10/2004
// Código   : AL_1
// Motivo   : Implementação do comparador de valores
//******************************************************************************

unit FCadAGE;

interface
                         
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, Mask, DBCtrls,
  TREdit, ComCtrls,uOperacaoInvest, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, FPreview;

type
  TfrmCadAGE = class(TfrmCadastroCS)
    dblTipoOperacao: TwwDBLookupCombo;
    Label2: TLabel;
    dbdAGE: TCMDateTimePicker;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    dbdEX: TCMDateTimePicker;
    dbdCOM: TCMDateTimePicker;
    Label12: TLabel;
    dbeFormaPagRec: TDBEdit;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoIDTIPOINVEST: TFloatField;

    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    DsOperDireitoXinv: TwwDataSource;
    UpdOperDireitoXinv: TUpdateSQL;
    QryOrigemDestino: TwwQuery;
    QryInvestimentoAcao: TwwQuery;
    QryInvestimentoAcaoDESCINVESTIMENTO: TStringField;
    QryInvestimentoAcaoIDTIPOINVEST: TFloatField;
    QryInvestimentoAcaoIDEMISSOR: TFloatField;
    QryInvestimentoAcaoIDINVESTIMENTO: TFloatField;
    qryTipoOperacaoFLGAGE: TStringField;
    qryTipoOperacaoFLGDATAEX: TStringField;
    qryTipoOperacaoFLGDATACOM: TStringField;
    qryTipoOperacaoFLGPRZBOLSA: TStringField;
    qryTipoOperacaoFLGPRZEMP: TStringField;
    qryTipoOperacaoFLGATADEC: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC: TStringField;
    qryTipoOperacaoFLGDIVACAO: TStringField;
    qryTipoOperacaoFLGINIPAG: TStringField;
    qryTipoOperacaoFLGFORMAPAGREC_1: TStringField;
    qryTipoOperacaoFLGJUROS: TStringField;
    qryTipoOperacaoFLGPARIDADE: TStringField;
    qryTipoOperacaoFLGINVORIGEM: TStringField;
    qryTipoOperacaoFLGPERC: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryIDOPERACAODIREITO: TFloatField;
    D: TFloatField;
    qryDATAAGE: TDateTimeField;
    qryDATAEX: TDateTimeField;
    qryDATACOM: TDateTimeField;
    qryPERCENTUAL: TFloatField;
    qryPARIDADE: TFloatField;
    qryPRZBOLSA: TDateTimeField;
    qryPRZEMPRESA: TDateTimeField;
    qryATADECISAO: TDateTimeField;
    qryFORMAPAGREC: TStringField;
    qryDIVPORACAO: TFloatField;
    qryINIPAGTO: TDateTimeField;
    qryJUROSCAP: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    Label3: TLabel;
    dblEmissor: TwwDBLookupCombo;
    QryEmissor: TwwQuery;
    QryEmissorIDEMISSOR: TFloatField;
    QryEmissorSIGLAEMISSOR: TStringField;
    qryIDEMISSOR: TFloatField;
    QryAux: TwwQuery;
    pgcAge: TPageControl;
    tbsDireitos: TTabSheet;
    tbsObservacao: TTabSheet;
    Label1: TLabel;
    dbdPrazoBolsa: TCMDateTimePicker;
    Label8: TLabel;
    dbdPrazoEmpresa: TCMDateTimePicker;
    Label11: TLabel;
    dbdAtaDecisao: TCMDateTimePicker;
    Label14: TLabel;
    dbeIniPagto: TCMDateTimePicker;
    Label13: TLabel;
    dbeDivPorAcao: TDBRealEdit;
    Label7: TLabel;
    dbePercentual: TDBRealEdit;
    Label10: TLabel;
    dbeParidade: TDBRealEdit;
    dbmObservacao: TDBMemo;
    qryOBSERVACAO: TMemoField;
    dbcIsentoIr: TDBCheckBox;
    dbcIRLitigio: TDBCheckBox;
    qryISENCAOIR: TStringField;
    qryIRLITIGIO: TStringField;
    sbtnOrigem: TToolbarButton97;
    sbtnSubscricao: TToolbarButton97;
    QryOrigemDestinoSTATUS: TStringField;
    QryOrigemDestinoIDORIGEM: TStringField;
    Panel1: TPanel;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtIncDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtDelDet: TSpeedButton;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Panel3: TPanel;
    Dock973: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    QryBuscaOperDireito: TwwQuery;
    qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperacaoFLGISENTOIR: TStringField;
    qryOperacaoDireito: TwwQuery;
    qryOperacaoDireitoIDOPERACAODIREITO: TFloatField;
    qryOperacaoDireitoDATACOM: TDateTimeField;
    qryOperacaoDireitoDATAEX: TDateTimeField;
    qryOperacaoDireitoISENCAOIR: TStringField;
    qryOperacaoDireitoIRLITIGIO: TStringField;
    qryOperacaoDireitoIDTIPOOPERACAO: TFloatField;
    qryOperacaoDireitoDIVPORACAO: TFloatField;
    qryOperacaoDireitoSTATUS: TStringField;
    qryOperacaoDireitoIDEMISSOR: TFloatField;
    qryOperacaoDireitoPERCENTUAL: TFloatField;
    qryPrint: TwwQuery;
    qryPrintDESCINVESTIMENTO: TStringField;
    qryPrintDESCCARTINVEST: TStringField;
    qryPrintSGLCUSTODIANTE: TStringField;
    qryPrintSIGLAMOTBLOQ: TStringField;
    qryPrintIDLOTE: TStringField;
    qryPrintDATAREFERENCIA: TDateTimeField;
    qryPrintQTDE: TFloatField;
    qryPrintQTDEDIREITO: TFloatField;
    qryPrintVALOREXERCIDO: TFloatField;
    qryPrintVLRREMUNERACAO: TFloatField;
    qryPrintIR: TFloatField;
    qryPrintVLRLIQ: TFloatField;
    qryPrintVLRIRREMUNERACAO: TFloatField;
    qryPrintIDCARTEIRAINVEST: TFloatField;
    qryPrintIDINVESTIMENTO: TFloatField;
    qryPrintIDCUSTODIANTE: TFloatField;
    qryPrintIDMOTIVOBLOQUEIO: TFloatField;
    qryPrintPERCENTUALINV: TFloatField;
    qryPrintVLRCUSTOATUAL: TFloatField;
    qryPrintVLRCUSTO: TFloatField;
    dsPrint: TwwDataSource;
    updPrint: TUpdateSQL;
    QryLote: TwwQuery;
    qryFilha: TwwQuery;
    qryFilhaACAO: TStringField;
    qryFilhaSGLCUSTODIANTE: TStringField;
    qryFilhaIDLOTE: TStringField;
    qryFilhaQTDEDIREITO: TFloatField;
    qryFilhaQTDENOVA: TFloatField;
    qryFilhaVALOREXERCIDO: TFloatField;
    qryFilhaVLRCUSTO: TFloatField;
    qryFilhaPERCCUSTO: TFloatField;
    qryFilhaDESCINVESTIMENTO: TStringField;
    qryFilhaIDCARTEIRAINVEST: TFloatField;
    qryFilhaIDCUSTODIANTE: TFloatField;
    qryFilhaIDMOTIVOBLOQUEIO: TFloatField;
    qryFilhaIDINVESTIMENTO: TFloatField;
    qryFilhaPERCENTUALINV: TFloatField;
    qryFilhaIDOPERACAODIREITO: TFloatField;
    dtsFilha: TwwDataSource;
    updFilha: TUpdateSQL;
    QryOperacaoInvest: TwwQuery;
    QryOperacaoInvestVLRREMUNERACAO: TFloatField;
    QryOperacaoInvestVLRIRREMUNER: TFloatField;
    QryOperacaoInvestQTDEOPERACAO: TFloatField;
    QryBuscaInvestimento: TwwQuery;
    QryBuscaInvestimentoIDINVESTIMENTO: TFloatField;
    QryBuscaInvestimentoIDMOEDACONTAB: TFloatField;
    QryBuscaInvestimentoIDEMISSOR: TFloatField;
    QryBuscaInvestimentoIDTIPOINVEST: TFloatField;
    QryBuscaInvestimentoDESCINVESTIMENTO: TStringField;
    QryBuscaInvestimentoCODTIPOACAO: TStringField;
    QryBuscaInvestimentoMOECODIGO: TFloatField;
    QryBuscaInvestimentoQTDELOTE: TFloatField;
    QryBuscaInvestimentoIDBOLSAVALORES: TFloatField;
    QryAcao: TwwQuery;
    QryOperDireitoXinv: TwwQuery;
    QryOperDireitoXinvDESCINVESTIMENTO: TStringField;
    QryOperDireitoXinvPERCENTUALINV: TFloatField;
    QryOperDireitoXinvSTATUS: TStringField;
    QryOperDireitoXinvX: TStringField;
    QryOperDireitoXinvORIGDEST: TStringField;
    QryOperDireitoXinvIDINVESTIMENTO: TFloatField;
    QryOperDireitoXinvIDOPERDIREITOXINV: TFloatField;
    QryOperDireitoXinvIDOPERACAODIREITO: TFloatField;
    sbtnOpercoesDireito: TToolbarButton97;
    qrySTATUS: TStringField;
    sbtnProvisiona: TToolbarButton97;
    qryPLNCODIGO: TFloatField;
    qryCODDOCUMENTO: TFloatField;
    qryPLANO: TFloatField;
    qryCartGerenc: TwwQuery;
    qryCartGerencIDCARTEIRAGERENC: TFloatField;
    qryCartGerencDESCCARTGERENC: TStringField;
    qryCartInvest: TwwQuery;
    qryCartInvestIDCARTEIRAINVEST: TFloatField;
    qryCartInvestDESCCARTINVEST: TStringField;
    qryCartGerencIDCARTEIRAINVEST: TFloatField;
    dbeQuantidade: TDBRealEdit;
    Label9: TLabel;
    qryQTDEACOESDIRPROV: TFloatField;
    qryQTDERECDIRPARC: TFloatField;
    qryDESCTIPOOPERACAORESG: TStringField;
    dbeDescResgate: TLabel;
    qryTipoOperacaoNATUREZAOPERACAO: TStringField;
    dbgOperacao: TwwDBGrid;
    Label15: TLabel;
    Label16: TLabel;
    qryDATAOPER: TDateTimeField;
    dbdOper: TCMDateTimePicker;
    QryUpdOperacaoDireitoContbFinc: TwwQuery;
    dblTipoDireito: TwwDBLookupCombo;
    qryTipoDireito: TwwQuery;
    qryTipoDireitoFLGTIPODIREITO: TStringField;
    qryTipoDireitoDESCRICAO: TStringField;
    Label17: TLabel;
    qryFLGTIPODIREITO: TStringField;
    QryBoletaSel: TwwQuery;
    LbVencimento: TLabel;
    DbdVencimento: TCMDateTimePicker;
    qryDATAVENCIMENTO: TDateTimeField;
    qryTipoOperacaoFLGDATAVENCIMENTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dblTipoInvestimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure BtDelDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure HabilitaCamposDireito(bVisivel : Boolean);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOperacaoEnter(Sender: TObject);
    procedure dbgOperacaoExit(Sender: TObject);
    procedure dbgOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOperacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure wwDBLookupCombo1Exit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure QryOperDireitoXinvBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbcIsentoIrClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure sbtnOrigemClick(Sender: TObject);
    procedure dblEmissorExit(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dbcIRLitigioClick(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sbtnOpercoesDireitoClick(Sender: TObject);
    procedure sbtnSubscricaoClick(Sender: TObject);
    procedure sbtnProvisionaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblTipoOperacaoExit(Sender: TObject);
  private
    Procedure Sel(N : Longint);
    Procedure Habilita;
    Procedure Desabilita;
    Procedure TrataBotoesDetalhes;
    function TestaEmpresaOrigem    : Boolean;
    function VerificaParamInvest   : Boolean;
    function TestaOperacaoExitente : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAGE : TfrmCadAGE;
  IDOPERACAODIREITO, IDOPERACAODIREITOANTERIOR : Integer;
  bConfirma , bInsert, bTrocaLine, bProv : Boolean;

implementation

{$R *.DFM}

Uses DBaseDados, uMensErro, uDataBase, UDiasUteisInv, FCadOperAGE,FTelaAut, dAGE,
  UOperComum, FDmRelatorio, uBibliotecaInvest, FCadOperAgeNovo, UCaixaComum,
  UCotaComum, UProvisaoComum, FPrincipal, URendaVariavel;

Procedure TfrmCadAGE.Sel(N : Longint);
begin
  qry.Close;
  qry.Params[0].AsInteger := N;
  qry.Open;
end;

Procedure TfrmCadAGE.CmeCadastroInsert(Sender: TObject);
begin
  Inherited;
  qryJUROSCAP.AsString := 'N';
  qryIRLITIGIO.AsString := 'N';
  qryISENCAOIR.AsString := 'N';
  SelectFirst;
end;

procedure TfrmCadAGE.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
   Begin
      Sel(StrToInt(MontaSelect.ValoresChave[0]));
      qryTipoOperacao.Close;
      qryTipoOperacao.Open;
      QryInvestimentoAcao.Close;
      QryInvestimentoAcao.Filtered := False;
      QryInvestimentoAcao.Filter   := '';
      QryInvestimentoAcao.Open;
      QryOperDireitoXinv.Close;
      QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger :=
                                 Qry.FieldByName('IDOPERACAODIREITO').AsInteger;
      QryOperDireitoXinv.Open;
      QryOperDireitoXinvPERCENTUALINV.Visible :=
       (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger in [pRPI.IDTIPOOPERDIRCIS]);

      QryEmissor.Locate('IDEMISSOR', qryIDEMISSOR.AsInteger,[]);

      HabilitaCamposDireito(True);

      BtIncDet.Enabled            := True;
      BtAltDet.Enabled            := True;
      BtDelDet.Enabled            := True;
      sbtnOpercoesDireito.Enabled := True;

      if (Trim(MontaSelect.ValoresChave[1]) = '') and
         (Trim(MontaSelect.ValoresChave[2]) = '') and
         (qryIDTIPOOPERACAO.AsInteger  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL]) then
         sbtnProvisiona.Enabled   := True
      else
         sbtnProvisiona.Enabled   := False;
   End;
End;

Procedure TfrmCadAGE.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Var str1, str : string;
Begin
    bConfirma := True;
    CmeCadastro.BeforeConfirma(self,bConfirma);

    If dblTipoOperacao.LookupValue = '' then
      Begin
         MsgDlg('Tipo de Operação não preenchida.','Erro',mtError,[mbOK],0);
         dblTipoOperacao.SetFocus;
      end Else
    If DblEmissor.LookupValue = '' then
      Begin
         MsgDlg('Empresa não preenchida.','Erro',mtError,[mbOK],0);
         DblEmissor.SetFocus;
      end Else
    If (Trim(dbdAGE.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGAGE').AsString = 'S') then
      Begin
         MsgDlg('Data AGE não preenchida.','Erro',mtError,[mbOK],0);
         dbdAGE.SetFocus;
      end Else
    If (Trim(dbdEX.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGDATAEX').AsString = 'S')then
      Begin
         MsgDlg('Data Base não preenchida.','Erro',mtError,[mbOK],0);
         dbdEX.SetFocus;
      end Else
    If (Trim(dbdOper.Text) = '') {And
       (qryTipoOperacao.FieldbyName('FLGDATAEX').AsString = 'S') }then
      Begin
         MsgDlg('Data Ex não preenchida.','Erro',mtError,[mbOK],0);
         dbdOper.SetFocus;
      end Else
    If (Trim(dbdCOM.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGDATACOM').AsString = 'S') then
      Begin
         MsgDlg('Data Prevista não preenchida.','Erro',mtError,[mbOK],0);
         dbdCOM.SetFocus;
      end Else
    If (dbePercentual.Value = 0) And
       (qryTipoOperacao.FieldbyName('FLGPERC').AsString = 'S') then
      Begin
         MsgDlg('Percentual não preenchido.','Erro',mtError,[mbOK],0);
         dbePercentual.SetFocus;
      end Else
    If (dbeParidade.Value = 0) And
       (qryTipoOperacao.FieldbyName('FLGPARIDADE').AsString = 'S') then
      Begin
         MsgDlg('Paridade não preenchida.','Erro',mtError,[mbOK],0);
         dbeParidade.SetFocus;
      end Else
    If (Trim(dbdPrazoBolsa.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGPRZBOLSA').AsString = 'S') then
      Begin
         MsgDlg('Prazo Bolsa não preenchido.','Erro',mtError,[mbOK],0);
         dbdPrazoBolsa.SetFocus;
      end Else
    //AL_7
    If (Trim(DbdVencimento.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGDATAVENCIMENTO').AsString = 'S') then
      Begin
         MsgDlg('Data de Vencimento não preenchida.','Erro',mtError,[mbOK],0);
         DbdVencimento.SetFocus;
      end Else
    If (Trim(dbdPrazoEmpresa.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGPRZEMP').AsString = 'S') then
      Begin
         MsgDlg('Prazo Empresa não preenchido.','Erro',mtError,[mbOK],0);
         dbdPrazoEmpresa.SetFocus;
      end Else
    If (Trim(dbdAtaDecisao.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGATADEC').AsString = 'S') then
      Begin
         MsgDlg('Ata Decisão não preenchida.','Erro',mtError,[mbOK],0);
         dbdAtaDecisao.SetFocus;
      end Else
    If (Trim(dbeFormaPagRec.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGFORMAPAGREC').AsString = 'S') then
      Begin
         MsgDlg('Forma de Pagamento/Recebimento não preenchido.','Erro',mtError,[mbOK],0);
         dbeFormaPagRec.SetFocus;
      end Else
    If (dbeDivPorAcao.Value = 0) And
       (qryTipoOperacao.FieldbyName('FLGDIVACAO').AsString = 'S') then
      Begin
         MsgDlg('PU não preenchido.','Erro',mtError,[mbOK],0);
         dbeDivPorAcao.SetFocus;
      end Else
    If (Trim(dbeIniPagto.Text) = '') And
       (qryTipoOperacao.FieldbyName('FLGINIPAG').AsString = 'S') then
      Begin
         MsgDlg('Início Pagamento não preenchido.','Erro',mtError,[mbOK],0);
         dbeIniPagto.SetFocus;
      end Else
    if not TestaEmpresaOrigem then
      begin
        MsgDlg('Antes de modificar a empresa é necessário excluir as ações origem.','Erro',mtError,[mbOK],0);
        DblEmissor.SetFocus;
      end else
    If (dbdAGE.Date > dbdCOM.Date) And
       (qryTipoOperacao.FieldbyName('FLGDATACOM').AsString = 'S') then
      Begin
         MsgDlg('Data Prevista menor que a Data AGE.','Erro',mtError,[mbOK],0);
         dbdCOM.SetFocus;
      end Else
    CmeCadastro.BeforeConfirma(sender,bConfirma);
End;

function TfrmCadAGE.TestaEmpresaOrigem : Boolean;
var
  qryTmp : TwwQuery;
begin
  Result := True;
  if (QryOperDireitoXinv.IsEmpty) Or (Qry.State = DsInsert) then
     Exit;
  qryTmp := TwwQuery.Create(Application);
  Try
  qryTmp.DatabaseName := qry.DatabaseName;
  qryTmp.Close;
  qryTmp.SQl.Clear;
  qryTmp.SQl.Add('SELECT DISTINCT');
  qryTmp.SQl.Add('       I.IDINVESTIMENTO,');
  qryTmp.SQl.Add('       I.IDEMISSOR');
  qryTmp.SQl.Add('FROM INVESTIMENTO I, OPERDIREITOXINV O');
  qryTmp.SQl.Add('WHERE I.IDTIPOINVEST = 2');
  qryTmp.SQl.Add('AND I.IDINVESTIMENTO = O.IDINVESTIMENTO');
  qryTmp.SQl.Add('AND O.ORIGDEST = '#39'O'#39);
  qryTmp.SQl.Add('AND O.IDOPERACAODIREITO = :IDOPERACAODIREITO');
  qryTmp.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
  qryTmp.Open;
  if (qryTmp.FieldByName('IDEMISSOR').AsInteger <> QryEmissorIDEMISSOR.AsInteger) Then
     Result := False;
  qryTmp.Close;
  finally
    qryTmp.Free;
  end;
end;

Procedure TfrmCadAGE.CmeCadastroConfirma(Sender: TObject);
begin
   Inherited; //
end;

Procedure TfrmCadAGE.CmeCadastroEdit(Sender: TObject);
begin
  Inherited;
   qryTipoOperacao.Close;
   qryTipoOperacao.Open;
end;

function TfrmCadAGE.VerificaParamInvest:boolean;
begin
   Result := true;
   if pRPI.IDTIPOOPERDIRDIV = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Dividendos )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end
   else if pRPI.IDTIPOOPERDIRJUR = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Juros de Capital )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end
   else if pRPI.IDTIPOOPERDIRSUB = 0 then
   begin
      MsgDlg('Parâmetro não definido '#13+'para Tipo de Operação de Direito ( Subscrição )!','Mensagem do Sistema',MtWarning,[mbOk],0);
      Result := False;
   end;
end;

procedure TfrmCadAGE.FormCreate(Sender: TObject);
begin
  inherited;
   Sel(-1);
   qryTipoOperacao.Close;
   qryTipoOperacao.Open;
   if not VerificaParamInvest then
      Exit;
end;

procedure TfrmCadAGE.dblTipoInvestimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
    dblTipoOperacao.Clear;
    qryTipoOperacao.Close;
    qryTipoOperacao.Open;
end;

procedure TfrmCadAGE.sbtnInserirClick(Sender: TObject);
begin
  //Al_9 - Ricardo - 22/10/2004
  If qryIDOPERACAODIREITO.AsInteger <> 0 Then
     IDOPERACAODIREITOANTERIOR   := qryIDOPERACAODIREITO.AsInteger;

   Qry.Close;
   Qry.ParamByName('IDOPERACAODIREITO').AsInteger := -1;
   Qry.Open;

   QryOperDireitoXinv.Close;
   QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger := -1;
   QryOperDireitoXinv.Open;

  inherited;

   IDOPERACAODIREITO           := LeUltRegistro(nil,'OPERACAODIREITO');

   If IDOPERACAODIREITOANTERIOR = 0 Then
      IDOPERACAODIREITOANTERIOR:= IDOPERACAODIREITO;

   Qry.FieldByName('IDOPERACAODIREITO').AsInteger := IDOPERACAODIREITO;
   Qry.FieldByName('PARIDADE').AsFloat            := 1;

   BtIncDet.Enabled            := True;
   sbtnOpercoesDireito.Enabled := False;
   sbtnProvisiona.Enabled      := False;
   sbtnSubscricao.Enabled      := False;

   dblTipoOperacao.ReadOnly    := False;
   DblEmissor.ReadOnly         := False;

   pgcAge.ActivePage           := tbsDireitos;

end;

procedure TfrmCadAGE.FormShow(Sender: TObject);
begin
  inherited;
   bInsert    := False;
   bTrocaLine := True;
   sbtnOpercoesDireito.Enabled := False;
   QryOrigemDestino.Open;
   QryEmissor.Open;
   Qry.Open;
   QryTipoOperacao.Open;
   QryInvestimentoAcao.Open;
   QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger := -1;
   QryOperDireitoXinv.Open;
end;

procedure TfrmCadAGE.BtIncDetClick(Sender: TObject);
begin
   if ((Not QryOperDireitoXinv.IsEmpty) And
       (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
       [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRDES,
        pRPI.IDTIPOOPERDIRMUL, pRPI.IDTIPOOPERDIRGRU])) then
   begin
      MsgDlg('Investimento já informado para essa operação.',
             'Mensagem do Sistema ',mtWarning,[mbOK],0);
      Exit;
   end;

  //inherited;
   bInsert    := True;
   bTrocaLine := False;

   if qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
      [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
   begin
      With QryInvestimentoAcao Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT DISTINCT                             ');
         Sql.Add('      I.IDINVESTIMENTO, I.DESCINVESTIMENTO, ');
         Sql.Add('      I.IDTIPOINVEST, I.IDEMISSOR           ');
         Sql.Add('FROM                                        ');
         Sql.Add('      INVESTIMENTO I                        ');
         Sql.Add('WHERE                                       ');
         Sql.Add('      (I.IDTIPOINVEST = 2) AND              ');
         Sql.Add('      (I.IDEMISSOR = '''+QryEmissorIDEMISSOR.AsString+''')           ');
         Sql.Add('ORDER BY I.DESCINVESTIMENTO                 ');
         Open;
      End;
   end
   Else
   Begin
      With QryInvestimentoAcao Do
      Begin
         Close;
         Sql.Clear;
         Sql.Add('SELECT DISTINCT                             ');
         Sql.Add('      I.IDINVESTIMENTO, I.DESCINVESTIMENTO, ');
         Sql.Add('      I.IDTIPOINVEST, I.IDEMISSOR           ');
         Sql.Add('FROM                                        ');
         Sql.Add('      INVESTIMENTO I                        ');
         Sql.Add('WHERE                                       ');
         Sql.Add('      (I.IDTIPOINVEST = 2)                  ');
         Sql.Add('ORDER BY I.DESCINVESTIMENTO                 ');
         Open;
      End;
   End;

   BtIncDet.Enabled   := False;
   BtAltDet.Enabled   := False;
   BtDelDet.Enabled   := False;

   BtOkDet.Enabled    := True;
   BtCancDet.Enabled  := True;
   BtVoltaDet.Enabled := True;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options - [TwwDBgridOption(dgAlwaysShowEditor)];
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;

   if dbgOperacao.CanFocus then
      dbgOperacao.SetFocus;

   QryOperDireitoXinv.Append;      
         
   Desabilita;

end;

procedure TfrmCadAGE.BtAltDetClick(Sender: TObject);
begin
//  inherited;
   bTrocaLine := False;

   QryOperDireitoXinv.Edit;

   QryOperDireitoXinv.FieldByName('IDOPERACAODIREITO').AsInteger := IDOPERACAODIREITO;

   QryInvestimentoAcao.Locate('IDINVESTIMENTO', QryOperDireitoXinvIDINVESTIMENTO.AsInteger,[]);   

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;

   BtOkDet.Enabled     := True;
   BtCancDet.Enabled   := True;
   BtVoltaDet.Enabled  := True;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;
   dbgOperacao.SetFocus;
   Desabilita;
end;

procedure TfrmCadAGE.BtDelDetClick(Sender: TObject);
begin
   bTrocaLine := True;
   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      BtDelDet.Down := False;
      Exit;
   End;
   QryOperDireitoXinv.Delete;
   If QryOperDireitoXinv.RecordCount = 0  Then
   Begin
      BtDelDet.Enabled := False;
      BtAltDet.Enabled := False;
   End;
   BtDelDet.Down    := False;
end;

procedure TfrmCadAGE.bbtnConfirmarClick(Sender: TObject);
Var
   bOrigem      : Boolean ;
   fFatorAcao, fPercentual, fTotalQtd, fVlrDireito : Double;
   wIdCarteiraXEvento  : Integer;
   sSql : String;
begin
//  inherited;
   // O a soma do percentual tem que ser 100%
   If (Qry.State = DsInsert) And (TestaOperacaoExitente) And
      (Not qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger in
              [pRPI.IDTIPOOPERDIRCIS]) Then
   Begin
      MsgDlg('Já existe uma Operação com as mesmas Características.','Mensagem do Sistema',MtError,[mbOk],0);
      Exit;
   End;

   //AL_3 - Ricardo - 22/10/2004
   If ((Qry.State = DsInsert) And
       (Qry.FieldByName('IDOPERACAODIREITO').AsInteger = 0)) Then
      Qry.FieldByName('IDOPERACAODIREITO').AsInteger := IDOPERACAODIREITO;

   If ((Qry.State = DsInsert) And
       (Qry.FieldByName('PARIDADE').AsFloat = 0)) Then
      Qry.FieldByName('PARIDADE').AsFloat  := 1;

   If ((Qry.State = DsInsert) And
       (Qry.FieldByName('FLGTIPODIREITO').AsString = '')) Then
      Qry.FieldByName('FLGTIPODIREITO').AsString  := 'P';
   //AL_3 - Fim

   fPercentual := 0;
   fFatorAcao  := 0;

   if (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
          [pRPI.IDTIPOOPERDIRCIS]) then
   begin
      QryOperDireitoXinv.First;
      While Not QryOperDireitoXinv.EOF Do
      Begin
         fPercentual := fPercentual + QryOperDireitoXinvPERCENTUALINV.Value;
         QryOperDireitoXinv.Next;
      End;
      //Al_1 - Ricardo - 14/10/2004
      If OperComum.ComparaValores((fPercentual-100),100,'<') Then
      Begin
         MsgDlg('O percentual dessa CISÃO tem que completar 100%.','Erro',mtError,[mbOK],0);
         Exit;
      End;
      //Al_1 - Ricardo - 14/10/2004      
      If OperComum.ComparaValores((fPercentual-100),100,'>') Then
      Begin
         MsgDlg('O percentual dessa CISÃO não pode passar de 100%.','Erro',mtError,[mbOK],0);
         Exit;
      End;
   end;

   pgcAge.ActivePage := tbsDireitos;

   bOrigem           := False;

   QryOperDireitoXinv.DisableControls;
   QryOperDireitoXinv.First;
   While Not QryOperDireitoXinv.EOF Do
   Begin
      If QryOperDireitoXinv.FieldByName('ORIGDEST').AsString = 'O' Then
      Begin
         bOrigem := True;
         QryOperDireitoXinv.Last;
      End;
      QryOperDireitoXinv.Next;
   End;
   QryOperDireitoXinv.EnableControls;

   If Not bOrigem Then
   Begin
      MsgDlg('Não foi cadastrado uma Origem para esse Direito.','Erro',mtError,[mbOK],0);
      QryOperDireitoXinv.DisableControls;
      QryOperDireitoXinv.First;
      QryOperDireitoXinv.EnableControls;
      Habilita;
      TrataBotoesDetalhes;
      Exit;
   End;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   //AL_2 - RICARDO - 02/12/2004
   if sbtnAlterar.Down then
   begin
      If Qry.FieldByName('STATUS').AsString = '' Then
         sSql :='UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, PLANO = NULL, ' +
                'QTDERECDIRPARC = 0 WHERE IDOPERACAODIREITO = ' + qryIDOPERACAODIREITO.AsString
      Else
         sSql :=' UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, PLANO = NULL ' +
                ' WHERE IDOPERACAODIREITO = ' + qryIDOPERACAODIREITO.AsString;

      // Zera a Planilha e o CodDocumento da OperacaoDireito
      ExecutarQuery(QryAux, sSql);

      //Al_9 - Ricardo - 29/04/2005
      If frmCadAGE.Caption = 'Anúncio de AGE' Then
      begin
         //AL_4 - RICARDO - 26/10/2004
         QryBoletaSel.Close;
         QryBoletaSel.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
         QryBoletaSel.Open;
         While Not QryBoletaSel.Eof Do
         begin
            if not RendaVariavel.ExcluiBoleta(
                                 QryBoletaSel.FieldByName('NUMDOCUMENTO').AsString, true) then
                Raise Exception.Create('Não é possível fazer a Exclusão dessa Boleta.');
            QryBoletaSel.Next;
         end;
         QryBoletaSel.Close;
      end;
      //Al_9 - Fim
   end;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;

   Try
     Qry.Post;
     Qry.ApplyUpdates;

     QryOperDireitoXinv.ApplyUpdates;

     IDOPERACAODIREITOANTERIOR   := qryIDOPERACAODIREITO.AsInteger;

          // Grava HistCaixa conforme Carteiras Gerenciais
     if (pRPI.FLGCARTGERENC = 'S') and
        (qryIDTIPOOPERACAO.AsInteger  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR]) then
        ExecutarQuery(QryAux,'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO = '''+
                      Qry.FieldByName('IDOPERACAODIREITO').AsString+'''');

     //AL_2 - Ricardo - 22/10/2004
     If frmCadAGE.Caption = 'Anúncio de AGE' Then
        bProv := True
     Else
        bProv := False;

     If pRPI.FLGCARTGERENC = 'S' Then
     begin

        AbrirForm(frmCadOperAGENovo, TfrmCadOperAGENovo, False);

        frmCadOperAGENovo.FazerProcurarCadAGE(qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                              qryIDOPERACAODIREITO.AsInteger,
                                              qryDATAEX.AsDateTime,
                                              QryEmissorSIGLAEMISSOR.AsString,
                                              qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                              False, bProv);
     end
     Else
     begin        

        AbrirForm(frmCadOperAGE, TfrmCadOperAGE, False);

        // Setar a propriedade de provisao
        frmCadOperAGE.FazerProcurarCadAGE(QryEmissorIDEMISSOR.AsInteger,
                                          qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                          qryIDOPERACAODIREITO.AsInteger,
                                          qryDATAEX.AsDateTime,
                                          QryEmissorSIGLAEMISSOR.AsString,
                                          qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                          False, bProv);

     end;

     If DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.Commit;

   Except
     If DtmBaseDados.dbBaseDados.InTransaction Then
        DtmBaseDados.dbBaseDados.Rollback;
     MsgDlg('Não foi possível realizar a Operação.',
            'Mensagem do Sistema ',mtWarning,[mbOK],0);
     Habilita;
     TrataBotoesDetalhes;
   End;

   If (sbtnInserir.Down) Then
   Begin
      Qry.Close;
      Qry.ParamByName('IDOPERACAODIREITO').AsInteger := -1;
      Qry.Open;
      QryOperDireitoXinv.Close;
      QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger := -1;
      QryOperDireitoXinv.Open;
   End
   Else
   Begin
      QryOperDireitoXinv.DisableControls;
      QryOperDireitoXinv.First;
      QryOperDireitoXinv.EnableControls;
   End;
   BtIncDet.Down        := False;
   BtAltDet.Down        := False;
   BtDelDet.Down        := False;

   BtIncDet.Enabled     := False;
   BtAltDet.Enabled     := False;
   BtDelDet.Enabled     := False;

   pnlFundo.Enabled     := False;

   If sbtnAlterar.Down Then
   Begin
      sbtnInserir.Enabled  := True;
      sbtnApagar.Enabled   := True;
      sbtnProcurar.Enabled := True;
      sbtnOpercoesDireito.Enabled := True;
      if qryIDTIPOOPERACAO.AsInteger  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRMUL] then
         sbtnProvisiona.Enabled   := True
      else
         sbtnProvisiona.Enabled   := False;
      sbtnAlterar.Down     := False;
      bbtnConfirmar.Enabled:= False;
      bbtnCancelar.Enabled := False;
   End;
   Habilita;
   TrataBotoesDetalhes;

   // Reseleciona o registro para atualizar os campos PLANO, PLNCODIGO E CODDOCUMENTO
//   Sel(qryIDOPERACAODIREITO.AsInteger);

   If sbtnInserir.Down Then
      sbtnInserir.Click;

   if (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
      [pRPI.IDTIPOOPERDIRSUB]) Then
      sbtnSubscricao.Enabled := True
   else
      sbtnSubscricao.Enabled := False;
end;

procedure TfrmCadAGE.HabilitaCamposDireito(bVisivel : Boolean);
begin
    If (qryTipoOperacao.FieldbyName('FLGAGE').AsString = 'S') And (bVisivel) Then
    Begin
       Label4.Enabled          := True;
       dbdAGE.Enabled          := True;
    End
    Else
    Begin
       Label4.Enabled          := False;
       dbdAGE.Enabled          := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGDATAEX').AsString = 'S') And (bVisivel) Then
    Begin
       Label5.Enabled          := True;
       dbdEX.Enabled           := True;
    End
    Else
    Begin
       Label5.Enabled          := False;
       dbdEX.Enabled           := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGDATACOM').AsString = 'S') And (bVisivel)Then
    Begin
       Label6.Enabled          := True;
       dbdCOM.Enabled          := True;
    End
    Else
    Begin
       Label6.Enabled          := False;
       dbdCOM.Enabled          := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGFORMAPAGREC').AsString = 'S') And (bVisivel) Then
    Begin
       Label12.Enabled          := True;
       dbeFormaPagRec.Enabled   := True;
    End
    Else
    Begin
       Label12.Enabled          := False;
       dbeFormaPagRec.Enabled   := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGPRZBOLSA').AsString = 'S') And (bVisivel) Then
    Begin
       Label1.Enabled          := True;
       dbdPrazoBolsa.Enabled   := True;
    End
    Else
    Begin
       Label1.Enabled          := False;
       dbdPrazoBolsa.Enabled   := False;
    End;

    // AL_7
    If (qryTipoOperacao.FieldbyName('FLGDATAVENCIMENTO').AsString = 'S') And (bVisivel) Then
    Begin
       LbVencimento.Enabled  := True;
       DbdVencimento.Enabled := True;
    End
    Else
    Begin
       LbVencimento.Enabled  := False;
       DbdVencimento.Enabled := False;
    End;

    If (qryTipoOperacao.FieldbyName('FLGPRZEMP').AsString = 'S') And (bVisivel) Then
    Begin
       Label8.Enabled          := True;
       dbdPrazoEmpresa.Enabled := True;
    End
    Else
    Begin
       Label8.Enabled          := False;
       dbdPrazoEmpresa.Enabled := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGATADEC').AsString = 'S') And (bVisivel) Then
    Begin
       Label11.Enabled         := True;
       dbdAtaDecisao.Enabled   := True;
    End
    Else
    Begin
       Label11.Enabled         := False;
       dbdAtaDecisao.Enabled   := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGINIPAG').AsString = 'S') And (bVisivel) Then
    Begin
       Label14.Enabled         := True;
       dbeIniPagto.Enabled     := True;
    End
    Else
    Begin
       Label14.Enabled         := False;
       dbeIniPagto.Enabled     := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGDIVACAO').AsString = 'S') And (bVisivel) Then
    Begin
       Label13.Enabled         := True;
       dbeDivPorAcao.Enabled   := True;
    End
    Else
    Begin
       Label13.Enabled         := False;
       dbeDivPorAcao.Enabled   := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGPERC').AsString = 'S') And (bVisivel) Then
    Begin
       Label7.Enabled          := True;
       dbePercentual.Enabled   := True;
    End
    Else
    Begin
       Label7.Enabled          := False;
       dbePercentual.Enabled   := False;
    End;
    If (qryTipoOperacao.FieldbyName('FLGPARIDADE').AsString = 'S') And (bVisivel) Then
    Begin
       Label10.Enabled         := True;
       dbeParidade.Enabled     := True;
    End
    Else
    Begin
       Label10.Enabled         := False;
       dbeParidade.Enabled     := False;
    End;

    If (qryTipoOperacao.FieldbyName('FLGISENTOIR').AsString = 'S') And (bVisivel) Then
       dbcIsentoIr.Enabled     := True
    Else
       dbcIsentoIr.Enabled     := False;
   

    If (qryTipoOperacao.FieldbyName('FLGGRAVAIRLITIGIO').AsString = 'S') And (bVisivel) Then
       dbcIRLitigio.Enabled    := True
    Else
       dbcIRLitigio.Enabled    := False;

    If (qry.FieldbyName('QTDEACOESDIRPROV').AsFloat > 0) And (bVisivel) Then
    begin
       dbeDescResgate.Visible   := True;
       dblTipoOperacao.Enabled  := False;
       dbeQuantidade.Enabled    := True;
    end
    Else
    begin
       dbeDescResgate.Visible   := False;
       dblTipoOperacao.Enabled  := True;
       dbeQuantidade.Enabled    := False;
    end;

end;

procedure TfrmCadAGE.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   sbtnSubscricao.Enabled := False;
   //sbtnOrigem.Enabled  := False;
   sbtnOpercoesDireito.Enabled := False;
   sbtnProvisiona.Enabled := False;
   dblTipoOperacao.ReadOnly := False;
   DblEmissor.ReadOnly := False;
   IDOPERACAODIREITO  := qryIDOPERACAODIREITO.AsInteger;
   If Not QryOperDireitoXinv.EOF Then
   Begin
      BtIncDet.Enabled   := True;
      BtAltDet.Enabled   := True;
      BtDelDet.Enabled   := True;
   End
   Else
     BtIncDet.Enabled   := True;
   pgcAge.ActivePage := tbsDireitos;
end;

procedure TfrmCadAGE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadAGE.dbgOperacaoEnter(Sender: TObject);
begin
  inherited;
   KeyPreview := False;
end;

procedure TfrmCadAGE.dbgOperacaoExit(Sender: TObject);
begin
  inherited;
   KeyPreview := True;
end;

procedure TfrmCadAGE.dbgOperacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;
   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmCadAGE.dbgOperacaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;
   If ((Key = 38) Or (Key = 40)) And
      (dbgOperacao.Options = [TwwDBgridOption(dgEditing),
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

procedure TfrmCadAGE.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   Habilita;
   bTrocaLine := True;    
   If qryIDOPERACAODIREITO.AsInteger <> 0 Then
      IDOPERACAODIREITOANTERIOR := qryIDOPERACAODIREITO.AsInteger;

   Qry.Cancel;
   
   Qry.Close;
   Qry.ParamByName('IDOPERACAODIREITO').AsInteger := IDOPERACAODIREITOANTERIOR;
   Qry.Open;

   IDOPERACAODIREITOANTERIOR := 0;

   QryOperDireitoXinv.Cancel;
   QryOperDireitoXinv.Close;
   QryOperDireitoXinv.ParamByName('IDOPERACAODIREITO').AsInteger :=
                      Qry.FieldByName('IDOPERACAODIREITO').AsInteger;
   QryOperDireitoXinv.Open;

   BtIncDet.Down       := False;
   BtAltDet.Down       := False;
   BtDelDet.Down       := False;

   BtIncDet.Enabled    := False;
   BtAltDet.Enabled    := False;
   BtDelDet.Enabled    := False;
   pgcAge.ActivePage   := tbsDireitos;

   If qry.IsEmpty Then
   Begin
      sbtnAlterar.Enabled         := False;
      sbtnApagar.Enabled          := False;
      sbtnOpercoesDireito.Enabled := False;
      sbtnProvisiona.Enabled      := False;
   End
   Else
   Begin
      sbtnAlterar.Enabled         := True;
      sbtnApagar.Enabled          := True;
      sbtnOpercoesDireito.Enabled := True;
      if qryIDTIPOOPERACAO.AsInteger  In [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR,pRPI.IDTIPOOPERDIRMUL] then
         sbtnProvisiona.Enabled   := True
      else
         sbtnProvisiona.Enabled   := False;
   End;

   QryOperDireitoXinvPERCENTUALINV.Visible :=
       (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger in [pRPI.IDTIPOOPERDIRCIS]);

   if (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
      [pRPI.IDTIPOOPERDIRSUB]) Then
      sbtnSubscricao.Enabled := True
   else
      sbtnSubscricao.Enabled := False;

   If (QryStatus.AsString <> '') Or (Qry.IsEmpty) Then
   Begin
      sbtnAlterar.Enabled := False;
      sbtnApagar.Enabled  := False;
   End
   Else
   Begin
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
   End;

   If frmCadAGE.Caption = 'Anúncio de AGE' Then
   begin
      sbtnOrigem.Enabled            := False;
      sbtnProvisiona.Enabled        := False;
      sbtnSubscricao.Enabled        := False;
      sbtnOpercoesDireito.Enabled   := False;
   end;

end;

procedure TfrmCadAGE.wwDBLookupCombo1Exit(Sender: TObject);
begin
   bTrocaLine := True;
   
   If (QryOperDireitoXinv.State = DsInsert) Or
      (QryOperDireitoXinv.State = DsEdit)   Then
   Begin
      If QryOperDireitoXinv.FieldByName('IDOPERDIREITOXINV').IsNull Then
         QryOperDireitoXinv.FieldByName('IDOPERDIREITOXINV').AsInteger :=
                                           LeUltRegistro(nil,'OPERDIREITOXINV');
      If QryOperDireitoXinv.FieldByName('IDOPERACAODIREITO').IsNull Then
         QryOperDireitoXinv.FieldByName('IDOPERACAODIREITO').AsInteger :=
                                                              IDOPERACAODIREITO;
      QryOperDireitoXinv.Post;
   End;

   BtOkDet.SetFocus;
//  inherited;
end;

procedure TfrmCadAGE.sbtnApagarClick(Sender: TObject);
begin
   //sbtnOrigem.Enabled  := False;
   sbtnOpercoesDireito.Enabled := False;
   sbtnProvisiona.Enabled := False;

   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      Exit;
   End;

   QryAux.Close;
   QryAux.SQL.Clear;
   QryAux.SQL.Add('SELECT IDOPERACAODIREITO FROM OPERACAOINVEST WHERE IDOPERACAODIREITO = '''+
                  Qry.FieldByName('IDOPERACAODIREITO').AsString+'''');
   QryAux.Open;
   if not QryAux.isEmpty then
   begin
      MsgDlg('Existem operações para esta AGE. A exclusão será cancelada!','Mensagem do Sistema ',mtWarning,[mbOK],0);
      sbtnAlterar.Down    := True;
      sbtnApagar.Enabled  := True;
      Exit;
   end;

   If Not DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.StartTransaction;
   Try
      // Zera a Planilha e o CodDocumento da OperacaoDireito
      ExecutarQuery(QryAux,
        'UPDATE OPERACAODIREITO SET PLNCODIGO = NULL, CODDOCUMENTO = NULL, PLANO = NULL ' +
        'WHERE IDOPERACAODIREITO = ' + qryIDOPERACAODIREITO.AsString);
      // Estorna o lancamento de provisão
      if not OperComum.ProcExclui(qryCODDOCUMENTO.AsInteger,
                                  qryPLNCODIGO.AsInteger,
                                  qryPLANO.AsInteger, -1,
                                  qryDATAAGE.AsDateTime , True) then
         Raise Exception.Create('Não foi Possível Excluir o Provisionamento desta AGE.');

      ExecutarQuery(QryAux,
        'DELETE FROM OPERDIREITOXINV WHERE IDOPERACAODIREITO = '''+
         Qry.FieldByName('IDOPERACAODIREITO').AsString+'''');

      ExecutarQuery(QryAux,
        'DELETE FROM HISTCAIXA WHERE IDOPERACAODIREITO = '''+
         Qry.FieldByName('IDOPERACAODIREITO').AsString+'''');

      ExecutarQuery(QryAux,
        'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO = '''+
         Qry.FieldByName('IDOPERACAODIREITO').AsString+'''');

      Qry.Delete;
      Qry.ApplyUpdates;
      DtmBaseDados.dbBaseDados.Commit;
   Except
      on E: Exception do
      begin
         DtmBaseDados.dbBaseDados.Rollback;
         MsgDlg('Ocorreu problema ao excluir a operação ...'+
                #13+E.Message,'Mensagem do Sistema ',mtWarning,[mbOK],0);
         sbtnApagar.Down     := False;
         sbtnAlterar.Down    := False;
         sbtnApagar.Enabled  := False;
         sbtnAlterar.Enabled := False;
         Exit;
      end;
   End;

   Qry.Close;
   Qry.Open;
   QryOperDireitoXinv.Close;
   QryOperDireitoXinv.Open;

   sbtnApagar.Down     := False;
   sbtnAlterar.Down    := False;
   sbtnApagar.Enabled  := False;
   sbtnAlterar.Enabled := False;
//  inherited;
end;

procedure TfrmCadAGE.BtOkDetClick(Sender: TObject);
begin
//  inherited;
  bTrocaLine := True;
  If (QryInvestimentoAcaoIDEMISSOR.AsInteger <> QryEmissorIDEMISSOR.AsInteger) And
     (QryOperDireitoXinvORIGDEST.AsString = 'O') And
     (Not(qryTipoOperacaoIDTIPOOPERACAO.AsInteger In
         [pRPI.IDTIPOOPERDIRINC,pRPI.IDTIPOOPERDIRPER])) Then
  Begin
      MsgDlg('Ação Origem não pertence a essa Empresa.','Erro',mtError,[mbOK],0);
      BtAltDet.Click;
      Exit;
  End;

  If (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
     [pRPI.IDTIPOOPERDIRDES, pRPI.IDTIPOOPERDIRGRU]) And (bInsert) Then
  Begin
     QryOperDireitoXinv.Insert;
     QryOperDireitoXinv.FieldByName('IDINVESTIMENTO').AsInteger    :=
                        QryInvestimentoAcao.FieldByName('IDINVESTIMENTO').AsInteger;
     QryOperDireitoXinv.FieldByName('IDOPERDIREITOXINV').AsInteger :=
                        LeUltRegistro(nil,'OPERDIREITOXINV');
     QryOperDireitoXinv.FieldByName('IDOPERACAODIREITO').AsInteger :=
                        IDOPERACAODIREITO;
     QryOperDireitoXinv.FieldByName('ORIGDEST').AsString := 'D';
     QryOperDireitoXinv.Post;     
  End;

  TrataBotoesDetalhes;

  dbgOperacao.Options    := dbgOperacao.Options + [TwwDBgridOption(dgAlwaysShowEditor)];
  dbgOperacao.Options    := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
  dbgOperacao.Font.Color := clGray;
  dbgOperacao.Color      := clSilver;

  Habilita;
end;

procedure TfrmCadAGE.BtCancDetClick(Sender: TObject);
begin
  inherited;
  bInsert    := False;
  bTrocaLine := True;
  dbgOperacao.Options    := dbgOperacao.Options + [TwwDBgridOption(dgAlwaysShowEditor)];
  dbgOperacao.Options    := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
  dbgOperacao.Font.Color := clGray;
  dbgOperacao.Color      := clSilver;

  QryOperDireitoXinv.Cancel;
  QryOperDireitoXinv.Close;
  QryOperDireitoXinv.Open;

  TrataBotoesDetalhes;

  Habilita;

  QryOperDireitoXinvPERCENTUALINV.Visible :=
       (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger in [pRPI.IDTIPOOPERDIRCIS]);

end;

procedure TfrmCadAGE.QryOperDireitoXinvBeforePost(DataSet: TDataSet);
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

procedure TfrmCadAGE.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   dbeDescResgate.Caption    := qryDESCTIPOOPERACAORESG.AsString;
   dbgOperacao.Font.Color    := clGray;
   dbgOperacao.Color         := clSilver;
   if (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
      [pRPI.IDTIPOOPERDIRSUB]) Then
      sbtnSubscricao.Enabled := True
   else
      sbtnSubscricao.Enabled := False;

   If QryStatus.AsString <> '' Then
   Begin
      sbtnAlterar.Enabled := False;
      sbtnApagar.Enabled  := False;
   End
   Else
   Begin
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
   End;

   If frmCadAGE.Caption = 'Anúncio de AGE' Then
   begin
      sbtnOrigem.Enabled          := False;
      sbtnProvisiona.Enabled      := False;
      sbtnSubscricao.Enabled      := False;
      sbtnOpercoesDireito.Enabled := False;
   end
   Else
   begin
//      sbtnInserir.Enabled         := False;
//      sbtnAlterar.Enabled         := False;
//      sbtnApagar.Enabled          := False;
   end;

end;

Procedure TfrmCadAGE.Habilita;
Begin
   Label2.Enabled          := True;
   dblTipoOperacao.Enabled := True;
   Label3.Enabled          := True;
   DblEmissor.Enabled      := True;
   Label4.Enabled          := True;
   dbdAGE.Enabled          := True;
   Label5.Enabled          := True;
   dbdEX.Enabled           := True;
   Label6.Enabled          := True;
   dbdCOM.Enabled          := True;
   Label12.Enabled         := True;
   dbeFormaPagRec.Enabled  := True;
   //AL_7
   DbdVencimento.Enabled   := True;

   HabilitaCamposDireito(True);
End;

Procedure TfrmCadAGE.Desabilita;
Begin
   Label2.Enabled          := False;
   dblTipoOperacao.Enabled := False;
   Label3.Enabled          := False;
   DblEmissor.Enabled      := False;
   Label4.Enabled          := False;
   dbdAGE.Enabled          := False;
   Label5.Enabled          := False;
   dbdEX.Enabled           := False;
   Label6.Enabled          := False;
   dbdCOM.Enabled          := False;
   Label12.Enabled         := False;
   dbeFormaPagRec.Enabled  := False;
   //AL_7
   DbdVencimento.Enabled   := False;

   HabilitaCamposDireito(False);

   dblTipoOperacao.ReadOnly := True;
   DblEmissor.ReadOnly := True;
End;

Procedure TfrmCadAGE.TrataBotoesDetalhes;
Begin
  If Not QryOperDireitoXinv.EOF Then
  Begin
     BtIncDet.Enabled := True;
     BtAltDet.Enabled := True;
     BtDelDet.Enabled := True;
  End
  Else
     BtIncDet.Enabled := True;

  BtOkDet.Enabled     := False;
  BtCancDet.Enabled   := False;
  BtVoltaDet.Enabled  := False;

  BtIncDet.Down       := False;
  BtAltDet.Down       := False;
  BtDelDet.Down       := False;
End;

procedure TfrmCadAGE.dbcIsentoIrClick(Sender: TObject);
begin
  inherited;

  dbcIRLitigio.Visible := Not(dbcIsentoIr.Checked);

  if not (qry.State in [dsInsert, dsEdit]) Then
     Exit;
  if dbcIsentoIr.Checked Then
  Begin
     dbcIRLitigio.Checked := false;
     qryIRLITIGIO.AsString := 'N';
  End
  Else
     qryIRLITIGIO.AsString := 'S';
end;

procedure TfrmCadAGE.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if qryIRLITIGIO.IsNull Then
     dbcIRLitigio.Checked := False;
  if qryISENCAOIR.IsNull Then
     dbcIsentoIr.Checked := False;
end;

procedure TfrmCadAGE.sbtnOrigemClick(Sender: TObject);
begin
{    if Trim(dblTipoOperacao.LookupValue) = '' then
      begin
        MsgDlg('Tipo de Operação não preenchido.', 'Erro', mtError, [mbOk], 0);
      end
    else
      if Trim(DblEmissor.LookupValue) = '' then
         begin
           MsgDlg('Empresa não preenchida.', 'Erro', mtError, [mbOk], 0);
         end
      else
        if Trim(dbdEX.Text) = '' then
          begin
            MsgDlg('Data Base não preenchida', 'Erro', mtError, [mbOk], 0);
          end
        else
          begin
            Application.CreateForm(TfrmConsOrigem, frmConsOrigem);
            try
              frmConsOrigem.ShowModal;
            finally
              frmConsOrigem.Release;
            end;
          end;
  sbtnOrigem.Down := False;  }
end;

procedure TfrmCadAGE.dblEmissorExit(Sender: TObject);
begin
  inherited;
   QryInvestimentoAcao.Filter      := '';
   if (Not (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
            [pRPI.IDTIPOOPERDIRCIS, pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER,
             pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRREE])) And
           ((POS('REES',Trim(dblTipoOperacao.Text)) <= 0)) Then
   Begin
      If (QryIDEMISSOR.AsString <> '') Then
      Begin
         QryInvestimentoAcao.Filtered := True;
         QryInvestimentoAcao.Filter   := 'IDEMISSOR = '+Qry.FieldByName('IDEMISSOR').AsString;
      End;
   End;

   If ((qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
       [pRPI.IDTIPOOPERDIRRES]) And (dbePercentual.Enabled))then
   Begin
      QryInvestimentoAcao.Filtered    := True;
      QryInvestimentoAcao.Filter      := 'IDEMISSOR = '+Qry.FieldByName('IDEMISSOR').AsString;
   End;   
end;

procedure TfrmCadAGE.bbtnSairClick(Sender: TObject);
begin
  bbtnCancelar.Click;
  inherited;
  Close;
end;

procedure TfrmCadAGE.dbcIRLitigioClick(Sender: TObject);
begin
  inherited;
  dbcIsentoIr.Visible := not(dbcIRLitigio.Checked);
  if not (qry.State in [dsInsert, dsEdit]) Then
     Exit;
  if dbcIRLitigio.Checked Then
     Begin
       dbcIsentoIr.Checked   := false;
       qryISENCAOIR.AsString := 'N';
     end;
end;

function  TfrmCadAGE.TestaOperacaoExitente : Boolean;
begin
   QryBuscaOperDireito.Close;
   QryBuscaOperDireito.ParamByName('P_IDEMISSOR').AsInteger      := QryIDEMISSOR.AsInteger;
   QryBuscaOperDireito.ParamByName('P_DATAEX').AsDateTime        := QryDATAEX.AsDateTime;
   QryBuscaOperDireito.ParamByName('P_DATAAGE').AsDateTime       := QryDATAAGE.AsDateTime;
   QryBuscaOperDireito.ParamByName('P_DATACOM').AsDateTime       := QryDATACOM.AsDateTime;
   QryBuscaOperDireito.ParamByName('P_IDTIPOOPERACAO').AsInteger := QryIDTIPOOPERACAO.AsInteger;
   QryBuscaOperDireito.Open;
   If QryBuscaOperDireito.IsEmpty Then
      Result := False
   Else
      Result := True;
   QryBuscaOperDireito.Close;
end;

procedure TfrmCadAGE.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
   qryOperacaoDireito.Close;
   qryPrint.Close;
   dtmAGE.qrySaldoCustodia.Close;
   QryLote.Close;
   qryFilha.Close;
   QryBuscaInvestimento.Close;
   qryFilha.Close;
   QryAcao.Close;
end;

procedure TfrmCadAGE.sbtnOpercoesDireitoClick(Sender: TObject);
Var
   sDescTipoResg : String;
begin
  inherited;
   If pRPI.FLGCARTGERENC = 'S' Then
   begin
      AbrirForm(frmCadOperAGENovo, TfrmCadOperAGENovo, False);

      // Setar a propriedade de provisao
      frmCadOperAGENovo.FazerProcurarCadAGE(qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                            qryIDOPERACAODIREITO.AsInteger,
                                            qryDATAEX.AsDateTime,
                                            QryEmissorSIGLAEMISSOR.AsString,
                                            qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                            True, False);
   end
   else
   begin
      AbrirForm(frmCadOperAGE, TfrmCadOperAGE, False);

      If Trim(qryDESCTIPOOPERACAORESG.AsString) <> '' Then
         sDescTipoResg := ' / '+qryDESCTIPOOPERACAORESG.AsString;

      // Setar a propriedade de provisao
      frmCadOperAGE.FazerProcurarCadAGE(QryEmissorIDEMISSOR.AsInteger,
                                        qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                        qryIDOPERACAODIREITO.AsInteger,
                                        qryDATAEX.AsDateTime,
                                        QryEmissorSIGLAEMISSOR.AsString,
                                        qryTipoOperacaoDESCTIPOOPERACAO.AsString+sDescTipoResg,
                                        True, False);
   end;

{Procedure TfrmCadOperAGENovo.FazerProcurarCadAGE(TipoOperacao, OperacaoDireito : LongInt;
                                                 DataEX : TDateTime;
                                                 SiglaEmissor, DescTipoOperacao : String;
                                                 bForm  : Boolean);   }
end;

procedure TfrmCadAGE.sbtnSubscricaoClick(Sender: TObject);
Var
   DataAGECons  : TDateTime;
   ListaDestino : TList;
   I            : Integer;
   RO           : TRegTipoOperacao;
   pDestino     : PRegDestino;
begin
  inherited;
   qryOperacaoDireito.Close;
   qryOperacaoDireito.ParamByName('IDOPERACAODIREITO').Asinteger := qryIDOPERACAODIREITO.AsInteger;
   qryOperacaoDireito.Open;

   OperacaoInvest.RetParamOperDireito(qryIDOPERACAODIREITO.AsInteger, RO, qry.DatabaseName);

   qryPrint.Close;
   qryPrint.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryPrint.ParamByName('pDATAAGE').AsDate               := qryDATAEX.AsDateTime;
   qryPrint.Open;

   dtmAGE.qrySaldoCustodia.Close;
   dtmAGE.qrySaldoCustodia.ParamByName('IdCarteira').AsInteger     := qryPrintIDCARTEIRAINVEST.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdInvestimento').AsInteger := qryPrintIDINVESTIMENTO.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdLote').AsString          := '';
   DataAGECons := qryDATAEX.AsDateTime;
   If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      DataAGECons := DataAGECons - 1;
      While not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) Do
          DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
   End;

   dtmAGE.qrySaldoCustodia.ParamByName('DataMov').AsDateTime := DataAGECons;

   dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger := qryPrintIDCUSTODIANTE.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger := qryPrintIDMOTIVOBLOQUEIO.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdCustodia').AsInteger := high(integer);
   dtmAGE.qrySaldoCustodia.Open;

   qryPrint.Edit;

   if (qryPrintIDMOTIVOBLOQUEIO.AsInteger = -1) then  // Está Bloqueado ?
      qryPrintQTDE.AsFloat := dtmAGE.qrySaldoCustodiaSALDOLIBERADO.AsFloat   // Não
   else
      qryPrintQTDE.AsFloat := dtmAGE.qrySaldoCustodiaSALDOBLOQUEADO.AsFloat;  // Sim

   if (RO.FLGPERC) then
      qryPrintQTDEDIREITO.AsFloat := OperComum.Round((qryPrintQTDE.AsFloat * RO.PERCENTUAL) / 100,0)
   else
      qryPrintQTDEDIREITO.AsFloat := qryPrintQTDE.AsFloat;

   QryLote.Close;
   QryLote.ParamByName('IDACAO').AsInteger := qryPrintIDINVESTIMENTO.AsInteger;
   QryLote.Open;

   qryOperacaoInvest.Close;
   qryOperacaoInvest.ParamByName('IDOPERACAODIREITO').Asinteger := qryIDOPERACAODIREITO.AsInteger;
   qryOperacaoInvest.Open;

   qryPrintVALOREXERCIDO.AsFloat := OperComum.Round(
      (qryPrintQTDEDIREITO.AsFloat *
       OperComum.DivValorZero(RO.DIVPORACAO,
                      QryLote.FieldByName('QTDELOTE').AsInteger))-0.0049,2)+
                      QryOperacaoInvestVLRREMUNERACAO.AsFloat;

   OperacaoInvest.RetParamOperDireito(qryIDOPERACAODIREITO.AsInteger, RO, qry.DatabaseName);
   RO.DIVPORACAO := qryOperacaoDireitoDIVPORACAO.AsFloat;

   QryPrint.Post;

   qryFilha.Close;
   qryFilha.ParamByName('IDOPERACAODIREITO').AsInteger := qryIDOPERACAODIREITO.AsInteger;
   qryFilha.Open;

   ListaDestino := TList.Create;

   dtmAGE.qrySaldoCustodia.Close;
   dtmAGE.qrySaldoCustodia.ParamByName('IdCarteira').AsInteger     := qryPrintIDCARTEIRAINVEST.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdInvestimento').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdLote').AsString          := '';

   DataAGECons := qryDATAEX.AsDateTime;

   If (Trim(qryOperacaoDireito.FieldByName('STATUS').AsString) <> '') Then
   Begin
      DataAGECons := DataAGECons - 1;
      While not DiasUteisInv.DiaUtil(DataAGECons,-1,1,'',True,False,False) Do
         DataAGECons := DataAGECons - 1;   // Achar o dia útil anterior
   End;

   dtmAGE.qrySaldoCustodia.ParamByName('DataMov').AsDateTime         :=
                           DataAGECons;
   dtmAGE.qrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger    :=
                           qryPrintIDCUSTODIANTE.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger :=
                           qryPrintIDMOTIVOBLOQUEIO.AsInteger;
   dtmAGE.qrySaldoCustodia.ParamByName('IdCustodia').AsInteger       := high(integer);
   dtmAGE.qrySaldoCustodia.Open;

   pDestino := AllocMem(SizeOf(TRegDestino));

   pDestino^.IDINVESTIMENTO   := qryFilhaIDINVESTIMENTO.AsInteger;
   pDestino^.IDCARTEIRAINVEST := qryPrintIDCARTEIRAINVEST.AsInteger;
   pDestino^.IDCUSTODIANTE    := qryPrintIDCUSTODIANTE.AsInteger;
   pDestino^.IDMOTIVOBLOQUEIO := qryPrintIDMOTIVOBLOQUEIO.AsInteger;
   pDestino^.IDLOTE           := qryPrintIDLOTE.AsString;
   pDestino^.PERCENTUALINV    := qryFilhaPERCENTUALINV.AsFloat;

   if (qryPrintIDMOTIVOBLOQUEIO.AsInteger = -1) then  // Está Bloqueado ?
       pDestino^.QTDE          := dtmAGE.qrySaldoCustodiaSALDOLIBERADO.AsFloat   // Não
   else
       pDestino^.QTDE          := dtmAGE.qrySaldoCustodiaSALDOBLOQUEADO.AsFloat;  // Sim

   pDestino^.PERCCUSTO         := qryPrintPERCENTUALINV.AsFloat;

   qryOperacaoInvest.Close;
   qryOperacaoInvest.ParamByName('IDOPERACAODIREITO').Asinteger := qryFilhaIDOPERACAODIREITO.AsInteger;
   qryOperacaoInvest.Open;

   pDestino^.QTDEDIREITO  :=  (qryPrintQTDEDIREITO.AsFloat * RO.PARIDADE);

   QryBuscaInvestimento.Close;
   QryBuscaInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := qryFilhaIDINVESTIMENTO.AsInteger;
   QryBuscaInvestimento.Open;

   pDestino^.VALOREXERCIDO      := OperComum.DivValorZero(pDestino^.QTDEDIREITO,
                                     QryBuscaInvestimento.FieldByName('QTDELOTE').AsInteger)*
                                      (RO.DIVPORACAO);
   ListaDestino.Add(pDestino);

   while not qryFilha.IsEmpty do
     qryFilha.Delete;

   for I := 0 to Pred(ListaDestino.Count) do
   begin
     pDestino := ListaDestino.Items[I];

     qryFilha.Append;
     qryFilhaIDINVESTIMENTO.AsInteger   := pDestino^.IDINVESTIMENTO;
     qryFilhaIDCARTEIRAINVEST.AsInteger := pDestino^.IDCARTEIRAINVEST;
     qryFilhaIDCUSTODIANTE.AsInteger    := pDestino^.IDCUSTODIANTE;
     qryFilhaIDMOTIVOBLOQUEIO.AsInteger := pDestino^.IDMOTIVOBLOQUEIO;
     qryFilhaIDLOTE.AsString            := pDestino^.IDLOTE;
     qryFilhaQTDEDIREITO.AsFloat        := pDestino^.QTDEDIREITO;

     qryFilhaQTDENOVA.AsFloat   := pDestino^.QTDEDIREITO + pDestino^.QTDE;

     qryFilhaVALOREXERCIDO.AsFloat := pDestino^.VALOREXERCIDO;

     qryFilhaVLRCUSTO.AsFloat      := qryPrintVLRCUSTOATUAL.AsFloat*(pDestino^.PERCENTUALINV/100);
     qryFilhaPERCENTUALINV.AsFloat := pDestino^.PERCENTUALINV;

     qryFilha.Post;
   end;

   with DtmRelatorio do
   begin
      pplEmpresa.Caption := QryEmissorSIGLAEMISSOR.AsString;

      QryOperDireitoXinv.First;
      while Not QryOperDireitoXinv.Eof do
      begin
         QryAcao.Close;
         QryAcao.ParamByName('IDACAO').AsInteger := QryOperDireitoXinvIDINVESTIMENTO.AsInteger;
         QryAcao.Open;
         If QryOperDireitoXinvORIGDEST.AsString = 'O' Then
            pplTipoOrig.Caption := QryAcao.FieldByName('CODTIPOACAO').AsString
         Else
            pplTipoDest.Caption := QryAcao.FieldByName('CODTIPOACAO').AsString;

         QryOperDireitoXinv.Next;
      end;

      ppLBovBase.Caption  := qryPrintSGLCUSTODIANTE.AsString;
      ppLTipoBase.Caption := pplTipoOrig.Caption;
      ppLQtdBase.Caption  := FloatToStrF(qryPrintQTDE.AsFloat,ffNumber, 22,0);

      ppLBovSubs.Caption  := qryFilhaSGLCUSTODIANTE.AsString;
      ppLTipoSubs.Caption := pplTipoDest.Caption;
      ppLQtdSubs.Caption  := FloatToStrF(qryFilhaQTDEDIREITO.AsFloat,ffNumber, 22,0);

      pplTipoFinDes.Caption := ppLTipoSubs.Caption;
      pplFinDes.Caption     := FloatToStrF(qryFilhaVALOREXERCIDO.AsFloat,ffNumber, 18, 2);
      pplTotFinDes.Caption  := FloatToStrF(qryFilhaVALOREXERCIDO.AsFloat,ffNumber, 18, 2);

      TfrmPreview.CreateModalPreview(Application,
                                     dtmRelatorio.RpAnuncioSubscricao,
                                     dtmRelatorio.RpAnuncioSubscricao.PrinterSetup.DocumentName);      
   end;

   QryLote.Close;
   QryAcao.Close;
   qryPrint.Close;
   qryFilha.Close;
   qryOperacaoDireito.Close;
   QryBuscaInvestimento.Close;
   dtmAGE.qrySaldoCustodia.Close;   

   sbtnSubscricao.Down := False;
end;

procedure TfrmCadAGE.sbtnProvisionaClick(Sender: TObject);
begin
   inherited;
   If pRPI.FLGCARTGERENC = 'S' Then
   begin
      AbrirForm(frmCadOperAGENovo, TfrmCadOperAGENovo, False);

      frmCadOperAGENovo.FazerProcurarCadAGE(qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                            qryIDOPERACAODIREITO.AsInteger,
                                            qryDATAEX.AsDateTime,
                                            QryEmissorSIGLAEMISSOR.AsString,
                                            qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                            True, True);
   end
   Else
   begin
      AbrirForm(frmCadOperAGE, TfrmCadOperAGE, False);

      // Setar a propriedade de provisao
      frmCadOperAGE.FazerProcurarCadAGE(QryEmissorIDEMISSOR.AsInteger,
                                        qryTipoOperacaoIDTIPOOPERACAO.AsInteger,
                                        qryIDOPERACAODIREITO.AsInteger,
                                        qryDATAEX.AsDateTime,
                                        QryEmissorSIGLAEMISSOR.AsString,
                                        qryTipoOperacaoDESCTIPOOPERACAO.AsString,
                                        True, True);

      frmCadOperAGE.bbtnConfirmarClick(Sender);
      frmCadOperAGE.bbtnSairClick(Sender);

   end;

end;

procedure TfrmCadAGE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   qryCartGerenc.Close;
end;

procedure TfrmCadAGE.dblTipoOperacaoExit(Sender: TObject);
begin
  inherited;
   if Trim(dblTipoOperacao.Text) <> '' then
   begin
      //AL_6 - Ricardo - 08/12/2004
      if ((frmCadAGE.Caption = 'Operação de Direitos') And
          (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
                               [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR])) then
      begin
         //Al_8 - Ricardo - 25/01/2005
         If MsgDlg('Primeiro deve ser lançado o Anúncio de Proventos. '+
                   'Deseja prosseguir com a operação?',
                   'Mensagem do Sistema', mtConfirmation, [mbYes,mbNo],0) = mrNo then
         begin
            bbtnCancelarClick(Sender);
            Exit;
         end;
         //Al_8 - Fim            
      end;

      HabilitaCamposDireito(True);

      QryOperDireitoXinv.Filter := '';
      QryOrigemDestino.Filter   := '';

      if qryTipoOperacao.FieldbyName('NATUREZAOPERACAO').AsString = 'N' Then
      begin
         MsgDlg('Atualização da Carteira não está parametrizada no Cadastro de Tipo de Operação.',
                'Mensagem do Sistema ',mtWarning,[mbOK],0);
         If dblTipoOperacao.CanFocus Then
            dblTipoOperacao.SetFocus;
         Exit;
      end;

      if qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
         [pRPI.IDTIPOOPERDIRDIV, pRPI.IDTIPOOPERDIRJUR, pRPI.IDTIPOOPERDIRDES,
          pRPI.IDTIPOOPERDIRMUL, pRPI.IDTIPOOPERDIRGRU] then
      begin
         QryOrigemDestino.Filter   := 'IDORIGEM = ''O''';
         QryOrigemDestino.Filtered := True;
      end;

      //Restituição de Capital
      if ((qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In [pRPI.IDTIPOOPERDIRRES]) And
          (dbePercentual.Enabled)) Then
      begin
         QryOrigemDestino.Filter   := 'IDORIGEM = ''O''';
         QryOrigemDestino.Filtered := True;
      end;

      QryOperDireitoXinvPERCENTUALINV.Visible :=
          (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger in [pRPI.IDTIPOOPERDIRCIS]);

      if Not(qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
            [pRPI.IDTIPOOPERDIRCIS, pRPI.IDTIPOOPERDIRINC, pRPI.IDTIPOOPERDIRPER,
             pRPI.IDTIPOOPERDIRSUB, pRPI.IDTIPOOPERDIRBON, pRPI.IDTIPOOPERDIRALT,
             pRPI.IDTIPOOPERDIRDSU]) Then
      Begin
         QryOperDireitoXinv.Filtered := False;
         QryOperDireitoXinv.Filter   := 'ORIGDEST <> ''D''';
         QryOperDireitoXinv.Filtered := True;
      End;

      If  ((qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In
           [pRPI.IDTIPOOPERDIRRES, pRPI.IDTIPOOPERDIRREE]) And (Not dbePercentual.Enabled)) Or
           (qryTipoOperacao.FieldbyName('IDTIPOOPERACAO').AsInteger In [pRPI.IDTIPOOPERDIRREE]) then
      Begin
         QryOperDireitoXinv.Filtered := False;
         QryOperDireitoXinv.Filter   := '';
      End;
   end;
end;

end.


