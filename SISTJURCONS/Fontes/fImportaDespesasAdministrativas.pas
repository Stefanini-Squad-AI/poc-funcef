//******************************************************************************************
//Rotina..........: fImportaDespesasAdministrativas
//N. Sol..........: 127754
//N. Kintana......: 682842
//Data............: 29/03/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Desenvolvimento da Importação do Movimento das Despesas Administrativas
//******************************************************************************************
// Forma do Lançamento (M - Manual / I - Importado)
Unit fImportaDespesasAdministrativas;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, ImgList, ExtCtrls, wwdblook, CMDBLookupCombo,
   CMProcura, jpeg, Db, Wwdatsrc, CmEventosCadastro, DBTables, Wwquery,
   MontaSelect, FCadastroMT, ToolWin, DBaseDados;

Type
   TfrmImportaDespesasAdministrativas = Class(TForm)
      ImlPadrao: TImageList;
      qryMovTemp: TwwQuery;
      dsMovTemp: TwwDataSource;
      dbGrdDespAdm: TwwDBGrid;
      Dock971: TDock97;
      qryLkpTipoDesp: TwwQuery;
      qryLkpTipoDespIDTIPODESPADMJUR: TFloatField;
      qryLkpTipoDespDESCTIPODESPADMJUR: TStringField;
      qryLkpTipoDespFLGRATEAVEL: TStringField;
      qryLkpTipoDespFLGATIVA: TStringField;
      qryMovTempCODESTADO: TStringField;
      qryMovTempIDPAIS: TFloatField;
      qryMovTempIDPESSOA: TFloatField;
      qryMovTempNUMPROCTRAB: TFloatField;
      qryMovTempDATADESPADM: TDateTimeField;
      qryMovTempIDTIPODESPADMJUR: TFloatField;
      qryMovTempVALORDESPESAADM: TFloatField;
      qryMovTempDATAFECHAMENTO: TDateTimeField;
      Panel1: TPanel;
      qryImporta: TwwQuery;
      qryMovTempDescTipoDespesa: TStringField;
      Toolbar973: TToolbar97;
      maSair: TBitBtn;
      btnImportar: TBitBtn;
      qryAux: TQuery;
      dbGrdDespAdmIButton: TwwIButton;
      qryMovTempDescRazaoSocial: TStringField;
      qryLkpPessoa: TwwQuery;
      qryLkpPessoaIDPESSOA: TFloatField;
      qryLkpPessoaRAZAOSOCIAL: TStringField;
      qryMovTempIDMOVDESPWEB: TFloatField;
      btnConferir: TBitBtn;
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      qryMovTempNUMLOTE: TFloatField;
      qryMovTempDTINCLUSAO: TDateTimeField;
      qryMovTempUSERINCLUSAO: TStringField;
      qryMovTempUSERFECHAMENTO: TStringField;
      MontaSelect1: TMontaSelect;
    MontaSelect: TMontaSelect;
      Procedure maSairClick(Sender: TObject);
      Procedure btnImportarClick(Sender: TObject);
      Procedure qryMovTempCalcFields(DataSet: TDataSet);
      Procedure FormShow(Sender: TObject);
      Procedure btnConferirClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure dbGrdDespAdmCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
   Private
      { Private declarations }
   Public
      { Public declarations }
   End;

Var
   frmImportaDespesasAdministrativas: TfrmImportaDespesasAdministrativas;

Implementation

Uses fCadDespesasAdministrativas, UMensErro;

{$R *.DFM}

Procedure TfrmImportaDespesasAdministrativas.maSairClick(Sender: TObject);
Begin
   qryLkpTipoDesp.Active := False;
   qryLkpPessoa.Active := False;
   qryMovTemp.Close;
   qryAux.close;

   Close;
End;

Procedure TfrmImportaDespesasAdministrativas.btnImportarClick(Sender: TObject);
Var wQtdImportada: Integer;
Begin
   If MsgDlg('Confirma Importação final do Movimento ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
      Begin
         Try
            With qryMovTemp Do
               Begin
                  wQtdImportada := 0;
                  First;
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  While Not Eof Do
                     Begin
                        // verificando a existência da Despesa
                        qryAux.Close;
                        qryAux.SQL.clear;
                        qryAux.SQL.Add('SELECT M.IDMOVDESP                ');
                        qryAux.SQL.Add('FROM MOVDESPADMJUR M              ');
                        qryAux.SQL.Add('WHERE M.NUMLOTE          = ' + quotedstr(FieldByName('numlote').AsString));
                        qryAux.SQL.Add('      AND M.CODESTADO    = ' + quotedstr(FieldByName('codestado').AsString));
                        qryAux.SQL.Add('      AND M.IDPESSOA     = ' + quotedstr(FieldByName('idpessoa').AsString));
                        qryAux.SQL.Add('      AND M.NUMPROCTRAB  = ' + quotedstr(FieldByName('numproctrab').AsString));
                        qryAux.SQL.Add('      AND M.CODDESPESA   = ' + quotedstr(FieldByName('idmovdespweb').AsString));
                        qryAux.Open;
                        If qryAux.EOF Then
                           Begin
                              qryImporta.SQL.Clear;
                              qryImporta.SQL.add('insert into MovDespAdmjur (idmovdesp, codestado, idpais, idpessoa, numproctrab, coddespesa, datadespadm, ');
                              qryImporta.SQL.add('idtipodespadmjur, valordespesaadm, valordespesaAPagar, datafechamento, idsituacaodespesa, TipoLancamento, numlote ) ');
                              qryImporta.SQL.add('VALUES (cm.SeqMovDespAdmJur.NEXTVAL,');
                              qryImporta.SQL.add(':p2, :p3, :p4, :p5, :p6, :p7, :p8,  :p9, :p10, :p11, :p12, :p13, :p14 ) ');
                              qryImporta.paramByName('p2').AsString := FieldByName('codestado').AsString;
                              qryImporta.paramByName('p3').AsInteger := FieldByName('idpais').AsInteger;
                              qryImporta.paramByName('p4').AsInteger := FieldByName('idpessoa').AsInteger;
                              qryImporta.paramByName('p5').AsFloat := FieldByName('numproctrab').AsFloat;
                              qryImporta.paramByName('p6').AsInteger := FieldByName('idmovdespweb').AsInteger;
                              qryImporta.paramByName('p7').AsDateTime := FieldByName('datadespadm').AsDateTime;
                              qryImporta.paramByName('p8').AsInteger := FieldByName('idtipodespadmjur').AsInteger;
                              qryImporta.paramByName('p9').AsFloat := FieldByName('valordespesaadm').AsFloat;
                              qryImporta.paramByName('p10').AsFloat := FieldByName('valordespesaadm').AsFloat;
                              qryImporta.paramByName('p11').AsDateTime := FieldByName('datafechamento').AsDateTime;
                              qryImporta.paramByName('p12').AsInteger := 1; // Liberada para Pagamento;
                              qryImporta.paramByName('p13').AsString := 'I'; // Tipo do Lançamento = (I)mportado
                              qryImporta.paramByName('p14').AsInteger := FieldByName('numlote').AsInteger;
                              qryImporta.execsql;

                              If qryImporta.RowsAffected > 0 Then
                                 inc(wQtdImportada); // Houve importação
                           End;

                        Next;

                     End;
                  Screen.Cursor := crDefault;

                  If wQtdImportada > 0 Then // Houve importação
                     Begin
                        If dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.Commit;
                        Application.MessageBox(pchar(inttostr(wQtdImportada) + ' > Despesas foram Importadas com Sucesso !'), 'Atenção !', Mb_IconExclamation);
                        btnConferir.Enabled := True;
                        btnConferir.setfocus;
                     End
                  Else
                     Begin
                        Application.MessageBox(pchar('Estas Despesas já foram Importadas para o Movimento fechado abaixo !' + #13 + #13 +
                           'Num.Lote         :  ' + FieldByName('numlote').AsString + #13 +
                           'UF                     :  ' + FieldByName('codestado').AsString + #13 +
                           'Escritório           :  ' + FieldByName('descRazaoSocial').AsString), 'Atenção verifique !', Mb_IconExclamation); // + #13 +
                        //                           'Processo           :  ' + FieldByName('numproctrab').AsString), 'Atenção verifique !', Mb_IconExclamation);

                        If dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.rollback;
                     End;
                  First;
               End;
         Except
            If dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.rollback;
            Raise;
         End;
      End;
End;

Procedure TfrmImportaDespesasAdministrativas.qryMovTempCalcFields(DataSet: TDataSet);
Begin
   qryLkpPessoa.close;
   qryLkpPessoa.ParamByName('IDPESSOA').asInteger := qryMovTemp.fieldbyname('IDPESSOA').asinteger;
   qryLkpPessoa.Open;
   qryMovTemp.fieldbyname('DescRazaoSocial').asString := qryLkpPessoa.FieldByName('RAZAOSOCIAL').asString;
End;

Procedure TfrmImportaDespesasAdministrativas.FormShow(Sender: TObject);
Begin
   qryLkpTipoDesp.Active := True;
   qryLkpPessoa.Active := True;
   btnConferir.Enabled := False;
   btnImportar.Enabled := False;
   If frmImportaDespesasAdministrativas.WindowState = wsNormal Then
      Begin
         frmImportaDespesasAdministrativas.Top := (Screen.Height - Height) Div 2;
         frmImportaDespesasAdministrativas.Left := (Screen.Width - Width) Div 2;
      End;
   btnConferir.enabled := False;
End;

Procedure TfrmImportaDespesasAdministrativas.btnConferirClick(Sender: TObject);
Begin
   // verificando a existência da Despesa
   Screen.Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.Add('SELECT *                     ');
   qryAux.SQL.Add('FROM MOVDESPADMJUR M         ');
   qryAux.SQL.Add('WHERE M.NUMLOTE          = ' + quotedstr(qryMovTemp.FieldByName('numlote').AsString));
   //   qryAux.SQL.Add('      AND M.CODESTADO    = ' + quotedstr(qryMovTemp.FieldByName('codestado').AsString));
   //   qryAux.SQL.Add('      AND M.IDPESSOA     = ' + quotedstr(qryMovTemp.FieldByName('idpessoa').AsString));
      //   qryAux.SQL.Add('      AND M.NUMPROCTRAB  = ' + quotedstr(qryMovTemp.FieldByName('numproctrab').AsString));
   qryAux.Open;
   Screen.Cursor := crDefault;
   If Not qryAux.EOF Then
      Begin
         // Chama o Cadastro das Despesas
         frmCadDespesasAdministrativas := TfrmCadDespesasAdministrativas.create(self);
         frmCadDespesasAdministrativas.wNumLote := qryMovTemp.FieldByName('numlote').AsString;
         frmCadDespesasAdministrativas.wCodEstado := qryMovTemp.FieldByName('codestado').AsString;
         frmCadDespesasAdministrativas.wIdPessoa := qryMovTemp.FieldByName('idpessoa').AsString;
         frmCadDespesasAdministrativas.wNumproctrab := qryMovTemp.FieldByName('numproctrab').AsString;
         frmCadDespesasAdministrativas.ShowModal;
      End
   Else
      Application.MessageBox('Este Movimento não foi importado !', 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmImportaDespesasAdministrativas.sbtnProcurarClick(Sender: TObject);
Begin
   MontaSelect.Caption := 'Movimentos disponíveis para Importação';
   MontaSelect.Executar;
   If (MontaSelect.RetornouValor) Then
      Begin
         // Selecionando o Movimentos que foram fechados pelos diversos escritórios
         Screen.Cursor := crSQLWait;
         qryMovTemp.Close;
         qryMovTemp.SQL.clear;
         qryMovTemp.SQL.Add('SELECT *');
         qryMovTemp.SQL.Add('FROM MOVDESPADMJURWEB M');
         qryMovTemp.SQL.Add('WHERE M.NUMLOTE = ' + quotedstr(MontaSelect.ValoresChave[0]));
         //         qryMovTemp.SQL.Add('      AND M.CODESTADO = ' + quotedstr(MontaSelect.ValoresChave[1]));
         //         qryMovTemp.SQL.Add('      AND M.IDPESSOA = ' + quotedstr(MontaSelect.ValoresChave[2]));
         //   qryMovTemp.SQL.Add('      AND M.NUMPROCTRAB = ' + quotedstr(MontaSelect.ValoresChave[1]));
         qryMovTemp.SQL.Add('ORDER BY M.NUMLOTE, M.CODESTADO, M.IDPESSOA, M.NUMPROCTRAB, M.IDMOVDESPWEB   ');
         qryMovTemp.Open;
         Screen.Cursor := crDefault;
      End;
   btnImportar.Enabled := Not qryMovTemp.EOF;
   sbtnProcurar.Down := False;
End;

Procedure TfrmImportaDespesasAdministrativas.dbGrdDespAdmCalcCellColors(
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

End.

