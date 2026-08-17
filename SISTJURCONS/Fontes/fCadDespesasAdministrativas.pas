//******************************************************************************************
//Rotina..........: fCadDespesasAdministrativas
//N. Sol..........: 127754
//N. Kintana......: 682842
//Data............: 26/03/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Desenvolvimento do Cadastro das Despesas Administrativas
//******************************************************************************************
Unit fCadDespesasAdministrativas;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, ImgList, ExtCtrls, wwdblook, CMDBLookupCombo,
   CMProcura, jpeg, Db, Wwdatsrc, CmEventosCadastro, DBTables, Wwquery,
   MontaSelect, FCadastroMT, ToolWin, TREdit, DBaseDados, DBGrids;

Type
   TfrmCadDespesasAdministrativas = Class(TForm)
      ImlPadrao: TImageList;
      MontaSelect: TMontaSelect;
      qry: TwwQuery;
      ds: TwwDataSource;
      dbGrdDespAdm: TwwDBGrid;
      Panel1: TPanel;
      Label8: TLabel;
      Label9: TLabel;
      lblPagto: TLabel;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      dbObs: TDBEdit;
      dbDtPagto: TCMDateTimePicker;
      qryLkpTipoDesp: TwwQuery;
      qryLkpTipoDespIDTIPODESPADMJUR: TFloatField;
      qryLkpTipoDespDESCTIPODESPADMJUR: TStringField;
      qryLkpTipoDespFLGRATEAVEL: TStringField;
      qryLkpTipoDespFLGATIVA: TStringField;
      qryLkpSitDesp: TwwQuery;
      dblckTipoEtp: TwwDBLookupCombo;
      qryIDMOVDESP: TFloatField;
      qryCODESTADO: TStringField;
      qryIDPAIS: TFloatField;
      qryIDPESSOA: TFloatField;
      qryNUMPROCTRAB: TFloatField;
      qryDATADESPADM: TDateTimeField;
      qryIDTIPODESPADMJUR: TFloatField;
      qryVALORDESPESAADM: TFloatField;
      qryDATAFECHAMENTO: TDateTimeField;
      qryIDSITUACAODESPESA: TFloatField;
      qryTRGDTIMPORT: TDateTimeField;
      qryTRGUSERIMPORT: TStringField;
      qryLkpSitDespIDSITDESPADMJUR: TFloatField;
      qryLkpSitDespDESCSITDESPADMJUR: TStringField;
      qryDescTipoDespesa: TStringField;
      qryDescSitDespesa: TStringField;
      qryDATAPAGAMENTO: TDateTimeField;
      ToolBar1: TToolBar;
      ToolButton1: TToolButton;
      sbtAltDet: TToolButton;
      sbtExcluiDet: TToolButton;
      qryLkpPessoa: TwwQuery;
      qryLkpPessoaIDPESSOA: TFloatField;
      qryLkpPessoaRAZAOSOCIAL: TStringField;
      qryDescRazaoSocial: TStringField;
      qryTIPOLANCAMENTO: TStringField;
      qryCODDESPESA: TFloatField;
      Label1: TLabel;
      qryVALORDESPESAAPAGAR: TFloatField;
      dbValoraPagar: TDBRealEdit;
      DBRealEdit1: TDBRealEdit;
      DBRealEdit2: TDBRealEdit;
      qryTotais: TwwQuery;
      dsTotais: TwwDataSource;
      qryTotaisTOTALDESP: TFloatField;
      qryTotaisTOTALDESPAPAGAR: TFloatField;
      StaticText1: TStaticText;
      DBRealEdit3: TDBRealEdit;
      StaticText2: TStaticText;
      StaticText3: TStaticText;
      StaticText4: TStaticText;
      qryTotaisTOTALGLOSADA: TFloatField;
      qryOBSDESPESA: TStringField;
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      Dock974: TDock97;
      tb97Detalhe: TToolbar97;
      bbtnOkDet: TBitBtn;
      bbtnCancelarDet: TBitBtn;
      sbtExcluiTodos: TToolButton;
      qryNUMLOTE: TFloatField;
    MontaSelect1: TMontaSelect;
      Procedure dbGrdDespAdmDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure sbtAltDetClick(Sender: TObject);
      Procedure sbtExcluiDetClick(Sender: TObject);
      Procedure qryCalcFields(DataSet: TDataSet);
      Procedure SelecionaMovimento(wNumLote, wCodEstado, wIdPessoa, wNumproctrab : String);
      Procedure dblckTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      Procedure dblckTipoEtpEnter(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure sbtExcluiTodosClick(Sender: TObject);
      Procedure dbGrdDespAdmCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
   Private
      { Private declarations }
      Procedure TotalizaDespesas;
   Public
      wCodEstado, wIdPessoa, wNumproctrab, wDataFechamento, wNumLote: String;
      { Public declarations }
   End;

Var
   frmCadDespesasAdministrativas: TfrmCadDespesasAdministrativas;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadDespesasAdministrativas.TotalizaDespesas;
Begin
   Screen.Cursor := crSQLWait;
   qryTotais.close;
   qryTotais.SQL.clear;
   qryTotais.SQL.Add('SELECT SUM(M.VALORDESPESAADM) TOTALDESP, SUM(M.VALORDESPESAAPAGAR) TOTALDESPAPAGAR,');
   qryTotais.SQL.Add('       (SUM(M.VALORDESPESAADM) - SUM(M.VALORDESPESAAPAGAR)) TOTALGLOSADA           ');
   qryTotais.SQL.Add('FROM MOVDESPADMJUR M                                                               ');
   qryTotais.SQL.Add('WHERE M.NUMLOTE          = ' + quotedstr(qry.FieldByName('numlote').AsString));
//   qryTotais.SQL.Add('      AND M.CODESTADO    = ' + quotedstr(qry.FieldByName('codestado').AsString));
//   qryTotais.SQL.Add('      AND M.IDPESSOA     = ' + quotedstr(qry.FieldByName('idpessoa').AsString));
//   qryTotais.SQL.Add('      AND M.NUMPROCTRAB  = ' + quotedstr(qry.FieldByName('numproctrab').AsString));
   qryTotais.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadDespesasAdministrativas.SelecionaMovimento(wNumLote, wCodEstado, wIdPessoa, wNumproctrab : String);
Begin
   Screen.Cursor := crSQLWait;
   qry.Close;
   qry.SQL.clear;
   qry.SQL.Add('SELECT *                          ');
   qry.SQL.Add('FROM MOVDESPADMJUR M              ');
   qry.SQL.Add('WHERE M.NUMLOTE            = ' + quotedstr(wNumLote));
//   qry.SQL.Add('      AND M.CODESTADO      = ' + quotedstr(wCodEstado));
//   qry.SQL.Add('      AND M.IDPESSOA       = ' + quotedstr(wIdPessoa));
//   qry.SQL.Add('      AND M.NUMPROCTRAB    = ' + quotedstr(wNumproctrab));
   qry.SQL.Add('ORDER BY M.NUMLOTE, M.CODESTADO, M.IDPESSOA, M.NUMPROCTRAB, M.CODDESPESA ');
   qry.Open;
   Screen.Cursor := crDefault;

   TotalizaDespesas;
End;

Procedure TfrmCadDespesasAdministrativas.dbGrdDespAdmDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
      Begin
         If qryIDSITUACAODESPESA.asInteger = 0 Then // Com Pendência
            dbGrdDespAdm.Canvas.Font.Color := clRed
         Else If qryIDSITUACAODESPESA.asInteger In [2, 3] Then // Glosadas
            dbGrdDespAdm.Canvas.Font.Color := clBlue
         Else
            dbGrdDespAdm.Canvas.Font.Color := clWindowText;

         dbGrdDespAdm.DefaultDrawDataCell(Rect, Field, State);
      End;
End;

Procedure TfrmCadDespesasAdministrativas.FormShow(Sender: TObject);
Begin
   If frmCadDespesasAdministrativas.WindowState = wsNormal Then
      Begin
         frmCadDespesasAdministrativas.Top := (Screen.Height - Height) Div 2;
         frmCadDespesasAdministrativas.Left := (Screen.Width - Width) Div 2;
      End;

   qryLkpTipoDesp.Open;
   qryLkpSitDesp.Open;
   qryLkpPessoa.Open;

   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   If wCodEstado <> '' Then // Vem do Form de Importação
      Begin
         sbtnProcurar.Enabled := False;
         SelecionaMovimento(wNumLote, wCodEstado, wIdPessoa, wNumproctrab);
      End
   Else
      sbtnProcurar.Enabled := True;
End;

Procedure TfrmCadDespesasAdministrativas.bbtnCancelarDetClick(Sender: TObject);
Begin
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   dbGrdDespAdm.enabled := true;
   sbtAltDet.Down := False;
   sbtExcluiDet.Enabled := True;
   dbDtPagto.visible := True;
   lblPagto.visible := True;
   Panel1.enabled := False;
   If qry.state In [dsEdit, dsInsert] Then
      qry.Cancel;
   If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.RollBack;
   TotalizaDespesas;
End;

Procedure TfrmCadDespesasAdministrativas.bbtnOkDetClick(Sender: TObject);
Begin
   If (qry.fieldbyname('IDSITUACAODESPESA').asinteger = 4) And
      (qry.fieldbyname('DataPagamento').asDateTime = 0) Then // Pagamento
      Begin
         Application.MessageBox('Data de Pagamento não foi informada !', 'Atenção !', Mb_IconExclamation);
         dbDtPagto.setfocus;
         Exit;
      End;

   If qry.fieldbyname('IDSITUACAODESPESA').asinteger In [0, 1] Then // Com Pendência e Liberada Para Pagamento
      Begin
         If qry.fieldbyname('DataPagamento').asDateTime > 0 Then
            qry.fieldbyname('DataPagamento').Clear;
      End;

   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            Screen.Cursor := crSQLWait;
            qry.Post;
            dtmBaseDados.dbBaseDados.Commit;
            qry.Close;
            qry.Open;
            Screen.Cursor := crDefault;
         End;
   Except
      Raise;
   End;

   TotalizaDespesas;

   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;
   dbGrdDespAdm.enabled := true;
   sbtAltDet.Enabled := True;
   sbtExcluiDet.Enabled := True;
   sbtAltDet.Down := False;
   Panel1.enabled := False;
End;

Procedure TfrmCadDespesasAdministrativas.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadDespesasAdministrativas.sbtAltDetClick(Sender: TObject);
Begin
   If Not qry.IsEmpty Then
      Begin
         Try
            If qry.State <> dsEdit Then
               Begin
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  bbtnOkDet.Enabled := True;
                  bbtnCancelarDet.Enabled := True;
                  dbGrdDespAdm.enabled := false;
                  sbtExcluiDet.Enabled := False;
                  sbtAltDet.down := True;
                  Panel1.enabled := True;
                  qry.edit;
                  dblckTipoEtp.setfocus;
               End;
         Except
            bbtnCancelarDetClick(Self);
            Raise;
         End;
      End
   Else
      Application.MessageBox('Sem Movimento selecionado para esta operação !', 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmCadDespesasAdministrativas.sbtExcluiDetClick(Sender: TObject);
Begin
   If Not qry.IsEmpty Then
      Begin
         Try
            If (qry.fieldbyname('IDSITUACAODESPESA').asinteger In [4, 0]) Then // Despesa Paga ou com Pendência
               Begin
                  Application.MessageBox('Despesa Paga ou com Pendência não pode ser Excluída !', 'Atenção !', Mb_IconExclamation);
                  exit;
               End;

            If MsgDlg('Confirma Exclusão dessa Despesa ? (Obs. Para obtê-la, importe esse Movimento novamente...)', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  qry.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  bbtnCancelarDetClick(Self);
               End;
         Except
            bbtnCancelarDetClick(Self);
            Raise;
         End;
      End
   Else
      Application.MessageBox('Sem Movimento selecionado para esta operação !', 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmCadDespesasAdministrativas.qryCalcFields(DataSet: TDataSet);
Begin
   qryLkpPessoa.close;
   qryLkpPessoa.ParamByName('IDPESSOA').asInteger := qry.fieldbyname('IDPESSOA').asinteger;
   qryLkpPessoa.Open;
   qry.fieldbyname('DescRazaoSocial').asString := qryLkpPessoa.FieldByName('RAZAOSOCIAL').asString;
End;

Procedure TfrmCadDespesasAdministrativas.dblckTipoEtpCloseUp(
   Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   If (qry.fieldbyname('IDSITUACAODESPESA').asinteger = 4) Then // Despesa Paga
      Begin
         dbDtPagto.visible := True;
         lblPagto.visible := True;
      End
   Else
      Begin
         dbDtPagto.visible := False;
         lblPagto.visible := False;
      End;

   dbObs.setfocus;
   dbObs.SelText;
End;

Procedure TfrmCadDespesasAdministrativas.dblckTipoEtpEnter(Sender: TObject);
Begin
   If (qry.fieldbyname('IDSITUACAODESPESA').asinteger = 4) Then // Despesa Paga
      Begin
         dbDtPagto.visible := True;
         lblPagto.visible := True;
      End
   Else
      Begin
         dbDtPagto.visible := False;
         lblPagto.visible := False;
      End;
End;

Procedure TfrmCadDespesasAdministrativas.sbtnProcurarClick(Sender: TObject);
Begin
   MontaSelect.Caption := 'Selecione Movimentos Importados';
   MontaSelect.Executar;
   If (MontaSelect.RetornouValor) Then
      SelecionaMovimento(MontaSelect.ValoresChave[0], '', '', MontaSelect.ValoresChave[1]); //MontaSelect.ValoresChave[2], MontaSelect.ValoresChave[3]);
   sbtnProcurar.Down := False;
End;

Procedure TfrmCadDespesasAdministrativas.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Var mrOpcao: word;
Begin
   If qry.State In [dsEdit, dsInsert] Then
      Begin
         mrOpcao := MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0);
         If mrOpcao = MrYes Then
            Begin
               qry.Cancel;
               qryLkpTipoDesp.Close;
               qryLkpSitDesp.Close;
               qryLkpPessoa.Close;
               qry.Close;
               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qry.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadDespesasAdministrativas.sbtExcluiTodosClick(Sender: TObject);
Begin
   If Not qry.IsEmpty Then
      Begin
         Try
            If (qry.fieldbyname('IDSITUACAODESPESA').asinteger In [4, 0]) Then // Despesa Paga ou com Pendência
               Begin
                  Application.MessageBox('Despesa Paga ou com Pendência não pode ser Excluída !', 'Atenção !', Mb_IconExclamation);
                  exit;
               End;

            If MsgDlg('Confirma Exclusão desse Movimento ? (Obs. Para obtê-lo, importe-o novamente...)', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qry.first;
                  While Not qry.EOF Do
                     qry.Delete;

                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  bbtnCancelarDetClick(Self);
               End;
         Except
            bbtnCancelarDetClick(Self);
            Raise;
         End;
      End
   Else
      Application.MessageBox('Sem Movimento selecionado para esta operação !', 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmCadDespesasAdministrativas.dbGrdDespAdmCalcCellColors(
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


