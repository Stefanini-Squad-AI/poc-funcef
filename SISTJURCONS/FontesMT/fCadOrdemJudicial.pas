//******************************************************************************************
//Rotina..........: fCadOrdemJudicial
//N. Sol..........: 127752
//N. Kintana......: 682778
//Data............: 02/05/2010
//Responsável.....: Paulo Nobre / Adilson Filho
//Descrição.......: Desenvolvimento do Cadastro das Ordens Judiciais - FUNCEF não é parte
//******************************************************************************************
Unit fCadOrdemJudicial;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo, CMProcura,
   ExtCtrls, wwdbedit, TabControlDetalhe, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, CMProcuraSubTipo, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg;

Type
   TfrmCadOrdemJudicial = Class(TForm)
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
      tbsDadosOrdem: TTabSheet;
      pnlDadosPrincipal: TPanel;
      Label10: TLabel;
      Label11: TLabel;
      Label8: TLabel;
      Label13: TLabel;
      Label14: TLabel;
      Label12: TLabel;
      Label15: TLabel;
      lblPdEmiss: TLabel;
      Label16: TLabel;
      Label17: TLabel;
      Label18: TLabel;
      Label19: TLabel;
      Label20: TLabel;
      Label26: TLabel;
      Label27: TLabel;
      Label29: TLabel;
      dbDtInicio: TCMDateTimePicker;
      dbDtTermino: TCMDateTimePicker;
      dbDtEncaminha: TCMDateTimePicker;
      dbDtExped: TCMDateTimePicker;
      dbDtCumprimento: TCMDateTimePicker;
      dsOrdem: TwwDataSource;
      qryOrdem_Benef: TwwQuery;
      dsOrdem_Benef: TwwDataSource;
      qryAux: TQuery;
      qryLkpTribunal: TwwQuery;
      qryLkpUF: TwwQuery;
      dblkpUF: TwwDBLookupCombo;
      qryLkpUFCODESTADO: TStringField;
      dblkpTribunal: TwwDBLookupCombo;
      qryLkpTribunalIDVARAJUSTICA: TFloatField;
      qryLkpTribunalDESCRICAO: TStringField;
      qryLkpAreaInterna: TwwQuery;
      qryLkpAreaInternaNOME: TStringField;
      dblkpAreaInt: TwwDBLookupCombo;
      tbsDadosComplementares: TTabSheet;
      pnlDadosBenefic: TPanel;
      Label9: TLabel;
      Label3: TLabel;
      Label2: TLabel;
      Label5: TLabel;
      Label1: TLabel;
      dbedConta: TwwDBEdit;
      dblkBanco: TwwDBLookupCombo;
      dbrdgRepresentante: TDBRadioGroup;
      dbNomeRepresent: TwwDBEdit;
      dbCPFRepresent: TwwDBEdit;
      dblkpAgencia: TwwDBLookupCombo;
      dbGrdBenefic: TwwDBGrid;
      Dock973: TDock97;
      tb97BotoesDetalhe: TToolbar97;
      sbtnInsDet: TToolbarButton97;
      sbtnAltDet: TToolbarButton97;
      sbtnExcluiDet: TToolbarButton97;
      bbtnCancelarDet: TBitBtn;
      bbtnOkDet: TBitBtn;
      dblkpComandoJud: TwwDBLookupCombo;
      DbNumOficio: TwwDBEdit;
      dbMotivo: TwwDBEdit;
      dbNumProc: TwwDBEdit;
      dbVara: TwwDBEdit;
      dbObs: TwwDBEdit;
      dbNumGEDOC: TwwDBEdit;
      MSOrdemJudicial: TMontaSelect;
      MSParteAtiva: TMontaSelect;
      Label4: TLabel;
      Label6: TLabel;
      CMProcuraPartePassiva: TCMProcura;
      Label7: TLabel;
      qryLkpComandoJudicial: TwwQuery;
      qryLkpComandoJudicialCODTIPOOBJETO: TFloatField;
      qryLkpComandoJudicialDESCRICAO: TStringField;
      qryLkpBanco: TwwQuery;
      qryLkpBancoIDPESSOA: TFloatField;
      qryLkpBancoRAZAOSOCIAL: TStringField;
      dbrdgQualificacao: TDBRadioGroup;
      qryLkpBeneficario: TwwQuery;
      qryOrdem_BenefIDORDEMJUDICIAL: TFloatField;
      qryOrdem_BenefIDORDJUDBENEFICIARIO: TFloatField;
      qryOrdem_BenefIDBENEFICIARIO: TFloatField;
      qryOrdem_BenefIDDEPENDENCIA: TStringField;
      qryOrdem_BenefTIPOREPRESENTANTE: TFloatField;
      qryOrdem_BenefNOMEREPRESENTANTE: TStringField;
      qryOrdem_BenefCPFREPRESENTANTE: TStringField;
      qryLkpAgencia: TwwQuery;
      dbcBeneficiario: TwwDBLookupCombo;
      qryOrdem_BenefnomeBeneficiario: TStringField;
      qryOrdem_BenefdscTipoRepresentante: TStringField;
      qryLkpAgenciaNUMAGENCIA: TStringField;
      qryOrdem_BenefTIPOQUALIFICACAO: TFloatField;
      qryOrdem_BenefdscQualificacao: TStringField;
      bbtnVoltarDet: TBitBtn;
      Label22: TLabel;
      dbDtOrdem: TCMDateTimePicker;
      dsLkpBanco: TwwDataSource;
      qryOrdem_BenefIDBANCO: TFloatField;
      qryLkpAgenciaIDBANCO: TFloatField;
      wwDBEdit1: TwwDBEdit;
      Label23: TLabel;
      qryOrdem_BenefNUMAGENCIA: TStringField;
      qryOrdem_BenefNUMCONTACORRENTE: TStringField;
      qryLkpAreaInternaCODCENTROCUSTO: TStringField;
      dbGrdBeneficIButton: TwwIButton;
      Label24: TLabel;
      qryOrdem_BenefIDPARTEATIVA: TFloatField;
      qryOrdem: TwwQuery;
      qryOrdemIDORDEMJUDICIAL: TFloatField;
      qryOrdemIDPARTEATIVA: TFloatField;
      qryOrdemIDPARTEPASSIVA: TFloatField;
      qryOrdemDATAORDEM: TDateTimeField;
      qryOrdemNUMOFICJUDICIAL: TStringField;
      qryOrdemNUMPROCESSO: TStringField;
      qryOrdemIDVARAJUSTICA: TFloatField;
      qryOrdemNUMVARA: TStringField;
      qryOrdemCODESTADO: TStringField;
      qryOrdemIDPAIS: TFloatField;
      qryOrdemIDCOMANDOJUDICIAL: TFloatField;
      qryOrdemOBSERVACAO: TStringField;
      qryOrdemDATAINICIOVIG: TDateTimeField;
      qryOrdemDATATERMINOVIG: TDateTimeField;
      qryOrdemIDEMPRESA: TFloatField;
      qryOrdemCODCENTROCUSTO: TStringField;
      qryOrdemNUMGEDOC: TStringField;
      qryOrdemDATAENCAMINHA: TDateTimeField;
      qryOrdemDATAEXPEDICAO: TDateTimeField;
      qryOrdemDATACUMPRIMENTO: TDateTimeField;
      qryOrdemMOTIVONAOCUMPCOMJUD: TStringField;
      CMProcuraParteAtiva: TCMProcura;
      MSPartePassiva: TMontaSelect;
      Status: TStaticText;
      imgBenefic: TImage;
      qryLkpBeneficarioNOME: TStringField;
      qryLkpBeneficarioIDPESSOA: TFloatField;
      qryLkpBeneficarioFLGBENEFICIARIO: TFloatField;
      qryLkpBeneficarioFLGDEPLEGAL: TFloatField;
      Image1: TImage;
      Label21: TLabel;
      Label25: TLabel;
      Image4: TImage;
      qryOrdem_Benefebenefic: TIntegerField;
      qryOrdem_BenefeDepLegal: TIntegerField;
      Procedure FormCreate(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure sbtnInsDetClick(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure pcOrdemJudicialChanging(Sender: TObject; Var AllowChange: Boolean);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
      Procedure qryOrdem_BenefCalcFields(DataSet: TDataSet);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure sbtnExcluiDetClick(Sender: TObject);
      Procedure dbrdgRepresentanteClick(Sender: TObject);
      Procedure CMProcuraPartePassivaValidaDados(Sender: TObject);
      Procedure dbDtTerminoExit(Sender: TObject);
      Procedure bbtnVoltarDetClick(Sender: TObject);
      Procedure dbDtOrdemExit(Sender: TObject);
      Procedure dbGrdBeneficCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbcBeneficiarioCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure CMProcuraParteAtivaValidaDados(Sender: TObject);
      Procedure dblkpUFExit(Sender: TObject);
      Procedure qryOrdem_BenefAfterScroll(DataSet: TDataSet);
   Private
      { Private declarations }
      Function ChecaCampos(Const objeto: TComponent; Var CampoErro: TStringList; grupo: integer): Boolean;
   Public
      { Public declarations }
   End;
Var
   frmCadOrdemJudicial: TfrmCadOrdemJudicial;
   sParteAtivaAnterior: String;

Implementation

Uses UMensErro;

{$R *.DFM}

Function TfrmCadOrdemJudicial.ChecaCampos(Const objeto: TComponent; Var CampoErro: TStringList; grupo: integer): Boolean;
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
               If (Objeto.Components[i] Is TCMDateTimePicker) And ((Objeto.Components[i] As TCMDateTimePicker).Text = '') Then
                  CampoErro.Add((Objeto.Components[i] As TCMDateTimePicker).Hint);
            End;
      End;
   CampoErro.sort;
   Result := (CampoErro.Text = '');
End;

Procedure TfrmCadOrdemJudicial.FormShow(Sender: TObject);
Begin
   If frmCadOrdemJudicial.WindowState = wsNormal Then
      Begin
         frmCadOrdemJudicial.Top := (Screen.Height - Height) Div 2;
         frmCadOrdemJudicial.Left := (Screen.Width - Width) Div 2;
      End;

   Screen.Cursor := crSQLWait;
   qryLkpTribunal.Open;
   qryLkpUF.Open;
   qryLkpAreaInterna.Open;
   qryLkpComandoJudicial.Open;
   qryLkpBanco.Open;
   qryLkpAgencia.Open;
   qryLkpBeneficario.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadOrdemJudicial.FormCreate(Sender: TObject);
Begin
   pcOrdemJudicial.ActivePageIndex := 0;
   pnlDadosPrincipal.enabled := False;
   pnlDadosBenefic.enabled := False;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   sbtnInsDet.enabled := False;
   sbtnAltDet.enabled := False;
   sbtnExcluiDet.enabled := False;
   bbtnOkDet.Enabled := False;
   bbtnCancelarDet.Enabled := False;

   imgBenefic.visible := False;

   image1.visible := False;
   image4.visible := False;
   Label21.Visible := False;
   Label25.Visible := False;
End;

Procedure TfrmCadOrdemJudicial.sbtnProcurarClick(Sender: TObject);
Begin
   sbtnProcurar.down := False;
   MSOrdemJudicial.Caption := 'Selecione a Ordem Judicial';
   MSOrdemJudicial.Executar;
   Status.caption := '';
   If (MSOrdemJudicial.RetornouValor) Then
      Begin
         Screen.Cursor := crSQLWait;
         qryOrdem.Close;
         qryOrdem.SQL.clear;
         qryOrdem.SQL.Add('SELECT * ');
         qryOrdem.SQL.Add('FROM ORDEMJUDICIAL');
         qryOrdem.SQL.Add('WHERE IDORDEMJUDICIAL = ' + quotedstr(MSOrdemJudicial.ValoresChave[0]));
         qryOrdem.Open;
         sParteAtivaAnterior := qryOrdem.fieldbyname('IDPARTEATIVA').asString;

         qryOrdem_Benef.Close;
         qryOrdem_Benef.Open;
         qryLkpBeneficario.Close;
         qryLkpBeneficario.Open;

         qryOrdem_Benef.AfterScroll := qryOrdem_BenefAfterScroll;

         imgBenefic.visible := Not qryLkpBeneficario.EOF;

         qryLkpTribunal.Close;
         qryLkpTribunal.Open;
         qryLkpUF.Close;
         qryLkpUF.Open;
         qryLkpAreaInterna.Close;
         qryLkpAreaInterna.Open;
         qryLkpComandoJudicial.Close;
         qryLkpComandoJudicial.Open;
         qryLkpBanco.Close;
         qryLkpBanco.Open;
         qryLkpAgencia.Close;
         qryLkpAgencia.Open;
         Screen.Cursor := crDefault;

         Status.caption := 'Consultando';
         sbtnInsDet.enabled := True;
         sbtnAltDet.enabled := True;
         sbtnExcluiDet.enabled := True;
      End;
End;

Procedure TfrmCadOrdemJudicial.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryOrdem.State In [dsEdit, dsInsert]) Or (qryOrdem_Benef.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryOrdem.Cancel;
               qryOrdem_Benef.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryOrdem_Benef.Close; ;
               qryOrdem.Close;
               qryLkpTribunal.Close;
               qryLkpUF.Close;
               qryLkpAreaInterna.Close;
               qryLkpComandoJudicial.Close;
               qryLkpBanco.Close;
               qryLkpAgencia.Close;
               qryLkpBeneficario.Close;
               qryAux.Close;
               CanClose := True;
            End
         Else
            CanClose := False;
      End
   Else
      Begin
         qryOrdem.Close;
         qryOrdem_Benef.Close; ;
         qryLkpTribunal.Close;
         qryLkpUF.Close;
         qryLkpAreaInterna.Close;
         qryLkpComandoJudicial.Close;
         qryLkpBanco.Close;
         qryLkpAgencia.Close;
         qryLkpBeneficario.Close;
         qryAux.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadOrdemJudicial.bbtnSairClick(Sender: TObject);
Begin
   Close;
End;

Procedure TfrmCadOrdemJudicial.sbtnInsDetClick(Sender: TObject);
Begin
   If Not qryOrdem.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosBenefic.enabled := True;
            dbGrdBenefic.enabled := False;

            sbtnAltDet.enabled := False;
            sbtnExcluiDet.enabled := False;
            bbtnOkDet.enabled := True;
            bbtnCancelarDet.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryOrdem_Benef.Close;
            qryOrdem_Benef.Open;
            qryOrdem_Benef.insert;
            qryOrdem_Benef.fieldbyname('TipoQualificacao').asInteger := 0;
            qryOrdem_Benef.fieldbyname('TipoRepresentante').asInteger := 0;

            dbNomeRepresent.Enabled := False;
            dbCPFRepresent.Enabled := False;

            dbcBeneficiario.setfocus;
         Except
            bbtnCancelarDetClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Ordem Judicial selecionada para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnInsDet.down := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.bbtnOkDetClick(Sender: TObject);
Var CampoErro: TStringList;
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryOrdem_Benef.State In [dsInsert, dsEdit] Then
               Begin
                  CampoErro := TStringList.Create;
                  If ChecaCampos(frmCadOrdemJudicial, CampoErro, 2) Then
                     Begin
                        If (dblkBanco.Text <> '') And (dblkpAgencia.Text = '') Then
                           Begin
                              Application.MessageBox('Agência precisa ser informada. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                              dblkpAgencia.setfocus;
                              exit;
                           End;

                        If (dblkBanco.Text <> '') And (dblkpAgencia.Text <> '') And (dbedConta.Text = '') Then
                           Begin
                              Application.MessageBox('Conta Corrente precisa ser informada. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                              dbedConta.setfocus;
                              exit;
                           End;

                        Screen.Cursor := crSQLWait;
                        If qryOrdem_Benef.State = dsInsert Then
                           Begin
                              qryAux.SQL.Clear;
                              qryAux.SQL.add('SELECT SEQORDJUDBENEFICIARIO.NEXTVAL SEQORDJUDBEN FROM DUAL');
                              qryAux.Open;

                              qryOrdem_Benef.fieldByname('IDORDEMJUDICIAL').asInteger := qryOrdem.fieldByname('IDORDEMJUDICIAL').asInteger;
                              qryOrdem_Benef.fieldByname('IDORDJUDBENEFICIARIO').asInteger := qryAux.fieldByname('SEQORDJUDBEN').asInteger;
                              qryOrdem_Benef.fieldByname('IDPARTEATIVA').asInteger := qryOrdem.fieldByname('IDPARTEATIVA').asInteger;
                           End;

                        qryOrdem_Benef.post;
                        dtmBaseDados.dbBaseDados.Commit;
                        qryOrdem_Benef.Close;
                        qryOrdem_Benef.Open;
                        Screen.Cursor := crDefault;

                        pnlDadosBenefic.enabled := False;
                        dbGrdBenefic.enabled := True;

                        sbtnInsDet.enabled := True;
                        sbtnAltDet.enabled := True;
                        sbtnExcluiDet.enabled := True;
                        bbtnOkDet.enabled := False;
                        bbtnCancelarDet.enabled := False;
                        sbtnInsDet.down := False;
                        sbtnAltDet.down := False;

                        If status.caption <> 'Inserindo' Then
                           Begin
                              sbtnInserir.enabled := True;
                              sbtnApagar.enabled := True;
                              sbtnAlterar.enabled := True;
                              sbtnProcurar.enabled := True;
                           End;
                     End
                  Else
                     Application.MessageBox(pchar(CampoErro.Text), 'Atenção ! Estes campos devem ser informados...', mb_ICONEXCLAMATION + mb_OK);

                  CampoErro.Free;
               End;
         End;
   Except
      bbtnCancelarDetClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadOrdemJudicial.bbtnCancelarDetClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryOrdem_Benef.state In [dsEdit, dsInsert] Then
            qryOrdem_Benef.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryOrdem_Benef.Close;
         qryOrdem_Benef.Open;

      End;

   pnlDadosBenefic.enabled := False;
   dbGrdBenefic.enabled := True;

   sbtnInsDet.enabled := True;
   sbtnAltDet.enabled := True;
   sbtnExcluiDet.enabled := True;
   bbtnOkDet.enabled := False;
   bbtnCancelarDet.enabled := False;
   sbtnInsDet.down := False;
   sbtnAltDet.down := False;

   If status.caption <> 'Inserindo' Then
      Begin
         sbtnInserir.enabled := True;
         sbtnApagar.enabled := True;
         sbtnAlterar.enabled := True;
         sbtnProcurar.enabled := True;
      End;
End;

Procedure TfrmCadOrdemJudicial.sbtnInserirClick(Sender: TObject);
Begin
   Try
      If qryOrdem.State <> dsInsert Then
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

            sbtnInsDet.enabled := True;
            sbtnAltDet.enabled := True;
            sbtnExcluiDet.enabled := True;

            pnlDadosPrincipal.enabled := True;
            pcOrdemJudicial.ActivePageIndex := 0;

            qryOrdem.Close;
            qryOrdem.Open;
            qryOrdem.insert;
            dbDtOrdem.setfocus;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadOrdemJudicial.sbtnAlterarClick(Sender: TObject);
Begin
   If Not qryOrdem.isEmpty Then
      Begin
         Try
            If qryOrdem.State <> dsEdit Then
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
                  pcOrdemJudicial.ActivePageIndex := 0;
                  qryOrdem.Edit;
                  dbDtOrdem.setfocus;
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

Procedure TfrmCadOrdemJudicial.bbtnCancelarClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryOrdem.state In [dsEdit, dsInsert] Then
            qryOrdem.Cancel;
         dtmBaseDados.dbBaseDados.RollBack;
      End;

   sbtnInsDet.enabled := True;
   sbtnAltDet.enabled := True;
   sbtnExcluiDet.enabled := True;

   If status.caption = 'Inserindo' Then
      Begin
         qryOrdem.Close;
         qryOrdem_Benef.Close;
         CMProcuraParteAtiva.Text := '';
         CMProcuraPartePassiva.Text := '';
         Status.caption := '';
         imgBenefic.visible := False;
         sbtnInsDet.enabled := False;
         sbtnAltDet.enabled := False;
         sbtnExcluiDet.enabled := False;
      End;

   If status.caption = 'Alterando' Then
      Begin
         Status.caption := 'Consultando';
         qryLkpBeneficario.Close;
         qryLkpBeneficario.Open;
      End;

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
   pcOrdemJudicial.ActivePageIndex := 0;
End;

Procedure TfrmCadOrdemJudicial.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryOrdem.isEmpty Then
      Begin
         Try
            pcOrdemJudicial.ActivePageIndex := 0;
            If MsgDlg('Confirma Exclusão dessa Ordem Judicial ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryOrdem.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  Status.caption := '';
                  imgBenefic.visible := False;
                  sbtnInsDet.enabled := False;
                  sbtnAltDet.enabled := False;
                  sbtnExcluiDet.enabled := False;
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

Procedure TfrmCadOrdemJudicial.bbtnConfirmarClick(Sender: TObject);
Var CampoErro: TStringList;
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryOrdem.State In [dsInsert, dsEdit] Then
               Begin
                  CampoErro := TStringList.Create;
                  If ChecaCampos(frmCadOrdemJudicial, CampoErro, 1) Then
                     Begin
                        Screen.Cursor := crSQLWait;
                        If qryOrdem.State = dsInsert Then
                           Begin
                              qryAux.SQL.Clear;
                              qryAux.SQL.add('SELECT SEQORDEMJUDICIAL.NEXTVAL SEQORDEM FROM DUAL');
                              qryAux.Open;

                              qryOrdem.fieldByname('IDORDEMJUDICIAL').asInteger := qryAux.fieldByname('SEQORDEM').asInteger;
                              qryOrdem.fieldByname('IDPAIS').asInteger := 1;
                              qryOrdem.fieldByname('IDEMPRESA').asInteger := 1;
                           End;

                        qryOrdem.post;
                        dtmBaseDados.dbBaseDados.Commit;
                        Screen.Cursor := crDefault;

                        pnlDadosPrincipal.enabled := False;
                        sbtnInserir.Down := False;
                        sbtnAlterar.Down := False;
                        sbtnApagar.Down := False;
                        sbtnProcurar.Down := False;
                        bbtnConfirmar.enabled := False;

                        If (Status.caption = 'Inserindo') Then
                           Begin
                              If imgBenefic.visible Then
                                 pcOrdemJudicial.ActivePageIndex := 1
                              Else
                                 bbtnCancelarClick(Self);
                           End;

                        If (Status.caption = 'Alterando') Then
                           bbtnCancelarClick(Self);

                     End
                  Else
                     Application.MessageBox(pchar(CampoErro.Text), 'Atenção ! Estes campos devem ser informados...', mb_ICONEXCLAMATION + mb_OK);

                  CampoErro.Free;
               End;
         End
   Except
      bbtnCancelarClick(Self);
      Raise;
   End;
End;

Procedure TfrmCadOrdemJudicial.pcOrdemJudicialChanging(Sender: TObject; Var AllowChange: Boolean);
Begin
   AllowChange := False;
   If (qryOrdem.state In [dsbrowse, dsinactive]) And (qryOrdem_Benef.state In [dsbrowse, dsinactive]) Then
      AllowChange := True;
End;

Procedure TfrmCadOrdemJudicial.qryOrdem_BenefCalcFields(DataSet: TDataSet);
Begin
   qryOrdem_Benef.fieldbyname('dscQualificacao').asString := dbrdgQualificacao.Items.Strings[qryOrdem_Benef.fieldbyname('TipoQualificacao').asInteger];
   qryOrdem_Benef.fieldbyname('dscTipoRepresentante').asString := dbrdgRepresentante.Items.Strings[qryOrdem_Benef.fieldbyname('TipoRepresentante').asInteger];
End;

Procedure TfrmCadOrdemJudicial.sbtnAltDetClick(Sender: TObject);
Begin
   If Not qryOrdem_Benef.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosBenefic.enabled := True;
            dbGrdBenefic.enabled := False;

            sbtnInsDet.enabled := False;
            sbtnExcluiDet.enabled := False;
            bbtnOkDet.enabled := True;
            bbtnCancelarDet.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;

            qryOrdem_Benef.Edit;
            dbcBeneficiario.setfocus;
         Except
            bbtnCancelarDetClick(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Lançamento para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         sbtnAltDet.down := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.sbtnExcluiDetClick(Sender: TObject);
Begin
   If Not qryOrdem_Benef.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão deste Beneficiário ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryOrdem_Benef.Delete;
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
         sbtnExcluiDet.Down := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.dbrdgRepresentanteClick(Sender: TObject);
Begin
   If dbrdgRepresentante.ItemIndex > 0 Then
      Begin
         dbNomeRepresent.Enabled := True;
         dbCPFRepresent.Enabled := True;
         dbNomeRepresent.setfocus;
      End
   Else
      Begin
         qryOrdem_Benef.fieldbyname('NOMEREPRESENTANTE').Clear;
         qryOrdem_Benef.fieldbyname('CPFREPRESENTANTE').Clear;
         dbNomeRepresent.Enabled := False;
         dbCPFRepresent.Enabled := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.CMProcuraPartePassivaValidaDados(Sender: TObject);
Begin
   dblkpComandoJud.setfocus;
End;

Procedure TfrmCadOrdemJudicial.dbDtTerminoExit(Sender: TObject);
Begin
   If dbDtTermino.Date < dbDtInicio.date Then
      Begin
         Application.MessageBox('Data de Término tem que ser MAIOR ou IGUAL que a Data de Início. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         qryOrdem.fieldByname('DATATERMINOVIG').asDateTime := qryOrdem.fieldByname('DATAINICIOVIG').asDateTime;
         dbDtTermino.setfocus;
      End;
End;

Procedure TfrmCadOrdemJudicial.bbtnVoltarDetClick(Sender: TObject);
Begin
   If qryOrdem_Benef.state In [dsbrowse, dsinactive] Then
      pcOrdemJudicial.ActivePageIndex := 0
   Else
      Application.MessageBox('Operação tem que ser Confirmada ou Cancelada. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
End;

Procedure TfrmCadOrdemJudicial.dbDtOrdemExit(Sender: TObject);
Begin
   If dbDtOrdem.Date > date Then
      Begin
         Application.MessageBox('Data da Ordem não pode ser MAIOR que a Data de Hoje. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         dbDtOrdem.setfocus;
      End;
End;

Procedure TfrmCadOrdemJudicial.dbGrdBeneficCalcCellColors(Sender: TObject;
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
                  ABrush.Color := $00D9FFFF // amarelo bebê
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

Procedure TfrmCadOrdemJudicial.dbcBeneficiarioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   image1.visible := False;
   image4.visible := False;
   Label21.Visible := False;
   Label25.Visible := False;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT IDORDEMJUDICIAL, IDBENEFICIARIO ');
   qryAux.SQL.add('FROM ORDJUDBENEFICIARIO                ');
   qryAux.SQL.add('WHERE IDORDEMJUDICIAL = ' + quotedstr(qryOrdem.fieldbyname('IDORDEMJUDICIAL').asString));
   qryAux.SQL.add('      AND IDBENEFICIARIO = ' + quotedstr(qryOrdem_Benef.fieldbyname('IDBENEFICIARIO').asString));
   qryAux.Open;
   If Not qryAux.EOF Then
      Application.MessageBox('Beneficiário já lançado. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK)
   Else
      Begin
         If qryLkpBeneficarioFLGBENEFICIARIO.value = 1 Then
            Begin
               image1.visible := True; // OK
               Label21.Visible := True;
            End;
         If qryLkpBeneficarioFLGDEPLEGAL.value = 1 Then
            Begin
               image4.visible := True; // OK
               Label25.Visible := True;
            End;
      End;
End;

Procedure TfrmCadOrdemJudicial.CMProcuraParteAtivaValidaDados(Sender: TObject);
Begin
   If (MSParteAtiva.RetornouValor) Then
      Begin
         // Verificando se existe beneficiários lançados para a parte ativa atual
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.add('SELECT IDORDEMJUDICIAL ');
         qryAux.SQL.add('FROM ORDJUDBENEFICIARIO ');
         qryAux.SQL.add('WHERE IDORDEMJUDICIAL = ' + quotedstr(qryOrdem.fieldByname('IDORDEMJUDICIAL').asString));
         qryAux.Open;
         If Not qryAux.eof Then
            Begin
               // Então, checa se nova parte ativa é diferente da anterior
               If MSParteAtiva.ValoresChave[0] <> sParteAtivaAnterior Then
                  Begin
                     Application.MessageBox('É necessário excluir os Beneficiários da Parte Ativa anterior...Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                     sParteAtivaAnterior := '';
                     imgBenefic.visible := True;
                     bbtnCancelarClick(Self);
                  End;
            End
         Else
            Begin
               qryLkpBeneficario.Close;
               qryLkpBeneficario.ParamByName('IDPARTEATIVA').asString := qryOrdem.fieldByname('IDPARTEATIVA').asString;
               qryLkpBeneficario.Open;
               If qryLkpBeneficario.EOF Then
                  Application.MessageBox('Parte Ativa não possui Dependente cadastrado no Planus !', 'Aviso !', MB_ICONINFORMATION + mb_OK);

               imgBenefic.visible := Not qryLkpBeneficario.EOF;
               CMProcuraPartePassiva.setfocus;
            End;
      End;
End;

Procedure TfrmCadOrdemJudicial.dblkpUFExit(Sender: TObject);
Begin
   CMProcuraParteAtiva.setfocus;
End;

Procedure TfrmCadOrdemJudicial.qryOrdem_BenefAfterScroll(DataSet: TDataSet);
Begin
   image1.visible := False;
   image4.visible := False;
   Label21.Visible := False;
   Label25.Visible := False;
   If qryOrdem_BenefeBenefic.value = 1 Then
      Begin
         image1.visible := True; // OK
         Label21.Visible := True;
      End;
   If qryOrdem_BenefeDeplegal.value = 1 Then
      Begin
         image4.visible := True; // OK
         Label25.Visible := True;
      End;
End;

End.

//SELECT DISTINCT P.RAZAOSOCIAL, B.IDPESSOA
//FROM BENEFBFCIARIO B,
//     PESSOA P
//WHERE B.IDTITULAR =:IDPARTEATIVA
//      AND B.IDPESSOA <> B.IDTITULAR
//      AND B.IDPESSOA = P.IDPESSOA




