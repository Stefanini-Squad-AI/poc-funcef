//***************************************************************************
//Rotina..........: fCadMovArrematacao
//N. Sol..........: 152860
//N. Kintana......: 1145902
//Data............: 27/07/2011
//Responsável.....: Otacilio
//Descrição.......: Desenvolvimento do Cadastro do Movimento das Arrematações
//****************************************************************************
Unit fCadMovArrematacao;

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
   TfrmCadMovArrematacao = Class(TForm)
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
      pnlDadosPrincipal: TPanel;
      Panel1: TPanel;
      Label8: TLabel;
      GroupBox1: TGroupBox;
      lblPdEmiss: TLabel;
    dbDtPriPublicacao: TCMDateTimePicker;
      Label2: TLabel;
    dbVlrPriPublicacao: TDBRealEdit;
      GroupBox4: TGroupBox;
    dbeVlrDebCondominiais: TDBRealEdit;
      Label5: TLabel;
    dbeVlrITBI: TDBRealEdit;
      Label10: TLabel;
    dbeDtTransfCarteiras: TCMDateTimePicker;
      Label11: TLabel;
    dbedtHasta1: TCMDateTimePicker;
      Label12: TLabel;
    dbeVlrValJud1: TDBRealEdit;
      StaticText1: TStaticText;
      Label3: TLabel;
    dbeVlrHonorLeiloeiro1: TDBRealEdit;
      StaticText2: TStaticText;
      Panel2: TPanel;
    dbrgHouveArrematacao2: TDBRadioGroup;
      Label15: TLabel;
    dbeDtHasta2: TCMDateTimePicker;
      Label16: TLabel;
    dbeVlrLanctoInicial2: TDBRealEdit;
      Label17: TLabel;
    dbeDtArrematacao2: TCMDateTimePicker;
      Label18: TLabel;
    dbeDtCartaArrematado2: TCMDateTimePicker;
    dbrgArrematadoPor2: TDBRadioGroup;
      Label19: TLabel;
    dbeVlrHonorLeiloeiro2: TDBRealEdit;
      Label20: TLabel;
    dbeVlrArrematado2: TDBRealEdit;
      Label21: TLabel;
    dbeDtAverbacao2: TCMDateTimePicker;
    dbrgHouveArrematacao1: TDBRadioGroup;
      Label13: TLabel;
    dbeDtArrematacao1: TCMDateTimePicker;
      Label14: TLabel;
    dbeDtCartaArrematacao1: TCMDateTimePicker;
    dbrgArrematadoPor1: TDBRadioGroup;
      Label22: TLabel;
    dbeVlrArrematacao1: TDBRealEdit;
    dbeVlrTaxas: TDBRealEdit;
    dbeVlrImpostos: TDBRealEdit;
    dbrgEmbargoTerceiros: TDBRadioGroup;
      Label9: TLabel;
    dbeDscPriJornal: TDBEdit;
      Label27: TLabel;
    dbeVlrAvalFuncef1: TDBRealEdit;
      GroupBox5: TGroupBox;
    dbrgHouveEmbargo: TDBRadioGroup;
      Label28: TLabel;
    dbeDtEmbargo: TCMDateTimePicker;
      GroupBox6: TGroupBox;
    dbrgFuncefImitida: TDBRadioGroup;
      Label25: TLabel;
    dbeDtImitida: TCMDateTimePicker;
      GroupBox7: TGroupBox;
    dbeDtAjuizaReintegracao: TCMDateTimePicker;
    dbrgAjuizaReintegracao: TDBRadioGroup;
      Label26: TLabel;
      GroupBox2: TGroupBox;
      Label1: TLabel;
      Label4: TLabel;
      Label6: TLabel;
    dbDtSegPublicacao: TCMDateTimePicker;
    dbVlrSegPublicacao: TDBRealEdit;
    dbeDscSegJornal: TDBEdit;
      GroupBox3: TGroupBox;
      Label7: TLabel;
      Label23: TLabel;
      Label24: TLabel;
    dbeDtTerPublicacao: TCMDateTimePicker;
    dbeVlrTerPublicacao: TDBRealEdit;
    dbeDscTerJornal: TDBEdit;
      Label29: TLabel;
    dbeVlrAvalFuncef2: TDBRealEdit;
    dbeVlrOutros: TDBRealEdit;
      Label30: TLabel;
      Label31: TLabel;
      Label32: TLabel;
      Label33: TLabel;
    qryCadMovArrematacao: TwwQuery;
    qryCadMovArrematacaoNUMPROCTRAB: TFloatField;
    qryCadMovArrematacaoCODTIPORECURSO: TFloatField;
    qryCadMovArrematacaoNUMSEQ: TFloatField;
    qryCadMovArrematacaoDTPRIPUBLICACAO: TDateTimeField;
    qryCadMovArrematacaoVLRPRIPUBLICACAO: TFloatField;
    qryCadMovArrematacaoDSCPRIJORNAL: TStringField;
    qryCadMovArrematacaoDTSEGPUBLICACAO: TDateTimeField;
    qryCadMovArrematacaoVLRSEGPUBLICACAO: TFloatField;
    qryCadMovArrematacaoDSCSEGJORNAL: TStringField;
    qryCadMovArrematacaoDTTERPUBLICACAO: TDateTimeField;
    qryCadMovArrematacaoVLRTERPUBLICACAO: TFloatField;
    qryCadMovArrematacaoDSCTERJORNAL: TStringField;
    qryCadMovArrematacaoDTHASTA1: TDateTimeField;
    qryCadMovArrematacaoVLRAVALJUD1: TFloatField;
    qryCadMovArrematacaoVLRAVALFUNCEF1: TFloatField;
    qryCadMovArrematacaoFLGHOUVEARREMATACAO1: TStringField;
    qryCadMovArrematacaoFLGARREMATADOPOR1: TStringField;
    qryCadMovArrematacaoDTARREMATACAO1: TDateTimeField;
    qryCadMovArrematacaoVLRARREMATADO1: TFloatField;
    qryCadMovArrematacaoDTCARTAARREMAT1: TDateTimeField;
    qryCadMovArrematacaoVLRHONORLEILOEIRO1: TFloatField;
    qryCadMovArrematacaoDTHASTA2: TDateTimeField;
    qryCadMovArrematacaoVLRAVALFUNCEF2: TFloatField;
    qryCadMovArrematacaoFLGHOUVEARREMATACAO2: TStringField;
    qryCadMovArrematacaoFLGARREMATADOPOR2: TStringField;
    qryCadMovArrematacaoDTARREMATACAO2: TDateTimeField;
    qryCadMovArrematacaoVLRARREMATADO2: TFloatField;
    qryCadMovArrematacaoDTCARTAARREMAT2: TDateTimeField;
    qryCadMovArrematacaoDTAVERBACAO2: TDateTimeField;
    qryCadMovArrematacaoVLRHONORLEILOEIRO2: TFloatField;
    qryCadMovArrematacaoFLGHOUVEEMBARGO: TStringField;
    qryCadMovArrematacaoDTEMBARGO: TDateTimeField;
    qryCadMovArrematacaoFLGFUNCEFIMITIDA: TStringField;
    qryCadMovArrematacaoDTIMITIDA: TDateTimeField;
    qryCadMovArrematacaoFLGAJUIZAREINTEGRACAO: TStringField;
    qryCadMovArrematacaoDTAJUIZAREINTEGRACAO: TDateTimeField;
    qryCadMovArrematacaoVLRDEBCONDOMINIAIS: TFloatField;
    qryCadMovArrematacaoVLRTAXAS: TFloatField;
    qryCadMovArrematacaoVLRIMPOSTOS: TFloatField;
    qryCadMovArrematacaoVLRITBI: TFloatField;
    qryCadMovArrematacaoDTTRANSFCARTEIRAS: TDateTimeField;
    qryCadMovArrematacaoFLGEMBARGOTERCEIROS: TStringField;
    qryCadMovArrematacaoTRGDTINCLUSAO: TDateTimeField;
    qryCadMovArrematacaoTRGUSERINCLUSAO: TStringField;
    dsCadMovArrematacao: TwwDataSource;
    UpdCadMovArrematacao: TUpdateSQL;
    qryCadMovArrematacaoVLROUTROS: TFloatField;
    qryCadMovArrematacaoVLRLANCTOINICIAL2: TFloatField;
    Procedure FormCreate(Sender: TObject);
    Procedure bbtnSairClick(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure sbtnInserirClick(Sender: TObject);
    Procedure sbtnAlterarClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    Procedure sbtnApagarClick(Sender: TObject);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    procedure dbrgHouveArrematacao1Change(Sender: TObject);
    procedure dbrgHouveArrematacao2Change(Sender: TObject);
    procedure dbrgHouveEmbargoChange(Sender: TObject);
    procedure dbrgFuncefImitidaChange(Sender: TObject);
    procedure dbrgAjuizaReintegracaoChange(Sender: TObject);
   Private
      { Private declarations }
      procedure proc_Habilita_Bloqueia_Campos;
   Public
      Procedure ExibirTela(NumProcTrab, CodTipoRecurso, NumSeq: Double);
      { Public declarations }
   End;
Var
   frmCadMovArrematacao: TfrmCadMovArrematacao;
   iNumProcTrab, iNumSeq, iCodTipoRecurso : double;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadMovArrematacao.FormShow(Sender: TObject);
Begin
   If frmCadMovArrematacao.WindowState = wsNormal Then
      Begin
         frmCadMovArrematacao.Top := (Screen.Height - Height) Div 2;
         frmCadMovArrematacao.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadMovArrematacao.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   bbtnConfirmar.enabled     := False;
   bbtnCancelar.enabled      := False;
   sbtnProcurar.Enabled      := false;
End;

Procedure TfrmCadMovArrematacao.ExibirTela(NumProcTrab, CodTipoRecurso, NumSeq : Double);
Begin
   iNumProcTrab    := NumProcTrab;
   iNumSeq         := NumSeq;
   iCodTipoRecurso := CodTipoRecurso;

   // Verifica se ja existe uma Arrematação cadastrada
   qryCadMovArrematacao.close;
   qryCadMovArrematacao.SQL.clear;
   qryCadMovArrematacao.SQL.Add('SELECT * FROM ETAPA_DETALHAMENTO E ');
   qryCadMovArrematacao.SQL.Add('WHERE E.NUMPROCTRAB = ' + FloatToStr(iNumProcTrab));
   qryCadMovArrematacao.SQL.Add(' AND E.CODTIPORECURSO = ' + FloatToStr(iCodTipoREcurso));
   qryCadMovArrematacao.SQL.Add(' AND E.NUMSEQ = ' + FloatToStr(iNumSeq));
   qryCadMovArrematacao.Open;

   sbtnInserir.Enabled := qryCadMovArrematacao.IsEmpty;
   sbtnAlterar.Enabled := Not qryCadMovArrematacao.IsEmpty;
   sbtnApagar.Enabled  := Not qryCadMovArrematacao.IsEmpty;
end;

Procedure TfrmCadMovArrematacao.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryCadMovArrematacao.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryCadMovArrematacao.CancelUpdates;
               qryCadMovArrematacao.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryCadMovArrematacao.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadMovArrematacao.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadMovArrematacao.sbtnInserirClick(Sender: TObject);
Begin
   Try
      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled  := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled  := True;

      pnlDadosPrincipal.enabled := True;

      qryCadMovArrematacao.Insert;

      dbrgHouveArrematacao1.ItemIndex  := 1;
      dbrgHouveArrematacao2.ItemIndex  := 1;
      dbrgHouveEmbargo.ItemIndex       := 1;
      dbrgFuncefImitida.ItemIndex      := 1;
      dbrgAjuizaReintegracao.ItemIndex := 1;
      Panel1.Enabled                   := True;
      Panel2.Enabled                   := True;

      dbDtPriPublicacao.SetFocus;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadMovArrematacao.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryCadMovArrematacao.IsEmpty Then
      Begin
         Try
            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled  := False;

            bbtnConfirmar.enabled     := True;
            bbtnCancelar.enabled      := True;
            pnlDadosPrincipal.enabled := True;

            qryCadMovArrematacao.edit;
            dbDtPriPublicacao.SetFocus;
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

Procedure TfrmCadMovArrematacao.bbtnCancelarClick(Sender: TObject);
Begin
   If qryCadMovArrematacao.state In [dsEdit, dsInsert] Then
      qryCadMovArrematacao.CancelUpdates;

  sbtnApagar.Down  := False;
  sbtnAlterar.Down := False;
  sbtnInserir.Down := False;


   ExibirTela(iNumProcTrab, iNumSeq, iCodTipoRecurso);
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled  := False;

   pnlDadosPrincipal.enabled := False;
End;

Procedure TfrmCadMovArrematacao.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryCadMovArrematacao.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão dessa Arrematação ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  qryCadMovArrematacao.Delete;

                  Screen.Cursor := crSQLWait;
                  qryCadMovArrematacao.ApplyUpdates;

                  ExibirTela(iNumProcTrab, iNumSeq, iCodTipoRecurso);
                  Screen.Cursor := crDefault;

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

Procedure TfrmCadMovArrematacao.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If qryCadMovArrematacao.State In [dsInsert, dsEdit] Then
         Begin
            // caso houve arrematação os campos será obrigatorios.
            if dbrgHouveArrematacao1.ItemIndex = 0 then
            begin
              if Trim(dbeDtArrematacao1.Text) = '' then
                 begin
                    ShowMessage('Preencha o campo Data da Arrematação 1ª Hasta.');
                    dbeDtArrematacao1.SetFocus;
                    Exit;
                 end;

              if Trim(dbeDtCartaArrematacao1.Text) = '' then
                 begin
                    ShowMessage('Preencha o campo Data da Carta de Arrematação 1ª Hasta.');
                    dbeDtCartaArrematacao1.SetFocus;
                    Exit;
                 end;
            end;

            if dbrgHouveArrematacao2.ItemIndex = 0 then
            begin
              if Trim(dbeDtArrematacao2.Text) = '' then
                 begin
                    ShowMessage('Preencha o campo Data da Arrematação 2ª Hasta.');
                    dbeDtArrematacao2.SetFocus;
                    Exit;
                 end;

              if Trim(dbeDtCartaArrematado2.text) = '' then
                 begin
                    ShowMessage('Preencha o campo Data da Carta de Arrematação 2ª Hasta.');
                    dbeDtCartaArrematado2.SetFocus;
                    Exit;
                 end;

              if Trim(dbeDtAverbacao2.text) = '' then
                 begin
                    ShowMessage('Preencha o campo Data da Averbação 2ª Hasta.');
                    dbeDtAverbacao2.SetFocus;
                    Exit;
                 end;
            end;

            if dbrgHouveEmbargo.ItemIndex = 0 then
               begin
                  if Trim(dbeDtEmbargo.Text) = '' then
                  begin
                     ShowMessage('Preencha o campo Data de Embargo.');
                     dbeDtEmbargo.SetFocus;
                     Exit;
                  end;
               end;

            if dbrgFuncefImitida.ItemIndex = 0 then
               begin
                  if Trim(dbeDtImitida.Text) = '' then
                  begin
                     ShowMessage('Preencha o campo Data Imitida na posse.');
                     dbeDtImitida.SetFocus;
                     Exit;
                  end;
               end;

            if dbrgAjuizaReintegracao.ItemIndex = 0 then
               begin
                  if Trim(dbeDtAjuizaReintegracao.Text) = '' then
                  begin
                     ShowMessage('Preencha o campo Data Ajuizamento de ação de reintegração.');
                     dbeDtAjuizaReintegracao.SetFocus;
                     Exit;
                  end;
               end;

            If qryCadMovArrematacao.State = dsInsert Then
               Begin
                  qryCadMovArrematacao.FieldByName('NUMPROCTRAB'   ).AsFloat := iNumProcTrab;
                  qryCadMovArrematacao.FieldByName('CODTIPORECURSO').AsFloat := iCodTipoRecurso;
                  qryCadMovArrematacao.FieldByName('NUMSEQ'        ).AsFloat := iNumSeq;
                  sbtnInserir.Down    := False;
                  sbtnInserir.enabled := False;
               End;

            Screen.Cursor := crSQLWait;
            qryCadMovArrematacao.ApplyUpdates;
            Screen.Cursor := crDefault;

            sbtnAlterar.Down    := False;
            sbtnAlterar.enabled := True;
            sbtnApagar.Down     := False;
            sbtnApagar.enabled  := True;

            bbtnConfirmar.enabled := False;
            bbtnCancelar.enabled  := False;

            pnlDadosPrincipal.enabled := False;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

procedure TfrmCadMovArrematacao.proc_Habilita_Bloqueia_Campos;
begin
  if qryCadMovArrematacao.IsEmpty then
  begin
    dbrgHouveArrematacao1.Value := 'N'
  end;
end;

procedure TfrmCadMovArrematacao.dbrgHouveArrematacao1Change(
  Sender: TObject);
begin
  if dbrgHouveArrematacao1.ItemIndex = 0 then
     begin
        dbrgArrematadoPor1.Enabled     := True;
        dbeDtArrematacao1.Enabled      := True;
        dbeVlrArrematacao1.Enabled     := True;
        dbeDtCartaArrematacao1.Enabled := True;
        dbeVlrHonorLeiloeiro1.Enabled  := True;
        dbrgArrematadoPor1.ItemIndex   := 0;
        Panel2.Enabled                 := False;
     end
  else   // Não houve arrematação na 1ª Hasta desabilitar e limpar os campos
     begin
        dbrgArrematadoPor1.Enabled     := False;
        dbeDtArrematacao1.Enabled      := False;
        dbeVlrArrematacao1.Enabled     := False;
        dbeDtCartaArrematacao1.Enabled := False;
        dbeVlrHonorLeiloeiro1.Enabled  := False;
        dbrgArrematadoPor1.ItemIndex   := -1;
        Panel2.Enabled                 := True;

        dbeDtArrematacao1.Clear;
        dbeVlrArrematacao1.Clear;
        dbeDtCartaArrematacao1.Clear;
        dbeVlrHonorLeiloeiro1.Clear;
     end;
end;

procedure TfrmCadMovArrematacao.dbrgHouveArrematacao2Change(
  Sender: TObject);
begin
  if dbrgHouveArrematacao2.ItemIndex = 0 then
     begin
        dbrgArrematadoPor2.Enabled    := True;
        dbeDtArrematacao2.Enabled     := True;
        dbeVlrArrematado2.Enabled     := True;
        dbeDtCartaArrematado2.Enabled := True;
        dbeDtAverbacao2.Enabled       := True;
        dbeVlrHonorLeiloeiro2.Enabled := True;
        dbrgArrematadoPor2.ItemIndex  := 0;
        Panel1.Enabled                := False;
     end
  else   // Não houve arrematação na 2ª Hasta desabilitar e limpar os campos
     begin
        dbeDtArrematacao2.Clear;
        dbeVlrArrematado2.Clear;
        dbeDtCartaArrematado2.Clear;
        dbeDtAverbacao2.Clear;
        dbeVlrHonorLeiloeiro2.Clear;

        dbrgArrematadoPor2.Enabled    := False;
        dbeDtArrematacao2.Enabled     := False;
        dbeVlrArrematado2.Enabled     := False;
        dbeDtCartaArrematado2.Enabled := False;
        dbeDtAverbacao2.Enabled       := False;
        dbeVlrHonorLeiloeiro2.Enabled := False;
        dbrgArrematadoPor2.ItemIndex  := -1;
        Panel1.Enabled                := True;
     end;
end;

procedure TfrmCadMovArrematacao.dbrgHouveEmbargoChange(Sender: TObject);
begin
   if dbrgHouveEmbargo.ItemIndex = 0 then
      begin
         dbeDtEmbargo.Enabled := True;
      end
   else
      begin
        dbeDtEmbargo.Clear;
        dbeDtEmbargo.Enabled := False;
      end;
end;

procedure TfrmCadMovArrematacao.dbrgFuncefImitidaChange(Sender: TObject);
begin
   if dbrgFuncefImitida.ItemIndex = 0 then
      begin
         dbeDtImitida.Enabled := True;
      end
   else
      begin
        dbeDtImitida.Clear;
        dbeDtImitida.Enabled := False;
      end;
end;

procedure TfrmCadMovArrematacao.dbrgAjuizaReintegracaoChange(
  Sender: TObject);
begin
   if dbrgAjuizaReintegracao.ItemIndex = 0 then
      begin
         dbeDtAjuizaReintegracao.Enabled := True;
      end
   else
      begin
        dbeDtAjuizaReintegracao.Clear;
        dbeDtAjuizaReintegracao.Enabled := False;
      end;
end;

End.

