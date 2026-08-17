unit dRelProtocolo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TdtmRelProtocolo = class(TdtmReports)
      pplProtocolo: TppBDEPipeline;
      dsProtocolo: TwwDataSource;
      rptProtocolo: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      qryProtocolo: TwwQuery;
      ppLabel4: TppLabel;
      ppShape1: TppShape;
      ppDBText1: TppDBText;
      ppLabel5: TppLabel;
      ppDBText2: TppDBText;
      ppLabel6: TppLabel;
      ppDBText3: TppDBText;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppDBText4: TppDBText;
      ppLabel13: TppLabel;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppLabel11: TppLabel;
      ppShape2: TppShape;
      ppLabel12: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppShape3: TppShape;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel27: TppLabel;
      ppShape4: TppShape;
      ppLabel26: TppLabel;
      ppLabel28: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel36: TppLabel;
      ppLabel37: TppLabel;
      ppLabel29: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLabel41: TppLabel;
      ppLine4: TppLine;
      ppLabel42: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLine5: TppLine;
      ppLabel43: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
    qryProtocoloIDCONTRATOEMPTMO: TFloatField;
    qryProtocoloIDINSCRICAOEMPTMO: TFloatField;
    qryProtocoloIDCONTRQUITACAO: TFloatField;
    qryProtocoloIDTIPOCONTREMPTMO: TFloatField;
    qryProtocoloIDPATRO: TFloatField;
    qryProtocoloIDPLANOPREV: TFloatField;
    qryProtocoloIDPESSOA: TFloatField;
    qryProtocoloIDBENEF: TFloatField;
    qryProtocoloIDCBANCARIA: TFloatField;
    qryProtocoloIDVERBA: TFloatField;
    qryProtocoloFLGSITUACAO: TStringField;
    qryProtocoloFLGFORMAREC: TStringField;
    qryProtocoloPORTFORMAREC: TFloatField;
    qryProtocoloFLGFORMAPAG: TStringField;
    qryProtocoloCODFORMAPAG: TFloatField;
    qryProtocoloPORTFORMAPAG: TFloatField;
    qryProtocoloDATAASSINATURA: TDateTimeField;
    qryProtocoloDATACREDITO: TDateTimeField;
    qryProtocoloDATAPRIMPARC: TDateTimeField;
    qryProtocoloDATACANC: TDateTimeField;
    qryProtocoloDATASITUACAO: TDateTimeField;
    qryProtocoloPRAZO: TFloatField;
    qryProtocoloVLRCONTRATO: TFloatField;
    qryProtocoloVLRPARCELA: TFloatField;
    qryProtocoloTXJUROS: TFloatField;
    qryProtocoloANOSUSPENSAO: TFloatField;
    qryProtocoloMESSUSPENSAO: TFloatField;
    qryProtocoloTCEDESCRICAO: TStringField;
    qryProtocoloIDTIPOEMPTMO: TFloatField;
    qryProtocoloDESCTIPOEMPTMO: TStringField;
    qryProtocoloIDEMPRESAPROP: TFloatField;
    qryProtocoloMATRICULA: TStringField;
    qryProtocoloINSCRICAONUMERO: TFloatField;
    qryProtocoloSALPARTICIPACAO: TFloatField;
    qryProtocoloSALMANTIDO: TFloatField;
    qryProtocoloSALAUXDOENCA: TFloatField;
    qryProtocoloSITDESCRICAO: TStringField;
    qryProtocoloFLGINTERNO: TStringField;
    qryProtocoloNOME: TStringField;
    qryProtocoloNUMDOCUMENTO: TStringField;


   private { Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public { Public declarations }

      sMesCompetencia   : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelProtocolo: TdtmRelProtocolo;



implementation
{$R *.DFM}
uses
   cRelProtocolo;



function TdtmRelProtocolo.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   if (LowerCase(Form) = 'cfgrelprotocolo') then begin
      frm := TcfgRelProtocolo.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



end.
