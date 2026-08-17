//******************************************************************************************
//Rotina..........: fCadHonorarioSucumbenciais
//N. Sol..........: 127756
//N. Kintana......: 682924
//Data............: 05/07/2010
//Responsável.....: Adilson Filho/Paulo Nobre
//Descrição.......: Desenvolvimento do Cadastro dos Honorários Sucumbenciais
//******************************************************************************************
Unit fCadHonorarioSucumbenciais;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, TabControlDetalhe, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg,
   Spin, TREdit, DBClient, uCMClientDataSet, uCmSqlParams, FCadastroMT;

Type
   TfrmCadHonorarioSucumbenciais = Class(TForm)
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
      pcOrdemJudicial: TPageControl;
      dsHonorarios: TwwDataSource;
      qryAux: TQuery;
      qryHonorarios: TwwQuery;
      pnlDadosPrincipal: TPanel;
      lblPdEmiss: TLabel;
      Label29: TLabel;
      dbDtPagto: TCMDateTimePicker;
      dbrgIndHonor: TDBRadioGroup;
      Label1: TLabel;
      Label2: TLabel;
      dbrdgValores: TDBRadioGroup;
      Label3: TLabel;
      Label4: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      dbeVlPerc: TDBRealEdit;
      qryHonorariosNUMPROCTRAB: TFloatField;
      qryHonorariosCODTIPORECURSO: TFloatField;
      qryHonorariosNUMSEQ: TFloatField;
      qryHonorariosTIPOHONORARIO: TFloatField;
      qryHonorariosVALORCONDENACAO: TFloatField;
      qryHonorariosTIPOCALCULOHONORARIO: TFloatField;
      qryHonorariosVALORPERCCALCULO: TFloatField;
      qryHonorariosVALORHONORARIO: TFloatField;
      qryHonorariosDATAPAGAMENTO: TDateTimeField;
      qryHonorariosTIPOVALOR: TFloatField;
      qryHonorariosVALORAPURADO: TFloatField;
      qryHonorariosVALORLEVANTADVOGA: TFloatField;
      stDifLevantada: TStaticText;
      dbVlHonorario: TDBRealEdit;
      dbVlCondenacao: TDBRealEdit;
      dbVlApurado: TDBRealEdit;
      dbVlLevantado: TDBRealEdit;
      qryHonorariosIDHONORJURIDICOSGERAIS: TFloatField;
      UpdHonorarios: TUpdateSQL;
      qryAux1: TQuery;
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure dbVlLevantadoExit(Sender: TObject);
      Procedure dbrgIndHonorClick(Sender: TObject);
      Procedure dbeVlPercExit(Sender: TObject);
   Private
      { Private declarations }
   Public
      Procedure ExibirTelaSucumbencia(NumProcTrab, NumSeq, CodTipoRecurso, ValorRec: Double);
      { Public declarations }
   End;
Var
   frmCadHonorarioSucumbenciais: TfrmCadHonorarioSucumbenciais;
   iNumProcTrab, iNumSeq, iCodTipoRecurso, vlrDifHonor, iValorRec: double;
   bolSucumbencia: boolean;

Implementation

Uses UMensErro;

{$R *.DFM}


Procedure TfrmCadHonorarioSucumbenciais.FormShow(Sender: TObject);
Begin
   If frmCadHonorarioSucumbenciais.WindowState = wsNormal Then
      Begin
         frmCadHonorarioSucumbenciais.Top := (Screen.Height - Height) Div 2;
         frmCadHonorarioSucumbenciais.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadHonorarioSucumbenciais.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
   sbtnProcurar.Enabled := false;
End;

Procedure TfrmCadHonorarioSucumbenciais.ExibirTelaSucumbencia(NumProcTrab, NumSeq, CodTipoRecurso, ValorRec: Double);
Begin
   iNumProcTrab := NumProcTrab;
   iNumSeq := NumSeq;
   iCodTipoRecurso := CodTipoRecurso;
   iValorRec := ValorRec;

   qryHonorarios.close;
   qryHonorarios.SQL.clear;
   qryHonorarios.SQL.Add('SELECT * ');
   qryHonorarios.SQL.Add('FROM HONORJURIDICOSGERAIS H ');
   qryHonorarios.SQL.Add('WHERE H.NUMPROCTRAB = ' + FloatToStr(iNumProcTrab));
   qryHonorarios.SQL.Add('      AND H.NUMSEQ = ' + FloatToStr(iNumSeq));
   qryHonorarios.SQL.Add('      AND H.CODTIPORECURSO = ' + FloatToStr(iCodTipoREcurso));
   qryHonorarios.Open;

   sbtnInserir.Enabled := qryHonorarios.IsEmpty;
   sbtnAlterar.Enabled := Not qryHonorarios.IsEmpty;
   sbtnApagar.Enabled := Not qryHonorarios.IsEmpty;

   If sbtnApagar.Enabled Then // Somente se estiver Alterando
      Begin
         If dbrgIndHonor.itemindex = 0 Then // % sobre o valor da condenção
            Begin
               Label1.Visible := True;
               dbeVlPerc.Visible := True;
               dbVlHonorario.Enabled := false;
            End
         Else // Valor Fixo
            Begin
               Label1.Visible := false;
               dbeVlPerc.Visible := false;
               dbVlHonorario.Enabled := true;
            End;

         If (qryhonorarios.fieldbyname('VALORHONORARIO').asfloat > 0.00) And
            (qryhonorarios.fieldbyname('VALORLEVANTADVOGA').asfloat > 0.00) Then
            Begin
               vlrDifHonor := qryHonorarios.fieldbyname('VALORHONORARIO').asfloat - qryHonorarios.fieldbyname('VALORLEVANTADVOGA').asfloat;
               stDifLevantada.caption := floattostrf(vlrDifHonor, ffnumber, 12, 2);
            End;
      End;

   bolSucumbencia := False;
   Visible := False;
   ShowModal;
End;

Procedure TfrmCadHonorarioSucumbenciais.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryHonorarios.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryHonorarios.CancelUpdates;
               qryHonorarios.Close;
               qryAux.close;
               qryAux1.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryHonorarios.Close;
         qryAux.close;
         qryAux1.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadHonorarioSucumbenciais.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadHonorarioSucumbenciais.sbtnInserirClick(Sender: TObject);
Begin
   Try
      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      pnlDadosPrincipal.enabled := True;

      qryHonorarios.Insert;
      dbrgIndHonor.itemindex := 0; // % sobre o valor
      dbrdgValores.ItemIndex := 0; // Sem definição
      dbVlCondenacao.value := iValorRec;
      dbVlCondenacao.setfocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadHonorarioSucumbenciais.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryHonorarios.IsEmpty Then
      Begin
         Try
            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;

            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;

            qryHonorarios.edit;
            dbVlCondenacao.setfocus;
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

Procedure TfrmCadHonorarioSucumbenciais.bbtnCancelarClick(Sender: TObject);
Begin
   If qryHonorarios.state In [dsEdit, dsInsert] Then
      qryHonorarios.CancelUpdates;

   stDifLevantada.caption := '';

   sbtnInserir.Down := False;
   sbtnInserir.enabled := True;
   If sbtnInserir.Down = False Then
      Begin
         sbtnInserir.enabled := False;
         sbtnAlterar.Down := False;
         sbtnAlterar.enabled := True;
         sbtnApagar.Down := False;
         sbtnApagar.enabled := True;
      End;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   pnlDadosPrincipal.enabled := False;
End;

Procedure TfrmCadHonorarioSucumbenciais.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryHonorarios.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão desse Honorário ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  qryAux1.Close;
                  qryAux1.SQL.Clear;
                  qryAux1.SQL.Add('SELECT IDHONORJURIDICOSGERAIS FROM HONORJURIDICOSGERAIS');
                  qryAux1.SQL.Add('WHERE NUMPROCTRAB = ' + quotedstr(qryHonorarios.fieldbyname('NumProcTrab').asString));
                  qryAux1.SQL.Add('      AND NUMSEQ  = ' + quotedstr(qryHonorarios.fieldbyname('NumSeq').asString));
                  qryAux1.Open;
                  If Not qryAux1.EOF Then
                     Begin
                        qryAux1.Delete;

                        qryAux1.Next;
                     End;
                  qryAux1.Close;
                  qryHonorarios.Close;
                  qryHonorarios.Open;
                  Screen.Cursor := crDefault;

                  stDifLevantada.caption := '';

                  sbtnInserir.Enabled := True;
                  sbtnAlterar.Enabled := False;
                  sbtnApagar.Enabled := False;

                  Label1.Visible := True;
                  dbeVlPerc.Visible := True;
                  dbVlHonorario.Enabled := true;

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

Procedure TfrmCadHonorarioSucumbenciais.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If qryHonorarios.State In [dsInsert, dsEdit] Then
         Begin

            If (qryHonorarios.FieldByName('VALORHONORARIO').asFloat > qryHonorarios.FieldByName('VALORCONDENACAO').asFloat) Then
               Begin
                  Application.MessageBox('Valor do Honorário é Maior que o Valor da Condenação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  If dbrgIndHonor.itemindex = 0 Then // % sobre o valor da condenção
                     Begin
                        dbVlCondenacao.value := 0.00;
                        dbVlCondenacao.setfocus;
                     End
                  Else
                     Begin
                        dbVlHonorario.Value := 0.00;
                        dbVlHonorario.setfocus;
                     End;
                  Exit;
               End;

            If dbVlCondenacao.value = 0 Then
               Begin
                  Application.MessageBox('Infome o Valor da Condenação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  dbVlCondenacao.setfocus;
                  exit
               End;

            If dbeVlPerc.value = 0 Then
               Begin
                  Application.MessageBox('Infome o Valor do % para Cálculo. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  dbeVlPerc.setfocus;
                  exit
               End;

            If dbVlHonorario.value = 0 Then
               Begin
                  Application.MessageBox('Infome o Valor do Honorário. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  dbVlHonorario.setfocus;
                  exit
               End;              

            If dbDtPagto.Date = 0 Then
               Begin
                  Application.MessageBox('Informe a Data de Pagamento. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  dbDtPagto.setfocus;
                  exit
               End;

            If dbDtPagto.Date > Date Then
               Begin
                  Application.MessageBox('Data de Pagamento não pode ser Maior que a Data de Hoje. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  dbDtPagto.setfocus;
                  exit
               End;

            If qryHonorarios.State = dsInsert Then
               Begin
                  qryAux.SQL.Clear;
                  qryAux.SQL.add('SELECT SeqHonorJuridicosGerais.NEXTVAL SEQORDEM FROM DUAL');
                  qryAux.Open;

                  qryHonorarios.fieldByname('IDHONORJURIDICOSGERAIS').asInteger := qryAux.fieldByname('SEQORDEM').asInteger;
                  qryHonorarios.FieldByName('NUMPROCTRAB').AsFloat := iNumProcTrab;
                  qryHonorarios.FieldByName('NUMSEQ').AsFloat := iNumSeq;
                  qryHonorarios.FieldByName('CODTIPORECURSO').AsFloat := iCodTipoRecurso;
                  qryHonorarios.FieldByName('TIPOHONORARIO').AsInteger := 0; //Sucumbencia
                  If (qryhonorarios.fieldbyname('VALORCONDENACAO').asfloat > 0.00) Then
                     qryhonorarios.fieldbyname('VALORHONORARIO').asfloat := (qryhonorarios.fieldbyname('VALORCONDENACAO').asfloat * qryhonorarios.fieldbyname('VALORPERCCALCULO').asfloat / 100);
                  stDifLevantada.caption := '';
                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := False;
                  bolSucumbencia := true; // necessário para o form frmCustomCadRegEtp
               End;

            If qryHonorarios.State = dsEdit Then
               Begin
                  dbeVlPercExit(Self);
                  dbVlLevantadoExit(Self);
               End;

            Screen.Cursor := crSQLWait;
            qryHonorarios.ApplyUpdates;
            Screen.Cursor := crDefault;

            sbtnAlterar.Down := False;
            sbtnAlterar.enabled := True;
            sbtnApagar.Down := False;
            sbtnApagar.enabled := True;

            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled := False;

            pnlDadosPrincipal.enabled := False;

         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadHonorarioSucumbenciais.dbVlLevantadoExit(Sender: TObject);
Begin
   If (qryhonorarios.fieldbyname('VALORHONORARIO').asfloat > 0.00) And
      (qryhonorarios.fieldbyname('VALORLEVANTADVOGA').asfloat > 0.00) Then
      Begin
         vlrDifHonor := qryhonorarios.fieldbyname('VALORHONORARIO').asfloat - qryhonorarios.fieldbyname('VALORLEVANTADVOGA').asfloat;
         stDifLevantada.caption := floattostrf(vlrDifHonor, ffnumber, 12, 2);
      End;
End;

Procedure TfrmCadHonorarioSucumbenciais.dbrgIndHonorClick(Sender: TObject);
Begin
   If dbrgIndHonor.itemindex = 0 Then // % sobre o valor da condenção
      Begin
         Label1.Visible := True;
         dbeVlPerc.Visible := True;
         dbVlHonorario.Enabled := false;
         dbVlHonorario.Value := 0.00;
         dbeVlPerc.setfocus;
      End
   Else // Valor Fixo
      Begin
         dbeVlPerc.Value := 0.00;
         dbVlHonorario.Value := 0.00;
         Label1.Visible := false;
         dbeVlPerc.Visible := false;
         dbVlHonorario.Enabled := true;
         dbVlHonorario.setfocus;
      End;
End;

Procedure TfrmCadHonorarioSucumbenciais.dbeVlPercExit(Sender: TObject);
Begin
   If (dbeVlPerc.visible) And (qryHonorarios.FieldByName('VALORPERCCALCULO').asFloat > 0) Then
      Begin
         If (qryHonorarios.FieldByName('VALORPERCCALCULO').asFloat < 1) Or
            (qryHonorarios.FieldByName('VALORPERCCALCULO').asFloat > 20) Then
            Begin
               Application.MessageBox('Percentual tem que estar entre 1 e 20. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
               dbeVlPerc.Value := 0;
               dbeVlPerc.setfocus;
               exit;
            End;

         If (qryhonorarios.fieldbyname('VALORCONDENACAO').asfloat > 0.00) Then
            qryhonorarios.fieldbyname('VALORHONORARIO').asfloat := (qryhonorarios.fieldbyname('VALORCONDENACAO').asfloat * qryhonorarios.fieldbyname('VALORPERCCALCULO').asfloat / 100);
      End;
End;

End.

