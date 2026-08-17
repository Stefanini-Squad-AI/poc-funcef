unit DAPrev;

interface
                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, URegra, ppEndUsr, ppBands, ppCtrls, ppClass,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Wwdatsrc;

type
  TdtmAPrev = class(TDataModule)
    qryRegra: TwwQuery;
    qryGrava: TwwQuery;
    qryContPlanPatro: TwwQuery;
    qryContPrev: TwwQuery;
    qry: TwwQuery;
    qryVerificaObrig: TwwQuery;
    qryAux: TwwQuery;
    regraAPrev: TRegra;
    qryAux2: TwwQuery;
    qryAuxContrib: TwwQuery;
    qryRubricaxPess: TwwQuery;
    qryAlteradorContrib: TwwQuery;
    qryReserva: TwwQuery;
    qryPlanReduz: TwwQuery;
    qryReduzContrib: TwwQuery;
    qryBenefRecalculo: TwwQuery;
    qryBenef: TwwQuery;
    qryMovReserva: TwwQuery;
    qryInsTmpDesc: TwwQuery;
    qryDependentes: TwwQuery;
    qryAtualizadependente: TwwQuery;
    qryAtualizaTitular: TwwQuery;
    qryContabil: TwwQuery;
    qryContabilPLACONTA: TStringField;
    qryContabilCODSUBCONTA: TFloatField;
    qryContabilNOME_1: TStringField;
    qryContabilNOME: TStringField;
    qryContabilLACDEBCRE: TStringField;
    qryContabilLACVALOR: TFloatField;
    qryContabilLACVALHIST: TFloatField;
    qryContabilLACHIST1: TStringField;
    qryContabilLACHIST2: TStringField;
    qryContabilLACHIST3: TStringField;
    qryContabilPLNCODIGO: TFloatField;
    qryContabilLACNUMLAN: TFloatField;
    qryContabilHITCODHIST: TStringField;
    qryContabilIDPESSOA: TFloatField;
    qryContabilIDEMPRESA: TFloatField;
    qryContabilIDMODULO: TFloatField;
    qryContabilUNIDNEGOC: TFloatField;
    qryContabilIDUSUARIOINCLUSAO: TFloatField;
    qryContabilCODCENTROCUSTO: TStringField;
    qryContabilPLANO: TFloatField;
    qryContabilLACTIPO: TStringField;
    qryContabilLACNUMDOC: TStringField;
    qryContabilLACHIST4: TStringField;
    qryContabilLACHIST5: TStringField;
    qryContabilLACTIPCONVOFICIAL: TStringField;
    qryContabilLACVALOFICIAL: TFloatField;
    qryContabilLACTIPCONVGER: TStringField;
    qryContabilLACVALGERENCIAL: TFloatField;
    qryContabilLACTIPCONVGEREN1: TStringField;
    qryContabilLACVALGEREN1: TFloatField;
    qryContabilLACTIPCONVGEREN2: TStringField;
    qryContabilLACVALGEREN2: TFloatField;
    qryContabilLACATOUTMOEDA: TStringField;
    qryContabilLACORIGEMAPLIC: TStringField;
    qryContabilTIPCODIGO: TStringField;
    qryContabilIDELEMDEMONSTRAT: TFloatField;
    qryContabilCODCENTROCUSTO_1: TStringField;
    qryContabilPLNDATDIA: TDateTimeField;
    qryContabilIDPESSJUR: TFloatField;
    qryContabilIDPLANOPREV: TFloatField;
    updContabil: TUpdateSQL;
    qryDocumentos: TwwQuery;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosPLANO: TFloatField;
    qryDocumentosPLACONTA: TStringField;
    qryDocumentosPLNCODIGO: TFloatField;
    qryDocumentosNUMLANCTO: TFloatField;
    qryDocumentosUNIDNEGOC: TFloatField;
    qryDocumentosCODCENTRORESPON: TStringField;
    qryDocumentosCODTIPRECDES: TStringField;
    qryDocumentosVALOR: TFloatField;
    qryDocumentosIDPESSJUR: TFloatField;
    qryDocumentosIDPLANOPREV: TFloatField;
    qryDocumentosFLGDEVOLUCAO: TFloatField;
    updDocumentos: TUpdateSQL;
    qryContribNucleo: TwwQuery;
    qryBenefNucleo: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAPrev: TdtmAPrev;

implementation

{$R *.DFM}

end.
