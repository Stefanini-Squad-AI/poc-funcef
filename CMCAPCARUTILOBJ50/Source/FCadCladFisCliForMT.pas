Unit FCadCladFisCliForMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  DBTables, fcTreeView, Mask, wwdbedit,
  uCtrlClasfisclifor, uCMTypes;

Type
  TFrmCadCladFisCliForMT = Class(TFrmCadastroMT)
    Label1: TLabel;
    EdtDescricao: TwwDBEdit;
    Label2: TLabel;
    EdtCodReduz: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    Label5: TLabel;
    Label3: TLabel;
    TreeTipoFat: TfcTreeView;
    ImlTipoFatura: TImageList;
    CdsTipoFat: TCMClientDataSet;
    CdsAssociaFat: TCMClientDataSet;
    Procedure CmeCadastroBeforeConfirma(sender: TObject;
      Var Accept: Boolean);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
  private
    { Private declarations }
    CtrlClasfisclifor: tCtrlClasfisclifor;
    Procedure MontaArvoreFaturas;
    Procedure MostraMensagem(sMessageInfo: String);

  public
    { Public declarations }
  End;

Var
  FrmCadCladFisCliForMT: TFrmCadCladFisCliForMT;

Implementation

Uses uFuncaoGeral, uMensErro, DBaseDados, uSistema, uModulo, uCtrlParamIntegra;

{$R *.DFM}

Procedure TFrmCadCladFisCliForMT.CmeCadastroBeforeConfirma(sender: TObject;
  Var Accept: Boolean);
Var
  x: Integer;
  OldOper: TOperacao;
Begin
  Accept := (Trim(EdtCodReduz.Text) <> '');

  If Not Accept Then
    If EdtCodReduz.CanFocus Then
      EdtCodReduz.SetFocus;

  If Accept Then
  Begin
    OldOper := CmeCadastro.Operacao;
    If OldOper = OpApagar Then
    Begin
      While Not CdsAssociaFat.Eof Do
        CdsAssociaFat.Delete;
    End;
    If OldOper In [OpInserir, OpAlterar] Then
    Begin
      While Not CdsAssociaFat.Eof Do
        CdsAssociaFat.Delete;

      For x := 0 To TreeTipoFat.Items.Count - 1 Do
      Begin
        If (TreeTipoFat.Items[x].ImageIndex = 3) And (TreeTipoFat.Items[x].Checked) Then
        Begin
          CdsAssociaFat.Append;
          CdsAssociaFat.fieldbyname('IDCLASFISCLIFOR').AsInteger := Cds.fieldbyname('IDCLASFISCLIFOR').AsInteger;
          CdsAssociaFat.fieldbyname('IDTIPOFATURA').AsInteger := StrToInt(TreeTipoFat.Items[x].StringData);
          CdsAssociaFat.Post;
        End;
      End;
    End;
    If Cds.State In [dsEdit, DsInsert] Then
      Cds.Post;
  End;
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
Begin
  Inherited;
  pnlFundo.Enabled := True;
  TreeTipoFat.ReadOnly := Not bbtnConfirmar.Enabled;
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  MontaArvoreFaturas;
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroEdit(Sender: TObject);
Begin
  Inherited;

  EdtDescricao.SetFocus;
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
    cds.data := CtrlClasfisclifor.ListClasfisclifor(StrToIntDef(MontaSelect.ValoresChave[0], 0));
    CdsAssociaFat.data := CtrlClasfisclifor.ListTipofatxclasfis(0,
      Cds.fieldbyname('IDCLASFISCLIFOR').AsInteger);
    MontaArvoreFaturas;
  End;
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;
  EdtDescricao.SetFocus;
  MontaArvoreFaturas;
End;

Procedure TFrmCadCladFisCliForMT.MontaArvoreFaturas;
Var
  nopai, nofilho: TfcTreeNode;
  spai: String;
Begin
  CdsTipoFat.Data := CtrlClasfisclifor.ListTIPOFATURAxTIPOFATXCLASFIS(Cds.fieldbyname('IDCLASFISCLIFOR').AsInteger);
  TreeTipoFat.Items.Clear;
  nopai := Nil;
  spai := '';
  While Not CdsTipoFat.Eof Do
  Begin
    If spai <> CdsTipoFat.fieldbyname('FLGTIPOFATURA').AsString Then
    Begin
      spai := CdsTipoFat.fieldbyname('FLGTIPOFATURA').AsString;
      Case spai[1] Of
        'F':
          Begin
            nopai := TreeTipoFat.Items.Add(Nil, 'Faturas');
            nopai.ImageIndex := 0;
            nopai.SelectedIndex := 0;
          End;
        'N':
          Begin
            If ParamIntegra.RecPag = 'P' Then
              nopai := TreeTipoFat.Items.Add(Nil, 'Nota de Débito')
            Else
              nopai := TreeTipoFat.Items.Add(Nil, 'Nota de Crédito');
            nopai.ImageIndex := 1;
            nopai.SelectedIndex := 1;
          End;
        'R':
          Begin
            nopai := TreeTipoFat.Items.Add(Nil, 'Recibo');
            nopai.ImageIndex := 2;
            nopai.SelectedIndex := 2;
          End;
      End;
      nopai.CheckboxType := tvctNone;
    End;
    spai := CdsTipoFat.fieldbyname('FLGTIPOFATURA').AsString;
    nofilho := TreeTipoFat.Items.AddChild(nopai, CdsTipoFat.fieldbyname('DESCTIPOFATURA').AsString);
    nofilho.StringData := CdsTipoFat.fieldbyname('IDTIPOFATURA').AsString;
    nofilho.ImageIndex := 3;
    nofilho.SelectedIndex := 3;
    nofilho.CheckboxType := tvctRadioGroup;
    nofilho.Checked := (Not CdsTipoFat.fieldbyname('IDCLASFISCLIFOR').IsNull);
    CdsTipoFat.Next;
  End;
End;

Procedure TFrmCadCladFisCliForMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
    Caption := Caption + ' Clientes'
  Else
    Caption := Caption + ' Fornecedores';
  CtrlClasfisclifor := TCtrlClasfisclifor.Create;
  CtrlClasfisclifor.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlClasfisclifor.OnMessageInfo := MostraMensagem;

  Cds.data := CtrlClasfisclifor.ListClasfisclifor(-1);
  CdsAssociaFat.data := CtrlClasfisclifor.ListTipofatxclasfis(-1, -1);
End;

Procedure TFrmCadCladFisCliForMT.MostraMensagem(sMessageInfo: String);
Begin
  ShowMessage(sMessageInfo);
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;
  If CtrlClasfisclifor.MessageInfo <> '' Then
    MsgDlg(CtrlClasfisclifor.MessageInfo, 'Erro', mtError, [mbOK], 0);
End;

Procedure TFrmCadCladFisCliForMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  CtrlClasfisclifor.free;
End;

Procedure TFrmCadCladFisCliForMT.CmeCadastroApplyInsert(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlClasfisclifor.GravarClasfisclifor(Cds.Data, CdsAssociaFat.Data, CmeCadastro.Operacao, Sistema.IdEmpresa, Sistema.IdModulo,
    Sistema.IdUsuario);
End;

End.

