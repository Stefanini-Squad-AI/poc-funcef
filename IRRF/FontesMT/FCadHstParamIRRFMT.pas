{
//***************************************************************************************
//N. SIG..........      : 136956
//Data da Alteração:    : 06/07/2023
//Alteração Form:       : dblcIDINFORMECONTRIBEXTRA e dblcIDINFORMECONTRIBEXTRA13
//Responsável:          : André Imakawa
//Descrição.......      : Inclusão de novos campos ContribuiçãoExtra
//****************************************************************************************
//Rotina                : FormCreate, MontaSelectBeforeOpenCds
//N. Sol..........      : 227955/17939
//N. PPM.............   : 1176698 (2063433)
//Data da Alteração:    : 01/03/2015
//Alteração Form:       :
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão de novos campos necessários à NOVA BUSCA
//****************************************************************************************
Analista.: Bruno Bastos
Pendencia: 23365
Data.....: 20/09/2006
Rotina...: bbtnConfirmarClick
Descrição: Só testar se há um registro com data de início de vigência igual, se
           for uma inclusão.
******************************************************************************************
                       }
Unit FCadHstParamIRRFMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdbdatetimepicker, CMDateTimePicker, StdCtrls, TREdit,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, uMensErro, DBaseDados, uCtrlHstParamIRRF,
  uCMTypes, uSistema, Mask, DBCtrls, wwdblook, uCmSqlParams;

Type
  TFrmCadHstParamIRRFMT = Class(TFrmCadastroMT)
    GroupBox10: TGroupBox;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label22: TLabel;
    lblCompensaVlrNegativo: TLabel;
    Label26: TLabel;
    lblCompensaVlrNegativo13s: TLabel;
    dblcAcima65Abono: TwwDBLookupCombo;
    dblcAcima65: TwwDBLookupCombo;
    dblcMolestiaGrave: TwwDBLookupCombo;
    dblcAcaoJudicial: TwwDBLookupCombo;
    dblcAcaoJudicialAbono: TwwDBLookupCombo;
    dblcEgibilidadeSuspensa: TwwDBLookupCombo;
    dblcInfRendCompNeg: TwwDBLookupCombo;
    wwDBLookupCombo8: TwwDBLookupCombo;
    dblcInfRendCompNeg13s: TwwDBLookupCombo;
    Geral: TGroupBox;
    lblDtIniVig: TLabel;
    dbedDtIniVig: TCMDateTimePicker;
    lblIdadeIdoso: TLabel;
    dbedtIdadeIdoso: TDBEdit;
    VlrIdoso: TLabel;
    dbredtVlrIdoso: TDBRealEdit;
    lblVlrDep: TLabel;
    dbredtVlrDep: TDBRealEdit;
    lblPercIrExt: TLabel;
    dbredtPercIrExt: TDBRealEdit;
    gbInss: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cboInforme65INSS: TwwDBLookupCombo;
    cboInformeMolINSS: TwwDBLookupCombo;
    cboInforme65INSSAbono: TwwDBLookupCombo;
    dblcAcaoJudicialInss: TwwDBLookupCombo;
    dblcAcaoJudicialInss13: TwwDBLookupCombo;
    Label25: TLabel;
    dblcRegraAcaoJudicialINSS: TwwDBLookupCombo;
    SQLCds: TCMSqlParams;
    CdsIDHSTPARAMIRRF: TFloatField;
    CdsVLRIDOSO: TFloatField;
    CdsDATAINIVIGENCIA: TDateTimeField;
    CdsVLRDEPENDENTE: TFloatField;
    CdsPERCIRRFEXTERIOR: TFloatField;
    CdsIDADEIDOSO: TFloatField;
    CdsTRGDTINCLUSAO: TDateTimeField;
    CdsTRGUSERINCLUSAO: TStringField;
    CdsIDINFORME65ANOS: TFloatField;
    CdsIDINFORME65ANOS13: TFloatField;
    CdsIDINFORMEMOLESTIA: TFloatField;
    CdsIDINFORMEACJUD: TFloatField;
    CdsIDINFORMEACJUD13: TFloatField;
    CdsIDEXIGIBILIDADESUSPENSA: TFloatField;
    CdsIDINFRENDCOMPNEG: TFloatField;
    CdsIDINFRENDCOMPNEGISENTO: TFloatField;
    CdsIDINFRENDCOMPNEG13S: TFloatField;
    CdsIDINFORME65INSS: TFloatField;
    CdsIDINFORME65INSS13: TFloatField;
    CdsIDINFORMEMOLINSS: TFloatField;
    CdsIDACAOJUDICIALINSS: TFloatField;
    CdsIDACAOJUDICIALINSS13: TFloatField;
    CdsIDREGRAINSS: TFloatField;
    cdsInforme: TCMClientDataSet;
    cdsRegra: TCMClientDataSet;
    lblInformeContribExtra: TLabel;
    lblInformeContribExtra13: TLabel;
    CdsIDINFORMECONTRIBEXTRA: TFloatField;
    CdsIDINFORMECONTRIBEXTRA13: TFloatField;
    dblcIDINFORMECONTRIBEXTRA: TwwDBLookupCombo;
    dblcIDINFORMECONTRIBEXTRA13: TwwDBLookupCombo;
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    Procedure CmeCadastroAfterConfirma(Sender: TObject);
    Procedure MontaSelectBeforeOpenCds(Var sqlText: String;
      strListParams: TStringList);
  Private
    { Private declarations }
    IRRF: TCtrlHstParamIRRF;
  Public
    { Public declarations }
  End;

Var
  FrmCadHstParamIRRFMT: TFrmCadHstParamIRRFMT;

Implementation

{$R *.DFM}

Procedure TFrmCadHstParamIRRFMT.bbtnConfirmarClick(Sender: TObject);
Begin
  If (Trim(dbedtIdadeIdoso.Text) = '') Or
    (Trim(dbedDtIniVig.Text) = '') Or
    (dbredtVlrDep.Value = 0) Or
    (dbredtVlrIdoso.Value = 0) Then
    Begin
      MsgDlg('Somente alíquota para residente no exterior não é obrigatório.', 'Erro', mtError, [mbOK], 0);
      dbedtIdadeIdoso.SetFocus;
      Exit;
    End;
  If Cds.State In [dsInsert] Then
    Begin
      If Irrf.VerificaData(dbedDtIniVig.Text) Then
        Begin
          MsgDlg('Já existe registro com esta data início de vigência.', 'Erro', mtError, [mbOK], 0);
          dbedDtIniVig.SetFocus;
          Exit;
        End;
    End;
  Inherited;
End;

Procedure TFrmCadHstParamIRRFMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  IRRF := TCtrlHstParamIRRF.Create;
  IRRF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);
  IRRF.CdsHstParamIRRF := Cds;
  Cds.Data := IRRF.ProcurarHstParamIRRF(-1);

  // SOL 227955/17939 - PPM 1176698 - Paulo Nobre
  cdsInforme.data := IRRF.ListInforme;
  cdsRegra.Data := IRRF.ListRegras;
  //
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
    Begin
      Cds.Data := IRRF.ProcurarHstParamIRRF(StrToInt(MontaSelect.ValoresChave[0]));
      IRRF.CdsHstParamIRRF := Cds;
    End;
End;

Procedure TFrmCadHstParamIRRFMT.FormClose(Sender: TObject;
  Var Action: TCloseAction);
Begin
  Inherited;
  IRRF.Free;
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroApplyDelete(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  IRRF.GravarHstParamIRRF;
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroApplyEdit(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  IRRF.GravarHstParamIRRF;
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroApplyInsert(sender: TObject;
  Var Accept: Boolean);
Begin
  Inherited;
  IRRF.GravarHstParamIRRF;
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroConfirma(Sender: TObject);
Begin
  Inherited;
  Cds.Data := IRRF.ProcurarHstParamIRRF(-1);
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
Begin
  Inherited;
  If OrigemAbortConfirma In [OaApplyInsert, OaApplyDelete, OaApplyEdit] Then
    MsgDlg(IRRF.MessageInfo, 'Erro', MtError, [MbOk], 0);
End;

Procedure TFrmCadHstParamIRRFMT.CmeCadastroAfterConfirma(Sender: TObject);
Begin
  //inherited;

End;

Procedure TFrmCadHstParamIRRFMT.MontaSelectBeforeOpenCds(
  Var sqlText: String; strListParams: TStringList);
Begin
  Inherited;
  // SOL 227955/17939 - PPM 1176698 - Paulo Nobre
  sqlText := StringReplace(sqlText, 'ORDER BY C0 ASC', 'ORDER BY H.DATAINIVIGENCIA DESC', [rfReplaceAll]);
End;

End.

