Unit FConfigCheqMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, uModulo,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid, Wwdbspin,
  uExtensoCM, CmEventosCadastro, ImgList, FCadastroMT, DBClient,
  uCMClientDataSet, uCtrlTemplcheque, uCtrlConfigCheque, uCMTypes;

Type
  TFrmConfigCheqMT = Class(TfrmCadastroMT)
    Panel1: TPanel;
    Label1: TLabel;
    dbedlayoutCheque: TwwDBEdit;
    DbgAno: TDBRadioGroup;
    LbldocEscluidos: TPanel;
    BtnTestaImpressao: TToolbarButton97;
    CkbFonteReduzida: TDBCheckBox;
    GpLinhas: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    wwDBSpinEdit1: TwwDBSpinEdit;
    wwDBSpinEdit2: TwwDBSpinEdit;
    Extenso: TExtensoCM;
    CdsDet: TCMClientDataSet;
    dsDet: TwwDataSource;
    wwDBGrid1: TwwDBGrid;
    Procedure FormCreate(Sender: TObject);
    Procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure BtnTestaImpressaoClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CdsDetNewRecord(DataSet: TDataSet);
    Procedure CdsDetPostError(DataSet: TDataSet; E: EDatabaseError;
      Var Action: TDataAction);
  private
    { Private declarations }
    CtrlTemplcheque: TCtrlTemplcheque;
    CtrlConfigCheque: TCtrlConfigCheque;
    bInclui: boolean;

  public
    { Public declarations }
  End;

Var
  FrmConfigCheqMT: TFrmConfigCheqMT;

Implementation

Uses UCheqBloq, uMensErro, uSistema, uFuncaoGeral, DBasedados;

{$R *.DFM}

Procedure TFrmConfigCheqMT.CmeCadastroInsert(Sender: TObject);
Var
  x: Integer;
Begin
  CdsDet.data := CtrlConfigCheque.ListConfigCheque(-1);
  Inherited;
  cds.FieldByName('QTDEDIGITOSANO').AsInteger := 4;
  bInclui := True;
  For X := 0 To 12 Do
  Begin
    CdsDet.Append;
    CdsDet.FieldByName('IDTEMPLCHEQUE').AsFloat := Cds.FieldByName('IDTEMPLCHEQUE').AsFloat;
    CdsDet.FieldByName('CAMPOCHEQUE').value := X;
    Case Round(CdsDet.FieldByName('CAMPOCHEQUE').Value) Of
      0: CdsDet.FieldByName('DESCRICAO').Value := 'Valor Cheque';
      1: CdsDet.FieldByName('DESCRICAO').Value := 'Extenso 1';
      2: CdsDet.FieldByName('DESCRICAO').Value := 'Extenso 2';
      3: CdsDet.FieldByName('DESCRICAO').Value := 'Portador';
      4: CdsDet.FieldByName('DESCRICAO').Value := 'Local';
      5: CdsDet.FieldByName('DESCRICAO').Value := 'Dia';
      6: CdsDet.FieldByName('DESCRICAO').Value := 'Mes';
      7: CdsDet.FieldByName('DESCRICAO').Value := 'Ano';
      8: CdsDet.FieldByName('DESCRICAO').Value := 'Local Cheque Diferido';
      9: CdsDet.FieldByName('DESCRICAO').Value := 'Dia Cheque Diferido';
      10: CdsDet.FieldByName('DESCRICAO').Value := 'Mes Cheque Diferido';
      11: CdsDet.FieldByName('DESCRICAO').Value := 'Ano Cheque Diferido';
      12: CdsDet.FieldByName('DESCRICAO').Value := 'Margem Inf';
    End;
    CdsDet.Post;
  End;
  dbedlayoutCheque.SetFocus;
  CdsDet.First;
  bInclui := False;
End;

Procedure TFrmConfigCheqMT.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  If Not Cds.IsEmpty Then
    CdsDet.data := CtrlConfigCheque.ListConfigCheque(Cds.FieldByName('IDTEMPLCHEQUE').AsFloat);
End;

Procedure TFrmConfigCheqMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Cds.data := CtrlTemplcheque.ListTemplcheque(StrToInt(MontaSelect.ValoresChave[0]));
    CdsDet.data := CtrlConfigCheque.ListConfigCheque(Cds.FieldByName('IDTEMPLCHEQUE').AsFloat);
  End;
End;

Procedure TFrmConfigCheqMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlTemplcheque := TCtrlTemplcheque.create;
  CtrlTemplcheque.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  CtrlTemplcheque.cds := cds;
  CtrlTemplcheque.cdsConfigCheque := CdsDet;

  CtrlConfigCheque := TCtrlConfigCheque.create;
  CtrlConfigCheque.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);

  Cds.data := CtrlTemplcheque.ListTemplcheque(-1);
  CdsDet.data := CtrlConfigCheque.ListConfigCheque(-1);
  bInclui := false;
End;

Procedure TFrmConfigCheqMT.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
Begin
  Inherited;
  If (Field.FieldName = 'COLUNACHEQUE') Or (Field.FieldName = 'LINHACHEQUE') Then
  Begin
    AFont.Color := clNavy;
    ABrush.Color := $0080FFFF; {Amarelo claro}
  End;
End;

Procedure TFrmConfigCheqMT.BtnTestaImpressaoClick(Sender: TObject);
Var
  CheqBloqCM: TCheqBloqCM;
  X: Integer;
Begin
  Inherited;
  If Not Cds.IsEmpty Then
  Begin
    Screen.Cursor := CrHourGlass;
    CheqBloqCM := TCheqBloqCM.Create(Modulo.ImpressoraDefault, Modulo.ModeloImpressora);
    Try
      CheqBloqCM.NumBloqChqSaltoLinha := Cds.fieldbyname('NUMCHQSALTO').AsInteger;
      CheqBloqCM.NumLinhasSalto := Cds.fieldbyname('NUMLINHASSALTO').AsInteger;

      If CheqBloqCM.InicializaImpressora('Emissão de Cheques') Then
      Begin
        CheqBloqCM.FonteCondensada := (Cds.fieldbyname('FLGIMPCONDENSADO').AsString = 'S');
        For X := 0 To 5 Do
        Begin
          Extenso.Valor := 99999999;

          If Sistema.IdiomaAtivo = 2 Then
          Begin
            Extenso.DescricaoMoeda.Singular := '';
            Extenso.DescricaoMoeda.Plural := '';
          End
          Else
            Extenso.SetaMoedaPadrao;

          Extenso.SetaIdiomaPadrao;
          Extenso.Escreve;

          CheqBloqCM.IdTemplCheque := Cds.FieldByName('IDTEMPLCHEQUE').AsInteger;
          CheqBloqCM.CompAno := Cds.FieldByName('QTDEDIGITOSANO').AsInteger;
          CheqBloqCM.Valor := FloatToStrf(99999999, ffnumber, 13, 2);
          CheqBloqCM.Extenso := Extenso.Extenso;
          CheqBloqCM.Portador := 'Nome do Pordador';
          CheqBloqCM.Local := 'Local de Emissão';
          CheqBloqCM.Data := Date;
          CheqBloqCM.LocalDiferido := 'Local do Diferido';
          CheqBloqCM.DataDiferido := Date + 10;
          If Not CheqBloqCM.GeraCheque Then
            abort;
        End;
        CheqBloqCM.Imprime;
        MsgDlg('Término da Impressão', 'Atenção', mtInformation, [mbOK], 0);
      End;
      CheqBloqCM.Free;
      Screen.Cursor := CrDefault;
    Except
      CheqBloqCM.Free;
      Screen.Cursor := CrDefault;
      MsgDlg('Não foi possível imprimir o Cheque', 'Erro', mtInformation, [mbOK], 0);
      Raise;
    End;
  End;
  BtnTestaImpressao.Down := False;
End;

Procedure TFrmConfigCheqMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  BtnTestaImpressao.Enabled := Not bbtnConfirmar.Enabled;
End;

Procedure TFrmConfigCheqMT.CmeCadastroApplyDelete(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlTemplcheque.ExcluirTemplcheque;
End;

Procedure TFrmConfigCheqMT.CmeCadastroApplyEdit(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlTemplcheque.GravarTemplcheque(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
End;

Procedure TFrmConfigCheqMT.CmeCadastroApplyInsert(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  Accept := CtrlTemplcheque.GravarTemplcheque(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);;
End;

Procedure TFrmConfigCheqMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;
  If CtrlTemplCheque.MessageInfo <> '' Then
    MsgDlg(CtrlTemplCheque.MessageInfo, 'Erro', mtError, [mbOK], 0);
End;

Procedure TFrmConfigCheqMT.CmeCadastroDelete(Sender: TObject);
Begin
  CdsDet.First;
  While Not CdsDet.Eof Do
    CdsDet.Delete;
  Inherited;
End;

Procedure TFrmConfigCheqMT.CdsDetNewRecord(DataSet: TDataSet);
Begin
  Inherited;
  If Not bInclui Then
    CdsDet.Cancel;
End;

Procedure TFrmConfigCheqMT.CdsDetPostError(DataSet: TDataSet;
  E: EDatabaseError; Var Action: TDataAction);
Begin
  Inherited;
  Action := daAbort;
End;

End.

