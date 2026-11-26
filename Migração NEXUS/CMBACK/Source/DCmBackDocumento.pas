unit DCmBackDocumento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, CMwwQuery, Wwquery;

type
  TDtmCmBackDocumento = class(TDataModule)
    QryInsertRateio: TwwQuery;
    QryUpdRateio: TwwQuery;
    QryDelRateio: TwwQuery;
    QryInsereDoc: TwwQuery;
    QryAlteraDoc: TwwQuery;
    QryValidaNumApGr: TwwQuery;
    QryValidaNumApGrNUMAPGR: TFloatField;
    Qry: TwwQuery;
    QryDelRateioDoc: TwwQuery;
    QryBuscaConta: TwwQuery;
    QryBuscaContaPLACONTA: TStringField;
    QryBuscaContaTrd: TwwQuery;
    QryBuscaContaTrdPLACONTA: TStringField;
    QryInsereLanc: TwwQuery;
    QryAlteraLanc: TwwQuery;
    QryTestaSubConta: TwwQuery;
    QryTestaSubContaPLASUBCONTA: TStringField;
    QryBuscaSubcDocumento: TwwQuery;
    QryBuscaSubcDocumentoCODSUBCONTA: TFloatField;
    QryResOrcamen: TwwQuery;
    QryUpdResOrcamen: TwwQuery;
    QryResOrcamenIDRESERVAORCAMEN: TFloatField;
    QryResOrcamenVLRRESORCAMEN: TFloatField;
    QryUpdValorCompromisso: TwwQuery;
    qryTestaRateioRad: TwwQuery;
    updValorProcessoRad: TwwQuery;
    QryDelRateioDocRecDes: TwwQuery;
    QryParamDocs: TwwQuery;
    QryBuscaParamBaixa: TwwQuery;
    QryDadosDelImpLanc: TwwQuery;
    QryDadosDelOrc: TwwQuery;
    QryDadosDelLote: TwwQuery;
    QrySelLanc: TwwQuery;
    QryRecuperaParamIntegra: TwwQuery;
    qryTipoDocRecPag: TwwQuery;
    QryGetTipoProcesso: TwwQuery;
    qryUsaRAD: TwwQuery;
    qryDocumento: TwwQuery;
    qryAtuRADDoc: TwwQuery;
    qryExcluirRAD: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmCmBackDocumento: TDtmCmBackDocumento;

implementation

Uses
  uFuncaoGeral;

{$R *.DFM}

end.
