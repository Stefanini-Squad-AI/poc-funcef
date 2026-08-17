//******************************************************************************
//N. SIG..........: 74816
//Data............: 08/05/2019
//Responsável.....: Everson Cunha
//Descrição.......: Alterada a query da qryLkpItemDespesa
//******************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 24/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro de Parâmetros para as Integrações
//******************************************************************************


Unit fCadDstParam;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, TB97Ctls, TB97, TB97Tlbr, MAHlpBtn, Db, DBTables, Wwquery,
   MontaSelect, ImgList, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
   ExtCtrls, DBCtrls, CMProcuraMask, ComCtrls, Mask, wwdbedit;

Type
   TfrmCadDstParam = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      MontaSelectFi: TMontaSelect;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      sep1: TToolbarSep97;
      sep3: TToolbarSep97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryLkpItemDespesa: TwwQuery;
      qryLkpDesembolso: TwwQuery;
      qryAux: TQuery;
      qryLkpRubrica: TwwQuery;
      qryLkpRubricaIDPROVENTO: TFloatField;
      qryLkpRubricaDESCRICAO: TStringField;
      qryLkpRubricaTIPOPROVENTO: TStringField;
      qryLkpDesembolsoCODTIPRECDES: TStringField;
      qryLkpDesembolsoIDPESSOA: TFloatField;
      qryLkpDesembolsoRECPAG: TStringField;
      pcIntegra: TPageControl;
      tbsFi: TTabSheet;
      tbsFo: TTabSheet;
      pnlDadosPrincipalFi: TPanel;
      Label1: TLabel;
      dblkpItemDstFi: TwwDBLookupCombo;
      dbrgTipoRecPag: TDBRadioGroup;
      dbgFo: TwwDBGrid;
      pnlDadosPrincipalFo: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      DBRadioGroup1: TDBRadioGroup;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBEdit1: TwwDBEdit;
      dblkpItemDstFo: TwwDBLookupCombo;
      DBRadioGroup3: TDBRadioGroup;
      qryLkpDesembolsoDESCRICAO: TStringField;
      dblkpTipoDesemb: TwwDBLookupCombo;
      qryParamFi: TwwQuery;
      dsParamFi: TDataSource;
      dbgFi: TwwDBGrid;
      updParamFo: TUpdateSQL;
      dsParamFo: TDataSource;
      qryParamFo: TwwQuery;
      MontaSelectFo: TMontaSelect;
      qryParamFiIDDSTPARAMINTEGRACAO: TFloatField;
      qryParamFiIDPROVENTO: TFloatField;
      qryParamFiINDTIPO: TFloatField;
      qryParamFiIDPESSOA: TFloatField;
      qryParamFiRECPAG: TStringField;
      qryParamFiCODTIPRECDES: TStringField;
      qryParamFiTIPOCONTRATO: TStringField;
      qryParamFiTIPOVIAGEM: TFloatField;
      qryParamFiDESCRICAO: TStringField;
      qryParamFiDSCPAGREC: TStringField;
      qryParamFiDSCITEM: TStringField;
      qryParamFoIDDSTPARAMINTEGRACAO: TFloatField;
      qryParamFoIDPROVENTO: TFloatField;
      qryParamFoINDTIPO: TFloatField;
      qryParamFoIDPESSOA: TFloatField;
      qryParamFoRECPAG: TStringField;
      qryParamFoCODTIPRECDES: TStringField;
      qryParamFoTIPOCONTRATO: TStringField;
      qryParamFoTIPOVIAGEM: TFloatField;
      qryParamFoDESCRPROVDESC: TStringField;
      qryParamFoDSCTIPOVIAGEM: TStringField;
      qryParamFoDSCTIPOCONTRATO: TStringField;
      qryParamFoDSCITEM: TStringField;
      dsLkpRubrica: TDataSource;
      qryLkpItemDespesaDESCRICAO: TStringField;
      DBRadioGroup2: TDBRadioGroup;
      qryParamFiDSCTIPOVIAGEM: TStringField;
      updParamFi: TUpdateSQL;
      DBRadioGroup4: TDBRadioGroup;
      qryParamFiDSCTIPOCONTRATO: TStringField;
      qryLkpItemDespesaIDDSTITEMDESPESA: TFloatField;
      qryParamFoFLGDESCONTO: TFloatField;
      qryLkpRubricaFLGDESCONTO: TFloatField;
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure dbrgTipoRecPagClick(Sender: TObject);
      Procedure dbrgTipoRecPagChange(Sender: TObject);
      Procedure dbgFiCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgFoCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure pcIntegraChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure dblkpItemDstFiEnter(Sender: TObject);
      Procedure dblkpItemDstFoEnter(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
      { Private declarations }
      Procedure SelecionaMovimento(idParamIntegra, Ident: Integer);
   Public
      { Public declarations }
   End;

Var
   frmCadDstParam: TfrmCadDstParam;

Implementation

Uses DBaseDados, UMensErro, uCtrlPadroes;
{$R *.DFM}

Procedure TfrmCadDstParam.FormCreate(Sender: TObject);
Begin
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;   
   pnlDadosPrincipalFi.enabled := False;
   pnlDadosPrincipalFo.enabled := False;

   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;
   sbtnProcurar.enabled := True;
End;

Procedure TfrmCadDstParam.FormShow(Sender: TObject);
Begin
   If frmCadDstParam.WindowState = wsNormal Then
      Begin
         frmCadDstParam.Top := (Screen.Height - Height) Div 2;
         frmCadDstParam.Left := (Screen.Width - Width) Div 2;
      End;

   pcIntegra.ActivePageIndex := 0;

   Screen.Cursor := crSQLWait;
   qryLkpDesembolso.Close;
   qryLkpDesembolso.Open;
   qryLkpRubrica.Close;
   qryLkpRubrica.Open;
   qryLkpItemDespesa.Close;
   qryLkpItemDespesa.Open;

   SelecionaMovimento(0, 0); // Financeiro
   SelecionaMovimento(0, 1); // Folha

   Screen.Cursor := crDefault;
End;

Procedure TfrmCadDstParam.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;

   If pcIntegra.ActivePageIndex = 0 Then
      Begin
         MontaSelectFi.Caption := 'Selecione um Parâmetro';
         MontaSelectFi.Executar;
         If (MontaSelectFi.RetornouValor) Then
            SelecionaMovimento(strtoint(MontaSelectFi.ValoresChave[0]), pcIntegra.ActivePageIndex)
         Else
            SelecionaMovimento(0, pcIntegra.ActivePageIndex);
      End
   Else
      Begin
         MontaSelectFo.Caption := 'Selecione um Parâmetro';
         MontaSelectFo.Executar;
         If (MontaSelectFo.RetornouValor) Then
            SelecionaMovimento(strtoint(MontaSelectFo.ValoresChave[0]), pcIntegra.ActivePageIndex)
         Else
            SelecionaMovimento(0, pcIntegra.ActivePageIndex);
      End;
End;

Procedure TfrmCadDstParam.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadDstParam.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryParamFi.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryParamFi.CancelUpdates;
               qryParamFi.Close;
               qryLkpDesembolso.Close;
               qryLkpRubrica.Close;
               qryLkpItemDespesa.Close;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               Screen.Cursor := crDefault;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryParamFi.Close;
         qryParamFo.Close;
         qryLkpDesembolso.Close;
         qryLkpRubrica.Close;
         qryLkpItemDespesa.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadDstParam.sbtnAlterarClick(Sender: TObject);
Begin
   sbtnAlterar.Down := True;
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If pcIntegra.ActivePageIndex = 0 Then
         Begin
            If (Not qryParamFi.IsEmpty) Then
               Begin
                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;
                  pnlDadosPrincipalFi.enabled := True;
                  dbgFi.enabled := False;

                  qryParamFi.edit;
                  dblkpItemDstFi.Setfocus;
               End
            Else
               Application.MessageBox('Sem Parâmetros selecionados para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         End
      Else
         Begin
            If (Not qryParamFo.IsEmpty) Then
               Begin
                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;

                  pnlDadosPrincipalFo.enabled := True;
                  dbgFo.enabled := False;

                  qryParamFo.edit;
                  dblkpItemDstFo.Setfocus;
               End
            Else
               Application.MessageBox('Sem Parâmetros selecionados para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDstParam.sbtnInserirClick(Sender: TObject);
Begin
   sbtnInserir.Down := True;
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;
      sbtnProcurar.enabled := False;
      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      If pcIntegra.ActivePageIndex = 0 Then
         Begin
            pnlDadosPrincipalFi.enabled := True;
            dbgFi.enabled := False;

            qryParamFi.Insert;
            dblkpItemDstFi.Setfocus;
         End
      Else
         Begin
            pnlDadosPrincipalFo.enabled := True;
            dbgFo.enabled := False;

            qryParamFo.Insert;
            dblkpItemDstFo.Setfocus;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDstParam.bbtnCancelarClick(Sender: TObject);
Begin
   If pcIntegra.ActivePageIndex = 0 Then
      Begin
         If qryParamFi.state In [dsEdit, dsInsert] Then
            Begin
               qryParamFi.CancelUpdates;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

            End;
         SelecionaMovimento(0, pcIntegra.ActivePageIndex);

      End
   Else
      Begin
         If qryParamFo.state In [dsEdit, dsInsert] Then
            Begin
               qryParamFo.CancelUpdates;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;
            End;

         SelecionaMovimento(0, pcIntegra.ActivePageIndex);
      End;

   sbtnInserir.Down := False;
   sbtnInserir.enabled := True;
   sbtnAlterar.Down := False;
   sbtnAlterar.enabled := True;
   sbtnApagar.Down := False;
   sbtnApagar.enabled := True;
   sbtnProcurar.Down := False;
   sbtnProcurar.enabled := True;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   If pcIntegra.ActivePageIndex = 0 Then
      Begin
         pnlDadosPrincipalFi.enabled := False;
         dbgFi.enabled := True;
      End
   Else
      Begin
         pnlDadosPrincipalFo.enabled := False;
         dbgFo.enabled := True;
      End;
End;

Procedure TfrmCadDstParam.sbtnApagarClick(Sender: TObject);
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.InTransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      If pcIntegra.ActivePageIndex = 0 Then
         Begin
            If (Not qryParamFi.IsEmpty) Then
               Begin
                  If MsgDlg('Confirma Exclusão ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        qryParamFi.Delete;
                        qryParamFi.ApplyUpdates;
                        dtmBaseDados.dbBaseDados.Commit;

                        SelecionaMovimento(0, pcIntegra.ActivePageIndex); // Financeiro ou Folha
                        Screen.Cursor := crDefault;

                        sbtnInserir.Enabled := True;
                        sbtnAlterar.Enabled := True;
                        sbtnApagar.Enabled := True;
                     End;
               End
            Else
               Application.MessageBox('Sem Parâmetros selecionados para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         End
      Else
         Begin
            If (Not qryParamFo.IsEmpty) Then
               Begin
                  If MsgDlg('Confirma Exclusão ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        qryParamFo.Delete;
                        qryParamFo.ApplyUpdates;
                        dtmBaseDados.dbBaseDados.Commit;

                        SelecionaMovimento(0, pcIntegra.ActivePageIndex); // Financeiro ou Folha
                        Screen.Cursor := crDefault;

                        sbtnInserir.Enabled := True;
                        sbtnAlterar.Enabled := True;
                        sbtnApagar.Enabled := True;
                     End;
               End
            Else
               Application.MessageBox('Sem Parâmetros selecionados para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         End;

      sbtnApagar.Down := False;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDstParam.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If pcIntegra.ActivePageIndex = 0 Then
               Begin
                  If qryParamFi.State In [dsInsert, dsEdit] Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        If qryParamFi.State = dsInsert Then
                           Begin
                              qryAux.SQL.Clear;
                              qryAux.SQL.add('SELECT SEQDSTPARAMINTEGRACAO.NEXTVAL SEQPARAM FROM DUAL');
                              qryAux.Open;

                              qryParamFi.fieldByname('IDDSTPARAMINTEGRACAO').asInteger := qryAux.fieldByname('SEQPARAM').asInteger;
                              qryParamFi.fieldByname('IDPESSOA').asInteger := 1;
                           End;

                        qryParamFi.ApplyUpdates;
                        dtmBaseDados.dbBaseDados.Commit;
                        SelecionaMovimento(0, pcIntegra.ActivePageIndex);
                        Screen.Cursor := crDefault;

                        pnlDadosPrincipalFi.enabled := False;
                        dbgFi.enabled := True;
                     End;
               End
            Else
               Begin
                  If qryParamFo.State In [dsInsert, dsEdit] Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        If qryParamFo.State = dsInsert Then
                           Begin
                              qryAux.SQL.Clear;
                              qryAux.SQL.add('SELECT SEQDSTPARAMINTEGRACAO.NEXTVAL SEQPARAM FROM DUAL');
                              qryAux.Open;

                              qryParamFo.fieldByname('IDDSTPARAMINTEGRACAO').asInteger := qryAux.fieldByname('SEQPARAM').asInteger;
                              qryParamFo.fieldByname('IDPESSOA').asInteger := 1;
                           End;

                        qryParamFo.fieldByname('FLGDESCONTO').asInteger := qryLkpRubrica.fieldByname('FLGDESCONTO').asInteger;

                        qryParamFo.ApplyUpdates;
                        dtmBaseDados.dbBaseDados.Commit;
                        SelecionaMovimento(0, pcIntegra.ActivePageIndex);
                        Screen.Cursor := crDefault;

                        pnlDadosPrincipalFo.enabled := False;
                        dbgFo.enabled := True;
                     End;
               End;

            bbtnCancelarClick(Self);
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDstParam.dbrgTipoRecPagClick(Sender: TObject);
Begin
   dblkpTipoDesemb.setfocus;
End;

Procedure TfrmCadDstParam.dbrgTipoRecPagChange(Sender: TObject);
Begin
   If dbrgTipoRecPag.Itemindex > -1 Then
      Begin
         qryLkpDesembolso.Close;
         qryLkpDesembolso.Parambyname('RECPAG').asString := dbrgTipoRecPag.Values.Strings[dbrgTipoRecPag.Itemindex];
         qryLkpDesembolso.Open;
      End;
End;

Procedure TfrmCadDstParam.dbgFiCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmCadDstParam.dbgFoCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmCadDstParam.pcIntegraChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   AllowChange := True;
   If (qryParamFi.State <> dsBrowse) Then
      AllowChange := False;
End;

Procedure TfrmCadDstParam.SelecionaMovimento(idParamIntegra, ident: Integer);
Begin
   Screen.Cursor := crSQLWait;
   If ident = 0 Then
      Begin
         qryParamFi.Close;
         qryParamFi.SQL.Clear;
         qryParamFi.SQL.Add('SELECT P.*, T1.DESCRICAO,                                                              ');
         qryParamFi.SQL.Add('DECODE(TIPOVIAGEM, 0, ''Institucional'', DECODE(TIPOVIAGEM, 1, ''Treinamento'', ''Audiência'')) AS DSCTIPOVIAGEM,    ');
         qryParamFi.SQL.Add('CASE                                 ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''E'' THEN    ');
         qryParamFi.SQL.Add('      ''Efetivo''                        ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''S'' THEN      ');
         qryParamFi.SQL.Add('        ''LEF''                             ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''T'' THEN        ');
         qryParamFi.SQL.Add('         ''Terceirizado''                    ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''G'' THEN        ');
         qryParamFi.SQL.Add('          ''Estagiário''                       ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''3'' THEN         ');
         qryParamFi.SQL.Add('          ''Cessão''                             ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''P'' THEN           ');
         qryParamFi.SQL.Add('          ''Prop/Dir s/Vinc''                      ');
         qryParamFi.SQL.Add('     WHEN P.TIPOCONTRATO = ''A'' THEN            ');
         qryParamFi.SQL.Add('          ''Autônomo''                           ');
         qryParamFi.SQL.Add('END AS DSCTIPOCONTRATO,                      ');
         qryParamFi.SQL.Add('DECODE(P.RECPAG, ''P'',''Pagamento'', ''Recebimento'') AS DSCPAGREC    ');
         qryParamFi.SQL.Add('FROM DSTPARAMINTEGRACAO P, TIPORECEBDESEMB T1, DSTITEMDESPESA DI  ');
         qryParamFi.SQL.Add('WHERE P.IDPESSOA = T1.IDPESSOA          ');
         qryParamFi.SQL.Add('  AND DI.IDDSTITEMDESPESA = P.INDTIPO      ');
         qryParamFi.SQL.Add('AND P.RECPAG = T1.RECPAG              ');
         qryParamFi.SQL.Add('AND P.CODTIPRECDES = T1.CODTIPRECDES     ');
         If idParamIntegra <> 0 Then
            qryParamFi.SQL.Add('AND P.IDDSTPARAMINTEGRACAO = ' + quotedstr(inttostr(idParamIntegra)))
         Else
            qryParamFi.SQL.Add('AND P.IDDSTPARAMINTEGRACAO <> ' + quotedstr(inttostr(idParamIntegra)));
         qryParamFi.SQL.Add('ORDER BY DI.TIPOQUALIFICACAO, DI.DESCRICAO, DSCTIPOCONTRATO, DSCTIPOVIAGEM, P.RECPAG   ');
         qryParamFi.Open;
      End
   Else
      Begin
         qryParamFo.Close;
         qryParamFo.SQL.Clear;
         qryParamFo.SQL.Add('SELECT P.*, RP.DESCRPROVDESC,    ');
         qryParamFo.SQL.Add('DECODE(P.TIPOVIAGEM, 0, ''Institucional'', DECODE(P.TIPOVIAGEM, 1, ''Treinamento'', ''Audiência'')) AS DSCTIPOVIAGEM,    ');
         qryParamFo.SQL.Add('CASE                                 ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''E'' THEN    ');
         qryParamFo.SQL.Add('      ''Efetivo''                        ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''S'' THEN      ');
         qryParamFo.SQL.Add('        ''LEF''                             ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''T'' THEN        ');
         qryParamFo.SQL.Add('         ''Terceirizado''                    ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''G'' THEN        ');
         qryParamFo.SQL.Add('          ''Estagiário''                       ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''3'' THEN         ');
         qryParamFo.SQL.Add('          ''Cessão''                             ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''P'' THEN           ');
         qryParamFo.SQL.Add('          ''Prop/Dir s/Vinc''                      ');
         qryParamFo.SQL.Add('     WHEN P.TIPOCONTRATO = ''A'' THEN            ');
         qryParamFo.SQL.Add('          ''Autônomo''                           ');
         qryParamFo.SQL.Add('END AS DSCTIPOCONTRATO                      ');
         qryParamFo.SQL.Add('FROM DSTPARAMINTEGRACAO P, RUBRICAXPESS RP, DSTITEMDESPESA DI    ');
         qryParamFo.SQL.Add('WHERE P.IDPROVENTO = RP.IDRUBRICA          ');
         qryParamFo.SQL.Add('  AND DI.IDDSTITEMDESPESA = P.INDTIPO      ');
         If idParamIntegra <> 0 Then
            qryParamFo.SQL.Add('AND P.IDDSTPARAMINTEGRACAO = ' + quotedstr(inttostr(idParamIntegra)))
         Else
            qryParamFo.SQL.Add('AND P.IDDSTPARAMINTEGRACAO <> ' + quotedstr(inttostr(idParamIntegra)));
         qryParamFo.SQL.Add('ORDER BY DI.TIPOQUALIFICACAO, DI.DESCRICAO, DSCTIPOCONTRATO, RP.DESCRPROVDESC, DSCTIPOVIAGEM  ');
         qryParamFo.Open;
      End;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadDstParam.dblkpItemDstFiEnter(Sender: TObject);
Begin
   dblkpItemDstFi.DropDown;
End;

Procedure TfrmCadDstParam.dblkpItemDstFoEnter(Sender: TObject);
Begin
   dblkpItemDstFo.DropDown;
End;

Procedure TfrmCadDstParam.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

End.

