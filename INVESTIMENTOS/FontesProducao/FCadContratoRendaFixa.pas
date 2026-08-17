//********************************************************************************************************
// Autor    : Marco Turon
// Data     : 06/10/2004
// Código   : AL_2
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Autor    : Fabio Fagundes
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************

unit FCadContratoRendaFixa;

interface                      

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, ComCtrls, wwdblook, TREdit, Mask, DBCtrls, wwdbedit,
  Grids, Wwdbigrd, Wwdbgrid, UOperacaoInvest, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

Const
  V_ERRO : array[1..5] of string = ('INVESTIMENTO', 'TITRENFIXA', 'OPERACAOINVEST', 'OPRRENFIX', 'CONTRATOINVESTIM');

type
  TfrmCadContratoRendaFixa = class(TfrmCadastroCS)
    QryBuscaCarteira: TwwQuery;
    QryBuscaCarteiraIDCARTEIRAINVEST: TFloatField;
    QryBuscaCarteiraDESCCARTINVEST: TStringField;
    QryBuscaCarteiraIDGESTORCARTEIRA: TFloatField;
    QryBuscaCarteiraFLGTRATALOTE: TStringField;
    QryBuscaCarteiraDATAINICIO: TDateTimeField;
    QryBuscaTitulo: TwwQuery;
    QryTitRenFixa: TwwQuery;
    qryIDCONTRATOINVEST: TFloatField;
    qryIDTIPOCONTRINVEST: TFloatField;
    qryIDINVESTIMENTO: TFloatField;
    qryIDEMISSOR: TFloatField;
    qryIDCORRETVALORES: TFloatField;
    qryIDBOLSAVALORES: TFloatField;
    qrySERIE: TStringField;
    qryIDLOTE: TStringField;
    qryDATACOMPRALOTE: TDateTimeField;
    qryDATAVENCIM: TDateTimeField;
    qryVLRCOMPRATITLOTE: TFloatField;
    qryPRECOVENCIM: TFloatField;
    qryQTDETITLOTE: TFloatField;
    qrySALDOTITLOTE: TFloatField;
    qryVLRRESGATE: TFloatField;
    qryPRZVENC: TFloatField;
    qryDATACARENCIA: TDateTimeField;
    qryANIVERSARIO: TFloatField;
    qryQTDECOMPRATITLOTE: TFloatField;
    qryIDCARTAVISTA: TFloatField;
    qryIDCARTLASTRO: TFloatField;
    qryIDCONTRATOMESTRE: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    dsTitRenFixa: TwwDataSource;
    updTitRenFixa: TUpdateSQL;
    QryTipoJuros: TwwQuery;
    QryMoeda: TwwQuery;
    UpdInvestimento: TUpdateSQL;
    QryInvestimento: TwwQuery;
    DsInvestimento: TwwDataSource;
    QryOperacaoInvest: TwwQuery;
    QryOperacaoInvestIDOPERACAOINVEST: TFloatField;
    QryOperacaoInvestIDCUSTODIANTE: TFloatField;
    QryOperacaoInvestIDCARTEIRAINVEST: TFloatField;
    QryOperacaoInvestIDTIPOINVEST: TFloatField;
    QryOperacaoInvestIDTIPOOPERACAO: TFloatField;
    QryOperacaoInvestIDINSTFIN: TFloatField;
    QryOperacaoInvestDATAOPERACAO: TDateTimeField;
    QryOperacaoInvestNUMDOCUMENTO: TStringField;
    QryOperacaoInvestQTDEOPERACAO: TFloatField;
    QryOperacaoInvestPRECOUNITOPERACAO: TFloatField;
    QryOperacaoInvestVLROPERACAO: TFloatField;
    QryOperacaoInvestDATAVENCOPER: TDateTimeField;
    QryOperacaoInvestIDINVESTIMENTO: TFloatField;
    QryOperacaoInvestEMPRESAPROP: TFloatField;
    QryOperacaoInvestIDFORCLI: TFloatField;
    QryOperacaoInvestIDCORRETVALORES: TFloatField;
    QryOperacaoInvestMOECODIGO: TFloatField;
    QryOperacaoInvestIDLOTE: TStringField;
    QryOperacaoInvestOBSERVACAO: TStringField;
    QryOperacaoInvestFLGCUSTODIA: TStringField;
    QryOperacaoInvestVLRIR: TFloatField;
    UpdOperacaoInvest: TUpdateSQL;
    DsOperacaoInvest: TwwDataSource;
    QryBuscaCorretora: TwwQuery;
    QryBuscaCorretoraIDCORRETVALORES: TFloatField;
    QryBuscaCorretoraSGLCORRETVALORES: TStringField;
    QryMoedaMOECODIGO: TFloatField;
    QryMoedaMOEDESC: TStringField;
    QryTipoContrato: TwwQuery;
    QryTipoContratoIDTIPOCONTRINVEST: TFloatField;
    QryTipoContratoDESCTIPOCTINVEST: TStringField;
    qryEtapas: TwwQuery;
    pnlPrincipal: TPanel;
    Label2: TLabel;
    dblCarteira: TwwDBLookupCombo;
    PageControl1: TPageControl;
    tbsDadosTitulo: TTabSheet;
    Dock974: TDock97;
    Toolbar973: TToolbar97;
    BtIncDet1: TSpeedButton;
    BtDelDet1: TSpeedButton;
    BtAltDet1: TSpeedButton;
    pnlDadosTitulo: TPanel;
    Label1: TLabel;
    dbLote: TDBEdit;
    Inativo: TDBCheckBox;
    tbsOperacao: TTabSheet;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    Dock977: TDock97;
    Toolbar974: TToolbar97;
    BtDelDet: TSpeedButton;
    BtAltDet: TSpeedButton;
    BtIncDet: TSpeedButton;
    Dock978: TDock97;
    Toolbar975: TToolbar97;
    BtOkDet: TBitBtn;
    BtCancDet: TBitBtn;
    BtVoltaDet: TBitBtn;
    Panel1: TPanel;
    dblOperacao: TwwDBLookupCombo;
    dbgOperacao: TwwDBGrid;
    QryAux: TwwQuery;
    QryTipoOperacao: TwwQuery;
    QryTipoOperacaoSIGLATIPOOPER: TStringField;
    QryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoOperacaoIDTIPOINVEST: TFloatField;
    QryTipoOperacaoIDMERCADO: TFloatField;
    qryParamInvest: TwwQuery;
    QryOperacaoInvestSIGLATIPOOPER: TStringField;
    dblTipoOperacao: TwwDBLookupCombo;
    qryOprRenFix: TwwQuery;
    UpdateSQL1: TUpdateSQL;
    qryOprRenFixIDOPERACAOINVEST: TFloatField;
    qryOprRenFixSALDOTIT: TFloatField;
    qryOprRenFixIDCORRETVALORES: TFloatField;
    qryOprRenFixIDREGRACALCUSADA: TFloatField;
    qryOprRenFixVLRAGIOOPER: TFloatField;
    QryTipoOperacaoNATUREZAOPERACAO: TStringField;
    QryInvestimentoIDINVESTIMENTO: TFloatField;
    QryInvestimentoIDTIPOINVEST: TFloatField;
    QryInvestimentoIDEMISSOR: TFloatField;
    QryInvestimentoIDMOEDACONTAB: TFloatField;
    QryInvestimentoDESCINVESTIMENTO: TStringField;
    QryInvestimentoFLGATIVO: TStringField;
    QryInvestimentoOBSINVESTIMENTO: TStringField;
    qryTmp: TwwQuery;
    QryBuscaTipoOperacao: TwwQuery;
    QryBuscaTipoOperacaoNATUREZAOPERACAO: TStringField;
    QryBuscaTipoOperacaoTIPCREDOR: TStringField;
    QryBuscaTipoOperacaoRECPAG: TStringField;
    QryBuscaTipoOperacaoDESCTIPOOPERACAO: TStringField;
    QryBuscaTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryBuscaTipoOperacaoIDMERCADO: TFloatField;
    Dock973: TDock97;
    Toolbar972: TToolbar97;
    BtOkDet1: TBitBtn;
    BtCancDet1: TBitBtn;
    BtVoltaDet1: TBitBtn;
    Label10: TLabel;
    dblTipoTituloRFixa: TwwDBLookupCombo;
    QryBuscaTipoOperacaoFLGTRATAIR: TStringField;
    dbeCodigoAtivo: TwwDBEdit;
    Label9: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Panel2: TPanel;
    Label4: TLabel;
    dbdDtaVencimeto: TCMDateTimePicker;
    Label7: TLabel;
    dblIndexador: TwwDBLookupCombo;
    Label3: TLabel;
    dbdDtaEmissao: TCMDateTimePicker;
    Label5: TLabel;
    dbrValJuros: TDBRealEdit;
    Label8: TLabel;
    dbrValPercentual: TDBRealEdit;
    dblTaxaJuros: TwwDBLookupCombo;
    Label6: TLabel;
    Panel3: TPanel;
    Label19: TLabel;
    dbmObservacao: TDBMemo;
    Panel4: TPanel;
    QryBuscaTituloIDEMISSORXTITULO: TFloatField;
    QryBuscaTituloIDEMISSOR: TFloatField;
    QryBuscaTituloCODTIPRENFIXA: TStringField;
    QryBuscaTituloMNEMONICO: TStringField;
    QryTitRenFixaIDTITRENFIXA: TFloatField;
    QryTitRenFixaCODTIPTXPREMIO: TFloatField;
    QryTitRenFixaINDEXRENFIX: TFloatField;
    QryTitRenFixaCODTIPRENFIXA: TStringField;
    QryTitRenFixaCODTIPTXJUROS: TFloatField;
    QryTitRenFixaSERIETITRENFIX: TStringField;
    QryTitRenFixaIDALTTITRENFIX: TStringField;
    QryTitRenFixaDATAEMTITRENFIX: TDateTimeField;
    QryTitRenFixaDATAVENCTITRENFIX: TDateTimeField;
    QryTitRenFixaDATAINIJURRENFIX: TDateTimeField;
    QryTitRenFixaDATABASEINDRENFIX: TDateTimeField;
    QryTitRenFixaJUROSRENFIX: TFloatField;
    QryTitRenFixaPREMIORENFIX: TFloatField;
    QryTitRenFixaJUROSDIA: TFloatField;
    QryTitRenFixaPREMIODIA: TFloatField;
    QryTitRenFixaIDINDSWAPFIX: TFloatField;
    QryTitRenFixaVLRRESGATE: TFloatField;
    QryTitRenFixaTRGDTINCLUSAO: TDateTimeField;
    QryTitRenFixaTRGUSERINCLUSAO: TStringField;
    QryTitRenFixaIDCUSTODIANTE: TFloatField;
    QryTitRenFixaDIASCOTACOMPRA: TFloatField;
    QryTitRenFixaDIASCOTAVENDA: TFloatField;
    QryTitRenFixaPERCINDEX: TFloatField;
    QryTitRenFixaCARENCIA: TFloatField;
    QryTitRenFixaPERIODICIDADE: TFloatField;
    QryTitRenFixaFLGSAQUEPARCIAL: TStringField;
    QryTitRenFixaSALDOVLRRESGATE: TFloatField;
    QryTitRenFixaNUMCASASDEC: TFloatField;
    QryTitRenFixaDATAINITR: TDateTimeField;
    QryTitRenFixaINDEXRENFIX2: TFloatField;
    QryTitRenFixaDATABASEINDRENFX2: TDateTimeField;
    QryTitRenFixaPERCINDEX2: TFloatField;
    QryTitRenFixaJUROSRENFIX2: TFloatField;
    QryTitRenFixaCODTIPTXJUROS2: TFloatField;
    QryTitRenFixaDATAINIJURRENFIX2: TDateTimeField;
    QryTitRenFixaFLGINDICE2: TStringField;
    QryTitRenFixaDIASPRAZOANBID: TFloatField;
    QryTitRenFixaDIASPRAZOANBID2: TFloatField;
    QryTitRenFixaIDMOEDAREG: TFloatField;
    QryTitRenFixaCODATIVOCUST: TStringField;
    QryTitRenFixaFLGPU: TFloatField;
    QryTitRenFixaFLGINTERPOLA: TStringField;
    QryTitRenFixaFLLGPRORATA: TStringField;
    QryTitRenFixaFLGPREPOS: TFloatField;
    QryBuscaTituloFLGPREPOS: TFloatField;
    function  VerificaDados : Boolean;

    procedure HabilitaPrincipal;
    procedure DesabilitaPrincipal;

    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtCancDet1Click(Sender: TObject);
    procedure BtOkDet1Click(Sender: TObject);
    procedure BtOkDetClick(Sender: TObject);
    procedure BtCancDetClick(Sender: TObject);
    procedure BtIncDet1Click(Sender: TObject);
    procedure BtAltDet1Click(Sender: TObject);
    procedure BtIncDetClick(Sender: TObject);
    procedure BtAltDetClick(Sender: TObject);
    procedure dbgOperacaoExit(Sender: TObject);
    procedure dbgOperacaoEnter(Sender: TObject);
    procedure dbgOperacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgOperacaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryOperacaoInvestBeforePost(DataSet: TDataSet);
    procedure BtDelDetClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DsOperacaoInvestDataChange(Sender: TObject; Field: TField);
    procedure dblTipoOperacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dsStateChange(Sender: TObject);
    procedure dsTitRenFixaStateChange(Sender: TObject);
    procedure DsOperacaoInvestStateChange(Sender: TObject);
    procedure QryOperacaoInvestQTDEOPERACAOSetText(Sender: TField;
      const Text: String);
    procedure dbrValJurosChange(Sender: TObject);
    procedure dblIndexadorExit(Sender: TObject);
    procedure BtDelDet1Click(Sender: TObject);
    procedure dblCarteiraChange(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure dblTaxaJurosExit(Sender: TObject);
    procedure dbdDtaEmissaoExit(Sender: TObject);
    procedure dblTipoTituloRFixaExit(Sender: TObject);
    procedure dblIndexadorChange(Sender: TObject);

  private
    { Private declarations }
    wVlrIRProv : Double;
    wPriOper: Boolean;
    wInvest : String;
    wTitRenFixa: String;
    wContInv: String;
    function RetTipoOperacao(Natureza, DataBase : String) : Longint;
    procedure LevantaBotoes;
//    procedure LevantaBotoesDetTit;
//    procedure LevantaBotoesDetOpe;
    procedure HabilitaBotoesDetTit(Inc, Alt, Del, Levanta: Boolean);
    procedure HabilitaBotoesDetOpe(Inc, Alt, Del, Levanta: Boolean);
    function TemCamposIR : Boolean;
    procedure ProcessaIR;
    procedure LimpaForm;
  public
    { Public declarations }
  end;

var
  frmCadContratoRendaFixa: TfrmCadContratoRendaFixa;
  bDados, bAltera, bTrocaLine : Boolean;
  iIdHistCartInv : Integer;
  fVrlRendimento : Double;

implementation

uses DBaseDados, UBibliotecaInvest, UMensErro, FCadCotacaoInvest, USistema, UDataBase,
     uOperComum, UDocumento, UImpostos;

{$R *.DFM}

Function StripChar(S : String; C : Char) : String;
var
  I : integer;
  sAux : String;
begin
  sAux := '';
  For I := 1 To Length(S) Do
    If S[I] <> C Then
       sAux := sAux + S[I];
  Result := sAux;
end;

function DivNonZero(X, Y : extended) : Extended;
begin
  if y = 0 then
    Result := 0
  else
    Result := X/Y;
end;

function TfrmCadContratoRendaFixa.RetTipoOperacao(Natureza, DataBase : String) : Longint;
Var
  qryRet : TwwQuery;
begin
  qryRet := TwwQuery.Create(Application);
  try
    qryRet.DatabaseName := DataBase;
    qryRet.SQL.Clear;
    qryRet.SQL.Add('SELECT T.IDTIPOOPERACAO');
    qryRet.SQL.Add('FROM TIPOOPERACAO T');
    qryRet.SQL.Add('WHERE');
    qryRet.SQL.Add('  T.IDTIPOINVEST = 1 AND');
    qryRet.SQL.Add('  T.IDTIPOOPERACAO IN');
    qryRet.SQL.Add('             (SELECT IDTIPOOPERACAO');
    qryRet.SQL.Add('              FROM ETAPACONTRATOINV');
    qryRet.SQL.Add('              WHERE  IDTIPOCONTRINVEST  = :P_IDTIPOCONTRINVEST) AND');
    qryRet.SQL.Add('  T.NATUREZAOPERACAO = :P_NATUREZAOPERACAO');
    qryRet.ParamByName('P_IDTIPOCONTRINVEST').AsInteger := pRPI.IDTIPOCONTRRF;
    qryRet.ParamByName('P_NATUREZAOPERACAO').AsString   := Natureza;
    qryRet.Open;
    Result := qryRet.FieldByName('IDTIPOOPERACAO').AsInteger;
  finally
    qryRet.Close;
    qryRet.Free;
  end;
end;

procedure TfrmCadContratoRendaFixa.HabilitaPrincipal;
Begin
   pnlPrincipal.Enabled       := True;
   Label2.Enabled             := True;
   dblCarteira.Enabled        := True;
End;

procedure TfrmCadContratoRendaFixa.DesabilitaPrincipal;
Begin
   pnlPrincipal.Enabled       := False;
   Label2.Enabled             := False;
   dblCarteira.Enabled        := False;
End;

procedure TfrmCadContratoRendaFixa.LevantaBotoes;
begin
  sbtnAlterar.Down := False;
  sbtnInserir.Down := False;
  sbtnApagar.Down  := False;
  sbtnProcurar.Enabled := True;
end;

{procedure TfrmCadContratoRendaFixa.LevantaBotoesDetTit;
begin
  BtAltDet1.Down := False;
  BtIncDet1.Down := False;
  BtDelDet1.Down := False;
end;

procedure TfrmCadContratoRendaFixa.LevantaBotoesDetOpe;
begin
  BtAltDet.Down := False;
  BtIncDet.Down := False;
  BtDelDet.Down := False;
end;}

procedure TfrmCadContratoRendaFixa.HabilitaBotoesDetTit(Inc, Alt, Del, Levanta: Boolean);
//procedure TfrmCadContratoRendaFixa.HabilitaBotoesDetTit(Habilita : Boolean);
begin
{  BtIncDet1.Enabled := Habilita and (QryTitRenFixa.IsEmpty);
  BtAltDet1.Enabled := Habilita and (QryTitRenFixa.State = dsEdit);
  BtDelDet1.Enabled := Habilita and (QryTitRenFixa.State = dsEdit);}

  BtIncDet1.Enabled := Inc and (QryTitRenFixa.State = dsBrowse);
  BtAltDet1.Enabled := Alt and (not QryTitRenFixa.IsEmpty);
  BtDelDet1.Enabled := Del and (not QryTitRenFixa.IsEmpty);

  if Levanta then begin
     BtAltDet1.Down := False;
     BtIncDet1.Down := False;
     BtDelDet1.Down := False;
  end;
end;

procedure TfrmCadContratoRendaFixa.HabilitaBotoesDetOpe(Inc, Alt, Del, Levanta: Boolean);
//procedure TfrmCadContratoRendaFixa.HabilitaBotoesDetOpe(Inc, Alt, Del: Boolean);
begin
{  BtIncDet.Enabled := Habilita and (QryOperacaoInvest.IsEmpty);
  BtAltDet.Enabled := Habilita and (QryOperacaoInvest.State = dsEdit);
  BtDelDet.Enabled := Habilita and (QryOperacaoInvest.State = dsEdit);}

  BtIncDet.Enabled := Inc and (QryOperacaoInvest.State = dsBrowse);
  BtAltDet.Enabled := Alt and (not QryOperacaoInvest.IsEmpty);
  BtDelDet.Enabled := Del and (not QryOperacaoInvest.IsEmpty);

  if Levanta then begin
     BtAltDet.Down := False;
     BtIncDet.Down := False;
     BtDelDet.Down := False;
  end;
end;

Procedure TfrmCadContratoRendaFixa.CmeCadastroFind(Sender: TObject);
Begin
   If (MontaSelect.ValoresChave.Count > 0) And (MontaSelect.ValoresChave[0] <> '') Then
   Begin
      dblTaxaJuros.Enabled := True;

      Qry.Close;
      Qry.ParamByName('IDCONTRATOINVEST').AsInteger :=
                                                 StrToInt(MontaSelect.ValoresChave[0]);
      Qry.Open;

      QryBuscaCarteira.Locate('IDCARTEIRAINVEST',Qry.FieldByName('IDCARTLASTRO').AsString, []);
      dblCarteira.Text := QryBuscaCarteira.FieldByName('DESCCARTINVEST').AsString;

      QryInvestimento.Close;
      QryInvestimento.ParamByName('IDINVESTIMENTO').AsInteger :=
                                                 StrToInt(MontaSelect.ValoresChave[1]);
      QryInvestimento.Open;

      QryOperacaoInvest.Close;
      QryOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   :=
                                                 StrToInt(MontaSelect.ValoresChave[1]);
      QryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                                                 StrToInt(MontaSelect.ValoresChave[2]);
      QryOperacaoInvest.Open;

      QryBuscaTitulo.Close;
      QryBuscaTitulo.Open;

      QryMoeda.Close;
      QryMoeda.Open;

      QryTipoJuros.Close;
      QryTipoJuros.Open;

      QryTitRenFixa.Close;
      QryTitRenFixa.paramByName('IDTITRENFIXA').AsInteger :=
                                                 StrToInt(MontaSelect.ValoresChave[1]);
      QryTitRenFixa.Open;

      QryEtapas.Close;
      QryEtapas.ParamByName('IDTIPOCONTRINVEST').AsInteger :=
                                                 StrToInt(MontaSelect.ValoresChave[0]);
      QryEtapas.Open;

      If QryBuscaTitulo.Locate('IDEMISSOR;CODTIPRENFIXA',
            VarArrayOf([MontaSelect.ValoresChave[4] ,
            QryTitRenFixa.FieldByName('CODTIPRENFIXA').AsString]), [loPartialKey]) Then
         dblTipoTituloRFixa.Text := QryBuscaTitulo.FieldByName('MNEMONICO').AsString
      Else
         dblTipoTituloRFixa.Text := '';


      HabilitaBotoesDetTit(True, True, True, False);
      HabilitaBotoesDetOpe(True, True, True, False);
   End;
End;

procedure TfrmCadContratoRendaFixa.FormShow(Sender: TObject);
begin
   inherited;
   QryBuscaCarteira.Open;
   QryParamInvest.Open;
   QryTipoOperacao.Close;
   QryTipoOperacao.ParamByName('IDTIPOCONTRINVEST').AsInteger := pRPI.IDTIPOCONTRRF;
   QryTipoOperacao.Open;
   QryTipoContrato.Open;
   QryEtapas.Open;
   Qry.Open;
   QryBuscaTitulo.Open;
   QryTitRenFixa.Open;
   QryOperacaoInvest.Open;
   QryInvestimento.Open;
   QryTipoJuros.Open;
   QryMoeda.Open;
   QryBuscaCorretora.Open;
   qryOprRenFix.Open;

   dbgOperacao.Font.Color  := clGray;
   dbgOperacao.Color       := clSilver;

   bTrocaLine              := True;
   bDados                  := True;

   pnlFundo.Enabled        := True;
   pnlPrincipal.Enabled    := True;
   PageControl1.Enabled    := True;
   PageControl1.ActivePage := tbsDadosTitulo;

   wPriOper                := True;
end;

procedure TfrmCadContratoRendaFixa.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   pnlPrincipal.Enabled := True;
   pnlFundo.Enabled     := True;
   PageControl1.Enabled := True;

   bAltera              := True;
   If QryInvestimento.FieldByName('FLGATIVO').AsString <> 'S' Then
      Inativo.Checked   := False;

   PageControl1.ActivePage := tbsDadosTitulo;

end;

procedure TfrmCadContratoRendaFixa.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  If Key = VK_Return Then      //Enter - Troca de Campo
     SelectNext(ActiveControl,True,True)
end;

procedure TfrmCadContratoRendaFixa.bbtnConfirmarClick(Sender: TObject);
Var
  iErro : Integer;
begin
   iErro := 0;
   // Dados para a tabela de INVESTIMENTO
   If (Not bDados) Then
   Begin
     MsgDlg('Confirme os Dados do Título.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     PageControl1.ActivePage := tbsDadosTitulo;
     BtOkDet1.SetFocus;
     Exit;
   end;

   Try
      // Posta o Registro INVESTIMENTO
      iErro := 1;
      QryInvestimento.ApplyUpdates;
      QryInvestimento.CommitUpdates;


      // Dados para a tabela de TITRENFIXA
      iErro := 2;
      QryTitRenFixa.ApplyUpdates;
      QryTitRenFixa.CommitUpdates;

      // Dados para a tabela de OPERACAOINVEST
      iErro := 3;
      QryOperacaoInvest.ApplyUpdates;
      QryOperacaoInvest.CommitUpdates;


      // Dados para a tabela de OPRRENFIX
      iErro := 4;
      qryOprRenFix.ApplyUpdates;
      qryOprRenFix.CommitUpdates;


      // Dados para a tabela de CONTRATOINVESTIM
      iErro := 5;
      Qry.ApplyUpdates;
      Qry.CommitUpdates;

      // Comita transação
      DtmBaseDados.dbBaseDados.Commit;
   Except
      MsgDlg(Format('Operação não pode ser efetuada. Erro ao atualizar a tabela %S',
                                                                   [V_ERRO[iErro]]),
                    'Mensagem do Sistema',
                    MtWarning,[MbOk],0);
      DtmBaseDados.dbBaseDados.Rollback;
      BbtnCancelar.Click;
      Exit;
   End;
   HabilitaPrincipal;

   pnlPrincipal.Enabled  := False;
   pnlDadosTitulo.Enabled:= False;
   bDados                := True;
end;

procedure TfrmCadContratoRendaFixa.sbtnApagarClick(Sender: TObject);
Var
   sIDINVESTIMENTO : String;
begin
   if not QryOperacaoInvest.IsEmpty Then
      begin
        MsgDlg('Não é possível excluir ', 'Mensagem do Sistema ',
        mtError , [mbOK], 0);
        Exit;
      end;

   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      Exit;
   End;

   sIDINVESTIMENTO := Qry.FieldByName('IDINVESTIMENTO').AsString;

   DtmBaseDados.dbBaseDados.StartTransaction;
   Try
     // TITRENFIXA
     QryTitRenFixa.Delete;
     QryTitRenFixa.ApplyUpdates;
     QryTitRenFixa.CommitUpdates;

     // CONTRATOINVESTIM
     Qry.Delete;
     Qry.ApplyUpdates;
     Qry.CommitUpdates;

     // INVESTIMENTO
     ExecutarQuery(QryAux,
       'DELETE FROM INVESTIMENTO WHERE IDINVESTIMENTO = '''+sIDINVESTIMENTO+'''');
   Except
      DtmBaseDados.dbBaseDados.Rollback;
      BtCancDet1.Click;
      Exit;
   End;

   DtmBaseDados.dbBaseDados.Commit;

   sbtnAlterar.Enabled    := False;
   sbtnApagar.Enabled     := False;
   Inativo.Checked        := False;

   dblTipoTituloRFixa.Text:= '';
   dblTipoTituloRFixa.Text:= '';
   dbdDtaEmissao.Text     := '';
   dbdDtaVencimeto.Text   := '';
   dbLote.Text            := '';
   dbrValJuros.Value      :=  0;
   dblTaxaJuros.Text      := '';
   dblIndexador.Text      := '';
   dbrValPercentual.Value :=  0;
   dbmObservacao.Text     := '';

   QryOperacaoInvest.Close;
   QryOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   := -1;
   QryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := -1;
   QryOperacaoInvest.Open;
end;

procedure TfrmCadContratoRendaFixa.CmeCadastroInsert(Sender: TObject);
begin
    if not dtmBaseDados.dbBaseDados.InTransaction then
       dtmBaseDados.dbBaseDados.StartTransaction;

    Qry.Append;
    QryOprRenFix.Append;

    Inativo.Checked := False;

    QryOperacaoInvest.Close;
    QryOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   := -1;
    QryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := -1;
    QryOperacaoInvest.Open;

    BtIncDet1.Enabled      := True;

    dblOperacao.Clear;
    dblTipoTituloRFixa.Clear;
    dbdDtaEmissao.Clear;
    dbdDtaVencimeto.Clear;
    dbLote.Clear;
    dbrValJuros.Clear;
    dblTaxaJuros.Clear;
    dblIndexador.Clear;
    dbrValPercentual.Clear;
    dbmObservacao.Clear;

    dblOperacao.Text       := '';
    dblTipoTituloRFixa.Text:= '';
    dbdDtaEmissao.Text     := '';
    dbdDtaVencimeto.Text   := '';
    dbLote.Text            := '';
    dbrValJuros.Value      :=  0;
    dblTaxaJuros.Text      := '';
    dblIndexador.Text      := '';
    dbrValPercentual.Value :=  0;
    dbmObservacao.Text     := '';
end;

procedure TfrmCadContratoRendaFixa.bbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCadContratoRendaFixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I : Integer;
begin
  inherited;
   if DtmBaseDados.dbBaseDados.InTransaction Then
      DtmBaseDados.dbBaseDados.Rollback;
   for I := 0 To Pred(Self.ComponentCount) Do
     if Self.Components[I] is TDataSet Then
        TDataSet(Self.Components[I]).Close;
end;

function TfrmCadContratoRendaFixa.VerificaDados : Boolean;
begin
   Result := True;
   If dblCarteira.Text = '' Then
   Begin
      MsgDlg('Informar a Carteira .          ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      HabilitaPrincipal;
      PageControl1.ActivePage := tbsDadosTitulo;
      pnlPrincipal.Enabled := True;
      dblCarteira.SetFocus;
      bDados := False;
      Result := False;
      Exit;
   End;
   If dblTipoTituloRFixa.Text = '' Then
   Begin
      MsgDlg('Informar o Título.             ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      HabilitaPrincipal;
      PageControl1.ActivePage := tbsDadosTitulo;
      dblTipoTituloRFixa.SetFocus;
      bDados := False;
      Result := False;
      Exit;
   End;
   If dbdDtaEmissao.Text = '' Then
   Begin
      MsgDlg('Informar a Data de Emissão.    ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      PageControl1.ActivePage := tbsDadosTitulo;
      HabilitaPrincipal;
      dbdDtaEmissao.SetFocus;
      bDados := False;
      Result := False;
      Exit;
   End;
   If dbdDtaVencimeto.Text = '' Then
   Begin
      MsgDlg('Informar a Data de Vencimento. ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      PageControl1.ActivePage := tbsDadosTitulo;
      HabilitaPrincipal;
      dbdDtaVencimeto.SetFocus;
      bDados := False;
      Result := False;
      Exit;
   End;
   If dbLote.Text = '' Then
   Begin
      MsgDlg('Informar o Lote.               ','Mensagem do Sistema',
             MtWarning,[MbOk],0);
      PageControl1.ActivePage := tbsDadosTitulo;
      pnlDadosTitulo.Enabled := True;
      dbLote.SetFocus;
      bDados := False;
      Result := False;
      Exit;
   End;
end;

procedure TfrmCadContratoRendaFixa.BtCancDet1Click(Sender: TObject);
Var
  I : Integer;
begin
   HabilitaBotoesDetTit( True, True, True, True);
   LevantaBotoes;
   pnlDadosTitulo.Enabled := False;

   HabilitaPrincipal;

   if qry.State = dsInsert then
      LimpaForm;

   for I := 0 To Pred(ComponentCount) do
      if Components[I] is TwwQuery Then
         if TwwQuery(Components[I]).UpdateObject <> nil then
         begin
           TwwQuery(Components[I]).Cancel;
           TwwQuery(Components[I]).CancelUpdates;
         end;

   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

   BtVoltaDet1.Enabled   := False;

{                                         // Em que a tabela de Operações influencia o estado
                                         // dos botões de incluão de novo contrato
   If Not QryOperacaoInvest.Eof Then
   Begin
      BtAltDet1.Enabled  := True;
      BtDelDet1.Enabled  := True;
   End
   Else
   Begin
      BtIncDet1.Enabled  := True;
      BtAltDet1.Down     := False;
      BtDelDet1.Down     := False;
   End;}
end;

procedure TfrmCadContratoRendaFixa.BtOkDet1Click(Sender: TObject);
Var
  bInserindo : Boolean;
Var
  iErro : Integer;
begin
   bInserindo := (qry.State = dsInsert);
   DesabilitaPrincipal;
   bDados := True;
   iErro  := 0;

   If Not VerificaDados Then
      Exit;

   If qry.State = dsInsert Then
   Begin
      Qry.FieldByName('IDCARTLASTRO').AsInteger     := QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;

      Qry.FieldByName('IDCONTRATOINVEST').AsInteger :=  LeUltRegistro(Nil,'CONTRATOINVESTIM');

      Qry.FieldByName('IDTIPOCONTRINVEST').AsInteger := pRPI.IDTIPOCONTRRF;

      QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger :=  LeUltRegistro(Nil,'INVESTIMENTO');

      QryInvestimento.FieldByName('IDTIPOINVEST').AsInteger   := 1;

      QryInvestimento.FieldByName('IDEMISSOR').AsInteger :=
                    QryBuscaTitulo.FieldByName('IDEMISSOR').AsInteger;

      QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString :=
                    QryBuscaTitulo.FieldByName('MNEMONICO').AsString;

      Qry.FieldByName('IDINVESTIMENTO').AsInteger :=
                    QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

      Qry.FieldByName('IDEMISSOR').AsInteger :=
                    QryBuscaTitulo.FieldByName('IDEMISSOR').AsInteger;

      Qry.FieldByName('IDTIPOINVEST').AsInteger := 1;

      QryTitRenFixa.FieldByName('IDTITRENFIXA').AsInteger :=
                    QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
   End;

   Qry.Post;
   QryInvestimento.Post;
   QryTitRenFixa.Post;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
   Try
     // Posta o Registro INVESTIMENTO
     iErro := 1;
     QryInvestimento.ApplyUpdates;
     QryInvestimento.CommitUpdates;

     // Dados para a tabela de TITRENFIXA
     iErro := 2;
     QryTitRenFixa.ApplyUpdates;
     QryTitRenFixa.CommitUpdates;


     // Dados para a tabela de CONTRATOINVESTIM
     iErro := 5;
     Try
        Qry.ApplyUpdates;
        Qry.CommitUpdates;
     Except
        MsgDlg(Format('Operação não pode ser efetuada. Erro ao atualizar a tabela %S.',
                                                                  [V_ERRO[iErro]]),
                      'Mensagem do Sistema',
                      MtWarning,[MbOk],0);
     End;
     DtmBaseDados.dbBaseDados.Commit;
   Except
     MsgDlg(Format('Operação não pode ser efetuada. Erro ao atualizar a tabela %S.',
                                                                  [V_ERRO[iErro]]),
                   'Mensagem do Sistema',
                   MtWarning,[MbOk],0);
     DtmBaseDados.dbBaseDados.Rollback;
     BbtnCancelar.Click;
     Exit;
   end;

   // Marca como sendo a aplicação da primeira operação com o título
   if wPriOper then begin
      wInvest := QryInvestimento.FieldByName('IDINVESTIMENTO').AsString;
      wTitRenFixa := QryTitRenFixa.FieldByName('IDTITRENFIXA').AsString;
      wContInv := qry.FieldByName('IDCONTRATOINVEST').AsString;
      end
   else begin
      wInvest := '-1';
      wTitRenFixa := '-1';
      wContInv := '-1';
   end;


   pnlDadosTitulo.Enabled  := False;
   PageControl1.ActivePage := tbsOperacao;

//   HabilitaBotoesDetTit(False, False, False, False);
   HabilitaBotoesDetOpe(True, False, False, False);
   BtVoltaDet.Enabled:= False;

   if bInserindo Then
   begin
      sbtnAlterar.Click;
      BtIncDet.Click;
   end;
end;

procedure TfrmCadContratoRendaFixa.BtOkDetClick(Sender: TObject);
Var
  sIdLote, sMensErro, wTipoRecDesBol : string;
//  iErro : Integer;
  wIdForCli : Integer;
  wSaldoQtd, wSaldoInutil : Double;
  wPlano, wPlanilha, wDocumento : Integer;
  wSaldoVlrResgate : Extended;
  bCriaLancto, bSucesso : Boolean;
//  eJurosDia : Extended;
begin
   bTrocaLine := True;
   bSucesso := False;
   sIdLote := Qry.FieldByName('IDLOTE').AsString;
   If QryOperacaoInvest.State = dsInsert Then
      QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger :=
                        LeUltRegistro(nil,'OPERACAOINVEST');

   QryOperacaoInvest.FieldByName('DATAVENCOPER').AsDateTime :=
                     QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime;
   QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                              QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
   QryOperacaoInvest.FieldByName('IDTIPOINVEST').AsInteger := 1;
   QryOperacaoInvest.FieldByName('NUMDOCUMENTO').AsString  :=
                                    Qry.FieldByName('IDLOTE').AsString;
   QryOperacaoInvest.FieldByName('IDLOTE').AsString :=
                     Qry.FieldByName('IDLOTE').AsString;
   QryOperacaoInvest.FieldByName('IDINVESTIMENTO').AsInteger :=
                     QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;
   QryOperacaoInvest.Post;

   qryOprRenFix.FieldByName('IDOPERACAOINVEST').AsInteger :=
                     QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger;
   qryOprRenFix.FieldByName('IDCORRETVALORES').AsInteger :=
                     QryBuscaCorretora.FieldByName('IDCORRETVALORES').AsInteger;
   qryOprRenFix.Post;
   //

   If QryBuscaTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'A' Then
   Begin
     Qry.Edit;
     Qry.FieldByName('VLRCOMPRATITLOTE').AsFloat    :=
                   QryOperacaoInvest.FieldByName('VLROPERACAO').AsFloat;
     Qry.FieldByName('QTDECOMPRATITLOTE').AsFloat   :=
                   QryOperacaoInvest.FieldByName('QTDEOPERACAO').AsFloat;

     Qry.FieldByName('DATAVENCIM').AsDateTime:=
          QryTitRenFixa.FieldByName('DATAVENCTITRENFIX').AsDateTime;

     QryTitRenFixa.Edit;
     QryTitRenFixa.FieldByName('VLRRESGATE').AsString:= QryOperacaoInvestVLROPERACAO.AsString;
     QryTitRenFixa.Post;
     QryTitRenFixa.ApplyUpdates;
     QryTitRenFixa.CommitUpdates;
     Qry.Post;
   End;

   if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Try
     Try
       // Dados para a tabela de OPERACAOINVEST
//       iErro := 3;
       QryOperacaoInvest.ApplyUpdates;
       QryOperacaoInvest.CommitUpdates;


       // Dados para a tabela de OPRRENFIX
//       iErro := 4;
       qryOprRenFix.ApplyUpdates;
       qryOprRenFix.CommitUpdates;

//       iErro := 5;
       qry.ApplyUpdates;
       qry.CommitUpdates;

       QryTitRenFixa.ApplyUpdates;
       QryTitRenFixa.CommitUpdates;

       If QryBuscaTipoOperacao.FieldByName('TIPCREDOR').AsString <> '' Then
          Begin
            If QryBuscaTipoOperacao.FieldByName('TIPCREDOR').AsString = 'CO' Then
               Begin
                 Try
                   If QryBuscaTipoOperacao.FieldByName('RECPAG').AsString = 'R' Then
                      Documento.ForCli.Inserir(QryOperacaoInvest.FieldByName('IDCORRETVALORES').AsInteger,
                                               Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTECOR,Sistema.IdEmpresa,
                                               '','','','','C',False) // Cliente

                   else
                     If QryBuscaTipoOperacao.FieldByName('RECPAG').AsString = 'P' Then
                        Documento.ForCli.Inserir(QryOperacaoInvest.FieldByName('IDCORRETVALORES').AsInteger,
                                                 Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFORCOR,Sistema.IdEmpresa,
                                                 '','','','','F',False); // Fornecedor

                 Except
                 End;
                 wIdForCli:=QryOperacaoInvest.FieldByName('IDCORRETVALORES').AsInteger;
               End
            Else
              Begin
                // Transforma Emissor em Fornecedor
                Try
                  If QryBuscaTipoOperacao.FieldByName('RECPAG').AsString = 'R' Then
                     Documento.ForCli.Inserir(qry.FieldByName('IDEMISSOR').AsInteger,
                                              Sistema.IdEmpresa,-1,0,pRPI.IDTIPOCLIENTEEMI,Sistema.IdEmpresa,
                                              '','','','','C',False) // Cliente
                  else
                    If QryBuscaTipoOperacao.FieldByName('RECPAG').AsString = 'P' Then
                       Documento.ForCli.Inserir(qry.FieldByName('IDEMISSOR').AsInteger,
                                                Sistema.IdEmpresa,-1,0,pRPI.IDRAMOFOREMI,Sistema.IdEmpresa,
                                                '','','','','F',False); // Fornecedor

                Except  // Função gerava um Abort quando o Fornecedor
                End;    // já estava cadastrado
                wIdForCli:=qry.FieldByName('IDEMISSOR').AsInteger;
              End;

          End
       Else
          Begin
            // Busca o Credor no Sub........
            qryTmp.Close;
            qryTmp.SQL.Clear;
            qryTmp.SQL.Add('SELECT IDFORCLI');
            qryTmp.SQL.Add('FROM FORCLIXTIPOPER');
            qryTmp.SQL.Add('WHERE (IDTIPOINVEST   = :P_IDTIPOINVEST) AND');
            qryTmp.SQL.Add('      (IDTIPOOPERACAO = :P_IDTIPOOPERACAO) AND');
            qryTmp.SQL.Add('      (EMPRESAPROP    = :P_EMPRESAPROP)');
            qryTmp.ParamByName('P_IDTIPOINVEST').AsInteger :=
                 QryOperacaoInvest.FieldByName('IDTIPOINVEST').AsInteger;
            qryTmp.ParamByName('P_IDTIPOOPERACAO').AsInteger :=
                 QryOperacaoInvest.FieldByName('IDTIPOOPERACAO').AsInteger;
            qryTmp.ParamByName('P_EMPRESAPROP').AsInteger := Sistema.IdEmpresa;
            qryTmp.Open;
            wIdForCli:=qryTmp.FieldByName('IDFORCLI').AsInteger;
            qryTmp.Close;
            // Caso não encontre o Fornecedor
            If wIdForCli = 0 Then
               Begin
                 raise Exception.Create('O Credor deste Tipo de Operação não foi Informado, '+#13+
                        'A operação não será efetuada!');
               end;
          end;

//       iErro := 3;
       QryOperacaoInvest.Edit;
       QryOperacaoInvest.FieldByName('IDFORCLI').AsInteger := wIdForCli;
       QryOperacaoInvest.Post;
       QryOperacaoInvest.ApplyUpdates;
       QryOperacaoInvest.CommitUpdates;

       if QryOperacaoInvestIDCARTEIRAINVEST.AsString <> '' then
          begin
            if qryBuscaTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' then
               begin
                 If not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                        Qry.FieldByName('IDINVESTIMENTO').AsInteger, 1,
                        QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                        QryOperacaoInvest.FieldByName('IDTIPOOPERACAO').AsInteger,
                        QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        0{IDCARTEIRAGERENC},                        
                        -1, -1, -1, -1, -1,
                        QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime,
                        QryOperacaoInvest.FieldByName('VLROPERACAO').AsFloat,
                        QryOperacaoInvest.FieldByName('QTDEOPERACAO').AsFloat,
                        pRPI.VLRCOTAINICART,  0 {Juros}, 0, 0, 0, 0, 0, 0, 0, 0,
                        'L' {Movimento},
                        qryBuscaTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString {Operacao},
                        sIdLote,
                        'LUCRO/PREJUIZO NA VENDA'+' - '+
                        QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString,
                        'LUC', '', '', True,
                        -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
                    Exit;
                 qryTmp.Close;
                 qryTmp.SQL.Clear;
                 qryTmp.SQL.Add('UPDATE HISTCARTINV');
                 qryTmp.SQL.Add('SET FLGCALCSALDO = TO_CHAR(1)');
                 qryTmp.SQL.Add('WHERE 	(TIPMOVCARTINV    = ''LUC'') AND ');
                 qryTmp.SQL.Add('IDOPERACAOINVEST = TO_CHAR(:P_IDOPERACAOINVEST)');
                 qryTmp.ParamByName('P_IDOPERACAOINVEST').AsInteger :=
                      QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger;
                 qryTmp.ExecSQL;

                 If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART, -1) Then
                    begin
                      raise Exception.Create('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                             'esta Operação não poderá ser confirmada ');
                    end;
               end;

            If Not OperComum.AlimentaCarteira(Sistema.IdEmpresa, 79,
                       Qry.FieldByName('IDINVESTIMENTO').AsInteger, 1,
                       QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger, -1,
                       QryOperacaoInvest.FieldByName('IDTIPOOPERACAO').AsInteger,
                       QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                        0{IDCARTEIRAGERENC},                       
                       -1, -1, -1, -1, -1,
                       QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime,
                       QryOperacaoInvest.FieldByName('VLROPERACAO').AsFloat,
                       QryOperacaoInvest.FieldByName('QTDEOPERACAO').AsFloat,
                       pRPI.VLRCOTAINICART, 0 {Variacao}, 0 {Juros }, wVlrIRProv,
                       QryOperacaoInvest.FieldByName('VLRIR').AsFloat, 0, 0, 0, 0, 0,
                       QryBuscaTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                       QryBuscaTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString,
                       sIdLote,
                       QryBuscaTipoOperacao.FieldByName('DESCTIPOOPERACAO').AsString+' / '+
                       QryInvestimento.FieldByName('DESCINVESTIMENTO').AsString,
                       'OPE','', '', True,
                       -1, iPlanPrevCtbPatro,iIdHistCartInv) Then
               Exit;
            If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART, -1) Then
                    begin
                      raise Exception.Create('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                             'esta Operação não poderá ser confirmada ');
                    end;
          end;

       If QryTitRenFixa.FieldByName('VLRRESGATE').AsFloat <> 0 then
          begin
            wSaldoQtd := 0;
            //AL_1
            //AL_2
            OperComum.BuscaTodosSaldosInvestLote(
              QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
              0{IDCARTEIRAGERENC},
              QryOperacaoInvest.FieldByName('IDINVESTIMENTO').AsInteger,
              High(Integer), -1,sIdLote, DateToStr(Date), -1,
              wSaldoQtd, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
              wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
              wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
              wSaldoInutil, wSaldoInutil, wSaldoInutil);

            // Caso nao Tenha Quantidade de Titulos no Contrato  o Saldo de Resgate é o Proprio Valor
            If Qry.FieldByName('QTDECOMPRATITLOTE').AsFloat = 0 Then
               wSaldoVlrResgate := QryTitRenFixa.FieldByName('VLRRESGATE').AsFloat
            Else
              // Caso Tenha Quantidade de Titulos no Contrato, Calcula o Valor Atual
              wSaldoVlrResgate := QryTitRenFixa.FieldByName('VLRRESGATE').AsFloat *
                        DivNonZero(wSaldoQtd, Qry.FieldByName('QTDECOMPRATITLOTE').AsFloat);

            QryTitRenFixa.Edit;
            QryTitRenFixa.FieldByName('SALDOVLRRESGATE').AsFloat := wSaldoVlrResgate;
            QryTitRenFixa.Post;
            QryTitRenFixa.ApplyUpdates;
            QryTitRenFixa.CommitUpdates;

            If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART, -1) Then
               raise Exception.Create('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '#13+
                      'esta Operação não poderá ser confirmada ');

            bCriaLancto := True;
            wPlano := -1;
            wPlanilha := -1;
            wDocumento := -1;

{            // Contabiliza a Operação
            if  OperComum.LancaOperRFRV(
                Sistema.IdEmpresa, 79,
                qry.FieldByName('IDTIPOINVEST').AsInteger,
                qry.FieldByName('IDINVESTIMENTO').AsInteger,
                QryOperacaoInvest.FieldByName('IDTIPOOPERACAO').AsInteger,
                QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger,
                wIdForCli,
                QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
                QryTitRenFixa.FieldByName('IDMOEDAREG').AsInteger,
                QryTitRenFixa.FieldByName('CODTIPRENFIXA').AsString,
                Qry.FieldByName('IDLOTE').AsString,
                QryOperacaoInvest.FieldByName('NUMDOCUMENTO').AsString,
                '', wTipoRecDesBol, bCriaLancto, 0,
                QryOperacaoInvest.FieldByName('VLROPERACAO').AsFloat,
                QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime,
                QryOperacaoInvest.FieldByName('DATAVENCOPER').AsDateTime,
                wPlano, wPlanilha, wDocumento, sMensErro) <> 0 then
            Begin
               MsgDlg('Operação não pode ser efetuada. Verificar contabilização da Operação.', 'Mensagem do Sistema', MtWarning,[MbOk],0);
               DtmBaseDados.dbBaseDados.Rollback;
               BtCancDetClick(Self);
               bSucesso := True;
               Exit;
            End;
}
          end;

       OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1);


       // Se o saldo zerar, mudar o flag ativo para falso.
       wSaldoQtd := 0;
       //AL_1
       //AL_2
       OperComum.BuscaTodosSaldosInvestLote(
         QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger,
         0{IDCARTEIRAGERENC},         
         QryOperacaoInvest.FieldByName('IDINVESTIMENTO').AsInteger,
         High(Integer),-1, sIdLote,
         DateToStr(QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime), -1,
         wSaldoQtd, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
         wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
         wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
         wSaldoInutil, wSaldoInutil, wSaldoInutil);

       QryInvestimento.Edit;
       If (wSaldoQtd = 0) Then
          QryInvestimentoFLGATIVO.AsString := 'N'
       else
          QryInvestimentoFLGATIVO.AsString := 'S';
       QryInvestimento.Post;
       QryInvestimento.ApplyUpdates;
       QryInvestimento.CommitUpdates;

       dtmBaseDados.dbBaseDados.Commit;
       bSucesso := True;
     Except
       MsgDlg('Operação não pode ser efetuada. ', 'Mensagem do Sistema', MtWarning,[MbOk],0);
       DtmBaseDados.dbBaseDados.Rollback;
       BtCancDetClick(Self);
       bSucesso := True;
     end;
   finally
     LevantaBotoes;
     HabilitaBotoesDetOpe(True, True, True, True);
     if not bSucesso then
        begin
          DtmBaseDados.dbBaseDados.Rollback;
          BtCancDetClick(Self);
        end;
   end;

   qryOprRenFix.ParamByName('P_IDOPERACAOINVEST').AsInteger :=
       QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger;
   qryOprRenFix.Open;
   dbgOperacao.Font.Color := clGray;
   dbgOperacao.Color      := clSilver;

   BtVoltaDet.Enabled:= False;

//   HabilitaBotoesDetTit(True, True, True, False);

   PageControl1.ActivePage := tbsDadosTitulo;

   QryTitRenFixa.Close;
   QryTitRenFixa.Open;
   Qry.Close;
   Qry.Open;
   QryOprRenFix.Close;
   QryOprRenFix.Open;
   QryInvestimento.Close;
   QryInvestimento.Open;
   QryBuscaTitulo.Close;
   QryBuscaTitulo.Open;
   QryMoeda.Close;
   QryMoeda.Open;
   QryTipoJuros.Close;
   QryTipoJuros.Open;

   BtIncDet1.Click;
end;

procedure TfrmCadContratoRendaFixa.BtCancDetClick(Sender: TObject);
Var
  I : Integer;
begin
   LevantaBotoes;
   HabilitaBotoesDetOpe(True, True, True, True);
   HabilitaPrincipal;

   bTrocaLine := True;
   for I := 0 To Pred(ComponentCount) do
      if Components[I] is TwwQuery Then
         if TwwQuery(Components[I]).UpdateObject <> nil then
         begin
           TwwQuery(Components[I]).Cancel;
           TwwQuery(Components[I]).CancelUpdates;
         end;

   QryOperacaoInvest.Close;
   QryOperacaoInvest.Open;

   dbgOperacao.Options       := dbgOperacao.Options - [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clGray;
   dbgOperacao.Color         := clSilver;
   dbgOperacao.SetFocus;

   QryOperacaoInvest.Close;
   QryOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   :=
                                    Qry.FieldByName('IDINVESTIMENTO').AsInteger;
   QryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger :=
                                    Qry.FieldByName('IDCARTLASTRO').AsInteger;
   QryOperacaoInvest.Open;

   BtVoltaDet.Enabled := False;
   HabilitaBotoesDetOpe(True, True, True, True);

   if QryOperacaoInvest.Eof and wPriOper then begin
      ExecutarQuery(QryAux,
                   'DELETE FROM INVESTIMENTO WHERE IDINVESTIMENTO = '''+wInvest+'''');
      ExecutarQuery(QryAux,
                   'DELETE FROM TITRENFIXA WHERE IDTITRENFIXA = '''+wTitRenFixa+'''');
      ExecutarQuery(QryAux,
                   'DELETE FROM CONTRATOINVESTIM WHERE IDCONTRATOINVEST = '''+wContInv+'''');
      BtCancDet1Click(Sender);
      PageControl1.ActivePage := tbsDadosTitulo;
      qry.Close;
      qry.Open;
      QryInvestimento.Close;
      QryInvestimento.Open;
      QryTitRenFixa.Close;
      QryTitRenFixa.Open;
   end;

   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
end;

procedure TfrmCadContratoRendaFixa.BtIncDet1Click(Sender: TObject);
begin
   CmeCadastro.Insert(Self);
//   HabilitaPrincipal;
   PageControl1.ActivePage := tbsDadosTitulo;

   bDados                  := False;
   pnlDadosTitulo.Enabled  := False;
   Label8.Enabled          := False;
   dbrValPercentual.Enabled:= False;
   Label6.Enabled          := False;
   dblTaxaJuros.Enabled    := False;

   BtVoltaDet1.Enabled     := True;

   // Insere o Investimento
   QryInvestimento.Append;
   QryInvestimento.FieldByName('FLGATIVO').AsString := 'S';

   // Insere o Titulo
   QryTitRenFixa.Append;

   Inativo.Checked := False;

   DesabilitaPrincipal;
//   HabilitaBotoesDetTit(False, False, False, False);

   if Qry.State In [DsInsert, DsEdit] then begin
      if Trim(dbdDtaEmissao.Text) = '' then
         Qry.FieldByName('IDLOTE').AsString :=
             FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENFIX'+Copy(dbdDtaEmissao.Text,9,2)))+'/'+
             Copy(DateToStr(Date),7,4)
      else
         Qry.FieldByName('IDLOTE').AsString :=
             FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENFIX'+Copy(dbdDtaEmissao.Text,9,2))) + '/' +
             Copy(dbdDtaEmissao.Text,7,4);
   end;

   QryTitRenFixa.FieldByName('FLGPREPOS').AsString := '0';
   wPriOper := True;

   dblTipoTituloRFixaExit(Sender);

end;

procedure TfrmCadContratoRendaFixa.BtAltDet1Click(Sender: TObject);
begin
   DesabilitaPrincipal;
//   HabilitaBotoesDetTit(False, False, False, False);

   pnlPrincipal.Enabled  := True;
   pnlDadosTitulo.Enabled:= True;
   BtVoltaDet1.Enabled   := True;

   bDados                := False;

   Qry.Edit;
   QryTitRenFixa.Edit;
   QryInvestimento.Edit;
   wPriOper := False;

end;

procedure TfrmCadContratoRendaFixa.BtIncDetClick(Sender: TObject);
Var
  fSaldoQtd, fSaldoInutil: Double;
  bAquisicao : Boolean;
begin
   DesabilitaPrincipal;

   bTrocaLine := False;
   BtIncDet.Down := True;

   bAquisicao := QryOperacaoInvest.IsEmpty;

   HabilitaBotoesDetOpe(False, False, False, False);

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;
   dbgOperacao.SetFocus;

   QryOperacaoInvest.Append;
   qryOprRenFix.Close;
   qryOprRenFix.ParamByName('P_IDOPERACAOINVEST').AsInteger :=
            QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger;
   qryOprRenFix.Open;
   qryOprRenFix.Append;

   QryOperacaoInvestDATAOPERACAO.AsDateTime := Trunc(Now);
   QryOperacaoInvestDATAVENCOPER.AsDateTime := QryOperacaoInvestDATAOPERACAO.AsDateTime;
   QryOperacaoInvestVLRIR.AsFloat := 0;

   if bAquisicao then
      begin
        QryOperacaoInvestIDTIPOOPERACAO.AsInteger := RetTipoOperacao('A', qry.DatabaseName);
        QryOperacaoInvestVLRIR.Visible            := False;
      end
   else
      begin
        QryOperacaoInvestVLRIR.Visible            := True;
        //AL_1
        //AL_2
        OperComum.BuscaTodosSaldosInvestLote(QryBuscaCarteiraIDCARTEIRAINVEST.AsInteger,
                                             0{IDCARTEIRAGERENC},
                                             qryIDINVESTIMENTO.AsInteger,
                                             High(Integer), -1,qryIDLOTE.AsString,
                                             DateToStr(QryOperacaoInvestDATAOPERACAO.AsDateTime),
                                             -1{Motivo Bloqueio},
                                             fSaldoQtd, fSaldoInutil, fSaldoInutil,
                                             fSaldoInutil, fSaldoInutil, fSaldoInutil,
                                             fSaldoInutil, fSaldoInutil, fSaldoInutil,
                                             fSaldoInutil, fSaldoInutil, fSaldoInutil,
                                             fSaldoInutil, fSaldoInutil, fSaldoInutil,
                                             fSaldoInutil, fSaldoInutil, fSaldoInutil);

        QryOperacaoInvestPRECOUNITOPERACAO.AsFloat :=
           OperComum.BuscaCotacaoInvest(qryIDINVESTIMENTO.AsInteger,
                                        QryOperacaoInvestDATAOPERACAO.AsDateTime,
                                        True);

        QryOperacaoInvestQTDEOPERACAO.AsFloat := fSaldoQtd;

        QryOperacaoInvestVLROPERACAO.AsFloat :=
          (QryOperacaoInvestQTDEOPERACAO.AsFloat * QryOperacaoInvestPRECOUNITOPERACAO.AsFloat);
        QryOperacaoInvestIDTIPOOPERACAO.AsInteger := RetTipoOperacao('D', qry.DatabaseName);
      end;
   ProcessaIR;
   if BtOkDet.CanFocus Then
      BtOkDet.SetFocus;
   if dbgOperacao.CanFocus Then
      dbgOperacao.SetFocus;
   BtVoltaDet.Enabled := True;
end;

procedure TfrmCadContratoRendaFixa.BtAltDetClick(Sender: TObject);
begin
   DesabilitaPrincipal;

   dbgOperacao.SelectedIndex := 0;
   dbgOperacao.Options       := dbgOperacao.Options + [TwwDBgridOption(dgEditing)];
   dbgOperacao.Font.Color    := clBlack;

   QryOperacaoInvest.Edit;
   QryOperacaoInvest.FieldByName('IDCARTEIRAINVEST').AsInteger :=
                     QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger;
   QryOperacaoInvest.FieldByName('NUMDOCUMENTO').AsString      :=
                     Qry.FieldByName('IDLOTE').AsString;
   QryOperacaoInvest.FieldByName('IDLOTE').AsString            :=
                     Qry.FieldByName('IDLOTE').AsString;
   QryOperacaoInvest.FieldByName('IDINVESTIMENTO').AsInteger   :=
                     QryInvestimento.FieldByName('IDINVESTIMENTO').AsInteger;

   qryOprRenFix.Close;
   qryOprRenFix.ParamByName('P_IDOPERACAOINVEST').AsInteger :=
   QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger;
   qryOprRenFix.Open;
   qryOprRenFix.Edit;

   HabilitaBotoesDetOpe(False, False, False, False);

   BtVoltaDet.Enabled := True;
   dbgOperacao.SetFocus;

end;

procedure TfrmCadContratoRendaFixa.dbgOperacaoExit(Sender: TObject);
begin
   KeyPreview := True;
   If BtOkDet.Enabled Then
      BtOkDet.SetFocus;
end;

procedure TfrmCadContratoRendaFixa.dbgOperacaoEnter(Sender: TObject);
begin
   KeyPreview := False;
end;

procedure TfrmCadContratoRendaFixa.dbgOperacaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;
   If ((Key = 38) Or (Key = 40)) And
     (TwwDBgridOption(dgEditing) in dbgOperacao.Options) Then
        Key := 0;
end;

procedure TfrmCadContratoRendaFixa.dbgOperacaoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   If Key = 27  Then
      Key := 0;
   If ((Key = 38) Or (Key = 40)) And
      (TwwDBgridOption(dgEditing) in dbgOperacao.Options) Then
        Key := 0;
end;

procedure TfrmCadContratoRendaFixa.QryOperacaoInvestBeforePost(
  DataSet: TDataSet);
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

procedure TfrmCadContratoRendaFixa.BtDelDetClick(Sender: TObject);
begin
// Pede Confirmacao
   BtDelDet.Down := False;
   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      bTrocaLine    := True;
      BtDelDet.Down := False;
      Exit;
   End;

   dtmBaseDados.dbBaseDados.StartTransaction;
   Try

      // (HISTCUSTODIA)
      MarcaFlgHistCustodia (-1, QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger,-1);

      ExecutaQuery(QryAux,'DELETE FROM HISTCUSTODIA WHERE IDOPERACAOINVEST = '''+
                          QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsString+'''');

      // Atualiza Saldos da Custodia
      OperacaoInvest.AtualizaSaldosCustodia;

      // Estorna Contabilidade e CAP/CAR
      If Not OperComum.EstornaOper(dbLote.Text,
                   QryOperacaoInvest.FieldByName('IDTIPOINVEST').AsInteger,
                   QryOperacaoInvest.FieldByName('IDOPERACAOINVEST').AsInteger,
                   QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime,
                   pRPI.VLRCOTAINICART,'X', true) Then
         Raise Exception.Create('Não é possível fazer Estorno. Exclusão não será efetuada.');

      // Alimenta os Saldos da Carteira
      If Not OperComum.AtualizaSaldos(pRPI.VLRCOTAINICART,-1) then
         Raise Exception.Create('Erro ao Atualizar os Saldos desta Carteira/Investimentos, '+#13+
                                'esta Operação não poderá ser confirmada ');
      dtmBaseDados.dbBaseDados.Commit;
   Except
      dtmBaseDados.dbBaseDados.Rollback;
   End;
   QryOperacaoInvest.Close;
   QryOperacaoInvest.Open;

   BtVoltaDet.Enabled   := False;

   HabilitaBotoesDetOpe(True, True, True, False);
{   BtIncDet.Enabled     := True;
   If Not QryOperacaoInvest.Eof Then
   Begin
      BtAltDet.Enabled  := True;
      BtDelDet.Enabled  := True;
   End
   Else
   Begin
      BtAltDet.Down         := False;
      BtDelDet.Down         := False;
   End; }

end;

procedure TfrmCadContratoRendaFixa.PageControl1Change(Sender: TObject);
begin
  If (Not bDados) And (sbtnInserir.Down) Then
  Begin
     MsgDlg('Informe os Dados do Título.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     PageControl1.ActivePage := tbsDadosTitulo;
     Exit;
  End;
  inherited;
   If (Not bDados) And ((BtAltDet1.Down) Or (BtIncDet1.Down)) Then
   Begin
     MsgDlg('Confirme os Dados do Título.',
            'Mensagem do Sistema', MtError,[MbOk],0);
     PageControl1.ActivePage := tbsDadosTitulo;
     BtOkDet1.SetFocus;
     Exit;
   End;
   BtIncDet.Enabled  := True;
   If Not QryOperacaoInvest.Eof Then
   Begin
      BtAltDet.Enabled  := True;
      BtDelDet.Enabled  := True;
   End
   Else
   Begin
      BtAltDet.Down         := False;
      BtDelDet.Down         := False;
   End;
end;

procedure TfrmCadContratoRendaFixa.DsOperacaoInvestDataChange(
  Sender: TObject; Field: TField);
begin
  qryBuscaTipoOperacao.Close;
  qryBuscaTipoOperacao.ParamByName('P_IDTIPOOPERACAO').AsInteger := QryOperacaoInvestIDTIPOOPERACAO.AsInteger;
  qryBuscaTipoOperacao.Open;
end;

procedure TfrmCadContratoRendaFixa.dblTipoOperacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  if dblTipoOperacao.LookupValue <> '' Then
     begin
       QryBuscaTipoOperacao.Close;
       QryBuscaTipoOperacao.ParamByName('P_IDTIPOOPERACAO').AsInteger := StrToInt(dblTipoOperacao.LookupValue);
       QryBuscaTipoOperacao.Open;
     end;
  ProcessaIR;
end;

function TfrmCadContratoRendaFixa.TemCamposIR : Boolean;
begin
  Result := True;
  if QryOperacaoInvest.FieldByName('DATAOPERACAO').IsNull then
     Result := false
  else if QryOperacaoInvest.FieldByName('QTDEOPERACAO').IsNull then
     Result := false
  else if QryOperacaoInvest.FieldByName('DATAOPERACAO').IsNull then
     Result := false
  else if QryOperacaoInvest.FieldByName('VLROPERACAO').IsNull then
     Result := false
  else if QryOperacaoInvest.FieldByName('SIGLATIPOOPER').IsNull then
     Result := false
end;

procedure TfrmCadContratoRendaFixa.ProcessaIR;
Var
  wSaldoQtd, wSaldoAqui,
  wSaldoIRApu, wSaldoInutil : Double;
begin

  If (QryOperacaoInvest.State in [dsInsert, dsEdit]) and TemCamposIR then
    begin
      qryBuscaTipoOperacao.Close;
      qryBuscaTipoOperacao.ParamByName('P_IDTIPOOPERACAO').AsInteger := QryOperacaoInvestIDTIPOOPERACAO.AsInteger;
      qryBuscaTipoOperacao.Open;

      If QryBuscaTipoOperacao.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then
         Begin
            //AL_1
            //AL_2
            OperComum.BuscaTodosSaldosInvestLote(
                    QryBuscaCarteira.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    0{IDCARTEIRAGERENC},
                    Qry.FieldByName('IDINVESTIMENTO').AsInteger,High(Integer),-1,
                    Qry.FieldByName('IDLOTE').AsString,
                    DateToStr(QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime), -1,
                    wSaldoQtd, wSaldoInutil, wSaldoInutil, wSaldoInutil,wSaldoAqui,
                    wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                    wSaldoIRApu,  wSaldoInutil, wSaldoInutil, wSaldoInutil, wSaldoInutil,
                    wSaldoInutil, wSaldoInutil, wSaldoInutil);

            fVrlRendimento := 0;
            QryOperacaoInvest.FieldByName('VLRIR').AsFloat :=
                   Impostos.CalculaIr(1, -1, 0{CARTEIRAGERENC}, -1,
                             qryBuscaTipoOperacao.FieldByName('IDTIPOOPERACAO').AsInteger,
                             -1, Qry.FieldByName('IDLOTE').AsString,
                             QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime,
                             QryOperacaoInvest.FieldByName('DATAOPERACAO').AsDateTime,
                             (QryOperacaoInvest.FieldByName('QTDEOPERACAO').AsFloat*DivNonZero(wSaldoAqui, wSaldoQtd)),
                              QryOperacaoInvest.FieldByName('VLROPERACAO').AsFloat,
                              0,
                             'S',
                             QryBuscaTipoOperacaoFLGTRATAIR.AsString,
                             fVrlRendimento);
             // Verifica se existe provisionamento de IR
             wVlrIRProv:=0;
             If Impostos.BuscaProvisaoIR(2,Qry.FieldByName('IDINVESTIMENTO').AsInteger) then
               wVlrIRProv := (DivNonZero(wSaldoIRApu, wSaldoQtd)* QryOperacaoInvest.FieldByName('QTDEOPERACAO').AsFloat )* -1;
         End;
    end;
end;

procedure TfrmCadContratoRendaFixa.dsStateChange(Sender: TObject);
begin
  sbtnAlterar.Enabled := not ((qry.State in [dsInsert, dsEdit]) or (qry.IsEmpty));
  sbtnApagar.Enabled  := not ((qry.State in [dsInsert, dsEdit]) or (qry.IsEmpty));
  sbtnInserir.Enabled := not (qry.State in [dsInsert, dsEdit]);

  BtIncDet1.Enabled := (qry.State = dsInsert) and (QryTitRenFixa.IsEmpty);
  BtAltDet1.Enabled := (qry.State = dsEdit)   and (not QryTitRenFixa.IsEmpty);
  BtDelDet1.Enabled := (qry.State = dsEdit)   and (not QryTitRenFixa.IsEmpty);

  BtIncDet.Enabled := (qry.State in [dsInsert, dsEdit]);
  BtAltDet.Enabled := (qry.State = dsEdit) and (not QryOperacaoInvest.IsEmpty);
  BtDelDet.Enabled := (qry.State = dsEdit) and (not QryOperacaoInvest.IsEmpty);

  BtOkDet1.Enabled := (QryTitRenFixa.State in [dsInsert, dsEdit]);

  BtCancDet1.Enabled := (qry.State in [dsInsert, dsEdit]);
  BtCancDet.Enabled := (qry.State = dsEdit);

  if qry.State = dsBrowse Then
     LevantaBotoes;
end;

procedure TfrmCadContratoRendaFixa.dsTitRenFixaStateChange(
  Sender: TObject);
Var
  AltInc : Boolean;
begin
  AltInc := (QryTitRenFixa.State in [dsInsert, dsEdit]);
  if dblCarteira.Text = '' then
     HabilitaBotoesDetTit(False, False, False, True)
  else begin
//     HabilitaBotoesDetTit(AltInc, AltInc, AltInc, True);
     BtIncDet1.Enabled := (not AltInc);
     BtAltDet1.Enabled := (not AltInc) and (not QryTitRenFixa.IsEmpty);
     BtDelDet1.Enabled := (not AltInc) and (not QryTitRenFixa.IsEmpty);
  end;

  BtOkDet1.Enabled := AltInc;

  BtCancDet1.Enabled := AltInc;

//  LevantaBotoesDetTit;
  LevantaBotoes;

  pnlDadosTitulo.Enabled := AltInc;
end;

procedure TfrmCadContratoRendaFixa.DsOperacaoInvestStateChange(
  Sender: TObject);
Var
  CanChange, AltInc : Boolean;
begin
  CanChange := (QryOperacaoInvest.State = dsBrowse) and (qry.State in [dsInsert, dsEdit]);
  AltInc    := (QryOperacaoInvest.State in [dsInsert, dsEdit]);

//  HabilitaBotoesDetTit(CanChange, CanChange, CanChange, True);
  BtIncDet.Enabled := CanChange;
  BtAltDet.Enabled := CanChange and (not QryOperacaoInvest.IsEmpty);
  BtDelDet.Enabled := CanChange and (not QryOperacaoInvest.IsEmpty);

  BtCancDet.Enabled := (QryOperacaoInvest.State in [dsInsert, dsEdit]) OR AltInc;
  BtOkDet.Enabled   := (QryOperacaoInvest.State in [dsInsert, dsEdit]) AND AltInc;
end;

procedure TfrmCadContratoRendaFixa.QryOperacaoInvestQTDEOPERACAOSetText(
  Sender: TField; const Text: String);
begin
  inherited;

  if Sender.FieldName = QryOperacaoInvestDATAOPERACAO.FieldName then
     QryOperacaoInvestDATAOPERACAO.AsDateTime := StrToDate(Text)
  else if (Sender.FieldName = QryOperacaoInvestQTDEOPERACAO.FieldName) or
          (Sender.FieldName = QryOperacaoInvestPRECOUNITOPERACAO.FieldName) then begin
     Sender.AsFloat := StrToFloat(StripChar(Text, '.'));
     QryOperacaoInvestVLROPERACAO.AsString := FloatToStr((QryOperacaoInvestQTDEOPERACAO.AsFloat * QryOperacaoInvestPRECOUNITOPERACAO.AsFloat));
     end
  else if (Sender.FieldName = QryOperacaoInvestVLROPERACAO.FieldName) Then
     QryOperacaoInvestVLROPERACAO.AsFloat := StrToFloat(StripChar(Text, '.'));

  ProcessaIR;
  dbgOperacao.RefreshDisplay;
end;

procedure TfrmCadContratoRendaFixa.dbrValJurosChange(Sender: TObject);
begin
  inherited;
  If (dbrValJuros.Value > 0) And (Not dblTaxaJuros.Enabled) Then
  Begin
     Label6.Enabled          := True;
     dblTaxaJuros.Enabled    := True;
     If pnlPrincipal.Enabled  Then
        dblTaxaJuros.SetFocus;
  End
  Else If (dbrValJuros.Value = 0) Then
  Begin
     Label6.Enabled          := False;
     dblTaxaJuros.Enabled    := False;
  End;
end;

procedure TfrmCadContratoRendaFixa.dblIndexadorExit(Sender: TObject);
begin
  inherited;
  If dblIndexador.Text <> '' Then
  Begin
     Label8.Enabled          := True;
     dbrValPercentual.Enabled:= True;
     If pnlPrincipal.Enabled  Then
        dbrValPercentual.SetFocus;
  End
  Else
  Begin
     Label8.Enabled          := False;
     dbrValPercentual.Enabled:= False;
  End;
end;

procedure TfrmCadContratoRendaFixa.BtDelDet1Click(Sender: TObject);
Var
   sIDINVESTIMENTO : String;
begin
   if not QryOperacaoInvest.IsEmpty Then
   begin
     MsgDlg('Não é possível excluir ', 'Mensagem do Sistema ',
     mtError , [mbOK], 0);
     BtDelDet1.Down := False;
     Exit;
   end;

   If MsgDlg('Confirma Exclusão ?', 'Mensagem do Sistema ',
      mtConfirmation , [mbYes, mbNo], 0) = mrNo Then Begin
      BtDelDet1.Down := False;
      Exit;
   End;

   sIDINVESTIMENTO := Qry.FieldByName('IDINVESTIMENTO').AsString;

   DtmBaseDados.dbBaseDados.StartTransaction;
   Try
     // TITRENFIXA
     QryTitRenFixa.Delete;
     QryTitRenFixa.ApplyUpdates;
     QryTitRenFixa.CommitUpdates;

     // CONTRATOINVESTIM
     Qry.Delete;
     Qry.ApplyUpdates;
     Qry.CommitUpdates;

     // INVESTIMENTO
     ExecutarQuery(QryAux,
     'DELETE FROM  WHERE HISTCARTINV = '''+sIDINVESTIMENTO+'''');

     ExecutarQuery(QryAux,
       'DELETE FROM INVESTIMENTO WHERE IDINVESTIMENTO = '''+sIDINVESTIMENTO+'''');
   Except
      DtmBaseDados.dbBaseDados.Rollback;
      BtCancDet1.Click;
      Exit;
   End;

   DtmBaseDados.dbBaseDados.Commit;

   sbtnAlterar.Enabled    := False;   // Para que????????? (Botões não visíveis)
   sbtnApagar.Enabled     := False;  //

   Inativo.Checked        := False;
   dblTipoTituloRFixa.Text:= '';
   dblTipoTituloRFixa.Text:= '';
   dbdDtaEmissao.Text     := '';
   dbdDtaVencimeto.Text   := '';
   dbLote.Text            := '';
   dblTaxaJuros.Text      := '';
   dblIndexador.Text      := '';
   dbmObservacao.Text     := '';
   dbrValJuros.Value      :=  0;
   dbrValPercentual.Value :=  0;

   Label2.Enabled         := True;
   dblCarteira.Enabled    := True;

   QryOperacaoInvest.Close;
   QryOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   := -1;
   QryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := -1;
   QryOperacaoInvest.Open;

   HabilitaBotoesDetTit(True, True, True, False);

   BtDelDet1.Down := False;

end;

procedure TfrmCadContratoRendaFixa.dblCarteiraChange(Sender: TObject);
begin
  inherited;
  if dblCarteira.Text <> '' then begin
     BtIncDet1.Enabled := True;
     PageControl1.ActivePage := tbsDadosTitulo;
     end
  else LimpaForm;
end;

procedure TfrmCadContratoRendaFixa.DBRadioGroup1Change(Sender: TObject);
begin
  inherited;
  If DBRadioGroup1.ItemIndex = 0 Then
  Begin
     Label7.Enabled           := False;
     dblIndexador.Enabled     := False;
     Label8.Enabled           := False;
     dbrValPercentual.Enabled := False;
  End
  Else
  Begin
     Label7.Enabled           := True;
     dblIndexador.Enabled     := True;
     Label8.Enabled           := True;
     dbrValPercentual.Enabled := True;
  End

end;

procedure TfrmCadContratoRendaFixa.dblTaxaJurosExit(Sender: TObject);
begin
  inherited;
  If (Ds.DataSet.State In [DsInsert, DsEdit]) And
     (dbrValJuros.Text <> '') And (dblTaxaJuros.LookUpValue <> '') Then Begin
     QryTitRenFixa.FieldByName('JUROSDIA').AsFloat:=
        OperComum.CalculaJurosDia(StrToFloat(dbrValJuros.Text), StrToInt(dblTaxaJuros.LookUpValue));
  End;

end;

procedure TfrmCadContratoRendaFixa.dbdDtaEmissaoExit(Sender: TObject);
begin
  inherited;
  if Trim(dbdDtaEmissao.Text) <> '' then begin
     QryTitRenFixa.FieldByName('DATAINIJURRENFIX').AsDateTime := StrToDateTime(dbdDtaEmissao.Text);
     QryTitRenFixa.FieldByName('DATABASEINDRENFIX').AsDateTime:= StrToDateTime(dbdDtaEmissao.Text);
     if Copy(dbdDtaEmissao.Text,7,4) <> Copy(qry.FieldByName('IDLOTE').AsString,6,4) then
        Qry.FieldByName('IDLOTE').AsString :=
             FormatFloat('0000',LeUltRegistro(Nil,'CONTDOCRENFIX'+Copy(dbdDtaEmissao.Text,9,2))) + '/' +
             Copy(dbdDtaEmissao.Text,7,4);
  end;
end;

procedure TfrmCadContratoRendaFixa.dblTipoTituloRFixaExit(Sender: TObject);
begin
  inherited;
  QryBuscaTitulo.FieldByName('FLGPREPOS').AsString;
  if QryBuscaTitulo.FieldByName('FLGPREPOS').AsString = '0' then begin
     DBRadioGroup1.ItemIndex := 0;
     QryTitRenFixa.FieldByName('FLGPREPOS').AsString := '0';
     Label7.Enabled           := False;
     dblIndexador.Enabled     := False;
     Label8.Enabled           := False;
     dbrValPercentual.Enabled := False;
     end
  else begin
     DBRadioGroup1.ItemIndex := 1;
     QryTitRenFixa.FieldByName('FLGPREPOS').AsString := '1';
     Label7.Enabled           := True;
     dblIndexador.Enabled     := True;
     Label8.Enabled           := True;
     dbrValPercentual.Enabled := True;
  end;

end;

procedure TfrmCadContratoRendaFixa.LimpaForm;
begin
  Qry.Close;
  Qry.ParamByName('IDCONTRATOINVEST').AsInteger := -1;
  Qry.Open;

  QryInvestimento.Close;
  QryInvestimento.ParamByName('IDINVESTIMENTO').AsInteger := -1;
  QryInvestimento.Open;

  QryOperacaoInvest.Close;
  QryOperacaoInvest.ParamByName('IDINVESTIMENTO').AsInteger   := -1;
  QryOperacaoInvest.ParamByName('IDCARTEIRAINVEST').AsInteger := -1;
  QryOperacaoInvest.Open;

  QryBuscaTitulo.Close;
  QryBuscaTitulo.Open;

  QryMoeda.Close;
  QryMoeda.Open;

  QryTipoJuros.Close;
  QryTipoJuros.Open;

  QryTitRenFixa.Close;
  QryTitRenFixa.paramByName('IDTITRENFIXA').AsInteger := -1;
  QryTitRenFixa.Open;

  QryEtapas.Close;
  QryEtapas.ParamByName('IDTIPOCONTRINVEST').AsInteger := -1;
  QryEtapas.Open;

  if QryBuscaTitulo.Locate('IDEMISSOR;CODTIPRENFIXA',VarArrayOf([-1 , '-1']), [loPartialKey]) then
     dblTipoTituloRFixa.Text := QryBuscaTitulo.FieldByName('MNEMONICO').AsString
  else
     dblTipoTituloRFixa.Text := '';

  if (not QryBuscaCarteira.EOF) and (dblCarteira.Text <> '') then
     HabilitaBotoesDetTit(True, False, False, False)
  else
     HabilitaBotoesDetTit(False, False, False, False);

  HabilitaBotoesDetOpe(False, False, False, False);
end;

procedure TfrmCadContratoRendaFixa.dblIndexadorChange(Sender: TObject);
begin
  inherited;
  dbrValPercentual.Value := 100;
end;

end.


