//******************************************************************************************
//Rotina..........: fCadHonorariosContratuais
//N. Sol..........: 127753
//N. Kintana......: 682841
//Data............: 25/09/2010
//Responsável.....: Adilson Filho
//Descrição.......: Cadastro para a Inclusão dos Honorarios Contratuais
//******************************************************************************************
Unit fCadHonorariosContratuais;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo,
   ExtCtrls, wwdbedit, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg, CMProcura,
   TREdit;

Type
   TfrmCadHonorariosContratuais = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      dsHonorario: TwwDataSource;
      qryAux: TQuery;
      ds: TwwDataSource;
      pnlFundo: TPanel;
      dbrdgValores: TDBRadioGroup;
      Label2: TLabel;
      dbdescricao: TwwDBEdit;
      Label4: TLabel;
      Label3: TLabel;
      dbVlPrincipal: TDBRealEdit;
      Label17: TLabel;
      dbDtvigencia: TCMDateTimePicker;
      Label5: TLabel;
      dbobservacao: TwwDBEdit;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      ToolbarSep971: TToolbarSep97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      ImlPadrao: TImageList;
      qryHonorario: TwwQuery;
      dbpartes: TDBComboBox;
      MSHonorarios: TMontaSelect;
      qryHonorarioIDHONORCONTRATUALJUR: TFloatField;
      qryHonorarioCLASSJURHONORCONTRATUAL: TFloatField;
      qryHonorarioDESCHONORCONTRATUAL: TStringField;
      qryHonorarioVLRPRINCIPAL: TFloatField;
      qryHonorarioQTDEPARTES: TFloatField;
      qryHonorarioDATAVIGENCIA: TDateTimeField;
      qryHonorarioOBSERVACAO: TStringField;
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
      { Private declarations }
      DataVigencia: TDate;
      Procedure LocalizaVigenciaAtual;
   Public
      { Public declarations }
   End;

Var
   frmCadHonorariosContratuais: TfrmCadHonorariosContratuais;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadHonorariosContratuais.LocalizaVigenciaAtual;
Begin
   Screen.Cursor := crSQLWait;
   qryAux.SQL.Clear;
   qryAux.Close;
   qryAux.SQL.ADD('SELECT DISTINCT MAX(DATAVIGENCIA) AS DATAVIGENCIA FROM HONORCONTRATUALJUR');
   qryAux.Open;
   Screen.Cursor := crDefault;
   DataVigencia := qryAux.FieldByName('DATAVIGENCIA').AsDateTime;
End;

Procedure TfrmCadHonorariosContratuais.sbtnInserirClick(Sender: TObject);
Begin
   Try
      If qryHonorario.State <> dsInsert Then
         Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            LocalizaVigenciaAtual;

            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            pnlFundo.enabled := True;
            qryHonorario.Open;
            qryHonorario.insert;
            qryHonorario.fieldbyname('DataVigencia').asDateTime := DataVigencia;
            qryHonorario.fieldbyname('QTDEPARTES').asInteger := 1;

         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadHonorariosContratuais.FormCreate(Sender: TObject);
Begin
   sbtnInserir.enabled := True;
   sbtnAlterar.enabled := True;
   sbtnApagar.enabled := True;
   sbtnProcurar.Enabled := True;
   pnlfundo.enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
End;

Procedure TfrmCadHonorariosContratuais.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryHonorario.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryHonorario.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryHonorario.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryHonorario.Close;
         CanClose := True;
      End;

End;

Procedure TfrmCadHonorariosContratuais.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryHonorario.isEmpty Then
      Begin
         Try
            LocalizaVigenciaAtual;
            If (qryHonorario.FieldByName('DATAVIGENCIA').AsDateTime < DataVigencia) Then
               Begin
                  ShowMessage('Honorário com Vigência anterior a ' + DateToStr(DataVigencia) + ' não pode ser Alterado !');
                  Exit;
               End;

            If qryHonorario.State <> dsEdit Then
               Begin
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  sbtnAlterar.enabled := False;
                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;

                  pnlFundo.enabled := True;
                  qryHonorario.Edit;
                  dbdescricao.setfocus;
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

Procedure TfrmCadHonorariosContratuais.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryHonorario.isEmpty Then
      Begin
         Try
            LocalizaVigenciaAtual;
            If (qryHonorario.FieldByName('DATAVIGENCIA').AsDateTime < DataVigencia) Then
               Begin
                  ShowMessage('Honorário com Vigência anterior a ' + DateToStr(DataVigencia) + ' não pode ser Excluído !');
                  Exit;
               End;

            If MsgDlg('Confirma exclusão desse Honorário ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  qryAux.Sql.Clear;
                  qryAux.Close;
                  qryaux.sql.add('SELECT IDHONORCONTRATUALJUR   ');
                  qryaux.sql.add('FROM  MOVHONORCONTJUR_COBR    ');
                  qryaux.sql.add('WHERE IDHONORCONTRATUALJUR = ' + qryHonorario.FieldByName('IDHONORCONTRATUALJUR').AsString);
                  qryaux.open;
                  If Not qryAux.IsEmpty Then
                     Begin
                        Application.MessageBox('Honorário não pode ser Excluído, pois esta sendo usado nos Movimentos. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                        bbtnCancelarClick(Self);
                     End
                  Else
                     Begin
                        Screen.Cursor := crSQLWait;
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        qryHonorario.Delete;
                        dtmBaseDados.dbBaseDados.Commit;
                        Screen.Cursor := crDefault;
                     End;
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

Procedure TfrmCadHonorariosContratuais.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSHonorarios.Caption := 'Selecione o Honorário Contatual';
   MSHonorarios.Executar;
   If (MSHonorarios.RetornouValor) Then
      Begin
         Screen.Cursor := crSQLWait;
         qryHonorario.Close;
         qryHonorario.SQL.clear;
         qryHonorario.SQL.Add('SELECT * ');
         qryHonorario.SQL.Add('FROM HONORCONTRATUALJUR');
         qryHonorario.SQL.Add('WHERE IDHONORCONTRATUALJUR = ' + quotedstr(MSHonorarios.ValoresChave[0]));
         qryHonorario.Open;
         Screen.Cursor := crDefault;

         pnlFundo.enabled := False;
         sbtnAlterar.Enabled := True;
         sbtnApagar.enabled := True;
         sbtnInserir.enabled := True;
         bbtnCancelar.enabled := True;
      End;
End;

Procedure TfrmCadHonorariosContratuais.bbtnCancelarClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryHonorario.state In [dsEdit, dsInsert] Then
            dtmBaseDados.dbBaseDados.RollBack;
      End;

   qryHonorario.Close;
   dbVlPrincipal.Value := 0.00;

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
End;

Procedure TfrmCadHonorariosContratuais.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryHonorario.State In [dsInsert, dsEdit] Then
               Begin

                  If (dbDtvigencia.Date < DataVigencia) Then
                     Begin
                        ShowMessage('A Data da Vigência não pode ser Menor que' + ' ' + DateToStr(DataVigencia));
                        dbDtvigencia.setfocus;
                        Exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryHonorario.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQHONORCONTRATUALJUR.NEXTVAL SEQHONORCONTRATUALJUR FROM DUAL');
                        qryAux.Open;
                        qryHonorario.fieldByname('IDHONORCONTRATUALJUR').asInteger := qryAux.fieldByname('SEQHONORCONTRATUALJUR').asInteger;
                     End;

                  qryHonorario.Post;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  bbtnCancelarClick(Self);
               End;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadHonorariosContratuais.FormShow(Sender: TObject);
Begin
   If frmCadHonorariosContratuais.WindowState = wsNormal Then
      Begin
         frmCadHonorariosContratuais.Top := (Screen.Height - Height) Div 2;
         frmCadHonorariosContratuais.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadHonorariosContratuais.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadHonorariosContratuais.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   frmCadHonorariosContratuais := Nil;
End;

End.

