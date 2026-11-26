unit DCmBackImposto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, CMwwQuery, Wwdatsrc, Wwquery;

type
  TDtmCmBackImposto = class(TDataModule)
    Qry: TwwQuery;
    QrySimulaImposto: TwwQuery;
    QrySimulaImpostoIDIMPOSTO: TFloatField;
    QrySimulaImpostoVALORIMPOSTO: TFloatField;
    QrySimulaImpostoPERCIMPOSTO: TFloatField;
    QrySimulaImpostoVALORBASE: TFloatField;
    UpdSimulaImposto: TUpdateSQL;
    QryDadosLancImpPag: TwwQuery;
    QryDadosLancImpPagDESCCUSTAGREG: TStringField;
    QryDadosLancImpPagCODTIPDOC: TFloatField;
    QryDadosLancImpPagCODTIPRECDES: TStringField;
    QryDadosLancImpPagRECPAG: TStringField;
    QryDadosLancImpPagCODCENTRORESPON: TStringField;
    QryDadosLancImpPagUNIDNEGOC: TFloatField;
    QryDadosLancImpPagIDFORCLI: TFloatField;
    QryDadosLancImpPagCODSUBCONTACONTAB: TFloatField;
    QryDadosLancImpPagUNIDNEGOCCONTAB: TFloatField;
    QryDadosLancImpPagCODCENTROCUSTO: TStringField;
    QryDadosLancImpPagPLANO: TFloatField;
    QryDadosLancImpPagPLACONTA: TStringField;
    QryDadosLancImpPagCONTACLIFOR: TStringField;
    QryDadosLancImpPagCCUSTOCLIFOR: TStringField;
    QryDadosLancImpPagUNIDNEGOCCLIFOR: TFloatField;
    QryDadosLancImpPagSUBCONTACLIFOR: TFloatField;
    QryDadosLancImpPagRAZAOSOCIAL: TStringField;
    QryDadosLancImpRec: TwwQuery;
    QryDadosLancImpRecDESCCUSTAGREG: TStringField;
    QryDadosLancImpRecCODTIPDOC: TFloatField;
    QryDadosLancImpRecCODTIPRECDES: TStringField;
    QryDadosLancImpRecRECPAG: TStringField;
    QryDadosLancImpRecCODCENTRORESPON: TStringField;
    QryDadosLancImpRecUNIDNEGOC: TFloatField;
    QryDadosLancImpRecIDFORCLI: TFloatField;
    QryDadosLancImpRecCODSUBCONTACONTAB: TFloatField;
    QryDadosLancImpRecUNIDNEGOCCONTAB: TFloatField;
    QryDadosLancImpRecCODCENTROCUSTO: TStringField;
    QryDadosLancImpRecPLANO: TFloatField;
    QryDadosLancImpRecPLACONTA: TStringField;
    QryDadosLancImpRecCONTACLIFOR: TStringField;
    QryDadosLancImpRecCCUSTOCLIFOR: TStringField;
    QryDadosLancImpRecUNIDNEGOCCLIFOR: TFloatField;
    QryDadosLancImpRecSUBCONTACLIFOR: TFloatField;
    QryDadosLancImpRecRAZAOSOCIAL: TStringField;
    DsDadosLancImp: TwwDataSource;
    QryImposto: TwwQuery;
    QryImpostoCODTIPOCUSTAGREG: TFloatField;
    QryImpostoFLGACUMULA: TStringField;
    QryImpostoVLRABATFIXO: TFloatField;
    QryImpostoFLGTIPOCALC: TStringField;
    QryImpostoCODALTERADOR: TFloatField;
    QryImpostoVLRMINIMO: TFloatField;
    QryImpostoDESCCUSTAGREG: TStringField;
    QryImpostoVALPORDEPENDENTE: TFloatField;
    QryImpostoLANCAMENTOIMPOSTO: TStringField;
    QryImpostoCODTRATFISCD: TStringField;
    QryImpostoFLGCALCVALBRUTO: TStringField;
    QryImpostoACRESDECRES: TStringField;
    QryImpostoFLGLANCAIMPOSTO: TStringField;
    QryImpostoVALORIMPOSTO: TFloatField;
    QryImpostoFLGALTERARETENCAO: TStringField;
    QryFaixaImposto: TwwQuery;
    QryFaixaImpostoVLRINICIALFAIXA: TFloatField;
    QryFaixaImpostoVLRFINALFAIXA: TFloatField;
    QryFaixaImpostoVLRABATVALOR: TFloatField;
    QryFaixaImpostoVLRABATCALC: TFloatField;
    QryFaixaImpostoPERCCUSTAGREG: TFloatField;
    QryFaixaImpostoVLRFIXO: TFloatField;
    QryFaixaImpostoPERCBASE: TFloatField;
    QryBaseMes: TwwQuery;
    QryBaseMesVALORBASE: TFloatField;
    QryBaseMesVALORRETIDO: TFloatField;
    QryAtuImpostoRetido: TwwQuery;
    QryImpParcEngob: TwwQuery;
    QryImpParcEngobCODDOCUMENTO: TFloatField;
    QryImpParcEngobVALOR: TFloatField;
    QryImpParcEngobVLRLIQUIDO: TFloatField;
    QryCalculaRateioImp: TwwQuery;
    QryCalculaRateioImpVALORIMPOSTO: TFloatField;
    QryCalculaRateioImpCODTIPRECDES: TStringField;
    QryCalculaRateioImp3: TwwQuery;
    QryCalculaRateioImp3VALORIMPOSTO: TFloatField;
    QryCalculaRateioImp3CODTIPRECDES: TStringField;
    QryAltNumLanc: TwwQuery;
    QryRateioImposto3: TwwQuery;
    QryRateioImposto3DESCTDR: TStringField;
    QryRateioImposto3VALOR: TFloatField;
    QryRateioImposto3CODTIPRECDES: TStringField;
    QryRateioImposto: TwwQuery;
    QryRateioImpostoVALOR: TFloatField;
    QryRateioImpostoDESCRICAO: TStringField;
    QryRateioImpostoCODTIPRECDES: TStringField;
    DsRateio: TwwDataSource;
    QryClasFisRec: TwwQuery;
    QryClasFisRecIDCLASFISCLIFOR: TFloatField;
    QryClasFisPag: TwwQuery;
    QryClasFisPagIDCLASFISCLIFOR: TFloatField;
    DsClasFisCliFor: TwwDataSource;
    QryPortForma: TwwQuery;
    QryPortFormaIDFORCLI: TFloatField;
    QryPortFormaCONTACONTABIL: TStringField;
    QryPortFormaCODCENTROCUSTO: TStringField;
    QryPortFormaCODSUBCONTA: TFloatField;
    QryPortFormaUNIDNEGOC: TFloatField;
    QryImpostoPorDoc: TwwQuery;
    QryImpostoPorDocCODTIPOCUSTAGREG: TFloatField;
    QryImpostoPorDocFLGCALCVALBRUTO: TStringField;
    QryImpostoPorDocNUMLANCTO: TFloatField;
    QryAux: TwwQuery;
    QryLancAcumulaImposto: TwwQuery;
    QryImpostoFLGSEMPRECALCULA: TStringField;
    QryImpostoFLGCALCULAIMPOSTO: TStringField;
    procedure DtmImpostoDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

Uses
  uFuncaoGeral;

procedure TDtmCmBackImposto.DtmImpostoDestroy(Sender: TObject);
begin
  {}
end;

end.


