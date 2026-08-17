{===============================================================================
Autor     : Marcus Oliveira
Data      : 25.07.2007
Pendencia : 24864
Descrição : Exibir o Novo Número do Lote.
===============================================================================}
(*******************************************************************************
  11/02/1999
  Exclusão do lançamento no financeiro caso o momento de lançamento
  seja na emissão do Lote
 06/04/1999
  Inicialização da faixa de datas de emissão do lote com a data do dia
 30/04/1999
  Correção do Falta expressão na abertura do form
 08/10/1999 - 2.13.15
  Exclusão/Estorno da contabilização do cheques emitidos com o parâmetro de
  contabiliza emissão de cheques;
 19/01/2000 - 02.16.02
  Alterações no Layout;
 24/01/2000 - 02.16.03
  Implementação do cancelamento do procesos no RAD no momento do cancelamento
  do lote
 08/02/2000 - 2.17.05
  Implementação da exclusão dos impostos/agregados retidos na baixa do documento
 *******************************************************************************)

Unit FCancelaLoteMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, UMensErro, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, ImgList, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlCancelaLote, uCtrlParamIntegra, DBClient, uCMClientDataSet, uCmSqlParams,
  uSistema;

Type
  TCancelaLoteError = Exception;

  TFrmCancelaLoteMT = Class(TfrmSairAjuda)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgrdLotePagto: TwwDBGrid;
    DsGrid: TwwDataSource;
    dsdoc: TwwDataSource;
    dsLote: TwwDataSource;
    Pnldocpago: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    FobCancela: TfcOutlookBar;
    LstGerados: TfcOutlookList;
    PageGerados: TfcShapeBtn;
    Lstcancelados: TfcOutlookList;
    PageCancelados: TfcShapeBtn;
    ImlLotes: TImageList;
    Panel4: TPanel;
    Label2: TLabel;
    DlIni: TCMDateTimePicker;
    Label1: TLabel;
    DlFim: TCMDateTimePicker;
    SqlLotePagto: TCMSqlParams;
    CdsLotePagto: TCMClientDataSet;
    SqlDoc: TCMSqlParams;
    CdsDoc: TCMClientDataSet;
    SqlGrid: TCMSqlParams;
    CdsGrid: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    SqlAux: TCMSqlParams;
    Dbgrdlote: TwwDBGrid;
    sqlNumLote: TCMSqlParams;
    cdsNumLote: TCMClientDataSet;
    Procedure FormActivate(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    Procedure fcOutlookBar1OutlookList1Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    Procedure fcOutlookBar1OutlookList2Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    Procedure FobCancelaChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    procedure CdsLotePagtoAfterScroll(DataSet: TDataSet);
    procedure CdsLotePagtoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    _CancelaLote: TCtrlCancelaLote;
    sSqlIntegraContab, sNUMLOTE: String;
    Procedure limpa_tela;
    Procedure selecionadoc;
    Procedure selecionalote;
  public
    { Public declarations }
  protected
    iNumSeqLote: real;
  End;

Const
  CRLF = #13 + #10;
  
Var
  FrmCancelaLoteMT: TFrmCancelaLoteMT;

Implementation

Uses DBaseDados, Uautorizacao, UDataBase, uModulo;

{$R *.DFM}

Procedure TFrmCancelaLoteMT.FormActivate(Sender: TObject);
Begin
  Inherited;
  sSqlIntegraContab := '';
End;

Procedure TFrmCancelaLoteMT.limpa_tela;
Begin
  SqlLotePagto.Sql.Text := 'SELECT ' +
    '  LOTEPAGTO.NUMLOTE, LOTEPAGTO.CODLANCFINANC, ' +
    '  LOTEPAGTO.IDUSUARIOINCLUSAO,LOTEPAGTO.DATAEMISSAO, ' +
    '  LOTEPAGTO.NUMCHQBORDERO,LOTEPAGTO.FAVORECIDO, ' +
    '  LOTEPAGTO.FLAGEMISSAO,LOTEPAGTO.CODPORTFORMA ,LOTEPAGTO.FLAGCANCEL, ' +
    '  LOTEPAGTO.IDPESSOA,LOTEPAGTO.OBSERVACAO, LOTEPAGTO.PLNCODIGO,  LOTEPAGTO.IDPROCESSO ' +
    'FROM ' +
    '  LOTEPAGTO, LOTEXDOCUM LOTEX, DOCUMENTO DOC ' +
    'WHERE ' +
    '  1=2 ';
  SqlLotePagto.Open;

  SqlGrid.Sql.Text := ' SELECT   PESS.NOME,             ' +
    ' DOC.DATAPROGRAMADA,                               ' +
    ' DOC.IDFORCLI AS IDPESSOA,                         ' +
    ' DOC.DATAVENCTO,                                   ' +
    ' DOC.NoDOCUMENTO,                                  ' +
    ' DOC.COMPLDOCUMENTO,                               ' +
    ' DOC.CODDOCUMENTO,                                 ' +
    ' DOC.OPERACAO,                                     ' +
    ' DOC.PLANO , DOC.PLACONTA,  DOC.CODCENTROCUSTO,    ' +
    ' LOTEPAG.FLAGEMISSAO, LOTEPAG.CODLANCFINANC,       ' +
    ' LOTEX.VALOR,                                      ' +
    ' LOTEX.NUMLOTE,                                    ' +
    ' LOTEX.FLGBAIXA,                                   ' +
    ' LANC.NUMLANCTO                                    ' +
    ' FROM  DOCUMENTO DOC,PESSOA PESS, LOTEXDOCUM LOTEX, LOTEPAGTO LOTEPAG,   LANCTODOCUM LANC ' +
    ' WHERE  1=2';
  SqlGrid.Open;
End;

Procedure TFrmCancelaLoteMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  _CancelaLote := TCtrlCancelaLote.Create;
  _CancelaLote.InitializeAs(ParamIntegra);

  visible := false;
  windowstate := wsMaximized;
  visible := true;

  limpa_tela;

  DlIni.Date := Date;
  DlFim.Date := Date;

  FobCancela.ActivePage := PageGerados;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30023;
    bbtnAjuda.HelpContext := 30023;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

End;

Procedure TFrmCancelaLoteMT.selecionadoc;
Begin
  sqlGrid.SQL.Text :=
       'SELECT' + CRLF +
       '  PESS.NOME,' + CRLF +
       '  DOC.DATAPROGRAMADA,' + CRLF +
       '  DOC.IDFORCLI AS IDPESSOA,' + CRLF +
       '  DOC.DATAVENCTO,' + CRLF +
       '  DOC.NoDOCUMENTO,' + CRLF +
       '  DOC.COMPLDOCUMENTO,' + CRLF +
       '  DOC.CODDOCUMENTO,' + CRLF +
       '  DOC.OPERACAO,' + CRLF +
       '  DOC.PLANO,' + CRLF +
       '  DOC.PLACONTA,' + CRLF +
       '  DOC.CODCENTROCUSTO,' + CRLF +
       '  LOTEPAG.FLAGEMISSAO,' + CRLF +
       '  LOTEPAG.CODLANCFINANC,' + CRLF +
       '  LOTEPAG.PLNCODIGO,' + CRLF +
       '  LOTEX.VALOR,' + CRLF +
       '  LOTEX.NUMLOTE,' + CRLF +
       '  LOTEX.FLGBAIXA,' + CRLF +
       '  LANC.NUMLANCTO' + CRLF +
       'FROM' + CRLF +
       '  DOCUMENTO DOC,' + CRLF +
       '  PESSOA PESS,' + CRLF +
       '  LOTEXDOCUM LOTEX,' + CRLF +
       '  LOTEPAGTO LOTEPAG,' + CRLF +
       '  LANCTODOCUM LANC' + CRLF +
       'WHERE' + CRLF +
       '  (DOC.IDPESSOA = '+InttoStr(Sistema.IdEmpresa) + ') AND' + CRLF +
       '  (DOC.RECPAG = ''' + ParamIntegra.RecPag + ''') AND' + CRLF +
       '   doc.CODTIPDOC in' + CRLF +
       '      (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and b.idusuario=' + inttostr(sistema.IdUsuario)+')' + CRLF +
       '       union' + CRLF +
       '      SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' + ParamIntegra.RecPag+ '''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario=' + inttostr(sistema.idusuario)+')) and '+ CRLF +
       '       (LOTEX.NUMLOTE    = ' + CdsLotePagto.FieldByName('NUMLOTE').AsString + ')  AND' + CRLF +
       '       ((LOTEX.FLGBAIXA     IS NULL) OR (LOTEX.FLGBAIXA <> ''B'')) AND' + CRLF +
       '       (LOTEPAG.NUMLOTE = LOTEX.NUMLOTE) AND' + CRLF +
       '       (DOC.IDFORCLI = PESS.IDPESSOA) AND' + CRLF +
       '       (LANC.CODDOCUMENTO = DOC.CODDOCUMENTO) AND' + CRLF +
       '       (LANC.OPERACAO = DOC.OPERACAO) AND' + CRLF +
       '       (LANC.ESTORNO IS NULL) AND' + CRLF +
       '       (LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO)';

  SqlGrid.open;
  TFloatField(CdsGrid.FieldByName('VALOR')).DisplayFormat := '###,###.00';
End;

Procedure TFrmCancelaLoteMT.selecionalote;
Var
  ssql: String;
Begin

  limpa_tela;

  If FobCancela.ActivePage = PageGerados Then
    ssql := ' (lp.FLAGCANCEL = '' '' OR rtrim(lp.FLAGCANCEL) IS NULL ) AND '
  Else
    ssql := ' (Lp.FLAGCANCEL = ''C'')                        AND ';

  If (DlIni.Text <> '') And (DlFim.Text <> '') Then
  Begin
    sSQL := sSQL + ' (lp.DATAEMISSAO BETWEEN to_date(''' + DlIni.text + ''',''dd/MM/yyyy'')  and  to_date(''' + DlFim.text +
      ''',''dd/MM/yyyy'')) AND ';

  End;
  SqlLotePagto.SQL.Text := ' SELECT DISTINCT lp.NUMLOTE, lp.CODLANCFINANC,  ' +
    ' lp.IDUSUARIOINCLUSAO,lp.DATAEMISSAO,       ' +
    ' lp.NUMCHQBORDERO,lp.FAVORECIDO,      ' +
    ' lp.FLAGEMISSAO,lp.CODPORTFORMA ,lp.FLAGCANCEL,  ' +
    ' lp.IDPESSOA,lp.OBSERVACAO, lp.PLNCODIGO,  lp.IDPROCESSO' +
    ' FROM LotePagto lp,LOTEXDOCUM LOTEX,DOCUMENTO DOC      ' +
    ',(select count(*) as totdocum , lp.numlote from lotepagto lp,lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' + sSQL + ' lp.numlote=ld.numlote and ' +
    '       ((ld.FLGBAIXA     IS NULL) OR (ld.FLGBAIXA <> ''B'')) AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO group by lp.numlote  ) totdocum ' +
    ',(select count(*) as totdocum , lp.numlote from lotepagto lp,lotexdocum ld , documento d where ' +
    '        D.RECPAG         = ''' + ParamIntegra.RecPag + '''  AND ' + sSQL + '  lp.numlote=ld.numlote and ' +
    '       ((ld.FLGBAIXA     IS NULL) OR (ld.FLGBAIXA <> ''B'')) AND ' +
    '         ld.CODDOCUMENTO = D.CODDOCUMENTO  and ' +
    '         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + ''' and not exists  (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and b.idusuario=' +
    inttostr(sistema.IdUsuario) + ') union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''' +
    ParamIntegra.RecPag + '''  and exists (select 1 from UsuarioxTpdocto b where recpag=' + #39 + ParamIntegra.recpag + #39 +
    ' and a.codtipdoc=b.codtipdoc and b.idusuario=' +
    inttostr(sistema.idusuario) + ')) group by lp.numlote  ) totlote ' +
    ' WHERE       ' + ssql +
    ' totlote.totdocum=totdocum.totdocum and ' +
    ' totlote.numlote=totdocum.numlote and   totlote.numlote=  lp.NUMLOTE and ' +
    '        lp.IDPESSOA = ' + InttoStr(Sistema.IdEmpresa) + ' AND ' +
    '        DOC.RECPAG         = ''' + ParamIntegra.RecPag + '''                     AND ' +
    '       ((LOTEX.FLGBAIXA     IS NULL) OR (LOTEX.FLGBAIXA <> ''B'')) AND ' +
    '        lp.NUMLOTE  = LOTEX.NUMLOTE                           AND ' +
    '        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO   ';

  SqlLotePagto.Open;


  If Not CdsLotePagto.IsEmpty Then
    selecionadoc;
End;

Procedure TFrmCancelaLoteMT.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Begin
  Inherited;
  selecionalote;
End;

Procedure TFrmCancelaLoteMT.fcOutlookBar1OutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Begin
  Inherited;
  If ( CdsGrid.IsEmpty) Then Begin
    Msgdlg( 'Lote sem documentos', 'Aviso', mtWarning, [ mbOk ], 0 );
    Exit;
  End;

  If (Not CdsLotePagto.IsEmpty) And
    (Application.MessageBox('Confirma o cancelamento do Lote', 'Atenção', Mb_YesNo + Mb_IconQuestion) = Id_Yes) Then
  Begin
    Dbgrdlote.enabled := false;

    Try
      sNUMLOTE := CdsGrid.FieldByName('NUMLOTE').AsString;

      If sNUMLOTE = '' Then
        Raise TCancelaLoteError.Create('Erro: numero do lote em branco');
      If _CancelaLote.Cancela_Lote(CdsGrid.Data, CdsLotePagto.Data , cdsLotePagto.FieldByName('IDPROCESSO').AsString,
        Sistema.IdEmpresa,
        Sistema.IdModulo,
        Sistema.IDUsuario,
        ParamIntegra.Plano,
        Sistema.UsaPlanoPatro,
        ParamIntegra.IntegraContab,
        Modulo.EstornaFinanc,
        ParamIntegra.EstornaContab) Then
        Msgdlg('Lote cancelado com sucesso.', 'Aviso', mtInformation, [mbOk], 0)
      else
        Raise Exception.Create(_CancelaLote.MessageInfo);

      Dbgrdlote.SelectedList.clear;
      Dbgrdlote.enabled := true;
      SelecionaLote;
    Except
      On E: Exception Do
      Begin
        Msgdlg('O Lote não pode ser cancelado. ' + (#13 + #10) + E.Message, 'Aviso', mtError, [mbOk], 0);
        Dbgrdlote.SelectedList.Clear;
        Dbgrdlote.enabled := True;
        SelecionaLote;
        Raise;
      End;
    End;
  End;
End;

Procedure TFrmCancelaLoteMT.fcOutlookBar1OutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
Begin
  Inherited;

  cdsGrid.first;
  While Not cdsGrid.EOF Do
  Begin
    sqlAux.SQL.Clear;
    sqlAux.SQL.Append('SELECT 1 FROM LOTEXDOCUM WHERE CODDOCUMENTO = ' +
      cdsGrid.FieldByName('CODDOCUMENTO').AsString +
      ' AND NUMLOTE > ' + cdsGrid.FieldByName('NUMLOTE').AsString);
    If cdsAux.Active Then
      cdsAux.Close;
    sqlAux.Open;
    If Not cdsAux.IsEmpty Then
    Begin
      Msgdlg('Existe documento deste lote em outro lote', 'Aviso', mterror, [mbOk], 0);
      Exit;
    End;
    cdsGrid.Next;
  End;

  cdsGrid.First;
  If (Not cdsLotePagto.IsEmpty) And
    (Application.MessageBox('Confirma que deseja regerar o lote', 'Atenção', Mb_YesNo + Mb_IconQuestion) = Id_Yes) Then
  Begin
    Try
      Dbgrdlote.enabled := False;
      if not _CancelaLote.Regera_Lote(CdsGrid.Data, CdsLotePagto.Data, ParamIntegra.PartidaDobrada,
        ParamIntegra.Plano,ParamIntegra.IntegraContab,Sistema.IDEmpresa,
        ParamIntegra. RecPag, Sistema.IdUsuario, Sistema.IdModulo, CdsLotePagto.FieldByName('NUMLOTE').AsString) then

        Msgdlg(_CancelaLote.MessageInfo, 'Aviso', mtInformation, [mbOk], 0)
      else
      //Marcus Oliveira P.24864 - 25/07/2007
      begin
        sqlNumLote.Prepare;
        sqlNumLote.SQL.Clear;
        sqlNumLote.sql.Add('SELECT NUMLOTE FROM LOTEXDOCUM WHERE ( FLGBAIXA IS NULL ) AND CODDOCUMENTO = '+ cdsGrid.FieldByName('CODDOCUMENTO').AsString);
        sqlNumLote.Open;
        MsgDlg('O número do lote regerado é ' + cdsNumLote.FieldByName('NUMLOTE').AsString , 'Atenção', mtInformation, [mbOK], 0 );
      //Marcus Oliveira P.24864 - 25/07/2007
      end;

      Dbgrdlote.SelectedList.clear;
      Dbgrdlote.enabled := true;
      Selecionalote;


    Except
      Dbgrdlote.enabled := True;
      Msgdlg('O Lote não pode ser regerado', 'Aviso', mterror, [mbOk], 0);
    End;
  End;
End;

Procedure TFrmCancelaLoteMT.FobCancelaChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
Begin
  Inherited;
  limpa_tela;
End;

Procedure TFrmCancelaLoteMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  _CancelaLote.Free;
End;

procedure TFrmCancelaLoteMT.CdsLotePagtoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  If CdsLotePagto.IsEmpty Then
    Exit;
  selecionadoc;
end;

procedure TFrmCancelaLoteMT.CdsLotePagtoNewRecord(DataSet: TDataSet);
begin
  inherited;
CdsLotePagto.Cancel;
end;

End.


