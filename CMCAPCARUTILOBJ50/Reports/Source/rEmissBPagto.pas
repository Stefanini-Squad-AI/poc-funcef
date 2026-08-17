Unit rEmissBPagto;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls, ppBands, ppVar,
  ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlEmissBordero, uCtrlParamIntegra, TXRB;

Type
  TRptEmissBPagto = Class(TFrmCmReport)
    PpBPagto: TppBDEPipeline;
    PpBPagtoppField1: TppField;
    PpBPagtoppField2: TppField;
    PpBPagtoppField3: TppField;
    PpBPagtoppField4: TppField;
    PpBPagtoppField5: TppField;
    PpBPagtoppField6: TppField;
    PpBPagtoppField7: TppField;
    PpBPagtoppField8: TppField;
    PpBPagtoppField9: TppField;
    PpBPagtoppField10: TppField;
    PpBPagtoppField11: TppField;
    PpBPagtoppField12: TppField;
    PpBPagtoppField13: TppField;
    PpBPagtoppField14: TppField;
    PpBPagtoppField15: TppField;
    PpBPagtoppField16: TppField;
    PpBPagtoppField17: TppField;
    PpBPagtoppField18: TppField;
    PpBPagtoppField19: TppField;
    PpBPagtoppField20: TppField;
    PpBPagtoppField21: TppField;
    PpBPagtoppField22: TppField;
    PpBPagtoppField23: TppField;
    PpBPagtoppField24: TppField;
    PpBPagtoppField25: TppField;
    DsBPagto: TwwDataSource;
    RptBPagto: TppReport;
    ppHeaderBand5: TppHeaderBand;
    LblTitBord1: TppLabel;
    ppLine9: TppLine;
    ppLabel11: TppLabel;
    RptBordDebitoLabel1: TppLabel;
    RptBordDebitoLabel2: TppLabel;
    RptBordDebitoLabel3: TppLabel;
    RptBordDebitoLabel4: TppLabel;
    RptBordDebitoLabel5: TppLabel;
    RptBordDebitoLine1: TppLine;
    RptBordDebitoLabel6: TppLabel;
    RptBordDebitoLabel7: TppLabel;
    RptBordDebitoLabel8: TppLabel;
    RptBordDebitoLabel9: TppLabel;
    RptBordDebitoLabel10: TppLabel;
    RptBordDebitoLabel11: TppLabel;
    RptBordDebitoLabel12: TppLabel;
    RptBordDebitoLabel13: TppLabel;
    RptBordDebitoLine2: TppLine;
    RptBordDebitoDBText3: TppDBText;
    RptBordDebitoDBText2: TppDBText;
    RptBordDebitoLabel15: TppLabel;
    RptBordDebitoDBText15: TppDBText;
    RptBordDebitoDBText16: TppDBText;
    RptBordDebitoDBText17: TppDBText;
    RptBPagtoDBText1: TppDBText;
    RptBPagtoLabel1: TppLabel;
    ppDetailBand5: TppDetailBand;
    RptBordDebitoDBText1: TppDBText;
    RptBordDebitoDBText4: TppDBText;
    RptBordDebitoDBText6: TppDBText;
    RptBordDebitoDBText7: TppDBText;
    RptBordDebitoDBText9: TppDBText;
    RptBordDebitoDBText10: TppDBText;
    RptBordDebitoDBText11: TppDBText;
    RptBordDebitoDBText12: TppDBText;
    RptBordDebitoDBText13: TppDBText;
    RptBordDebitoDBText14: TppDBText;
    RptBPagtoDBText2: TppDBText;
    RptBordDebitoDBText8: TppDBText;
    ppFooterBand5: TppFooterBand;
    RptBordDebitoShape4: TppShape;
    ppLine10: TppLine;
    ppLabel12: TppLabel;
    RptBordDebitoLine4: TppLine;
    RptBordDebitoShape1: TppShape;
    RptBordDebitoShape2: TppShape;
    RptBordDebitoShape3: TppShape;
    Lbl2: TppLabel;
    Lbl3: TppLabel;
    Lbl1: TppLabel;
    Lbl4: TppLabel;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    RptBordDebitoSummaryBand1: TppSummaryBand;
    RptBordDebitoDBCalc1: TppDBCalc;
    RptBordDebitoLabel14: TppLabel;
    RptBordDebitoLine3: TppLine;
    CdsBPagto: TCMClientDataSet;
    SqlBPagto: TCMSqlParams;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    Procedure RptBPagtoPrintingComplete(Sender: TObject);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
  private
    { Private declarations }
    CtrlEmissBordero: TCtrlEmissBordero;
    sLoteBordero, sDataBordero, sCodPortForma: String;

  public
    { Public declarations }
  End;

Var
  RptEmissBPagto: TRptEmissBPagto;

Implementation

Uses DDadosBancarios;

{$R *.DFM}

Procedure TRptEmissBPagto.RptBPagtoPrintingComplete(Sender: TObject);
Begin
  Inherited;
  //Verifica se o borderô foi impresso corretamente e Flega como impresso
  //Caso o preview seja via tela de Relatorios, recria o form de parâmetros para
  //Atualizar a querie

  If CtrlEmissBordero.VerificaImpresaoBordero(StrToInt(sLoteBordero)) Then
    exit;
  If CdsBPagto.FieldByName('FLAGEMISSAO').AsString = '1' Then
    Exit;

  If Not CtrlEmissBordero.EmissaoBDebito(ParamIntegra.RecPAg, sLoteBordero, sDataBordero, sCodPortForma, CrmRptCM.idEmpresa,
    CrmRptCM.IdModulo, CrmRptCM.IdUsuario, ParamIntegra.Plano, ParamIntegra.IntegraContab) Then
    Exit;
End;

Procedure TRptEmissBPagto.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  sLoteBordero := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
  sDataBordero := CmpRptCM.ParamValues[1].AsString;
  sCodPortForma := IntToStr(CmpRptCM.ParamValues[2].AsInteger);

  SqlBPagto.Prepare;
  SqlBPagto.ParamByName('NumLote').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
  SqlBPagto.Open;
  CdsBPagto.First;
  LblTitBord1.Text := 'Borderô Para Pagamento em ' + CmpRptCM.ParamValues[1].AsString;
  While Not CdsBPagto.Eof Do
  Begin
    With DtmDadosBancarios Do
    Begin
      BuscaContaDoc(CdsBPagto.FieldByName('CODDOCUMENTO').AsFloat);
      CdsBPagto.Edit;
      CdsBPagto.FieldByName('NUMBANCO').AsString := ContaBancaria.Banco;
      CdsBPagto.FieldByName('NOMEBANCO').AsString := ContaBancaria.NomeBanco;
      CdsBPagto.FieldByName('NUMAGENCIA').AsString := ContaBancaria.AgenciaFormat;
      CdsBPagto.FieldByName('NOMEAGENCIA').AsString := ContaBancaria.Nomeagencia;
      CdsBPagto.FieldByName('CONTAFORNE').AsString := ContaBancaria.NumeroFormat;
      CdsBPagto.Post;
    End;
    CdsBPagto.Next;
  End;
End;

Procedure TRptEmissBPagto.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlEmissBordero := TCtrlEmissBordero.Create(CrmRptCM.idEmpresa, CrmRptCM.idmodulo, CrmRptCM.idusuario, True);
  CtrlEmissBordero.InitializeAs(ParamIntegra);
End;

Procedure TRptEmissBPagto.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Var
  LblRelats: TppLabel;
Begin
  Inherited;
  SqlTeste.SQL.Text := 'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '
    + FloatToStr(CrmRptCM.IdModulo) + ') AND (IDPESSOA = '
    + FloatToStr(CrmRptCM.idEmpresa) + ')';
  SqlTeste.Open;
  CdsTeste.First;
  While Not CdsTeste.Eof Do
  Begin
    Try
      LblRelats := (FindComponent(CdsTeste.FieldByName('NOMECOMPO').AsString) As TppLabel);
      If LblRelats = Nil Then
        LblRelats := (FindComponent(Cdsteste.FieldByName('NOMECOMPO').AsString) As TppLabel);

      If LblRelats <> Nil Then
        LblRelats.Caption := CdsTeste.FieldByName('VALOR').AsString;
    Finally
      CdsTeste.Next;
    End;
  End;
End;

End.

