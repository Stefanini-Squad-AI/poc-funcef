Unit rTipoDesemb;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, ppVar, ppBands, ppCtrls, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCtrlParamIntegra, uSistema,
  TXRB;

Type
  TRptTipoDesemb = Class(TFrmCmReport)
    PpTipoDesemb: TppBDEPipeline;
    DsTipoDesemb: TwwDataSource;
    RptTipoDesemb: TppReport;
    ppHeaderBand1: TppHeaderBand;
    LblTipoDesemb: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    RptTipoDesembLabel1: TppLabel;
    RptTipoDesembLabel2: TppLabel;
    RptTipoDesembLabel3: TppLabel;
    RptTipoDesembLabel4: TppLabel;
    RptTipoDesembLabel5: TppLabel;
    LblContaCredito: TppLabel;
    ppDetailBand1: TppDetailBand;
    RptTipoDesembDBText2: TppDBText;
    RptTipoDesembDBText3: TppDBText;
    RptTipoDesembDBText4: TppDBText;
    DbtPlaconta: TppDBText;
    DbtPlacontaCredito: TppDBText;
    DbtCodTipRecDes: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    SqlTipoDesemb: TCMSqlParams;
    CdsTipoDesemb: TCMClientDataSet;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    Procedure CrmRptCMBeforePrint(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  End;

Var
  RptTipoDesemb: TRptTipoDesemb;

Implementation

{$R *.DFM}

Procedure TRptTipoDesemb.CrmRptCMBeforePrint(Sender: TObject);
Begin
  Inherited;
  If CmpRptCM.ParamValues[2].AsBoolean Then
  Begin
    If ParamIntegra.RecPag = 'R' Then
      DbtCodTipRecDes.DisplayFormat := ParamIntegra.MascaraReceb + ';0; '
    Else
      DbtCodTipRecDes.DisplayFormat := ParamIntegra.MascaraDesemb + ';0; '
  End
  Else
    DbtCodTipRecDes.DisplayFormat := '';

  If CmpRptCM.ParamValues[3].AsBoolean Then
  Begin
    DbtPlaconta.DisplayFormat := ParamIntegra.MascaraPlano + ';0; ';
    DbtPlaContaCredito.DisplayFormat := ParamIntegra.MascaraPlano + ';0; ';
  End
  Else
  Begin
    DbtPlaconta.DisplayFormat := '';
    DbtPlaContaCredito.DisplayFormat := '';
  End;

  SqlTipoDesemb.Prepare;
  SqlTipoDesemb.Params[0].AsString := ParamIntegra.RecPag;
  SqlTipoDesemb.Params[1].AsInteger := Sistema.IdEmpresa;
  Case strtoint(CmpRptCM.ParamValues[0].AsString) Of
    0:
      Begin
        SqlTipoDesemb.Params[2].AsString := 'A';
        SqlTipoDesemb.Params[3].AsString := 'A';
      End;
    1:
      Begin
        SqlTipoDesemb.Params[2].AsString := 'S';
        SqlTipoDesemb.Params[3].AsString := 'S';
      End;
    2:
      Begin
        SqlTipoDesemb.Params[2].AsString := 'A';
        SqlTipoDesemb.Params[3].AsString := 'S';
      End;
  End;

  //DAVID
  Case strtoint(CmpRptCM.ParamValues[1].AsString) Of
    0:
      Begin
        SqlTipoDesemb.Params[4].AsString := 'S';
        SqlTipoDesemb.Params[4].AsString := 'S';
      End;
    1:
      Begin
        SqlTipoDesemb.Params[5].AsString := 'N';
        SqlTipoDesemb.Params[5].AsString := 'N';
      End;
    2:
      Begin
        SqlTipoDesemb.Params[4].AsString := 'S';
        SqlTipoDesemb.Params[5].AsString := 'N';
      End;
  End;
  SqlTipoDesemb.Open;
End;

Procedure TRptTipoDesemb.FormCreate(Sender: TObject);
Begin
  Inherited;
  If ParamIntegra.RecPag = 'R' Then
  Begin
    CmpRptCM.Caption := 'Parâmetros do Relatório de Tipo de Recebimento ';
    CmpRptCM.ParamValues[0].Caption := ' Lista Tipos de Recebimento ';
    CmpRptCM.ParamValues[2].Caption := 'Imprime Código do Recebimento Com a Mascára';
    LblTipoDesemb.Caption := 'Listagem de Tipos de Recebimentos'
  End
  Else
  Begin
    CmpRptCM.Caption := 'Parâmetros do Relatório de Tipo de Desembolso ';
    CmpRptCM.ParamValues[0].Caption := ' Lista Tipos de Desembolso ';
    CmpRptCM.ParamValues[2].Caption := 'Imprime Código do Desembolso Com a Mascára';
    LblTipoDesemb.Caption := 'Listagem de Tipos de Desembolso';
  End;
End;

End.

