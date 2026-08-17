// ***********************************************************************************************
//Rotina..........: fCadContJurid
//N. Sol..........: 49750
//N. Kintana......: 523171
//Data............: 18/11/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Incluido os campos Programa e Sub-Programa
//************************************************************************************************
Unit fCadTipObjeto;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, cmseldlg, wwidlg,
   Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
   Wwdbgrid, ExtCtrls, Mask, DBTables, TB97, IvDictio, IvMulti, IvEMulti, TB97Ctls, TB97Tlbr,
   wwdblook, CmEventosCadastro, wwDialog, ImgList, FCadastroMT, MontaSelect, DBClient,
   uCMClientDataSet, uCtrlTipObjeto, Wwquery, uCtrlListTerceirosRH,
   wwdbdatetimepicker, CMDateTimePicker, uCtrlGlobalRH;

Type
   TfrmCadTipObjeto = Class(TFrmCadastroMT)
      Label2: TLabel;
      dbedDescr: TDBEdit;
      Label3: TLabel;
      dblcGrpObjeto: TwwDBLookupCombo;
      dbrgRubrica: TDBRadioGroup;
      gbxRubrica: TGroupBox;
      dblcRubrica: TwwDBLookupCombo;
      CdsRubrica: TCMClientDataSet;
      CdsGrpObjeto: TCMClientDataSet;
      gbxPrograma: TGroupBox;
      Label4: TLabel;
      dblckTipProc: TwwDBLookupCombo;
      wwDBLookupCombo1: TwwDBLookupCombo;
      gbxSubPrograma: TGroupBox;
      Label5: TLabel;
      wwDBLookupCombo3: TwwDBLookupCombo;
      dblckTipoOperacao: TwwDBLookupCombo;
      qryLkpPrograma: TwwQuery;
      qryLkpProgramaIDTIPOPROC: TFloatField;
      qryLkpProgramaNOMETIPOPROC: TStringField;
      qryLkpProgramaPROCFIXO: TFloatField;
      qryLkpProgramaTRGDTINCLUSAO: TDateTimeField;
      qryLkpProgramaTRGUSERINCLUSAO: TStringField;
      qryLkpProgramaFLGEXIGECCUSTO: TFloatField;
      qryLkpSub_Programa: TwwQuery;
      qryLkpSub_ProgramaTIPCODIGO: TStringField;
      qryLkpSub_ProgramaTIPDESCRICAO: TStringField;
      qryAux: TQuery;
      Label1: TLabel;
      dbeDtVigencia: TCMDateTimePicker;
      CdsParamRH: TCMClientDataSet;
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure dbrgRubricaChange(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure dblcRubricaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      Procedure CmeCadastroAfterConfirma(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblckTipProcCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure sbtnInserirClick(Sender: TObject);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
   Private
      CtrlTipObjeto: TCtrlTipObjeto;
      CtrlGlobalRH: TCtrlGlobalRH;
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      Procedure Sel(CodTipoObjeto: double);
      Function GravarRegistro: boolean;
   End;

Var
   frmCadTipObjeto: TfrmCadTipObjeto;

Implementation

Uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

Procedure TfrmCadTipObjeto.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
   CtrlListTerceirosRH.InitializeAs(Padroes);

   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);

   CtrlTipObjeto := TCtrlTipObjeto.Create;
   CtrlTipObjeto.InitializeAs(Padroes);
   CtrlTipObjeto.CdsTipObjeto := Cds;
   Sel(-1);

   CdsGrpObjeto.Data := CtrlTipObjeto.ListGrpObjeto;

   CdsParamRH.Data := CtrlGlobalRH.GetParamRH('DATAVIGENCIAOBJ');

   Case (Sistema.IdModulo) Of
      MODCON, PROCPREV, SISTJURCONS:
         Begin
            CdsRubrica.Data := CtrlTipObjeto.ListRubrica(Sistema.IdEmpresa);
            dbrgRubrica.Visible := Not (CdsRubrica.IsEmpty);
            gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
            //            Self.Height := 302;
            If (Sistema.IdModulo = MODCON) Then
               HelpContext := 760013
            Else If (Sistema.IdModulo = SISTJURCONS) Then
               HelpContext := 7190013
            Else
               HelpContext := 1100008;
         End;
      PROCJUD:
         Begin
            dbrgRubrica.Visible := false;
            gbxRubrica.Visible := false;
            //            Self.Height := 219;
            HelpContext := 1110009;
         End;
   End;
End;

Procedure TfrmCadTipObjeto.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlTipObjeto);
   Inherited;
End;

Procedure TfrmCadTipObjeto.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If (MontaSelect.RetornouValor) Then
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
End;

Procedure TfrmCadTipObjeto.CmeCadastroInsert(Sender: TObject);
Begin
   Sel(-1);
   Inherited;
   Cds.FieldByName('CLASSEOBJ').asInteger := 1;
End;

Procedure TfrmCadTipObjeto.CmeCadastroAfterConfirma(Sender: TObject);
Begin
   //inherited;
End;

Procedure TfrmCadTipObjeto.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := GravarRegistro;
End;

Procedure TfrmCadTipObjeto.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := GravarRegistro;
End;

Procedure TfrmCadTipObjeto.CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := GravarRegistro;
End;

Procedure TfrmCadTipObjeto.dbrgRubricaChange(Sender: TObject);
Begin
   Inherited;
   gbxRubrica.Visible := (dbrgRubrica.ItemIndex = 0);
   If (Cds.State In [dsInsert, dsEdit]) And (dbrgRubrica.ItemIndex = 1) Then
      Cds.FieldByName('IDPROVENTO').Clear;
End;

Procedure TfrmCadTipObjeto.dblcRubricaCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   If (Modified) And (Trim(dbedDescr.Text) <> '') And
      (Trim(dbedDescr.Text) <> Trim(dblcRubrica.Text)) And
      (MsgDlg('Altera a Descrição do Objeto ?', LerMensagem(4), mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) Then
      dbedDescr.Text := Trim(dblcRubrica.Text);
End;

Procedure TfrmCadTipObjeto.bbtnConfirmarClick(Sender: TObject);
Var bInserindo: boolean;
Begin
   If (Trim(dbedDescr.Text) = '') Then
      Begin
         MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dbedDescr.SetFocus;
         Exit;
      End;

   If (Trim(dblckTipProc.Text) <> '') And (Trim(dblckTipoOperacao.Text) = '') Then
      Begin
         MsgDlg('Preencha o Sub-Programa.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dblckTipoOperacao.SetFocus;
         Exit;
      End;

   If Cds.fieldbyname('DATAVIGENCIA').Value < CdsParamRH.fieldbyname('DATAVIGENCIAOBJ').Value Then
      Begin
         MsgDlg('Vigência não pode mais ser lançada.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dbeDtVigencia.SetFocus;
         Exit;
      End;

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT seqtipoobjproctrab.NEXTVAL SEQOBJ FROM DUAL');
   qryAux.Open;
   Cds.FieldByName('CODTIPOOBJETO').asInteger := qryAux.fieldByname('SEQOBJ').asInteger;

   bInserindo := (Cds.State = dsInsert);
   Inherited;
   If Not (bInserindo) Then
      CmeCadastroFind(Sender);

   dbeDtVigencia.enabled := True;      
End;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

Procedure TfrmCadTipObjeto.Sel(CodTipoObjeto: double);
Begin
   Cds.Data := CtrlTipObjeto.ListTipObjeto(CodTipoObjeto);
End;

Function TfrmCadTipObjeto.GravarRegistro: boolean;
Begin
   Result := CtrlTipObjeto.GravarTipObjeto;
   If Not (Result) Then
      Raise Exception.Create(CtrlTipObjeto.MessageInfo);
End;

Procedure TfrmCadTipObjeto.FormShow(Sender: TObject);
Begin
   Screen.Cursor := crSQLWait;
   qryLkpPrograma.Close;
   qryLkpPrograma.Open;
   qryLkpSub_Programa.Close;
   qryLkpSub_Programa.Open;
   Screen.Cursor := crDefault;
End;

Procedure TfrmCadTipObjeto.dblckTipProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   qryLkpSub_Programa.SQL.Clear;
   qryLkpSub_Programa.SQL.add('SELECT T.TIPCODIGO, T.TIPDESCRICAO            ');
   qryLkpSub_Programa.SQL.add('FROM TIPOPER T, JUR_PROGRAMAXSUBPROGRAMA J    ');
   qryLkpSub_Programa.SQL.add('WHERE T.TIPCODIGO = J.TIPCODIGO AND           ');
   qryLkpSub_Programa.SQL.add('      J.IDTIPOPROC = ' + quotedstr(qryLkpPrograma.fieldByname('IDTIPOPROC').asString));
   qryLkpSub_Programa.SQL.add('ORDER BY T.TIPCODIGO                          ');
   qryLkpSub_Programa.Open;
End;

Procedure TfrmCadTipObjeto.sbtnInserirClick(Sender: TObject);
Begin
   Inherited;      
   Cds.fieldbyname('DATAVIGENCIA').Value := CdsParamRH.fieldbyname('DATAVIGENCIAOBJ').Value;
   dbeDtVigencia.enabled := False;
   dbedDescr.setfocus;
End;

Procedure TfrmCadTipObjeto.sbtnAlterarClick(Sender: TObject);
Begin
   Inherited;
   dbeDtVigencia.enabled := False;
   dbedDescr.setfocus;
End;

Procedure TfrmCadTipObjeto.sbtnProcurarClick(Sender: TObject);
Begin
   Inherited;

   qryLkpSub_Programa.SQL.Clear;
   qryLkpSub_Programa.SQL.add('SELECT T.TIPCODIGO, T.TIPDESCRICAO            ');
   qryLkpSub_Programa.SQL.add('FROM TIPOPER T, JUR_PROGRAMAXSUBPROGRAMA J    ');
   qryLkpSub_Programa.SQL.add('WHERE T.TIPCODIGO = J.TIPCODIGO AND           ');
   qryLkpSub_Programa.SQL.add('      J.IDTIPOPROC = ' + quotedstr(qryLkpPrograma.fieldByname('IDTIPOPROC').asString));
   qryLkpSub_Programa.SQL.add('ORDER BY T.TIPCODIGO                          ');
   qryLkpSub_Programa.Open;

End;

procedure TfrmCadTipObjeto.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   dbeDtVigencia.enabled := True;
end;

End.

