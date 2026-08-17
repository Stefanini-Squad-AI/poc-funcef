unit dRelatoriosComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, Db,
  ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport, DBTables, Wwquery , Wwdatsrc,
  ppComm, ppCache, ppDB, ppDBBDE, ppStrtch, ppMemo, ppRichTx, ppSubRpt, ppEndUsr, ppVar,
  ppRelatv, ppDBPipe;

type
  TdtmRelatoriosComum = class(TdtmReports)
    rpCartaComun: TppReport;
    rpCartaComunHdrBnd6: TppHeaderBand;
    rpCartaComunDbTxtEMPRESA: TppDBText;
    rpCartaComunDtlBnd: TppDetailBand;
    rpCartaComunFootBnd: TppFooterBand;
    rpCartaComunSmryBnd: TppSummaryBand;
    ppCartaComun: TppBDEPipeline;
    dsCartaComun: TwwDataSource;
    qryCartaComun: TwwQuery;
    rpCartaComunDbTxtEMPRESA2: TppDBText;
    rpCartaComunLabel1: TppLabel;
    rpCartaComunDbTxtNOME: TppDBText;
    rpCartaComunDbTxtENDERECO: TppDBText;
    rpCartaComunDbTxtBAIRRO: TppDBText;
    rpCartaComunDbTxtCEPCID: TppDBText;
    rpCartaComunLabel2: TppLabel;
    rpCartaComunDbTxtASSUNTO: TppDBText;
    rpCartaComunLblDATA: TppLabel;
    rpCartaComunMemTEXTO: TppMemo;
    rpCartaComunGrpHdrNOME: TppGroupHeaderBand;
    dsgnRelatorios: TppDesigner;
  end;

var
  dtmRelatoriosComum: TdtmRelatoriosComum;

implementation

uses fAguarde, dBaseDados;

{$R *.DFM}

end.
