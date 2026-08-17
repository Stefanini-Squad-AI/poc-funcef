//******************************************************************************************
//Rotina..........: fCadOrdemJudicial
//N. Sol..........: 161990
//N. Kintana......: 1373664
//Data............: 05/08/2011
//Responsável.....: Otacilio
//Descrição.......: Inclusão dos campos CPF e Matricula na Procura e a Data de Receb. do Representante no Cadastro
// **************************************************************************************************
//Rotina..........: fCadOrdemJudicial
//N. Sol..........: 159790
//N. Kintana......: 1322722
//Data............: 15/07/2011
//Responsável.....: Paulo Nobre / Otacilio Aquino
//Descrição.......: Ajuste na rotina de correção monetária dos processos, para contemplar as regras 
//                  contábeis de atualização do passivo contingencial.
//******************************************************************************************
//Rotina..........: fCadOrdemJudicial
//N. Sol..........: 160033
//N. Kintana......: 1330963
//Data............: 21/06/2010
//Responsável.....: Paulo Nobre / Otacilio
//Descrição.......: Reestruturação do cadastro para inclusão do documento.
//******************************************************************************************
//Rotina..........: fCadOrdemJudicial
//N. Sol..........: 139478
//N. Kintana......: 873193
//Data............: 21/07/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Reestruturação do Cadastro das Ordens Judiciais - FUNCEF não é parte
//                  para permitir inclusão de várias Partes
//******************************************************************************************
//Rotina..........: fCadOrdemJudicial
//N. Sol..........: 127752
//N. Kintana......: 682778
//Data............: 02/05/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Desenvolvimento do Cadastro das Ordens Judiciais - FUNCEF não é parte
//******************************************************************************************
Unit fCadOrdemJudicial;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, wwdbdatetimepicker,
   CMDateTimePicker, Mask, DBCtrls, TB97Ctls, TB97, Grids,
   Wwdbgrid, ComCtrls, ImgList, wwdblook, CMDBLookupCombo,
   ExtCtrls, wwdbedit, MontaSelect, Db, Wwdatsrc,
   DBTables, Wwquery, DBaseDados, Wwdbigrd, Wwdbdlg, jpeg, CMProcura;

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
      dsOrdem: TwwDataSource;
      qryOrdem_Benef: TwwQuery;
      dsOrdem_Benef: TwwDataSource;
      qryAux: TQuery;
      qryLkpTribunal: TwwQuery;
      qryLkpUF: TwwQuery;
      qryLkpUFCODESTADO: TStringField;
      qryLkpTribunalIDVARAJUSTICA: TFloatField;
      qryLkpTribunalDESCRICAO: TStringField;
      qryLkpAreaInterna: TwwQuery;
      qryLkpAreaInternaNOME: TStringField;
      MSOrdemJudicial: TMontaSelect;
      MSParte: TMontaSelect;
      qryLkpComandoJudicial: TwwQuery;
      qryLkpComandoJudicialCODTIPOOBJETO: TFloatField;
      qryLkpComandoJudicialDESCRICAO: TStringField;
      qryLkpBanco: TwwQuery;
      qryLkpBancoIDPESSOA: TFloatField;
      qryLkpBancoRAZAOSOCIAL: TStringField;
      qryLkpBeneficDisp: TwwQuery;
      qryLkpAgencia: TwwQuery;
      //Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
      qryOrdem_BenefnomeBeneficiario: TStringField;
      qryOrdem_BenefdscTipoRepresentante: TStringField;
      qryLkpAgenciaNUMAGENCIA: TStringField;
      qryOrdem_BenefdscQualificacao: TStringField;
      dsLkpBanco: TwwDataSource;
      qryLkpAgenciaIDBANCO: TFloatField;
      qryLkpAreaInternaCODCENTROCUSTO: TStringField;
      qryOrdem: TwwQuery;
      qryOrdemIDORDEMJUDICIAL: TFloatField;
      qryOrdemDATAORDEM: TDateTimeField;
      qryOrdemNUMOFICJUDICIAL: TStringField;
      qryOrdemNUMPROCESSO: TStringField;
      qryOrdemIDVARAJUSTICA: TFloatField;
      qryOrdemNUMVARA: TStringField;
      qryOrdemCODESTADO: TStringField;
      qryOrdemIDPAIS: TFloatField;
      qryOrdemIDCOMANDOJUDICIAL: TFloatField;
      qryOrdemDATAINICIOVIG: TDateTimeField;
      qryOrdemDATATERMINOVIG: TDateTimeField;
      qryOrdemIDEMPRESA: TFloatField;
      qryOrdemCODCENTROCUSTO: TStringField;
      qryOrdemNUMGEDOC: TStringField;
      qryOrdemDATAENCAMINHA: TDateTimeField;
      qryOrdemDATAEXPEDICAO: TDateTimeField;
      qryOrdemDATACUMPRIMENTO: TDateTimeField;
      Status: TStaticText;
      qryLkpBeneficDispNOME: TStringField;
      qryLkpBeneficDispFLGBENEFICIARIO: TFloatField;
      qryLkpBeneficDispFLGDEPLEGAL: TFloatField;
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
      Label22: TLabel;
      dbDtInicio: TCMDateTimePicker;
      dbDtTermino: TCMDateTimePicker;
      dbDtEncaminha: TCMDateTimePicker;
      dbDtExped: TCMDateTimePicker;
      dbDtCumprimento: TCMDateTimePicker;
      dblkpUF: TwwDBLookupCombo;
      dblkpTribunal: TwwDBLookupCombo;
      dblkpAreaInt: TwwDBLookupCombo;
      dblkpComandoJud: TwwDBLookupCombo;
      DbNumOficio: TwwDBEdit;
      dbMotivo: TwwDBEdit;
      dbNumProc: TwwDBEdit;
      dbVara: TwwDBEdit;
      dbObs: TwwDBEdit;
      dbNumGEDOC: TwwDBEdit;
      dbDtOrdem: TCMDateTimePicker;
      pnlPartes: TPanel;
      Dock974: TDock97;
      Label23: TLabel;
      Toolbar974: TToolbar97;
      btnInc1: TToolbarButton97;
      btnAlt1: TToolbarButton97;
      btnExc1: TToolbarButton97;
      Toolbar975: TToolbar97;
      btnCon1: TToolbarButton97;
      btnCan1: TToolbarButton97;
      dbgPartes: TwwDBGrid;
      wwIButton1: TwwIButton;
      pnlDadosPartes: TPanel;
      Label24: TLabel;
      CMParte: TCMProcura;
      dbgTipoParte: TDBRadioGroup;
      pnlBeneficiarios: TPanel;
      Dock975: TDock97;
      Toolbar973: TToolbar97;
      btnInc2: TToolbarButton97;
      btnAlt2: TToolbarButton97;
      btnExc2: TToolbarButton97;
      Toolbar972: TToolbar97;
      btnCon2: TToolbarButton97;
      btnCan2: TToolbarButton97;
      dbgBenefic: TwwDBGrid;
      wwIButton2: TwwIButton;
      pnlDadosBeneficiarios: TPanel;
      Label33: TLabel;
      Label6: TLabel;
      Label28: TLabel;
      Label30: TLabel;
      Label31: TLabel;
      Label32: TLabel;
      dbcBeneficiario: TwwDBLookupCombo;
      dbrdgQualificacao: TDBRadioGroup;
      dbrdgRepresentante: TDBRadioGroup;
      dblkBanco: TwwDBLookupCombo;
      dblkpAgencia: TwwDBLookupCombo;
      dbedConta: TwwDBEdit;
      dbNomeRepresent: TwwDBEdit;
      dbCPFRepresent: TwwDBEdit;
      qryOrdemOBSERVACAO: TStringField;
      qryOrdemMOTIVONAOCUMPCOMJUD: TStringField;
      qryOrdem_Partes: TwwQuery;
      dsOrdem_Partes: TwwDataSource;
      qryOrdem_PartesIDORDEMJUDICIAL: TFloatField;
      qryOrdem_PartesIDPARTE: TFloatField;
      qryOrdem_PartesTIPOPARTE: TFloatField;
      qryLkpParte: TQuery;
      qryLkpParteRAZAOSOCIAL: TStringField;
      qryLkpParteIDPESSOA: TFloatField;
      qryLkpParteNOME: TStringField;
      qryOrdem_PartesdscTipo: TStringField;
      //Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
      qryOrdem_PartesnomeParte: TStringField;
      qryLkpBeneficDispIDTITULAR: TFloatField;
      qryLkpBeneficDispIDPESSOA: TFloatField;
      Label1: TLabel;
      qryLkpBenefic: TwwQuery;
      qryLkpBeneficIDPESSOA: TFloatField;
      qryLkpBeneficNOME: TStringField;
      qryLkpBeneficRAZAOSOCIAL: TStringField;
      lblSetaDir: TImage;
      //Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
      qryOrdem_BenefIDORDEMJUDICIAL: TFloatField;
      qryOrdem_BenefIDORDJUDBENEFICIARIO: TFloatField;
      qryOrdem_BenefIDPARTEATIVA: TFloatField;
      qryOrdem_BenefIDBENEFICIARIO: TFloatField;
      qryOrdem_BenefIDDEPENDENCIA: TStringField;
      qryOrdem_BenefIDBANCO: TFloatField;
      qryOrdem_BenefNUMAGENCIA: TStringField;
      qryOrdem_BenefNUMCONTACORRENTE: TStringField;
      qryOrdem_BenefTIPOREPRESENTANTE: TFloatField;
      qryOrdem_BenefTIPOQUALIFICACAO: TFloatField;
      qryOrdem_BenefNOMEREPRESENTANTE: TStringField;
      qryOrdem_BenefCPFREPRESENTANTE: TStringField;
      Label2: TLabel;
      dtRecebRepres: TCMDateTimePicker;
      qryOrdemDATARECEBREPRES: TDateTimeField;
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
      Procedure qryOrdem_BenefCalcFields(DataSet: TDataSet);
      Procedure dbDtTerminoExit(Sender: TObject);
      Procedure dbDtOrdemExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure btnInc2Click(Sender: TObject);
      Procedure btnAlt2Click(Sender: TObject);
      Procedure btnExc2Click(Sender: TObject);
      Procedure btnCon2Click(Sender: TObject);
      Procedure btnCan2Click(Sender: TObject);
      Procedure CMParteValidaDados(Sender: TObject);
      Procedure dbrdgRepresentanteClick(Sender: TObject);
      Procedure btnInc1Click(Sender: TObject);
      Procedure btnAlt1Click(Sender: TObject);
      Procedure btnExc1Click(Sender: TObject);
      Procedure btnCon1Click(Sender: TObject);
      Procedure btnCan1Click(Sender: TObject);
      Procedure dbcBeneficiarioCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure qryOrdem_PartesCalcFields(DataSet: TDataSet);
      Procedure dbgPartesDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure qryOrdem_PartesAfterScroll(DataSet: TDataSet);
      Procedure dbgTipoParteClick(Sender: TObject);
   Private
      //Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
      { Private declarations }
   Public
      { Public declarations }
   End;
Var
   frmCadOrdemJudicial: TfrmCadOrdemJudicial;
   sIDParteAtivaAnterior, sNomeParteAtivaAnterior: String;

Implementation

Uses UMensErro;

{$R *.DFM}

Procedure TfrmCadOrdemJudicial.FormShow(Sender: TObject);
Begin
   If frmCadOrdemJudicial.WindowState = wsNormal Then
      Begin
         frmCadOrdemJudicial.Top := (Screen.Height - Height) Div 2;
         frmCadOrdemJudicial.Left := (Screen.Width - Width) Div 2;
      End;

   Screen.Cursor := crSQLWait;
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
End;

Procedure TfrmCadOrdemJudicial.FormCreate(Sender: TObject);
Begin
   pnlDadosPrincipal.enabled := False;
   pnlPartes.enabled := False;
   pnlBeneficiarios.enabled := False;

   pnlDadosPartes.enabled := False;
   pnlDadosBeneficiarios.enabled := False;

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

   lblSetaDir.Visible := False;
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

         qryOrdem_Partes.Close;
         qryOrdem_Partes.Open;
         qryLkpParte.Close;
         qryLkpParte.Open;
         qryLkpBeneficDisp.Close;
         qryLkpBeneficDisp.Open;

         qryOrdem_Benef.Close;
         qryOrdem_Benef.Open;
         qryLkpBenefic.Close;
         qryLkpBenefic.Open;

         qryOrdem_PartesAfterScroll(qryOrdem_Partes);
         Screen.Cursor := crDefault;

         Status.caption := 'Consultando';

         pnlPartes.enabled := True;

         btnInc1.enabled := True;
         btnAlt1.enabled := True;
         btnExc1.enabled := True;
      End;
End;

Procedure TfrmCadOrdemJudicial.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
   If (qryOrdem.State In [dsEdit, dsInsert]) Or
      (qryOrdem_Benef.State In [dsEdit, dsInsert]) Or
      (qryOrdem_Partes.State In [dsEdit, dsInsert]) Then
      Begin
         If MsgDlg('O Lançamento não foi salvo ! Abandona ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               qryOrdem.Cancel;
               qryOrdem_Benef.Cancel;

               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

               qryOrdem_Benef.Close; ;
               qryOrdem_Partes.Close;
               qryLkpTribunal.Close;
               qryLkpUF.Close;
               qryLkpAreaInterna.Close;
               qryLkpComandoJudicial.Close;
               qryLkpBanco.Close;
               qryLkpAgencia.Close;
               qryLkpBeneficDisp.Close;
               qryLkpBenefic.Close;
               qryLkpParte.Close;
               qryAux.Close;
               qryOrdem.Close;
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
         qryOrdem_Partes.Close;
         qryLkpUF.Close;
         qryLkpAreaInterna.Close;
         qryLkpComandoJudicial.Close;
         qryLkpBanco.Close;
         qryLkpAgencia.Close;
         qryLkpBeneficDisp.Close;
         qryLkpBenefic.Close;
         qryLkpParte.Close;
         qryAux.Close;
         CanClose := True;
      End;
End;

Procedure TfrmCadOrdemJudicial.bbtnSairClick(Sender: TObject);
Begin
   Close;
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

            pnlDadosPrincipal.enabled := True;
            pnlPartes.enabled := False;
            pnlBeneficiarios.enabled := False;

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
                  qryOrdem.Edit;
                  pnlPartes.enabled := False;
                  pnlBeneficiarios.enabled := False;
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

   If status.caption = 'Inserindo' Then
      Begin
         qryOrdem.Close;
         qryOrdem_Benef.Close;
         qryOrdem_Partes.Close;

         Status.caption := '';
         CMParte.Text := '';
         lblSetaDir.Visible := False;
      End;

   If status.caption = 'Alterando' Then
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
   pnlPartes.enabled := True;
   pnlBeneficiarios.Enabled := True;
End;

Procedure TfrmCadOrdemJudicial.sbtnApagarClick(Sender: TObject);
Begin
   If Not qryOrdem.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão dessa Ordem Judicial ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryOrdem.Delete;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  Status.caption := '';
                  lblSetaDir.Visible := False;
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
//Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryOrdem.State In [dsInsert, dsEdit] Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If qryOrdem.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQORDEMJUDICIAL.NEXTVAL SEQORDEM FROM DUAL');
                        qryAux.Open;

                        qryOrdem.fieldByname('IDORDEMJUDICIAL').asInteger := qryAux.fieldByname('SEQORDEM').asInteger;
                        qryOrdem.fieldByname('IDPAIS').asInteger := 1;
                        qryOrdem.fieldByname('IDEMPRESA').asInteger := 1;
                     End;

                  qryOrdem.Post;
                  dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  pnlDadosPrincipal.enabled := False;
                  pnlPartes.enabled := True;
                  pnlBeneficiarios.enabled := True;

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

Procedure TfrmCadOrdemJudicial.qryOrdem_BenefCalcFields(DataSet: TDataSet);
Begin
   qryLkpBenefic.Close;
   qryLkpBenefic.ParamByName('IDBENEFICIARIO').asfloat := qryOrdem_Benef.fieldbyname('IDBENEFICIARIO').asFloat;
   qryLkpBenefic.Open;
   qryOrdem_Benef.fieldbyname('nomeBeneficiario').asString := qryLkpBenefic.fieldbyname('Nome').asString;

   qryOrdem_Benef.fieldbyname('dscQualificacao').asString := dbrdgQualificacao.Items.Strings[qryOrdem_Benef.fieldbyname('TipoQualificacao').asInteger];
   qryOrdem_Benef.fieldbyname('dscTipoRepresentante').asString := dbrdgRepresentante.Items.Strings[qryOrdem_Benef.fieldbyname('TipoRepresentante').asInteger];
End;

Procedure TfrmCadOrdemJudicial.dbDtTerminoExit(Sender: TObject);
Begin
{   If dbDtTermino.Date < dbDtInicio.date Then
      Begin
         Application.MessageBox('Data de Término tem que ser MAIOR ou IGUAL que a Data de Início. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         qryOrdem.fieldByname('DATATERMINOVIG').asDateTime := qryOrdem.fieldByname('DATAINICIOVIG').asDateTime;
         dbDtTermino.setfocus;
      End;}
End;

Procedure TfrmCadOrdemJudicial.dbDtOrdemExit(Sender: TObject);
Begin
   If dbDtOrdem.Date > date Then
      Begin
         Application.MessageBox('Data da Ordem não pode ser MAIOR que a Data de Hoje. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         dbDtOrdem.setfocus;
      End;
End;

Procedure TfrmCadOrdemJudicial.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   frmCadOrdemJudicial := Nil;
End;

// *********************** BENEFIC **************************************************

Procedure TfrmCadOrdemJudicial.btnInc2Click(Sender: TObject);
Begin
   If Not qryOrdem_Partes.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlPartes.enabled := False;
            pnlBeneficiarios.enabled := True;
            dbgBenefic.enabled := False;
            pnlDadosBeneficiarios.enabled := True;

            btnAlt2.enabled := False;
            btnExc2.enabled := False;
            btnCon2.Enabled := True;
            btnCan2.Enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnCancelar.enabled := False;

            dbNomeRepresent.Enabled := False;
            dbCPFRepresent.Enabled := False;

            qryOrdem_Benef.Open;
            qryOrdem_Benef.insert;
            qryOrdem_Benef.fieldbyname('TipoQualificacao').asInteger := 0; // Sem definição
            qryOrdem_Benef.fieldbyname('TipoRepresentante').asInteger := 0; // O Próprio
            dbcBeneficiario.setfocus;
         Except
            btnCan2Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Parte Ativa selecionada para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc2.down := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.btnAlt2Click(Sender: TObject);
Begin
   If Not qryOrdem_Benef.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlPartes.enabled := False;
            pnlBeneficiarios.enabled := True;
            dbgBenefic.enabled := False;
            pnlDadosBeneficiarios.enabled := True;

            btnInc2.enabled := False;
            btnExc2.enabled := False;
            btnCon2.enabled := True;
            btnCan2.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnCancelar.enabled := False;

            qryOrdem_Benef.Edit;
            dbcBeneficiario.setfocus;
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

Procedure TfrmCadOrdemJudicial.btnExc2Click(Sender: TObject);
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

                  qryOrdem_PartesAfterScroll(qryOrdem_Partes);
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

Procedure TfrmCadOrdemJudicial.btnCon2Click(Sender: TObject);
//Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryOrdem_Benef.State In [dsInsert, dsEdit] Then
               Begin
                  If (dblkBanco.Text <> '') And (dblkpAgencia.Text = '') Then
                     Begin
                        Application.MessageBox('Agência precisa ser informada. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                        dblkpAgencia.setfocus;
                        btnCon2.down := False;
                        exit;
                     End;

                  If (dblkBanco.Text <> '') And (dblkpAgencia.Text <> '') And (dbedConta.Text = '') Then
                     Begin
                        Application.MessageBox('Conta Corrente precisa ser informada. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                        dbedConta.setfocus;
                        btnCon2.down := False;
                        exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryOrdem_Benef.State = dsInsert Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.Clear;
                        qryAux.SQL.add('SELECT SEQORDJUDBENEFICIARIO.NEXTVAL SEQBENEF FROM DUAL');
                        qryAux.Open;

                        qryOrdem_Benef.fieldByname('IDORDEMJUDICIAL').asInteger := qryOrdem_Partes.fieldByname('IDORDEMJUDICIAL').asInteger;
                        qryOrdem_Benef.fieldByname('IDORDJUDBENEFICIARIO').asInteger := qryAux.fieldByname('SEQBENEF').asInteger;
                        qryOrdem_Benef.fieldByname('IDPARTEATIVA').asInteger := qryOrdem_Partes.fieldByname('IDPARTE').asInteger;
                     End;

                  qryOrdem_Benef.Post;
                  dtmBaseDados.dbBaseDados.Commit;
                  qryOrdem_Benef.Close;
                  qryOrdem_Benef.Open;
                  Screen.Cursor := crDefault;

                  pnlPartes.enabled := True;
                  pnlBeneficiarios.enabled := True;
                  dbgBenefic.enabled := True;
                  pnlDadosBeneficiarios.enabled := False;

                  btnInc2.enabled := True;
                  btnAlt2.enabled := True;
                  btnExc2.enabled := True;
                  btnCon2.enabled := False;
                  btnCan2.enabled := False;
                  btnInc2.down := False;
                  btnAlt2.down := False;

                  If status.caption <> 'Inserindo' Then
                     Begin
                        sbtnInserir.enabled := True;
                        sbtnApagar.enabled := True;
                        sbtnAlterar.enabled := True;
                        sbtnProcurar.enabled := True;
                     End;

                  If status.caption = 'Inserindo' Then
                     bbtnCancelar.enabled := True;

                  qryOrdem_PartesAfterScroll(qryOrdem_Partes);

                  btnCon2.down := False;
               End;
         End;
   Except
      btnCan2Click(Self);
      Raise;
   End;
End;

Procedure TfrmCadOrdemJudicial.btnCan2Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryOrdem_Benef.state In [dsEdit, dsInsert] Then
            qryOrdem_Benef.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryOrdem_Benef.Close;
         qryOrdem_Benef.Open;
      End;

   pnlPartes.enabled := True;
   pnlBeneficiarios.enabled := True;
   dbgBenefic.enabled := True;
   pnlDadosBeneficiarios.enabled := False;

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

   If status.caption = 'Inserindo' Then
      bbtnCancelar.enabled := True;
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

Procedure TfrmCadOrdemJudicial.dbcBeneficiarioCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT IDBENEFICIARIO    ');
   qryAux.SQL.add('FROM ORDJUDBENEFICIARIO  ');
   qryAux.SQL.add('WHERE IDORDEMJUDICIAL = ' + quotedstr(qryOrdem_Partes.fieldbyname('IDORDEMJUDICIAL').asString));
   qryAux.SQL.add('      AND IDPARTEATIVA = ' + quotedstr(qryOrdem_Partes.fieldbyname('IDPARTE').asString));
   qryAux.SQL.add('      AND IDBENEFICIARIO = ' + quotedstr(qryOrdem_Benef.fieldbyname('IDBENEFICIARIO').asString));
   qryAux.Open;
   If Not qryAux.EOF Then
      Application.MessageBox('Beneficiário já lançado. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
End;

// *********************** FIM BENEFIC ********************************************************

// *********************** PARTES **************************************************

Procedure TfrmCadOrdemJudicial.CMParteValidaDados(Sender: TObject);
Begin
   If qryOrdem_Partes.fieldbyname('TIPOPARTE').asInteger = 0 Then // Somente para Parte Ativa
      Begin
         If (MSParte.RetornouValor) Then
            Begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.add('SELECT IDPARTE    ');
               qryAux.SQL.add('FROM ORDJUDPARTES ');
               qryAux.SQL.add('WHERE IDORDEMJUDICIAL = ' + quotedstr(qryOrdem.fieldByname('IDORDEMJUDICIAL').asString));
               qryAux.SQL.add('      AND IDPARTE = ' + quotedstr(qryOrdem_Partes.fieldbyname('IDPARTE').asString));
               qryAux.Open;
               If Not qryAux.EOF Then
                  Begin
                     Application.MessageBox('Parte já lançada. Verifique...', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
                     btnCan1Click(Self);
                  End;

               // Verificando se existe beneficiários lançados para a parte ativa atual
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.add('SELECT IDORDEMJUDICIAL ');
               qryAux.SQL.add('FROM ORDJUDBENEFICIARIO ');
               qryAux.SQL.add('WHERE IDORDEMJUDICIAL = ' + quotedstr(qryOrdem.fieldByname('IDORDEMJUDICIAL').asString));
               qryAux.SQL.add('      AND IDPARTEATIVA = ' + quotedstr(sIDParteAtivaAnterior));
               qryAux.Open;
               If Not qryAux.eof Then
                  Begin
                     // Então, checa se nova parte ativa é diferente da anterior
                     If (qryOrdem_Partes.fieldbyname('IDPARTE').asString <> sIDParteAtivaAnterior) And
                        (sIDParteAtivaAnterior <> '') Then
                        Begin
                           Application.MessageBox(pchar('Para esta alteração, primeiro, exclua' + #13 +
                              'os Beneficiários da Parte anterior: ' + #13 + #13 +
                              sNomeParteAtivaAnterior), 'Atenção !', mb_ICONEXCLAMATION + mb_OK); sIDParteAtivaAnterior := '';
                           btnCan1Click(Self);
                        End;
                  End
               Else
                  Begin
                     qryLkpBeneficDisp.Close;
                     qryLkpBeneficDisp.ParamByName('IDPARTE').asString := qryOrdem_Partes.fieldByname('IDPARTE').asString;
                     qryLkpBeneficDisp.Open;
                     If qryLkpBeneficDisp.EOF Then
                        Begin
                           Application.MessageBox('Parte Ativa não possui Dependente cadastrado no Planus !', 'Aviso !', MB_ICONINFORMATION + mb_OK);
                        End;
                  End;
            End;
      End;
End;

Procedure TfrmCadOrdemJudicial.btnInc1Click(Sender: TObject);
Begin
   If Not qryOrdem.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlPartes.enabled := True;
            dbgPartes.enabled := False;
            pnlDadosPartes.enabled := True;
            pnlBeneficiarios.enabled := False;

            btnAlt1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnCancelar.enabled := False;

            qryOrdem_Partes.Open;
            qryOrdem_Partes.insert;
            qryOrdem_Partes.fieldbyname('TIPOPARTE').asInteger := 0; // Ativa

            CMParte.setfocus;
         Except
            btnCan1Click(Self);
            Raise;
         End;
      End
   Else
      Begin
         Application.MessageBox('Sem Ordem Judicial selecionada para esta Operação. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnInc1.down := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.btnAlt1Click(Sender: TObject);
Begin
   If Not qryOrdem_Partes.isEmpty Then
      Begin
         Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            pnlDadosPrincipal.enabled := False;
            pnlPartes.enabled := True;
            dbgPartes.enabled := False;
            pnlDadosPartes.enabled := True;
            pnlBeneficiarios.enabled := False;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.enabled := True;
            btnCan1.enabled := True;

            sbtnInserir.enabled := False;
            sbtnApagar.enabled := False;
            sbtnAlterar.enabled := False;
            sbtnProcurar.enabled := False;
            bbtnCancelar.enabled := False;

            qryOrdem_Partes.Edit;
            sIDParteAtivaAnterior := qryOrdem_Partes.fieldbyname('IDPARTE').asString;
            sNomeParteAtivaAnterior := qryOrdem_Partes.fieldbyname('nomeParte').asString;
            CMParte.setfocus;
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

Procedure TfrmCadOrdemJudicial.btnExc1Click(Sender: TObject);
Begin
   If Not qryOrdem_Partes.isEmpty Then
      Begin
         Try
            If MsgDlg('Confirma Exclusão desta Parte ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
               Begin
                  Screen.Cursor := crSQLWait;
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  qryOrdem_Partes.Delete;
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

Procedure TfrmCadOrdemJudicial.btnCon1Click(Sender: TObject);
//Paulo Nobre / Otacilio - SOL 160033 - KTN 1330963
Begin
   Try
      If dtmBaseDados.dbBaseDados.InTransaction Then
         Begin
            If qryOrdem_Partes.State In [dsInsert, dsEdit] Then
               Begin
                  If qryOrdem_Partes.fieldByname('IDPARTE').isnull Then
                     Begin
                        Application.MessageBox('Parte não foi localizada !', 'Atenção !', Mb_IconExclamation);
                        CMParte.setfocus;
                        btnCon1.down := False;
                        Exit;
                     End;

                  Screen.Cursor := crSQLWait;
                  If qryOrdem_Partes.State = dsInsert Then
                     qryOrdem_Partes.fieldByname('IDORDEMJUDICIAL').asInteger := qryOrdem.fieldByname('IDORDEMJUDICIAL').asInteger;

                  qryOrdem_Partes.post;
                  dtmBaseDados.dbBaseDados.Commit;
                  qryOrdem_Partes.Close;
                  qryOrdem_Partes.Open;
                  qryLkpParte.Close;
                  qryLkpParte.Open;
                  qryLkpBeneficDisp.Close;
                  qryLkpBeneficDisp.Open;
                  qryOrdem_PartesAfterScroll(qryOrdem_Partes);
                  Screen.Cursor := crDefault;

                  pnlPartes.enabled := True;
                  dbgPartes.enabled := True;
                  pnlDadosPartes.enabled := False;
                  pnlBeneficiarios.enabled := True;

                  btnInc1.enabled := True;
                  btnAlt1.enabled := True;
                  btnExc1.enabled := True;
                  btnCon1.enabled := False;
                  btnCan1.enabled := False;
                  btnInc1.down := False;
                  btnAlt1.down := False;

                  If status.caption <> 'Inserindo' Then
                     Begin
                        sbtnInserir.enabled := True;
                        sbtnApagar.enabled := True;
                        sbtnAlterar.enabled := True;
                        sbtnProcurar.enabled := True;
                     End;

                  If status.caption = 'Inserindo' Then
                     bbtnCancelar.enabled := True;

                  btnCon1.down := False;
               End;
         End;
   Except
      btnCan1Click(Self);
      Raise;
   End;
End;

Procedure TfrmCadOrdemJudicial.btnCan1Click(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
         If qryOrdem_Partes.state In [dsEdit, dsInsert] Then
            qryOrdem_Partes.Cancel;

         dtmBaseDados.dbBaseDados.RollBack;

         qryOrdem_Partes.Close;
         qryOrdem_Partes.Open;
      End;

   pnlPartes.enabled := True;
   dbgPartes.enabled := True;
   pnlDadosPartes.enabled := False;
   pnlBeneficiarios.enabled := True;

   btnInc1.enabled := True;
   btnAlt1.enabled := True;
   btnExc1.enabled := True;
   btnCon1.enabled := False;
   btnCan1.enabled := False;
   btnInc1.down := False;
   btnAlt1.down := False;
   btnCon1.down := False;

   CMParte.Text := '';

   If status.caption <> 'Inserindo' Then
      Begin
         sbtnInserir.enabled := True;
         sbtnApagar.enabled := True;
         sbtnAlterar.enabled := True;
         sbtnProcurar.enabled := True;
      End;

   If status.caption = 'Inserindo' Then
      bbtnCancelar.enabled := True;
End;

Procedure TfrmCadOrdemJudicial.qryOrdem_PartesCalcFields(DataSet: TDataSet);
Begin
   qryLkpParte.Close;
   qryLkpParte.ParamByName('IDPARTE').asfloat := qryOrdem_Partes.fieldbyname('IDPARTE').asFloat;
   qryLkpParte.Open;
   qryOrdem_Partes.fieldbyname('nomeParte').asString := qryLkpParte.fieldbyname('Nome').asString;

   If qryOrdem_Partes.fieldbyname('TIPOPARTE').asInteger = 0 Then // Ativa
      qryOrdem_Partes.fieldbyname('dscTipo').asString := 'Ativa'
   Else
      qryOrdem_Partes.fieldbyname('dscTipo').asString := 'Passiva';
End;

Procedure TfrmCadOrdemJudicial.dbgPartesDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not qryOrdem_Partes.isEmpty Then
      Begin
         If qryOrdem_Partes.fieldbyname('TIPOPARTE').asInteger = 0 Then // Ativa
            Begin
               dbgPartes.Canvas.Font.Color := clBlue;
               dbgPartes.Canvas.Font.Style := [fsbold];
            End
         Else
            dbgPartes.Canvas.Font.Color := clWindowText;

         dbgPartes.DefaultDrawDataCell(Rect, Field, State);
      End;
End;

Procedure TfrmCadOrdemJudicial.qryOrdem_PartesAfterScroll(DataSet: TDataSet);
Begin
   qryLkpBeneficDisp.Close;
   qryLkpBeneficDisp.ParamByName('IDPARTE').asString := qryOrdem_Partes.fieldByname('IDPARTE').asString;
   qryLkpBeneficDisp.Open;

   If (Not qryOrdem_Partes.fieldbyname('IDORDEMJUDICIAL').IsNull) And
      (qryOrdem_Partes.fieldbyname('TIPOPARTE').asInteger = 0) And // Ativa
   (Not qryLkpBeneficDisp.IsEmpty) Then // Tem beneficiario
      Begin
         pnlBeneficiarios.Enabled := True;
         btnInc2.enabled := True;
         btnAlt2.enabled := True;
         btnExc2.enabled := True;
         btnCon2.enabled := False;
         btnCan2.enabled := False;
         lblSetaDir.Visible := True;
      End
   Else // Passiva
      Begin
         pnlBeneficiarios.Enabled := False;
         btnInc2.enabled := False;
         btnAlt2.enabled := False;
         btnExc2.enabled := False;
         btnCon2.enabled := False;
         btnCan2.enabled := False;
         lblSetaDir.Visible := False;
      End;
End;

Procedure TfrmCadOrdemJudicial.dbgTipoParteClick(Sender: TObject);
Begin
   If (dbgTipoParte.ItemIndex = 0) Then
      Begin
         qryLkpBeneficDisp.Close;
         qryLkpBeneficDisp.ParamByName('IDPARTE').asString := qryOrdem_Partes.fieldByname('IDPARTE').asString;
         qryLkpBeneficDisp.Open;
         If qryLkpBeneficDisp.EOF Then
            Application.MessageBox('Parte Ativa não possui Dependente cadastrado no Planus !', 'Aviso !', MB_ICONINFORMATION + mb_OK);
      End
   Else If (dbgTipoParte.ItemIndex = 1) And (Not qryOrdem_Benef.isEmpty) Then
      Begin
         Application.MessageBox(pchar('Para esta alteração, primeiro, exclua' + #13 +
            'os Beneficiários da Parte anterior: ' + #13 + #13 +
            sNomeParteAtivaAnterior), 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
         btnCan1Click(Self);
      End;
End;

// *********************** FIM PARTES ********************************************************

End.

