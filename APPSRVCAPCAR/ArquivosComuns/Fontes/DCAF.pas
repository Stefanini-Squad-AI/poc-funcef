unit DCAF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, DBClient;

type
  TdtmCAF = class(TDataModule)
    qryInsImovelxbem: TwwQuery;
    qryPlaca: TwwQuery;
    qryInsConjunto: TwwQuery;
    qryInsRateioDepreciacao: TwwQuery;
    qryInsertLancImovelxbem: TwwQuery;
    qryPlacaCOUNT: TFloatField;
    qryImovelXBem: TwwQuery;
    updImovelxBem: TUpdateSQL;
    qryDelLancImovelxBem: TwwQuery;
    qryDelImovelxBem: TwwQuery;
    qryDelConjunto: TwwQuery;
    qryDelRateioDepreciacao: TwwQuery;
    qryUpdImovel: TwwQuery;
    qryInsDesmembraImovel: TwwQuery;
    qryRateioDepreciacao: TwwQuery;
    qryRateioDepreciacaoIDCONJUNTO: TFloatField;
    qryRateioDepreciacaoCODCENTROCUSTO: TStringField;
    qryRateioDepreciacaoPARTICIPACAO: TFloatField;
    qryRateioDepreciacaoDTAFIM: TDateTimeField;
    qryInsImovel: TwwQuery;
    qryInsInvestimento: TwwQuery;
    qryDelImovel: TwwQuery;
    qryDelInvestimento: TwwQuery;
    qryDelDesmembraImovel: TwwQuery;
    qryLookAcrescimoValor: TwwQuery;
    qryLookAcrescimoValorIDACRESCIMO: TFloatField;
    qryLookAcrescimoValorIDMOVIMENTACAO: TFloatField;
    qryUpdObraLanc: TwwQuery;
    qryUpdStatusImovel: TwwQuery;
    qryInsTransferencia: TwwQuery;
    qryDelTransferencia: TwwQuery;
    qryInsReavalia: TwwQuery;
    qryDelReavalia: TwwQuery;
    qryReavalia: TwwQuery;
    qryReavaliaIDIMOVEL: TFloatField;
    qryReavaliaIDBEM: TFloatField;
    qryReavaliaIDREAVALIACAO: TFloatField;
    qryReavaliaDATAREAVALIACAO: TDateTimeField;
    qryReavaliaIMOVEL_ESTENSO: TStringField;
    qryReavaliaIDAVALIADOR: TFloatField;
    qryTransferencia: TwwQuery;
    qryTransferenciaIDMOVIMENTACAO: TFloatField;
    qryTransferenciaIDIMOVELORIG: TFloatField;
    qryTransferenciaIDIMOVELDEST: TFloatField;
    qryTransferenciaIDBEM: TFloatField;
    qryTransferenciaDATAMOVIMENTACAO: TDateTimeField;
    qryTransferenciaIDGRUPANT: TFloatField;
    qryTransferenciaIDCONJANT: TFloatField;
    qryTransferenciaIDLOCALANT: TFloatField;
    qryTransferenciaCODTIPIMOVELANT: TStringField;
    qryLookDesmembramento: TwwQuery;
    qryLookDesmembramentoDMRDATA: TDateTimeField;
    qryLookDesmembramentoIDIMOVELINI: TFloatField;
    qryLookDesmembramentoIDIMOVELFIM: TFloatField;
    qryLookDesmembramentoDMRPERCENT: TFloatField;
    qryLookDesmembramentoNOME_IMOVEL: TStringField;
    updDesmembramentos: TUpdateSQL;
    qryDesmembramentos: TwwQuery;
    qryDesmembramentosIDIMOVELINI: TFloatField;
    qryDesmembramentosIDIMOVELFIM: TFloatField;
    qryDesmembramentosDMRPERCENT: TFloatField;
    qryDesmembramentosPERC_ACUM: TFloatField;
    qryDesmembramentosDMRDATA: TDateTimeField;
    qryDesmembramentosNOME_IMOVEL: TStringField;
    qryImovelXBemIDIMOVEL: TFloatField;
    qryImovelXBemIDBEM: TFloatField;
    qryImovelXBemIXBPERCENT: TFloatField;
    qryImovelXBemIXBGRUPO: TStringField;
    qryImovelXBemIDGRUPO: TFloatField;
    qryImovelXBemIDCONJUNTO: TFloatField;
    qryImovelXBemDESBEM: TStringField;
    qryImovelXBemVLR_BEM: TFloatField;
    qryImovelXBemIMOVEL_EXTENSO: TStringField;
    qryImovelXBemCODTIPIMOVEL: TStringField;
    qryLookBem: TwwQuery;
    qryLookBemIDBEM: TFloatField;
    qryLookBemIDGRUPO: TFloatField;
    qryLookBemIDCONJUNTO: TFloatField;
    qryLookBemDESBEM: TStringField;
    qryImovelXBemIDLOCALIZACAO: TFloatField;
    qryImovelXBemIDRESPONSAVEL: TFloatField;
    qryLookObra: TwwQuery;
    qryLookObraIDCAFOBRA: TFloatField;
    qryLookObraIDPESSOA: TFloatField;
    qryLookObraIDGRUPO: TFloatField;
    qryLookObraCODSUBCONTA: TFloatField;
    qryLookObraUNIDNEGOC: TFloatField;
    qryLookObraDESCCAFOBRA: TStringField;
    qryLookObraDTAINICIOOBRA: TDateTimeField;
    qryLookObraDTAENCERRAOBRA: TDateTimeField;
    qryLookObraFLGOBRA: TFloatField;
    qryLookObraIDMODULO: TFloatField;
    qryLookObraIDTIPOCUSTORECIMO: TFloatField;
    qryLookObraIDIMOVEL: TFloatField;
    qryImovelXBemIMOCODIGO: TStringField;
    qryReavaliaObra: TwwQuery;
    qryReavaliaObraIDOBRALANC: TFloatField;
    qryReavaliaObraIDCAFOBRA: TFloatField;
    qryLookObraLanc: TwwQuery;
    qryLookObraReav: TwwQuery;
    qryLookObraReavIDIMOVEL: TFloatField;
    qryLookObraReavIDGRUPO: TFloatField;
    qryLookObraReavSALDO: TFloatField;
    qryLookObraReavIMOCODIGO: TStringField;
    qryLookObraReavTIPO: TStringField;
    qryDelAtivoCota: TwwQuery;
    qryImovelXBemNOME_GRUPO: TStringField;
    qryImovelXBemSEL_BEM: TFloatField;
    qryPlacaComPrefixo: TwwQuery;
    qryPlacaComPrefixoPLACA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmCAF: TdtmCAF;

implementation

{$R *.DFM}

end.
