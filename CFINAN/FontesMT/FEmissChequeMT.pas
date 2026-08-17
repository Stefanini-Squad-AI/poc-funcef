Unit FEmissChequeMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, Db, DBTables, Wwquery, MAHlpBtn, uCtrlParamIntegra,
  Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro, TREdit,
  IvDictio, IvMulti, IvEMulti, ComPort, uImprimeCheque, uCtrlCheque,
  ComCtrls, Machklb, uRad, uExtensoCM, uGImp, Fselversoch,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCmSqlParams, uCtrlEmissCheque;

Type
  TFrmEmissChequeMT = Class(TfrmOkCancelar)
    dsLotePagto: TDataSource;
    Panel3: TPanel;
    Panel1: TPanel;
    FormaPag: TLabel;
    Label1: TLabel;
    dblkFormaPag: TwwDBLookupCombo;
    ClCheques: TCMchklistbox;
    Panel2: TPanel;
    SbAdTodos: TSpeedButton;
    SbAdInverte: TSpeedButton;
    Panel4: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    DtEmis: TCMDateTimePicker;
    edtNumChq: TRealEdit;
    CkData: TCheckBox;
    EdtLocalEmissCheque: TEdit;
    CkbMaquina: TCheckBox;
    GpMaqCheque: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    CmbModelo: TComboBox;
    ComboBoxDeviceName: TComboBox;
    Extenso: TExtensoCM;
    CmCheque: TCmImprimeCheque;
    GImp1: TGImp;
    CkbVersoCheque: TCheckBox;
    Sql: TCMSqlParams;
    Cds: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    CdsFormaRecPag: TCMClientDataSet;
    SqlFormaRecPag: TCMSqlParams;
    CdsLotePagto: TCMClientDataSet;
    SqlLotePagto: TCMSqlParams;
    CdsParamChq: TCMClientDataSet;
    SqlParamChq: TCMSqlParams;
    CdsUltCheque: TCMClientDataSet;
    SqlUltCheque: TCMSqlParams;
    CdsDocsLote: TCMClientDataSet;
    SqlDocsLote: TCMSqlParams;
    CdsCheque: TCMClientDataSet;
    SqlCheque: TCMSqlParams;
    Procedure FormActivate(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure bbtnSairClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    Procedure CkDataClick(Sender: TObject);
    Procedure CkbMaquinaClick(Sender: TObject);
    Procedure CmbModeloChange(Sender: TObject);
    Procedure ComboBoxDeviceNameChange(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure SbAdTodosClick(Sender: TObject);
    Procedure SbAdInverteClick(Sender: TObject);
    Procedure dblkFormaPagChange(Sender: TObject);
  private
    { Private declarations }
    sSql, sNumLoteChecked: String;
    bRepeteImpressao, bdestinase, bdocto, bdtprog, bvalor, bforn,
      bhist, blocal: Boolean;
    CtrlChequeEmis: TCtrlCheque;
    sCodPortadorForma: String;
    CtrlEmissCheque: TCtrlEmissCheque;
    Procedure GravaEmissao;
    Procedure ImprimeChequeConfig;
    Function ImprimeChequeMac: Boolean;
    Function ImprimeVersoChequeConfig: Boolean;
    Procedure MontaCheque;
  public
    { Public declarations }
  End;
Var
  FrmEmissChequeMT: TFrmEmissChequeMT;

Implementation

Uses uSistema, dBaseDados, uModulo, UCheqBloq, uDataBase, uLancFinanc,
  uLancContab, fMensVersoCheque, uString;

{$R *.DFM}

Procedure TFrmEmissChequeMT.FormActivate(Sender: TObject);
Var
  Ssql: String;
Begin
  Inherited;

  Sql.Sql.Text := 'SELECT IDTEMPLCHEQUE,LAYOUT, QTDEDIGITOSANO FROM TEMPLCHEQUE';
  Sql.Open;

  If CdsFormaRecPag.Active Then
    CdsFormaRecPag.Close;
  If Not SqlFormaRecPag.Prepared Then
    SqlFormaRecPag.Prepare;
  SqlFormaRecPag.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  SqlFormaRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaRecPag.Open;

  {Pega o PORTADOR FORMA informado na tela de Parâmetros do Sistema
   Fábio Barros - 05/04/2002}
  dblkFormaPag.LookupValue := sCodPortadorForma;
  dblkFormaPagChange(self);

  If CdsLotePagto.Active Then
    CdsLotePagto.Close;
  sSQL := ' WHERE ((FLAGEMISSAO IS NULL) OR (FLAGEMISSAO = ''0'')) AND ' +
    ' ((FLAGCANCEL IS NULL) OR (FLAGCANCEL = ''0'')) AND ' +
    ' (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ' +
    ' (LOTEPAGTO.IDPESSOA = ' + InttoStr(sistema.IdEmpresa) + ') AND ' +
    ' (LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE) AND ' +
    ' (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO) AND ' +
    ' (DOC.RECPAG         = ''' + ParamIntegra.RecPag + ''') AND ' +
    ' (PAR.IDPESSOA = LOTEPAGTO.IDPESSOA) AND ' +
    ' (PESS.IDPESSOA = LOTEPAGTO.IDPESSOA) AND ' +
    ' (PORTADORFORMA.IDTEMPLCHEQUE = CHEQUE.IDTEMPLCHEQUE) AND ';

  If Trim(dblkFormaPag.text) <> '' Then
    sSQL := sSQL + ' (LOTEPAGTO.CODPORTFORMA  = ' + dblkFormaPag.LookupValue + ')  AND '
  Else
    sSQL := sSQL + ' (LOTEPAGTO.CODPORTFORMA  = -1) AND ';

  If sSQL <> '' Then
    sSQL := Copy(sSQL, 1, Length(sSQL) - 5);

  SqlLotePagto.Sql.clear;
  SqlLotePagto.SQL.Text := ' SELECT distinct LOTEPAGTO.NUMLOTE,LOTEPAGTO.CODPORTFORMA,DESCRICAO,   ' +
    ' LOTEPAGTO.FAVORECIDO,Par.LOCALEMISCHEQUE,PESS.NOME              ' +
    ' FROM LotePagto, LOTEXDOCUM LOTEX, DOCUMENTO DOC, PESSOA PESS, PARAMCAP PAR,' +
    ' TEMPLCHEQUE CHEQUE, PortadorForma ' +
    sSql + ' ORDER BY NUMLOTE' + '';
  SqlLotePagto.Open;
End;

Function TFrmEmissChequeMT.ImprimeVersoChequeConfig: boolean;
Var
  sData: String;
  x, i: Integer;
Begin
  Result := False;
  Try
    If CkbVersoCheque.Checked Then
    Begin
      If Application.MessageBox('Vire o formulário para impressão de verso de ' +
        'cheque e posicione no primeiro cheque impresso',
        'Aguardando Comando...',
        Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
        Abort
      Else
      Begin
        CdsCheque.first;
        If GImp1.Inicializar Then
        Begin
          GImp1.Condensado := (CdsFormaRecPag.FieldByName('FLGIMPCONDENSADO').AsString = 'S');
          While Not CdsCheque.eof Do
          Begin
            If CkData.Checked Then
              sData := CdsCheque.FieldByName('DataEmissao').AsString
            Else
              sData := DtEmis.Text;
            If CdsDocsLote.Active Then
              CdsDocsLote.Close;
            If Not SqlDocsLote.Prepared Then
              SqlDocsLote.Prepare;
            SqlDocsLote.ParamByName('NUMLOTE').AsFloat := CdsCheque.FieldByName('NUMLOTE').AsFloat;
            SqlDocsLote.Open;
            If Not CdsDocsLote.IsEmpty Then
            Begin
              Try
                GImp1.ImprimirTexto(' ');
                GImp1.ImprimirTexto(' ');
                GImp1.ImprimirTexto('Destina-se este cheque para:');
                GImp1.ImprimirTexto(' ');
                CdsDocsLote.First;
                While Not CdsDocsLote.Eof Do
                Begin
                  GImp1.ImprimirTexto(
                    'Nº ' + FormatFloat('###,###,###,###,###,###,###',
                    CdsDocsLote.FieldByName('NODOCUMENTO').AsFloat) +
                    ' ' + Trim(CdsDocsLote.FieldByName('COMPLDOCUMENTO').AsString) +
                    ' de ' + CdsDocsLote.FieldByName('DATAPROGRAMADA').AsString + ' valor: ' +
                    FormatFloat('#,##0.00', Abs(CdsDocsLote.FieldByName('VALOR').AsFloat)));

                  GImp1.ImprimirTexto(' para: ' + CdsDocsLote.FieldByName('FORNECEDOR').AsString +
                    ' ' + CdsDocsLote.FieldByName('HISTORICOCOMPL').AsString);

                  CdsDocsLote.Next;
                End; // while
                GImp1.ImprimirTexto('');
                GImp1.ImprimirTexto(EdtLocalEmissCheque.Text + ', ' +
                  FormatDateTime('d "de" mmmm "de" yyyy', StrToDate(sData)) + '.');
                GImp1.ImprimirTexto('');
                If GImp1.Condensado Then
                  x := 19
                Else
                  x := 18;
                x := x - 9;
                For i := 1 To x Do
                  GImp1.ImprimirTexto('');

              Except
                GImp1.Finalizar;
                //frmMensVersoCheque.Free;
              End;
            End; //
            CdsCheque.next;
          End;
          GImp1.Finalizar;
        End;
      End; //messagebox
    End
    Else
      Abort;
  Except
    Result := False
  End;
End;

Procedure TFrmEmissChequeMT.bbtnConfirmarClick(Sender: TObject);
Var
  INumCheques, X, iNumChequeTeste: Integer;
Begin
  Inherited;
  If EdtLocalEmissCheque.Text = '' Then
  Begin
    Msgdlg('Indique o local de emissão do cheque', 'Aviso', mterror, [mbOk], 0);
    EdtLocalEmissCheque.SetFocus;
    Exit;
  End;

  If dblkFormaPag.Text = '' Then
  Begin
    Msgdlg('Indique a forma de pagamento', 'Aviso', mterror, [mbOk], 0);
    dblkFormaPag.SetFocus;
    Exit;
  End;

  If edtNumChq.Value = 0 Then
  Begin
    Msgdlg('Entre com o Número do Cheque', 'Aviso', mterror, [mbOk], 0);
    edtNumChq.setfocus;
    exit;
  End;

  If (DtEmis.text = '') And (Not CkData.Checked) Then
  Begin
    Msgdlg('Favor Indicar a data de emissão', 'Aviso', mterror, [mbOk], 0);
    edtNumChq.setfocus;
    exit;
  End;

  sNumLoteChecked := '';
  For X := 0 To ClCheques.Items.Count - 1 Do
  Begin
    If ClCheques.Selected[x] And Modulo.ProcessoRadLiberado(StrToInt(ClCheques.Items[x])) Then
      sNumLoteChecked := sNumLoteChecked + ClCheques.Items[x] + ','
    Else
      ClCheques.Selected[x] := False;
  End;

  If sNumLoteChecked = '' Then
  Begin
    Msgdlg('Não existem lotes selecionados para emissão', 'Aviso', mterror, [mbOk], 0);
    exit;
  End
  Else
    sNumLoteChecked := Copy(sNumLoteChecked, 1, Length(sNumLoteChecked) - 1);

  If Cds.Active Then
    Cds.Close;
  With Sql Do
  Begin
    SQL.Text :=
      'SELECT COUNT(LOTP.NUMLOTE) AS NUMCHQ ' +
      'FROM LOTEPAGTO LOTP ' +
      'WHERE ' +
      ' (LOTP.IDPESSOA = ' + IntToStr((sistema.idEmpresa)) + ') AND ' +
      ' (LOTP.NUMLOTE IN (' + sNumLoteChecked + ')) AND' +
      ' (LOTP.CODPORTFORMA = ' + dblkFormaPag.lookupValue + ') AND ' +
      ' ((LOTP.FLAGEMISSAO = ''0'') OR (LOTP.FLAGEMISSAO IS NULL)) AND ' +
      ' ((LOTP.FLAGCANCEL = ''0'') OR (LOTP.FLAGCANCEL IS NULL))';
    Open;
  End;
  INumCheques := Cds.FieldByName('NUMCHQ').AsInteger;
  Cds.Close;
  iNumChequeTeste := Round(edtNumChq.Value);

  If (Modulo.ControlaEmisCheque) Or
    ((Not Modulo.ControlaEmisCheque) And (CdsFormaRecPag.FieldByName('FLGCONTROLACHEQUE').AsString = 'S')) Then
  Begin
    CtrlChequeEmis.ValidaPrimeiroCheque := True;
    For X := 1 To INumCheques Do
    Begin
      CtrlChequeEmis.MostraMsg := True;
      CtrlChequeEmis.VerificaChq := True;
      CtrlChequeEmis.CodPortador := CdsFormaRecPag.FieldByName('CODPORTADOR').AsInteger;
      CtrlChequeEmis.NumCheque := iNumChequeTeste;
      CtrlChequeEmis.GravaNumChq := False;
      If Not CtrlChequeEmis.ValidaNumCheque Then
        Exit;
      Inc(iNumChequeTeste);
    End;
  End;

  Try
    Screen.Cursor := CrHourGlass;
    MontaCheque;
    If Not CdsCheque.IsEmpty Then
    Begin
      If CkbMaquina.Checked Then
      Begin
        If Not ImprimeChequeMac Then
        Begin
          Msgdlg('A impressão foi cancelada', 'Aviso', mterror, [mbOk], 0);
          Abort;
        End;
        GravaEmissao;
      End
      Else
      Begin
        ImprimeChequeConfig;
        GravaEmissao;
        If Not bRepeteImpressao Then
        Begin
          ImprimeVersoChequeConfig;
        End;
      End;
    End
    Else
      Msgdlg('Não existe cheque para ser impresso', 'Aviso', mterror, [mbOk], 0);
  Except
    Raise;
  End;
  dblkFormaPag.LookupValue := sCodPortadorForma;
  dblkFormaPagChange(self);
  Screen.Cursor := CrDefault;
End;

Procedure TFrmEmissChequeMT.MontaCheque;
Begin
  If CdsCheque.Active Then
    CdsCheque.Close;
  SqlCheque.Sql.Text :=
    'SELECT LotD.NUMLOTE, Sum(LotD.VALOR) AS VALOR,' +
    '       LotP.FAVORECIDO, Par.LOCALEMISCHEQUE,' +
    '       LotP.DATAEMISSAO, Bc.NUMBANCO,' +
    '       LotP.DATADIFERIDO ' +
    'FROM LotexDocum LotD, ' +
    '     LotePagto LotP, ' +
    '     PORTADORFORMA Pf, ' +
    '     PORTADORCONTA Pc, ' +
    '     BANCO Bc, ' +
    '     PARAMCAP Par ' +
    'WHERE ' +
    '    (LotP.IDPESSOA = ' + inttostr(sistema.idEmpresa) + ') AND ' +
    '    (lotP.codportforma = ' + dblkFormaPag.LookUpValue + ') AND ' +
    '    (LotP.NUMLOTE IN (' + sNumLoteChecked + ')) AND ' +
    '    ((LotP.FLAGEMISSAO IS NULL) OR (LotP.FLAGEMISSAO = ''0'')) AND ' +
    '    ((LotP.FLAGCANCEL IS NULL) OR (LotP.FLAGCANCEL = ''0'')) AND ' +
    '    (Par.RECPAG = ''' + ParamIntegra.RecPag + ''') AND ' +
    '    (Par.IDPESSOA = LotP.IDPESSOA) AND ' +
    '    (LotD.NUMLOTE = LotP.NUMLOTE) AND ' +
    '    (LotP.CODPORTFORMA = Pf.CODPORTFORMA) AND ' +
    '    (PF.CODPORTADOR = Pc.CODPORTADOR) AND ' +
    '    (Pc.IDBANCO = Bc.IDPESSOA) ' +
    'GROUP BY ' +
    '      LotD.NUMLOTE, ' +
    '      LotP.FAVORECIDO, ' +
    '      Par.LOCALEMISCHEQUE, ' +
    '      LotP.DataEmissao, ' +
    '      Bc.NUMBANCO, ' +
    '      Lotp.DataDiferido ' +
    'ORDER BY LotD.NUMLOTE ';
  SqlCheque.Open;
End;

Procedure TFrmEmissChequeMT.ImprimeChequeConfig;
Var
  svalor, sData: String;
  CheqBloqCM: TCheqBloqCM;
Begin
  CheqBloqCM := TCheqBloqCM.Create(Modulo.ImpressoraDefault, Modulo.ModeloImpressora);
  Try
    CheqBloqCM.NumBloqChqSaltoLinha := CdsFormaRecPag.FieldByName('NUMCHQSALTO').AsInteger;
    CheqBloqCM.NumLinhasSalto := CdsFormaRecPag.FieldByName('NUMLINHASSALTO').AsInteger;
    If CheqBloqCM.InicializaImpressora('Emissão de Cheques') Then
    Begin
      CheqBloqCM.FonteCondensada := (CdsFormaRecPag.FieldByName('FLGIMPCONDENSADO').AsString = 'S');
      CdsCheque.First;
      While Not CdsCheque.eof Do
      Begin
        If CkData.Checked Then
          sData := CdsCheque.FieldByName('DataEmissao').AsString
        Else
          sData := DtEmis.Text;
        svalor := FormatFloat('#,##0.00', CdsCheque.FieldByName('VALOR').AsFloat);
        Extenso.Valor := CdsCheque.FieldByName('VALOR').AsFloat;
        If Sistema.IdiomaAtivo = 2 Then
        Begin
          Extenso.DescricaoMoeda.Singular := '';
          Extenso.DescricaoMoeda.Plural := '';
        End
        Else
          Extenso.SetaMoedaPadrao;
        Extenso.SetaIdiomaPadrao;
        Extenso.Escreve;
        CheqBloqCM.IdTemplCheque := CdsFormaRecPag.FieldByName('idTemplCheque').AsInteger;
        CheqBloqCM.CompAno := CdsFormaRecPag.FieldByName('QTDEDIGITOSANO').AsInteger;
        CheqBloqCM.Valor := CheqBloqCM.CompletaValorCheque(svalor, 15);
        CheqBloqCM.Extenso := Extenso.Extenso;
        CheqBloqCM.Portador := CdsCheque.FieldByName('FAVORECIDO').asstring;
        CheqBloqCM.Local := EdtLocalEmissCheque.Text;
        CheqBloqCM.Data := StrToDate(sData);
        If Not CdsCheque.FieldByName('DATADIFERIDO').IsNull Then
        Begin
          CheqBloqCM.LocalDiferido := EdtLocalEmissCheque.Text;
          CheqBloqCM.DataDiferido := CdsCheque.FieldByName('DATADIFERIDO').AsDateTime;
        End
        Else
          CheqBloqCM.LocalDiferido := '';
        If Not CheqBloqCM.GeraCheque Then
          abort;
        CdsCheque.next;
      End;
      CheqBloqCM.Imprime;
    End;
  Finally
    CheqBloqCM.Free;
  End;
End;

Procedure TFrmEmissChequeMT.GravaEmissao;
Var
  sDtEmis: String;
Begin
  If MsgDlg('Os cheques foram impressos corretamente ?',
    'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
  Begin
    bRepeteImpressao := False;

    If CkData.Checked Then
      sDtEmis := DtEmis.Text;
    if not CtrlEmissCheque.GravaEmissao(CdsCheque.Data, ParamIntegra.RecPag,
      ParamIntegra.IntegraFinanceiro,
      EdtNumChq.Value,
      Sistema.IdEmpresa,
      StrToFloat(dblkFormaPag.LookupValue),
      CdsFormaRecPag.FieldByName('LancaFinanc').AsString,
      sNumLoteChecked,
      sDtEmis,
      Modulo.ControlaEmisCheque,
      CdsFormaRecPag.FieldByName('FLGCONTROLACHEQUE').AsString,
      cdsFormaRecPag.FieldByName('FLGCONTABEMISCHQ').AsString,
      CdsFormaRecPag.FieldByName('CODCENTROCUSTO').AsString,
      CdsFormaRecPag.FieldByName('PLACONTACONTABCHQ').AsString,
      CdsFormaRecPag.FieldByName('CODSUBCONTA').AsString,
      CdsFormaRecPag.FieldByName('PLACONTA').AsString,
      CdsFormaRecPag.FieldByName('DMAIS').AsInteger,
      ParamIntegra.IntegraContab,
      Sistema.IdModulo,
      Sistema.IdUsuario,
      ParamIntegra.Plano,
      ParamIntegra.uNidNegoc,
      Sistema.UsaPlanoPatro,
      bdestinase,
      bdocto,
      bdtprog,
      bvalor,
      bforn,
      bhist,
      blocal) then
      MsgDlg(CtrlEmissCheque.MessageInfo, 'Erro', mtError, [mbOK], 0);
  End
  Else
    bRepeteImpressao := True;
End;

Procedure TFrmEmissChequeMT.bbtnCancelarClick(Sender: TObject);
Begin
  Inherited;
  ClCheques.Items.Clear;
  dblkFormaPag.Clear;
End;

Procedure TFrmEmissChequeMT.bbtnSairClick(Sender: TObject);
Begin
  Inherited;
  bRepeteImpressao := False;
End;

Procedure TFrmEmissChequeMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlEmissCheque := TCtrlEmissCheque.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.idUsuario, true);
  CtrlEmissCheque.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  //  CtrlEmissCheque.cds := cds;

  SqlParamChq.SQL.Clear;
  SqlParamChq.SQL.Add('select flgdestinase ,     flgdocto   ,     flgdtprog   ,');
  SqlParamChq.SQL.Add(' flgvalor   , flgforn ,  flghist   ,  flglocal, CodPortForma  from paramcap ');
  SqlParamChq.SQL.Add(' where recpag=''P'' and idpessoa=' + inttostr(sistema.idempresa));
  SqlParamChq.Open;

  sCodPortadorForma := CdsParamChq.FieldByName('CodPortForma').AsString;

  bdestinase := CdsParamChq.FieldByName('flgdestinase').AsInteger = 0;
  bdocto := CdsParamChq.FieldByName('flgdocto').AsInteger = 0;
  bdtprog := CdsParamChq.FieldByName('flgdtprog').AsInteger = 0;
  bvalor := CdsParamChq.FieldByName('flgvalor').AsInteger = 0;
  bforn := CdsParamChq.FieldByName('flgforn').AsInteger = 0;
  bhist := CdsParamChq.FieldByName('flghist').AsInteger = 0;
  blocal := CdsParamChq.FieldByName('flglocal').AsInteger = 0;

  CdsParamChq.close;

  CtrlChequeEmis := TCtrlCheque.Create;

  DtEmis.Date := Date;
  bRepeteImpressao := False;

  SqlAux.SQL.Text := 'SELECT LOCALEMISCHEQUE FROM PARAMCAP WHERE IDPESSOA = ' +
    IntToStr(Sistema.IdEmpresa) + ' AND RECPAG = ''' + ParamIntegra.RecPag + '''';
  SqlAux.Open;
  If Not CdsAux.IsEmPty Then
    EdtLocalEmissCheque.Text := CdsAux.Fields[0].AsString;
  CdsAux.Close;

  CmbModelo.Items.Text := CmCheque.ModelosImpressoras;
  CmbModelo.ItemIndex := 0;
  ComboBoxDeviceName.ItemIndex := 0;
  CmCheque.DeviceName := ComboBoxDeviceName.Text;

  CmCheque.BaudRate := br9600;
  CmCheque.DataBits := db8;
  CmCheque.DeviceName := 'COM1';
  CmCheque.Parity := paNone;
  CmCheque.StopBits := sb1;
End;

Procedure TFrmEmissChequeMT.FormCloseQuery(Sender: TObject;
  Var CanClose: Boolean);
Begin
  Inherited;
  Canclose := Not bRepeteImpressao;
End;

Procedure TFrmEmissChequeMT.CkDataClick(Sender: TObject);
Begin
  Inherited;
  DtEmis.Enabled := Not CkData.Checked;
End;

Procedure TFrmEmissChequeMT.CkbMaquinaClick(Sender: TObject);
Begin
  Inherited;
  GpMaqCheque.Enabled := CkbMaquina.Checked;
End;

Procedure TFrmEmissChequeMT.CmbModeloChange(Sender: TObject);
Begin
  Inherited;
  Case CmbModelo.ItemIndex Of
    0: CmCheque.NomeImpressora := niChronos_ACC100;
    1: CmCheque.NomeImpressora := niChronos_ACC300;
  End;
End;

Function TFrmEmissChequeMT.ImprimeChequeMac: Boolean;
Var
  sData,
    sValor,
    sMsg: String;
  sLinhasCheque: Array[0..15] Of String;
  X,
    iTotLinhas: Integer;
Begin
  Try
    Result := True;
    CdsCheque.First;
    While Not CdsCheque.eof Do
    Begin
      If Application.MessageBox('Prepare a impressora, insira o novo cheque e confirme',
        'Aguardando Comando...', Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
        Abort;

      If CdsCheque.FieldByName('NUMBANCO').IsNull Then
      Begin
        Msgdlg('O número do banco tem que estar preenchido', 'Aviso', mterror, [mbOk], 0);
        Abort;
      End;

      If CkData.Checked Then
        sData := CdsCheque.FieldByName('DataEmissao').AsString
      Else
        sData := DtEmis.Text;

      sValor := Trim(FloatToStrF(CdsCheque.FieldByName('VALOR').AsFloat, ffnumber, 17, 2));
      While Pos('.', sValor) <> 0 Do
        Delete(sValor, Pos('.', sValor), 1);
      Frmselversoch := Nil;
      If CmCheque.Inicializar Then
      Begin
        CmCheque.Valor := sValor;
        CmCheque.Favorecido := CdsCheque.FieldByName('FAVORECIDO').AsString;
        CmCheque.Localidade := EdtLocalEmissCheque.Text;
        CmCheque.Data := Copy(sData, 1, 6) + Copy(sData, 9, 2);
        CmCheque.CodBanco := CdsCheque.FieldByName('NUMBANCO').AsString;
        CmCheque.Imprime;
        If CkbVersoCheque.Checked Then
        Begin
          If Application.MessageBox('Insira o cheque para impressão do verso confirme',
            'Aguardando Comando...', Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
            Abort
          Else
          Begin
            If CdsDocsLote.Active Then
              CdsDocsLote.Close;

            If Not SqlDocsLote.Prepared Then
              SqlDocsLote.Prepare;

            CdsDocsLote.ParamByName('NUMLOTE').AsFloat := CdsCheque.FieldByName('NUMLOTE').AsFloat;
            CdsDocsLote.Open;

            If Not CdsDocsLote.IsEmpty Then
            Begin
              Try
                Application.CreateForm(TfrmMensVersoCheque, frmMensVersoCheque);
                Application.CreateForm(TFrmselversoch, Frmselversoch);
                For X := 0 To 15 Do
                  sLinhasCheque[x] := '';
                FrmMensVersoCheque.MemVersoCheque.Clear;

                Frmselversoch.chkdestinase.checked := bdestinase;
                Frmselversoch.chkdocto.checked := bdocto;
                Frmselversoch.chkdtprog.checked := bdtprog;
                Frmselversoch.chkvalor.checked := bvalor;
                Frmselversoch.chkforn.checked := bforn;
                Frmselversoch.chklocal.checked := blocal;
                Frmselversoch.chkhist.checked := bhist;

                Frmselversoch.ShowModal;
                bdestinase := Frmselversoch.chkdestinase.checked;
                bdocto := Frmselversoch.chkdocto.checked;
                bdtprog := Frmselversoch.chkdtprog.checked;
                bvalor := Frmselversoch.chkvalor.checked;
                bforn := Frmselversoch.chkforn.checked;
                blocal := Frmselversoch.chklocal.checked;
                bhist := Frmselversoch.chkhist.checked;

                If Frmselversoch.chkdestinase.checked Then
                  frmMensVersoCheque.MemVersoCheque.Lines.Add('Destina-se este cheque para:');
                If Not Frmselversoch.ChkDestinase.Checked Then
                Begin
                  X := 1;
                  CdsDocsLote.First;
                  While Not CdsDocsLote.Eof Do
                  Begin
                    smsg := '';

                    // numero do documento
                    If Frmselversoch.chkdocto.checked Then
                      smsg := 'Nº ' +
                        FormatFloat('###,###,###,###,###,###,###',
                        CdsDocsLote.FieldByName('NODOCUMENTO').AsFloat) +
                        ' ' + Trim(CdsDocsLote.FieldByName('COMPLDOCUMENTO').AsString);

                    // data programada
                    If Frmselversoch.chkdtprog.checked Then
                      smsg := smsg + ' de ' + CdsDocsLote.FieldByName('DATAPROGRAMADA').AsString;

                    // valor
                    If Frmselversoch.chkvalor.checked Then
                      smsg := smsg + ' valor: ' +
                        FormatFloat('#,##0.00', Abs(CdsDocsLote.FieldByName('VALOR').AsFloat));

                    // adicione ao verso do cheque
                    If trim(smsg) <> '' Then
                      frmMensVersoCheque.MemVersoCheque.Lines.Add(smsg);

                    smsg := '';

                    // fornecedor
                    If Frmselversoch.chkforn.checked Then
                      smsg := ' para: ' + CdsDocsLote.FieldByName('FORNECEDOR').AsString;

                    // historico
                    If Frmselversoch.chkhist.checked Then
                      smsg := smsg + ' ' + CdsDocsLote.FieldByName('HISTORICOCOMPL').AsString;

                    // adicione ao verso do cheque
                    If trim(smsg) <> '' Then
                      frmMensVersoCheque.MemVersoCheque.Lines.Add(smsg);

                    Inc(X);

                    // _^o^_ - verso cheque avisar
                    // maximo de 13 documentos por verso do cheque
                    If X = 13 Then
                    Begin
                      If Application.MessageBox('Fornecedores não caberâo no verso do cheque.',
                        'Aguardando Comando...', Mb_IconInformation + Mb_OkCancel) = Id_Cancel Then
                      Begin
                        Abort;
                      End
                      Else
                      Begin
                        CdsDocsLote.Last;
                      End;
                    End
                    Else
                      CdsDocsLote.Next;
                  End;
                  // -----------------------------------------------------------------------------
                                    // local de emissao
                  If Frmselversoch.chklocal.checked Then
                  Begin
                    frmMensVersoCheque.MemVersoCheque.Lines.Add('');
                    frmMensVersoCheque.MemVersoCheque.Lines.Add(
                      EdtLocalEmissCheque.Text +
                      ', ' +
                      FormatDateTime('d "de" mmmm "de" yyyy', StrToDate(sData)));
                  End;
                  frmMensVersoCheque.MemVersoCheque.Lines.Add('');
                End;

                If (frmMensVersoCheque.ShowModal = MrOk) Then
                Begin
                  iTotLinhas := frmMensVersoCheque.MemVersoCheque.Lines.Count - 1;
                  // _^o^_ - verso cheque avisar
                  If iTotLinhas > 15 Then
                    iTotLinhas := 15;
                  // dezesseis linhas
                  For X := 0 To iTotLinhas Do
                  Begin
                    If Trim(frmMensVersoCheque.MemVersoCheque.Lines[x]) = '' Then
                      sLinhasCheque[x] := '.'
                    Else
                      sLinhasCheque[x] :=
                        Espaco(' ', 10) +
                        frmMensVersoCheque.MemVersoCheque.Lines[x];
                  End;
                  CmCheque.ImprimeVerso(sLinhasCheque);
                End;
              Except
              End;
            End;
          End;
        End;
      End
      Else
        Abort;
      CdsCheque.next;
    End;
  Except
    Result := False
  End;
End;

Procedure TFrmEmissChequeMT.ComboBoxDeviceNameChange(Sender: TObject);
Begin
  Inherited;
  CmCheque.DeviceName := ComboBoxDeviceName.Text;
End;

Procedure TFrmEmissChequeMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  CtrlChequeEmis.Free;
End;

Procedure TFrmEmissChequeMT.SbAdTodosClick(Sender: TObject);
Var
  X: Integer;
Begin
  Inherited;
  For X := 0 To ClCheques.Items.Count - 1 Do
    ClCheques.Selected[x] := True;
End;

Procedure TFrmEmissChequeMT.SbAdInverteClick(Sender: TObject);
Var
  X: Integer;
Begin
  Inherited;
  For X := 0 To ClCheques.Items.Count - 1 Do
    ClCheques.Selected[x] := Not ClCheques.Selected[x];
End;

Procedure TFrmEmissChequeMT.dblkFormaPagChange(Sender: TObject);
Begin
  Inherited;

  // -----------------------------------------------------------------------------
  // Pega o número do último cheque. Fábio Barros - 05/04/2002
  // -----------------------------------------------------------------------------
  If CdsUltCheque.Active Then
    CdsUltCheque.Close;
  With SqlUltCheque Do
  Begin
    Prepare;
    ParamByName('pCODPORTADOR').AsFloat := CdsFormaRecPag.FieldByName('CODPORTADOR').AsFloat;
    Open;
    edtNumChq.Value := 0;
  End;
  With CdsUltCheque Do
  Begin
    While Not EOF Do
    Begin
      If FieldByName('NUMPROXIMOCHEQUE').AsFloat < FieldByName('NUMCHEQUEFINAL').AsFloat Then
      Begin
        edtNumChq.Value := FieldByName('NUMPROXIMOCHEQUE').AsFloat;
        Break;
      End;
      Next;
    End;
  End;
  // -----------------------------------------------------------------------------

  If Trim(dblkFormaPag.Text) = '' Then
    Exit;

  If CdsLotePagto.Active Then
    CdsLotePagto.Close;
  SqlLotePagto.SQL.Clear;
  sSql := '';
  sSQL := sSQL + ' WHERE ((FLAGEMISSAO IS NULL) OR (FLAGEMISSAO = ''0'')) AND ';
  sSQL := sSQL + '       ((FLAGCANCEL IS NULL) OR (FLAGCANCEL = ''0'')) AND ';
  sSQL := sSQL + '       (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ';
  sSQL := sSQL + '        LotePagto.IDPESSOA = ' + InttoStr(sistema.IdEmpresa) + ' AND ';
  sSQL := sSQL + '        LOTEPAGTO.NUMLOTE  = LOTEX.NUMLOTE AND ';
  sSQL := sSQL + '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO AND (LotePagto.flagcancel <>''C'' or LotePagto.flagcancel is null) and ';
  sSQL := sSQL + '        DOC.RECPAG         = ''' + ParamIntegra.RecPag + ''' AND ';
  sSQL := sSQL + '        PORTADORFORMA.IDTEMPLCHEQUE = CHEQUE.IDTEMPLCHEQUE AND ' +
    ' totlote.totdocum=totdocum.totdocum and ' +
    ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lotepagto.NUMLOTE and ';

  If Trim(dblkFormaPag.text) <> '' Then
    sSQL := sSQL + ' LOTEPAGTO.CODPORTFORMA  = ' + dblkFormaPag.LookupValue + '  AND '
  Else
    sSQL := sSQL + ' LOTEPAGTO.CODPORTFORMA  = -1 AND ';

  If sSQL <> '' Then
    sSQL := Copy(sSQL, 1, Length(sSQL) - 5);

  SqlLotePagto.Sql.clear;
  SqlLotePagto.SQL.Add(' SELECT distinct LOTEPAGTO.NUMLOTE,LOTEPAGTO.CODPORTFORMA,DESCRICAO , LOTEPAGTO.DATAEMISSAO, LOTEPAGTO.IDPROCESSO   '
    +
    ' FROM ' + sistema.PrefixoServidor + 'LotePagto,'
    + sistema.PrefixoServidor + 'LOTEXDOCUM LOTEX, '
    + sistema.PrefixoServidor + 'DOCUMENTO DOC,     '
    + sistema.PrefixoServidor + 'TEMPLCHEQUE CHEQUE,'
    + sistema.PrefixoServidor + ' PortadorForma ' +
    ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' +
    '        ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL))  AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum ' +

    ',(select count(*) as totdocum , numlote from lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' +
    '        ((LD.FLGBAIXA  IN (''N'',''R''))  OR (LD.FLGBAIXA IS NULL)) AND  ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' +
    '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    inttostr(sistema.idusuario) + ')) group by numlote  ) totlote ' +
    sSql + ' ORDER BY NUMLOTE' + '');
  SqlLotePagto.Open;

  If Not CdsLotePagto.IsEmpty Then
  Begin
    ClCheques.Items.Clear;
    While Not CdsLotePagto.Eof Do
    Begin
      ClCheques.Items.Add(CdsLotePagto.FieldByname('NUMLOTE').AsString);
      CdsLotePagto.Next;
    End;
  End
  Else
    ClCheques.Items.Clear;
End;

End.

