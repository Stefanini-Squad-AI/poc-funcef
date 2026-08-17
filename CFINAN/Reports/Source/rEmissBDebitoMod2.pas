Unit rEmissBDebitoMod2;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass,
  ppCtrls, ppStrtch, ppRegion, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
  Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlEmissBordero, uCtrlParamIntegra;

Type
  TRptEmissBDebitoMod2 = Class(TFrmCmReport)
    ppBordDebitoMod2: TppBDEPipeline;
    DsBordDebitoMod2: TwwDataSource;
    RptBordDebitoMod2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    RptBordDebitoMod2DBText1: TppDBText;
    RptBordDebitoMod2DBText2: TppDBText;
    RptBordDebitoMod2DBText3: TppDBText;
    RptBordDebitoMod2DBText5: TppDBText;
    RptBordDebitoMod2DBText4: TppDBText;
    RgContaBancaria: TppRegion;
    RptBordDebitoMod2DBText6: TppDBText;
    RptBordDebitoMod2DBText7: TppDBText;
    RptBordDebitoMod2DBText8: TppDBText;
    RptBordDebitoMod2DBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    RptBordDebitoMod2Label2: TppLabel;
    RptBordDebitoMod2DBCalc1: TppDBCalc;
    RptBordDebitoMod2SummaryBand1: TppSummaryBand;
    RptBordDebitoMod2Line3: TppLine;
    RptBordDebitoMod2Label3: TppLabel;
    RptBordDebitoMod2DBCalc2: TppDBCalc;
    RptBordDebitoMod2Group1: TppGroup;
    RptBordDebitoMod2GroupHeaderBand1: TppGroupHeaderBand;
    RptBordDebitoLabel1: TppLabel;
    RptBordDebitoLabel2: TppLabel;
    RptBordDebitoLabel3: TppLabel;
    RptBordDebitoLabel4: TppLabel;
    LblFraseBord: TppLabel;
    RptBordDebitoDBText3: TppDBText;
    RptBordDebitoDBText2: TppDBText;
    RptBordDebitoDBText15: TppDBText;
    RptBordDebitoDBText16: TppDBText;
    RptBordDebitoDBText17: TppDBText;
    RptBPagtoDBText1: TppDBText;
    ppLine1: TppLine;
    RptBordDebitoLabel6: TppLabel;
    RptBordDebitoLabel9: TppLabel;
    RptBordDebitoLabel15: TppLabel;
    RptBPagtoLabel1: TppLabel;
    RptBordDebitoLabel11: TppLabel;
    RptBordDebitoLabel12: TppLabel;
    RptBordDebitoLabel13: TppLabel;
    RptBordDebitoMod2Label1: TppLabel;
    RptBordDebitoMod2Line1: TppLine;
    RptBordDebitoMod2Line2: TppLine;
    RptBordDebitoMod2Label4: TppLabel;
    RptBordDebitoMod2GroupFooterBand1: TppGroupFooterBand;
    SqlBordDebitoMod2: TCMSqlParams;
    CdsBordDebitoMod2: TCMClientDataSet;
    SqlBuscaCentroRespon: TCMSqlParams;
    CdsBuscaCentroRespon: TCMClientDataSet;
    SqlBuscaCentroRespon3: TCMSqlParams;
    CdsBuscaCentroRespon3: TCMClientDataSet;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure RptBordDebitoMod2PrintingComplete(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CtrlEmissBordero: TCtrlEmissBordero;
    sLoteBordero, sDataBorderoLocal, sCodPortForma, sLancaFinan: String;

  End;

Var
  RptEmissBDebitoMod2: TRptEmissBDebitoMod2;

Implementation

Uses DDadosBancarios, umensErro;

{$R *.DFM}

Procedure TRptEmissBDebitoMod2.CrmRptCMBeforePrint(Sender: TObject);
Var
  rValor: Real;
Begin
  Inherited;
  sLoteBordero := IntToStr(CmpRptCM.ParamValues[0].AsInteger);
  sDataBorderoLocal := CmpRptCM.ParamValues[1].AsString;
  sCodPortForma := IntToStr(CmpRptCM.ParamValues[2].AsInteger);

  SqlBordDebitoMod2.Prepare;
  SqlBordDebitoMod2.ParamByName('NumLote').AsInteger := CmpRptCM.ParamValues[0].AsInteger;
  SqlBordDebitoMod2.Open;
  CdsBordDebitoMod2.First;

  rValor := 0;

  While Not CdsBordDebitoMod2.Eof Do
  Begin
    With DtmDadosBancarios Do
    Begin
      BuscaContaDoc(CdsBordDebitoMod2.FieldByName('CODDOCUMENTO').AsFloat);
      CdsBordDebitoMod2.Edit;
      CdsBordDebitoMod2.FieldByName('NUMBANCO').AsString := ContaBancaria.Banco;
      CdsBordDebitoMod2.FieldByName('NOMEBANCO').AsString := ContaBancaria.NomeBanco;
      CdsBordDebitoMod2.FieldByName('NUMAGENCIA').AsString := ContaBancaria.AgenciaFormat;
      CdsBordDebitoMod2.FieldByName('NOMEAGENCIA').AsString := ContaBancaria.Nomeagencia;
      CdsBordDebitoMod2.FieldByName('CONTAFORNE').AsString := ContaBancaria.NumeroFormat;
    End;

    If CdsBordDebitoMod2.FieldByName('NUMFATURA').IsNull Then
    Begin
      If CdsBuscaCentroRespon.Active Then
        CdsBuscaCentroRespon.Close;
      SqlBuscaCentroRespon.Prepare;
      SqlBuscaCentroRespon.Params[0].AsFloat := CdsBordDebitoMod2.FieldByName('CODDOCUMENTO').AsFloat;
      SqlBuscaCentroRespon.Open;
      If CdsBuscaCentroRespon.IsEmpty Then
        CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := 'Nil'
      Else
        CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := CdsBuscaCentroRespon.Fields[0].asstring;
    End
    Else
    Begin
      If CdsBuscaCentroRespon3.Active Then
        CdsBuscaCentroRespon3.Close;
      SqlBuscaCentroRespon3.Prepare;
      SqlBuscaCentroRespon3.Params[0].AsFloat := CdsBordDebitoMod2.FieldByName('NUMFATURA').AsFloat;
      SqlBuscaCentroRespon3.Open;
      If CdsBuscaCentroRespon3.IsEmpty Then
        CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := 'Nil'
      Else
        CdsBordDebitoMod2.FieldByName('CENTRORESPON').asstring := CdsBuscaCentroRespon3.Fields[0].asstring;
    End;
    CdsBordDebitoMod2.Post;
    rValor := rValor + CdsBordDebitoMod2.FieldByName('VALOR').AsFloat;
    CdsBordDebitoMod2.Next;
  End;

  LblFraseBord.CAPTION :=
    'Autorizo o débito na conta acima para pagamento referente ao dia ' + sDataBorderoLocal +
    ' no valor total de R$ ' + Trim(FloatToStrF(rValor, ffNumber, 17, 2)) + ' do(s) documento(s) abaixo listado(s).'
End;

Procedure TRptEmissBDebitoMod2.RptBordDebitoMod2PrintingComplete(
  Sender: TObject);
Begin
  Inherited;

  //Verifica se o borderô foi impresso corretamente e Flega como impresso
  //Caso o preview seja via tela de Relatorios, recria o form de parâmetros para
  //Atualizar a querie

  If CtrlEmissBordero.VerificaImpresaoBordero(StrToInt(sLoteBordero)) Then
    exit;

  If CdsBordDebitoMod2.FieldByName('FLAGEMISSAO').AsString = '1' Then
    Exit;

    if MsgDlg(' O relatório foi emitido corretamente ?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  If Not CtrlEmissBordero.EmissaoBDebito(ParamIntegra.RecPAg, sLoteBordero, sDataBorderoLocal, sCodPortForma, CrmRptCM.idEmpresa,
    CrmRptCM.IdModulo, CrmRptCM.IdUsuario, ParamIntegra.Plano, ParamIntegra.IntegraContab) Then
    Exit;

End;

Procedure TRptEmissBDebitoMod2.FormCreate(Sender: TObject);
Begin
  Inherited;
  CtrlEmissBordero := TCtrlEmissBordero.Create(CrmRptCM.idEmpresa, CrmRptCM.idmodulo, CrmRptCM.idusuario, True);
  CtrlEmissBordero.InitializeAs(ParamIntegra);
End;

End.

