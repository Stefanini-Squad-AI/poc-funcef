unit DRelVerBuscaFolhaBen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, fPRelVerBuscaFolhaBen;

type
  TdtmrelverbuscaFolhaBen = class(TdtmReports)
    qryRelVerBuscaFolhaBen: TwwQuery;
    dsRelVerBuscaFolhaBen: TwwDataSource;
    pplRelVerBuscaFolhaBen: TppBDEPipeline;
    qryFundacao: TwwQuery;
    qryFundacaoNOME: TStringField;
    qryFundacaoRAZAOSOCIAL: TStringField;
    qryFundacaoLOGRADOURO: TStringField;
    qryFundacaoNUMERO: TStringField;
    qryFundacaoCOMPLEMENTO: TStringField;
    qryFundacaoBAIRRO: TStringField;
    qryFundacaoCIDADE: TStringField;
    qryFundacaoCODESTADO: TStringField;
    qryFundacaoCEP: TStringField;
    qryFundacaoIMAGEM: TBlobField;
    qryFundacaoENDERECO: TStringField;
    qryFundacaoBARCIDUF: TStringField;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    rpRelVerBuscaFolhaBen: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    rpBenEncerLine3: TppLine;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpBenEncerDBImage1: TppDBImage;
    rpBenEncerDBText11: TppDBText;
    rpBenEncerDBText12: TppDBText;
    rpBenEncerDBText13: TppDBText;
    rpBenEncerDBText14: TppDBText;
    rpBenEncerLabel14: TppLabel;
    rpBenEncerDBText15: TppDBText;
    rpBenEncerDBText16: TppDBText;
    rpBenEncerDBText17: TppDBText;
    rpBenEncerDBText18: TppDBText;
    qryRelVerBuscaFolhaBenIDPESSOA: TFloatField;
    qryRelVerBuscaFolhaBenNOME: TStringField;
    qryRelVerBuscaFolhaBenNUMDOCUMENTO: TStringField;
    qryRelVerBuscaFolhaBenORIGEM: TStringField;
    qryRelVerBuscaFolhaBenIDHSTFOLHABENEF: TFloatField;
    qryRelVerBuscaFolhaBenMESREFERENCIA: TStringField;
    qryRelVerBuscaFolhaBenVALORPROVENTO: TFloatField;
    qryRelVerBuscaFolhaBenHISTORICO: TStringField;
    qryRelVerBuscaFolhaBenNOMERUBRICA: TStringField;
    qryRelVerBuscaFolhaBenIDINFORME: TFloatField;
    qryRelVerBuscaFolhaBenNOMEINFORME: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine4: TppLine;
    ppLabel3: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    pplblTitulo: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmrelverbuscaFolhaBen: TdtmrelverbuscaFolhaBen;

implementation

{$R *.DFM}


function TdtmrelverbuscaFolhaBen.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if UPPERCASE(Form)= 'FRMPRELVERBUSCAFOLHABEN' then
        frm := TfrmPRelVerBuscaFolhaBen.Create(Application)
     else
        frm := nil;

     if frm = nil then
        Result := true
     else
     begin
          with frm do
          begin
               Result := (ShowModal = mrOk);
               free;
          end;
     end;
end;




end.
