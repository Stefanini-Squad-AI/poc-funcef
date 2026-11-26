// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Autor(a)    : Renato Visoni
//Data        : 07/04/2010
//Pendência   : SOL 115181 Kintana 544277
//Descricao   : Criação da Funcionalidade "Calculos IRRF Regressivo"
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ---//---
//  Data       : 08.11.2004
//  Descrição  : Criação do componente qryRateio
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : ---//---
//  Data       : 11.08.2004
//  Descrição  : criação do componente qryContribPrevPartp
//------------------------------------------------------------------------------
unit DAPrev;


interface
                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, URegra, ppEndUsr, ppBands, ppCtrls, ppClass,
  ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppDBBDE, Wwdatsrc, MontaSelect;

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
    qryTransfPlano: TwwQuery;
    qryContribPrevPartp: TwwQuery;
    qryRateio: TwwQuery;
    qryReservaXPlano: TwwQuery;
    qryReservaXPlanoNOME: TStringField;
    qryAux3: TwwQuery;
    MSBenef: TMontaSelect;
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
