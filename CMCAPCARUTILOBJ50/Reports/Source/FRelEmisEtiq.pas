Unit FRelEmisEtiq;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, MAHlpBtn, Buttons, TB97Tlbr, TB97, uMensErro,
  Machklb, MontaSelect, IvDictio, IvMulti, IvEMulti, CMDBLookupCombo, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao, CmParamReport,
  DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  CMProcuraSubTipo;

Type
  TFrmRelEmisEtiq = Class(TfrmParamReports_Padrao)
    RbAtencao: TRadioGroup;
    GroupBox3: TGroupBox;
    EdDiaAtraso: TEdit;
    EdLimiteAtraso: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    EdFaixaIni: TEdit;
    EdFaixaFim: TEdit;
    gbPeriodo: TGroupBox;
    dtInicial: TCMDateTimePicker;
    Label2: TLabel;
    CkEmitidos: TCMchklistbox;
    GroupBox5: TGroupBox;
    CkbMatricial: TCheckBox;
    CmbModeloEtiq: TCMDBLookupCombo;
    DtDataLanctoInicial: TCMDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    MemReports: TMemo;
    CmbCobranca: TwwDBLookupCombo;
    LblTipoDoc: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DtDataLanctoFinal: TCMDateTimePicker;
    EdOutros: TEdit;
    RbEndereco: TRadioGroup;
    dtFinal: TCMDateTimePicker;
    btProcurar: TBitBtn;
    CkbImprime: TCheckBox;
    rgOrdem: TRadioGroup;
    dblTipoDoc: TCMDBLookupCombo;
    Label8: TLabel;
    chkDistinct: TCheckBox;
    CPForCli: TCMProcuraForCli;
    SqlModelo: TCMSqlParams;
    CdsModelo: TCMClientDataSet;
    SqlFormaPag: TCMSqlParams;
    CdsFormaPag: TCMClientDataSet;
    CdsTipoDoc: TCMClientDataSet;
    SqlTipoDoc: TCMSqlParams;
    SqlEmitidos: TCMSqlParams;
    CdsEmitidos: TCMClientDataSet;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure RbAtencaoClick(Sender: TObject);
    Procedure EdDiaAtrasoKeyPress(Sender: TObject; Var Key: Char);
    Procedure btProcurarClick(Sender: TObject);
    Procedure rgOrdemClick(Sender: TObject);
    Procedure chkDistinctClick(Sender: TObject);
  private
    { Private declarations }
    Function TestaQry
      : Boolean;
  public
    { Public declarations }
  End;

Var
  FrmRelEmisEtiq: TFrmRelEmisEtiq;

Implementation

Uses uSistema;

{$R *.DFM}

Procedure TFrmRelEmisEtiq.FormCreate(Sender: TObject);
Begin
  Inherited;
  CkbImprime.Visible := (ParamIntegra.RecPag = 'R');

  SqlTipoDoc.Prepare;
  SqlTipoDoc.ParamByName('pRECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDoc.ParamByName('pIDUSUARIO').AsFloat := Sistema.IdUsuario;
  SqlTipoDoc.Open;

  SqlModelo.Open;
  dtInicial.Date := Date;
  dtFinal.Date := Date;
  btProcurarClick(self);
  If ParamIntegra.RecPag = 'P' Then
  Begin
    RbAtencao.Items.Clear;
    RbAtencao.Items.Add('Ninguem');
    RbAtencao.Items.Add('Contas a Receber');
    RbAtencao.Items.Add('Outros...');
    LblTipoDoc.Caption := 'Contas Caixas X  Tipo de Desembolso';
    CPForCli.Caption := ' Fornecedor ';
    CPForCli.ForCli := fcFornecedor; 
  End;

  SqlFormaPag.SQL.Text := ' SELECT CODPORTFORMA, DESCRICAO ' +
    ' FROM PORTADORFORMA ' +
    ' WHERE (RECPAG = ''' + ParamIntegra.RecPag + ''')' +
    ' AND (IDPESSOA = ' + IntToStr(Sistema.idEmpresa) + ')' +
    ' ORDER BY DESCRICAO';
  SqlFormaPag.open;
End;

Procedure TFrmRelEmisEtiq.RbAtencaoClick(Sender: TObject);
Begin
  Inherited;
  If RbAtencao.ItemIndex = 2 Then
    EdOutros.Enabled := True
  Else
    EdOutros.Enabled := False;
End;

Function TFrmRelEmisEtiq.TestaQry: Boolean;
Var
  Mensagem: String;
Begin
  Result := True;
  If ((EdDiaAtraso.Text <> '') And (EdLimiteAtraso.Text = '')) Or
    ((EdDiaAtraso.Text = '') And (EdLimiteAtraso.Text <> '')) Then
  Begin
    Result := False;
    If EdDiaAtraso.Text = '' Then
    Begin
      EdDiaAtraso.SetFocus;
      Mensagem := 'Favor informar o nº de dias de atraso';
    End
    Else
    Begin
      EdLimiteAtraso.SetFocus;
      Mensagem := 'Favor informar o limite de dias de atraso';
    End;
    Msgdlg(Mensagem, 'Atenção', MtWarning, [MbOk], 0);
    Exit;
  End;

  If ((EdFaixaIni.Text <> '') And (EdFaixaFim.Text = '')) Or
    ((EdFaixaIni.Text = '') And (EdFaixaFim.Text <> '')) Then
  Begin
    Result := False;
    If EdFaixaIni.Text = '' Then
    Begin
      EdFaixaIni.SetFocus;
      Mensagem := 'Favor informar o nº inicial do documento';
    End
    Else
    Begin
      EdFaixaFim.SetFocus;
      Mensagem := 'Favor informar o nº Final do documento';
    End;
    Msgdlg(Mensagem, 'Atenção', MtWarning, [MbOk], 0);
    Exit;
  End;
End;

Procedure TFrmRelEmisEtiq.EdDiaAtrasoKeyPress(Sender: TObject;
  Var Key: Char);
Begin
  Inherited;
  Case Key Of
    '0'..'9': ;
    #8: ;
  Else
    Key := #0;
  End;
End;

Procedure TFrmRelEmisEtiq.bbtnConfirmarClick(Sender: TObject);
Var
  sLoteSelecionados: String;
  x: integer;
Begin
  Inherited;
  If CmbModeloEtiq.Text = '' Then
    MsgDlg('Favor informar o modelo de etiqueta', 'Atenção', MtInformation, [MbOk], 0)
  Else
  Begin
    If Not TestaQry Then
      Exit;
    If trim(CPForCli.ForCliReg.RazaoSocial) <> '' Then
      Cmp_Padrao.ParamValues[0].AsString := IntToStr(CPForCli.ForCliReg.Id)
    Else
      Cmp_Padrao.ParamValues[0].AsString := '';
    Cmp_Padrao.ParamValues[1].AsString := CmbModeloEtiq.LookupValue;
    Cmp_Padrao.ParamValues[2].AsBoolean := CkbMatricial.Checked;
    Cmp_Padrao.ParamValues[3].AsString := EdFaixaIni.Text;
    Cmp_Padrao.ParamValues[4].AsString := EdFaixaFim.Text;
    Cmp_Padrao.ParamValues[5].AsString := DtDataLanctoInicial.Text;
    Cmp_Padrao.ParamValues[6].AsString := DtDataLanctoFinal.Text;
    If trim(CmbCobranca.Text) <> '' Then
      Cmp_Padrao.ParamValues[7].AsString := CmbCobranca.LookupValue
    Else
      Cmp_Padrao.ParamValues[7].AsString := '';
    Cmp_Padrao.ParamValues[8].AsBoolean := CkbImprime.Checked;
    Cmp_Padrao.ParamValues[9].AsBoolean := chkDistinct.Checked;
    If trim(dblTipoDoc.Text) <> '' Then
      Cmp_Padrao.ParamValues[10].AsString := CdsTipoDoc.FieldByName('CODTIPDOC').AsString
    Else
      Cmp_Padrao.ParamValues[10].AsString := '';
    Cmp_Padrao.ParamValues[11].AsString := IntToStr(RbAtencao.ItemIndex);
    Cmp_Padrao.ParamValues[12].AsString := EdOutros.text;
    Cmp_Padrao.ParamValues[13].AsString := IntToStr(RbEndereco.ItemIndex);
    Cmp_Padrao.ParamValues[14].AsString := EdDiaAtraso.Text;
    Cmp_Padrao.ParamValues[15].AsString := EdLimiteAtraso.Text;
    Cmp_Padrao.ParamValues[16].AsString := IntToStr(RgOrdem.ItemIndex);
    sLoteSelecionados := '';
    For X := 0 To CkEmitidos.Items.Count - 1 Do
      If CkEmitidos.Selected[x] Then
        sLoteSelecionados := sLoteSelecionados + CkEmitidos.Items[x] + ',';

    Cmp_Padrao.ParamValues[17].AsString := sLoteSelecionados;
    Cmp_Padrao.ParamValues[18].AsString := RbAtencao.Items[1];
    Cmp_Padrao.ParamValues[19].AsString := Sistema.TempDir;

  End;
End;

Procedure TFrmRelEmisEtiq.btProcurarClick(Sender: TObject);
Begin
  Inherited;
  With SqlEmitidos Do
  Begin
    CdsEmitidos.Close;
    SQL.clear;
    If ParamIntegra.recpag = 'P' Then
    Begin
      SQL.Add('SELECT DISTINCT NUMLOTE FROM LOTEPAGTO ');
      SQL.Add('WHERE');
      SQL.Add('((FLAGCANCEL <> ''C'') OR (FLAGCANCEL IS NULL))');
      SQL.Add('AND DATAEMISSAO >= :pDATAINI AND DATAEMISSAO <= :pDATAFIN');
    End
    Else
    Begin
      SQL.Add('SELECT DISTINCT ');
      SQL.Add('    D.CONTROLEREMESSA ');
      SQL.Add('FROM ');
      SQL.Add('    DOCUMENTO D ');
      SQL.Add('WHERE ');
      SQL.Add('    ( D.DATAREMESSA >= :pDATAINI AND D.DATAREMESSA <= :pDATAFIN) AND ');
      SQL.Add('    ( D.RECPAG  = ''R'' ) AND ');
      SQL.Add(' ');
      SQL.Add('    ( D.CONTROLEREMESSA IS NOT NULL) ');
      SQL.Add('ORDER BY ');
      SQL.Add('    D.CONTROLEREMESSA ');
    End;
    Prepare;
    ParamByName('pDATAINI').AsDateTime := dtInicial.Date;
    ParamByName('pDATAFIN').AsDateTime := dtFinal.Date;
    Open;
    CkEmitidos.Clear;
    If Not CdsEmitidos.IsEmpty Then
      While Not CdsEmitidos.Eof Do
      Begin
        CkEmitidos.Items.Add(CdsEmitidos.Fields[0].AsString);
        CdsEmitidos.Next;
      End;
  End;
End;

Procedure TFrmRelEmisEtiq.rgOrdemClick(Sender: TObject);
Begin
  Inherited;
  If rgOrdem.ItemIndex = 2 Then
    chkDistinct.Enabled := False
  Else
    chkDistinct.Enabled := True;
End;

Procedure TFrmRelEmisEtiq.chkDistinctClick(Sender: TObject);
Begin
  Inherited;
  TRadioButton(rgOrdem.Components[2]).Enabled := Not chkDistinct.Checked;
End;

End.

