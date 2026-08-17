//********************************************************************************************************
//N. Sol..........: 174225
//N. Kintana......: 1572025
//Data............: 06/02/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro das Associações entre Etapas e Objetos do Processo
//********************************************************************************************************
Unit fCadEtapasXObjetos;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, TabControlDetalhe, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg,
   Spin, TREdit, DBClient, uCMClientDataSet, uCmSqlParams, FCadastroMT,
   CheckLst, ColorCheckListBox;

Type
   TfrmCadEtapasXObjetos = Class(TForm)
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
      dsEtapaObj: TwwDataSource;
      pnlDadosPrincipal: TPanel;
      qryAux: TQuery;
      qryEtapaObj: TwwQuery;
      qryLkpObjProcesso: TwwQuery;
      qryLkpObjProcessoDESCRICAO: TStringField;
      qryLkpObjProcessoCODTIPOOBJETO: TFloatField;
      dbGrd: TwwDBGrid;
      Label33: TLabel;
      dbcObjetos: TwwDBLookupCombo;
      qryEtapaObjNUMPROCTRAB: TFloatField;
      qryEtapaObjCODTIPORECURSO: TFloatField;
      qryEtapaObjNUMSEQ: TFloatField;
      qryEtapaObjCODTIPOOBJETO: TFloatField;
      qryAuxObj: TwwQuery;
      qryEtapaObjNMEOBJETO: TStringField;
      qryAuxObjDESCRICAO: TStringField;
      qryEtapaObjIDJURETAPAXOBJETOPROC: TFloatField;
    UpdEtapaObj: TUpdateSQL;
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure FormCreate(Sender: TObject);
      Procedure dbcObjetosEnter(Sender: TObject);
      Procedure qryEtapaObjCalcFields(DataSet: TDataSet);
      Procedure dbGrdCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
   Private
      { Private declarations }
   Public
      Procedure ExibirTela(NumProcTrab, NumSeq, CodTipoRecurso, Sit: double);
      { Public declarations }
   End;

Var
   frmCadEtapasXObjetos: TfrmCadEtapasXObjetos;
   iNumProcTrab, iNumSeq, iCodTipoRecurso: double;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadEtapasXObjetos.ExibirTela(NumProcTrab, NumSeq, CodTipoRecurso, Sit: double);
Begin
   iNumProcTrab := NumProcTrab;
   iCodTipoRecurso := CodTipoRecurso;
   iNumSeq := NumSeq;

   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   qryEtapaObj.Close;
   qryEtapaObj.SQL.Clear;
   qryEtapaObj.SQL.ADD('SELECT IDJURETAPAXOBJETOPROC,    ');
   qryEtapaObj.SQL.ADD('NUMPROCTRAB,                    ');
   qryEtapaObj.SQL.ADD('CODTIPORECURSO,              ');
   qryEtapaObj.SQL.ADD('NUMSEQ,                    ');
   qryEtapaObj.SQL.ADD('CODTIPOOBJETO              ');
   qryEtapaObj.SQL.ADD('FROM JUR_ETAPAXOBJETOPROC   ');
   qryEtapaObj.SQL.ADD('WHERE NUMPROCTRAB = ' + FloatToStr(iNumProcTrab));
   qryEtapaObj.SQL.ADD('      AND NUMSEQ = ' + FloatToStr(iNumSeq));
   qryEtapaObj.SQL.ADD('      AND CODTIPORECURSO = ' + FloatToStr(iCodTipoRecurso));
   qryEtapaObj.SQL.ADD('ORDER BY CODTIPOOBJETO  ');
   qryEtapaObj.Open;

   qryLkpObjProcesso.Close;
   qryLkpObjProcesso.ParamByName('NUMPROCTRAB').asFloat := iNumProcTrab;
   qryLkpObjProcesso.Open;

   If sit = 1 Then
      Begin
         sbtnInserir.enabled := False;
         sbtnAlterar.enabled := False;
         sbtnApagar.enabled := False;

         bbtnConfirmar.enabled := False;
         bbtnCancelar.enabled := False;
      End;
End;

Procedure TfrmCadEtapasXObjetos.FormShow(Sender: TObject);
Begin
   If frmCadEtapasXObjetos.WindowState = wsNormal Then
      Begin
         frmCadEtapasXObjetos.Top := (Screen.Height - Height) Div 2;
         frmCadEtapasXObjetos.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadEtapasXObjetos.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryEtapaObj.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryEtapaObj.Cancel;
               qryEtapaObj.Close;
               qryAux.Close;
               qryAuxObj.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryEtapaObj.Close;
         qryAux.Close;
         qryAuxObj.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadEtapasXObjetos.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadEtapasXObjetos.sbtnInserirClick(Sender: TObject);
Begin
   Try
      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      dbGrd.enabled := False;
      pnlDadosPrincipal.enabled := True;
      qryEtapaObj.Insert;
      dbcObjetos.SetFocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadEtapasXObjetos.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryEtapaObj.IsEmpty Then
      Begin
         Try
            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            dbGrd.enabled := False;
            pnlDadosPrincipal.enabled := True;
            qryEtapaObj.edit;
            dbcObjetos.SetFocus;
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

Procedure TfrmCadEtapasXObjetos.bbtnCancelarClick(Sender: TObject);
Begin
   If qryEtapaObj.state In [dsEdit, dsInsert] Then
      qryEtapaObj.CancelUpdates;

   sbtnInserir.Down := False;
   sbtnInserir.enabled := True;

   If sbtnInserir.Down = False Then
      Begin
         sbtnInserir.enabled := True;
         sbtnAlterar.Down := False;
         sbtnAlterar.enabled := True;
         sbtnApagar.Down := False;
         sbtnApagar.enabled := True;
      End;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   dbGrd.enabled := True;
   pnlDadosPrincipal.enabled := False;
End;

Procedure TfrmCadEtapasXObjetos.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryEtapaObj.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão desse Lançamento ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;

                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('DELETE JUR_ETAPAXOBJETOPROC WHERE IDJURETAPAXOBJETOPROC = ' + qryEtapaObj.FieldByName('IDJURETAPAXOBJETOPROC').asString);
                  qryAux.ExecSQL;
                  qryEtapaObj.Close;
                  qryEtapaObj.Open;
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
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TfrmCadEtapasXObjetos.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If qryEtapaObj.State In [dsInsert, dsEdit] Then
         Begin
            Screen.Cursor := crSQLWait;
            If qryEtapaObj.State = dsInsert Then
               Begin
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SEQJURETAPAXOBJETOPROC.NEXTVAL SEQ FROM DUAL');
                  qryAux.Open;

                  qryEtapaObj.FieldByName('IDJURETAPAXOBJETOPROC').AsFloat := qryAux.fieldByname('SEQ').asInteger;
                  qryEtapaObj.FieldByName('NUMPROCTRAB').AsFloat := iNumProcTrab;
                  qryEtapaObj.FieldByName('NUMSEQ').AsFloat := iNumSeq;
                  qryEtapaObj.FieldByName('CODTIPORECURSO').AsFloat := iCodTipoRecurso;

                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := False;
               End;

            qryEtapaObj.ApplyUpdates;
            qryEtapaObj.Close;
            qryEtapaObj.Open;

            Screen.Cursor := crDefault;

            sbtnAlterar.Down := False;
            sbtnAlterar.enabled := True;
            sbtnApagar.Down := False;
            sbtnApagar.enabled := True;
            sbtnInserir.Down := False;
            sbtnInserir.enabled := True;

            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            dbGrd.enabled := True;
            pnlDadosPrincipal.enabled := False;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadEtapasXObjetos.FormCreate(Sender: TObject);
Begin
   dbGrd.enabled := True;
   pnlDadosPrincipal.enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
End;

Procedure TfrmCadEtapasXObjetos.dbcObjetosEnter(Sender: TObject);
Begin
   dbcObjetos.DropDown;
End;

Procedure TfrmCadEtapasXObjetos.qryEtapaObjCalcFields(DataSet: TDataSet);
Begin
   qryAuxObj.Close;
   qryAuxObj.Parambyname('CODTIPOOBJETO').asfloat := qryEtapaObj.Fieldbyname('CODTIPOOBJETO').asfloat;
   qryAuxObj.Open;

   qryEtapaObj.fieldbyname('NMEOBJETO').asString := qryAuxObj.fieldByname('DESCRICAO').asString;
End;

Procedure TfrmCadEtapasXObjetos.dbGrdCalcCellColors(Sender: TObject;
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

End.

