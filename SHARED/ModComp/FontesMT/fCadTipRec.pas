//********************************************************************************************************
//N. Sol..........: 174225
//N. Kintana......: 1572025
//Data............: 14/02/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Trcando o campo IDTIPOPROC pelo IDPROGRAMA usado na tabela TIPORECEBDESEMB
//********************************************************************************************************
//N. Sol..........: 170769
//N. Kintana......: 1525972
//Data............: 22/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo FLGEXIGELANCVALOR para permitir ou não a inclusão de etapas com valores zerados
//********************************************************************************************************
//Rotina..........: fCadTipRec
//N. Sol..........: 161760
//N. Kintana......: 1379145
//Data............: 08/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo RECPAG
//*******************************************************************
//Rotina..........: fCadTipRec
//N. Sol..........: 156018
//N. Kintana......: 1228602
//Data............: 04/06/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão da rotina do Desembolso por Etapa
//*******************************************************************
Unit fCadTipRec;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, TabControlDetalhe, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, CMProcuraSubTipo, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg,
   TREdit, DBGrids;

Type
   TfrmCadTipRec = Class(TForm)
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      dsEtapas: TwwDataSource;
      qryAux: TQuery;
      Status: TStaticText;
      pnlDadosPrincipal: TPanel;
      dsEtapasDesemb: TwwDataSource;
      qryEtapas: TQuery;
      pcDesembolsos: TPageControl;
      TabSheet1: TTabSheet;
      pnlReus: TPanel;
      Dock975: TDock97;
      Toolbar973: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      btnExc1: TToolbarButton97;
      Toolbar972: TToolbar97;
      btnCon1: TToolbarButton97;
      btnCan1: TToolbarButton97;
      pnlDadosDesemb: TPanel;
      qryLkpPrograma: TQuery;
      dbgDesemb: TwwDBGrid;
      wwIButton1: TwwIButton;
      lblCentroCusto: TLabel;
      lkcbPrograma: TwwDBLookupCombo;
      dblckTipoDesemb: TwwDBLookupCombo;
      Label1: TLabel;
      Label2: TLabel;
      dbedCodigo: TDBEdit;
      Label4: TLabel;
      dbedDescr: TDBEdit;
      rgPenhora: TDBRadioGroup;
      rgEncerramento: TDBRadioGroup;
      dbrgFlgExec: TDBRadioGroup;
      gbxRecursos: TGroupBox;
      Label5: TLabel;
      dblckIndRecursos: TwwDBLookupCombo;
      dbredJurosRecursos1: TDBRealEdit;
      dbrgIndJuros: TDBRadioGroup;
      DBCheckBox1: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      MSDesembolso: TMontaSelect;
      qryEtapasCODTIPORECURSO: TFloatField;
      qryEtapasDESCRICAO: TStringField;
      qryEtapasVALORHONOR: TFloatField;
      qryEtapasFLGPENHORA: TFloatField;
      qryEtapasFLGENCERRAMENTO: TFloatField;
      qryEtapasMOECODIGO: TFloatField;
      qryEtapasINDJUROS: TFloatField;
      qryEtapasTAXAJUROS: TFloatField;
      qryEtapasFLGEXECUCAO: TFloatField;
      qryLkpDesembolso: TQuery;
      qryLkpIndices: TQuery;
      qryLkpIndicesMOECODIGO: TFloatField;
      qryLkpIndicesMOEDESC: TStringField;
      qryLkpIndicesMOESIGLA: TStringField;
      qryLkpDesembolsoCODTIPRECDES: TStringField;
      qryLkpDesembolsoDESCRICAO: TStringField;
      qryEtapasFLGINTEGRAFINANCEIRO: TStringField;
      qryEtapasFLGINTEGRACONTABIL: TStringField;
      rdgTipo: TDBRadioGroup;
      qryEtapasRECPAG: TStringField;
      DBCheckBox3: TDBCheckBox;
      qryEtapasFLGEXIGELANCVALOR: TStringField;
    qryLkpProgramaIDPROGRAMA: TFloatField;
    qryLkpProgramaDESCPROGRAMA: TStringField;
    qryEtapasDesemb: TQuery;
    qryEtapasDesembDESCDESEMB: TStringField;
    qryEtapasDesembIDJURETAPADESEMBOLSO: TFloatField;
    qryEtapasDesembCODTIPORECURSO: TFloatField;
    qryEtapasDesembIDTIPOPROC: TFloatField;
    qryEtapasDesembCODTIPRECDES: TStringField;
    qryEtapasDesembRECPAG: TStringField;
    qryEtapasDesembIDPROGRAMA: TFloatField;
    qryEtapasDesembDESCPROGRAMA: TStringField;
      Procedure FormCreate(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure btnInc1Click(Sender: TObject);
      Procedure pcDesembolsosChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure btnExc1Click(Sender: TObject);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
   Private

   Public
      { Public declarations }
   End;
Var
   frmCadTipRec: TfrmCadTipRec;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadTipRec.FormShow(Sender: TObject);
Begin
   If frmCadTipRec.WindowState = wsNormal Then
      Begin
         frmCadTipRec.Top := (Screen.Height - Height) Div 2;
         frmCadTipRec.Left := (Screen.Width - Width) Div 2;
      End;

   Screen.Cursor := crSQLWait;
   qryLkpPrograma.Close;
   qryLkpPrograma.Open;
   qryLkpDesembolso.Close;
   qryLkpDesembolso.Open;
   qryLkpIndices.Close;
   qryLkpIndices.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadTipRec.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   dbgDesemb.enabled := False;
   pnlDadosDesemb.enabled := False;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   btnInc1.enabled := False;
   btnAlt1.enabled := False;
   btnExc1.enabled := False;
   btnCon1.Enabled := False;
   btnCan1.Enabled := False;
End;

Procedure TfrmCadTipRec.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSDesembolso.Caption := 'Selecione uma Etapa';
   MSDesembolso.Executar;
   Status.caption := '';
   If (MSDesembolso.RetornouValor) Then
      Begin
         Screen.Cursor := crSQLWait;
         qryEtapas.Close;
         qryEtapas.SQL.Clear;
         qryEtapas.SQL.Add('SELECT *          	');
         qryEtapas.SQL.Add('FROM TIPORECTRAB ');
         qryEtapas.SQL.Add('WHERE CODTIPORECURSO = ' + quotedstr(MSDesembolso.ValoresChave[0]));
         qryEtapas.Open;

         qryEtapasDesemb.Close;
         qryEtapasDesemb.Open;
         Screen.Cursor := crDefault;

         Status.caption := 'Consultando';

         dbgDesemb.enabled := True;

         btnInc1.enabled := True;
         btnAlt1.enabled := True;
         btnExc1.enabled := True;
      End;
End;

Procedure TfrmCadTipRec.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryEtapas.State In [dsEdit, dsInsert]) Or
      (qryEtapasDesemb.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryEtapas.Cancel;
               qryEtapasDesemb.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryEtapasDesemb.Close;
               qryEtapas.Close;
               qryLkpPrograma.Close;
               qryLkpDesembolso.Close;
               qryLkpIndices.Close;
               qryAux.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryEtapasDesemb.Close;
         qryEtapas.Close;
         qryLkpPrograma.Close;
         qryLkpDesembolso.Close;
         qryLkpIndices.Close;
         qryAux.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadTipRec.bbtnSairClick(Sender: TObject);
Begin
   If (qryEtapasFLGINTEGRAFINANCEIRO.AsString = 'S') And
      (qryEtapasDesemb.isEmpty) Then
      Begin
         MsgDlg('Se a Etapa integra financeiro, então é obrigatório informar um Desembolso.', 'Aviso', mtWarning, [mbOk], 0);
         exit;
      End;

   Close;
End;

Procedure TfrmCadTipRec.sbtnInserirClick(Sender: TObject);
Begin
   Try
      If qryEtapas.State <> dsInsert Then
         Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            Status.caption := 'Inserindo';
            sbtnInserir.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            btnInc1.enabled := False;
            btnAlt1.enabled := False;
            btnExc1.enabled := False;

            pnlDadosPrincipal.enabled := True;
            pcDesembolsos.enabled := False;

            qryEtapasDesemb.Close;
            qryEtapas.Open;

            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.add('SELECT (MAX(CODTIPORECURSO) + 1) ULT_ETAPA FROM TIPORECTRAB');
            qryAux.Open;

            qryEtapas.insert;
            qryEtapasCODTIPORECURSO.Value := qryAux.fieldByname('ULT_ETAPA').asInteger;
            qryEtapasFLGINTEGRAFINANCEIRO.asString := 'N';
            qryEtapasFLGINTEGRACONTABIL.asString := 'N';
            qryEtapasFLGEXIGELANCVALOR.asString := 'S';
            dbedDescr.setfocus;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadTipRec.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryEtapas.isEmpty Then
      Begin
         Try
            If qryEtapas.State <> dsEdit Then
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
                  pcDesembolsos.enabled := False;

                  qryEtapas.Edit;
                  dbedDescr.setfocus;
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

Procedure TfrmCadTipRec.bbtnCancelarClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryEtapas.state In [dsEdit, dsInsert] Then
            qryEtapas.Cancel;
         dtmBaseDados.dbBaseDados.RollBack;
      End;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;

   If status.caption = 'Inserindo' Then
      Begin
         qryEtapas.Close;
         qryEtapasDesemb.Close;
         Status.caption := '';

         btnInc1.enabled := False;
         btnAlt1.enabled := False;
         btnExc1.enabled := False;
      End;

   If Status.caption = 'Alterando' Then
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
   pcDesembolsos.enabled := True;
End;

Procedure TfrmCadTipRec.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryEtapas.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão dessa Etapa ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryEtapas.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  Status.caption := '';
                  btnInc1.enabled := False;
                  btnAlt1.enabled := False;
                  btnExc1.enabled := False;
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

Procedure TfrmCadTipRec.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryEtapas.State In [dsInsert, dsEdit] Then
               Begin
                  qryEtapas.Post;
                  dtmBaseDados.dbBaseDados.Commit;

                  pnlDadosPrincipal.enabled := False;
                  pcDesembolsos.enabled := True;

                  sbtnInserir.Down := False;
                  sbtnAlterar.Down := False;
                  sbtnApagar.Down := False;
                  sbtnProcurar.Down := False;
                  bbtnConfirmar.enabled := False;

                  If (Status.caption = 'Inserindo') Then
                     Begin
                        btnInc1.enabled := True;
                        btnAlt1.enabled := True;
                        btnExc1.enabled := True;
                     End;

                  If (Status.caption = 'Alterando') Then
                     bbtnCancelarClick(Self);
               End;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadTipRec.pcDesembolsosChanging(Sender: TObject; Var AllowChange: Boolean);
Begin

End;

// *********************** DESEMBOLSO ***************************************

Procedure TfrmCadTipRec.btnInc1Click(Sender: TObject);
Begin
   If Not qryEtapas.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pcDesembolsos.enabled := True;

            dbgDesemb.enabled := False;
            pnlDadosDesemb.enabled := True;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryEtapasDesemb.Open;
            qryEtapasDesemb.insert;
            lkcbPrograma.setfocus;
         Except
            btnCan1Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Reembolso selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc1.down := False;
      End;
End;

Procedure TfrmCadTipRec.btnExc1Click(Sender: TObject);
Begin
   If Not qryEtapasDesemb.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Desembolso ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryEtapasDesemb.Delete;

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

Procedure TfrmCadTipRec.btnAlt1Click(Sender: TObject);
Begin
   If Not qryEtapasDesemb.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            dbgDesemb.enabled := True;

            pnlDadosDesemb.enabled := True;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.enabled := True;
            btnCan1.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryEtapasDesemb.Edit;
            lkcbPrograma.setfocus;
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

Procedure TfrmCadTipRec.btnCon1Click(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If (qryEtapas.fieldByname('FLGINTEGRAFINANCEIRO').asString = 'S') And
               (qryEtapasDesemb.fieldByname('CODTIPRECDES').isnull) Then
               Begin
                  Application.MessageBox('Desembolso não informado !', 'Atenção !', Mb_IconExclamation);
                  Exit;
               End;

            If qryEtapasDesemb.State = dsInsert Then
               Begin
                  If lkcbPrograma.value <> '' Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT CODTIPORECURSO ');
                        qryAux.SQL.add('FROM JUR_ETAPA_DESEMBOLSO ');
                        qryAux.SQL.add('WHERE CODTIPORECURSO = ' + quotedstr(qryEtapas.fieldbyname('CODTIPORECURSO').asString));
                        qryAux.SQL.add('      AND IDPROGRAMA = ' + quotedstr(qryEtapasDesemb.fieldbyname('IDPROGRAMA').asString));
                        qryAux.SQL.add('      AND CODTIPRECDES = ' + quotedstr(qryEtapasDesemb.fieldbyname('CODTIPRECDES').asString));
                        // SOL 161760 KTN 1379145 - Paulo Nobre
                        qryAux.SQL.add('      AND RECPAG = ' + quotedstr(qryEtapas.fieldbyname('RECPAG').asString));
                        qryAux.Open;
                        Screen.Cursor := crDefault;
                        If Not qryAux.EOF Then
                           Begin
                              Application.MessageBox('Programa e Desembolso já lançados. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                              btnCan1Click(Self);
                              Exit;
                           End;
                     End
                  Else
                     Begin
                        Screen.Cursor := crSQLWait;
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT CODTIPRECDES ');
                        qryAux.SQL.add('FROM JUR_ETAPA_DESEMBOLSO ');
                        qryAux.SQL.add('WHERE CODTIPORECURSO = ' + quotedstr(qryEtapas.fieldbyname('CODTIPORECURSO').asString));
                        qryAux.SQL.add('      AND CODTIPRECDES = ' + quotedstr(qryEtapasDesemb.fieldbyname('CODTIPRECDES').asString));
                        // SOL 161760 KTN 1379145 - Paulo Nobre
                        qryAux.SQL.add('      AND RECPAG = ' + quotedstr(qryEtapas.fieldbyname('RECPAG').asString));
                        qryAux.Open;
                        Screen.Cursor := crDefault;
                        If Not qryAux.EOF Then
                           Begin
                              Application.MessageBox('Desembolso já lançado. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                              btnCan1Click(Self);
                              exit;
                           End;
                     End;

                  Screen.Cursor := crSQLWait;
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SEQJURETAPADESEMBOLSO.NEXTVAL SEQ FROM DUAL');
                  qryAux.Open;
                  Screen.Cursor := crDefault;

                  qryEtapasDesemb.fieldByname('IDJURETAPADESEMBOLSO').asInteger := qryAux.fieldByname('SEQ').asInteger;
                  qryEtapasDesemb.fieldByname('CODTIPORECURSO').asInteger := qryEtapas.fieldByname('CODTIPORECURSO').asInteger;
               End;

            // SOL 161760 KTN 1379145 - Paulo Nobre
            qryEtapasDesemb.fieldByname('RECPAG').asString := qryEtapas.fieldByname('RECPAG').asString;

            qryEtapasDesemb.post;
            dtmBaseDados.dbBaseDados.Commit;
            qryEtapasDesemb.Close;
            qryEtapasDesemb.Open;
            Screen.Cursor := crDefault;

            dbgDesemb.enabled := True;
            pnlDadosDesemb.enabled := False;
            btnInc1.enabled := True;
            btnAlt1.enabled := True;
            btnExc1.enabled := True;
            btnCon1.enabled := False;
            btnCan1.enabled := False;
            btnInc1.down := False;
            btnAlt1.down := False;
            btnCon1.down := False;

            If status.caption <> 'Inserindo' Then
               Begin
                  sbtnInserir.enabled := True;
                  sbtnApagar.enabled := True;
                  sbtnAlterar.enabled := True;
                  sbtnProcurar.enabled := True;
               End;

         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;
End;

Procedure TfrmCadTipRec.btnCan1Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryEtapasDesemb.state In [dsEdit, dsInsert] Then
            qryEtapasDesemb.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryEtapasDesemb.Close;
         qryEtapasDesemb.Open;
      End;

   pnlDadosPrincipal.enabled := False;
   dbgDesemb.enabled := True;
   pnlDadosDesemb.enabled := False;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;
   btnCon1.enabled := False;
   btnCan1.enabled := False;
   btnInc1.down := False;
   btnAlt1.down := False;
   btnCon1.down := False;

   If status.caption <> 'Inserindo' Then
      Begin
         sbtnInserir.enabled := True;
         sbtnApagar.enabled := True;
         sbtnAlterar.enabled := True;
         sbtnProcurar.enabled := True;
      End;
End;

End.

