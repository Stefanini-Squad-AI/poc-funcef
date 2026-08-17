Unit FRelApGr;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlParamIntegra,
  IvDictio, IvMulti, IvEMulti, CMProcuraSubTipo, Machklb, CMProcuraMask,
  MontaSelect, ComCtrls, TB97Ctls, ImgList, fParamReports_Padrao, CmParamReport,
  uCmSqlParams, DBClient, uCMClientDataSet, Db, uMensErro, uCtrlRelatoriosCAPCAR,
FAguarde;

Const
  CNUMERO = 'Número';
  CDESCREDUZAP = 'AP Número ';
  CDESCREDUZGR = 'GR Número ';
  CDESCGR = 'Lote de Receb. Número ';
  CDESCAP = 'Cheque Borderô Número ';
Type
  TFrmRelApGr = Class(TfrmParamReports_Padrao)
    Panel1: TPanel;
    TreeApGr: TTreeView;
    Splitter1: TSplitter;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    BtnProcuraApGr: TToolbarButton97;
    BtnExcluiItem: TToolbarButton97;
    BtnNovaApGr: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    BtnIncluiIntem: TToolbarButton97;
    ImgApGr: TImageList;
    TreeLotes: TTreeView;
    MsApGr: TMontaSelect;
    SbApGr: TStatusBar;
    CkbDocCancel: TCheckBox;
    CdsCpBaixa: TCMClientDataSet;
    SqlCpBaixa: TCMSqlParams;
    SqlUpdcpbaixa: TCMSqlParams;
    CdsUpdcpbaixa: TCMClientDataSet;
    SqlApGr: TCMSqlParams;
    CdsApGr: TCMClientDataSet;
    CdsTeste: TCMClientDataSet;
    SqlTeste: TCMSqlParams;
    chkLancProvContabil: TCheckBox;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure TreeApGrDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; Var Accept: Boolean);
    Procedure TreeApGrDragDrop(Sender, Source: TObject; X, Y: Integer);
    Procedure BtnExcluiItemClick(Sender: TObject);
    Procedure TreeLotesDragDrop(Sender, Source: TObject; X, Y: Integer);
    Procedure TreeLotesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; Var Accept: Boolean);
    Procedure BtnNovaApGrClick(Sender: TObject);
    Procedure BtnIncluiIntemClick(Sender: TObject);
    Procedure TreeLotesDblClick(Sender: TObject);
    Procedure TreeApGrDblClick(Sender: TObject);
    Procedure BtnProcuraApGrClick(Sender: TObject);
    Procedure Splitter1Moved(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
    sNumApGr: String;
    Procedure EncheListaChqBord;
  public
    { Public declarations }
  End;

Var
  FrmRelApGr: TFrmRelApGr;

Implementation

{$R *.DFM}

Uses uSistema, uDataBase, DBaseDados;

Procedure TFrmRelApGr.bbtnConfirmarClick(Sender: TObject);
Var
  X: Integer;
  sNumChqBord: String;
Begin
  Inherited;
  TreeApGr.FullExpand;
  If TreeApGr.Items.Count > 1 Then
  Begin
    For X := 1 To TreeApGr.Items.Count - 1 Do
    Begin
      sNumChqBord := Trim(Copy(TreeApGr.Items.Item[X].Text, Pos(CNUMERO, TreeApGr.Items.Item[X].Text) + Length(CNUMERO),
        Length(TreeApGr.Items.Item[X].Text)));
      If self.tag = 0 Then
      Begin
        If Not CtrlRelatoriosCAPCAR.SetApGr(sNumChqBord, ParamIntegra.RecPag, sNumApGr) Then
          MsgDlg(CtrlRelatoriosCAPCAR.MessageInfo, 'Aviso', mtError, [mbOk], 0);
      End
      Else
      Begin
        If Not CtrlRelatoriosCAPCAR.SetCpBaixa(sNumChqBord, ParamIntegra.RecPag, sNumApGr) Then
          MsgDlg(CtrlRelatoriosCAPCAR.MessageInfo, 'Aviso', mtError, [mbOk], 0);
      End;
    End;
    Cmp_Padrao.ParamValues[0].AsString  := sNumApGr;
    Cmp_Padrao.ParamValues[1].AsBoolean := CkbDocCancel.Checked;

    //Bruno Bastos - Pend. 16929    
    Cmp_Padrao.ParamValues[2].AsBoolean := chkLancProvContabil.Checked;
  End;
End;

Procedure TFrmRelApGr.TreeApGrDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
  Inherited;
  Accept := ((Source Is TTreeView) And ((Source As TTreeView).Tag = 1));
  If Accept Then
    TreeApGr.DragCursor := CrDrag;
End;

Procedure TFrmRelApGr.TreeApGrDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
  NodeDest: TTreeNode;
Begin
  Inherited;
  If (TreeApGr.Selected <> Nil) And ((Source As TTreeView).Tag = 1) Then
  Begin
    NodeDest := TreeApGr.Items.AddChild(TreeApGr.Items.GetFirstNode, TreeLotes.Selected.Text);
    NodeDest.ImageIndex := 2;
    NodeDest.SelectedIndex := 2;
    NodeDest.StateIndex := 2;
    TreeLotes.Items.Delete(TreeLotes.Selected);
  End;
End;

Procedure TFrmRelApGr.BtnExcluiItemClick(Sender: TObject);
Var
  NodeDest: TTreeNode;
Begin
  Inherited;
  If (TreeApGr.Selected <> Nil) And (TreeApGr.Selected.ImageIndex = 2) Then
  Begin
    NodeDest := TreeLotes.Items.AddChild(Nil, TreeApGr.Selected.Text);
    NodeDest.ImageIndex := 2;
    NodeDest.SelectedIndex := 2;
    NodeDest.StateIndex := 2;
    TreeApGr.Items.Delete(TreeApGr.Selected);
  End;
End;

Procedure TFrmRelApGr.TreeLotesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
Var
  NodeDest: TTreeNode;
Begin
  Inherited;
  If (TreeApGr.Selected <> Nil) And ((Source As TTreeView).Tag = 0) Then
  Begin
    NodeDest := TreeLotes.Items.Add(Nil, TreeApGr.Selected.Text);
    NodeDest.ImageIndex := 2;
    NodeDest.SelectedIndex := 2;
    NodeDest.StateIndex := 2;
    TreeApGr.Items.Delete(TreeApGr.Selected);
  End;
End;

Procedure TFrmRelApGr.TreeLotesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
  Inherited;
  Accept := ((Source Is TTreeView) And ((Source As TTreeView).Tag = 0) And
    ((Source As TTreeView).Selected.ImageIndex <> 0));
  If Accept Then
    TreeApGr.DragCursor := CrDrag;
End;

Procedure TFrmRelApGr.BtnNovaApGrClick(Sender: TObject);
Var
  NodePai: TTreeNode;
  sNomeNo: String;
Begin
  Inherited;
  TreeLotes.Enabled := True;
  BtnIncluiIntem.Enabled := True;
  BtnExcluiItem.Enabled := True;
  If ParamIntegra.RecPag = 'P' Then
    sNomeNo := CDESCREDUZAP
  Else
    sNomeNo := CDESCREDUZGR;
  TreeApGr.Items.Clear;
  If self.tag = 0 Then
    sNumApGr := IntToStr(CtrlRelatoriosCAPCAR.PegaSEQAPGR)
  Else
    sNumApGr := IntToStr(CtrlRelatoriosCAPCAR.PegaSEQCPBAIXA);
  If Trim(sNumApGr) <> '0' Then
  Begin
    NodePai := TreeApGr.Items.Add(Nil, sNomeNo + sNumApGr);
    NodePai.ImageIndex := 0;
    NodePai.SelectedIndex := 0;
    NodePai.StateIndex := 0;
  End
  Else
    MsgDlg('Cadastro dos Parâmetros deve ser feito previamente', 'Aviso', mtError, [mbOk], 0);

  EncheListaChqBord;
End;

Procedure TFrmRelApGr.BtnIncluiIntemClick(Sender: TObject);
Var
  NodeDest: TTreeNode;
Begin
  Inherited;
  If (TreeLotes.Selected <> Nil) And (TreeApGr.Items.Count <> 0) Then
  Begin
    NodeDest := TreeApGr.Items.AddChild(TreeApGr.Items.GetFirstNode, TreeLotes.Selected.Text);
    NodeDest.ImageIndex := 2;
    NodeDest.SelectedIndex := 2;
    NodeDest.StateIndex := 2;
    TreeLotes.Items.Delete(TreeLotes.Selected);
  End;
End;

Procedure TFrmRelApGr.TreeLotesDblClick(Sender: TObject);
Begin
  Inherited;
  If TreeLotes.Selected <> Nil Then
    BtnIncluiIntem.Click;
End;

Procedure TFrmRelApGr.TreeApGrDblClick(Sender: TObject);
Begin
  Inherited;
  If (TreeApGr.Selected <> Nil) And TreeLotes.Enabled Then
    BtnExcluiItem.Click;
End;

Procedure TFrmRelApGr.EncheListaChqBord;
Var
  sDescricao: String;
  NoInsert: TTreeNode;
Begin
  FrmAguarde.Mostra( 'Buscando dados' );
  TreeLotes.Items.Clear;
  If ParamIntegra.RecPag = 'R' Then
    sDescricao := CDESCGR
  Else
    sDescricao := CDESCAP;
  If self.tag = 0 Then
  Begin
    If CdsApGr.Active Then
      CdsApGr.Close;
    SqlApGr.Prepare;
    SqlApGr.Parambyname('precpag').AsString := ParamIntegra.RecPag;
    SqlApGr.Parambyname('idusuario').Asinteger := sistema.idusuario;
    SqlApGr.Open;
    CdsApGr.First;
    frmAguarde.Mostra( 'Montando lista' );
    frmAguarde.Min := 0;
    frmAguarde.Max := CdsApGr.RecordCount;
    frmAguarde.Pos := 0;
    While Not CdsApGr.Eof Do
    Begin
      NoInsert := TreeLotes.Items.Add(Nil, sDescricao + Trim(CdsApGr.Fields[0].AsString));
      NoInsert.ImageIndex := 2;
      NoInsert.SelectedIndex := 2;
      NoInsert.StateIndex := 2;
      CdsApGr.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
    End;
  End
  Else
  Begin
    If Cdscpbaixa.Active Then
      Cdscpbaixa.Close;
    Sqlcpbaixa.Prepare;
    Sqlcpbaixa.Parambyname('precpag').AsString := ParamIntegra.RecPag;
    Sqlcpbaixa.Parambyname('idusuario').Asinteger := sistema.idusuario;
    Sqlcpbaixa.Open;
    Cdscpbaixa.First;
    frmAguarde.Mostra( 'Montando lista' );
    frmAguarde.Min := 0;
    frmAguarde.Max := Cdscpbaixa.RecordCount;
    frmAguarde.Pos := 0;
    While Not Cdscpbaixa.Eof Do
    Begin
      NoInsert := TreeLotes.Items.Add(Nil, sDescricao + Trim(Cdscpbaixa.Fields[0].AsString));
      NoInsert.ImageIndex := 2;
      NoInsert.SelectedIndex := 2;
      NoInsert.StateIndex := 2;
      Cdscpbaixa.Next;
      frmAguarde.Pos := frmAguarde.Pos + 1;
    End;
  End;
  frmAguarde.Apaga;
End;

Procedure TFrmRelApGr.BtnProcuraApGrClick(Sender: TObject);
Var
  sNomeNo, sDescricao: String;
  NodePai, NoInsert: TTreeNode;
  ssql: String;
Begin
  Inherited;
  MsApGr.Executar;
  If MsApGr.RetornouValor Then
  Begin
    If self.tag = 0 Then
      ssql := ' SELECT DISTINCT                   ' +
        ' R.NUMCHQBORDERO                         ' +
        'FROM                                     ' +
        ' RECBTOPAGTO R, DOCUMENTO D              ' +
        'WHERE                                    ' +
        ' (D.CODDOCUMENTO = R.CODDOCUMENTO) AND   ' +
        ' (D.NUMAPGR = ' + MsApGr.ValoresChave[0] + ') ' +
        'ORDER BY                                 ' +
        ' R.NUMCHQBORDERO                         '
    Else
      ssql := ' SELECT DISTINCT                   ' +
        ' R.NUMCHQBORDERO                         ' +
        'FROM                                     ' +
        ' RECBTOPAGTO R, DOCUMENTO D              ' +
        'WHERE                                    ' +
        ' (D.CODDOCUMENTO = R.CODDOCUMENTO) AND   ' +
        ' (D.numcpbaixa = ' + MsApGr.ValoresChave[0] + ') ' +
        'ORDER BY                                 ' +
        ' R.NUMCHQBORDERO ';
    If CdsTeste.Active Then
      CdsTeste.Close;
    SqlTeste.SQL.Text := ssql;
    SqlTeste.Open;
    If Not CdsTeste.IsEmpty Then
    Begin
      TreeLotes.Enabled := False;
      BtnIncluiIntem.Enabled := False;
      BtnExcluiItem.Enabled := False;

      If ParamIntegra.RecPag = 'P' Then
      Begin
        sNomeNo := CDESCREDUZAP;
        sDescricao := CDESCAP;
      End
      Else
      Begin
        sNomeNo := CDESCREDUZGR;
        sDescricao := CDESCGR;
      End;

      sNumApGr := MsApGr.ValoresChave[0];

      TreeApGr.Items.Clear;
      NodePai := TreeApGr.Items.Add(Nil, sNomeNo + MsApGr.ValoresChave[0]);
      NodePai.ImageIndex := 0;
      NodePai.SelectedIndex := 0;
      NodePai.StateIndex := 0;
      CdsTeste.First;
      While Not CdsTeste.Eof Do
      Begin
        NoInsert := TreeApGr.Items.AddChild(NodePai, sDescricao + Trim(CdsTeste.Fields[0].AsString));
        NoInsert.ImageIndex := 2;
        NoInsert.SelectedIndex := 2;
        NoInsert.StateIndex := 2;
        CdsTeste.Next;
      End;
    End;
  End;
End;

Procedure TFrmRelApGr.Splitter1Moved(Sender: TObject);
Begin
  Inherited;
  SbApGr.Panels[0].Width := TreeApGr.Width + 1;
End;

Procedure TFrmRelApGr.FormShow(Sender: TObject);
Var
  ssql: String;
Begin
  Inherited;
  If self.tag = 0 Then
  Begin
    MsApGr.Colunas.Clear;
    MsApGr.Colunas.Add('DOCUMENTO.NUMAPGR');
    MsApGr.Colunas.Add('DOCUMENTO.NODOCUMENTO');
    MsApGr.Colunas.Add('DOCUMENTO.COMPLDOCUMENTO');
    MsApGr.Colunas.Add('RECBTOPAGTO.NUMCHQBORDERO');
    MsApGr.Colunas.Add('RECBTOPAGTO.NUMLOTE');
    MsApGr.Colunas.Add('RECBTOPAGTO.DATACFLOAT');
    MsApGr.Colunas.Add('PESSOA.NOME');

    //DAVID
    MsApGr.Colunas.Add('ROUND( LANCTODOCUM.VALOR, 2 )');

    msapgr.CamposChave.clear;
    msapgr.CamposChave.add('DOCUMENTO.NUMAPGR');
    ssql := '       (D.NUMAPGR  IS not NULL  ) '
  End
  Else
  Begin
    MsApGr.Colunas.Clear;
    MsApGr.Colunas.Add('DOCUMENTO.NUMCPBAIXA');
    MsApGr.Colunas.Add('DOCUMENTO.NODOCUMENTO');
    MsApGr.Colunas.Add('DOCUMENTO.COMPLDOCUMENTO');
    MsApGr.Colunas.Add('RECBTOPAGTO.NUMCHQBORDERO');
    MsApGr.Colunas.Add('RECBTOPAGTO.NUMLOTE');
    MsApGr.Colunas.Add('RECBTOPAGTO.DATACFLOAT');
    MsApGr.Colunas.Add('PESSOA.NOME');

    //DAVID
    MsApGr.Colunas.Add('ROUND( LANCTODOCUM.VALOR, 2 )');
    
    msapgr.CamposChave.clear;
    msapgr.CamposChave.add('DOCUMENTO.numcpbaixa');
    ssql := '       (D.numcpbaixa  IS not NULL  ) ';
  End;
  MsApGr.Filtro.Add('DOCUMENTO.RECPAG = ''' + ParamIntegra.RecPag + '''                                               ');
  MsApGr.Tabelas.Add(' (select count(*) as totdocum , NUMCHQBORDERO from recbtopagto rb , documento d , lanctodocum l '+
                     '   where                                                                                        '+
                     '         D.RECPAG = ''' + ParamIntegra.RecPag + '''  AND  ' + ssql + '   and                     '+
                     '         l.CODDOCUMENTO = D.CODDOCUMENTO  and  l.CODDOCUMENTO = rb.CODDOCUMENTO  and            '+
                     '         rb.numlancto=l.numlancto   and                                                         '+
                     '         rtrim(l.operacao) in (''5'',''15'',''10'') group by NUMCHQBORDERO  ) totdocum          '+
                     ', (select count(*) as totdocum , NUMCHQBORDERO from recbtopagto rb, documento d , lanctodocum l '+
                     '    where                                                                                       '+
                     '        D.RECPAG         = ''' + ParamIntegra.RecPag + ''' AND ' + ssql + ' and                  '+
                     '        l.CODDOCUMENTO = D.CODDOCUMENTO  and  l.CODDOCUMENTO = rb.CODDOCUMENTO                  '+
                     '        and rb.numlancto=l.numlancto and                                                        '+
                     '        rtrim(l.operacao) in (''5'',''15'',''10'') and                                          '+
                     '        d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a                                   '+
                     '                         WHERE a.RECPAG =''' + ParamIntegra.RecPag + '''                        '+
                     '                           and not exists (select 1 from UsuarioxTpdocto b                      '+
                     '                                           where recpag=''' + ParamIntegra.RecPag + '''         '+
                     '                                             and b.idusuario=' + inttostr(sistema.idusuario) + ') '+
                     '                        union                                                                   '+
                     '                        SELECT CODTIPDOC  FROM TIPODOCRECPAG a                                  '+
                     '                        WHERE a.RECPAG =  ''' + ParamIntegra.RecPag + '''                       '+
                     '                          and exists (select 1 from UsuarioxTpdocto b                           '+
                     '                                      where recpag= ''' + ParamIntegra.RecPag + ''' and         '+
                     '                                            a.codtipdoc=b.codtipdoc and                         '+
                     '                                            b.idusuario=' + inttostr(sistema.idusuario) + '))   '+
                     '       group by NUMCHQBORDERO  ) totlote                                                        ');
  If self.tag = 0 Then
    MsApGr.Filtro.Add('DOCUMENTO.NUMAPGR IS NOT NULL')
  Else
    MsApGr.Filtro.Add('DOCUMENTO.numcpbaixa IS NOT NULL');
  MsApGr.Filtro.Add('  totlote.totdocum=totdocum.totdocum and   totlote.NUMCHQBORDERO=totdocum.NUMCHQBORDERO ');
  MsApGr.Filtro.Add('  RECBTOPAGTO.NUMCHQBORDERO=totdocum.NUMCHQBORDERO ');

  EncheListaChqBord;

  If ParamIntegra.RecPag = 'P' Then
  Begin
    If self.tag <> 1 Then
    Begin
      self.Caption := 'Parâmetros do Relatório Autorização de Pagamento';
      SbApGr.Panels[0].Text := 'Autorização de Pagamento';
    End
    Else
    Begin
      self.Caption := 'Parâmetros do Relatório Comprovante de Baixa';
      SbApGr.Panels[0].Text := 'Comprovante de Baixa';
      MsApGr.Descricao.Delete(0);
      MsApGr.Descricao.Insert(0, 'Nº CB');
      BtnNovaApGr.hint := 'Novo Comp. Baixa';
    End;
    SbApGr.Panels[1].Text := 'Cheques \ Borderôs';
  End
  Else
  Begin
    self.Caption := 'Parâmetros do Relatório Guia de Recebimento';
    SbApGr.Panels[0].Text := 'Guia de Recebimento';
    SbApGr.Panels[1].Text := 'Lote De Recebimento';
  End;
End;

Procedure TFrmRelApGr.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
End;

End.

