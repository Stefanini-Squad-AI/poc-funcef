// Daniel Simões em 12/01/2006 - P: 15395 --------------------------------------
// Adicionado o campo CODEXTERNO na query SqlCRxDesemb.
// OBS.: Quando clica no relatório, passa os parâmetros necessários e manda
//       carregar, a query demora bastante tempo para ser executada e
//       consequentemente abrir o relatório.
unit rCRxDesemb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppStrtch, ppRegion,
  ppPrnabl, ppCache, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlParamIntegra,
  TXRB;

type
  TRptCRxDesemb = class(TFrmCmReport)
    PpCRxDesemb: TppBDEPipeline;
    DsCRxDesemb: TwwDataSource;
    RptCRxDesemb: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    LblDescCentRespon: TppLabel;
    LblDescRecebDesemb: TppLabel;
    LblDescForn: TppLabel;
    RptCRxDesembLine26: TppLine;
    RptCRxDesembLine35: TppLine;
    LblTitRptCrxDesemb: TppLabel;
    RgDadosDoc: TppRegion;
    RptCRxDesembLabel7: TppLabel;
    RptCRxDesembLabel8: TppLabel;
    RptCRxDesembLabel1: TppLabel;
    RptCRxDesembLabel2: TppLabel;
    RptCRxDesembLabel13: TppLabel;
    RptCRxDesembLabel6: TppLabel;
    DetalheCrxDesemb: TppDetailBand;
    RptCRxDesembDBText6: TppDBText;
    RptCRxDesembDBText7: TppDBText;
    RptCRxDesembDBText8: TppDBText;
    RptCRxDesembDBText9: TppDBText;
    RptCRxDesembDBText10: TppDBText;
    RptCRxDesembDBText11: TppDBText;
    LblForn: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    RptCRxDesembSummaryBand1: TppSummaryBand;
    RptCRxDesembDBCalc4: TppDBCalc;
    RptCRxDesembLabel12: TppLabel;
    RptCRxDesembLine6: TppLine;
    RptCRxDesembLine5: TppLine;
    RptCRxDesembLine2: TppLine;
    RptCRxDesembLine3: TppLine;
    RptCRxDesembGroup1: TppGroup;
    GHeaderCentRespon: TppGroupHeaderBand;
    RptCRxDesembDBText2: TppDBText;
    RptCRxDesembDBText1: TppDBText;
    RptCRxDesembLine1: TppLine;
    GFooterCentRespon: TppGroupFooterBand;
    RptCRxDesembDBCalc3: TppDBCalc;
    LblTotCentResp: TppLabel;
    RptCRxDesembGroup2: TppGroup;
    GHeaderTipoDesemb: TppGroupHeaderBand;
    RptCRxDesembDBText4: TppDBText;
    RptCRxDesembDBText3: TppDBText;
    GFooterTipoDesemb: TppGroupFooterBand;
    RptCRxDesembDBCalc2: TppDBCalc;
    LblTotDesemb: TppLabel;
    LblDesemb: TppDBText;
    LblCodDesemb: TppDBText;
    RptCRxDesembGroup3: TppGroup;
    GHeaderRazaoSoc: TppGroupHeaderBand;
    RptCRxDesembDBText5: TppDBText;
    GFooterRazaoSoc: TppGroupFooterBand;
    RptCRxDesembDBCalc1: TppDBCalc;
    LblTotForn: TppLabel;
    LblGroupForn: TppDBText;
    SqlCRxDesemb: TCMSqlParams;
    CdsCRxDesemb: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCRxDesemb: TRptCRxDesemb;

implementation

{$R *.DFM}

procedure TRptCRxDesemb.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  //Grupo do Fornecedor
  LblDescForn.Visible := CmpRptCM.ParamValues[2].AsBoolean or CmpRptCM.ParamValues[3].AsBoolean;
  GHeaderRazaoSoc.Visible := CmpRptCM.ParamValues[3].AsBoolean and CmpRptCM.ParamValues[2].AsBoolean;
  GFooterRazaoSoc.Visible := CmpRptCM.ParamValues[2].AsBoolean;
  LblTotForn.Visible := CmpRptCM.ParamValues[2].AsBoolean and CmpRptCM.ParamValues[3].AsBoolean;
  LblGroupForn.Visible := CmpRptCM.ParamValues[2].AsBoolean and (not CmpRptCM.ParamValues[3].AsBoolean);
  //Detalhe dos Documentos
  DetalheCrxDesemb.Visible := CmpRptCM.ParamValues[3].AsBoolean;
  RgDadosDoc.Visible := CmpRptCM.ParamValues[3].AsBoolean;
  LblForn.Visible := CmpRptCM.ParamValues[3].AsBoolean and (not CmpRptCM.ParamValues[2].AsBoolean);
  //Monta tipo de desembolso de acordo com Fornecedor e Documentos
  LblDesemb.Visible := ((not CmpRptCM.ParamValues[3].AsBoolean) and (not CmpRptCM.ParamValues[2].AsBoolean));
  LblCodDesemb.Visible := ((not CmpRptCM.ParamValues[3].AsBoolean) and (not CmpRptCM.ParamValues[2].AsBoolean));
  GHeaderTipoDesemb.Visible := not ((not CmpRptCM.ParamValues[3].AsBoolean) and (not CmpRptCM.ParamValues[2].AsBoolean));
  LblTotDesemb.Visible := not ((not CmpRptCM.ParamValues[3].AsBoolean) and (not CmpRptCM.ParamValues[2].AsBoolean));

  SqlCRxDesemb.Prepare;

  SqlCRxDesemb.Parambyname('RECPAG').AsString := ParamIntegra.RecPag;
  SqlCRxDesemb.Parambyname('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
  SqlCRxDesemb.Parambyname('dataini').AsString := CmpRptCM.ParamValues[0].AsString;
  SqlCRxDesemb.Parambyname('datafim').AsString := CmpRptCM.ParamValues[1].AsString;
  SqlCRxDesemb.Open;
  LblTitRptCrxDesemb.Caption := 'Documentos baixados entre ' + CmpRptCM.ParamValues[0].AsString + ' e ' + CmpRptCM.ParamValues[1].AsString;
end;

procedure TRptCRxDesemb.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
  inherited;
  CmpRptCM.ParamValues[0].TextDefault := DateToStr(Date);
  CmpRptCM.ParamValues[1].TextDefault := DateToStr(Date);
end;

end.

