//******************************************************************************************
//N. Sol..........: 137269_7601
//N. Kintana......: 829602
//Data............: 26/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro dos Items de Despesa
//******************************************************************************************
Unit fCadItemDespesa;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBTables, Db, Wwquery, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, ExtCtrls,
   Grids, Wwdbigrd, Wwdbgrid, ImgList, MontaSelect, TB97Ctls, TB97,
   Wwdbspin, DBCtrls, wwdbedit, Mask;

Type
   TfrmCadItemDespesa = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      MontaSelect: TMontaSelect;
      ImlPadrao: TImageList;
      qryAux: TQuery;
      dbgItemDesp: TwwDBGrid;
      pnlFundo: TPanel;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      sep1: TToolbarSep97;
      sep3: TToolbarSep97;
      bbtnSair: TBitBtn;
      bbtnAjuda: TmaHelpBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryItemDespesa: TwwQuery;
      dsTipoDesp: TDataSource;
      Label1: TLabel;
      dbedCodigo: TDBEdit;
      lblDescricao: TLabel;
      dbedDescricao: TwwDBEdit;
      DBRadioGroup1: TDBRadioGroup;
      Label2: TLabel;
      dbSeqApres: TwwDBSpinEdit;
      DBCheckBox2: TDBCheckBox;
      DBCheckBox3: TDBCheckBox;
      DBCheckBox1: TDBCheckBox;
      qryItemDespesaIDDSTITEMDESPESA: TFloatField;
      qryItemDespesaDESCRICAO: TStringField;
      qryItemDespesaFLGATIVA: TStringField;
      qryItemDespesaTIPOQUALIFICACAO: TStringField;
      qryItemDespesaSEQAPRESRESUMO: TFloatField;
      qryItemDespesaFLGINTEGRARFIN: TStringField;
      qryItemDespesaFLGINTEGRARFOL: TStringField;
      Procedure FormCreate(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure dbgItemDespCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgItemDespDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
      { Private declarations }
      Procedure SelecionaMovimento(iddstitemdespesa: Integer);
   Public
      { Public declarations }
   End;

Var
   frmCadItemDespesa: TfrmCadItemDespesa;

Implementation

Uses DBaseDados, UMensErro, uCtrlPadroes;

{$R *.DFM}

Procedure TfrmCadItemDespesa.FormCreate(Sender: TObject);
Begin
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
   pnlFundo.enabled := False;

   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;
   sbtnProcurar.enabled := True;
End;

Procedure TfrmCadItemDespesa.FormShow(Sender: TObject);
Begin
   If frmCadItemDespesa.WindowState = wsNormal Then
      Begin
         frmCadItemDespesa.Top := (Screen.Height - Height) Div 2;
         frmCadItemDespesa.Left := (Screen.Width - Width) Div 2;
      End;

   Screen.Cursor := crSQLWait;
   SelecionaMovimento(0);
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadItemDespesa.SelecionaMovimento(iddstitemdespesa: Integer);
Begin
   Screen.Cursor := crSQLWait;
   qryItemDespesa.Close;
   qryItemDespesa.SQL.Clear;
   qryItemDespesa.SQL.Add('SELECT *               ');
   qryItemDespesa.SQL.Add('FROM DSTITEMDESPESA    ');
   qryItemDespesa.SQL.Add('WHERE                  ');
   If iddstitemdespesa <> 0 Then
      qryItemDespesa.SQL.Add('IDDSTITEMDESPESA = ' + quotedstr(inttostr(iddstitemdespesa)))
   Else
      qryItemDespesa.SQL.Add('IDDSTITEMDESPESA <> 999999999  ');
   qryItemDespesa.SQL.Add('ORDER BY SEQAPRESRESUMO               ');
   qryItemDespesa.Open;
End;

Procedure TfrmCadItemDespesa.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;

   MontaSelect.Caption := 'Selecione um Parâmetro';
   MontaSelect.Executar;
   If (MontaSelect.RetornouValor) Then
      SelecionaMovimento(strtoint(MontaSelect.ValoresChave[0]))
   Else
      SelecionaMovimento(0);
End;

Procedure TfrmCadItemDespesa.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadItemDespesa.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryItemDespesa.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryItemDespesa.CancelUpdates;
               qryItemDespesa.Close;

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
         qryItemDespesa.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadItemDespesa.sbtnInserirClick(Sender: TObject);
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

      pnlFundo.enabled := True;
      dbgItemDesp.enabled := False;

      qryItemDespesa.Insert;
      dbedDescricao.Setfocus;      
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadItemDespesa.bbtnCancelarClick(Sender: TObject);
Begin
   If qryItemDespesa.state In [dsEdit, dsInsert] Then
      Begin
         qryItemDespesa.Cancel;
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.RollBack;
      End;

   SelecionaMovimento(0);

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

   pnlFundo.enabled := False;
   dbgItemDesp.enabled := True;
End;

Procedure TfrmCadItemDespesa.sbtnAlterarClick(Sender: TObject);
Begin
   sbtnAlterar.Down := True;
   If Not qryItemDespesa.IsEmpty Then
      Begin
         If qryItemDespesa.fieldByname('IDDSTITEMDESPESA').asInteger >= 1 Then
            Begin
               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;

                  pnlFundo.enabled := True;
                  dbgItemDesp.enabled := False;

                  qryItemDespesa.Edit;
                  dbedDescricao.Setfocus;
               Except
                  bbtnCancelarClick(Self);
                  Raise;
               End;
            End
         Else
            Begin
               Application.MessageBox('Tipo igual a TOTAL não pode ser alterado. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
               sbtnAlterar.down := False;
            End
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAlterar.down := False;
      End;
End;

Procedure TfrmCadItemDespesa.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryItemDespesa.IsEmpty Then
      Begin
         If qryItemDespesa.fieldByname('IDDSTITEMDESPESA').asInteger > 8 Then
            Begin
               Try
                  If MsgDlg('Confirma Exclusão ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        qryItemDespesa.Delete;

                        dtmBaseDados.dbBaseDados.Commit;

                        SelecionaMovimento(0);

                        Screen.Cursor := crDefault;

                        sbtnInserir.Enabled := True;
                        sbtnAlterar.Enabled := True;
                        sbtnApagar.Enabled := True;
                     End;
                  sbtnApagar.Down := False;
               Except
                  bbtnCancelarClick(Self);
                  Raise;
               End;
            End
         Else
            Begin
               Application.MessageBox('Ítem Básico não pode ser excluído. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
               sbtnApagar.down := False;
            End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TfrmCadItemDespesa.bbtnConfirmarClick(Sender: TObject);
Begin
   If (Trim(dbedDescricao.Text) = '') Then
      Begin
         MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dbedDescricao.SetFocus;
         Exit;
      End;

   If (Trim(dbSeqApres.Text) = '') Then
      Begin
         MsgDlg('Preencha a Sequência de Apresentação do Resumo.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dbSeqApres.SetFocus;
         Exit;
      End;

   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryItemDespesa.State In [dsInsert, dsEdit] Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If qryItemDespesa.State = dsInsert Then
                     Begin
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQDSTITEMDESPESA.NEXTVAL SEQITEM FROM DUAL');
                        qryAux.Open;

                        qryItemDespesa.fieldByname('IDDSTITEMDESPESA').asInteger := qryAux.fieldByname('SEQITEM').asInteger;
                     End;

                  qryItemDespesa.Post;
                  dtmBaseDados.dbBaseDados.Commit;
                  SelecionaMovimento(0);
                  Screen.Cursor := crDefault;

                  bbtnCancelarClick(Self);
               End;                 
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadItemDespesa.dbgItemDespCalcCellColors(Sender: TObject;
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

Procedure TfrmCadItemDespesa.dbgItemDespDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
      Begin
         If (qryItemDespesa.FieldByName('IDDSTITEMDESPESA').asInteger < 0) Then // Total Adiantamento e Total Final
            Begin
               dbgItemDesp.Canvas.Font.Color := clBlack;
               dbgItemDesp.Canvas.Font.Style := [fsbold];
            End;

         dbgItemDesp.DefaultDrawDataCell(Rect, Field, State);
      End;
End;

Procedure TfrmCadItemDespesa.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   Action := caFree;
End;

End.

