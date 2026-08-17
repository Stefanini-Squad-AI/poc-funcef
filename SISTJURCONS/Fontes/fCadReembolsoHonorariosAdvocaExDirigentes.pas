// **************************************************************************************************
//Rotina..........: fCadReembolsoHonorariosAdvocaExDirigentes
//N. Sol..........: 156018
//N. Kintana......: 1225602
//Data............: 04/07/2011
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Implementação de SP para Honorários Periciais. 
//********************************************************************************************************
//Rotina..........: fCadReembolsoHonorariosAdvocaExDirigentes
//N. Sol..........: 134030
//N. Kintana......: 791945
//Data............: 16/06/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Desenvolvimento do Cadastro do Controle de Pagamentos de Honorários a Ex-Funcionários
//********************************************************************************************************
Unit fCadReembolsoHonorariosAdvocaExDirigentes;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, TabControlDetalhe, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, CMProcuraSubTipo, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg,
   QExport3Dialog, TREdit, DBGrids;

Type
   TfrmReembolsoHonorariosAdvocaExDirigentes = Class(TForm)
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
      dsReembHonorarios: TwwDataSource;
      qryAux: TQuery;
      MSReembHonor: TMontaSelect;
      Status: TStaticText;
      pnlDadosPrincipal: TPanel;
      Label10: TLabel;
      Label8: TLabel;
      Label13: TLabel;
      Label15: TLabel;
      dblkpTribunal: TwwDBLookupCombo;
      dbNumProc: TwwDBEdit;
      dbVara: TwwDBEdit;
      dbObs: TwwDBEdit;
      dbrDecisao: TDBRadioGroup;
      dbrRequisitosIN: TDBRadioGroup;
      dsReembHonorarios_Reus: TwwDataSource;
      qryReembHonorarios_Obj: TwwQuery;
      dsReembHonorarios_Obj: TwwDataSource;
      qryReembHonorarios_ObjIDREEMBHONORADVOCA: TFloatField;
      qryReembHonorarios_ObjIDREHOADVOCATICIOSOBJS: TFloatField;
      qryReembHonorarios_ObjDSCOBJETOS: TStringField;
      MSReus: TMontaSelect;
      qryLkpTribunal: TwwQuery;
      qryLkpTribunalIDVARAJUSTICA: TFloatField;
      qryLkpTribunalDESCRICAO: TStringField;
      qryReembHonorarios_Reus: TQuery;
      qryReembHonorarios_ReusIDREEMBHONORADVOCA: TFloatField;
      qryReembHonorarios_ReusIDREU: TFloatField;
      qryReembHonorarios_ReusFLGREQUERENTE: TStringField;
      qryLkpReu: TQuery;
      qryLkpReuIDPESSOA: TFloatField;
      qryLkpReuRAZAOSOCIAL: TStringField;
      qryReembHonorarios_ReusIDREHOADVOCATICIOSREUS: TFloatField;
      qryLkpReuNOME: TStringField;
      qryReembHonorarios_ReusnomeReu: TStringField;
      qryReembHonorarios: TQuery;
      Label3: TLabel;
      dbdtRecebimento: TCMDateTimePicker;
      qryReembHonorarios_ReusFLGEXDIRIGENTE: TStringField;
      pcOutrosDados: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      pnlReus: TPanel;
      Dock975: TDock97;
      Toolbar973: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      btnExc1: TToolbarButton97;
      Toolbar972: TToolbar97;
      btnCon1: TToolbarButton97;
      btnCan1: TToolbarButton97;
      dbgReu: TwwDBGrid;
      wwIButton2: TwwIButton;
      pnlDadosReu: TPanel;
      Label1: TLabel;
      Label12: TLabel;
      Label6: TLabel;
      Label19: TLabel;
      Label11: TLabel;
      Label14: TLabel;
      dbrgexdirigente: TDBRadioGroup;
      CMReus: TCMProcura;
      dbrgRequerente: TDBRadioGroup;
      dbeValorPleiteado1: TDBRealEdit;
      dbeValorAutoriz1: TDBRealEdit;
      dbDtReemb: TCMDateTimePicker;
      dbeValorPagto: TDBRealEdit;
      dbeNumProcADM: TwwDBEdit;
      pnlObjs: TPanel;
      Dock976: TDock97;
      Toolbar974: TToolbar97;
      btnInc2: TToolbarButton97;
      btnAlt2: TToolbarButton97;
      btnExc2: TToolbarButton97;
      Toolbar975: TToolbar97;
      btnCon2: TToolbarButton97;
      btnCan2: TToolbarButton97;
      dbgObj: TwwDBGrid;
      wwIButton1: TwwIButton;
      pnlDadosObj: TPanel;
      Label2: TLabel;
      SpeedButton1: TSpeedButton;
      dbmObjs: TDBMemo;
      qryReembHonorarios_ReusIDPRESTSERVICO: TFloatField;
      qryReembHonorarios_ReusVALORPLEITEADO: TFloatField;
      qryReembHonorarios_ReusVALORAUTORIZADO: TFloatField;
      qryReembHonorarios_ReusDATAPAGAMENTO: TDateTimeField;
      qryReembHonorarios_ReusVALORPAGTOADM: TFloatField;
      qryReembHonorarios_ReusNUMPROCESSOADM: TStringField;
      qryLkpAdvogado: TQuery;
      StringField1: TStringField;
      FloatField1: TFloatField;
      StringField2: TStringField;
      qryReembHonorarios_ReusnomeAdvoga: TStringField;
      StaticText1: TStaticText;
      DBRealEdit1: TDBRealEdit;
      qryTotais: TwwQuery;
      dsTotais: TwwDataSource;
      qryTotaisTOTALPAGO: TFloatField;
      CMPrestServico: TCMProcuraSubTipo;
      qryReembHonorariosIDREEMBHONORADVOCA: TFloatField;
      qryReembHonorariosDATARECEBIMENTO: TDateTimeField;
      qryReembHonorariosNUMPROCESSO: TStringField;
      qryReembHonorariosIDVARAJUSTICA: TFloatField;
      qryReembHonorariosNUMVARA: TStringField;
      qryReembHonorariosTIPODECISAOMERITO: TFloatField;
      qryReembHonorariosFLGREQINATENDIDOS: TStringField;
      qryReembHonorariosDSCOBSERVACAO: TStringField;
      qryReembHonorariosTRGDTINCLUSAO: TDateTimeField;
      qryReembHonorariosTRGUSERINCLUSAO: TStringField;
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
      Procedure dbeValorPleiteado1Exit(Sender: TObject);
      Procedure btnInc1Click(Sender: TObject);
      Procedure pcOutrosDadosChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure btnExc1Click(Sender: TObject);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
      Procedure qryReembHonorarios_ReusCalcFields(DataSet: TDataSet);
      Procedure CMReusValidaDados(Sender: TObject);
      Procedure dbgReuDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure btnInc2Click(Sender: TObject);
      Procedure btnAlt2Click(Sender: TObject);
      Procedure btnExc2Click(Sender: TObject);
      Procedure btnCon2Click(Sender: TObject);
      Procedure btnCan2Click(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
      Procedure dbrgRequerenteClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
   Private
      { Private declarations }
      
   Public
      { Public declarations }
   End;
Var
   frmReembolsoHonorariosAdvocaExDirigentes: TfrmReembolsoHonorariosAdvocaExDirigentes;

Implementation

Uses UMensErro;

{$R *.DFM}

//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
{Function TfrmReembolsoHonorariosAdvocaExDirigentes.ChecaCampos(Const objeto: TComponent; Var CampoErro: TStringList; grupo: integer): Boolean;
Var i: integer;
Begin
   For i := 0 To Objeto.ComponentCount - 1 Do
      Begin
         If Objeto.Components[i].Tag = grupo Then
            Begin
               If (Objeto.Components[i] Is TDBMemo) And ((Objeto.Components[i] As TDBMemo).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TDBMemo).Hint);
               If (Objeto.Components[i] Is TDBEdit) And ((Objeto.Components[i] As TDBEdit).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TDBEdit).Hint);
               If (Objeto.Components[i] Is TwwDBEdit) And ((Objeto.Components[i] As TwwDBEdit).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TwwDBEdit).Hint);
               If (Objeto.Components[i] Is TCMProcura) And ((Objeto.Components[i] As TCMProcura).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TCMProcura).Hint);
               If (Objeto.Components[i] Is TwwDBLookupCombo) And ((Objeto.Components[i] As TwwDBLookupCombo).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TwwDBLookupCombo).Hint);
               If (Objeto.Components[i] Is TCMDateTimePicker) And ((Objeto.Components[i] As TCMDateTimePicker).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TCMDateTimePicker).Hint);
            End;
      End;
   CampoErro.sort;
   Result := (CampoErro.Text = '');
End;}

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.FormShow(Sender: TObject);
Begin
   If frmReembolsoHonorariosAdvocaExDirigentes.WindowState = wsNormal Then
      Begin
         frmReembolsoHonorariosAdvocaExDirigentes.Top := (Screen.Height - Height) Div 2;
         frmReembolsoHonorariosAdvocaExDirigentes.Left := (Screen.Width - Width) Div 2;
      End;

   pcOutrosDados.ActivePageIndex := 0;

   Screen.Cursor := crSQLWait;
   qryLkpReu.Close;
   qryLkpReu.Open;
   qryLkpAdvogado.Close;
   qryLkpAdvogado.Open;
   qryLkpTribunal.Close;
   qryLkpTribunal.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   pnlReus.enabled := False;
   pnlObjs.enabled := False;
   pnlDadosReu.enabled := False;
   pnlDadosObj.enabled := False;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   btnInc1.enabled := False;
   btnAlt1.enabled := False;
   btnExc1.enabled := False;
   btnInc2.enabled := False;
   btnAlt2.enabled := False;
   btnExc2.enabled := False;

   btnCon1.Enabled := False;
   btnCan1.Enabled := False;
   btnCon2.enabled := False;
   btnCan2.enabled := False;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSReembHonor.Caption := 'Selecione um Reembolso';
   MSReembHonor.Executar;
   Status.caption := '';
   If (MSReembHonor.RetornouValor) Then
      Begin
         Screen.Cursor := crSQLWait;
         qryReembHonorarios.Close;
         qryReembHonorarios.SQL.Clear;
         qryReembHonorarios.SQL.Add('SELECT *          	');
         qryReembHonorarios.SQL.Add('FROM REEMBOLSOHONORADVOCATICIOS ');
         qryReembHonorarios.SQL.Add('WHERE IDREEMBHONORADVOCA = ' + quotedstr(MSReembHonor.ValoresChave[0]));
         qryReembHonorarios.Open;

         qryReembHonorarios_Reus.Close;
         qryReembHonorarios_Reus.Open;
         //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
         //qryTotais.Close;
         //qryTotais.Open;
         //qryReembHonorarios_Obj.Close;
         //qryReembHonorarios_Obj.Open;
         Screen.Cursor := crDefault;

         Status.caption := 'Consultando';

         pnlReus.enabled := True;
         pnlObjs.enabled := True;

         btnInc1.enabled := True;
         btnAlt1.enabled := True;
         btnExc1.enabled := True;
         btnInc2.enabled := True;
         btnAlt2.enabled := True;
         btnExc2.enabled := True;
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryReembHonorarios.State In [dsEdit, dsInsert]) Or
      (qryReembHonorarios_Reus.State In [dsEdit, dsInsert]) Or
      (qryReembHonorarios_Obj.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryReembHonorarios.Cancel;
               qryReembHonorarios_Reus.Cancel;
               qryReembHonorarios_Obj.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryReembHonorarios_Obj.Close; ;
               qryReembHonorarios_Reus.Close; ;
               qryReembHonorarios.Close;
               qryLkpReu.Close;
               qryTotais.Close;
               qryLkpAdvogado.Close;
               qryLkpTribunal.Close;
               qryAux.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryReembHonorarios_Obj.Close; ;
         qryReembHonorarios_Reus.Close; ;
         qryReembHonorarios.Close;
         qryLkpReu.Close;
         qryTotais.Close;
         qryLkpAdvogado.Close;
         qryLkpTribunal.Close;
         qryAux.Close;
         CanClose := True;
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.sbtnInserirClick(Sender: TObject);
Begin
   Try
      If qryReembHonorarios.State <> dsInsert Then
         Begin
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            Status.caption := 'Inserindo';
            sbtnAlterar.enabled := False;
            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;

            pcOutrosDados.ActivePageIndex := 0;

            btnInc1.enabled := False;
            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            btnInc2.enabled := False;
            btnAlt2.enabled := False;
            btnExc2.enabled := False;

            pnlDadosPrincipal.enabled := True;
            pnlReus.enabled := False;
            pnlObjs.enabled := False;

            qryReembHonorarios_Reus.Close;
            qryReembHonorarios_Obj.Close;
            CMReus.Text := '';
            CMPrestServico.Text := '';
            dbeValorPleiteado1.Clear;
            dbeValorAutoriz1.Clear;
            dbeValorPagto.Clear;

            qryReembHonorarios.Open;
            qryReembHonorarios.insert;

            qryReembHonorarios.fieldByname('TIPODECISAOMERITO').asInteger := 0;
            qryReembHonorarios.fieldByname('FLGREQINATENDIDOS').asInteger := 0;
            dbdtRecebimento.setfocus;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryReembHonorarios.isEmpty Then
      Begin
         Try
            If qryReembHonorarios.State <> dsEdit Then
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
                  pnlReus.enabled := False;
                  pnlObjs.enabled := False;
                  qryReembHonorarios.Edit;
                  dbdtRecebimento.setfocus;
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

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.bbtnCancelarClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryReembHonorarios.state In [dsEdit, dsInsert] Then
            qryReembHonorarios.Cancel;
         dtmBaseDados.dbBaseDados.RollBack;
      End;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;
   btnInc2.enabled := True;
   btnAlt2.enabled := True;
   btnExc2.enabled := True;

   If status.caption = 'Inserindo' Then
      Begin
         qryReembHonorarios.Close;
         qryReembHonorarios_Reus.Close;
         qryReembHonorarios_Obj.Close;
         qryTotais.Close;
         qryTotais.Open;

         CMReus.Text := '';
         CMPrestServico.Text := '';
         Status.caption := '';
         dbeValorPleiteado1.Clear;
         dbeValorAutoriz1.Clear;
         dbeValorPagto.Clear;

         btnInc1.enabled := False;
         btnAlt1.enabled := False;
         btnExc1.enabled := False;
         btnInc2.enabled := False;
         btnAlt2.enabled := False;
         btnExc2.enabled := False;
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
   pnlReus.enabled := True;
   pnlObjs.enabled := True;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryReembHonorarios.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão desse Reembolso ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryReembHonorarios.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  Status.caption := '';
                  btnInc1.enabled := False;
                  btnAlt1.enabled := False;
                  btnExc1.enabled := False;
                  btnInc2.enabled := False;
                  btnAlt2.enabled := False;
                  btnExc2.enabled := False;
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

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.bbtnConfirmarClick(Sender: TObject);

Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryReembHonorarios.State In [dsInsert, dsEdit] Then
               Begin
                  //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602 INICIO
                  //CampoErro := TStringList.Create;
                  Screen.Cursor := crSQLWait;
                  


                  If qryReembHonorarios.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQREEMBOLSOHONORADVOCATICIOS.NEXTVAL SEQ FROM DUAL');
                        qryAux.Open;

                        qryReembHonorarios.fieldByname('IDREEMBHONORADVOCA').asInteger := qryAux.fieldByname('SEQ').asInteger;
                     End;

                  qryReembHonorarios.Post;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  pnlDadosPrincipal.enabled := False;
                  pnlReus.enabled := True;
                  pnlObjs.enabled := True;

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
                        btnInc2.enabled := True;
                        btnAlt2.enabled := True;
                        btnExc2.enabled := True;
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


{Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.dbeValorPleiteado1Exit(Sender: TObject);
Begin
   If qryReembHonorarios_Reus.fieldByname('VALORPLEITEADO').asFloat > 0.00 Then
      Begin
         qryReembHonorarios_Reus.fieldByname('VALORAUTORIZADO').asFloat := qryReembHonorarios_Reus.fieldByname('VALORPLEITEADO').asFloat;
         qryReembHonorarios_Reus.fieldByname('VALORPAGTOADM').asFloat := qryReembHonorarios_Reus.fieldByname('VALORPLEITEADO').asFloat
      End;
End;}
//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602 FIM
Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.pcOutrosDadosChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   AllowChange := False;
   If (qryReembHonorarios.state In [dsbrowse, dsinactive]) And
      (qryReembHonorarios_Reus.state In [dsbrowse, dsinactive]) And
      (qryReembHonorarios_Obj.state In [dsbrowse, dsinactive]) Then
      AllowChange := True;
End;

// *********************** RÉUS ****************************************************

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnInc1Click(Sender: TObject);
Begin
   If Not qryReembHonorarios.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlReus.enabled := True;
            pnlObjs.enabled := False;

            dbgReu.enabled := False;
            pnlDadosReu.enabled := True;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;

            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryReembHonorarios_Reus.Open;
            qryReembHonorarios_Reus.insert;

            qryReembHonorarios_Reus.fieldbyname('FLGREQUERENTE').asInteger := 0; // Não
            qryReembHonorarios_Reus.fieldbyname('FLGEXDIRIGENTE').asInteger := 0; // Outros

            CMReus.setfocus;
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

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnExc1Click(Sender: TObject);
Begin
   If Not qryReembHonorarios_Reus.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Réu ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryReembHonorarios_Reus.Delete;
                  qryTotais.Close;
                  qryTotais.Open;
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

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnAlt1Click(Sender: TObject);
Begin
   If Not qryReembHonorarios_Reus.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlReus.enabled := True;
            pnlObjs.enabled := False;

            dbgReu.enabled := False;
            pnlDadosReu.enabled := True;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.enabled := True;
            btnCan1.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryReembHonorarios_Reus.Edit;
            CMReus.setfocus;
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

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnCon1Click(Sender: TObject);
//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
//Var CampoErro: TStringList;
Begin
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602 INICIO
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryReembHonorarios_Reus.State In [dsInsert, dsEdit] Then
               Begin
                  If qryReembHonorarios_Reus.fieldByname('IDREU').isnull Then
                     Begin
                        Application.MessageBox('Réu não foi localizado !', 'Atenção !', Mb_IconExclamation);
                        CMReus.setfocus;
                        Exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryReembHonorarios_Reus.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQREHOADVOCATICIOSREUS.NEXTVAL SEQ FROM DUAL');
                        qryAux.Open;

                        qryReembHonorarios_Reus.fieldByname('IDREEMBHONORADVOCA').asInteger := qryReembHonorarios.fieldByname('IDREEMBHONORADVOCA').asInteger;
                        qryReembHonorarios_Reus.fieldByname('IDREHOADVOCATICIOSREUS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                     End;

                  qryReembHonorarios_Reus.post;
                  dtmBaseDados.dbBaseDados.Commit;
                  qryReembHonorarios_Reus.Close;
                  qryReembHonorarios_Reus.Open;
                  qryTotais.Close;
                  qryTotais.Open;
                  Screen.Cursor := crDefault;

                  pnlReus.enabled := True;
                  pnlObjs.enabled := True;

                  pnlDadosReu.enabled := False;
                  dbgReu.enabled := True;

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
         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602 FIM
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnCan1Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryReembHonorarios_Reus.state In [dsEdit, dsInsert] Then
            qryReembHonorarios_Reus.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryReembHonorarios_Reus.Close;
         qryReembHonorarios_Reus.Open;
         qryTotais.Close;
         qryTotais.Open;
      End;

   pnlDadosPrincipal.enabled := False;
   pnlReus.enabled := True;
   pnlObjs.enabled := True;
   dbgReu.enabled := True;
   pnlDadosReu.enabled := False;

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


//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.dbeValorPleiteado1Exit(Sender: TObject);
Begin
   If qryReembHonorarios_Reus.fieldByname('VALORPLEITEADO').asFloat > 0.00 Then
      Begin
         qryReembHonorarios_Reus.fieldByname('VALORAUTORIZADO').asFloat := qryReembHonorarios_Reus.fieldByname('VALORPLEITEADO').asFloat;
         qryReembHonorarios_Reus.fieldByname('VALORPAGTOADM').asFloat := qryReembHonorarios_Reus.fieldByname('VALORPLEITEADO').asFloat
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.qryReembHonorarios_ReusCalcFields(DataSet: TDataSet);
Begin
   qryLkpReu.Close;
   qryLkpReu.ParamByName('IDREU').asfloat := qryReembHonorarios_Reus.fieldbyname('IDREU').asFloat;
   qryLkpReu.Open;
   qryReembHonorarios_Reus.fieldbyname('nomeReu').asString := qryLkpReu.fieldbyname('Nome').asString;

   qryLkpAdvogado.Close;
   qryLkpAdvogado.ParamByName('IDPRESTSERVICO').asfloat := qryReembHonorarios_Reus.fieldbyname('IDPRESTSERVICO').asFloat;
   qryLkpAdvogado.Open;
   qryReembHonorarios_Reus.fieldbyname('nomeAdvoga').asString := qryLkpAdvogado.fieldbyname('Nome').asString;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.CMReusValidaDados(Sender: TObject);
Begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT IDREEMBHONORADVOCA       ');
   qryAux.SQL.add('FROM REHOADVOCATICIOS_REUS      ');
   qryAux.SQL.add('WHERE IDREEMBHONORADVOCA = ' + quotedstr(qryReembHonorarios.fieldbyname('IDREEMBHONORADVOCA').asString));
   qryAux.SQL.add('      AND IDREU = ' + quotedstr(qryReembHonorarios_Reus.fieldbyname('IDREU').asString));
   qryAux.Open;
   If Not qryAux.EOF Then
      Begin
         Application.MessageBox('Réu já lançado. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         CMReus.text := '';
         CMReus.setfocus;
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.dbgReuDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryReembHonorarios_Reus.isEmpty Then
      Begin
         If qryReembHonorarios_Reus.fieldbyname('FLGREQUERENTE').asInteger = 1 Then
            Begin
               dbgReu.Canvas.Font.Color := clBlue;
               dbgReu.Canvas.Font.Style := [fsbold];
            End
         Else
            dbgReu.Canvas.Font.Color := clWindowText;

         dbgReu.DefaultDrawDataCell(Rect, Field, State);
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.dbrgRequerenteClick(Sender: TObject);
Begin
   If dbrgRequerente.itemindex = 1 Then // sim
      Begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.add('SELECT IDREEMBHONORADVOCA    ');
         qryAux.SQL.add('FROM REHOADVOCATICIOS_REUS   ');
         qryAux.SQL.add('WHERE IDREEMBHONORADVOCA = ' + quotedstr(qryReembHonorarios.fieldbyname('IDREEMBHONORADVOCA').asString));
         qryAux.SQL.add('      AND FLGREQUERENTE = 1  '); // Sim
         qryAux.Open;
         If Not qryAux.EOF Then
            Begin
               Application.MessageBox('Já existe um Réu definido como Requerente. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
               dbrgRequerente.itemindex := 0;
            End;
      End;
End; 

// *********************** FIM RÉUS ********************************************************

// *********************** OBJS ********************************************************

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnInc2Click(Sender: TObject);
Begin
   If Not qryReembHonorarios.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlReus.enabled := False;
            pnlObjs.enabled := True;

            dbgObj.enabled := False;
            pnlDadosObj.enabled := True;

            btnAlt2.enabled := False;
            btnExc2.enabled := False;
            btnCon2.Enabled := True;
            btnCan2.Enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryReembHonorarios_Obj.Open;
            qryReembHonorarios_Obj.insert;

            dbmObjs.setfocus;
         Except
            btnCan2Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Reembolso selecionado para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc2.down := False;
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnAlt2Click(Sender: TObject);
Begin
   If Not qryReembHonorarios_Obj.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlReus.enabled := False;
            pnlObjs.enabled := True;
            dbgObj.enabled := False;
            pnlDadosObj.enabled := True;

            btnInc2.enabled := False;
            btnExc2.enabled := False;
            btnCon2.enabled := True;
            btnCan2.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryReembHonorarios_Obj.Edit;
            dbmObjs.setfocus;
         Except
            btnCan2Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnAlt2.down := False;
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnExc2Click(Sender: TObject);
Begin
   If Not qryReembHonorarios_Obj.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Objeto ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryReembHonorarios_Obj.Delete;
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
         btnExc2.Down := False;
      End;
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnCon2Click(Sender: TObject);
//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
//Var CampoErro: TStringList;
Begin
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602 INICIO
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryReembHonorarios_Obj.State In [dsInsert, dsEdit] Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If qryReembHonorarios_Obj.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQREHOADVOCATICIOSOBJS.NEXTVAL SEQ FROM DUAL');
                        qryAux.Open;

                        qryReembHonorarios_Obj.fieldByname('IDREEMBHONORADVOCA').asInteger := qryReembHonorarios.fieldByname('IDREEMBHONORADVOCA').asInteger;
                        qryReembHonorarios_Obj.fieldByname('IDREHOADVOCATICIOSOBJS').asInteger := qryAux.fieldByname('SEQ').asInteger;
                     End;

                  qryReembHonorarios_Obj.post;
                  dtmBaseDados.dbBaseDados.Commit;
                  qryReembHonorarios_Obj.Close;
                  qryReembHonorarios_Obj.Open;
                  Screen.Cursor := crDefault;

                  pnlReus.enabled := True;
                  pnlObjs.enabled := True;
                  pnlDadosObj.enabled := False;
                  dbgObj.enabled := True;

                  btnInc2.enabled := True;
                  btnAlt2.enabled := True;
                  btnExc2.enabled := True;
                  btnCon2.enabled := False;
                  btnCan2.enabled := False;
                  btnInc2.down := False;
                  btnAlt2.down := False;
                  btnCon2.down := False;

                  If status.caption <> 'Inserindo' Then
                     Begin
                        sbtnInserir.enabled := True;
                        sbtnApagar.enabled := True;
                        sbtnAlterar.enabled := True;
                        sbtnProcurar.enabled := True;
                     End;
               End;
         End;
   Except
      btnCan2Click(Self);
      Raise;
   End;
   //Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602 FIM
End;

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.btnCan2Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryReembHonorarios_Obj.state In [dsEdit, dsInsert] Then
            qryReembHonorarios_Obj.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryReembHonorarios_Obj.Close;
         qryReembHonorarios_Obj.Open;
      End;

   pnlDadosPrincipal.enabled := False;
   pnlReus.enabled := True;
   pnlObjs.enabled := True;
   dbgObj.enabled := True;
   pnlDadosObj.enabled := False;

   btnInc2.enabled := True;
   btnAlt2.enabled := True;
   btnExc2.enabled := True;
   btnCon2.enabled := False;
   btnCan2.enabled := False;
   btnInc2.down := False;
   btnAlt2.down := False;
   btnCon2.down := False;

   If status.caption <> 'Inserindo' Then
      Begin
         sbtnInserir.enabled := True;
         sbtnApagar.enabled := True;
         sbtnAlterar.enabled := True;
         sbtnProcurar.enabled := True;
      End;
End;



Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.SpeedButton1Click(Sender: TObject);
Begin
   dbmObjs.Clear;
End;

// *********************** FIM OBJS ********************************************************

//Paulo Nobre / Otacilio - SOL 156018 - KTN 1228602
{Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.dbrgRequerenteClick(Sender: TObject);
Begin
   If dbrgRequerente.itemindex = 1 Then // sim
      Begin
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.add('SELECT IDREEMBHONORADVOCA    ');
         qryAux.SQL.add('FROM REHOADVOCATICIOS_REUS   ');
         qryAux.SQL.add('WHERE IDREEMBHONORADVOCA = ' + quotedstr(qryReembHonorarios.fieldbyname('IDREEMBHONORADVOCA').asString));
         qryAux.SQL.add('      AND FLGREQUERENTE = 1  '); // Sim
         qryAux.Open;
         If Not qryAux.EOF Then
            Begin
               Application.MessageBox('Já existe um Réu definido como Requerente. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
               dbrgRequerente.itemindex := 0;
            End;
      End;
End;}

Procedure TfrmReembolsoHonorariosAdvocaExDirigentes.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   frmReembolsoHonorariosAdvocaExDirigentes := Nil;
End;

End.

