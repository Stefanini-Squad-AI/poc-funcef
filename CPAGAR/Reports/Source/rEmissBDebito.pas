//Marcus Oliveira P. 24249 22/01/2007 Incluído NumaAP no Relatório.
Unit rEmissBDebito;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra, uCtrlEmissBordero,
  TXRB;

Type
  TRptEmissBDebito = Class(TFrmCmReport)
    PpBDebito: TppBDEPipeline;
    DsBDebito: TwwDataSource;
    RptBDebito: TppReport;
    ppHeaderBand6: TppHeaderBand;
    LblTitBord2: TppLabel;
    ppLine11: TppLine;
    ppLabel14: TppLabel;
    RptBordPagtoLabel1: TppLabel;
    RptBordPagtoLabel2: TppLabel;
    RptBordPagtoLabel3: TppLabel;
    RptBordPagtoLabel4: TppLabel;
    RptBordPagtoDBText1: TppDBText;
    RptBordPagtoDBText2: TppDBText;
    RptBordPagtoDBText3: TppDBText;
    RptBordPagtoDBText4: TppDBText;
    RptBordPagtoDBText5: TppDBText;
    RptBordPagtoDBText6: TppDBText;
    RptBordPagtoLine1: TppLine;
    RptBordPagtoLine2: TppLine;
    RptBordPagtoLabel5: TppLabel;
    RptBordPagtoLabel6: TppLabel;
    RptBordPagtoLabel7: TppLabel;
    RptBordPagtoLabel8: TppLabel;
    RptBordPagtoLabel9: TppLabel;
    RptBordPagtoLabel10: TppLabel;
    RptBordPagtoLabel11: TppLabel;
    ppDetailBand6: TppDetailBand;
    RptBordPagtoDBText7: TppDBText;
    RptBordPagtoDBText8: TppDBText;
    RptBordPagtoDBText9: TppDBText;
    RptBordPagtoDBText10: TppDBText;
    RptBordPagtoDBText11: TppDBText;
    RptBordPagtoDBText12: TppDBText;
    ppFooterBand6: TppFooterBand;
    RptBordPagtoShape4: TppShape;
    ppLabel15: TppLabel;
    ppLine12: TppLine;
    RptBordPagtoShape1: TppShape;
    RptBordPagtoShape2: TppShape;
    RptBordPagtoShape3: TppShape;
    Lblc2: TppLabel;
    Lblc3: TppLabel;
    LblC1: TppLabel;
    Lblc4: TppLabel;
    RptBordPagtoLine4: TppLine;
    ppCalc12: TppSystemVariable;
    ppCalc11: TppSystemVariable;
    RptBordPagtoSummaryBand1: TppSummaryBand;
    RptBordPagtoLine3: TppLine;
    RptBordPagtoDBCalc1: TppDBCalc;
    RptBordPagtoLabel12: TppLabel;
    SqlTeste: TCMSqlParams;
    CdsTeste: TCMClientDataSet;
    SqlBDebito: TCMSqlParams;
    CdsBDebito: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    Procedure RptBDebitoPrintingComplete(Sender: TObject);
    Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sLoteBordero, sDataBorderoLocal, sCodPortForma: String;
    CtrlEmissBordero: TCtrlEmissBordero;
  public
    { Public declarations }
  End;

Var
  RptEmissBDebito: TRptEmissBDebito;

Implementation

uses umensErro;

{$R *.DFM}

Procedure TRptEmissBDebito.RptBDebitoPrintingComplete(Sender: TObject);
Begin
  Inherited;

  If CtrlEmissBordero.VerificaImpresaoBordero(StrToInt(sLoteBordero)) Then
    exit;

  If CdsBDebito.FieldByName('FLAGEMISSAO').AsString = '1' Then
    Exit;

  if MsgDlg(' O relatório foi emitido corretamente ?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  If Not CtrlEmissBordero.EmissaoBDebito(ParamIntegra.RecPAg, sLoteBordero, sDataBorderoLocal, sCodPortForma, CrmRptCM.idEmpresa,
    CrmRptCM.IdModulo, CrmRptCM.IdUsuario, ParamIntegra.Plano, ParamIntegra.IntegraContab) Then
    Exit;

End;




Procedure TRptEmissBDebito.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
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




Procedure TRptEmissBDebito.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  sLoteBordero := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
  sDataBorderoLocal := CmpRptCM.ParamValues[1].AsString;
  sCodPortForma := IntToStr(CmpRptCM.ParamValues[2].AsInteger);

  SqlBDebito.Prepare;
  SqlBDebito.ParamByName('NumLote').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
  SqlBDebito.Open;
  CdsBDebito.First;

  LblTitBord2.Text := 'Borderô Para Débito em Conta em' + sDataBorderoLocal;
End;




Procedure TRptEmissBDebito.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlEmissBordero := TCtrlEmissBordero.Create(CrmRptCM.idEmpresa, CrmRptCM.idmodulo, CrmRptCM.idusuario, True);
  CtrlEmissBordero.InitializeAs(ParamIntegra);

  //Rodolpho da Silva - P: 05/10/2006
  SqlBDebito.Prepare;
  SqlBDebito.ParamByName('NumLote').AsInteger := -1;
  SqlBDebito.Open;
End;

End.

