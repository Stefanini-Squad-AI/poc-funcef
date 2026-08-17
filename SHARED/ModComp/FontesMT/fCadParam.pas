//******************************************************************************************
//N. Sol..........: 172550
//N. Kintana......: 1555163
//Data............: 27/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos campos para uso na integração da Etapa do Processo - SISTJURCONS
//******************************************************************************************
Unit fCadParam;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
   cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls, ToolWin,
   ExtCtrls, Mask, DBTables, TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdblook,
   CmEventosCadastro, wwDialog, ImgList, MontaSelect, DBClient, uCMClientDataSet, uCtrlParamRH,
   wwdbedit, Wwdbspin, uCmSqlParams, uCtrlListTerceirosRH, Wwquery;

Type
   TfrmCadParam = Class(TFrmCadastroMT)
      Label12: TLabel;
      dblcMoeda: TwwDBLookupCombo;
      dbrgIntegraCAP: TDBRadioGroup;
      dbrgIntegraCont: TDBRadioGroup;
      dbrgSubConta: TDBRadioGroup;
      CdsMoeda: TCMClientDataSet;
      dbrgPercProb: TDBRadioGroup;
      gbDadosInt: TGroupBox;
      Label3: TLabel;
      wwDBSpinEdit1: TwwDBSpinEdit;
      Label47: TLabel;
      dblckTipoDoc: TwwDBLookupCombo;
      lblPortadorForma: TLabel;
      dblkPortadorForma: TwwDBLookupCombo;
      CdsTipoDoc: TCMClientDataSet;
      qryTipoDoc: TCMSqlParams;
      cdsPortadorFormaCAP: TCMClientDataSet;
      qryPortadorCAP: TCMSqlParams;
      lblCentroCusto: TLabel;
      dblkCentroCusto: TwwDBLookupCombo;
      qryLkpCentroCusto: TwwQuery;
      qryLkpCentroCustoNOME: TStringField;
      qryLkpCentroCustoCODCENTROCUSTO: TStringField;
      Label1: TLabel;
      dblkpTipoDesembPag: TwwDBLookupCombo;
      CdsDesembolsoCustas: TCMClientDataSet;
      SQLDesemb: TCMSqlParams;
      CdsDesembolsoCustasCODTIPRECDES: TStringField;
      CdsDesembolsoCustasDESCRICAO: TStringField;
      CdsDesembolsoCustasPLACONTACREDITO: TStringField;
      CdsDesembolsoCustasPLANO: TFloatField;
      CdsDesembolsoCustasPLACONTA: TStringField;
      CdsDesembolsoCustasRECPAG: TStringField;
    cdsPortadorFormaCAPCODFORMA: TFloatField;
    cdsPortadorFormaCAPRECPAG: TStringField;
    cdsPortadorFormaCAPDESCRICAO: TStringField;
      Procedure FormCreate(Sender: TObject);
      Procedure dbrgIntegraContChange(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure CmeCadastroAfterConfirma(Sender: TObject);
      Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
      Procedure dbrgIntegraCAPClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
   Private
      CtrlParamRH: TCtrlParamRH;
      CtrlListTerceirosRH: TctrlListTerceirosRH;

      Procedure Sel;
      Function GravarRegistro: boolean;
   End;

Var
   frmCadParam: TfrmCadParam;

Implementation

Uses uMensErro, uCtrlPadroes, uSistema, uCMTypes, uCtrlFuncoesRH;

{$R *.DFM}

Procedure TfrmCadParam.FormCreate(Sender: TObject);
Begin
   Inherited;
   dbrgPercProb.Items[0] := 'No Valor Reclamado';

   CtrlParamRH := TCtrlParamRH.Create;
   CtrlParamRH.InitializeAs(Padroes);
   CtrlParamRH.CdsParamRH := Cds;

   // SOL 172550 KTN 1555163 - Paulo Nobre
   ctrlListTerceirosRH := TCtrlListTerceirosRH.Create('', '', '');
   ctrlListTerceirosRH.InitializeAs(Padroes);

   Sel;
   If (Cds.IsEmpty) Then
      Begin
         CtrlParamRH.ExecInsert;
         CtrlParamRH.GravarParamRH;
         Sel;
      End;

   CdsMoeda.Data := CtrlParamRH.ListMoeda;

   // SOL 172550 KTN 1555163 - Paulo Nobre
   CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag('P');
   CdsPortadorFormaCAP.Data := CtrlListTerceirosRH.ListPortadorFormaEtapa(-1, 'P');
   qryLkpCentroCusto.Close;
   qryLkpCentroCusto.Open;

   // SOL 174225 KTN 1572025 - Paulo Nobre
   CdsDesembolsoCustas.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(1, 'P', True);

   gbDadosInt.Visible := (dbrgIntegraCAP.Items.Strings[dbrgIntegraCAP.ItemIndex] = 'Sim');

   If (Sistema.IdModulo = MODCON) Then // Processos Trabalhistas
      dbrgIntegraCAP.Caption := 'Faz Integração com Contas a Pagar?'
   Else
      dbrgIntegraCAP.Caption := 'Faz Integração com Contas a Pagar/Receber?';

   If (Sistema.IdModulo = 111) Then // Processos Judiciais
      bbtnAjuda.HelpContext := 230005
   Else If (Sistema.IdModulo = 110) Then // Contencioso Previdenciário
      bbtnAjuda.HelpContext := 230005
   Else // Contencioso Trabalhista
      bbtnAjuda.HelpContext := 0;
End;

Procedure TfrmCadParam.FormShow(Sender: TObject);
Begin
   Inherited;
   dbrgSubConta.Visible := (dbrgIntegraCont.ItemIndex = 0);
   sbtnAlterar.Enabled := Not (Cds.IsEmpty);
End;

Procedure TfrmCadParam.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlParamRH);
   freeAndnil(ctrlListTerceirosRH);
   qryLkpCentroCusto.Close;
   Inherited;
End;

Procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
Begin
   //inherited;
End;

Procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   cds.FieldByName('RECPAGCUSTASJUDPAG').AsString := 'P'; // Pagar
   Accept := GravarRegistro;
   Sel;
End;

Procedure TfrmCadParam.dbrgIntegraContChange(Sender: TObject);
Begin
   dbrgSubConta.Visible := (dbrgIntegraCont.ItemIndex = 0);
End;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

Procedure TfrmCadParam.Sel;
Begin
   Cds.Data := CtrlParamRH.ListParamRH;
End;

Function TfrmCadParam.GravarRegistro: boolean;
Begin
   Result := CtrlParamRH.GravarParamRH;
   If Not (Result) Then
      Raise Exception.Create(CtrlParamRH.MessageInfo);
End;

Procedure TfrmCadParam.dbrgIntegraCAPClick(Sender: TObject);
Begin
   Inherited;
   // SOL 172550 KTN  - Paulo Nobre
   gbDadosInt.Visible := (dbrgIntegraCAP.Items.Strings[dbrgIntegraCAP.ItemIndex] = 'Sim');
End;

Procedure TfrmCadParam.bbtnConfirmarClick(Sender: TObject);
Begin
   If (Trim(dblckTipoDoc.Text) = '') Then
      Begin
         MsgDlg('Preencha o Tipo de Documento !', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dblckTipoDoc.SetFocus;
         exit;
      End;

   If (Trim(dblkCentroCusto.Text) = '') Then
      Begin
         MsgDlg('Preencha o Centro de Custos Padrão !', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dblkCentroCusto.SetFocus;
         exit;
      End;

   If (Trim(dblkpTipoDesembPag.Text) = '') Then
      Begin
         MsgDlg('Preencha o Desembolso das Custas Judiciais !', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dblkpTipoDesembPag.SetFocus;
         exit;
      End;

   Inherited;                                   
End;

End.

