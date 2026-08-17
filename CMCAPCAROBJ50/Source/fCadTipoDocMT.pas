// Andre Tavares - pendência 16330 - 30/04/2004 - Criação da coluna FLGIMPRIMEAP
{
Autor(a)    : Fernando Xavier
Data        : 13/04/2012
Pendência   : SOL 160624  KINTANA 1351068
Descricao   : Entrada Manual de Contribuições
-------------------------------------------------------------------------------------------------
}
Unit fCadTipoDocMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlTipodocrecpag, uCMTypes, wwdblook, CMDBLookupCombo, uctrlportadorforma, uCtrlPadroes;

Type
  TfrmCadTipoDocMT = Class(TFrmCadastroMT)
    Label1: TLabel;
    dbedDescricao: TDBEdit;
    Panel1: TPanel;
    sbtnAcrescimo: TSpeedButton;
    sbtnDecrescimo: TSpeedButton;
    RgEmgParcela: TDBRadioGroup;
    dbeCodReduzido: TDBEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    CkbGeraNumDoc: TDBCheckBox;
    CkbDocFiscal: TDBCheckBox;
    Bevel1: TBevel;
    DBCheckBox1: TDBCheckBox;
    DBchkFlgNaoGeraRAD: TDBCheckBox;
    CdsParamGlobal: TCMClientDataSet;
    CdsModelosCnab: TCMClientDataSet;
    DBCheckBox2: TDBCheckBox;
    
    Procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure sbtnAcrescimoClick(Sender: TObject);
    Procedure sbtnDecrescimoClick(Sender: TObject);
    Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;
      Var Accept: Boolean);
    Procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    CtrlTipodocrecpag: TCtrlTipodocrecpag;
  public
    { Public declarations }
  End;

Var
  frmCadTipoDocMT: TfrmCadTipoDocMT;

Implementation

Uses uMensErro, DBaseDados, uCtrlParamIntegra, uDataBase, uSistema;

{$R *.DFM}

Procedure TfrmCadTipoDocMT.FormCreate(Sender: TObject);
Begin

  // início - andre tavares - pendencia 19543 - 05/08/2005
  if sistema.idmodulo = 4 then
    DBCheckBox1.Caption    := 'Imprime GR';
  // fim - andre tavares - pendencia 19543 - 05/08/2005

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  If ParamIntegra.RecPag = 'P' Then
  Begin
    HelpContext           := 30054;
    bbtnAjuda.HelpContext := 30054;
  End
  Else
  Begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40073;
    bbtnAjuda.HelpContext := 40073;
  End;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  CtrlTipodocrecpag := TCtrlTipodocrecpag.Create;
  CtrlTipodocrecpag.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTipodocrecpag.cds := cds;
  cds.data := CtrlTipodocrecpag.ListTipodocrecpag('', -1);


  Inherited;
  MontaSelect.Filtro.Text := 'TIPODOCRECPAG.RECPAG = ''' + ParamIntegra.RecPag + '''';
End;

Procedure TfrmCadTipoDocMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  cds.fieldbyname('FLGENGLOBAPARCELA').AsString := 'A';
  cds.fieldbyname('RecPag').AsString := ParamIntegra.RecPag;
  cds.fieldbyname('IdUsuarioInclusao').AsInteger := Sistema.idUsuario;
  cds.fieldbyname('FLGGERANUMDOC').AsString := 'N';
  cds.fieldbyname('FLGDOCFISCAL').AsString := 'S';
  cds.fieldbyname('FLGSERVICO').AsString := 'N';
  cds.fieldbyname('FLGIMPRIMEAP').AsString := 'N'; // Andre Tavares - pendência 16330 - 30/04/2004
  cds.fieldbyname('FLGCODDOCIGUALNODOC').AsString := 'N'; // SOL 160624  KINTANA 1351068
  If ParamIntegra.RecPag = 'P' Then
    cds.fieldbyname('DebCre').AsString := 'C'
  Else
    cds.fieldbyname('DebCre').AsString := 'D';
  dbedDescricao.SetFocus;
End;

Procedure TfrmCadTipoDocMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
  Begin
    sbtnAcrescimo.Down := cds.fieldbyname('DebCre').AsString = 'C';
    sbtnDecrescimo.Down := cds.fieldbyname('DebCre').AsString = 'D';
  End
  Else
  Begin
    sbtnAcrescimo.Down := cds.fieldbyname('DebCre').AsString = 'D';
    sbtnDecrescimo.Down := cds.fieldbyname('DebCre').AsString = 'C';
  
  End;
  dbedDescricao.SetFocus;
End;

Procedure TfrmCadTipoDocMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
    cds.data := CtrlTipodocrecpag.ListTipodocrecpag(ParamIntegra.RecPag, StrToIntDef(MontaSelect.ValoresChave[0], 0));

    If ParamIntegra.RecPag = 'P' Then
    Begin
      sbtnAcrescimo.Down := cds.fieldbyname('DebCre').AsString = 'C';
      sbtnDecrescimo.Down := cds.fieldbyname('DebCre').AsString = 'D';
    End
    Else
    Begin
      sbtnAcrescimo.Down := cds.fieldbyname('DebCre').AsString = 'D';
      sbtnDecrescimo.Down := cds.fieldbyname('DebCre').AsString = 'C';
    End;
  End;
End;

Procedure TfrmCadTipoDocMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  CtrlTipodocrecpag.free;
End;

Procedure TfrmCadTipoDocMT.sbtnAcrescimoClick(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
    cds.fieldbyname('DebCre').AsString := 'C'
  Else
    cds.fieldbyname('DebCre').AsString := 'D';
  sbtnAcrescimo.Down := True;
End;

Procedure TfrmCadTipoDocMT.sbtnDecrescimoClick(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'P' Then
    cds.fieldbyname('DebCre').AsString := 'D'
  Else
    cds.fieldbyname('DebCre').AsString := 'C';
  sbtnDecrescimo.Down := True;
End;

Procedure TfrmCadTipoDocMT.CmeCadastroApplyDelete(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlTipodocrecpag.GravarTipodocrecpag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
End;

Procedure TfrmCadTipoDocMT.CmeCadastroApplyEdit(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlTipodocrecpag.GravarTipodocrecpag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
End;

Procedure TfrmCadTipoDocMT.CmeCadastroApplyInsert(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlTipodocrecpag.GravarTipodocrecpag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
End;

Procedure TfrmCadTipoDocMT.CmeCadastroBeforeConfirma(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  If Cds.State In [dsEdit, DsInsert] Then
  Begin
    //Faz a verificação do preenchimento dos campos
    If (dbedDescricao.Text) = '' Then
    Begin
      MsgDlg('Descriçao obrigatória', 'Erro', mtError, [mbOK], 0);
      dbedDescricao.SetFocus;
      If dbedDescricao.CanFocus Then
        dbedDescricao.SetFocus;
      accept := false;
    End;
  End;
End;

Procedure TfrmCadTipoDocMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;
  If CtrlTipodocrecpag.MessageInfo <> '' Then
    MsgDlg(CtrlTipodocrecpag.MessageInfo, 'Erro', mtError, [mbOK], 0);
End;

End.

