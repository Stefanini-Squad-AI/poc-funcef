// **************************************************************************************************
//Rotina..........: fCadDepositoJudicial
//N. Sol..........: 156018
//N. Kintana......: 1225602
//Data............: 04/07/2011
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Implementação de SP para Honorários Periciais.
//******************************************************************************************
//Rotina..........: frmCadDesdobramento
//N. Sol..........: 149851
//N. Kintana......: 1086521
//Data............: 18/01/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo Data da Contadoria
//******************************************************************************************
//Rotina..........: frmCadDesdobramento
//N. Sol..........: 126385
//N. Kintana......: 659529
//Data............: 12/04/2010
//Responsável.....: Renan Cristiano
//Descrição.......: Desenvolvimento do Cadastro dos Desdobramentos dos depositos judiciais
//******************************************************************************************
Unit fCadDepositoJudicial;

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
   TfrmCadDepositoJudicial = Class(TForm)
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
      dsDepositos: TwwDataSource;
      pnlDadosPrincipal: TPanel;
      lblVlrCreditado: TLabel;
      lblDtDeposito: TLabel;
      lblVlrCalc: TLabel;
      Label1: TLabel;
      DBDtContadoria: TCMDateTimePicker;
      dbrValorCalc: TDBRealEdit;
      dbrValorCred: TDBRealEdit;
      btnContaBanc: TBitBtn;
      dtedDataDeposito: TCMDateTimePicker;
      dbrgTipoProfissional: TDBRadioGroup;
      dbGrd: TwwDBGrid;
      qryAux: TQuery;
      qryDepositos: TwwQuery;
      qryDepositosIDTPDESDOBRAMENTO: TFloatField;
      qryDepositosDATADEPOSITO: TDateTimeField;
      qryDepositosVLRCREDITADO: TFloatField;
      qryDepositosNUMPROCTRAB: TFloatField;
      qryDepositosCODTIPORECURSO: TFloatField;
      qryDepositosNUMSEQ: TFloatField;
      qryDepositosVLRCALCCONTADORIA: TFloatField;
      qryDepositosDATACONTADORIA: TDateTimeField;
      //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
      //qryDepositosTPDESDOBRAMENTO: TFloatField;
      qryDepositosTPIMPUGCALCULO: TFloatField;
      qryDepositosIDCBANCARIA: TFloatField;
      qryDepositosCODPORTADOR: TFloatField;
      //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
      //qryDepositosDSCSUBFASE: TStringField;
      qryDepositosDESCTPIMPUGCALCULO: TStringField;
      qryTotalDeposito: TQuery;
      qryDepositosDESCBANCARIA: TStringField;
      qryDepositosDESCPORTADOR: TStringField;
      qryAux2: TQuery;
      qryTotalDepositoVLRDEP: TFloatField;
      //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
      qryDepositosTPDESDOBRAMENTO: TFloatField;
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure btnContaBancClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure qryDepositosCalcFields(DataSet: TDataSet);
   Private
      { Private declarations }
      Function TotalDeposito(NumProcTrab, CodTipoRecurso, NumSeq: double): Double;
   Public
      dValor: double;
      iCodTipoRecurso: double; //Brunno Mattos - SOL 149850 - KTN 1086522
      Procedure ExibirTelaDepositoJudicial(NumProcTrab, CodTipoRecurso, NumSeq: double);
      { Public declarations }
   End;

Var
   frmCadDepositoJudicial: TfrmCadDepositoJudicial;
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   iNumProcTrab, iNumSeq{, iCodTipoRecurso}: double;

Implementation

Uses UMensErro, fCadDepJudContaBanc;

{$R *.DFM}

Procedure TfrmCadDepositoJudicial.ExibirTelaDepositoJudicial(NumProcTrab, CodTipoRecurso, NumSeq: double);
Begin
   iNumProcTrab := NumProcTrab;
   iCodTipoRecurso := CodTipoRecurso;
   iNumSeq := NumSeq;
   dValor := 0;

   sbtnAlterar.Enabled := True;
   sbtnApagar.Enabled := True;

   qryDepositos.Close;
   qryDepositos.SQL.Clear;
   qryDepositos.SQL.ADD('SELECT ');
   qryDepositos.SQL.ADD('ED.IDTPDESDOBRAMENTO,  ');
   qryDepositos.SQL.ADD('ED.NUMPROCTRAB,        ');
   qryDepositos.SQL.ADD('ED.CODTIPORECURSO,     ');
   qryDepositos.SQL.ADD('ED.NUMSEQ,             ');
   qryDepositos.SQL.ADD('ED.TPDESDOBRAMENTO,    ');
   qryDepositos.SQL.ADD('ED.DATADEPOSITO,           ');
   qryDepositos.SQL.ADD('ED.VLRCREDITADO,           ');
   qryDepositos.SQL.ADD('ED.TPIMPUGCALCULO,         ');
   qryDepositos.SQL.ADD('ED.IDCBANCARIA,             ');
   qryDepositos.SQL.ADD('ED.CODPORTADOR,             ');
   qryDepositos.SQL.ADD('ED.VLRCALCCONTADORIA,   ');
   qryDepositos.SQL.ADD('ED.DATACONTADORIA       ');
   qryDepositos.SQL.ADD('FROM ETPDESDOBRAMENTO ED   ');
   qryDepositos.SQL.ADD('WHERE ED.NUMPROCTRAB = ' + FloatToStr(iNumProcTrab));
   qryDepositos.SQL.ADD('      AND ED.CODTIPORECURSO = ' + FloatToStr(iCodTipoRecurso));
   qryDepositos.SQL.ADD('      AND ED.NUMSEQ = ' + FloatToStr(iNumSeq));
   qryDepositos.SQL.ADD('ORDER BY ED.TPDESDOBRAMENTO, ED.DATADEPOSITO  ');
   qryDepositos.Open;
   If qryDepositos.IsEmpty Then
      Begin
         sbtnApagar.Enabled := False;
         sbtnAlterar.Enabled := False;
      End;

   //Brunno Mattos - SOL 149850 - KTN 1086522 Inicio
   If CodTipoRecurso = 1035 Then // Deposito Judicial - Controverso
      Begin
         Self.Caption := 'Cadastro de Depóstios Judiciais - Controverso';
         dbrgTipoProfissional.Visible := False;
         dbrgTipoProfissional.ItemIndex := -1;
         dbrValorCalc.Visible := True;
         lblVlrCalc.Visible := True;
      End
   Else If CodTipoRecurso = 1110 Then // Deposito Judicial - Incontroverso
      Begin
         Self.Caption := 'Cadastro de Depóstios Judiciais - Incontroverso';
         dbrgTipoProfissional.Visible := True;
         dbrgTipoProfissional.ItemIndex := 0; //Interno
         dbrValorCalc.Visible := False;
         dbrValorCalc.Clear;
         lblVlrCalc.Visible := False;
      End;
   //Brunno Mattos - SOL 149850 - KTN 1086522 Fim

   dValor := TotalDeposito(iNumProcTrab, iCodTipoRecurso, iNumSeq);
End;

Function TfrmCadDepositoJudicial.TotalDeposito(NumProcTrab, CodTipoRecurso, NumSeq: double): Double;
Begin
   qryTotalDeposito.Close;
   qryTotalDeposito.SQL.Clear;
   qryTotalDeposito.SQL.ADD('SELECT SUM(VLRCREDITADO) VLRDEP');
   qryTotalDeposito.SQL.ADD('FROM ETPDESDOBRAMENTO    ');
   qryTotalDeposito.SQL.ADD('WHERE NUMPROCTRAB = ' + FloatToStr(iNumProcTrab));
   qryTotalDeposito.SQL.ADD('      AND CODTIPORECURSO = ' + FloatToStr(iCodTipoRecurso));
   qryTotalDeposito.SQL.ADD('      AND NUMSEQ = ' + FloatToStr(iNumSeq));
   qryTotalDeposito.Open;
   result := qryTotalDeposito.fieldbyname('VLRDEP').asFloat;
End;

Procedure TfrmCadDepositoJudicial.FormShow(Sender: TObject);
Begin
   If frmCadDepositoJudicial.WindowState = wsNormal Then
      Begin
         frmCadDepositoJudicial.Top := (Screen.Height - Height) Div 2;
         frmCadDepositoJudicial.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadDepositoJudicial.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryDepositos.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryDepositos.Cancel;
               qryDepositos.Close;
               qryAux.Close;
               qryAux2.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryDepositos.Close;
         qryAux.Close;
         qryAux2.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadDepositoJudicial.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadDepositoJudicial.sbtnInserirClick(Sender: TObject);
Begin
   Try
      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      pnlDadosPrincipal.enabled := True;
      qryDepositos.Insert;
      dtedDataDeposito.SetFocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDepositoJudicial.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryDepositos.IsEmpty Then
      Begin
         Try
            If iCodTipoRecurso = 1035 Then Begin
                  dbrgTipoProfissional.Visible := False;
                  dbrgTipoProfissional.ItemIndex := -1;
                  dbrValorCalc.Visible := True;
                  lblVlrCalc.Visible := True;
               End Else If iCodTipoRecurso = 1110 Then Begin
                  dbrgTipoProfissional.Visible := True;
                  dbrgTipoProfissional.ItemIndex := 0; //Interno
                  dbrValorCalc.Visible := False;
                  dbrValorCalc.Clear;
                  lblVlrCalc.Visible := False;
               End;

            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;
            qryDepositos.edit;
            dtedDataDeposito.SetFocus;
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

Procedure TfrmCadDepositoJudicial.bbtnCancelarClick(Sender: TObject);
Begin
   If qryDepositos.state In [dsEdit, dsInsert] Then
      qryDepositos.Cancel;

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

   pnlDadosPrincipal.enabled := False;
End;

Procedure TfrmCadDepositoJudicial.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryDepositos.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão dessa Sub-Fase ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  qryDepositos.Delete;
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

Procedure TfrmCadDepositoJudicial.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If qryDepositos.State In [dsInsert, dsEdit] Then
         Begin
            If iCodTipoRecurso = 1035 Then // Controverso
               Begin

                  If (qryDepositos.FieldByName('VLRCALCCONTADORIA').Value > 0) And (qryDepositos.FieldByName('DATACONTADORIA').IsNull) Then
                     Begin
                        MsgDlg('Preencha a Data da Contadoria.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
                        DBDtContadoria.SetFocus;
                        exit;
                     End;

                  If (qryDepositos.FieldByName('VLRCALCCONTADORIA').Value = 0) And (Not qryDepositos.FieldByName('DATACONTADORIA').IsNull) Then
                     Begin
                        MsgDlg('Preencha o Valor da Contadoria.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
                        dbrValorCalc.SetFocus;
                        exit;
                     End;

                  qryDepositos.FieldByName('TPIMPUGCALCULO').Value := Null
               End
            Else
               If iCodTipoRecurso = 1110 Then // Incontroverso
                  qryDepositos.FieldByName('VLRCALCCONTADORIA').Value := Null;

            If qryDepositos.State = dsInsert Then
               Begin
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SeqEtpDesdobramento.NEXTVAL SEQORDEM FROM DUAL');
                  qryAux.Open;

                  qryDepositos.fieldByname('IDTPDESDOBRAMENTO').asInteger := qryAux.fieldByname('SEQORDEM').asInteger;
                  qryDepositos.FieldByName('NUMPROCTRAB').AsFloat := iNumProcTrab;
                  qryDepositos.FieldByName('NUMSEQ').AsFloat := iNumSeq;
                  qryDepositos.FieldByName('CODTIPORECURSO').AsFloat := iCodTipoRecurso;
                  If iCodTipoRecurso = 1035 Then
                     qryDepositos.FieldByName('TPDESDOBRAMENTO').AsInteger := 1;
                  If iCodTipoRecurso = 1110 Then
                     qryDepositos.FieldByName('TPDESDOBRAMENTO').AsInteger := 2;

                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := False;
               End;

            Screen.Cursor := crSQLWait;
            qryDepositos.Post;
            qryDepositos.Close;
            qryDepositos.Open;

            dValor := TotalDeposito(iNumProcTrab, iCodTipoRecurso, iNumSeq);
            Screen.Cursor := crDefault;

            sbtnAlterar.Down := False;
            sbtnAlterar.enabled := True;
            sbtnApagar.Down := False;
            sbtnApagar.enabled := True;
            sbtnInserir.Down := False;
            sbtnInserir.enabled := True;

            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            pnlDadosPrincipal.enabled := False;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadDepositoJudicial.btnContaBancClick(Sender: TObject);
Begin
   If Not (Assigned(frmCadDepJudContaBanc)) Then
      frmCadDepJudContaBanc := TfrmCadDepJudContaBanc.Create(Application);

   frmCadDepJudContaBanc.ExibirTelaContaBanc(qryDepositos);
End;
//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
{Procedure TfrmCadDepositoJudicial.dbrgTipoDesdobramentoChange(Sender: TObject);
Begin
   If dbrgTipoDesdobramento.ItemIndex = 0 Then
      Begin
         dbrgTipoProfissional.Visible := False;
         dbrgTipoProfissional.ItemIndex := -1;
         dbrValorCalc.Visible := True;
         lblVlrCalc.Visible := True;
      End
   Else If dbrgTipoDesdobramento.ItemIndex = 1 Then
      Begin
         dbrgTipoProfissional.Visible := True;
         dbrgTipoProfissional.ItemIndex := 0; //Interno
         dbrValorCalc.Visible := False;
         dbrValorCalc.Clear;
         lblVlrCalc.Visible := False;
      End;
End;}

Procedure TfrmCadDepositoJudicial.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   sbtnProcurar.Enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
End;

Procedure TfrmCadDepositoJudicial.qryDepositosCalcFields(DataSet: TDataSet);
Begin
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   {If qryDepositos.fieldbyname('TPDESDOBRAMENTO').asInteger = 1 Then
      qryDepositos.fieldbyname('DSCSUBFASE').asString := 'Controverso'
   Else If qryDepositos.fieldbyname('TPDESDOBRAMENTO').asInteger = 2 Then
      qryDepositos.fieldbyname('DSCSUBFASE').asString := 'Incontroverso';}

   If qryDepositos.fieldbyname('TPIMPUGCALCULO').asInteger = 1 Then
      qryDepositos.fieldbyname('DESCTPIMPUGCALCULO').asString := 'Interno'
   Else If qryDepositos.fieldbyname('TPIMPUGCALCULO').asInteger = 2 Then
      qryDepositos.fieldbyname('DESCTPIMPUGCALCULO').asString := 'Externo';

   // Nossa Conta
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add('SELECT (BC.NUMBANCO || '' / '' || TRIM(AG.NUMAGENCIA) || '' / '' || TRIM(PC.NOCONTACORR) ) DESCPORTADOR ');
   qryAux2.SQL.add('FROM               ');
   qryAux2.SQL.add('PORTADORCONTA PC, PESSOA P1, PESSOA P2, AGENCIABANCARIA AG, BANCO BC ');
   qryAux2.SQL.add('WHERE PC.IDAGENCIA     = AG.IDPESSOA ');
   qryAux2.SQL.add('      AND AG.IDBANCO   = BC.IDPESSOA ');
   qryAux2.SQL.add('      AND AG.IDPESSOA  = P1.IDPESSOA ');
   qryAux2.SQL.add('      AND BC.IDPESSOA  = P2.IDPESSOA ');
   qryAux2.SQL.add('      AND PC.FLGSTATUS = ''A''       ');
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   qryAux2.SQL.add('      AND PC.CODPORTADOR = ' + quotedstr(qryDepositos.fieldbyname('CODPORTADOR').asString));
   qryAux2.Open;

   qryDepositos.fieldbyname('DESCPORTADOR').asString := qryAux2.fieldByname('DESCPORTADOR').asString;

   // Conta de Terceiros
   qryAux2.Close;
   qryAux2.SQL.Clear;
   qryAux2.SQL.add('SELECT (BC.NUMBANCO || '' / '' || TRIM(AG.NUMAGENCIA) || '' / '' || TRIM(CB.CONTACORRENTE) ) DESCBANCARIA ');
   qryAux2.SQL.add('FROM CONTABANCARIA CB, PESSOA P1, PESSOA P2, PESSOA P3, AGENCIABANCARIA AG, BANCO BC ');
   qryAux2.SQL.add('WHERE CB.IDAGENCIA = AG.IDPESSOA AND ');
   qryAux2.SQL.add('      AG.IDBANCO   = BC.IDPESSOA AND ');
   qryAux2.SQL.add('      AG.IDPESSOA  = P1.IDPESSOA AND ');
   qryAux2.SQL.add('      BC.IDPESSOA  = P2.IDPESSOA AND ');
   qryAux2.SQL.add('      CB.IDPESSOA  = P3.IDPESSOA AND ');
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
   qryAux2.SQL.add('      CB.IDCBANCARIA = ' + quotedstr(qryDepositos.fieldbyname('IDCBANCARIA').asString));
   qryAux2.Open;

   qryDepositos.fieldbyname('DESCBANCARIA').asString := qryAux2.fieldByname('DESCBANCARIA').asString;

End;

End.


