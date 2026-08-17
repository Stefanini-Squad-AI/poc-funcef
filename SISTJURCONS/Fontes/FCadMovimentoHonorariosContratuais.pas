//******************************************************************************************
//Rotina..........: FCadMovimentoHonorariosContratuais
//N. Sol..........: 127753
//N. Kintana......: 682841
//Data............: 01/10/2010
//Responsável.....: Adilson Filho
//Descrição.......: Cadastro para a Inclusão dos Movimentos dos Honorarios Contratuais
//******************************************************************************************
Unit FCadMovimentoHonorariosContratuais;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, ExtCtrls, DBCtrls, CMProcura, Buttons, Wwdbigrd, Grids,
   Wwdbgrid, Mask, wwdbedit, wwdbdatetimepicker, CMDateTimePicker, TB97Ctls,
   TB97, TB97Tlbr, ImgList, MAHlpBtn, ComCtrls, wwdblook, CMDBLookupCombo, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbdlg, jpeg, CMProcuraSubTipo, UMensErro,
   TREdit, Spin;

Type
   TFrmMovimentoHonorariosContratuais = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      pnlDadosPrincipal: TPanel;
      Label12: TLabel;
      Label15: TLabel;
      Label19: TLabel;
      Label27: TLabel;
      Label29: TLabel;
      dbDtEmissao: TCMDateTimePicker;
      dbNumDocto: TwwDBEdit;
      dbQtdProc: TwwDBEdit;
      dbObs: TwwDBEdit;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      pnlCobranca: TPanel;
      dbgCobr: TwwDBGrid;
      wwIButton1: TwwIButton;
      pnlDadosCobr: TPanel;
      Label24: TLabel;
      Dock974: TDock97;
      Label23: TLabel;
      Toolbar974: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      btnExc1: TToolbarButton97;
      Toolbar975: TToolbar97;
      btnCon1: TToolbarButton97;
      btnCan1: TToolbarButton97;
      ImlPadrao: TImageList;
      CMPrestServico: TCMProcuraSubTipo;
      dbrgTipoMov: TDBRadioGroup;
      Label2: TLabel;
      dbDescSubParte: TwwDBEdit;
      Label3: TLabel;
      dbObs2: TwwDBEdit;
      Label4: TLabel;
      qryMovimento: TwwQuery;
      dsMovimento: TwwDataSource;
      qryMovimentoIDESCRITORIO: TFloatField;
      qryMovimentoREFERENCIA: TStringField;
      qryMovimentoTIPOMOVIMENTO: TFloatField;
      qryMovimentoNUMDOC: TStringField;
      qryMovimentoDATAEMISSAODOC: TDateTimeField;
      qryMovimentoQTDPROCESSOS: TFloatField;
      qryMovimentoVALORDOC: TFloatField;
      qryMovimentoOBSERVACAO: TStringField;
      qryMovimentoIDMOVHONORCONTRATUALJUR: TFloatField;
      MSMovimento: TMontaSelect;
      qryCobranca: TwwQuery;
      dsCobranca: TwwDataSource;
      dblkpHonorarios: TwwDBLookupCombo;
      Label13: TLabel;
      Status: TStaticText;
      dbValorSubParte: TDBRealEdit;
      qryHonorario: TwwQuery;
      dsHonorario: TwwDataSource;
      qryCobrancaIDMOVHONORCONTRATUALJUR: TFloatField;
      qryCobrancaIDHONORCONTRATUALJUR: TFloatField;
      qryCobrancaDESCSUBPARTE: TStringField;
      qryCobrancaVALORSUBPARTEC: TFloatField;
      qryCobrancaOBSERVACAO: TStringField;
      qryAux: TQuery;
      qryCobrancaDescHonor: TStringField;
      qryHonorarioDESCHONORCONTRATUAL: TStringField;
      qryHonorarioVLRPRINCIPAL: TFloatField;
      qryHonorarioCLASSJURHONORCONTRATUAL: TStringField;
      qryHonorarioIDHONORCONTRATUALJUR: TFloatField;
      qryHonorarioQTDEPARTES: TFloatField;
      dbClassif: TwwDBEdit;
      Label5: TLabel;
      dbValorTotal: TwwDBEdit;
      mesRef: TComboBox;
      AnoRef: TSpinEdit;
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure btnInc1Click(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
      Procedure btnExc1Click(Sender: TObject);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure dblkpHonorariosCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dbgCobrCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   FrmMovimentoHonorariosContratuais: TFrmMovimentoHonorariosContratuais;

Implementation

{$R *.DFM}

Procedure TFrmMovimentoHonorariosContratuais.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   pnlCobranca.enabled := False;
   pnlDadosCobr.enabled := False;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   btnInc1.enabled := False;
   btnAlt1.enabled := False;
   btnExc1.enabled := False;

   btnCon1.Enabled := False;
   btnCan1.Enabled := False;

   mesRef.ItemIndex := -1;
   AnoRef.Text := '';
End;

Procedure TFrmMovimentoHonorariosContratuais.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TFrmMovimentoHonorariosContratuais.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryMovimento.State In [dsEdit, dsInsert]) Or
      (qryCobranca.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryMovimento.Cancel;
               qryCobranca.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryMovimento.Close;
               qryCobranca.Close;
               qryHonorario.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryMovimento.Close;
         qryCobranca.Close;
         qryHonorario.Close;
         CanClose := True;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.sbtnInserirClick(Sender: TObject);
Begin
   Try
      If qryMovimento.State <> dsInsert Then
         Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            Status.caption := 'Inserindo';
            CMPrestServico.Text := '';
            mesRef.ItemIndex := -1;
            dbValorSubParte.Text := '';
            dbClassif.text := '';
            dbValorTotal.text := '';

            AnoRef.Text := copy(datetostr(date), 7, 4);

            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            pnlDadosPrincipal.enabled := True;
            pnlCobranca.enabled := False;

            qryMovimento.Open;
            qryMovimento.insert;
            CMPrestServico.setfocus;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TFrmMovimentoHonorariosContratuais.bbtnCancelarClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryMovimento.state In [dsEdit, dsInsert] Then
            qryMovimento.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;
      End;

   If status.caption = 'Inserindo' Then
      Begin
         qryMovimento.Close;
         qryCobranca.Close;
         qryHonorario.Close;

         CMPrestServico.Text := '';
         mesRef.ItemIndex := -1;
         AnoRef.Text := '';
         dbValorSubParte.Text := '';
         dbClassif.text := '';
         dbValorTotal.text := '';
         status.caption := '';
      End;

   If status.caption = 'Alterando' Then
      Status.caption := 'Consultando';

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
   pnlCobranca.enabled := True;
   pnlDadosCobr.enabled := false;

   btnCan1.enabled := False;
   btnInc1.down := False;
   btnAlt1.down := False;
End;

Procedure TFrmMovimentoHonorariosContratuais.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryMovimento.State In [dsInsert, dsEdit] Then
               Begin

                  Screen.Cursor := crSQLWait;
                  If qryMovimento.State = dsInsert Then
                     Begin
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQMOVHONORCONTRATUALJUR.NEXTVAL SEQMOV FROM DUAL');
                        qryAux.Open;

                        qryMovimento.fieldByname('IDMOVHONORCONTRATUALJUR').asInteger := qryAux.fieldByname('SEQMOV').asInteger;
                     End;

                  qryMovimento.fieldByname('REFERENCIA').asString := copy(inttostr(100 + mesRef.ItemIndex + 1), 2, 2) + inttostr(anoRef.Value);

                  qryMovimento.Post;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  pnlDadosPrincipal.enabled := False;
                  pnlCobranca.Enabled := True;

                  sbtnInserir.Down := False;
                  sbtnAlterar.Down := False;
                  sbtnApagar.Down := False;
                  sbtnProcurar.Down := False;
                  sbtnInserir.enabled := True;
                  sbtnAlterar.enabled := True;
                  sbtnApagar.enabled := True;
                  sbtnProcurar.enabled := True;

                  btnInc1.enabled := True;
                  btnAlt1.enabled := True;
                  btnExc1.enabled := True;

                  If (Status.caption = 'Alterando') Then
                     Status.caption := 'Consultando';
               End;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TFrmMovimentoHonorariosContratuais.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSMovimento.Caption := 'Selecione um Movimento';
   MSMovimento.Executar;
   Status.caption := '';
   If (MSMovimento.RetornouValor) Then
      Begin
         Screen.Cursor := crSQLWait;
         qryMovimento.Close;
         qryMovimento.SQL.Clear;
         qryMovimento.SQL.Add('SELECT *          	');
         qryMovimento.SQL.Add('FROM MOVHONORCONTRATUALJUR ');
         qryMovimento.SQL.Add('WHERE IDMOVHONORCONTRATUALJUR = ' + quotedstr(MSMovimento.ValoresChave[0]));
         qryMovimento.Open;

         If Not qryMovimento.FieldByName('REFERENCIA').isnull Then
            Begin
               mesRef.ItemIndex := StrToInt(Copy(qryMovimento.FieldByName('REFERENCIA').asstring, 1, 2)) - 1;
               anoRef.Value := StrToInt(Copy(qryMovimento.FieldByName('REFERENCIA').asstring, 3, 4));
            End;

         qryCobranca.close;
         qryCobranca.open;
         qryHonorario.close;
         qryHonorario.open;
         Screen.Cursor := crDefault;

         Status.caption := 'Consultando';

         pnlCobranca.enabled := True;

         btnInc1.enabled := True;
         btnAlt1.enabled := True;
         btnExc1.enabled := True;

         If (dblkpHonorarios.Text = '') Then
            Begin
               dbClassif.text := '';
               dbValorTotal.text := '';
            End;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.btnInc1Click(Sender: TObject);
Begin
   If Not qryMovimento.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlCobranca.enabled := True;
            dbgCobr.enabled := False;
            pnlDadosCobr.enabled := True;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            qryHonorario.Open;
            qryCobranca.Open;
            qryCobranca.insert;
            dbClassif.text := '';
            dbValorTotal.text := '';
            dblkpHonorarios.setfocus;
         Except
            btnCan1Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Movimento selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc1.down := False;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.btnCan1Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryCobranca.state In [dsEdit, dsInsert] Then
            qryCobranca.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryCobranca.Close;
         qryCobranca.Open;
      End;

   pnlCobranca.enabled := True;
   dbgCobr.enabled := True;
   pnlDadosCobr.enabled := False;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;
   btnCon1.enabled := False;
   btnCan1.enabled := False;
   btnInc1.down := False;
   btnAlt1.down := False;
   btnCon1.down := False;

   sbtnInserir.enabled := True;
   sbtnApagar.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnProcurar.enabled := True;
End;

Procedure TFrmMovimentoHonorariosContratuais.btnExc1Click(Sender: TObject);
Begin
   If Not qryCobranca.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Ítem de Cobrança ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryCobranca.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;
               End;
         Except
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnExc1.Down := False;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.btnAlt1Click(Sender: TObject);
Begin
   If Not qryCobranca.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlCobranca.enabled := True;
            dbgCobr.enabled := False;
            pnlDadosCobr.enabled := True;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.enabled := True;
            btnCan1.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            qryCobranca.Edit;
            dblkpHonorarios.setfocus;
         Except
            btnCan1Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnAlt1.down := False;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.btnCon1Click(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryCobranca.State In [dsInsert, dsEdit] Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If qryCobranca.State = dsInsert Then
                     qryCobranca.fieldByname('IDMOVHONORCONTRATUALJUR').asInteger := qryMovimento.fieldByname('IDMOVHONORCONTRATUALJUR').asInteger;

                  qryCobranca.post;
                  dtmBaseDados.dbBaseDados.Commit;
                  qryCobranca.Close;
                  qryCobranca.Open;
                  Screen.Cursor := crDefault;

                  pnlCobranca.enabled := True;
                  dbgCobr.enabled := True;
                  pnlDadosCobr.enabled := False;

                  btnInc1.enabled := True;
                  btnAlt1.enabled := True;
                  btnExc1.enabled := True;
                  btnCon1.enabled := False;
                  btnCan1.enabled := False;
                  btnInc1.down := False;
                  btnAlt1.down := False;

                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := True;
                  sbtnAlterar.Down := False;
                  sbtnAlterar.enabled := True;
                  sbtnApagar.Down := False;
                  sbtnApagar.enabled := True;
                  sbtnProcurar.Down := False;
                  sbtnProcurar.enabled := True;
                  btnCon1.down := False;
               End;
         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;

End;

Procedure TFrmMovimentoHonorariosContratuais.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryMovimento.isEmpty Then
      Begin
         Try
            If qryMovimento.State <> dsEdit Then
               Begin
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  Status.caption := 'Alterando';
                  sbtnAlterar.enabled := False;
                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;

                  pnlDadosPrincipal.enabled := True;
                  qryMovimento.Edit;
                  pnlCobranca.Enabled := False;
                  pnlDadosCobr.enabled := False;
                  CMPrestServico.setfocus;
               End;
         Except
            bbtnCancelarClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAlterar.down := False;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.FormShow(Sender: TObject);
Begin
   If FrmMovimentoHonorariosContratuais.WindowState = wsNormal Then
      Begin
         FrmMovimentoHonorariosContratuais.Top := (Screen.Height - Height) Div 2;
         FrmMovimentoHonorariosContratuais.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryMovimento.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão desse Movimento ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryMovimento.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  Status.caption := '';

                  qryHonorario.close;
                  mesRef.ItemIndex := -1;
                  AnoRef.Text := '';

                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := True;
                  sbtnAlterar.Down := False;
                  sbtnAlterar.enabled := True;
                  sbtnApagar.Down := False;
                  sbtnApagar.enabled := True;
                  sbtnProcurar.Down := False;
                  sbtnProcurar.enabled := True;

                  btnCan1.enabled := False;
                  btnInc1.down := False;
                  btnAlt1.down := False;
                  pnlDadosCobr.enabled := false;

                  bbtnConfirmar.enabled := False;
                  bbtnCancelar.enabled := False;

               End;
            sbtnApagar.Down := False;
         Except
            bbtnCancelarClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.dblkpHonorariosCloseUp(
   Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   If ((qryHonorario.FieldByName('CLASSJURHONORCONTRATUAL').asString = '0') Or // Valor Fixo
      (qryHonorario.FieldByName('CLASSJURHONORCONTRATUAL').asString = '2')) Then // Valor ADM
      Begin
         dbValorSubParte.value := qryHonorario.FieldbyName('VLRPRINCIPAL').asFloat;
         dbDescSubParte.Enabled := false;
         dbValorSubParte.setfocus;
      End
   Else
      Begin // Valor Eventual
         dbValorSubParte.Text := FloatToStr(qryHonorario.FieldByName('VLRPRINCIPAL').asFloat / qryHonorario.FieldByName('QTDEPARTES').asFloat);
         dbDescSubParte.Enabled := True;
         dbValorSubParte.setfocus;
      End;
End;

Procedure TFrmMovimentoHonorariosContratuais.dbgCobrCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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

Procedure TFrmMovimentoHonorariosContratuais.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FrmMovimentoHonorariosContratuais := Nil;
End;

End.

