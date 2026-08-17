//******************************************************************************************
//Rotina..........: fCadRateioContabil
//N. Sol..........: 49750
//N. Kintana......: 523171
//Data............: 25/09/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Desenvolvimento do Cadastro de Rateios Contábeis
//******************************************************************************************
Unit fCadRateioContabil;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons,
   Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg,
   Spin, TREdit, DBClient, uCMClientDataSet, uCtrlFuncoesRH,
   CheckLst, ColorCheckListBox;

Type
   TfrmCadRateioContabil = Class(TForm)
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
      dsRateioContabil: TwwDataSource;
      qryAux: TQuery;
      qryRateioContabil: TwwQuery;
      qryPlanoPatro: TQuery;
      pnlDadosPrincipal: TPanel;
      grdCondenacao: TwwDBGrid;
      dblcPlanoPatro: TwwDBLookupCombo;
      Label22: TLabel;
      Label3: TLabel;
      dbPercRateio: TDBRealEdit;
      dsPlanoPatro: TwwDataSource;
      qryPlanoPatroPLANPRVCONTABPATRO: TStringField;
      qryRateioContabilIDJURIDICORATEIOCONTABIL: TFloatField;
      qryRateioContabilNUMPROCTRAB: TFloatField;
      qryRateioContabilCODTIPOOBJETO: TFloatField;
      qryRateioContabilPROGRAMA: TFloatField;
      qryRateioContabilSUB_PROGRAMA: TFloatField;
      qryRateioContabilIDPLANPREVCTBPATR: TFloatField;
      qryRateioContabilPERCRATEIO: TFloatField;
      qryRateioContabilTRGDTINCLUSAO: TDateTimeField;
      qryRateioContabilTRGUSERINCLUSAO: TStringField;
      qryRateioContabilDSCPLANOPATRO: TStringField;
      StaticText2: TStaticText;
      DBRealEdit1: TDBRealEdit;
      qryTotalPerc: TwwQuery;
      dsTotalPerc: TwwDataSource;
      qryTotalPercTOTPERC: TFloatField;
      lblFundos: TLabel;
      dblcFundos: TwwDBLookupCombo;
      dblcInvestimento: TwwDBLookupCombo;
      lblInv: TLabel;
      qryFundos: TQuery;
      dsFundos: TwwDataSource;
      qryInvestimento: TQuery;
      dsInvestimento: TwwDataSource;
      qryRateioContabilIDTIPOINVEST: TFloatField;
      qryRateioContabilIDINVESTIMENTO: TFloatField;
      qryRateioContabilIDFUNDOINVEST: TFloatField;
      qryInvestimentoIDINVESTIMENTO: TFloatField;
      qryInvestimentoIDTIPOINVEST: TFloatField;
      qryInvestimentoDESCINVESTIMENTO: TStringField;
      qryFundosIDFUNDOINVEST: TFloatField;
      qryFundosDESCFUNDOINVEST: TStringField;
      qryFundosIDTIPOFUNDOINVEST: TFloatField;
      Label1: TLabel;
      dblcTipoInvest: TwwDBLookupCombo;
      qryTipoInvest: TQuery;
      dsTipoInvest: TwwDataSource;
      qryTipoInvestIDTIPOINVEST: TFloatField;
      qryTipoInvestDESCTIPOINVEST: TStringField;
      qryRateioContabilDESCINVEST: TStringField;
      qryPlanoPatroIDPLANPREVCTBPATR: TFloatField;
      qryPlanoPatroIDPLANOPREV: TFloatField;
      qryPlanoPatroIDPATRO: TFloatField;
      qryRateioContabilDESCINV: TStringField;
      qryRateioContabilDESCFUNDO: TStringField;
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure dblcTipoInvestCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure qryRateioContabilCalcFields(DataSet: TDataSet);
   Private
      { Private declarations }
      Function ChecaCampos(Const objeto: TComponent; Var CampoErro: TStringList; grupo: integer): Boolean;
   Public
      Procedure ExibirTelaRateioContabil(NumProcTrab, CodTipoObjeto, Programa, SubPrograma: Double);
      Procedure TotalizaPercentual;
      Procedure CarregaCombo(dSubPrograma, dTipoInvest: Double);
      { Public declarations }
   End;
Var
   frmCadRateioContabil: TfrmCadRateioContabil;
   dNumProcTrab, dCodTipoObjeto, dPrograma, dSubPrograma: double;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadRateioContabil.CarregaCombo(dSubPrograma, dTipoInvest: Double);
Begin
   Screen.Cursor := crSQLWait;
   If (dSubPrograma = 43) Or (dSubPrograma = 44) Then
      Begin
         lblFundos.visible := False;
         dblcFundos.visible := False;
         lblInv.visible := True;
         dblcInvestimento.visible := True;
         qryInvestimento.close;
         qryInvestimento.parambyname('pTipo').asFloat := dTipoInvest;
         qryInvestimento.Open;
      End
   Else If (dSubPrograma = 45) Or (dSubPrograma = 46) Then
      Begin
         lblInv.visible := False;
         dblcInvestimento.visible := False;
         lblFundos.visible := True;
         dblcFundos.visible := True;
         qryFundos.close;
         qryFundos.parambyname('pTipo').asFloat := dTipoInvest;
         qryFundos.Open;
      End;
   Screen.Cursor := crDefault;
End;

Function TfrmCadRateioContabil.ChecaCampos(Const objeto: TComponent; Var CampoErro: TStringList; grupo: integer): Boolean;
Var i: integer;
Begin
   For i := 0 To Objeto.ComponentCount - 1 Do
      Begin
         If Objeto.Components[i].Tag = grupo Then
            Begin
               If (Objeto.Components[i] Is TwwDBEdit) And ((Objeto.Components[i] As TwwDBEdit).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TwwDBEdit).Hint);
               If (Objeto.Components[i] Is TCMProcura) And ((Objeto.Components[i] As TCMProcura).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TCMProcura).Hint);
               If (Objeto.Components[i] Is TwwDBLookupCombo) And ((Objeto.Components[i] As TwwDBLookupCombo).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TwwDBLookupCombo).Hint);
            End;
      End;
   CampoErro.sort;
   Result := (CampoErro.Text = '');
End;

Procedure TfrmCadRateioContabil.FormShow(Sender: TObject);
Begin
   If frmCadRateioContabil.WindowState = wsNormal Then
      Begin
         frmCadRateioContabil.Top := (Screen.Height - Height) Div 2;
         frmCadRateioContabil.Left := (Screen.Width - Width) Div 2;
      End;
End;

Procedure TfrmCadRateioContabil.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
   sbtnProcurar.Enabled := False;
End;

Procedure TfrmCadRateioContabil.ExibirTelaRateioContabil(NumProcTrab, CodTipoObjeto, Programa, SubPrograma: Double);
Begin
   dNumProcTrab := NumProcTrab;
   dCodTipoObjeto := CodTipoObjeto;
   dPrograma := Programa;
   dSubPrograma := SubPrograma;

   Screen.Cursor := crSQLWait;
   qryPlanoPatro.open;
   qryInvestimento.Open;
   qryFundos.Open;

   qryTipoInvest.close;
   qryTipoInvest.SQL.Clear;
   qryTipoInvest.SQL.ADD('SELECT IDTIPOINVEST, DESCTIPOINVEST   ');
   qryTipoInvest.SQL.ADD('FROM TIPOINVEST                       ');
   If (dSubPrograma = 43) Then
      qryTipoInvest.SQL.ADD('WHERE IDTIPOINVEST = 1 '); // RF
   If (dSubPrograma = 44) Then
      qryTipoInvest.SQL.ADD('WHERE IDTIPOINVEST = 2 '); // RV
   If (dSubPrograma = 45) Or (dSubPrograma = 46) Then // Fundos Estruturado e Exterior
      qryTipoInvest.SQL.ADD('WHERE IDTIPOINVEST IN (5,6,7,9,10) ');
   qryTipoInvest.Open;

   CarregaCombo(dSubprograma, qryTipoInvestIdTipoInvest.Value);

   qryRateioContabil.Close;
   qryRateioContabil.SQL.Clear;
   qryRateioContabil.SQL.ADD('SELECT *                     ');
   qryRateioContabil.SQL.ADD('FROM JURIDICORATEIOCONTABIL  ');
   qryRateioContabil.SQL.ADD('WHERE NUMPROCTRAB = ' + FloatToStr(dNumProcTrab));
   qryRateioContabil.SQL.ADD('AND CODTIPOOBJETO = ' + FloatToStr(dCodTipoObjeto));
   qryRateioContabil.SQL.ADD('AND PROGRAMA = ' + FloatToStr(dPrograma));
   qryRateioContabil.SQL.ADD('AND SUB_PROGRAMA = ' + FloatToStr(dSubPrograma));
   qryRateioContabil.Open;

   TotalizaPercentual;

   Screen.Cursor := crDefault;

   ShowModal;
End;

Procedure TfrmCadRateioContabil.TotalizaPercentual;
Begin
   Screen.Cursor := crSQLWait;
   qryTotalPerc.Close;
   qryTotalPerc.SQL.Clear;
   qryTotalPerc.SQL.ADD('SELECT SUM(PERCRATEIO) TOTPERC ');
   qryTotalPerc.SQL.ADD('FROM JURIDICORATEIOCONTABIL    ');
   qryTotalPerc.SQL.ADD('WHERE NUMPROCTRAB = ' + FloatToStr(dNumProcTrab));
   qryTotalPerc.SQL.ADD('AND CODTIPOOBJETO = ' + FloatToStr(dCodTipoObjeto));
   qryTotalPerc.SQL.ADD('AND PROGRAMA = ' + FloatToStr(dPrograma));
   qryTotalPerc.SQL.ADD('AND SUB_PROGRAMA = ' + FloatToStr(dSubPrograma));
   qryTotalPerc.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadRateioContabil.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryRateioContabil.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryRateioContabil.Cancel;
               qryRateioContabil.Close;
               qryPlanoPatro.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryRateioContabil.Close;
         qryPlanoPatro.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadRateioContabil.bbtnSairClick(Sender: TObject);
Begin
   If (qryTotalPerc.fieldByname('TOTPERC').asFloat > 0) And (qryTotalPerc.fieldByname('TOTPERC').asFloat <> 100.00) Then
      Begin
         Application.MessageBox('Total dos Percentuais tem que ser Igual a 100%. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         exit;
      End;

   Close;
End;

Procedure TfrmCadRateioContabil.sbtnInserirClick(Sender: TObject);
Begin
   Try
      sbtnInserir.enabled := False;
      sbtnAlterar.enabled := False;
      sbtnApagar.enabled := False;

      bbtnConfirmar.enabled := True;
      bbtnCancelar.enabled := True;

      pnlDadosPrincipal.enabled := True;

      qryRateioContabil.Insert;

      If (dSubPrograma = 43) Or (dSubPrograma = 44) Then
         Begin
            If (dSubPrograma = 43) Then
               qryRateioContabilIDTIPOINVEST.asInteger := 1 // RF
            Else
               qryRateioContabilIDTIPOINVEST.asInteger := 2; // RV

            CarregaCombo(dSubprograma, qryRateioContabilIDTIPOINVEST.Value);

            dblcTipoInvest.enabled := False;
            dblcInvestimento.setfocus;
         End
      Else
         Begin
            dblcTipoInvest.enabled := True;
            dblcTipoInvest.setfocus;
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadRateioContabil.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryRateioContabil.IsEmpty Then
      Begin
         Try
            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlDadosPrincipal.enabled := True;
            qryRateioContabil.edit;
            dblcPlanoPatro.setfocus;
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

Procedure TfrmCadRateioContabil.bbtnCancelarClick(Sender: TObject);
Begin
   If qryRateioContabil.state In [dsEdit, dsInsert] Then
      qryRateioContabil.Cancel;

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

Procedure TfrmCadRateioContabil.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryRateioContabil.IsEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão desse Rateio ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  qryAux.Close;
                  qryAux.SQL.Clear;
                  qryAux.SQL.Add('DELETE FROM JURIDICORATEIOCONTABIL   ');
                  qryAux.SQL.Add('WHERE IDJURIDICORATEIOCONTABIL = ' + quotedstr(qryRateioContabil.fieldbyname('IDJURIDICORATEIOCONTABIL').asString));
                  qryAux.ExecSQL;

                  qryRateioContabil.Close;
                  qryRateioContabil.Open;
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

Procedure TfrmCadRateioContabil.bbtnConfirmarClick(Sender: TObject);
Var CampoErro: TStringList;
Begin
   Try
      If qryRateioContabil.State In [dsInsert, dsEdit] Then
         Begin
            CampoErro := TStringList.Create;

            If ChecaCampos(frmCadRateioContabil, CampoErro, 1) Then
               Begin
                  If (dbPercRateio.value > 100.00) Then
                     Begin
                        Application.MessageBox('Percentual não pode ser Maior que 100%. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                        dbPercRateio.setfocus;
                        exit;
                     End;

                  If qryRateioContabil.State = dsInsert Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.ADD('SELECT *                     ');
                        qryAux.SQL.ADD('FROM JURIDICORATEIOCONTABIL  ');
                        qryAux.SQL.ADD('WHERE NUMPROCTRAB = ' + FloatToStr(dNumProcTrab));
                        qryAux.SQL.ADD('AND CODTIPOOBJETO = ' + FloatToStr(dCodTipoObjeto));
                        qryAux.SQL.ADD('AND PROGRAMA = ' + FloatToStr(dPrograma));
                        qryAux.SQL.ADD('AND SUB_PROGRAMA = ' + FloatToStr(dSubPrograma));
                        qryAux.SQL.ADD('AND IDPLANPREVCTBPATR = ' + FloatToStr(qryRateioContabil.fieldbyname('IDPLANPREVCTBPATR').asInteger));
                        qryAux.Open;
                        If Not qryAux.EOF Then
                           Begin
                              Application.MessageBox('Plano/Patro já lançado. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                              dblcPlanoPatro.setfocus;
                              Screen.Cursor := crDefault;
                              exit;
                           End;

                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SeqJuridicoRateioContabil.NEXTVAL SEQORDEM FROM DUAL');
                        qryAux.Open;

                        qryRateioContabil.fieldByname('IDJURIDICORATEIOCONTABIL').asInteger := qryAux.fieldByname('SEQORDEM').asInteger;
                        qryRateioContabil.FieldByName('NUMPROCTRAB').AsFloat := dNumProcTrab;
                        qryRateioContabil.FieldByName('CODTIPOOBJETO').AsFloat := dCodTipoObjeto;
                        qryRateioContabil.FieldByName('PROGRAMA').AsFloat := dPrograma;
                        qryRateioContabil.FieldByName('SUB_PROGRAMA').AsFloat := dSubPrograma;

                        sbtnInserir.Down := False;
                        sbtnInserir.enabled := False;
                        Screen.Cursor := crDefault;
                     End;

                  qryRateioContabil.Post;
                  qryRateioContabil.close;
                  qryRateioContabil.open;

                  TotalizaPercentual;

                  sbtnAlterar.Down := False;
                  sbtnAlterar.enabled := True;
                  sbtnApagar.Down := False;
                  sbtnApagar.enabled := True;
                  sbtnInserir.Down := False;
                  sbtnInserir.enabled := True;

                  bbtnConfirmar.enabled := False;
                  bbtnCancelar.enabled := False;

                  pnlDadosPrincipal.enabled := False;
               End
            Else
               Application.MessageBox(pchar(CampoErro.Text), 'Atenção ! Estes campos devem ser informados...', mb_ICONEXCLAMATION + mb_OK);
            FreeandNil(CampoErro);
         End;
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadRateioContabil.dblcTipoInvestCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   CarregaCombo(dSubprograma, qryTipoInvestIdTipoInvest.Value);
End;

Procedure TfrmCadRateioContabil.qryRateioContabilCalcFields(DataSet: TDataSet);
Begin
   If qryRateioContabil.fieldbyname('DESCINVEST').isnull Then
      Begin
         If qryInvestimentoIDINVESTIMENTO.asInteger <> 0 Then
            qryRateioContabilDESCINVEST.asString := qryRateioContabilDESCINV.AsString
         Else If qryRateioContabilIDFUNDOINVEST.AsInteger <> 0 Then
            qryRateioContabilDESCINVEST.asString := qryRateioContabilDESCFUNDO.asString;
      End;
End;

End.

