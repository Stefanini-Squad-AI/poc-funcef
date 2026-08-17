unit FParamRelRendasAlteradas;

interface

uses
  Windows    , Messages, SysUtils, Classes, Graphics, Controls, Forms   , Dialogs ,
  FOkCancelar, Db      , DBTables, Wwquery, StdCtrls, wwdblook, IvDictio, Spin    ,
  IvMulti    , IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97    , ExtCtrls, checklst,
  Wwdatsrc, usistema, dbasedados, fcCombo, fcColorCombo, Mask, TREdit;

type
  TfrmPRelRendasAlteradas = class(TfrmOkCancelar)
    grbPatrocinadora: TGroupBox;
    cmbPatrocinadora : TwwDBLookupCombo;
    grbPlano: TGroupBox;
    cmbPlano         : TwwDBLookupCombo;
    qryPatrocinadora: TwwQuery;
    qryPlano         : TwwQuery;
    qryVersaoMesBase: TwwQuery;
    qryLoteOuVersaoMesPagto: TwwQuery;
    pnlVersao: TPanel;
    grbMesBase: TGroupBox;
    lbVersaoMesBase: TLabel;
    cmbMesBase: TComboBox;
    speAnoBase: TSpinEdit;
    chklstVersaoMesBase: TCheckListBox;
    grbMesPagto: TGroupBox;
    lbVersaoMesPagto: TLabel;
    cmbMesPagto: TComboBox;
    speAnoPagto: TSpinEdit;
    chklstLoteOuVersaoMesPagto: TCheckListBox;
    rdoEscolheTabela: TRadioGroup;
    rdgVlrPerc: TRadioGroup;
    grbPercentual: TGroupBox;
    lblFiltro: TLabel;
    cboTipoFiltro: TComboBox;
    lblPerc: TLabel;
    rdtValPerc: TRealEdit;
    Label1: TLabel;
    lblFiltro2: TLabel;
    cboTipoFiltro2: TComboBox;
    lblPerc2: TLabel;
    rdtValPerc2: TDBRealEdit;
    Label2: TLabel;
    rdgOrdena: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grbPlanoEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbMesBaseChange(Sender: TObject);
    procedure speAnoBaseChange(Sender: TObject);
    procedure cmbMesPagtoChange(Sender: TObject);
    procedure speAnoPagtoChange(Sender: TObject);
    procedure rdoEscolheTabelaClick(Sender: TObject);
    procedure rdtValPercExit(Sender: TObject);
    procedure cboTipoFiltroChange(Sender: TObject);
    procedure rdtValPerc2Exit(Sender: TObject);
  private
    { Private declarations }
    ListaVersaoMesBase,
    ListaVersaoMesPagto     : TStringList;
    wDia, wMes, wAno        : Word;
    bEscolheuVersaoMesBase,
    bEscolheuVersaoMesPagto : Boolean;
    sVersaoMesBaseSel,
    sVersaoMesPagtoSel      : String;
    dValPerc, dValPerc2     : Double;

    procedure MontaQuery;
    procedure MontaFiltroPerc;
    procedure MontaFiltroBase(pbVlrCorrente : Boolean);
  public
    { Public declarations }
  end;

var
  frmPRelRendasAlteradas: TfrmPRelRendasAlteradas;

implementation

uses dRelRendasAlteradas, uMensErro, uFuncoesFolha, uAdmPrevFB, fAguarde;

{$R *.DFM}

procedure TfrmPRelRendasAlteradas.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  qryPatrocinadora.Close;
  qryPlano.Close;
  Action := caFree;
end;

procedure TfrmPRelRendasAlteradas.grbPlanoEnter(Sender: TObject);
begin
  inherited;
  // Verifica se alguma Patrocinadora foi escolhida
  If (cmbPatrocinadora.Text <> '') Then
  Begin
    qryPlano.Close;
    qryPlano.SQL.Clear;
    qryPlano.SQL.Add(
    ' SELECT PL.IDPLANOPREV, PL.NOME FROM PLANPREV PL, PLANPREVPATRO PP '+
    ' WHERE PP.IDPLANOPREV = PL.IDPLANOPREV AND PP.IDPESSJUR = '+cmbPatrocinadora.LookupValue+
    ' ORDER BY PL.NOME');
    qryPlano.Open;
  End
  Else
  Begin
    qryPlano.Close;
    qryPlano.SQL.Clear;
    qryPlano.SQL.Add('SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME');
    qryPlano.Open;
  End;
end;

procedure TfrmPRelRendasAlteradas.bbtnConfirmarClick(Sender: TObject);
Var sMesBase, sMesPagto : String;
    bFaz                : Boolean;
    I                   : Integer;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  //Impede que um dos meses estaja em branco ou nulo, o mesmo com os anos - Início
  If (cmbMesBase.Text <> '') And ((speAnoBase.Text <> '') Or (speAnoBase.Value > 0))Then
  Begin
    If cmbMesBase.ItemIndex > 8 Then
      sMesBase := speAnoBase.Text+'/'+IntToStr(cmbMesBase.ItemIndex+1)
    Else
      sMesBase := speAnoBase.Text+'/0'+IntToStr(cmbMesBase.ItemIndex+1);
  End
  Else
  Begin
    If Trim(cmbMesBase.Text) = '' Then
    Begin
      MsgDlg('Por favor, escolha o mês base para comparação.', 'Informação', mtInformation, [mbOk], 0);
      ModalResult := mrNone;
      Exit;
    End
    Else
    Begin
      If (Trim(speAnoBase.Text) = '') Or (speAnoBase.Value = 0) Then
      Begin
        MsgDlg('Por favor, escolha o ano base para comparação.', 'Informação', mtInformation, [mbOk], 0);
        ModalResult := mrNone;
        Exit;
      End;
    End;
  End;

  If (cmbMesPagto.Text <> '') And ((speAnoPagto.Text <> '') Or (speAnoPagto.Value > 0)) Then
  Begin
    If cmbMesPagto.ItemIndex > 8 Then
      sMesPagto := speAnoPagto.Text+'/'+IntToStr(cmbMesPagto.ItemIndex+1)
    Else
      sMesPagto := speAnoPagto.Text+'/0'+IntToStr(cmbMesPagto.ItemIndex+1);
  End
  Else
  Begin
    If Trim(cmbMesPagto.Text) = '' Then
    Begin
      MsgDlg('Por favor, escolha o mês de pagamento.', 'Informação', mtInformation, [mbOk], 0);
      ModalResult := mrNone;
      Exit;
    End
    Else
    Begin
      If (Trim(speAnoPagto.Text) = '') Or (speAnoPagto.Value = 0) Then
      Begin
        MsgDlg('Por favor, escolha o ano de pagamento.', 'Informação', mtInformation, [mbOk], 0);
        ModalResult := mrNone;
        Exit;
      End;
    End;
  End;
  //Impede que um dos meses estaja em branco ou nulo, o mesmo com os anos - Fim

  //Testa se alguma versão foi selecionada - Início
  For I:= 0 To chklstVersaoMesBase.Items.Count - 1 Do
  Begin
    If chklstVersaoMesBase.Checked[I] Then
      bEscolheuVersaoMesBase := True;
  End;

  For I:= 0 To chklstLoteOuVersaoMesPagto.Items.Count - 1 Do
  Begin
    If chklstLoteOuVersaoMesPagto.Checked[I] Then
      bEscolheuVersaoMesPagto := True;
  End;
  //Testa se alguma versão foi selecionada - Fim

  //Crítica dos meses - Início
  If sMesBase = sMesPagto Then
  Begin
    MsgDlg('Por favor, escolha o mês base menor que o mês de pagamento.', 'Informação', mtInformation, [mbOk], 0);
    ModalResult := mrNone;
    Exit;
  End
  Else
  Begin
    If speAnoBase.Text > speAnoPagto.Text Then
    Begin
      MsgDlg('O ano base não pode ser maior que o ano de pagamento.', 'Informação', mtInformation, [mbOk], 0);
      ModalResult := mrNone;
      Exit;
    End
    Else
    Begin
      If ((cmbMesBase.ItemIndex > cmbMesPagto.ItemIndex) And (speAnoBase.Text >= speAnoPagto.Text)) Then
      Begin
        MsgDlg('O mês base não pode ser maior que o mês de pagamento.', 'Informação', mtInformation, [mbOk], 0);
        ModalResult := mrNone;
        Exit;
      End;
    End;
  End;
  //Crítica dos meses - Fim

  //Crítica das versões - Início
  If (bEscolheuVersaoMesBase = False) Or (bEscolheuVersaoMesPagto = False) Then
  Begin
    MsgDlg('Por favor, escolha versão do mês base e versão ou lote do mês de pagamento.', 'Informação', mtInformation, [mbOk], 0);
    ModalResult := mrNone;
    Exit;
  End
  Else
  Begin
    For I:=0 To chklstVersaoMesBase.Items.Count-1 Do
      If chklstVersaoMesBase.Checked[I] Then
      Begin
        If sVersaoMesBaseSel = '' Then
          sVersaoMesBaseSel := ListaVersaoMesBase[I]
        Else
          sVersaoMesBaseSel := sVersaoMesBaseSel + ',' + ListaVersaoMesBase[I];
      End;

    For I:=0 To chklstLoteOuVersaoMesPagto.Items.Count-1 Do
      If chklstLoteOuVersaoMesPagto.Checked[I] Then
      Begin
        If sVersaoMesPagtoSel = '' Then
          sVersaoMesPagtoSel := ListaVersaoMesPagto[I]
        Else
          sVersaoMesPagtoSel := sVersaoMesPagtoSel + ',' + ListaVersaoMesPagto[I];
      End;
  End;
  //Crítica das versões - Fim

  //Crítica do Filtro
  If Trim(cboTipoFiltro.Text) = '' Then
  Begin
    MsgDlg('Por favor, escolha o filtro que será usado na busca.', 'Informação', mtInformation, [mbOk], 0);
    ModalResult := mrNone;
    Exit;
  End;
  //Crítica do Filtro - Fim

  MontaQuery;

  frmAguarde.Mostra('Aguarde... Montando Relatório.');
  frmAguarde.Repaint;
  dtmRelRendasAlteradas.qryRendasAlteradas.Open;

  if not dtmRelRendasAlteradas.qryRendasAlteradas.IsEmpty then
    dtmRelRendasAlteradas.lblQtdRegistros.Caption := 'Quantidade de Registros: ' + IntToStr(dtmRelRendasAlteradas.qryRendasAlteradas.RecordCount);

  frmAguarde.Apaga; 

  If Trim(cboTipoFiltro2.Text) <> '' Then
    dtmRelRendasAlteradas.lblMostraFiltroSel.Caption :=
      cboTipoFiltro.Text + ' ' + rdtValPerc.Text + '%' + ' e ' + cboTipoFiltro2.Text + ' ' + rdtValPerc2.Text + '%'
  Else
    dtmRelRendasAlteradas.lblMostraFiltroSel.Caption := cboTipoFiltro.Text + ' ' + rdtValPerc.Text + '%';
end;

procedure TfrmPRelRendasAlteradas.FormShow(Sender: TObject);
begin
  inherited;
  ListaVersaoMesBase  := TStringList.Create;
  ListaVersaoMesPagto := TStringList.Create;
  DecodeDate(Date, wAno, wMes, wDia);
  cmbMesBase.ItemIndex  := wMes - 1;
  cmbMesPagto.ItemIndex := wMes - 1;
  speAnoBase.Value      := wAno;
  speAnoPagto.Value     := wAno;
  qryPatrocinadora.Open;
end;

procedure TfrmPRelRendasAlteradas.cmbMesBaseChange(Sender: TObject);
Var
  sMesBase : String;
begin
  inherited;
  If (Trim(speAnoBase.Text) = '') Or (speAnoBase.Value = 0) Then
    MsgDlg('Por favor, escolha o ano base.', 'Informação', mtInformation, [mbOk], 0)
  Else
  Begin
    If cmbMesBase.ItemIndex > 8 Then
      sMesBase := speAnoBase.Text+'/'+IntToStr(cmbMesBase.ItemIndex+1)
    Else
      sMesBase := speAnoBase.Text+'/0'+IntToStr(cmbMesBase.ItemIndex+1);
    qryVersaoMesBase.Close;
    qryVersaoMesBase.ParamByName('PMESREF').AsString := sMesBase;
    qryVersaoMesBase.Open;
    qryVersaoMesBase.First;
    chklstVersaoMesBase.Clear;
    ListaVersaoMesBase.Clear;
    While Not qryVersaoMesBase.Eof Do
    Begin
      chklstVersaoMesBase.Items.Add(qryVersaoMesBase.FieldByName('HISTORICO').AsString);
      chklstVersaoMesBase.ItemIndex := 0;
      ListaVersaoMesBase.Add(qryVersaoMesBase.FieldByName('IDHSTFOLHABENEF').AsString);
      qryVersaoMesBase.Next;
    End;
  End;
end;

procedure TfrmPRelRendasAlteradas.speAnoBaseChange(Sender: TObject);
Var
  sMesBase : String;

begin
  inherited;
  If Trim(cmbMesBase.Text) = '' Then
    MsgDlg('Por favor, escolha o mês base.', 'Informação', mtInformation, [mbOk], 0)
  Else
  Begin
    If cmbMesBase.ItemIndex > 8 Then
      sMesBase := speAnoBase.Text+'/'+IntToStr(cmbMesBase.ItemIndex+1)
    Else
      sMesBase := speAnoBase.Text+'/0'+IntToStr(cmbMesBase.ItemIndex+1);
    qryVersaoMesBase.Close;
    qryVersaoMesBase.ParamByName('PMESREF').AsString := sMesBase;
    qryVersaoMesBase.Open;
    qryVersaoMesBase.First;
    chklstVersaoMesBase.Clear;
    ListaVersaoMesBase.Clear;
    While Not qryVersaoMesBase.Eof Do
    Begin
      chklstVersaoMesBase.Items.Add(qryVersaoMesBase.FieldByName('HISTORICO').AsString);
      chklstVersaoMesBase.ItemIndex := 0;
      ListaVersaoMesBase.Add(qryVersaoMesBase.FieldByName('IDHSTFOLHABENEF').AsString);
      qryVersaoMesBase.Next;
    End;
  End;
end;

procedure TfrmPRelRendasAlteradas.cmbMesPagtoChange(Sender: TObject);
Var
  sMesPagto : String;

begin
  inherited;
  If (Trim(speAnoPagto.Text) = '') Or (speAnoPagto.Value = 0) Then
    MsgDlg('Por favor, escolha o ano de pagamento.', 'Informação', mtInformation, [mbOk], 0)
  Else
  Begin
    If cmbMesPagto.ItemIndex > 8 Then
      sMesPagto := speAnoPagto.Text+'/'+IntToStr(cmbMesPagto.ItemIndex+1)
    Else
      sMesPagto := speAnoPagto.Text+'/0'+IntToStr(cmbMesPagto.ItemIndex+1);

    If rdoEscolheTabela.ItemIndex = 0 Then
    Begin
      qryLoteOuVersaoMesPagto.Close;
      qryLoteOuVersaoMesPagto.SQL.Clear;
      qryLoteOuVersaoMesPagto.SQL.Add(
      ' SELECT '+
        ' IDLOTE, '+
        ' IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+

      ' FROM '+
        ' CTRLINTERFACE '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesPagto)+
        ' AND FLGPREPARADO = 1 '+
        ' AND TIPO = ''B'' '+
        ' AND FLGVOLTATMP = 0 '+

      ' ORDER BY '+
        ' IDLOTE DESC ');
      qryLoteOuVersaoMesPagto.Open;
      chklstLoteOuVersaoMesPagto.Clear;
      ListaVersaoMesPagto.Clear;
      While Not qryLoteOuVersaoMesPagto.Eof Do
      Begin
        chklstLoteOuVersaoMesPagto.Items.Add(qryLoteOuVersaoMesPagto.FieldByName('DESCRICAO').AsString);
        chklstLoteOuVersaoMesPagto.ItemIndex := 0;
        ListaVersaoMesPagto.Add(qryLoteOuVersaoMesPagto.FieldByName('IDLOTE').AsString);
        qryLoteOuVersaoMesPagto.Next;
      End;
    End
    Else
    Begin
      qryLoteOuVersaoMesPagto.Close;
      qryLoteOuVersaoMesPagto.SQL.Clear;
      qryLoteOuVersaoMesPagto.SQL.Add(
      ' SELECT '+
        ' IDHSTFOLHABENEF, '+
        ' IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO '+

      ' FROM '+
        ' HSTFOLHABENEF '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesPagto)+
        ' AND FLGESTADO <> 2 '+

      ' ORDER BY '+
        ' IDHSTFOLHABENEF DESC ');
      qryLoteOuVersaoMesPagto.Open;
      chklstLoteOuVersaoMesPagto.Clear;
      ListaVersaoMesPagto.Clear;
      While Not qryLoteOuVersaoMesPagto.Eof Do
      Begin
        chklstLoteOuVersaoMesPagto.Items.Add(qryLoteOuVersaoMesPagto.FieldByName('HISTORICO').AsString);
        chklstLoteOuVersaoMesPagto.ItemIndex := 0;
        ListaVersaoMesPagto.Add(qryLoteOuVersaoMesPagto.FieldByName('IDHSTFOLHABENEF').AsString);
        qryLoteOuVersaoMesPagto.Next;
      End;
    End;
  End;
end;

procedure TfrmPRelRendasAlteradas.speAnoPagtoChange(Sender: TObject);
Var
  sMesPagto : String;

begin
  inherited;
  If Trim(cmbMesPagto.Text) = '' Then
    MsgDlg('Por favor, escolha o mês de pagamento.', 'Informação', mtInformation, [mbOk], 0)
  Else
  Begin
    If cmbMesPagto.ItemIndex > 8 Then
      sMesPagto := speAnoPagto.Text+'/'+IntToStr(cmbMesPagto.ItemIndex+1)
    Else
      sMesPagto := speAnoPagto.Text+'/0'+IntToStr(cmbMesPagto.ItemIndex+1);

    If rdoEscolheTabela.ItemIndex = 0 Then
    Begin
      qryLoteOuVersaoMesPagto.Close;
      qryLoteOuVersaoMesPagto.SQL.Clear;
      qryLoteOuVersaoMesPagto.SQL.Add(
      ' SELECT '+
        ' IDLOTE, '+
        ' IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+

      ' FROM '+
        ' CTRLINTERFACE '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesPagto)+
        ' AND FLGPREPARADO = 1 '+
        ' AND TIPO = ''B'' '+
        ' AND FLGVOLTATMP = 0 '+

      ' ORDER BY '+
        ' IDLOTE DESC ');
      qryLoteOuVersaoMesPagto.Open;
      chklstLoteOuVersaoMesPagto.Clear;
      ListaVersaoMesPagto.Clear;
      While Not qryLoteOuVersaoMesPagto.Eof Do
      Begin
        chklstLoteOuVersaoMesPagto.Items.Add(qryLoteOuVersaoMesPagto.FieldByName('DESCRICAO').AsString);
        chklstLoteOuVersaoMesPagto.ItemIndex := 0;
        ListaVersaoMesPagto.Add(qryLoteOuVersaoMesPagto.FieldByName('IDLOTE').AsString);
        qryLoteOuVersaoMesPagto.Next;
      End;
    End
    Else
    Begin
      qryLoteOuVersaoMesPagto.Close;
      qryLoteOuVersaoMesPagto.SQL.Clear;
      qryLoteOuVersaoMesPagto.SQL.Add(
      ' SELECT '+
        ' IDHSTFOLHABENEF, '+
        ' IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO '+

      ' FROM '+
        ' HSTFOLHABENEF '+

      ' WHERE '+
        ' MESREFERENCIA = '+QuotedStr(sMesPagto)+
        ' AND FLGESTADO <> 2 '+

      ' ORDER BY '+
        ' IDHSTFOLHABENEF DESC ');
      qryLoteOuVersaoMesPagto.Open;
      chklstLoteOuVersaoMesPagto.Clear;
      ListaVersaoMesPagto.Clear;
      While Not qryLoteOuVersaoMesPagto.Eof Do
      Begin
        chklstLoteOuVersaoMesPagto.Items.Add(qryLoteOuVersaoMesPagto.FieldByName('HISTORICO').AsString);
        chklstLoteOuVersaoMesPagto.ItemIndex := 0;
        ListaVersaoMesPagto.Add(qryLoteOuVersaoMesPagto.FieldByName('IDHSTFOLHABENEF').AsString);
        qryLoteOuVersaoMesPagto.Next;
      End;
    End;
  End;
end;

procedure TfrmPRelRendasAlteradas.rdoEscolheTabelaClick(Sender: TObject);
Var
  sMesPagto : String;

begin
  inherited;
  If rdoEscolheTabela.ItemIndex = 0 Then
  Begin
    lbVersaoMesPagto.Caption := 'Lotes de Pagamento';
    If Trim(cmbMesPagto.Text) = '' Then
    Begin
      MsgDlg('Por favor, escolha o mês de pagamento.', 'Informação', mtInformation, [mbOk], 0);
      ModalResult := mrNone;
      Exit;
    End
    Else
    Begin
      If (Trim(speAnoPagto.Text) = '') Or (speAnoPagto.Value = 0) Then
      Begin
        MsgDlg('Por favor, escolha o ano de pagamento.', 'Informação', mtInformation, [mbOk], 0);
        ModalResult := mrNone;
        Exit;
      End;
    End;
    If cmbMesPagto.ItemIndex > 8 Then
      sMesPagto := speAnoPagto.Text+'/'+IntToStr(cmbMesPagto.ItemIndex+1)
    Else
      sMesPagto := speAnoPagto.Text+'/0'+IntToStr(cmbMesPagto.ItemIndex+1);

    qryLoteOuVersaoMesPagto.Close;
    qryLoteOuVersaoMesPagto.SQL.Clear;
    qryLoteOuVersaoMesPagto.SQL.Add(
    ' SELECT '+
      ' IDLOTE, '+
      ' IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+

    ' FROM '+
      ' CTRLINTERFACE '+

    ' WHERE '+
      ' MESREFERENCIA = '+QuotedStr(sMesPagto)+
      ' AND FLGPREPARADO = 1 '+
      ' AND TIPO = ''B'' '+
      ' AND FLGVOLTATMP = 0 '+

    ' ORDER BY '+
      ' IDLOTE DESC ');
    qryLoteOuVersaoMesPagto.Open;
    chklstLoteOuVersaoMesPagto.Clear;
    ListaVersaoMesPagto.Clear;
    While Not qryLoteOuVersaoMesPagto.Eof Do
    Begin
      chklstLoteOuVersaoMesPagto.Items.Add(qryLoteOuVersaoMesPagto.FieldByName('DESCRICAO').AsString);
      chklstLoteOuVersaoMesPagto.ItemIndex := 0;
      ListaVersaoMesPagto.Add(qryLoteOuVersaoMesPagto.FieldByName('IDLOTE').AsString);
      qryLoteOuVersaoMesPagto.Next;
    End;
  End
  Else
  Begin
    lbVersaoMesPagto.Caption := 'Versões de Pagamento';
    If Trim(cmbMesPagto.Text) = '' Then
    Begin
      MsgDlg('Por favor, escolha o mês de pagamento.', 'Informação', mtInformation, [mbOk], 0);
      ModalResult := mrNone;
      Exit;
    End
    Else
    Begin
      If (Trim(speAnoPagto.Text) = '') Or (speAnoPagto.Value = 0) Then
      Begin
        MsgDlg('Por favor, escolha o ano de pagamento.', 'Informação', mtInformation, [mbOk], 0);
        ModalResult := mrNone;
        Exit;
      End;
    End;
    If cmbMesPagto.ItemIndex > 8 Then
      sMesPagto := speAnoPagto.Text+'/'+IntToStr(cmbMesPagto.ItemIndex+1)
    Else
      sMesPagto := speAnoPagto.Text+'/0'+IntToStr(cmbMesPagto.ItemIndex+1);

    qryLoteOuVersaoMesPagto.Close;
    qryLoteOuVersaoMesPagto.SQL.Clear;
    qryLoteOuVersaoMesPagto.SQL.Add(
    ' SELECT '+
      ' IDHSTFOLHABENEF, '+
      ' IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO '+

    ' FROM '+
      ' HSTFOLHABENEF '+

    ' WHERE '+
      ' MESREFERENCIA = '+QuotedStr(sMesPagto)+
      ' AND FLGESTADO <> 2 '+

    ' ORDER BY '+
      ' IDHSTFOLHABENEF DESC ');
    qryLoteOuVersaoMesPagto.Open;
    chklstLoteOuVersaoMesPagto.Clear;
    ListaVersaoMesPagto.Clear;
    While Not qryLoteOuVersaoMesPagto.Eof Do
    Begin
      chklstLoteOuVersaoMesPagto.Items.Add(qryLoteOuVersaoMesPagto.FieldByName('HISTORICO').AsString);
      chklstLoteOuVersaoMesPagto.ItemIndex := 0;
      ListaVersaoMesPagto.Add(qryLoteOuVersaoMesPagto.FieldByName('IDHSTFOLHABENEF').AsString);
      qryLoteOuVersaoMesPagto.Next;
    End;
  End;
end;

procedure TfrmPRelRendasAlteradas.rdtValPercExit(Sender: TObject);
begin
  inherited;
  dValPerc := rdtValPerc.Value;
  dValPerc := dValPerc/100;
end;

procedure TfrmPRelRendasAlteradas.cboTipoFiltroChange(Sender: TObject);
begin
  inherited;
  cboTipoFiltro2.Items.Clear;
  If (cboTipoFiltro.ItemIndex > -1) And (cboTipoFiltro.ItemIndex <> 1) Then
  Begin
    rdtValPerc2.Enabled    := True;
    cboTipoFiltro2.Enabled := True;
    lblFiltro2.Enabled     := True;
    lblPerc2.Enabled       := True;
    Label2.Enabled         := True;
    If cboTipoFiltro.ItemIndex In [2, 3] Then
    Begin
      cboTipoFiltro2.Items.Add('Menor que');
      cboTipoFiltro2.Items.Add('Menor ou Igual que');
    End
    Else
    Begin
      cboTipoFiltro2.Items.Add('Maior que');
      cboTipoFiltro2.Items.Add('Maior ou Igual que');
    End;
  End
  Else
  Begin
    cboTipoFiltro2.Items.Clear;
    rdtValPerc2.Enabled    := False;
    cboTipoFiltro2.Enabled := False;
    lblFiltro2.Enabled     := False;
    lblPerc2.Enabled       := False;
    Label2.Enabled         := False;
  End;
end;

procedure TfrmPRelRendasAlteradas.rdtValPerc2Exit(Sender: TObject);
begin
  inherited;
  dValPerc2 := rdtValPerc2.Value;
  dValPerc2 := dValPerc2/100;
end;

procedure TfrmPRelRendasAlteradas.MontaQuery;
Var
  sOrdena : String;

begin
  dtmRelRendasAlteradas.qryRendasAlteradas.Close;
  dtmRelRendasAlteradas.qryRendasAlteradas.SQL.Clear;
  dtmRelRendasAlteradas.qryRendasAlteradas.SQL.Add(
  ' SELECT '+
    ' E.MATRICULA, '+
    ' PP.INSCRICAONUMERO AS INSCRICAO, '+
    ' TIT.NOME AS TITULAR, '+
    ' BEN.NOME AS BENEFICIARIO, '+
    ' PT.NOME AS PATROCINADORA, '+
    ' PL.NOME AS PLANO, '+
    ' VH1.VALBASE, '+
    ' VH2.VALCORRENTE, '+
    ' ABS(VH2.VALCORRENTE - VH1.VALBASE) AS DIFERENCA, '+
    ' TO_NUMBER(DECODE(VH1.VALBASE, 0, '''', ROUND((VH2.VALCORRENTE - VH1.VALBASE)/VH1.VALBASE * 100, 2))) AS VARIACAO '+
  ' FROM '+
    ' (SELECT '+
       ' H.IDTITULAR, '+
       ' H.IDRESPONSAVEL, '+
       ' H.IDPATRO, '+
       ' H.IDPLANOPREV, ');

  MontaFiltroBase(False);

  dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
     ' FROM '+
       ' HISTRUBSAL H, '+
       ' PROVDESC P '+

     ' WHERE ');

  If pos(',', sVersaoMesBaseSel) = 0 Then
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' H.IDHSTFOLHABENEF = '+sVersaoMesBaseSel+' AND ')
  Else
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' H.IDHSTFOLHABENEF IN ('+sVersaoMesBaseSel+') AND ');

  dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
       ' H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND '+
       ' H.IDMODULO = 18 AND '+
       ' H.IDRUBRICA = P.IDPROVENTO ');

  if rdgVlrPerc.ItemIndex = 2 then
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' AND H.MES = H.MESCOBRANCA ');

  dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
     ' GROUP BY '+
       ' H.IDTITULAR, '+
       ' H.IDRESPONSAVEL, '+
       ' H.IDPATRO, '+
       ' H.IDPLANOPREV) VH1, '+
    ' (SELECT '+
       ' H.IDTITULAR, '+
       ' H.IDRESPONSAVEL, '+
       ' H.IDPATRO, '+
       ' H.IDPLANOPREV, ');

  MontaFiltroBase(True);

  dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(   ' FROM ');

  If rdoEscolheTabela.ItemIndex = 0 Then
  Begin
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' PREVIA H, PROVDESC P WHERE ');
    If pos(',', sVersaoMesPagtoSel) = 0 Then
      dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' H.IDLOTE = '+sVersaoMesPagtoSel+' AND ')
    Else
      dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' H.IDLOTE IN ('+sVersaoMesPagtoSel+') AND ');
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
       ' H.IDLOTE = H.IDLOTE AND '+
       ' H.IDRUBRICA = P.IDPROVENTO ');
  End
  Else
  Begin
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' HISTRUBSAL H, PROVDESC P WHERE ');

    If pos(',', sVersaoMesPagtoSel) = 0 Then
      dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' H.IDHSTFOLHABENEF = '+sVersaoMesPagtoSel+' AND ')
    Else
      dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(' H.IDHSTFOLHABENEF IN ('+sVersaoMesPagtoSel+') AND ');
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
       ' H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND '+
       ' H.IDMODULO = 18 AND '+
       ' H.IDRUBRICA = P.IDPROVENTO ');
  End;

  if rdgVlrPerc.ItemIndex = 2 then
    dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' AND H.MES = H.MESCOBRANCA ');

  dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
     ' GROUP BY '+
       ' H.IDTITULAR, '+
       ' H.IDRESPONSAVEL, '+
       ' H.IDPATRO, '+
       ' H.IDPLANOPREV) VH2, '+
    ' PESSOA PT, '+
    ' PESSOA TIT, '+
    ' PESSOA BEN, '+
    ' PLANPREV PL, '+
    ' ELEGPATRO E, '+
    ' PARTPREVPLAN PP ');

  dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
  ' WHERE '+
    ' VH1.IDTITULAR = VH2.IDTITULAR AND '+
    ' VH1.IDRESPONSAVEL = VH2.IDRESPONSAVEL AND '+
    ' VH1.IDTITULAR = PP.IDPESSOA AND '+
    ' VH1.IDPATRO = PP.IDPESSJUR AND '+
    ' VH1.IDPLANOPREV = PP.IDPLANOPREV AND '+
    ' PP.SEQPROPOSTA = 1 AND '+
    ' PP.FLGDESATIVADO = 0 AND '+
    ' VH1.IDTITULAR = E.IDPESSOA AND '+
    ' VH1.IDPATRO = E.IDPESSJUR AND '+
    ' VH1.IDTITULAR = TIT.IDPESSOA AND '+
    ' VH1.IDRESPONSAVEL = BEN.IDPESSOA AND '+
    ' VH1.IDPATRO = PT.IDPESSOA AND '+
    ' VH1.IDPLANOPREV = PL.IDPLANOPREV AND ');

  MontaFiltroPerc;

  // Se for escolhida uma Patrocinadora ...
  If Trim(cmbPatrocinadora.Text) <> '' Then
    dtmRelRendasAlteradas.qryRendasAlteradas.SQL.Add(' AND PT.IDPESSOA = '+cmbPatrocinadora.LookupValue+' ');

  // Se for escolhido um Plano ...
  If Trim(cmbPlano.Text) <> '' Then
    dtmRelRendasAlteradas.qryRendasAlteradas.SQL.Add(' AND PL.IDPLANOPREV = '+cmbPlano.LookupValue+' ');

  if rdgOrdena.ItemIndex = 0 then
    sOrdena := ' DIFERENCA ASC '
  else
    sOrdena := ' DIFERENCA DESC ';

  dtmRelRendasAlteradas.qryRendasAlteradas.SQL.Add(
  ' ORDER BY '+
    ' PT.IDPESSOA, PL.IDPLANOPREV, '+ sOrdena + ', PP.INSCRICAONUMERO ');

end;

procedure TfrmPRelRendasAlteradas.MontaFiltroPerc;
begin
  Case cboTipoFiltro.ItemIndex Of
    0: Begin
         dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' ABS(VH2.VALCORRENTE - VH1.VALBASE) <> ('+OraNumero(FloatToStr(dValPerc))+'*VH1.VALBASE) ');
         If cboTipoFiltro2.ItemIndex > -1 Then
         Begin
           If cboTipoFiltro2.ItemIndex = 0 Then
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  > ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ')
           Else
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  >= ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ');
         End;
       End;

    1: dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
       ' ABS(VH2.VALCORRENTE - VH1.VALBASE)  = ('+OraNumero(FloatToStr(dValPerc))+'*VH1.VALBASE) ');

    2: Begin
         dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' ABS(VH2.VALCORRENTE - VH1.VALBASE)  > ('+OraNumero(FloatToStr(dValPerc))+'*VH1.VALBASE) ');
         If cboTipoFiltro2.ItemIndex > -1 Then
         Begin
           If cboTipoFiltro2.ItemIndex = 0 Then
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  < ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ')
           Else
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  <= ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ');
         End;
       End;

    3: Begin
         dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' ABS(VH2.VALCORRENTE - VH1.VALBASE) >= ('+OraNumero(FloatToStr(dValPerc))+'*VH1.VALBASE) ');
         If cboTipoFiltro2.ItemIndex > -1 Then
         Begin
           If cboTipoFiltro2.ItemIndex = 0 Then
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  < ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ')
           Else
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  <= ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ');
         End;
       End;

    4: Begin
         dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' ABS(VH2.VALCORRENTE - VH1.VALBASE)  < ('+OraNumero(FloatToStr(dValPerc))+'*VH1.VALBASE) ');
         If cboTipoFiltro2.ItemIndex > -1 Then
         Begin
           If cboTipoFiltro2.ItemIndex = 0 Then
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  > ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ')
           Else
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  >= ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ');
         End;
       End;

    5: Begin
         dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
         ' ABS(VH2.VALCORRENTE - VH1.VALBASE) <= ('+OraNumero(FloatToStr(dValPerc))+'*VH1.VALBASE) ');
         If cboTipoFiltro2.ItemIndex > -1 Then
         Begin
           If cboTipoFiltro2.ItemIndex = 0 Then
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  > ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ')
           Else
             dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' AND ABS(VH2.VALCORRENTE - VH1.VALBASE)  >= ('+OraNumero(FloatToStr(dValPerc2))+'*VH1.VALBASE) ');
         End;
       End;
  End;
end;

procedure TfrmPRelRendasAlteradas.MontaFiltroBase(pbVlrCorrente : Boolean);
begin
  if not pbVlrCorrente then
  begin
    case rdgVlrPerc.ItemIndex of
      0    : dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' SUM(DECODE(P.FLGDESCONTO, 0, DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0))) VALBASE ');

      1, 2 : dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' SUM(DECODE(P.FLGDESCONTO, 0, DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0), '+
             ' DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))) VALBASE ');

    end;
  end
  else
  begin
    case rdgVlrPerc.ItemIndex of
      0    : dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' SUM(DECODE(P.FLGDESCONTO, 0, DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0))) VALCORRENTE ');

      1, 2 : dtmRelRendasAlteradas.qryRendasAlteradas.Sql.Add(
             ' SUM(DECODE(P.FLGDESCONTO, 0, DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0), '+
             ' DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))) VALCORRENTE ');

    end;
  end;
end;

end.
