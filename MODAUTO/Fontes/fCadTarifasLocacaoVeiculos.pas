//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 10/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Cadastro de Tarifas de Locação de Veículos
//******************************************************************************************
Unit fCadTarifasLocacaoVeiculos;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, Wwkeycb, ExtCtrls, StdCtrls, Grids, Wwdbigrd, Wwdbgrid,
   wwdblook, DBCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
   ComCtrls, Mask, wwdbedit, MontaSelect, ImgList, TB97Ctls, TB97, TB97Tlbr,
   Db, Wwdatsrc, DBTables, Wwquery, uCmSqlParams, MAHlpBtn, uCtrlDstTarifa,
   DBClient, uCMClientDataSet;

Type
   TfrmCadTarifasLocacaoVeiculos = Class(TForm)
      Dock972: TDock97;
      Toolbar971: TToolbar97;
      sbtnInserir: TToolbarButton97;
      sbtnAlterar: TToolbarButton97;
      sbtnProcurar: TToolbarButton97;
      sbtnApagar: TToolbarButton97;
      ImlPadrao: TImageList;
      MSTarifas: TMontaSelect;
      pnlMestre: TPanel;
      lblDescricao: TLabel;
      dbedDescricao: TwwDBEdit;
      pcDetalhes: TPageControl;
      tbsValores: TTabSheet;
      pnlDadosValores: TPanel;
      Label4: TLabel;
      Label2: TLabel;
      dbDtVigencia: TCMDateTimePicker;
      dbrgLocal: TDBRadioGroup;
      DBlkpMoeda: TwwDBLookupCombo;
      Dock971: TDock97;
      tb97Detalhe: TToolbar97;
      btnCon1: TBitBtn;
      btnCan1: TBitBtn;
      Dock974: TDock97;
      Toolbar974: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      btnExc1: TToolbarButton97;
      qryDstTarifa: TwwQuery;
      dsDstTarifa: TwwDataSource;
      qryDstValores: TwwQuery;
      dsDstValores: TwwDataSource;
      qryLkpMoeda: TwwQuery;
      qryLkpMoedaMOESIGLA: TStringField;
      qryLkpMoedaMOECODIGO: TFloatField;
      dsLkpMoeda: TwwDataSource;
      Dock973: TDock97;
      tb97Fundo: TToolbar97;
      bbtnSair: TBitBtn;
      TB97oKCancelar: TToolbar97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      qryAux: TQuery;
      qryDstValoresIDDSTTARIFA: TFloatField;
      qryDstValoresDATADSTVALORES: TDateTimeField;
      qryDstValoresTIPOLOCAL: TStringField;
      qryDstValoresMOECODIGO: TFloatField;
      qryDstValoresVLRDST: TFloatField;
      qryDstTarifaIDDSTTARIFA: TFloatField;
      qryDstTarifaDESCRICAO: TStringField;
      qryDstTarifaINDTIPO: TFloatField;
      qryAux2: TQuery;
      qryDstValoresDSCLOCAL: TStringField;
      qryDstValoresSIGLAMOEDA: TStringField;
      qryLkpAeroporto: TwwQuery;
      dsLkpAeroporto: TwwDataSource;
      qryLkpAeroportoIDDSTAEROPORTO: TFloatField;
      qryLkpAeroportoNMEDSTAEROPORTO: TStringField;
      qryLkpAeroportoIDCIDADES: TFloatField;
      qryDstValoresIDDSTAEROPORTO: TFloatField;
      Label1: TLabel;
      Label3: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      Shape1: TShape;
      Label9: TLabel;
      Shape2: TShape;
      Label10: TLabel;
      dbValor1: TDBRealEdit;
      dbValor2: TDBRealEdit;
      dbValor5: TDBRealEdit;
      dbValor4: TDBRealEdit;
      dbValor3: TDBRealEdit;
      qryDstValoresVLCONTROLADODIARIA: TFloatField;
      qryDstValoresVLCONTROLADOKMRODADO: TFloatField;
      qryDstValoresVLKMLIVREDIARIA: TFloatField;
      qryDstValoresVLKMLIVRESEMANA: TFloatField;
      qryDstValoresVLKMLIVREDIAEXTRA: TFloatField;
      DBRadioGroup2: TDBRadioGroup;
      qryDstTarifaTIPOGRUPOVEICULO: TStringField;
      dbgrdValores: TwwDBGrid;
    qryDstValoresIDDSTVALORES: TFloatField;
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure btnInc1Click(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dbrgLocalClick(Sender: TObject);
      Procedure qryDstValoresCalcFields(DataSet: TDataSet);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnExc1Click(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure dbgrdValoresCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
   Private
      { Private declarations }
      ctrlDstTarifa: TCtrlDSTTarifa;
      Function LocalizaTarifa(IdDstTarifa: Integer): Boolean;
   Public
      { Public declarations }
   End;

Var
   frmCadTarifasLocacaoVeiculos: TfrmCadTarifasLocacaoVeiculos;
   idDstTarifa, idIndTipo: Integer;

Implementation

Uses uCtrlFuncoesRH, UMensErro, DBaseDados, uSistema;

{$R *.DFM}

Procedure TfrmCadTarifasLocacaoVeiculos.FormCreate(Sender: TObject);
Begin
   // Inicializa o Controlador Principal
   ctrlDstTarifa := TCtrlDstTarifa.Create;
   ctrlDstTarifa.Initialize
      (
      DtmBaseDados.DbBaseDados,
      True,
      Sistema.ConnectionType,
      Sistema.ConnectionSide,
      Sistema.AppRemoteServer,
      True);
End;

Procedure TfrmCadTarifasLocacaoVeiculos.FormShow(Sender: TObject);
Begin
   pnlMestre.enabled := False;
   pcDetalhes.ActivePageIndex := 0;
   pnlDadosValores.enabled := False;
   dbgrdValores.enabled := True;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   btnCon1.Enabled := False;
   btnCan1.Enabled := False;

   qryLkpMoeda.Close;
   qryLkpMoeda.Open;

   qryLkpAeroporto.Close;
   qryLkpAeroporto.Open;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnInserirClick(Sender: TObject);
Begin
   sbtnInserir.Down := True;
   Try
      If qryDstTarifa.State <> dsInsert Then
         Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            sbtnAlterar.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            pnlMestre.enabled := True;
            pcDetalhes.enabled := False;

            qryDstTarifa.Open;
            qryDstTarifa.insert;
            qryDstTarifa.FieldByName('INDTIPO').AsInteger := 4; // Locação de Veículos

            dbedDescricao.setfocus;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.btnInc1Click(Sender: TObject);
Begin
   btnInc1.down := True;
   If Not qryDstTarifa.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlMestre.enabled := False;
            dbgrdValores.enabled := False;
            pnlDadosValores.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnCancelar.enabled := False;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            Screen.Cursor := crSQLWait;
            qryDstValores.Close;
            qryDstValores.Open;
            Screen.Cursor := crDefault;

            qryDstValores.Insert;
            dbrgLocal.Itemindex := 0; // Pais
            qryDstValores.fieldbyname('MOECODIGO').asInteger := 1; // R$

            dbDtVigencia.setfocus;
         Except
            btnCan1Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Locação de Veículos selecionada para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc1.down := False;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnCancelarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDstTarifa.state In [dsEdit, dsInsert] Then
               qryDstTarifa.Cancel;

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

      pnlMestre.enabled := False;
      pcDetalhes.enabled := True;
      pcDetalhes.ActivePageIndex := 0;
      dbgrdValores.enabled := True;
      pnlDadosValores.enabled := False;

      bbtnConfirmar.enabled := False;
      bbtnCancelar.enabled := False;
   Except
      Raise;
   End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnAlterarClick(Sender: TObject);
Begin
   sbtnAlterar.Down := True;
   If Not qryDstTarifa.isEmpty Then
      Begin
         If qryDstTarifa.State <> dsEdit Then
            Begin
               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  sbtnInserir.enabled := False;
                  sbtnApagar.enabled := False;
                  sbtnProcurar.enabled := False;
                  bbtnConfirmar.enabled := True;
                  bbtnCancelar.enabled := True;

                  pnlMestre.enabled := True;
                  pcDetalhes.enabled := False;

                  qryDstTarifa.Edit;
                  dbedDescricao.setfocus;
               Except
                  bbtnCancelarClick(Self);
                  Raise;
               End;
            End;
      End
   Else
      Begin
         Application.MessageBox('Sem Locação de Veículos selecionada para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAlterar.down := False;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryDstTarifa.isEmpty Then
      Begin
         Try
            Begin
               If MsgDlg('Confirma Exclusão dessa Locação de Veículos ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                  Begin
                     Screen.Cursor := crSQLWait;
                     If Not dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.StartTransaction;

                     qryDstTarifa.Delete;

                     dtmBaseDados.dbBaseDados.Commit;
                     Screen.Cursor := crDefault;
                  End;
               sbtnApagar.Down := False;
            End
         Except
            On E: Exception Do
               Begin
                  Application.MessageBox('Tarifa de Locação de Veículos está sendo referenciada no Destacamento. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  bbtnCancelarClick(Self);
               End;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Locação de Veículos selecionada para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnApagar.Down := False;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSTarifas.Caption := 'Selecione uma Locação de Veículos';
   MSTarifas.Executar;
   If (MSTarifas.RetornouValor) Then
      Begin
         If LocalizaTarifa(strtoint(MSTarifas.ValoresChave[0])) Then
            Begin
               Screen.Cursor := crSQLWait;

               // Recolhe os valores de retorno
               If (MSTarifas.ValoresChave[0] <> '') Then
                  idDstTarifa := StrToInt(MSTarifas.ValoresChave[0]);

               If (MSTarifas.ValoresChave[1] <> '') Then
                  idIndTipo := StrToInt(MSTarifas.ValoresChave[1]);

               qryDstValores.Close;
               qryDstValores.Open;

               Screen.Cursor := crDefault;

               pnlMestre.enabled := False;
               pcDetalhes.enabled := True;
               dbgrdValores.enabled := True;
               pnlDadosValores.enabled := False;
            End;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.bbtnConfirmarClick(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDstTarifa.State In [dsInsert, dsEdit] Then
               Begin
                  If dbedDescricao.Text = '' Then
                     Begin
                        MsgDlg('Descrição da Locação de Veículos deve ser preenchida !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbedDescricao.setfocus;
                        exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryDstTarifa.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQDSTTARIFA.NEXTVAL SEQTARIFA FROM DUAL');
                        qryAux.Open;

                        qryDstTarifa.fieldByname('IDDSTTARIFA').asInteger := qryAux.fieldByname('SEQTARIFA').asInteger;

                        qryAux.Close;
                     End;

                  qryDstTarifa.Post;

                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.Commit;

                  LocalizaTarifa(qryDstTarifa.fieldByname('IDDSTTARIFA').asInteger);

                  Screen.Cursor := crDefault;

                  bbtnCancelarClick(Self);
               End;
         End
   Except
      Raise;
      bbtnCancelarClick(Self);      
   End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.btnCon1Click(Sender: TObject);
Var DataAval: TDateTime;
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDstValores.State In [dsInsert, dsEdit] Then
               Begin
                  If dbDtVigencia.Text <> '' Then
                     Begin
                        DataAval := ctrlDstTarifa.LocalizaMaiorVigencia(qryDstTarifa.fieldByname('IDDSTTARIFA').asInteger, qryDstTarifa.fieldByname('INDTIPO').asInteger, dbrgLocal.Value);
                        If DataAval > 0 Then
                           Begin
                              If ((strtodate(dbDtVigencia.Text) <= DataAval) And (qryDstValores.state = dsinsert)) Or
                                 ((strtodate(dbDtVigencia.Text) < DataAval) And (qryDstValores.state = dsedit)) Then
                                 Begin
                                    MsgDlg('Data de Vigência TEM QUE SER MAIOR que a última Data de Vigência lançada para esta Moeda !', 'Atenção !', mtInformation, [mbOk], 0);
                                    btnCan1Click(Self);
                                    Exit;
                                 End;
                           End;
                     End
                  Else
                     Begin
                        MsgDlg('Data de Vigência não informada !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbDtVigencia.setfocus;
                        exit;
                     End;

                  If DBlkpMoeda.Text = '' Then
                     Begin
                        MsgDlg('Moeda deve ser preenchida !', 'Atenção !', mtInformation, [mbOk], 0);
                        DBlkpMoeda.setfocus;
                        exit;
                     End;

                  If dbValor1.Value = 0 Then
                     Begin
                        MsgDlg('Km Controlado - Diária deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbValor1.setfocus;
                        exit;
                     End;

                  If dbValor2.Value = 0 Then
                     Begin
                        MsgDlg('Km Controlado - Km Rodado deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbValor2.setfocus;
                        exit;
                     End;

                  If dbValor3.Value = 0 Then
                     Begin
                        MsgDlg('Km Livre - Diária deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbValor3.setfocus;
                        exit;
                     End;

                  If dbValor4.Value = 0 Then
                     Begin
                        MsgDlg('Km Livre - Semana deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbValor4.setfocus;
                        exit;
                     End;

                  If dbValor5.Value = 0 Then
                     Begin
                        MsgDlg('Km Livre - Dia Extra deve ser preenchido !', 'Atenção !', mtInformation, [mbOk], 0);
                        dbValor5.setfocus;
                        exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryDstValores.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQDSTVALORES.NEXTVAL SEQ FROM DUAL    ');
                        qryAux.Open;

                        qryDstValores.fieldByname('IDDSTVALORES').asInteger := qryAux.fieldByname('SEQ').asInteger;
                        qryDstValores.fieldByname('IDDSTTARIFA').asInteger := qryDstTarifa.fieldByname('IDDSTTARIFA').asInteger;
                        qryAux.Close;
                     End;

                  qryDstValores.Post;
                  dtmBaseDados.dbBaseDados.Commit;

                  qryDstValores.Close;
                  qryDstValores.Open;
                  Screen.Cursor := crDefault;

                  btnCan1Click(Self);
               End;
         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.btnCan1Click(Sender: TObject);
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryDstValores.state In [dsEdit, dsInsert] Then
               qryDstValores.Cancel;

            dtmBaseDados.dbBaseDados.RollBack;

            qryDstValores.Close;
            qryDstValores.Open;
         End;

      pnlMestre.enabled := False;
      dbgrdValores.enabled := True;
      pnlDadosValores.enabled := False;

      sbtnInserir.enabled := True;
      sbtnApagar.enabled := True;
      sbtnAlterar.enabled := True;
      sbtnProcurar.enabled := True;

      btnInc1.down := False;
      btnAlt1.down := False;      
      btnInc1.enabled := True;
      btnAlt1.enabled := True;
      btnExc1.enabled := True;
      btnCon1.enabled := False;
      btnCan1.enabled := False;
   Except
      Raise;
   End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.dbrgLocalClick(Sender: TObject);
Begin
   If dbrgLocal.Itemindex = 0 Then // Pais
      qryDstValores.fieldbyname('MOECODIGO').asInteger := 1 // R$
   Else
      qryDstValores.fieldbyname('MOECODIGO').asInteger := -1;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.qryDstValoresCalcFields(DataSet: TDataSet);
Begin
   If qryDstValores.FieldByName('TIPOLOCAL').AsString = 'P' Then
      qryDstValores.FieldByName('DSCLOCAL').AsString := 'País'
   Else If qryDstValores.FieldByName('TIPOLOCAL').AsString = 'E' Then
      qryDstValores.FieldByName('DSCLOCAL').AsString := 'Exterior';
End;

Procedure TfrmCadTarifasLocacaoVeiculos.btnAlt1Click(Sender: TObject);
Begin
   btnAlt1.down := True;
   If Not qryDstValores.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlMestre.enabled := False;
            dbgrdValores.enabled := False;
            pnlDadosValores.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnCancelar.enabled := False;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            qryDstValores.Edit;
            dbDtVigencia.setfocus;
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

Procedure TfrmCadTarifasLocacaoVeiculos.btnExc1Click(Sender: TObject);
Begin
   If Not qryDstValores.isEmpty Then
      Begin
         Try
            Begin
               If MsgDlg('Confirma Exclusão dos Valores desta Locação de Veículos ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                  Begin
                     Screen.Cursor := crSQLWait;
                     If Not dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.StartTransaction;

                     qryDstValores.Delete;
                     dtmBaseDados.dbBaseDados.Commit;

                     qryDstValores.Close;
                     qryDstValores.Open;

                     Screen.Cursor := crDefault;
                  End;
               btnExc1.Down := False;
            End
         Except
            On E: Exception Do
               Begin
                  Application.MessageBox('Valores estão sendo referenciados no Destacamento. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                  btnCan1Click(Self);
               End;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnExc1.Down := False;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.FormCloseQuery(Sender: TObject;
   Var CanClose: Boolean);
Begin
   If (qryDstTarifa.state In [dsEdit, dsInsert]) Or
      (qryDstValores.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryDstTarifa.Cancel;
               qryDstValores.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryDstTarifa.Close;
               qryDstValores.Close;
               qryLkpMoeda.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryDstTarifa.Close;
         qryDstValores.Close;
         qryLkpMoeda.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadTarifasLocacaoVeiculos.dbgrdValoresCalcCellColors(
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

Function TfrmCadTarifasLocacaoVeiculos.LocalizaTarifa(IdDstTarifa: Integer): Boolean;
Begin
   Screen.Cursor := crSQLWait;
   qryDstTarifa.Close;
   qryDstTarifa.SQL.Clear;
   qryDstTarifa.SQL.add('SELECT *       ');
   qryDstTarifa.SQL.add('FROM DSTTARIFA ');
   qryDstTarifa.SQL.add('WHERE IDDSTTARIFA = ' + inttostr(IdDstTarifa));
   qryDstTarifa.Open;
   Screen.Cursor := crDefault;
End;

End.

