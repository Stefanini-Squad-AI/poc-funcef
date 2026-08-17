unit FDmRelSaldosCustodia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelSaldosCustodia = class(TDmRelatoriosInv)
    pplSaldosCustodia: TppBDEPipeline;
    dsSaldosCustodia: TwwDataSource;
    qrySaldosCustodia: TwwQuery;
    rptSaldosCustodia: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    shpCustodiante: TppShape;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    shpCabecalho: TppShape;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    shpDetalhe: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    qrySaldosCustodiaCUSTODIANTE: TStringField;
    qrySaldosCustodiaDESCINVESTIMENTO: TStringField;
    qrySaldosCustodiaDESCCARTINVEST: TStringField;
    qrySaldosCustodiaDESCMOTBLOQ: TStringField;
    qrySaldosCustodiaSALDO: TFloatField;
    qrySaldosCustodiaIDCARTEIRAINVEST: TFloatField;
    qrySaldosCustodiaIDCUSTODIANTE: TFloatField;
    qrySaldosCustodiaIDINVESTIMENTO: TFloatField;
    qrySaldosCustodiaIDLOTE: TStringField;
    qrySaldosCustodiaIDCUSTODIA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmRelSaldosCustodia: TDmRelSaldosCustodia;

implementation

{$R *.DFM}

end.
