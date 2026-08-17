//*****************************************************************************
//Data	    : 31/05/2007
//Código    : Al_13
//Pendencia : 25509
//Motivo(S) : Implementaçâo de tratamento para identificar o Tipo de Operação
//             que traz as contas transitórias de liquidação para operações de
//             Renda Variável;
//*****************************************************************************
//Data	    : 23/02/2006
//Código    : Al_12
//Pendencia : 21586
//SOL       : 40683
//Motivo(S) : Implementação da rotina para filtrar um único registro de cada vez
//              e na abertura da tela selecionar nenhum registro
//******************************************************************************
// Data     : 02/11/2005
// Código   : AL_11
// Motivo   : Configuração do tipo de dado do parametro da qryCopiaOper (DFM)
//******************************************************************************
// Data     : 26/10/2005
// Código   : AL_10
// Motivo   : Implementação do bloqueio no tipo de movimento(dbcbxTipoMovto)
//******************************************************************************
// Data     : 25/10/2005
// Código   : AL_9
// Motivo   : Ajuste na Natureza da Operação de Direito de Subscrição (DFM)
//******************************************************************************
// Data     : 08/09/2005
// Código   : AL_8
// Motivo   : Implementação do FLGOBRIGAOBS na qry
//******************************************************************************
// Data     : 08/09/2005
// Código   : DBRadioGroup2
// Motivo   : Ajuste no layout
//******************************************************************************
// Data     : 17/08/2005
// Função   : DBRadioGroup2
// Código   :
// Motivo   :RETIRADO O ITEM SUBSCRIÇÃO DE COTAS ESSA NAO INFLUENCIA A CARTEIRA
//******************************************************************************
// Data     : 25/04/2005
// Código   : DBRadioGroup2
// Motivo   : Acerto dos itens de tela da "Atualização de Carteira"
//******************************************************************************
// Data     : 16/12/2004
// Código  : AL_4
// Motivo   : Criado o Botão para Copiar o Registro
//            Habilita a alteração do IDTIPOOPERACAO
//******************************************************************************
// Data     : 09/12/2004
// Código  : AL_3
// Motivo   : Incluído o Parâmetro "Data de Vencimento" na ficha Operações de Direito.
//******************************************************************************
// Data     : 02/12/2004
// Código  : Alt_2
// Motivo   : Habilitando o IDTIPOOPERACAO qdo Inserir
//******************************************************************************
// Data     : 28/09/2004
// Código  : Alt_1
// Motivo   : Inclusão da FLGCONTAINVEST para tratar o q resgate novo e antigo
//******************************************************************************
// Data     : 26/08/2004
// Motivo   : Criado o TIPOMOVTO 'DTD' Desdobramento de Ações na combo dbcbxTipoMovto
//******************************************************************************
// Data     : 14/07/2004
// Motivo   : Retirado o Owner CM. das qrys : qry, upd, QrySubTipo, qryTipoinvest
//            e MontaSelect
//******************************************************************************
// Data     : Alt_1 :  31/05/2004
// Função   : CmeCadastroFind
// Motivo   : alteração na volta do Procurar que estava fazendo o Locate
//            somente pelo IDTIPOOPERACAO e não pelo IDTIPOOPERACAO e IDTIPOINVEST.
//******************************************************************************
// Data     : 14/04/2004
// Função   : DBRadioGroup2
// Código  :
// Motivo   :Implementado Direito de Subscrição e Alteração de Tipo/Incorporação
//           e Permulta
//******************************************************************************
// Data     : 12/04/2004
// Motivo   :Inclusão do novo campo FLGRENTABILIDADE, ajuste no lay-ou da tela,
//           incluindo a liberação do TabSheet para consulta sem clicar no botão
//           de alteração.
//*******************************************************************************
//Autor 	 :      Investimento
//Data	 	 :
//Função	 :      Cadastro dos Tipos de Operação e suas características
//*******************************************************************************

unit FCadTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, Mask, wwdbedit, wwdblook,
  TB97Ctls, TB97Tlbr, DBCtrls, IvDictio, IvMulti, IvEMulti, Wwdotdot,
  Wwdbcomb, ComCtrls, DBCtrls2, CmEventosCadastro, ImgList, Menus;

type
  TfrmCadTipoOper = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBlkTipoInvest: TwwDBLookupCombo;
    DBlkMercado: TwwDBLookupCombo;
    DBEDescTipoOperacao: TwwDBEdit;
    qryTipoinvest: TwwQuery;
    qryMercado: TwwQuery;
    Label3: TLabel;
    dbeIdTipoOper: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    QryCredor: TwwQuery;
    QryCredorIDPESSOA: TFloatField;
    QryCredorRAZAOSOCIAL: TStringField;
    QryAux: TwwQuery;
    QrySubTipo: TwwQuery;
    DsSubTipo: TwwDataSource;
    QrySubTipoIDTIPOINVEST: TFloatField;
    QrySubTipoIDTIPOOPERACAO: TFloatField;
    QrySubTipoEMPRESAPROP: TFloatField;
    QrySubTipoIDFORCLI: TFloatField;
    QryTipoDoc: TwwQuery;
    DbChCorretor: TDBCheckBox;
    DbChOrdMov: TDBCheckBox;
    QryMotBlq: TwwQuery;
    QryMotBlqIDMOTIVOBLOQUEIO: TFloatField;
    QryMotBlqSIGLAMOTBLOQ: TStringField;
    QryMotBlqDESCMOTBLOQ: TStringField;
    PgTabs: TPageControl;
    TbCart: TTabSheet;
    TbCust: TTabSheet;
    DbLkcMotBlq: TwwDBLookupCombo;
    Label7: TLabel;
    DBRadioGroup4: TDBRadioGroup;
    TbFinanc: TTabSheet;
    Label6: TLabel;
    DbCmbRecPag: TwwDBComboBox;
    DbLkcTipoDoc: TwwDBLookupCombo;
    Label5: TLabel;
    DbLkcCredor: TwwDBLookupCombo;
    DbCmbTipoCredor: TwwDBComboBox;
    Label15: TLabel;
    RgTipoCred: TRadioGroup;
    TbTransf: TTabSheet;
    DbRgTransferencias: TDBRadioGroup;
    DbChDireito: TDBCheckBox;
    DbRgOrigem: TDBRadioGroup;
    DbLkc8: TwwDBLookupCombo;
    Lb8: TLabel;
    DbRgDestino: TDBRadioGroup;
    DbLkc9: TwwDBLookupCombo;
    Lb9: TLabel;
    TbOprDir: TTabSheet;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    GrBxSubscricao: TGroupBox;
    DbChkPrazoBolsa: TDBCheckBox;
    DbChkPrazoEmpresa: TDBCheckBox;
    DbAtaDecisao: TDBCheckBox;
    DbChkFormaPagamento: TDBCheckBox;
    GrBxDividendos: TGroupBox;
    DbChkDividendos: TDBCheckBox;
    DbChkInicioPgto: TDBCheckBox;
    DbChkFormaReceb: TDBCheckBox;
    Bevel2: TBevel;
    DbChkQtdeXPerc: TDBCheckBox;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOOPERACAO: TFloatField;
    qryIDMERCADO: TFloatField;
    qryDESCTIPOOPERACAO: TStringField;
    N: TStringField;
    qryTIPOCUSTODIA: TStringField;
    qryVENCIMENTO: TFloatField;
    qryCODTIPDOC: TFloatField;
    qryFLGGERACONTAB: TFloatField;
    qryFLGGERACAPCAR: TFloatField;
    qryRECPAG: TStringField;
    qryTIPCREDOR: TStringField;
    qryFLGGERACAF: TFloatField;
    qryFLGTRANSF: TStringField;
    qryFLGCORRET: TStringField;
    qryFLGORDMOVINV: TStringField;
    qryIDMOTIVOBLOQUEIO: TFloatField;
    qryFLGOPDIREITO: TStringField;
    qryFLGAGE: TStringField;
    qryFLGDATAEX: TStringField;
    qryFLGDATACOM: TStringField;
    qryFLGINVORIGEM: TStringField;
    qryFLGPERC: TStringField;
    qryFLGPARIDADE: TStringField;
    qryFLGPRZBOLSA: TStringField;
    qryFLGPRZEMP: TStringField;
    qryFLGATADEC: TStringField;
    qryFLGFORMAPAGREC: TStringField;
    qryFLGDIVACAO: TStringField;
    qryFLGINIPAG: TStringField;
    qryFLGJUROS: TStringField;
    qryMOTBLOQCARTORIG: TFloatField;
    qryMOTBLOQCARTDEST: TFloatField;
    qryTIPSALDOCARTORIG: TStringField;
    qryTIPSALDOCARTDEST: TStringField;
    GroupBox3: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    dbrImposto: TDBRadioGroup;
    qryFLGTRATAIR: TStringField;
    Label9: TLabel;
    dbeSigla: TDBEdit2;
    qrySIGLATIPOOPER: TStringField;
    DBCkLimPgto: TDBCheckBox;
    DBCkPuSub: TDBCheckBox;
    DbLkcParidade: TDBCheckBox;
    qryParamInvest: TwwQuery;
    qryFLGISENTOIR: TStringField;
    qryFLGGRAVAIRLITIGIO: TStringField;
    DbLkIsentoIR: TDBCheckBox;
    DbLkGeraIRLitigio: TDBCheckBox;
    qryFLGOPGERENC: TStringField;
    dbchkOpGerenc: TDBCheckBox;
    dbckStaAtivo: TDBCheckBox;
    qrySTAATIVO: TStringField;
    qryTIPOMOVTO: TStringField;
    lblTipoMovto: TLabel;
    dbcbxTipoMovto: TwwDBComboBox;
    dbckAfetaRent: TDBCheckBox;
    qryFLGRENTABILIDADE: TStringField;
    DBRadioGroup2: TDBRadioGroup;
    Label8: TLabel;
    qryFLGCONTAINVEST: TFloatField;
    DbCmbTipoResgate: TwwDBComboBox;
    qryFLGDATAVENCIMENTO: TStringField;
    DBCkDataVenc: TDBCheckBox;
    sbtnCopiar: TToolbarButton97;
    qryCopiaOper: TwwQuery;
    //AL_8
    dbckObrigaOBS: TDBCheckBox;
    qryFLGOBRIGAOBS: TStringField;
    //Al_13
    lblAjusteCpVd: TLabel;
    dblkAjusteCpVd: TwwDBLookupCombo;
    qryTipoOperCPVD: TwwQuery;
    qryTipoOperCPVDIDTIPOINVEST: TFloatField;
    qryTipoOperCPVDIDTIPOOPERACAO: TFloatField;
    qryTipoOperCPVDIDMERCADO: TFloatField;
    qryTipoOperCPVDCODTIPDOC: TFloatField;
    qryTipoOperCPVDDESCTIPOOPERACAO: TStringField;
    qryTipoOperCPVDNATUREZAOPERACAO: TStringField;
    qryTipoOperCPVDTIPOCUSTODIA: TStringField;
    qryTipoOperCPVDVENCIMENTO: TFloatField;
    qryTipoOperCPVDFLGGERACONTAB: TFloatField;
    qryTipoOperCPVDFLGGERACAPCAR: TFloatField;
    qryTipoOperCPVDRECPAG: TStringField;
    qryTipoOperCPVDTIPCREDOR: TStringField;
    qryTipoOperCPVDFLGGERACAF: TFloatField;
    qryTipoOperCPVDFLGTRANSF: TStringField;
    qryTipoOperCPVDFLGCORRET: TStringField;
    qryTipoOperCPVDTRGDTINCLUSAO: TDateTimeField;
    qryTipoOperCPVDTRGUSERINCLUSAO: TStringField;
    qryTipoOperCPVDFLGORDMOVINV: TStringField;
    qryTipoOperCPVDIDMOTIVOBLOQUEIO: TFloatField;
    qryTipoOperCPVDFLGOPDIREITO: TStringField;
    qryTipoOperCPVDFLGAGE: TStringField;
    qryTipoOperCPVDFLGDATAEX: TStringField;
    qryTipoOperCPVDFLGDATACOM: TStringField;
    qryTipoOperCPVDFLGINVORIGEM: TStringField;
    qryTipoOperCPVDFLGPERC: TStringField;
    qryTipoOperCPVDFLGPARIDADE: TStringField;
    qryTipoOperCPVDFLGPRZBOLSA: TStringField;
    qryTipoOperCPVDFLGPRZEMP: TStringField;
    qryTipoOperCPVDFLGATADEC: TStringField;
    qryTipoOperCPVDFLGFORMAPAGREC: TStringField;
    qryTipoOperCPVDFLGDIVACAO: TStringField;
    qryTipoOperCPVDFLGINIPAG: TStringField;
    qryTipoOperCPVDFLGJUROS: TStringField;
    qryTipoOperCPVDMOTBLOQCARTORIG: TFloatField;
    qryTipoOperCPVDMOTBLOQCARTDEST: TFloatField;
    qryTipoOperCPVDTIPSALDOCARTORIG: TStringField;
    qryTipoOperCPVDTIPSALDOCARTDEST: TStringField;
    qryTipoOperCPVDFLGTRATAIR: TStringField;
    qryTipoOperCPVDSIGLATIPOOPER: TStringField;
    qryTipoOperCPVDFLGISENTOIR: TStringField;
    qryTipoOperCPVDFLGGRAVAIRLITIGIO: TStringField;
    qryTipoOperCPVDFLGOPGERENC: TStringField;
    qryTipoOperCPVDTIPOMOVTO: TStringField;
    qryTipoOperCPVDSTAATIVO: TStringField;
    qryTipoOperCPVDFLGRENTABILIDADE: TStringField;
    qryTipoOperCPVDFLGCONTAINVEST: TFloatField;
    qryTipoOperCPVDFLGMOVCOTA: TStringField;
    qryTipoOperCPVDFLGCOTARECDES: TStringField;
    qryTipoOperCPVDFLGDATAVENCIMENTO: TStringField;
    qryTipoOperCPVDFLGOBRIGAOBS: TStringField;
    qryTipoOperCPVDIDTIPOOPERCPVD: TFloatField;
    qryIDTIPOOPERCPVD: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBlkTipoInvestChange(Sender: TObject);
    procedure RgTipoCredClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure sbtnInserirClick(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure DbCmbRecPagChange(Sender: TObject);
    procedure DBRadioGroup4Change(Sender: TObject);
    procedure DbRgOrigemChange(Sender: TObject);
    procedure DbRgDestinoChange(Sender: TObject);
    procedure DbRgTransferenciasChange(Sender: TObject);
    procedure DbChDireitoClick(Sender: TObject);
    procedure DbChkFormaPagamentoClick(Sender: TObject);
    procedure DbChkFormaRecebClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure PgTabsChange(Sender: TObject);

    procedure FiltraTipoDoc;
    procedure TrataCheckBox;
    procedure TrataDivSubs;
    procedure DBlkTipoInvestCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    //Al_13
    procedure DBlkTipoInvestExit(Sender: TObject);
  private
    { Private declarations }
    function HabTabSheets(bAcao: Boolean): Boolean;
    function Sel(iTipoInvest, iTipoOper: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmCadTipoOper: TfrmCadTipoOper;

implementation

uses
 UMensErro , UDatabase, USistema, UBibliotecaInvest, UOperComum, DBaseDados;
{$R *.DFM}

function TfrmCadTipoOper.Sel(iTipoInvest, iTipoOper: Integer): Boolean;
begin
   OperComum.LimpaParametros(qry);
   qry.ParamByName('IDTIPOINVEST').Asinteger := iTipoInvest;
   qry.ParamByName('IDTIPOOPERACAO').Asinteger := iTipoOper;
   qry.Open;

   //Al_13
   dblkAjusteCpVd.Text := '';
   dblkAjusteCpVd.Enabled := False;
   qryTipoOperCPVD.Close;
   if iTipoInvest = 2 then
   begin
      dblkAjusteCpVd.Enabled := True;
      OperComum.LimpaParametros(qryTipoOperCPVD);
      qryTipoOperCPVD.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest;
      qryTipoOperCPVD.Open;
   end;
end;

procedure FocaControleNoPageControl(PgCtrl : TPageControl; Ctrl : TWinControl);
begin
  if Ctrl.Parent is TTabSheet then
     PgCtrl.ActivePage := TTabSheet(Ctrl.Parent);
  if Ctrl.CanFocus Then
     Ctrl.SetFocus;
end;

procedure TfrmCadTipoOper.CmeCadastroCancel(Sender: TObject);
begin
  dblkTipoInvest.enabled := True;
  dblkMercado.enabled    := True;
  inherited;
end;

procedure TfrmCadTipoOper.CmeCadastroInsert(Sender: TObject);
var
  sSql : string ;
begin
  inherited;
end;

procedure TfrmCadTipoOper.CmeCadastroFind(Sender: TObject);
var
  sSql : string ;
begin
   if MontaSelect.RetornouValor then
   begin
      // Alt_1
      // AL_12
      Sel(StrToInt(MontaSelect.ValoresChave[1]), StrToInt(MontaSelect.ValoresChave[0]));
      DbLkcMotBlq.RefreshDisplay;
   end;
   inherited;
   QryMercado.Close;
   QryMercado.ParamByName('P_IDTIPOINVEST').AsInteger := qryIDTIPOINVEST.AsInteger;
   QryMercado.Open;
end;

procedure TfrmCadTipoOper.bbtnConfirmarClick(Sender: TObject);
Var
  wTipoAtu:String;
  wIdTipoInvest, wIdTipoOperacao, wIdEmpresa: Integer;
  wIdForCli:String;
begin
 if Trim(DBlkTipoInvest.Text) = '' then begin
   MsgDlg('Tipo de Investimento deve ser informado. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBlkTipoInvest);
   exit;
 end else if (Trim(DBlkMercado.Text) = '') And
 ((QryTipoinvest['IDTIPOINVEST'] = 2) or (QryTipoinvest['IDTIPOINVEST'] = 8)) then
 begin
   MsgDlg('Mercado deve ser informado. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBlkMercado);
   exit;
 end else if Trim(DBEDescTipoOperacao.Text) = '' then begin
   MsgDlg('Tipo de Operação deve ser informado. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBEDescTipoOperacao);
   exit;
 end else if (DBRadioGroup4.Itemindex = -1) And
   (Qry.FieldByName('IDTIPOINVEST').AsInteger In [1,2]) then begin
   MsgDlg('Informe dados da Custódia. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBRadioGroup4);
   exit;
 end else if (DbLkcTipoDoc.text = '') And (DBCheckBox2.Checked = True) then begin
   MsgDlg('Informe o Tipo de Documento. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DbLkcTipoDoc);
   exit;
 end else if DbRgTransferencias.Itemindex = -1 then begin
   MsgDlg('Tipo de Transfêrencia deve ser Preenchida. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBRadioGroup2);
   exit;
 end else if DBRadioGroup2.Itemindex = -1 then begin
   MsgDlg('Informe dados da Carteria. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBRadioGroup2);
   exit;
 end else if DBRadioGroup4.Itemindex = -1 then begin
   MsgDlg('Tipo de Custodia deve ser Preenchida. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DBRadioGroup2);
   exit;
 end else if (DBRadioGroup4.Itemindex > 1) and (DBRadioGroup4.Itemindex < 5) And (DbLkcMotBlq.text = '') then begin
   MsgDlg('Motivo de Bloqueio/DesBloqueio deve ser informado. ','Erro',mtError,[mbOK],0);
   FocaControleNoPageControl(pgTabs, DbLkcMotBlq);
   exit;
 end else if ds.DataSet.State in [dsInsert] then begin
   if qry.FieldByName('IDTIPOOPERACAO').AsInteger = 0 then
     qry.FieldByName('IDTIPOOPERACAO').AsInteger := LeUltRegistro(nil,'TIPOOPERACAO');
 end else if dbcbxTipoMovto.Text = '' then
 begin
   MsgDlg('Tipo de Movimento não informado. ','Atenção',mtWarning,[mbOK],0);
   if dbcbxTipoMovto.CanFocus then
      dbcbxTipoMovto.SetFocus;
   exit;
 end;

// Acerta RecPag
 If (Not DBCheckBox2.Checked) And (DbCmbRecPag.Text = '') And (Qry.State in [DsInsert, DsEdit]) Then Begin
   Qry.FieldByName('RECPAG').AsString := 'N';
 End;

// Guarda Dados  Credor
  wIdTipoInvest   :=Qry.FieldByName('IDTIPOINVEST').AsInteger;
  wIdTipoOperacao :=Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
  wIdEmpresa      :=Sistema.IdEmpresa;
  If DbLkcCredor.Text <> '' Then
    wIdForCli:=QryCredor.FieldByName('IDPESSOA').AsString
  Else
    wIdForCli:='';

  If (Qry.State in [DsInsert]) Then Begin
    wTipoAtu:='I';
  End Else If (Qry.State in [DsEdit]) Then Begin
    wTipoAtu:='A';
  End;

  If (DbRgTransferencias.ItemIndex = 0) Or (DbRgTransferencias.ItemIndex = 1) Then
  Begin
     If DbRgOrigem.ItemIndex < 0 Then
     Begin
        MsgDlg('Tipo de Saldo da Origem deve ser Preenchida. ','Erro',mtError,[mbOK],0);
        FocaControleNoPageControl(pgTabs, DbRgOrigem);
        exit;
     End;
  End;

  If (DbRgTransferencias.ItemIndex = 0) Or (DbRgTransferencias.ItemIndex = 1) Then
  Begin
     If DbRgDestino.ItemIndex < 0 Then
     Begin
        MsgDlg('Tipo de Saldo do Destino deve ser Preenchida. ','Erro',mtError,[mbOK],0);
        FocaControleNoPageControl(pgTabs, DbRgOrigem);
        exit;
     End;
  End;

  //Alt_1
  If DbCmbTipoResgate.ItemIndex = -1 Then
     Qry.FieldByName('FLGCONTAINVEST').Clear;

// Heranca
  Try

    inherited;
// Atualiza Credor
    If wTipoAtu = 'I' Then Begin
      If Trim(wIdForCli) <> '' Then
        ExecutaQuery(QryAux,
          'INSERT INTO FORCLIXTIPOPER VALUES ('''+
           IntToStr(wIdTipoInvest) +''', '''+IntToStr(wIdTipoOperacao) +''', '''+
           IntToStr(wIdEmpresa)+''', '''+wIdForCli+''')')
      Else
        ExecutaQuery(QryAux,
          'INSERT INTO FORCLIXTIPOPER (IDTIPOINVEST,IDTIPOOPERACAO,EMPRESAPROP) VALUES ('''+
           IntToStr(wIdTipoInvest) +''', '''+IntToStr(wIdTipoOperacao) +''', '''+
           IntToStr(wIdEmpresa)+''')');
    End Else Begin
      ExecutaQuery(QryAux,
        'UPDATE FORCLIXTIPOPER SET IDFORCLI = '''+wIdForCli+''' WHERE '+
        '(IDTIPOINVEST   = '''+IntToStr(wIdTipoInvest)  +''') AND '+
        '(IDTIPOOPERACAO = '''+IntToStr(wIdTipoOperacao)+''') AND '+
        '(EMPRESAPROP    = '''+IntToStr(wIdEmpresa)     +''') ');
// Testa se Alteração foi feita, Caso não Inclui Registro
      If (QryAux.RowsAffected = -1) Or (QryAux.RowsAffected = 0) Then Begin
          If Trim(wIdForCli) <> '' Then
             ExecutaQuery(QryAux,
               'INSERT INTO FORCLIXTIPOPER VALUES ('''+
                IntToStr(wIdTipoInvest) +''', '''+IntToStr(wIdTipoOperacao) +''', '''+
                IntToStr(wIdEmpresa)+''', '''+wIdForCli+''')')
          Else
             ExecutaQuery(QryAux,
               'INSERT INTO FORCLIXTIPOPER (IDTIPOINVEST,IDTIPOOPERACAO,EMPRESAPROP) VALUES ('''+
                IntToStr(wIdTipoInvest) +''', '''+IntToStr(wIdTipoOperacao) +''', '''+
                IntToStr(wIdEmpresa)+''')');
      End;
   End;
 Except
   Raise;
 End;
// Ambiente
  dblkTipoInvest.enabled := True;
  dblkMercado.enabled    := True;
  TrataCheckBox;
  HabTabSheets(False);
  //Alt_2 Ini
  dbeIdTipoOper.Enabled := False;
  //Alt_2 Fim
end;

procedure TfrmCadTipoOper.FormShow(Sender: TObject);
begin
  inherited;
  DbCmbTipoResgate.Text := ' ';
  QryTipoinvest.Open;
  QryMercado.ParamByName('P_IDTIPOINVEST').AsInteger := qryIDTIPOINVEST.AsInteger;
  QryMercado.Open;
  QryTipoDoc.Open;
  QryMotBlq.Open;
  // AL_12
  Sel(-1,-1);
  QryParamInvest.Open;
  If qry.FieldByName('FLGOPDIREITO').AsString = '' Then
     DbChDireito.Checked := False;

  Label7.Visible      :=False;
  DbLkcMotBlq.Visible :=False;
  PgTabs.ActivePage   :=TbCart;
  TrataDivSubs;
  //AL_8
  TrataCheckBox;
  HabTabSheets(False);
end;

procedure TfrmCadTipoOper.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  Qry.Close;
  qryTipoinvest.Close;
  qryMercado.Close;
  QryCredor.Close;
  QrySubTipo.Close;
  QryTipoDoc.Close;
  QryMotBlq.Close;
  QryParamInvest.Close;
  //Al_13
  qryTipoOperCPVD.Close;
end;

procedure TfrmCadTipoOper.DBlkTipoInvestChange(Sender: TObject);
begin
  inherited;
// Caso Tipo de Investimento = 2 (Renda Variavel) Libera o Combo Mercado
  If (QryTipoinvest['IDTIPOINVEST'] = 2) or (QryTipoinvest['IDTIPOINVEST'] = 8) Then
  Begin
    DBlkMercado.Enabled := True;
  End Else Begin
    DBlkMercado.Text    := '';
    DBlkMercado.Enabled := False;
  End;
end;

procedure TfrmCadTipoOper.RgTipoCredClick(Sender: TObject);
begin
  inherited;
  Label15.Visible:=True;
  If RgTipoCred.ItemIndex = 0 Then Begin
    Label15.Caption        :='Tipo Credor';
    DbLkcCredor.Visible    :=False;
    DbCmbTipoCredor.Visible:=True;
// Exclui Dados do Credor Pessoa
    If Qry.State In ([DsInsert, DsEdit]) Then Begin
      ExecutarQuery(QryAux,
        'DELETE FROM FORCLIXTIPOPER WHERE  '+
        'IDTIPOINVEST  = '''+Qry.FieldByName('IDTIPOINVEST').AsString   +'''AND '+
        'IDTIPOOPERACAO= '''+Qry.FieldByName('IDTIPOOPERACAO').AsString +'''AND '+
        'EMPRESAPROP   = '''+IntToStr(Sistema.IdEmpresa)+'''');
    End;

  End Else Begin
    Label15.Caption := 'Credor';
    QryCredor.Open;
    DbCmbTipoCredor.Visible:=False;
    DbLkcCredor.Visible    :=True;
    If Qry.State In ([DsInsert, DsEdit]) Then
      Qry.FieldByName('TIPCREDOR').Clear;
  End;
end;

procedure TfrmCadTipoOper.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If Not sbtnInserir.Down Then
    If Qry.FieldByName('TIPCREDOR').AsString <> '' Then Begin
      RgTipoCred.ItemIndex := 0;
    End Else Begin
      RgTipoCred.ItemIndex := 1;
    End;

// Abre Query de SubTipo
  If Not Qry.IsEmpty Then Begin
    QrySubTipo.Close;
    QrySubTipo.ParamByName('IDTIPOINVEST').AsInteger  :=
      Qry.FieldByName('IDTIPOINVEST').AsInteger;
    QrySubTipo.ParamByName('IDTIPOOPERACAO').AsInteger:=
      Qry.FieldByName('IDTIPOOPERACAO').AsInteger;
    QrySubTipo.ParamByName('EMPRESAPROP').AsInteger   :=
      Sistema.IdEmpresa;
    QrySubTipo.Open;
    If Not Qry.IsEmpty Then Begin
      DbLkcCredor.Value:=QrySubTipo.FieldByName('IDFORCLI').AsString;
    End Else Begin
      DbLkcCredor.Clear;
    End;
  End;
end;

procedure TfrmCadTipoOper.sbtnInserirClick(Sender: TObject);
begin
  RgTipoCred.ItemIndex:=0;
  inherited;
// Preenche Flags
  Qry.FieldByName('FLGGERACONTAB').AsInteger   := 0;
  Qry.FieldByName('FLGGERACAPCAR').AsInteger   := 0;
  Qry.FieldByName('FLGCORRET').AsString        := 'S';
  Qry.FieldByName('FLGORDMOVINV').AsString     := 'N';
  Qry.FieldByName('FLGTRANSF').AsString        := 'N';
  Qry.FieldByName('FLGOPDIREITO').AsString     := 'N';
  Qry.FieldByName('STAATIVO').AsString         := 'S';
  Qry.FieldByName('FLGRENTABILIDADE').AsString := 'S';
  //AL_8
  qry.FieldByName('FLGOBRIGAOBS').AsString     := 'N';

  Label7.Visible      :=False;
  DbLkcMotBlq.Visible :=False;
  PgTabs.ActivePage   :=TbCart;
  DbChDireito.Checked := False;
  TrataCheckBox;
  HabTabSheets(True);
  //Alt_2 Ini
  dbeIdTipoOper.Enabled := True;
  //Alt_2 Fim
end;

procedure TfrmCadTipoOper.DBCheckBox2Click(Sender: TObject);
begin
  inherited;
  DbLkcTipoDoc.Visible:= DBCheckBox2.Checked;
  Label5.Visible      := DBCheckBox2.Checked;
end;

procedure TfrmCadTipoOper.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  If Qry.IsEmpty Then
    DbLkcCredor.Text:='';
end;

procedure TfrmCadTipoOper.DbCmbRecPagChange(Sender: TObject);
begin
  inherited;
  FiltraTipoDoc;
end;

procedure TfrmCadTipoOper.DBRadioGroup4Change(Sender: TObject);
begin
  inherited;
  Label7.Visible      := ((DBRadioGroup4.Itemindex > 1) and (DBRadioGroup4.Itemindex < 5));
  DbLkcMotBlq.Visible := ((DBRadioGroup4.Itemindex > 1) and (DBRadioGroup4.Itemindex < 5));
  DbLkcMotBlq.Text    := '';
end;

procedure TfrmCadTipoOper.DbRgOrigemChange(Sender: TObject);
begin
  inherited;
// Mostra ou nao o Motivo de Bloqueio
  If DbRgOrigem.ItemIndex <= 0 Then Begin
   Lb8.Visible    :=False;
   DbLkc8.Visible :=False;
   If Qry.State In [DsInsert, DsEdit] Then
     Qry.FieldByName('MOTBLOQCARTORIG').Clear;
   DbLkc8.Clear;
  End Else Begin
   Lb8.Visible    :=True;
   DbLkc8.Visible :=True;
  End;
end;

procedure TfrmCadTipoOper.DbRgDestinoChange(Sender: TObject);
begin
  inherited;
// Mostra ou nao o Motivo de Bloqueio
  If DbRgDestino.ItemIndex <= 0 Then Begin
   Lb9.Visible    :=False;
   DbLkc9.Visible :=False;
   If Qry.State In [DsInsert, DsEdit] Then
     Qry.FieldByName('MOTBLOQCARTDEST').Clear;
   DbLkc9.Clear;
  End Else Begin
   Lb9.Visible    :=True;
   DbLkc9.Visible :=True;
  End;

end;

procedure TfrmCadTipoOper.DbRgTransferenciasChange(Sender: TObject);
begin
  inherited;
// Mostra ou nao o Tipos de Transferencias
  If DbRgTransferencias.ItemIndex = 2 Then Begin
   DbRgOrigem.Visible  :=False;
   DbRgDestino.Visible :=False;
   DbLkc8.Visible      :=False;
   Lb8.Visible         :=False;
   DbLkc9.Visible      :=False;
   Lb9.Visible         :=False;
  End Else Begin
   DbRgOrigem.Visible  :=True;
   DbRgDestino.Visible :=True;
   If DbRgOrigem.ItemIndex = 0 Then
   Begin
      DbLkc8.Visible      :=False;
      Lb8.Visible         :=False;
   End
   Else If DbRgOrigem.ItemIndex = 1 Then
   Begin
      DbLkc8.Visible      :=True;
      Lb8.Visible         :=True;
   End;
   If DbRgDestino.ItemIndex = 0 Then
   Begin
      DbLkc9.Visible      :=False;
      Lb9.Visible         :=False;
   End
   Else If DbRgDestino.ItemIndex = 1 Then
   Begin
      DbLkc9.Visible      :=True;
      Lb9.Visible         :=True;
   End;
  End;
end;

procedure TfrmCadTipoOper.DbChDireitoClick(Sender: TObject);
begin
  inherited;
  If DbChDireito.Checked = True Then Begin
    TbOprDir.TabVisible := True;
    If Qry.State In [DsInsert, DsEdit] Then Begin
      Qry.FieldByName('FLGAGE').AsString     :='S';
      Qry.FieldByName('FLGDATAEX').AsString  :='S';
      Qry.FieldByName('FLGDATACOM').AsString :='S';
    End;
    TrataCheckBox;
  End Else Begin
    TbOprDir.TabVisible := False;
    PgTabs.ActivePage   := TbCart;
  End;

end;

procedure TfrmCadTipoOper.DbChkFormaPagamentoClick(Sender: TObject);
begin
  inherited;
  If DbChkFormaPagamento.Checked = True Then Begin
    DbChkFormaReceb.Enabled :=False;
  End Else Begin
    DbChkFormaReceb.Enabled :=True;
  End;
end;

procedure TfrmCadTipoOper.DbChkFormaRecebClick(Sender: TObject);
begin
  inherited;
  If DbChkFormaReceb.Checked = True Then Begin
    DbChkFormaPagamento.Enabled :=False;
  End Else Begin
    DbChkFormaPagamento.Enabled :=True;
  End;
end;

procedure TfrmCadTipoOper.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
   TrataCheckBox;
   TrataDivSubs;
   HabTabSheets(False);
end;

procedure TfrmCadTipoOper.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   TrataCheckBox;
   TrataDivSubs;
   HabTabSheets(False);
end;

procedure TfrmCadTipoOper.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   TrataCheckBox;
   TrataDivSubs;
   HabTabSheets(True);
   //AL_3
   dbeIdTipoOper.Enabled := True;
end;

procedure TfrmCadTipoOper.PgTabsChange(Sender: TObject);
begin
  inherited;
  If PgTabs.ActivePage = TbOprDir Then
     TrataCheckBox;
end;

procedure TfrmCadTipoOper.FiltraTipoDoc;
var
  sPagRecNao, sRecPag, sDebCre : string;
begin
   if (DbCmbRecPag.GetComboValue(DbCmbRecPag.Text) <> '') then begin

      sPagRecNao := DbCmbRecPag.GetComboValue(DbCmbRecPag.Text);

      case sPagRecNao[1] of
         'D': // desconto - diminui CAR
         begin
            sRecPag := 'R';
            sDebcre := 'C';
         end;
         'P': // pagamento - aumenta CAP
         begin
            sRecPag := 'P';
            sDebcre := 'C';
         end;
         'R': // recebimento - aumenta CAR
         begin
            sRecPag := 'R';
            sDebcre := 'D';
         end;
         'U': // deduçao - diminui CAP
         begin
            sRecPag := 'P';
            sDebcre := 'D';
         end;
      end;

      with QryTipoDoc do begin
         Close;
         if not(Prepared) then Prepare;
         ParamByName('RECPAG').asString := sRecPag;
         ParamByName('DEBCRE').asString := sDebCre;
         Open;
      end;

   end;
end;

Procedure TfrmCadTipoOper.TrataCheckBox;
Begin
  If qry.FieldByName('FLGOPDIREITO').AsString = '' Then
     DbChDireito.Checked := False;
  If qry.FieldByName('FLGPRZBOLSA').AsString <> 'S' Then
     DbChkPrazoBolsa.Checked := False;
  If qry.FieldByName('FLGPRZEMP').AsString <> 'S' Then
     DbChkPrazoEmpresa.Checked := False;
  If qry.FieldByName('FLGDATAVENCIMENTO').AsString <> 'S' Then
     DBCkDataVenc.Checked := False;
  If qry.FieldByName('FLGATADEC').AsString <> 'S' Then
     DbAtaDecisao.Checked        := False;
  If qry.FieldByName('FLGFORMAPAGREC').AsString <> 'S' Then
     DbChkFormaPagamento.Checked := False;
  If qry.FieldByName('FLGDIVACAO').AsString <> 'S' Then
     DbChkDividendos.Checked     := False;
  If qry.FieldByName('FLGDIVACAO').AsString <> 'S' Then
     DBCkPuSub.Checked           := False;
  If qry.FieldByName('FLGINIPAG').AsString <> 'S' Then
     DbChkInicioPgto.Checked     := False;
  If qry.FieldByName('FLGINIPAG').AsString <> 'S' Then
     DBCkLimPgto.Checked         := False;
  If qry.FieldByName('FLGFORMAPAGREC').AsString <> 'S' Then
     DbChkFormaReceb.Checked     := False;
  If qry.FieldByName('FLGPARIDADE').AsString <> 'S' Then
     DbLkcParidade.Checked       := False;
  If qry.FieldByName('FLGISENTOIR').AsString <> 'S' Then
     DbLkIsentoIR.Checked        := False;
  If qry.FieldByName('FLGGRAVAIRLITIGIO').AsString <> 'S' Then
     DbLkGeraIRLitigio.Checked   := False;
  If qry.FieldByName('FLGPERC').AsString <> 'S' Then
     DbChkQtdeXPerc.Checked      := False;
  If qry.FieldByName('FLGCORRET').AsString <> 'S' Then
     DbChCorretor.Checked      := False;
  If qry.FieldByName('FLGORDMOVINV').AsString <> 'S' Then
     DbChOrdMov.Checked      := False;
  If qry.FieldByName('FLGOPGERENC').AsString <> 'S' Then
     dbchkOpGerenc.Checked      := False;
  If qry.FieldByName('STAATIVO').AsString <> 'S' Then
     dbckStaAtivo.Checked      := False;
  //AL_8
  If qry.FieldByName('FLGOBRIGAOBS').AsString <> 'S' Then
     dbckObrigaOBS.Checked      := False;

End;

procedure TfrmCadTipoOper.TrataDivSubs;
begin
   If DbChDireito.Checked Then
   Begin
      TbOprDir.TabVisible := True;
      If qryParamInvest.FieldByName('IDTIPOOPERDIRSUB').AsInteger =
                    qry.FieldByName('IDTIPOOPERACAO').AsInteger Then
      Begin
         DbChkDividendos.Checked := False;
         DBCkPuSub.Checked       := True;
      End;

      If (qryParamInvest.FieldByName('IDTIPOOPERDIRDIV').AsInteger =
                     qry.FieldByName('IDTIPOOPERACAO').AsInteger) Or
         (qryParamInvest.FieldByName('IDTIPOOPERDIRJUR').AsInteger =
                     qry.FieldByName('IDTIPOOPERACAO').AsInteger) Then
      Begin
         DbChkDividendos.Checked := True;
         DBCkPuSub.Checked       := False;
      End;
   End
   Else
     TbOprDir.TabVisible := False;
end;

procedure TfrmCadTipoOper.DBlkTipoInvestCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if DBlkTipoInvest.LookupValue <> '' then
     begin
       QryMercado.Close;
       QryMercado.ParamByName('P_IDTIPOINVEST').AsInteger := StrToInt(DBlkTipoInvest.LookupValue);
       QryMercado.Open;
     end;

end;

procedure TfrmCadTipoOper.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   //Enter - Troca de Campo
   if Key = VK_Return then
      SelectNext(ActiveControl,True,True)
end;

function TfrmCadTipoOper.HabTabSheets(bAcao: Boolean): Boolean;
var i: Byte;
    bHab: Boolean;
begin
  pnlFundo.Enabled := True;
  GroupBox1.Enabled := bAcao;
  for i := 0 to PgTabs.ControlCount -1 do
  begin
     if PgTabs.Controls[I] is TTabSheet then
        TTabSheet(PgTabs.Controls[I]).Enabled := bAcao;
  end;

end;

procedure TfrmCadTipoOper.dsStateChange(Sender: TObject);
begin
  inherited;
  sbtnCopiar.Enabled := ((ds.State = dsBrowse) and (not ds.DataSet.IsEmpty));
end;

procedure TfrmCadTipoOper.sbtnCopiarClick(Sender: TObject);
var i, iTipoOperacao, iTipoInvest: Integer;
begin
   inherited;
   try
      try
         // Abre Transasção
         if not dtmBaseDados.dbBaseDados.InTransaction then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Capta Novo ID de Operação que depois poderá ser alterado
         iTipoOperacao := LeUltRegistro(nil,'TIPOOPERACAO');
         iTipoInvest := qryIDTIPOINVEST.AsInteger;

         // Fecha e prepara a query para Insert
         OperComum.LimpaParametros(qryCopiaOper, True);
         // Faz Loop nos fields da query origem
         for i := 0 to qry.FieldCount -1 do
         begin
            // Joga Valores nos parametros identificando-os pelo nome do Field Origem
            if qry.Fields[I].FieldName = 'IDTIPOOPERACAO' then
               qryCopiaOper.Params.FindParam(qry.Fields[I].FieldName).Value := iTipoOperacao
            else
            begin
               if qryCopiaOper.Params.FindParam(qry.Fields[I].FieldName) <> nil then
                  qryCopiaOper.Params.FindParam(qry.Fields[I].FieldName).Value := qry.Fields[I].Value;
            end;
         end;
         // Executa e Comita
         qryCopiaOper.ExecSQL;
         DtmBaseDados.dbBaseDados.Commit;

         // AL_12 - Posiciona no novo registro
         Sel(iTipoInvest,iTipoOperacao);

      except
         DtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Não foi possível copiar esta operação.','Erro', mtError,[mbOK],0);
      end;
   finally
      sbtnCopiar.Down := False;
   end;
end;

//Al_13
procedure TfrmCadTipoOper.DBlkTipoInvestExit(Sender: TObject);
begin
  inherited;
   //Al_13
   dblkAjusteCpVd.Text := '';
   dblkAjusteCpVd.Enabled := False;
   qryTipoOperCPVD.Close;
   if qryTipoinvest.FieldByName('IDTIPOINVEST').AsInteger = 2 then
   begin
      dblkAjusteCpVd.Enabled := True;
      OperComum.LimpaParametros(qryTipoOperCPVD);
      qryTipoOperCPVD.ParamByName('IDTIPOINVEST').AsInteger := qryTipoinvest.FieldByName('IDTIPOINVEST').AsInteger;
      qryTipoOperCPVD.Open;
      qryTipoOperCPVD.First;
   end;
end;

end.
