unit rptGPSMT;       
// Alterações:
{ --------------------------------------------------------------------------------------------------
 N. Chamado....: WO34233
 Dt Alteração..: 18/03/2026
 Responsável...: Paulo Nobre
 Descrição.....: PROJETO CNPJ ALFANUMÉRICO
                 .(.DFM) - Ajustando o padrão da mascara atual do CNPJ para
                  a alfanumérica: 'AA.AAA.AAA/AAAA-99'.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/04/2007
Autor     : André Pontes
Pendência : 22657
Descrição : Layout e lógica refeitos para permitir impressão a partir da nova definição
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, ppBands, ppClass, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Db,
  Wwdatsrc, DBTables, Wwquery, uCtrlRptGPS, uSistema, DBaseDados, TXRB;

type
  TrptGPS = class(TFrmCmReport)
    dsGPS: TwwDataSource;
    ppGPS: TppBDEPipeline;
    rpGPS: TppReport;
    rpGPSDtlBnd: TppDetailBand;
    rpGPSShape1: TppShape;
    rpGPSShape2: TppShape;
    rpGPSShape4: TppShape;
    rpGPSShape5: TppShape;
    rpGPSShape3: TppShape;
    rpGPSLine2: TppLine;
    rpGPSLine3: TppLine;
    rpGPSLine1: TppLine;
    rpGPSLabel3: TppLabel;
    rpGPSLabel1: TppLabel;
    rpGPSLabel2: TppLabel;
    rpGPSLabel4: TppLabel;
    rpGPSLabel5: TppLabel;
    rpGPSLabel6: TppLabel;
    rpGPSLabel7: TppLabel;
    rpGPSLabel8: TppLabel;
    rpGPSLabel9: TppLabel;
    rpGPSLabel10: TppLabel;
    rpGPSLabel21: TppLabel;
    rpGPSLabel12: TppLabel;
    rpGPSLabel13: TppLabel;
    rpGPSLabel14: TppLabel;
    rpGPSLabel15: TppLabel;
    rpGPSLabel17: TppLabel;
    rpGPSLabel18: TppLabel;
    rpGPSLabel19: TppLabel;
    rpGPSLabel20: TppLabel;
    rpGPSImage1: TppImage;
    rpGPSDBText2: TppDBText;
    rpGPSDBText3: TppDBText;
    rpGPSDBText4: TppDBText;
    rpGPSDBText6: TppDBText;
    rpGPSLbl71: TppLabel;
    rpGPSLbl81: TppLabel;
    rpGPSDBText5: TppDBText;
    rpGPSLabel16: TppLabel;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText44: TppDBText;
    ppDBText56: TppDBText;
    rpGPSSmryBnd: TppSummaryBand;
    rpGPSGrp: TppGroup;
    rpGPSGrpHdrBnd: TppGroupHeaderBand;
    rpGPSGrpFootBnd: TppGroupFooterBand;
    cmSqlGps: TCMSqlParams;
    cdsGps: TCMClientDataSet;
    sqlProcura: TCMSqlParams;
    cdsProcura: TCMClientDataSet;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    cdsGpsIDEMPRESA: TFloatField;
    cdsGpsEMPRESA: TStringField;
    cdsGpsCGC: TStringField;
    cdsGpsCODESTADO: TStringField;
    cdsGpsIDCIDADES: TFloatField;
    cdsGpsBAIRRO: TStringField;
    cdsGpsCIDADE: TStringField;
    cdsGpsRUA: TStringField;
    cdsGpsCEP: TStringField;
    cdsGpsCOMPETENCIA: TStringField;
    cdsGpsCODIGOPGTO: TStringField;
    cdsGpsCODDOCINSS: TFloatField;
    cdsGpsDATAVENCTO: TDateTimeField;
    cdsGpsIDDOCINSS: TFloatField;
    cdsGpsVLRINSS: TFloatField;
    cdsGpsVLRTOTAL: TFloatField;
    cdsGpsVLRDESCONTO: TFloatField;
    cdsGpsVLRJUROS: TFloatField;
    cdsGpsVLRMULTA: TFloatField;
    cdsGpsVLR_ATU: TFloatField;
    ppLabel1: TppLabel;
    ppDBText4: TppDBText;
    ppShape7: TppShape;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText8: TppDBText;
    ppLabel23: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel24: TppLabel;
    ppDBText15: TppDBText;
    ppShape6: TppShape;

    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpGPSPrintingComplete(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private // Private declarations

    CtrlRptGPS : TCtrlRptGPS;


  public  // Public declarations


  end;



var
  rptGPS: TrptGPS;



implementation
{$R *.DFM}



procedure TrptGPS.CrmRptCMBeforePrint(Sender: TObject);
var
  sSQL : string;
begin
  inherited;

  CtrlRptGPS.DataIni  := CmpRptCM.ParamValues[0].AsDateTime;
  CtrlRptGPS.DataFim  := CmpRptCM.ParamValues[1].AsDateTime;
  CtrlRptGPS.Impresso := CmpRptCM.ParamValues[2].AsInteger = 1;

  cdsGPS.Data         := CtrlRptGPS.ListaGPSImpressao;
  cdsGps.First;
end;



procedure TrptGPS.rpGPSPrintingComplete(Sender: TObject);
var
  sSQL : string;
begin
  inherited;

  // Atualiza com flgImpresso
  cdsGPS.First;
  while not(cdsGPS.EOF) do
  begin
    try
      sSQL :=
      'UPDATE DOCINSS '             + #13 +
      'SET    FLGIMPRESSO = ''S'' ' + #13 +
      'WHERE  IDDOCINSS   = '       + FormatFloat('#0', cdsGPS.FieldByName('IDDOCINSS').AsInteger);

      CtrlRptGPS.ExecutarSQL(sSQL);
    except
    end;

    cdsGPS.Next;
  end;
end;



procedure TrptGPS.FormCreate(Sender: TObject);
begin
  inherited;

  // -----------------------------------------------------------------------------------------------

  CtrlRptGPS := TCtrlRptGPS.Create;

  CtrlRptGPS.Initialize(DtmBaseDados.dbBaseDados,
                        True,
                        Sistema.ConnectionType,
                        Sistema.ConnectionSide,
                        Sistema.AppRemoteServer,
                        True,
                        nil,
                        nil,
                        False
                       );
  // -----------------------------------------------------------------------------------------------
end;



end.
