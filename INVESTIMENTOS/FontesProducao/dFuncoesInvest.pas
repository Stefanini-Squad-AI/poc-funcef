unit dFuncoesInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;
  
type
  TdtmFuncoesInvest = class(TDataModule)
    QryPadraoIR: TwwQuery;
    QryPadraoIROPE: TwwQuery;
    QryPadraoIRMer: TwwQuery;
    QryIOF: TwwQuery;
    QryPadraoIROPEALIQUOTA: TFloatField;
    QryPadraoIRALIQUOTA: TFloatField;
    QryPadraoIRMerALIQUOTA: TFloatField;
    QryProvIRRV: TwwQuery;
    QryProvIRRVFLGPROVISIONAIR: TStringField;
    QryParamInvest: TwwQuery;
    QryParamInvestFLGPROVISIONAIRRF: TStringField;
    QryParamInvestFLGPROVISIONAIRRV: TStringField;
    QryProvIRRF: TwwQuery;
    QryProvIRRFFLGPROVISIONAIR: TStringField;
    QryDeleteSaldoLitigio: TwwQuery;
    QryDeleteLitigio: TwwQuery;
    QrySelectIRLitigio: TwwQuery;
    QrySaldoLitigio: TwwQuery;
    QryTrataIndice: TwwQuery;
    QryOrigemIRLitigio: TwwQuery;
    QrySumSaldoAntRF: TwwQuery;
    QryParamInvestMOEDAATULIT: TFloatField;
    QryParamInvestMOECODIGO: TFloatField;
    QryTrataIndiceDESCTRATAIND: TStringField;
    DsSaldoIrLitigio: TwwDataSource;
    QrySumSaldoAtuRF: TwwQuery;
    QrySumSaldoAntRV: TwwQuery;
    QrySumSaldoAtuRV: TwwQuery;
    QryAux: TwwQuery;
    QrySaldoLitigioPLNCODIGO: TFloatField;
    QryInsertSaldoIrLitigio: TwwQuery;
    QrySelectIRLitigioVLRIRLITIGIO: TFloatField;
    QrySaldoLitigioPLANO: TFloatField;
    QryPlanoPatroPlanoPrev: TwwQuery;
    QryPlanoPatroPlanoPrevPLANO: TFloatField;
    QryPlanoPatroPlanoPrevIDPLANOPREV: TFloatField;
    QryPlanoPatroPlanoPrevIDPATROCINADORA: TFloatField;
    QrySelectIRLitigioPLANO: TFloatField;
    QryUpdateSaldoIrLitigio: TwwQuery;
    QryBuscaPUAtualizadoAnt: TwwQuery;
    UpdFluxoTitulo: TwwQuery;
    QryBuscaPUIncJuros: TwwQuery;
    QryBuscaPUIncJurosDATAFLUXO: TDateTimeField;
    QryBuscaPUIncJurosPERCINCJUROS: TFloatField;
    QryBuscaPUPgJuros: TwwQuery;
    QryBuscaPUAmort: TwwQuery;
    QryBuscaPUPgJurosDATAFLUXO: TDateTimeField;
    QryBuscaPUPgJurosPERCPGJUROS: TFloatField;
    QryBuscaPUAmortDATAFLUXO: TDateTimeField;
    QryBuscaPUAmortPERCAMORT: TFloatField;
    QryBuscaPUAtualizadoAntDATA: TDateTimeField;
    QryBuscaPUAtualizadoAntPUATUALIZADO: TFloatField;
    QryBuscaPUAtualizadoAntPUINFORMADO: TFloatField;
    QryBuscaPUAmortSUMPERCAMORT: TFloatField;
    QryBuscaPUAtualizadoAntPERCAMORT: TFloatField;
    QrySelAtuFluxoTitulo: TwwQuery;
    QrySelAtuFluxoTituloCODDOCUMENTO: TFloatField;
    QrySelAtuFluxoTituloPLNCODIGO: TFloatField;
    QrySelAtuFluxoTituloPLANO: TFloatField;
    QryDelAtuFluxoTitulo: TwwQuery;
    QryBuscaAliqCPMF: TwwQuery;
    FloatField1: TFloatField;
    QryInsertLitigio: TwwQuery;
    QryBuscaDataFluxoTitulo: TwwQuery;
    QryBuscaFluxoTitulo: TwwQuery;
    qryDelIrLitigioTrim: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmFuncoesInvest: TdtmFuncoesInvest;

implementation

{$R *.DFM}

end.
