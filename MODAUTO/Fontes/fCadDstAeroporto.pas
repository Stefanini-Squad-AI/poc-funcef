//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 24/01/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro de Aeroportos
//******************************************************************************************
Unit fCadDstAeroporto;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, TB97Ctls, TB97, TB97Tlbr, MAHlpBtn, Db, DBTables, Wwquery,
   MontaSelect, ImgList, Buttons, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
   ExtCtrls, DBCtrls, CMProcuraMask, ComCtrls, Mask, wwdbedit, CMProcura,
   DBGrids;

Type
   TfrmDstCadAeroporto = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      MontaSelect: TMontaSelect;
      qryAeroportos: TQuery;
      dsAeroportos: TDataSource;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      sep3: TToolbarSep97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      pnlDadosPrincipal: TPanel;
      lblDescricao: TLabel;
      Label3: TLabel;
      qryAux: TQuery;
      dbedNome: TwwDBEdit;
      dbeCidade: TCMProcura;
      MontaSelectCidade: TMontaSelect;
      qryAeroportosIDDSTAEROPORTO: TFloatField;
      qryAeroportosNMEDSTAEROPORTO: TStringField;
      qryLkpCidade: TwwQuery;
      qryAeroportosIDCIDADES: TFloatField;
      qryLkpCidadeUF: TStringField;
      qryAeroportosUF: TStringField;
      qryLkpCidadeIDCIDADES: TFloatField;
      dbgrdDet: TwwDBGrid;
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
      Procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure qryAeroportosCalcFields(DataSet: TDataSet);
   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   frmDstCadAeroporto: TfrmDstCadAeroporto;

Implementation

Uses DBaseDados, UMensErro, uCtrlPadroes;
{$R *.DFM}

Procedure TfrmDstCadAeroporto.FormCreate(Sender: TObject);
Begin
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
   pnlDadosPrincipal.enabled := False;

   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;
   sbtnProcurar.enabled := True;
End;

Procedure TfrmDstCadAeroporto.FormShow(Sender: TObject);
Begin
   If frmDstCadAeroporto.WindowState = wsNormal Then
      Begin
         frmDstCadAeroporto.Top := (Screen.Height - Height) Div 2;
         frmDstCadAeroporto.Left := (Screen.Width - Width) Div 2;
      End;

   Screen.Cursor := crSQLWait;
   qryAeroportos.Close;
   qryAeroportos.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmDstCadAeroporto.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MontaSelect.Caption := 'Selecione um Aeroporto';
   MontaSelect.Executar;
   If (MontaSelect.RetornouValor) Then
      Begin
         qryAeroportos.Close;
         qryAeroportos.Open;
      End;
End;

Procedure TfrmDstCadAeroporto.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmDstCadAeroporto.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryAeroportos.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Screen.Cursor := crSQLWait;
               qryAeroportos.Cancel;
               qryAeroportos.Close;
               qryLkpCidade.Close;

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
         qryAeroportos.Close;
         qryLkpCidade.Close;
         CanClose := True;
      End;
End;

Procedure TfrmDstCadAeroporto.sbtnAlterarClick(Sender: TObject);
Begin
   sbtnAlterar.Down := True;
   If Not qryAeroportos.IsEmpty Then
      Begin
         If qryAeroportos.State <> dsEdit Then
            Begin
               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;

                  pnlDadosPrincipal.enabled := True;
                  dbgrdDet.enabled := False;

                  qryAeroportos.Edit;
                  dbedNome.Setfocus;
               Except
                  bbtnCancelarClick(Self);
                  Raise;
               End;
            End;
      End
   Else
      Begin
         Application.MessageBox('Sem Aeroporto selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAlterar.down := False;
      End;
End;

Procedure TfrmDstCadAeroporto.sbtnInserirClick(Sender: TObject);
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

      pnlDadosPrincipal.enabled := True;
      dbgrdDet.enabled := False;

      qryAeroportos.Close;
      qryAeroportos.Open;
      qryAeroportos.Insert;

      dbedNome.Setfocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmDstCadAeroporto.bbtnCancelarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryAeroportos.state In [dsEdit, dsInsert] Then
               qryAeroportos.Cancel;

            dtmBaseDados.dbBaseDados.RollBack;
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

      pnlDadosPrincipal.enabled := False;
      dbgrdDet.enabled := True;

   Except
      Raise;
   End;
End;

Procedure TfrmDstCadAeroporto.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryAeroportos.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Aeroporto ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  Screen.Cursor := crSQLWait;
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('SELECT IDDSTAEROPORTO      ');
                  qryAux.SQL.Add('FROM DSTVALORES            ');
                  qryAux.SQL.Add('WHERE IDDSTAEROPORTO = ' + qryAeroportos.fieldbyname('IDDSTAEROPORTO').asString);
                  qryAux.Open;
                  If qryAux.EOF Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.Add('SELECT IDDSTAEROPORTOORIG     ');
                        qryAux.SQL.Add('FROM DSTTRECHO                ');
                        qryAux.SQL.Add('WHERE IDDSTAEROPORTOORIG = ' + qryAeroportos.fieldbyname('IDDSTAEROPORTO').asString);
                        qryAux.SQL.Add('      OR IDDSTAEROPORTODEST = ' + qryAeroportos.fieldbyname('IDDSTAEROPORTO').asString);
                        qryAux.Open;
                        If qryAux.EOF Then
                           Begin
                              qryAeroportos.Delete;
                              dtmBaseDados.dbBaseDados.Commit;

                              qryAeroportos.Close;
                              qryAeroportos.Open;
                              Screen.Cursor := crDefault;
                           End
                        Else
                           Application.MessageBox('Aeroporto foi referenciado no Destacamento. Verifique !', ' Atenção !', mb_ICONEXCLAMATION + mb_OK);
                     End
                  Else
                     Application.MessageBox('Aeroporto foi referenciado no Cadastro de Táxi. Verifique !', ' Atenção !', mb_ICONEXCLAMATION + mb_OK);
               End;
            sbtnApagar.Down := False;
         Except
            On E: Exception Do
               Begin
                  Application.MessageBox(pchar(E.Message), 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  bbtnCancelarClick(Self);
               End;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Aeroporto selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TfrmDstCadAeroporto.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryAeroportos.State In [dsInsert, dsEdit] Then
               Begin

                  If dbeCidade.Text = '' Then
                     Begin
                        MsgDlg('Cidade deve ser preenchida !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbeCidade.setfocus;
                        exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryAeroportos.State = dsInsert Then
                     Begin
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQDSTAEROPORTO.NEXTVAL SEQPARAM FROM DUAL');
                        qryAux.Open;

                        qryAeroportos.fieldByname('IDDSTAEROPORTO').asInteger := qryAux.fieldByname('SEQPARAM').asInteger;
                     End;

                  qryAeroportos.Post;
                  dtmBaseDados.dbBaseDados.Commit;

                  qryAeroportos.Close;
                  qryAeroportos.Open;
                  Screen.Cursor := crDefault;

                  bbtnCancelarClick(Self);
               End;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmDstCadAeroporto.dbgrdDetCalcCellColors(Sender: TObject;
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

Procedure TfrmDstCadAeroporto.qryAeroportosCalcFields(DataSet: TDataSet);
Begin
   qryLkpCidade.Close;
   qryLkpCidade.ParamByName('IDCIDADES').asInteger := qryAeroportos.Fieldbyname('IDCIDADES').asInteger;
   qryLkpCidade.Open;
   qryAeroportos.Fieldbyname('UF').asString := qryLkpCidade.FieldByName('UF').asString;
End;

End.

