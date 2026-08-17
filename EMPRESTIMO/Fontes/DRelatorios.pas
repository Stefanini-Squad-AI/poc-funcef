unit dRelatorios;

interface

uses
  Windows , Messages, SysUtils, Classes, Graphics, Controls, Forms   , Dialogs ,
  dReports, ppCtrls , ppBands , ppClass, ppPrnabl, ppProd  , ppReport, Db      ,
  DBTables, Wwquery , Wwdatsrc, ppComm , ppCache , ppDB    , ppDBBDE , ExtCtrls,
  TeeProcs, TeEngine, Chart   , DBChart, ppChrtDB, ppStrtch, ppRichTx,
  uExtensoCM, ppVar, ppRelatv, ppDBPipe;

type
  TdtmRelatorios = class(TdtmReports)
    ppRelEmptmo: TppReport;
    ppReport1HeaderBand1: TppHeaderBand;
    ppReport1DetailBand1: TppDetailBand;
    ppReport1FooterBand1: TppFooterBand;
    ppReport1Group2: TppGroup;
    ppReport1GroupHeaderBand2: TppGroupHeaderBand;
    ppReport1GroupFooterBand2: TppGroupFooterBand;
    ppReport1Group3: TppGroup;
    ppReport1GroupHeaderBand3: TppGroupHeaderBand;
    ppReport1Line1: TppLine;
    ppReport1GroupFooterBand3: TppGroupFooterBand;
    ppReport2: TppReport;
    ppReport2HeaderBand1: TppHeaderBand;
    ppReport2DetailBand1: TppDetailBand;
    ppReport2FooterBand1: TppFooterBand;
    ppReport2Group1: TppGroup;
    ppReport2GroupHeaderBand1: TppGroupHeaderBand;
    ppReport2Line1: TppLine;
    ppReport2GroupFooterBand1: TppGroupFooterBand;
    ppRelEmptmoDBImage1: TppDBImage;
    ppRelEmptmoShape1: TppShape;
    qryRelatParametrizavel: TwwQuery;
    dsRelatParametrizavel: TwwDataSource;
    pplRelatParametrizavel: TppBDEPipeline;
    rpRelatParametrizavel: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLine4: TppLine;
    ppDetailBand16: TppDetailBand;
    ppFooterBand15: TppFooterBand;
    ppLine6: TppLine;
    qryDoUsuario: TwwQuery;
    qryDoUsuarioTEMPLATE: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
    wMesRefAnt,   wAnoRefAnt : String;
    iQueryRel: Integer;
    function MostraParam(Form: string): Boolean; override;
  end;

var
  dtmRelatorios: TdtmRelatorios;

implementation

uses
   USistema;


{$R *.DFM}

//---------- funcão usada p/ integração relatórios cadastrados no sad ----------
//---------- e suas telas de parâmetros

function TdtmRelatorios.MostraParam(Form: string): Boolean;
var frm : TForm;
begin
   frm := nil;

   if frm = nil then
      Result := False
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
