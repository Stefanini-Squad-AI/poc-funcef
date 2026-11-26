unit FEncerraConciliacao;

// Alterações:
//--------------------------------------------------------------------------------------------------
// Rotina      : (dfm) qryValoresCR
// SIG no.     : 62126
// Autor(a)    : Edilaine
// Data        : 24/01/2018
// Alteração   : Alteração do CASE...WHEN acrescentando
//                 WHEN VAL.IDPLANOPREV = 97  AND VAL.IDPLANOPREVPREV = 66 THEN 'FUNCEF'
//                 WHEN VAL.IDPLANOPREV = 107 AND VAL.IDPLANOPREVPREV = 74 THEN 'FUNCEF'
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 149515 Kintana 1076619
// Alteração   : Erro na Conciliação INSS, devido alteração do nome do plano.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 26/03/2007
// Rotina      : -
// Pendência   : 22253 (porém não relacionada)
// Alteração   : Reorganização do código segundo uniformização vigente
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 05/03/2007
// Rotina      : - (qryValoresCR)
// Pendência   : 24724
// Alteração   : Alteração do CASE...WHEN para os casos: (segundo Paulo Torres)
//               WHEN VAL.IDPLANOPREV = 74 AND VAL.IDPLANOPREVPREV = 74 THEN 'FUNCEF'
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 05/01/2007
// Rotina      : - (qryValoresCR)
// Pendência   : 24130
// Alteração   : Alteração do CASE...WHEN para os casos: (segundo Rogério Vitorino)
//               WHEN VAL.IDPLANOPREV = 75 AND VAL.IDPLANOPREVPREV = 74 THEN 'FUNCEF'
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 05/10/2006
// Rotina      : - (qryValoresCR)
// Pendência   : 23493
// Alteração   : Alteração do CASE...WHEN para os casos: (segundo Rogério Vitorino)
//               " A Mantenedora quando houver o plano contábil REG/REPLAN SALDADO e plano previdenciário REG/REPLAN para FUNCEF."
//               " A Mantenedora quando houver o plano contábil REG/REPLAN SALDADO e plano previdenciário NOVO PLANO para FUNCEF."
//               WHEN VAL.IDPLANOPREV = 28 AND VAL.IDPLANOPREVPREV = 74 THEN 'FUNCEF'
//               WHEN VAL.IDPLANOPREV = 28 AND VAL.IDPLANOPREVPREV = 02 THEN 'FUNCEF'
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 05/09/2006
// Rotina      : - (qryValoresCR)
// Pendência   : 23005
// Alteração   : Alteração do CASE...WHEN para o original, com um NVL(CODMANTENEDORA)
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 05/09/2006
// Pendencia   : 23243
// Rotina      : InsereDocumento, InsereContabil
// Alteração   : Atribuição do valor default para Unidades de Negócios (UNIDNEGOC)
//               que possuiam antes o valor -1.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 05/09/2006
// Rotina      : InsereContabil
// Pendência   : 23230
// Alteração   : Passagem do IDPATRO 91008 onde antes era passada ParamIntegra.PatroGlobal,
//               que ocasionava erro por falta de associação entre a patro global
//               e os planos previdenciários "regulares". Está cravado o ID da
//               Caixa até que seja definida parametrização apropriada. Todos os
//               documentos anteriores lançados possuíam esse ID.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 04/09/2006
// Rotina      : InsereDocumento
// Pendência   : 23230
// Alteração   : Passagem do IDPATRO 91008 onde antes era passada ParamIntegra.PatroGlobal,
//               que ocasionava erro por falta de associação entre a patro global
//               e os planos previdenciários "regulares". Está cravado o ID da
//               Caixa até que seja definida parametrização apropriada. Todos os
//               documentos anteriores lançados possuíam esse ID.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 04/09/2006
// Rotina      : - (qryValoresCR)
// Pendência   : 23005
// Alteração   : CASE WHEN... ELSE 'FUNCEF' no GROUP BY
//--------------------------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Data        : 17/08/2006
// Rotina      : - (qryValoresCR)
// Pendência   : 23005
// Alteração   : CASE WHEN... ELSE 'FUNCEF'
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 16/08/2005
// Rotina      : Desfazer Encerramento
// Alteração   : Acertos e implementações na Rotina
//--------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Db, DBTables, Wwquery, Wwdatsrc, Mask, wwdbedit,
  Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
  ExtCtrls, ComCtrls, Spin, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, CMTree, wwdblook, TREdit, DBCtrls, UCtrlLancamento,
  uCtrlDocumento, uCtrlParamIntegra;

type
  RecDadosContabeis =
  record
    RetornouValor           : Boolean;
    ContaContabilRecDes     : string;
    SubContaContabilRecDes  : string;
    ContaContabilBaixa      : string;
    SubContaContabilBaixa   : string;
  end;

  TFrmEncerraConciliacao = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CbMes: TComboBox;
    SpEdAno: TSpinEdit;
    pgcPrincipal: TPageControl;
    tbsContasaPagar: TTabSheet;
    Label17: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    EdDtVencimentoCP: TCMDateTimePicker;
    EdDtEmissaoCP: TCMDateTimePicker;
    EdReferenciaCP: TEdit;
    MemoObsCP: TMemo;
    tbsContasaReceber: TTabSheet;
    Label6: TLabel;
    MemoObsCR: TMemo;
    tbsCAPSGErados: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    tbsCARSGerados: TTabSheet;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    wwDataSource1: TwwDataSource;
    qryAux: TwwQuery;
    Panel4: TPanel;
    Label26: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    DbLkcCentroResponCP: TwwDBLookupCombo;
    DbLkcCentroCustoCP: TwwDBLookupCombo;
    dtsTpReceb: TwwDataSource;
    qryTpReceb: TwwQuery;
    qryTpRecebCODTIPRECDES: TStringField;
    qryTpRecebDESCRICAO: TStringField;
    qryTpRecebANASINT: TStringField;
    dtsTpPaga: TwwDataSource;
    qryTpPaga: TwwQuery;
    qryTpPagaCODTIPRECDES: TStringField;
    qryTpPagaDESCRICAO: TStringField;
    qryTpPagaANASINT: TStringField;
    treeTpPaga: TCMTreeView;
    treeTpReceb: TCMTreeView;
    Panel5: TPanel;
    Label9: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Bevel3: TBevel;
    Label29: TLabel;
    Label30: TLabel;
    EdDtVencimentoCR: TCMDateTimePicker;
    EdDtEmissaoCR: TCMDateTimePicker;
    EdReferenciaCR: TEdit;
    DbLkcCentroResponCR: TwwDBLookupCombo;
    DbLkcCentroCustoCR: TwwDBLookupCombo;
    Label13: TLabel;
    EdDtDisponibilidade: TCMDateTimePicker;
    DbLkcDocumentoCAP: TwwDBLookupCombo;
    dtsRateioCAP: TwwDataSource;
    qryRateioCAP: TwwQuery;
    dtsRateioCAR: TwwDataSource;
    qryRateioCAR: TwwQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DbEdValorDocumentoCR: TDBRealEdit;
    DbEdValorDocumentoCP: TDBRealEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    wwDBGrid2: TwwDBGrid;
    DbLkcDocumentoCAR: TwwDBLookupCombo;
    qryDocumentoCAP: TwwQuery;
    dtsDocumentoCP: TwwDataSource;
    qryDocumentoCAR: TwwQuery;
    dtsDocumentoCR: TwwDataSource;
    dtsValores: TwwDataSource;
    qryValoresCR: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    Separador: TToolbarSep97;
    BtnProcessar: TBitBtn;
    qryValoresCP: TwwQuery;
    dtsValoresCP: TwwDataSource;
    Label10: TLabel;
    DbLkcTipoDocCP: TwwDBLookupCombo;
    qryTpDocCP: TwwQuery;
    qryTpDocCR: TwwQuery;
    Label11: TLabel;
    DbLkcTipoDocCR: TwwDBLookupCombo;
    BtnDesfazer: TBitBtn;
    Label14: TLabel;
    EdNoDocumentoCR: TEdit;
    EdNoDocumentoCP: TEdit;
    Label15: TLabel;
    EdComplementoCP: TEdit;
    Label12: TLabel;
    Label16: TLabel;
    EdComplementoCR: TEdit;
    Label31: TLabel;
    DbLkcFormaPgtoCP: TwwDBLookupCombo;
    EdTipoDesembCP: TEdit;
    sbtnCODTIPDESEMBPROV: TSpeedButton;
    Label32: TLabel;
    EdTipoDesembCR: TEdit;
    SpeedButton1: TSpeedButton;
    Label33: TLabel;
    DbLkcFormaPgtoCR: TwwDBLookupCombo;
    Label34: TLabel;
    qryFormaPgtoCP: TwwQuery;
    qryFormaPgtoCR: TwwQuery;
    qryRateioCAPREFERENCIA: TStringField;
    qryRateioCAPOBS: TMemoField;
    qryRateioCAPNODOCUMENTO: TFloatField;
    qryRateioCAPVALOR: TFloatField;
    qryRateioCAPVALOR_1: TFloatField;
    qryRateioCAPCODTIPRECDES: TStringField;
    qryRateioCAPIDPLANOPREV: TFloatField;
    qryRateioCAPDESCRICAO: TStringField;
    qryRateioCAPNOMEPLANOCONTABIL: TStringField;
    qryRateioCAPNOME: TStringField;
    qryRateioCARREFERENCIA: TStringField;
    qryRateioCAROBS: TMemoField;
    qryRateioCARNODOCUMENTO: TFloatField;
    qryRateioCARVALOR: TFloatField;
    qryRateioCARVALOR1: TFloatField;
    qryRateioCARCODTIPRECDES: TStringField;
    qryRateioCARIDPLANOPREV: TFloatField;
    qryRateioCARCODTIPRECDES2: TStringField;
    qryRateioCARDESCRICAO: TStringField;
    qryRateioCARNOMEPLANOCONTABIL: TStringField;
    qryRateioCARNOME: TStringField;
    qryRateioCAPCODTIPRECDES2: TStringField;
    qryCResponUsuario: TwwQuery;
    qryCCUsuario: TwwQuery;
    GbAlterador: TGroupBox;
    DbLkcAlterador: TwwDBLookupCombo;
    Label35: TLabel;
    EdValorAlterador: TDBRealEdit;
    Label36: TLabel;
    qryAlterador: TwwQuery;
    PnlAlterador: TPanel;
    EdDemonstraAlterador: TDBRealEdit;
    Label37: TLabel;
    tbsVerificar: TTabSheet;
    DbGrdValoresApurados: TwwDBGrid;
    LblTipoProcesso: TLabel;
    BtConfirmaLancamentos: TBitBtn;
    BtCancelaLancamentos: TBitBtn;
    qryValoresCROriginal: TwwQuery;
    qryValoresCPOriginal: TwwQuery;
    qryValoresCRIDPLANOPREV: TFloatField;
    qryValoresCRIDPLANOPREVPREV: TFloatField;
    qryValoresCRENTIDADE_CONTABIL: TStringField;
    qryValoresCRMANTENEDORA: TStringField;
    qryValoresCRPLANO_PREVIDENCIARIO: TStringField;
    qryValoresCRLIQUIDO: TFloatField;
    Label38: TLabel;
    lblQtdLanc: TLabel;

    procedure sbtnCODTIPDESEMBPROVClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure treeTpRecebExit(Sender: TObject);
    procedure treeTpRecebDblClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure treeTpPagaDblClick(Sender: TObject);
    procedure treeTpPagaExit(Sender: TObject);
    procedure pgcPrincipalChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DbLkcDocumentoCAPChange(Sender: TObject);
    procedure DbLkcDocumentoCARChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CbMesChange(Sender: TObject);
    procedure BtnProcessarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure BtnDesfazerClick(Sender: TObject);
    procedure EdDtVencimentoCRExit(Sender: TObject);
    procedure BtConfirmaLancamentosClick(Sender: TObject);
    procedure BtCancelaLancamentosClick(Sender: TObject);
    procedure tbsVerificarShow(Sender: TObject);
    procedure qryValoresCPOriginalAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);


  private // Private declarations

    CtrlDocumento   : TCtrlDocumento;
    CtrlLancamento  : TCtrlLancamento;

    sAnoMesTela     : string;
    sMsgErro        : string;

    iIdForCli       : Integer;
    iCodDocumento   : Integer;

    dTotalValor     : Double;
    rValorDocumento : Double;

    procedure AbreArvoreTipoRecebimento( iControle, iTop, iLeft : Integer );
    procedure AbreArvoreTipoDesembolso ( iControle, iTop, iLeft : Integer );

    function  AbreConsultaProcesso(pcTipo       : Char;
                                   sAnoMesRef   : string;
                                   qryProcesso  : TwwQuery
                                  ): Boolean;

    procedure AbreConsultaResultadoProcesso(pcTipo : Char; piCodDocumento : Integer);
    procedure TotalizaLancamentosPorConta(sPlaConta : string; dValorLancamento : Double);

    function InsereForCli(pcTipo : Char): Boolean;
    function InsereDocumento(pcTipo : Char; qryValores : TwwQuery): Boolean;
    function InsereContabil (pcTipo : Char; qryValores : TwwQuery;
                             piIdPlanoPrev,
                             piCodDocumento : Integer;
                             var piPlnCodigo : Integer): Boolean;

    function ExisteCONCINSS(pcTipo : Char;
                            psMesReferencia : string): Boolean;
    function AtualizaCONCINSS(pcTipo : Char;
                              piCodDocumento : Integer;
                              psMesReferencia : string): Boolean;

    function GeraFinanceiroCR: Boolean;
    function GeraFinanceiroCP: Boolean;
    function ValidaInformacoes: Boolean;
    function DocumentoJaCadastrado(pcTipo : Char): Boolean;

    function TotalizaDocumentos(qryTotaliza : TwwQuery): Double;
    function BuscaDadosContabeis(pcTipo : Char; qryValores : TwwQuery): RecDadosContabeis;


  public
    { Public declarations }
    aContasxValor : Array [0..20] Of Record
                                       PlaConta : string;
                                       ValorTotalLancamentos : Double;
                                     end;
  end;

var
  FrmEncerraConciliacao: TFrmEncerraConciliacao;

implementation


uses DBaseDados, USistema, UMensErro,
     UAdmPrev, fAguarde, FCadIntegracaoPREVAux, {UModulo,} uDataBase,
     DIntegraCAPCAR;

{$R *.DFM}

{ TFrmEncerraConciliacao }

procedure TFrmEncerraConciliacao.AbreArvoreTipoDesembolso(iControle, iTop,
  iLeft: Integer);
begin
  treeTpPaga.Tag     := iControle;
  treeTpPaga.Left    := iLeft;
  treeTpPaga.Top     := iTop;
  treeTpPaga.Visible := not treeTpPaga.Visible;
  if treeTpPaga.Visible then
     treeTpPaga.SetFocus;
end;

procedure TFrmEncerraConciliacao.sbtnCODTIPDESEMBPROVClick(
  Sender: TObject);
begin
  inherited;
  AbreArvoreTipoDesembolso(2, 240, 325);
end;

procedure TFrmEncerraConciliacao.FormShow(Sender: TObject);
begin
  inherited;

  tbsCARSGerados.TabVisible := False;
  tbsCAPSGErados.TabVisible := False;
  tbsVerificar.TabVisible   := False;

  pgcPrincipal.ActivePage   := tbsContasaPagar;

  qryCResponUsuario.Close;
  qryCResponUsuario.ParamByName('IDEMPRESA').AsString       := IntToStr(Sistema.idEmpresa);
  qryCResponUsuario.ParamByName('IDUSUARIO').AsString       := IntToStr(Sistema.IdUsuario);
  qryCResponUsuario.ParamByName('IDPLANCRESPON').AsInteger  := ParamIntegra.PlanoCentroRespon; { Augusto 02/03/2005 }
  qryCResponUsuario.Open;

  qryCCUsuario.Close;
  qryCCUsuario.ParamByName('IDUSUARIO').AsString            := IntToStr(Sistema.IdUsuario);
  qryCCUsuario.ParamByName('IDPLANCENTCUST').AsInteger      := ParamIntegra.PlanoCentroCusto;
  qryCCUsuario.Open;

  try
    qrytpreceb.Close;
    qryTpReceb.ParamByName('IDEMPRESA').AsString := inttostr(Sistema.idEmpresa);
    qryTpReceb.Open;

    if not(qryTpReceb.IsEmpty) then
    begin
      treeTpReceb.Mascara := ParamIntegra.MascaraDesemb;
      treeTpReceb.MontaArvore;
    end;
  except
    raise;
  end;

  Try
    qrytpPaga.Close;
    qryTpPaga.ParamByName('IDEMPRESA').AsString := IntToStr(Sistema.idEmpresa);
    qryTpPaga.Open;
    if not qryTpPaga.IsEmpty then begin
      treeTpPaga.Mascara := ParamIntegra.MascaraDesemb;
      treeTpPaga.MontaArvore;
    end;
  Except
    raise;
  end;
  qryTpDocCP.Open;
  qryTpDocCR.Open;

  qryFormaPgtoCP.Open;
  qryFormaPgtoCR.Open;

  qryAlterador.Open;
  iCodDocumento := 0;
end;

procedure TFrmEncerraConciliacao.treeTpRecebExit(Sender: TObject);
begin
  inherited;
  if (qryTpReceb.FieldByName('ANASINT').AsString = 'A') then
    EdTipoDesembCR.Text := qryTpReceb.FieldByName('DESCRICAO').asString;
  TreeTpReceb.Visible := false;

  
end;

procedure TFrmEncerraConciliacao.treeTpRecebDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    if (qryTpReceb.FieldByName('ANASINT').AsString = 'A') then
         treeTpRecebExit(treeTpReceb)
    else Exit;
  end;
end;

procedure TFrmEncerraConciliacao.AbreArvoreTipoRecebimento(iControle, iTop,
  iLeft: Integer);
begin
  treeTpReceb.Tag     := iControle;
  treeTpReceb.Left    := iLeft;
  treeTpReceb.Top     := iTop;
  treeTpReceb.Visible := not treeTpReceb.Visible;
  if treeTpReceb.Visible then
     treeTpReceb.SetFocus;
end;

procedure TFrmEncerraConciliacao.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  AbreArvoreTipoRecebimento(2, 240, 325);
end;

procedure TFrmEncerraConciliacao.treeTpPagaDblClick(Sender: TObject);
begin
  inherited;
  with dtmIntegraCAPCAR do
  begin
    if (qryTpPaga.FieldByName('ANASINT').AsString = 'A') then
         treeTpPagaExit(treeTpReceb)
    else Exit;
  end;
end;

procedure TFrmEncerraConciliacao.treeTpPagaExit(Sender: TObject);
begin
  inherited;
  if (qryTpPaga.FieldByName('ANASINT').AsString = 'A') then
    EdTipoDesembCP.Text := qryTpPaga.FieldByName('DESCRICAO').asString;
  TreeTpPaga.Visible  := false;
end;

procedure TFrmEncerraConciliacao.pgcPrincipalChange(Sender: TObject);
begin
  inherited;
  TreeTpPaga.Visible  := false;
  TreeTpReceb.Visible := false;
end;

procedure TFrmEncerraConciliacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryTpDocCP.Close;
  qryTpDocCR.Close;

  qryFormaPgtoCP.Close;
  qryFormaPgtoCR.Close;

  qryRateioCAP.Close;
  qryRateioCAR.Close;

  qryTpPaga.Close;
  qryTpReceb.Close;

  qryAlterador.Close;

  inherited;
end;

procedure TFrmEncerraConciliacao.DbLkcDocumentoCAPChange(Sender: TObject);
begin
  inherited;
  if Trim(DbLkcDocumentoCAP.Text) = '' then Exit;
  qryRateioCAP.Close;
  qryRateioCAP.ParamByName('CODDOCUMENTO').AsString :=
    qryDocumentoCAP.FieldByName('CODDOCUMENTO').AsString;
  qryRateioCAP.Open;
end;

procedure TFrmEncerraConciliacao.DbLkcDocumentoCARChange(Sender: TObject);
begin
  inherited;
  if Trim(DbLkcDocumentoCAR.Text) = '' then Exit;
  qryRateioCAR.Close;
  qryRateioCAR.ParamByName('CODDOCUMENTO').AsString :=
    qryDocumentoCAR.FieldByName('CODDOCUMENTO').AsString;
  qryRateioCAR.Open;
end;

procedure TFrmEncerraConciliacao.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Confirma lancamentos?','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes
  then begin
    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Lancamentos confirmados', 'Informação', mtInformation, [mbOk], 0);
  end else begin
    if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
    MsgDlg('Lancamentos cancelados', 'Informação', mtInformation, [mbOk], 0);
  end;
  bbtnConfirmar.Visible := False;
  bbtnCancelar.Caption  := 'Voltar';
end;

{------------------------------------------------------------------------------}
{ Gerar dados financeiros no Contas a Receber                                  }
function TFrmEncerraConciliacao.GeraFinanceiroCR: Boolean;
begin
  Result := False;

  AbreConsultaProcesso('R', sAnoMesTela, qryValoresCROriginal);

  rValorDocumento := TotalizaDocumentos(qryValoresCROriginal);

  { Cria Componente de integração }
  try
    CtrlDocumento := TCtrlDocumento.Create;
    CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True
                             );
  except
    MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
    FreeAndNil(CtrlDocumento);
    Abort;
  end;


  { Gera Documentos no CAR }
  Try
    Try
      CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;
      CtrlDocumento.DataDisponibilidade := EdDtDisponibilidade.Date;

      if not InsereForCli('R') then Exit;

      if not InsereDocumento('R', qryValoresCROriginal) then Exit;

    Except
       FreeAndNil(CtrlDocumento);
       Exit;
    end;
    Result := True;
  Finally
    FreeAndNil(CtrlDocumento);
  end;

end;

{------------------------------------------------------------------------------}
{ Validar informções passada pela tela                                         }
function TFrmEncerraConciliacao.ValidaInformacoes: Boolean;
var
  iNumero, iCode : Integer;
begin
  inherited;
  Result := True;

  { Verifica se a pessoa do INSS foi informada }
  if prmIDPESSOAINSS = 0 then begin
    MsgDlg('Parametro identificador do INSS não informado, verifique na tela de paramentos do Sistema',
           'Erro', mtError,[mbOk],0);
    Result := False;
    Exit;
  end;

  if Trim(CbMes.Text) = '' then begin
    MsgDlg('Informar o mês de processamento','Erro', mtError,[mbOk],0);
    Result := False;
    Exit;
  end;

  { Dados da Tela }
  if pgcPrincipal.ActivePage = tbsContasaPagar then begin
    Val(EdNoDocumentoCP.Text, iNumero, iCode);
    if (EdDtEmissaoCP.Text = '') or (EdDtVencimentoCP.Text = '') or
       (EdTipoDesembCP.Text = '') or (DbLkcTipoDocCP.Text = '')
    then begin
      MsgDlg('Falta informar dados obrigatórios na tela.','Erro',
             mtError,[mbOk],0);
      Result := False;
    end;
  end else if pgcPrincipal.ActivePage = tbsContasaReceber then begin
    Val(EdNoDocumentoCR.Text, iNumero, iCode);
    if (EdDtEmissaoCR.Text = '') or (EdDtVencimentoCR.Text = '') or
       (EdTipoDesembCR.Text = '') or (DbLkcTipoDocCR.Text = '')
    then begin
      MsgDlg('Falta informar dados obrigatórios na tela.','Erro',
             mtError,[mbOk],0);
      Result := False;
    end;

  end;
  if iCode <> 0 then begin
    MsgDlg('Número do Documento não pode ter letras','Erro', mtError,[mbOk],0);
    Result := False;
  end;
end;

{------------------------------------------------------------------------------}
{ Retornar o valor total dos rateios                                           }
function TFrmEncerraConciliacao.TotalizaDocumentos(qryTotaliza : TwwQuery): Double;
begin
  Result := 0;
  With qryTotaliza do begin
    First;

    While not EOF do begin
      Result := Result + qryTotaliza.FieldByName('LIQUIDO').AsFloat;
      Next;
    end; { While }

    First;
  end; { With }
end;

procedure TFrmEncerraConciliacao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  tbsCARSGerados.TabVisible := False;
  tbsCAPSGErados.TabVisible := False;
  tbsVerificar.TabVisible   := False;

  bbtnCancelar.Caption      := 'Cancelar';

  { Fecha Datasets }
  qryDocumentoCAP.Close;
  qryRateioCAP.Close;
  DbLkcDocumentoCAP.Clear;

  qryDocumentoCAR.Close;
  qryRateioCAR.Close;
  DbLkcDocumentoCAR.Clear;
  {-}

  bbtnConfirmar.Visible       := False;
  bbtnCancelar.Visible        := False;
  Separador.Visible           := False;
  Btnprocessar.Visible        := True;
  BtnDesfazer.Visible         := True;

  pgcPrincipal.ActivePage     := tbsContasaPagar;

  PnlAlterador.Caption        := ' Alterador';
  EdDemonstraAlterador.Value  := 0;
  DbEdValorDocumentoCR.Value  := 0;
  DbEdValorDocumentoCP.Value  := 0;

  if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.RollBack;
  iCodDocumento := 0;

  frmAguarde.Apaga;
end;



function TFrmEncerraConciliacao.InsereDocumento(pcTipo : Char; qryValores : TwwQuery): Boolean;
var
 sCodTipRecDes    : string;
 sDebCre          : string;
 sRecPag          : string;

 iCodAlterador    : Integer;
 iCodTipDoc       : Integer;
 iIdPrograma      : Integer;
 iIdPatro         : Integer;
 iIdPlanoPrev     : Integer;
 iPlnCodigo       : Integer;
 iFormaPgto       : Integer;

 eNoDocumento     : Extended;

 sReferencia      : string;
 sCodCentroResPon : string;
 sCodCentroCusto  : string;
 sComplementoDoc  : string;
 sObs             : string;

 dValorLancamentoRateio : Extended;

 dtVencimento     : TDate;
 dtEmissao        : TDate;
begin
  Result := False;

  { Valida Informações }
  if DocumentoJaCadastrado(pcTipo) then
  begin
    Exit;
  end;

  iFormaPgto      := -1;
  iIdPlanoPrev    := qryValores.FieldByName('IDPLANOPREV').AsInteger;

  if pcTipo = 'R' then
  begin { RECEBER }
    sDebCre       := 'D';
    sRecPag       := 'R';
    sReferencia   := EdReferenciaCR.Text;
    eNoDocumento  := StrToFloat(EdNoDocumentoCR.Text);
    dtVencimento  := EdDtVencimentoCR.Date;
    dtEmissao     := EdDtEmissaoCR.Date;
    sObs          := MemoObsCR.Text;

    sComplementoDoc  := EdComplementoCR.Text;
    if Trim(DbLkcFormaPgtoCR.LookupValue) <> '' then iFormaPgto := StrToInt(DbLkcFormaPgtoCR.LookupValue);
    sCodCentroResPon := DbLkcCentroResponCR.LookupValue;
    sCodCentroCusto  := DbLkcCentroCustoCR.LookupValue;
    iCodTipDoc       := StrToInt(DbLkcTipoDocCR.LookupValue);
  end
  else
  if pcTipo = 'P' then
  begin  { PAGAR     }
    sDebCre       := 'C';
    sRecPag       := 'P';
    sReferencia   := EdReferenciaCP.Text;
    eNoDocumento  := StrToFloat(EdNoDocumentoCP.Text);
    dtVencimento  := EdDtVencimentoCP.Date;
    dtEmissao     := EdDtEmissaoCP.Date;
    sObs          := MemoObsCP.Text;

    sComplementoDoc  := EdComplementoCP.Text;
    if Trim(DbLkcFormaPgtoCP.LookupValue) <> '' then iFormaPgto := StrToInt(DbLkcFormaPgtoCP.LookupValue);
    sCodCentroResPon := DbLkcCentroResponCP.LookupValue;
    sCodCentroCusto  := DbLkcCentroCustoCP.LookupValue;
    iCodTipDoc       := StrToInt(DbLkcTipoDocCP.LookupValue);
  end
  else
  if pcTipo = 'A' then
  begin  { ALTERADOR }

  end;

  { Duvidas }
  iIdPrograma   := -1;
  // André Pontes - pendência 23230 - 04/09/2006
//  iIdPatro      := ParamIntegra.PatroGlobal;
  iIdPatro      := 91008;
  // FIM André Pontes - pendência - 04/09/2006
  iPlnCodigo    := 0;
  iCodAlterador := -1;

  iCodDocumento := CtrlDocumento.GetSequenceDocumento;


  try
    { Primeiro Contabiliza os lançamentos para determinar se utilizarei }
    { multiplas contas de baixa                                         }
    if not(InsereContabil(pcTipo,
                          qryValores,
                          iIdPlanoPrev,
                          iCodDocumento,
                          iPlnCodigo
                         )) then
    begin
      Exit;
    end;

    { DOCUMENTO }
    CtrlDocumento.SetValues(iCodDocumento,               // CODDOCUMENTO
                            eNoDocumento,                // NODOCUMENTO
                            sComplementoDoc,             // COMPLDOCUMENTO
                            '0',                         // STATUS
                            sRecPag,                     // RECPAG
                            '2',                         // SOPERACAO
                            '',                          // SNUMSLIP
                            '',                          // SNUMLEITCODBARRAS
                            aContasxValor[0].PlaConta,   // PLACONTA
                            sCodCentroCusto,             // CODCENTROCUSTO
                            '',                          // NOSSONUMERO
                            '',                          // NUMDIGCODBARRAS
                            '',                          // GRUPODOC
                            '',                          // SFLGEMITELANCBAIX
                            'N',                         // SFLGCONFIRMARECPAG
                            'N',                         // EMISBLOQ
                            sReferencia,                 // REFERENCIA
                            sObs,                        // OBS
                            dtVencimento,                // DATAVENCTO
                            dtEmissao,                   // DATAEMISSAO
                            dtVencimento,                // DATAPROGRAMADA
                            0,                           // DATAREMESSA
                            0,                           // DATALIMITE
                            0,                           // DATACORRECAO
                            0,                           // RVLRMULTA
                            0,                           // RVALORJUROS
                            0,                           // RVALORDESCONTO
                            0,                           // RPERCJUROSSIMPLES
                            0,                           // RPERCJUROSATUARIAL
                            iCodTipDoc,                  // CODTIPDOC
                            Sistema.IdEmpresa,           // IDPESSOA
                            Sistema.IdModulo,            // IDMODULO
                            iIdForCli,                   // LDFORCLI
                            -1,                          // NUMFATURA
                            -1,                          // IDCBANCARIA
                            prmUnidNegoc,                // UNIDNEGOC    // Gleyber - 05/09/2006 - Pendência 23243
                            ParamIntegra.Plano,          // PLANO
                            -1,                          // NUMCPBAIXA
                            -1,                          // NUMAPGR
                             0,                          // MOECODIGO
                            -1,                          // LOTETRANSMISSAO
                            -1,                          // INDICECORRECAO
                            Sistema.IdUsuario,           // IDUSUARIOINCLUSAO
                            Sistema.IdEmpresa,           // IDEMPRESA
                            1,                           // FLGNAOCONCILIADO
                            -1,                          // CONTROLEREMESS,
                            -1,                          // CODSUBCONTA
                            -1,                          // CODPORTFORMA
                            -1,                          // CODGRUPOCNAB
                            -1,                          // CODGERADORINSS
                            iFormaPgto,                  // CODFORMA
                            -1                           // IIDSEGREGACRITER
                          );

  except
    MsgDlg(CtrlDocumento.MessageInfo, 'Erro', mtError, [mbOk], 0);
    Repaint;
    Abort;
    Exit;
  end;

  { RATEIODOCUM }
  while not(qryValores.Eof) do
  begin
    dValorLancamentoRateio := qryValores.FieldByName('LIQUIDO').AsFloat;

    if pcTipo = 'R' then begin           { RECEBER   }
      if Trim(qryValores.FieldByName('CODTIPREC').AsString) <> '' then
        sCodTipRecDes := qryValores.FieldByName('CODTIPREC').AsString
      else
        sCodTipRecDes := qryTpReceb.FieldByName('CODTIPRECDES').AsString
    end else if pcTipo = 'P' then begin  { PAGAR     }
      if Trim(qryValores.FieldByName('CODTIPDES').AsString) <> '' then
        sCodTipRecDes := qryValores.FieldByName('CODTIPDES').AsString
      else
        sCodTipRecDes := qryTpPaga.FieldByName('CODTIPRECDES').AsString
    end else if pcTipo = 'A' then begin  { ALTERADOR }

    end;

    Try
      CtrlDocumento.RateioDocum.SetValues (
        dValorLancamentoRateio,                    // VALOR
        0,                                         // VALOROM
        0,                                         // VLRRESORCAMEN
        0,                                         // IDRATEIODOCUM
        Sistema.IdEmpresa,                         // IDPESSOA
        iCodDocumento,                             // CODDOCUMENTO
        prmUnidNegoc,                              // UNIDNEGOC      // Gleyber - 05/09/2006 - Pendência 23243
        0,                                         // MOECODIGO
        Sistema.IdUsuario,                         // IDUSUARIOINCLUSAO
        0,                                         // IDRESERVAORCAMEN
        ParamIntegra.Plano,                        // PLANO
        qryValores.FieldByName('IDPLANOPREV').AsInteger, // IDPLANOPREV
        iIdPatro,                                  // IDPATRO
        1,                                         // IDPROGRAMA
        0,                                         // IDPROCESSO                          
        Sistema.IdEmpresa,                         // IDEMPRESA
        sCodTipRecDes,                             // CODTIPRECDES
        sRecPag,                                   // RECPAG
        sCodCentroResPon,                          // CODCENTRORESPON
        sCodCentroCusto,                           // CODCENTROCUSTO
        ''                                         // NUMIMOVEL
      );
    Except
      MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
      Abort;
      Exit;
    end;

    qryValores.Next;
  end;

  { LANCTODOCUM }
  Try
    CtrlDocumento.LanctoDocum.SetValues(
      Date,                        // DATALANCTO
      iCodDocumento,               // CODDOCUMENTO
      0,                           // NUMLANCTO
      rValorDocumento,             // VLRLIQUIDO
      0,                           // VALOROM
      rValorDocumento,             // VALOR
      prmUnidNegoc,                // UNIDNEGOC   // Gleyber - 05/09/2006 - Pendência 23243
      iPlnCodigo,                  // LIPLNCODIGO
      -1,                          // NUMLOTEMANUAL
      Sistema.IdUsuario,           // IDUSUARIOINCLusao
      Sistema.IdEmpresa,           // IDPESSOA
      -1,                          // IDNFLIVRO,
      -1,                          // ESTORNO
      iCodTipDoc,                  // CODTIPDOC
      -1,                          // CODDOCINSS
      -1,                          // CODALTERADOR
      '2',                         // OPERACAO
      '',                          // NUMRECIBO
      '',                          // NUMNF
      '',                          // NUMFATURA
      '',                          // HISTORICOCOMPL
      '',                          // FLGTIPOFATURA
      'N',                         // FLGRECEBEUNF
      '',                          // FLGFATEMITIDA
      sDebCre,                     // DEBCRE
      Sistema.IdModulo,            // IDMODULO
      ParamIntegra.Plano,          // PLANOCONTA
      True,                        // USAPLANOPATRO
      True,                        // CONTABILIZA
      -1,                          // ICODPORTFORMA
      0,                           // DIASFLOAT
      '',                          // CONTABAIXA
      0                            // SUBCONTABAIXA
    );

  Except
    MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
    Abort;
    Exit;
  end;

  { Inserir Documento }
  if not CtrlDocumento.Insert  then begin
    MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
    Exit;
  end;

  { Inicio Inserir ALTERADOR }
  if (pcTipo = 'P') And (Trim(DbLkcAlterador.Text) <> '') then begin

    if sDebCre = 'D' then sDebCre := 'C' else sDebCre := 'D';

    CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
    CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
    CtrlDocumento.IdUsuario   := Sistema.IdUsuario;

    { LANCTODOCUM ALTERADOR }
    Try
      CtrlDocumento.LanctoDocum.SetValues(
        Date,                        // DATALANCTO
        iCodDocumento,               // CODDOCUMENTO
        0,                           // NUMLANCTO
        EdValorAlterador.Value,      // VLRLIQUIDO
        0,                           // VALOROM
        EdValorAlterador.Value,      // VALOR
        prmUnidNegoc,                // UNIDNEGOC  // Gleyber - 05/09/2006 - Pendência 23243
        -1,                          // LIPLNCODIGO
        -1,                          // NUMLOTEMANUAL
        Sistema.IdUsuario,           // IDUSUARIOINCLusao
        Sistema.IdEmpresa,           // IDPESSOA
        -1,                          // IDNFLIVRO,
        -1,                          // ESTORNO
        -1,                          // CODTIPDOC
        -1,                          // CODDOCINSS
        qryAlterador.FieldByName('CODALTERADOR').AsInteger,   // CODALTERADOR
        '4',                         // OPERACAO
        '',                          // NUMRECIBO
        '',                          // NUMNF
        '',                          // NUMFATURA
        '',                          // HISTORICOCOMPL
        '',                          // FLGTIPOFATURA
        'N',                         // FLGRECEBEUNF
        '',                          // FLGFATEMITIDA
        sDebCre,                     // DEBCRE
        Sistema.IdModulo,            // IDMODULO
        ParamIntegra.Plano,          // PLANOCONTA
        True,                        // USAPLANOPATRO
        True,                        // CONTABILIZA
        -1,                          // ICODPORTFORMA
        0,                           // DIASFLOAT
        '',                          // CONTABAIXA
        0                            // SUBCONTABAIXA
      );

    Except
      MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
      Abort;
      Exit;
    end;

    if not CtrlDocumento.Insert  then begin
      MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
      Exit;
    end;

    PnlAlterador.Caption       := ' '+DbLkcAlterador.Text;
    EdDemonstraAlterador.Value := EdValorAlterador.Value;

  end; { if Trim(DbLkcAlterador.Text) <> ''  }


  AtualizaCONCINSS(pcTipo, iCodDocumento, sAnoMesTela);

  Result := True;

end;

function TFrmEncerraConciliacao.InsereForCli(pcTipo : Char): Boolean;
var
  TfcTipoForCli : TTipoForCli;
  sSQL : string;
begin
  Result := False;

  { Guarda Valores }

  if pcTipo = 'R' then begin
    TfcTipoForCli := tfcCliente;
    iIdForCli     := prmIDPESSOAINSS;
  end else begin
    TfcTipoForCli := tfcFornecedor;
    iIdForCli     := prmIDPESSOAREPASSE;
  end;

  sSQL := 'SELECT IDPESSOA FROM FORNSERV '+
          'WHERE IDPESSOA = '+ IntToStr(iIdForCli);
  if FazQuery(qryAux, sSQL) then begin
    Result := True;
    Exit;
  end;


  try
    Ctrldocumento.ForCli.Inserir
                                ( iIdForCli,                      // LIIDPESSOA
                                  Sistema.IdEmpresa,              // LIIDEMPRESA
                                  -1,                             // LICODSUBCONTA
                                  ParamIntegra.Plano,             // LIPLANO
                                  prmIdRamoTipoCliPatro,          // LIIDRAMOTIPOCLI
                                  DbLkcCentroCustoCR.LookupValue, // SCCUSTO
                                  '',                             // SCONTACADIANTO
                                  '',                             // SCONTACFORCLI
                                  '',                             // SCONTACDESPESA
                                  TfcTipoForCli);                 // TIPOFORCLI = (TFCFORNECEDOR, TFCCLIENTE)
  except
    MsgDlg('Erro na criação do cliente no Contas a Receber',
           'Erro', mtError,[mbOk],0);
    Exit;
  end;
  Result := True;
end;


function TFrmEncerraConciliacao.AbreConsultaProcesso(pcTipo       : Char;
                                                     sAnoMesRef   : string;
                                                     qryProcesso  : TwwQuery
                                                    ): Boolean;
begin
  Result := True;

  { Busca valores que serão processados para lançamento no CAP e CONTAB }
  if Pos('Original', qryProcesso.Name) = 0 then dtsValores.DataSet := qryProcesso;

  if not(qryProcesso.Active) or (qryProcesso.RecordCount > 0) then
  begin
    qryProcesso.Close;
    qryProcesso.ParamByName('MESCOBRANCA').AsString := sAnoMesRef;
    qryProcesso.Open;

    if qryProcesso.IsEmpty then
    begin
      MsgDlg('Não existem lançamentos no ANO/MES selecionado.', 'Informação', mtInformation, [mbOk], 0);
      Result := False;
      Exit;
    end;
  end;

  tbsVerificar.TabVisible := True;
  pgcPrincipal.ActivePage := tbsVerificar;
end;



procedure TFrmEncerraConciliacao.AbreConsultaResultadoProcesso(pcTipo : Char; piCodDocumento : Integer);
begin
  frmAguarde.Apaga;

  if piCodDocumento = 0 then Exit;

  frmAguarde.Mostra('Buscando movimento financeiro.');

  if pcTipo = 'P' then begin          { CAPs GERADAS }
    pgcPrincipal.ActivePage := tbsCAPSGerados;
    qryDocumentoCAP.Close;
    qryDocumentoCAP.ParamByName('CODDOCUMENTO').AsInteger := piCodDocumento;
    qryDocumentoCAP.Open;

    DbLkcDocumentoCAP.Text := qryDocumentoCAP.FieldByName('NODOCUMENTO').AsString;

  end else if pcTipo = 'R'  then begin { CARs GERADAS }
    pgcPrincipal.ActivePage := tbsCARSGerados;
    qryDocumentoCAR.Close;
    qryDocumentoCAR.ParamByName('CODDOCUMENTO').AsInteger := piCodDocumento;
    qryDocumentoCAR.Open;

    DbLkcDocumentoCAR.Text := qryDocumentoCAR.FieldByName('NODOCUMENTO').AsString;
  end;

  frmAguarde.Apaga
end;

procedure TFrmEncerraConciliacao.CbMesChange(Sender: TObject);
begin
  inherited;
  qryValoresCR.Close;
  qryValoresCP.Close;
end;

procedure TFrmEncerraConciliacao.BtnProcessarClick(Sender: TObject);
var
  sAnoTela, sMesTela : string;
begin
  inherited;

  { Valida Informações }
  if not ValidaInformacoes then begin
    Exit;
  end;

  { Prepara dados }
  sAnoTela := Trim(SpEdAno.Text);
  if CbMes.ItemIndex <= 8 then
    sMesTela  := '0'+IntToStr(CbMes.ItemIndex+1)
  else
    sMesTela := IntToStr(CbMes.ItemIndex+1);

  sAnoMesTela   := sAnoTela+'/'+sMesTela;

  frmAguarde.Mostra('Apurando valores para lançamento...');

  if pgcPrincipal.ActivePage = tbsContasaPagar then begin

    { Verifica se  já foi feito o fechamento }
    if ExisteCONCINSS('P', sAnoMesTela) then begin
      MsgDlg('O '+pgcPrincipal.ActivePage.Caption+ ' de '+
             CbMes.Text+' de '+SpEdAno.Text+' já foi processado. ',
             'Erro', mtError, [mbOk], 0);

      Exit;
    end;

    LblTipoProcesso.Caption := 'Valores apurados no processo - Repasse para Caixa';
    AbreConsultaProcesso('R', sAnoMesTela, qryValoresCP);

  end else if pgcPrincipal.ActivePage = tbsContasaReceber then begin

    { Verifica se  já foi feito o fechamento }
    if ExisteCONCINSS('R', sAnoMesTela) then begin
      MsgDlg('O '+pgcPrincipal.ActivePage.Caption+ ' de '+
             CbMes.Text+' de '+SpEdAno.Text+' já foi processado. ',
             'Erro', mtError, [mbOk], 0);

      Exit;
    end;

    LblTipoProcesso.Caption := 'Valores apurados no processo - Recebidos do INSS';
    AbreConsultaProcesso('R', sAnoMesTela, qryValoresCR);

  end;

  BtnProcessar.Visible  := False;
  BtnDesfazer.Visible   := False;

  frmAguarde.Apaga;

end;

{------------------------------------------------------------------------------}
{ Gerar dados financeiros no Contas a Pagar                                    }
function TFrmEncerraConciliacao.GeraFinanceiroCP: Boolean;
begin
  Result := False;

  AbreConsultaProcesso('R', sAnoMesTela, qryValoresCPOriginal);

  rValorDocumento := TotalizaDocumentos(qryValoresCPOriginal);

  { Guarda Valores }
  iIdForCli     := prmIDPESSOAINSS;

  { Cria Componente de integração }
  try
    CtrlDocumento := TCtrlDocumento.Create;
    CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              True
                            );
  except
    MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
    FreeAndNil(CtrlDocumento);
    Abort;
  end;

  { Gera Documentos no CAP }
  Try
    Try
      CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      CtrlDocumento.IdEspAcesso := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario   := Sistema.IdUsuario;
      CtrlDocumento.DataDisponibilidade := EdDtDisponibilidade.Date;

      if not InsereForCli('P') then Exit;

      if not InsereDocumento('P', qryValoresCPOriginal) then Exit;

    Except
       FreeAndNil(CtrlDocumento);
       Exit;
    end;
    Result := True;
  Finally
    FreeAndNil(CtrlDocumento);
  end;
end;

procedure TFrmEncerraConciliacao.bbtnSairClick(Sender: TObject);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TFrmEncerraConciliacao.BtnDesfazerClick(Sender: TObject);
var
  sDataExclusao, sSQL : string;
  iCodDocumento : Integer;
  sAnoTela, sMesTela : string;
begin
  inherited;

  if MsgDlg('Deseja realmente desfazer os lançamentos referentes a '+CbMes.Text+' de '+SpEdAno.Text+' '+#13+
            'feitos no '+pgcPrincipal.ActivePage.Caption,
            'Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
    Exit;
  end;

  { Verifica se a pessoa do INSS foi informada }
  if prmIDPESSOAINSS = 0 then begin
    MsgDlg('Parametro identificador do INSS não informado, verifique na tela de paramentos do Sistema',
           'Erro', mtError,[mbOk],0);
    Exit;
  end;

  { Prepara dados }
  sAnoTela := Trim(SpEdAno.Text);
  if CbMes.ItemIndex <= 8 then
    sMesTela  := '0'+IntToStr(CbMes.ItemIndex+1)
  else
    sMesTela := IntToStr(CbMes.ItemIndex+1);

  sAnoMesTela   := sAnoTela+'/'+sMesTela;

  sSQL := 'SELECT MESREFERENCIA, CODDOCCAR, CODDOCCAP FROM CONCINSS '+
          'WHERE MESREFERENCIA = '+QuotedStr(sAnoMesTela);

  if not FazQuery(qryAux, sSQL) then begin
    MsgDlg('Não foi encontrado o documento de integração na tabela CONCINSS',
           'Erro', mtError,[mbOk],0);
    Exit;
  end;

  {----------------------------------------------------------------------------}
  { Inicio do Processo de desfazer                                             }
  Try

    Try
      dtmBaseDados.dbBaseDados.StartTransaction;

      if pgcPrincipal.ActivePage = tbsContasaPagar then begin             { CONTAS A PAGAR }
        iCodDocumento := qryAux.FieldByName('CODDOCCAP').AsInteger;
      end else if pgcPrincipal.ActivePage = tbsContasaReceber then begin  { CONTAS A RECEBER }
        iCodDocumento := qryAux.FieldByName('CODDOCCAR').AsInteger;
      end;

      if iCodDocumento <= 0 then begin
        MsgDlg('Não foi encontrado o documento de integração na tabela CONCINSS',
               'Erro', mtError,[mbOk],0);
        Exit;
      end;

      { Cria Componente de integração }
      try
        CtrlDocumento := TCtrlDocumento.Create;
        CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                  True,
                                  Sistema.ConnectionType,
                                  Sistema.ConnectionSide,
                                  Sistema.AppRemoteServer,
                                  True
                                 );
      except
        MsgDlg(CtrlDocumento.MessageInfo,'Erro', mtError,[mbOk],0);
        FreeAndNil(CtrlDocumento);
        Abort;
      end;

      CtrlDocumento.Prepare(opDocumento, odlEfetivo);

      CtrlDocumento.IdEspAcesso  := Sistema.IdEspAcesso;
      CtrlDocumento.IdUsuario    := Sistema.IdUsuario;
      CtrlDocumento.IdModulo     := Sistema.IdModulo;
      CtrlDocumento.CodDocumento := iCodDocumento;

      if pgcPrincipal.ActivePage = tbsContasaPagar then begin
        AtualizaCONCINSS('P', 0, sAnoMesTela);
      end else begin
        AtualizaCONCINSS('R', 0, sAnoMesTela);
      end;

      if not CtrlDocumento.Delete then begin
         MsgDlg('Erro no estorno do documento nº '+IntToStr( iCodDocumento )+', com a mensagem : '+#13+
                CtrlDocumento.MessageInfo ,
                'Erro', mtError,[mbOk],0);
         dtmBaseDados.dbBaseDados.Rollback;
         Exit;
      end;

      dtmBaseDados.dbBaseDados.Commit;
      MsgDlg('Desfazer lancamentos confirmados de "'+
             sAnoMesTela+'" terminado com sucesso.',
             'Informação', mtInformation, [mbOk], 0);
    Except
      dtmBaseDados.dbBaseDados.Rollback;
    end;

  Finally
    FreeAndNil(CtrlDocumento);
  end;

  { Fim Processo de desfazer                                                   }
  {----------------------------------------------------------------------------}
end;

function TFrmEncerraConciliacao.DocumentoJaCadastrado(pcTipo : Char): Boolean;
var
  sSQL, sNoDocumento, sComplemento : string;
  iIdForCli : Integer;
begin
  Result := True;

  if pcTipo = 'R' then begin { RECEBER }
    sNoDocumento  := EdNoDocumentoCR.Text;
    sComplemento  := EdComplementoCR.Text;
    iIdForCli     := prmIDPESSOAINSS;
  end else begin             { PAGAR   }
    sNoDocumento  := EdNoDocumentoCP.Text;
    sComplemento  := EdComplementoCP.Text;
    iIdForCli     := prmIDPESSOAREPASSE;
  end;

  sSQL := 'SELECT CODDOCUMENTO FROM DOCUMENTO '+
          'WHERE NODOCUMENTO = '+ sNoDocumento +
          ' AND COMPLDOCUMENTO = '+ QuotedStr(sComplemento) +
          ' AND IDFORCLI = '+ IntToStr(iIdForCli);

  if FazQuery(qryAux, sSQL) then begin
    MsgDlg('Número de Documento já lançado para este fornecedor',
           'Erro', mtError, [mbOk], 0);
    Exit;
  end;

  Result := False;
end;

procedure TFrmEncerraConciliacao.EdDtVencimentoCRExit(Sender: TObject);
begin
  inherited;
  EdDtDisponibilidade.Text := EdDtVencimentoCR.Text;
end;

function TFrmEncerraConciliacao.InsereContabil(pcTipo: Char;
                                               qryValores: TwwQuery;
                                               piIdPlanoPrev,
                                               piCodDocumento : Integer;
                                               var piPlnCodigo : Integer): Boolean;
var
  iPlnCodigo : Integer;

  dValorLancamento : Extended;
  sDebCre : Char;

  sPlaContaDeb, sPlaContaCred, sNumDocumento,
  sCodCentroCustoC, sCodCentroCustoD, sdtEmissao,
  sUnidNegoc, sSubContaDeb, sSubContaCre : string;

  sHST1, sHST2, sHST3, sHST4, sHST5 : string;
  rDadosContabeis : RecDadosContabeis;
begin
  Result := False;
  qryValores.First;

  prmUnidNegoc     := -1;
  sUnidNegoc       := IntToStr(prmUnidNegoc);
  sCodCentroCustoC := '';
  sCodCentroCustoD := '';
  sNumDocumento    := '';

  sHST1 := 'LANC. DOC. '+IntToStr(piCodDocumento);
  sHST2 := '';  sHST3 := '';  sHST4 := '';  sHST5 := '';

  sDebCre       := '2';

  if pcTipo = 'R' then begin            { RECEBER   }
    sdtEmissao       := EdDtEmissaoCR.Text;
    sCodCentroCustoC := DbLkcCentroCustoCR.LookupValue;
    sNumDocumento    := EdNoDocumentoCR.Text;
  end else if pcTipo = 'P' then begin   { PAGAR     }
    sdtEmissao       := EdDtEmissaoCP.Text;
    sCodCentroCustoD := DbLkcCentroCustoCP.LookupValue;
    sNumDocumento    := EdNoDocumentoCR.Text;
  end else if pcTipo = 'A' then begin   { ALTERADOR }
    sdtEmissao       := EdDtEmissaoCP.Text;
    dValorLancamento := EdValorAlterador.Value;
  end;

  { Inicia Control }
  Try
    CtrlLancamento := TCtrlLancamento.Create;
    CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                               True,
                               Sistema.ConnectionType,
                               Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,
                               True
                             );
  Except
    MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
    Abort;
    Exit;
  end;


  While not qryValores.Eof do begin

    rDadosContabeis  := BuscaDadosContabeis(pcTipo, qryValores);
    dValorLancamento := qryValores.FieldByName('LIQUIDO').AsFloat;

    if pcTipo = 'R' then begin            { RECEBER  }
      sPlaContaDeb    := Trim(rDadosContabeis.ContaContabilBaixa);
      sPlaContaCred   := Trim(rDadosContabeis.ContaContabilRecDes);

      sSubContaDeb    := Trim(rDadosContabeis.SubContaContabilBaixa);
      sSubContaCre    := Trim(rDadosContabeis.SubContaContabilRecDes);
    end else if pcTipo = 'P' then begin   { PAGAR    }
      sPlaContaDeb    := Trim(rDadosContabeis.ContaContabilRecDes);
      sPlaContaCred   := Trim(rDadosContabeis.ContaContabilBaixa);

      sSubContaDeb    := Trim(rDadosContabeis.SubContaContabilRecDes);
      sSubContaCre    := Trim(rDadosContabeis.SubContaContabilBaixa);
    end;

    { Verifica se conta já foi utilizada  }
    TotalizaLancamentosPorConta(rDadosContabeis.ContaContabilBaixa, dValorLancamento);

    { Insere valores }
    Try
      CtrlLancamento.InsereLancaContab ( sDebCre,                  // LACTIPO
                                         Sistema.IdEmpresa,        // IDEMPRESA
                                         Sistema.IdModulo,         // IMODULOORIGEM
                                         Sistema.IdUsuario,        // IDUSUARIOINCLUSAO
                                         ParamIntegra.Plano,       // PLANO
                                         StrToInt(sUnidNegoc),     // UNIDNEGOC
                                         StrToInt(sSubContaDeb),   // LISUBCONTADEB
                                         StrToInt(sSubContaCre),   // LISUBCONTACRE
                                         qryValores.FieldByName('IDPLANOPREV').AsInteger, // IDPLANOPREV
                                         91008,
                                         piPlnCodigo,              // LIPLNCODIGO
                                         0,                        // INUMLAN
                                         sdtEmissao,               // SDATALANC
                                         sNumDocumento,            // SNUMDOC
                                         sHST1,                    // LACHIST1
                                         sHST2,                    // LACHIST2
                                         sHST3,                    // LACHIST3
                                         sHST4,                    // LACHIST4
                                         sHST5,                    // LACHIST5
                                         prmTpOperCobranca,        // STIPOOPER
                                         sCodCentroCustoD,         // SCCUSTOD
                                         sPlaContaDeb,             // SCONTAD
                                         sCodCentroCustoC,         // SCCUSTOC
                                         sPlaContaCred,            // SCONTAC
                                         '',                       // SCODHIST
                                         dValorLancamento,         // RVALLANC
                                         False,                    // BJUNTA
                                         Sistema.UsaPlanoPatro,    // BUSAPLANOPATRO
                                         -1,                       // IIDSEGREGACRITER
                                         -1                        // DDATASEGREGACRITER
                                       );
      piPlnCodigo := Trunc(CtrlLancamento.RetornoPlnCodigo);

      if piPlnCodigo <= 0 then begin
        MsgDlg(CtrlLancamento.MessageInfo,'Erro', mtError,[mbOk],0);
        FreeAndNil( CtrlLancamento );
        Exit;
      end else begin
        sMsgErro:='';
      end;
    except
      on E:Exception do
      begin
        MsgDlg(CtrlDocumento.MessageInfo+#13+
               'ERRO : '+E.Message,'Erro', mtError,[mbOk],0);
        FreeAndNil( CtrlLancamento );
        Exit;
      end;
    end;

    qryValores.Next;

  end; { While not qryValores.EOF }

  FreeAndNil( CtrlLancamento );

  qryValores.First;
  Result := True;
end;



function TFrmEncerraConciliacao.BuscaDadosContabeis(pcTipo      : Char;
                                                    qryValores  : TwwQuery
                                                   ): RecDadosContabeis;
var
  sSQL            : string;
  sCodTipRecDes   : string;
  sCodCentroCusto : string;
begin
  Result.RetornouValor          := False;
  Result.ContaContabilRecDes    := '';
  Result.ContaContabilBaixa     := '';
  Result.SubContaContabilRecDes := '0';
  Result.SubContaContabilBaixa  := '0';

  if pcTipo = 'R' then
  begin           { RECEBER   }
    sCodCentroCusto  := DbLkcCentroCustoCR.LookupValue;
    if Trim(qryValores.FieldByName('CODTIPREC').AsString) <> '' then
      sCodTipRecDes := qryValores.FieldByName('CODTIPREC').AsString
    else
      sCodTipRecDes := qryTpReceb.FieldByName('CODTIPRECDES').AsString
  end
  else
  if pcTipo = 'P' then
  begin  { PAGAR     }
    sCodCentroCusto  := DbLkcCentroCustoCP.LookupValue;
    if Trim(qryValores.FieldByName('CODTIPDES').AsString) <> '' then
      sCodTipRecDes := qryValores.FieldByName('CODTIPDES').AsString
    else
      sCodTipRecDes := qryTpPaga.FieldByName('CODTIPRECDES').AsString
  end
  else
  if pcTipo = 'A' then
  begin  { ALTERADOR }
    { Buscar na tabela Alterador }
    sSQL := 'SELECT * FROM TIPOALTERADOR '+
            'WHERE CODALTERADOR   =  '+ QuotedStr(qryAlterador.FieldByName('CODALTERADOR').AsString);
    if FazQuery(qryAux, sSQL) then begin
      Result.RetornouValor := True;
      Result.ContaContabilRecDes := qryAux.FieldByName('PLACONTA').AsString;
      Exit;
    end;
  end;

  { Buscar na Tabela Aranha }
  sSQL :=
  'SELECT * '                                             + #13 +
  'FROM '                                                 + #13 +
  '  TIPORDXCCXCONTA '                                    + #13 +
  'WHERE '                                                + #13 +
  '      CODCENTROCUSTO = ' + QuotedStr(sCodCentroCusto)  + #13 +
  '  AND IDPROGRAMA     = 1 '                             + #13 +
  '  AND CODTIPRECDES   = ' + QuotedStr(sCodTipRecDes)    + #13 +
  '  AND RECPAG         = ' + QuotedStr(pcTipo);

  if FazQuery(qryAux, sSQL) then
  begin
    Result.RetornouValor := True;
    Result.ContaContabilRecDes := qryAux.FieldByName('PLACONTA').AsString;
    //Exit;
  end;

  { Buscar na TIPORECEBDESEMB }
  sSQL := 'SELECT NVL(PLACONTA,0) AS PLACONTA, NVL(PLACONTACREDITO,0) AS PLACONTACREDITO,  '+
          '       NVL(CODSUBCONTA,0) AS CODSUBCONTA,  NVL(CODSUBCONTACRE,0) AS CODSUBCONTACRE '+
          'FROM TIPORECEBDESEMB  '+
          'WHERE CODTIPRECDES   =  '+QuotedStr(sCodTipRecDes)+ ' AND ' +
          '      RECPAG         =  '+QuotedStr(pcTipo);
  if FazQuery(qryAux, sSQL) then begin
    Result.RetornouValor := True;
    if Result.ContaContabilRecDes = '' then
      Result.ContaContabilRecDes    := qryAux.FieldByName('PLACONTA').AsString;

    Result.SubContaContabilRecDes := qryAux.FieldByName('CODSUBCONTA').AsString;
    Result.ContaContabilBaixa     := qryAux.FieldByName('PLACONTACREDITO').AsString;
    Result.SubContaContabilBaixa  := qryAux.FieldByName('CODSUBCONTACRE').AsString;
    Exit;
  end;

end;

function TFrmEncerraConciliacao.AtualizaCONCINSS(pcTipo : Char;
                                                 piCodDocumento : Integer;
                                                 psMesReferencia : string): Boolean;
var
  sNomeCampo, sComplemento, sSQL : string;
begin
  Result := False;

  if pcTipo = 'R' then begin { RECEBER }
    sNomeCampo := 'CODDOCCAR';
  end else begin
    sNomeCampo := 'CODDOCCAP';
  end;

  if piCodDocumento > 0 then begin
    sComplemento := IntToStr(piCodDocumento);
  end else begin
    sComplemento := 'NULL';
  end;



  sSQL := 'UPDATE CONCINSS SET '+sNomeCampo+' = '+sComplemento+' '+
          'WHERE MESREFERENCIA = '+QuotedStr(psMesReferencia);

  if not ExecutarQuery(qryAux, sSQL) then Exit;
  Result := True;
end;



function TFrmEncerraConciliacao.ExisteCONCINSS(pcTipo: Char;
                                               psMesReferencia: string): Boolean;
var
  sNomeCampo, sSQL : string;
begin
  Result := True;
  if pcTipo = 'R' then
  begin { RECEBER }
    sNomeCampo := 'CODDOCCAR';
  end
  else
  begin
    sNomeCampo := 'CODDOCCAP';
  end;

  sSQL := 'SELECT MESREFERENCIA, CODDOCCAR, CODDOCCAP FROM CONCINSS '+
          'WHERE MESREFERENCIA = '+QuotedStr(psMesReferencia);

  if not FazQuery(qryAux, sSQL) then Exit;

  if Trim(qryAux.FieldByName(sNomeCampo).AsString) <> '' then Exit;

  Result := False;
end;



procedure TFrmEncerraConciliacao.TotalizaLancamentosPorConta(sPlaConta : string; dValorLancamento : Double);
var
  i       : Integer;
  bExiste : Boolean;
begin
  bExiste := False;

  for i := 0 to 20 do
  begin
    if aContasxValor[i].PlaConta = sPlaConta then
    begin
      aContasxValor[i].ValorTotalLancamentos :=
        aContasxValor[i].ValorTotalLancamentos  + dValorLancamento;
      bExiste := True;
      Break;
    end;
    if aContasxValor[i].PlaConta = '' then Break;
  end;

  if not(bExiste) then
  begin
    aContasxValor[i].PlaConta := sPlaConta;
    aContasxValor[i].ValorTotalLancamentos := dValorLancamento;
  end;

end;

procedure TFrmEncerraConciliacao.BtConfirmaLancamentosClick(Sender: TObject);
begin
  inherited;

  frmAguarde.Mostra('Gerando movimento financeiro.');

  dtmBaseDados.dbBaseDados.StartTransaction;

  if Pos( 'Caixa', LblTipoProcesso.Caption ) > 0 then
  begin
    { CAP }
    if not(GeraFinanceiroCP) then
    begin
      MsgDlg('Erro na geração Contas a Pagar', 'Erro', mtError, [mbOk], 0);
      dtmBaseDados.dbBaseDados.RollBack;

      bbtnCancelarClick(Self);
      frmAguarde.Apaga;
      Exit;
    end
    else
    begin
      tbsVerificar.TabVisible   := False;
      tbsCAPSGErados.TabVisible := True;
      pgcPrincipal.ActivePage   := tbsCAPSGerados;

      AbreConsultaResultadoProcesso('P', iCodDocumento);
    end;
  end
  else
  if Pos( 'INSS', LblTipoProcesso.Caption ) > 0 then
  begin
    { CAR }
    if not(GeraFinanceiroCR) then
    begin
      MsgDlg('Erro na geração Contas a Receber', 'Erro', mtError, [mbOk], 0);
      dtmBaseDados.dbBaseDados.RollBack;
      bbtnCancelarClick(Self);

      frmAguarde.Apaga;
      Exit;
    end
    else
    begin
      tbsVerificar.TabVisible   := False;
      tbsCARSGerados.TabVisible := True;
      pgcPrincipal.ActivePage   := tbsCARSGerados;

      AbreConsultaResultadoProcesso('R', iCodDocumento);
    end;
  end;

  bbtnConfirmar.Visible := True;
  bbtnCancelar.Visible  := True;
  Separador.Visible     := True;
end;



procedure TFrmEncerraConciliacao.BtCancelaLancamentosClick(Sender: TObject);
begin
  inherited;

  dtsValores.DataSet.Close;

  tbsVerificar.TabVisible := False;

  bbtnConfirmar.Visible   := False;
  bbtnCancelar.Visible    := False;
  Separador.Visible       := False;
  Btnprocessar.Visible    := True;
  BtnDesfazer.Visible     := True;

  pgcPrincipal.ActivePage := tbsContasaPagar;
end;



procedure TFrmEncerraConciliacao.tbsVerificarShow(Sender: TObject);
begin
  inherited;

  if Pos('Caixa', LblTipoProcesso.Caption) > 0 then
  begin
    lblQtdLanc.Caption  := IntToStr(qryValoresCP.RecordCount);
  end
  else
  if Pos('INSS', LblTipoProcesso.Caption) > 0 then
  begin
    lblQtdLanc.Caption  := IntToStr(qryValoresCR.RecordCount);
  end;
end;



procedure TFrmEncerraConciliacao.qryValoresCPOriginalAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dTotalValor := 0;
end;



procedure TFrmEncerraConciliacao.FormCreate(Sender: TObject);
begin
  inherited;
  LeParam('BaseDados', True);
end;

end.