// Alterações:
{ --------------------------------------------------------------------------------------------------
Query     : SQLValLote
Data      : 22/09/2004
Autor     : André Tavares
Pendência : 17753
Descrição : acerto na query para não fazer produto carteziano.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Query     : SQLRptConciliaCpmf
Data      : 24/05/2004
Autor     : André Tavares
Pendência : 15373, 15374
Descrição : utilização do campo codexterno para centro de custo e centro de responsabilidade.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Query     : SQLValManual, SQLRateioManual, SQLRateioManualPar, SQLDocsManual
Data      : 26/04/2004
Autor     : Alex Pereira                                                                        
Pendência : 16220 - Implementar a CPMF em lança e baixa simultânea
Descrição : Colocado no filtro da query a operação 10 - lança e baixa simultânea
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SQLValManual )
Data      : 02/07/2003
Autor     : André Pontes
Descrição : Query estava fazendo multiplicando o valor do documento pelo nº de faixas de CPMF
            (FaixaTipoAgeg) - ver abaixo.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - ( SQLValLote )
Data      : 02/07/2003
Autor     : André Pontes
Descrição : Query estava fazendo multiplicando o valor do lote pelo nº de faixas de CPMF (FaixaTipoAgeg)
            Criado join com LotePagto e comparada data do lote com a dataini e datafim da FaixaTipoAgeg
---------------------------------------------------------------------------------------------------}

unit DConciliaCPMFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams, DBClient, Provider, Db, DBTables, Wwquery, Wwdatsrc, ppDB,
  ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppRegion, ppClass, ppVar, ppStrtch,
  ppMemo, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXComp, TXRB,
  ZipMstr, wwclient, uCMClientDataSet;

type
  TDtmConciliaCPMFMT = class(TDataModule)
    CdsDocs: TCMClientDataSet;
    CdsRateioDocs: TCMClientDataSet;
    CdsRateioDocsCODDOCUMENTO: TFloatField;
    CdsRateioDocsCODTIPRECDES: TStringField;
    CdsRateioDocsCODCENTROCUSTO: TStringField;
    CdsRateioDocsIDPROGRAMA: TFloatField;
    CdsRateioDocsVALOR: TFloatField;
    CdsRateioDocsVLRPREVISTO: TFloatField;
    CdsRateioDocsVLREFETIVO: TFloatField;
    CdsRateioDocsRATEIO_DESCRICAORD: TStringField;
    CdsRateioDocsRATEIO_NOMECC: TStringField;
    CdsRateioDocsRATEIO_NOMEPRG: TStringField;
    SQLDocsManual: TCMSqlParams;
    SQLDocsTransf: TCMSqlParams;
    SQLRateioDocsLote: TCMSqlParams;
    SQLRateioManual: TCMSqlParams;
    SQLRateioManualParc: TCMSqlParams;
    SQLRateioDocsLoteParc: TCMSqlParams;
    RptConsAnalCpmf: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel10: TppLabel;
    MemTituloAnal: TppMemo;
    ppDetailBand2: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine6: TppLine;
    ppLabel24: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText26: TppDBText;
    ppLabel25: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLabel27: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel22: TppLabel;
    ppLabel21: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel18: TppLabel;
    ppLabel11: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppLabel26: TppLabel;
    ppGroup5: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    RptConciliaCpmf: TppReport;
    HeaderBand1: TppHeaderBand;
    LblEmpresa: TppLabel;
    RptConciliaCpmfRegion1: TppRegion;
    Line1: TppLine;
    RptConciliaCpmfLine1: TppLine;
    RptConciliaCpmfLabel4: TppLabel;
    RptConciliaCpmfLabel5: TppLabel;
    RptConciliaCpmfLabel6: TppLabel;
    RptConciliaCpmfLabel7: TppLabel;
    RptConciliaCpmfLabel8: TppLabel;
    RptConciliaCpmfLabel9: TppLabel;
    MemTitulo: TppMemo;
    DetRateio: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    FooterBand1: TppFooterBand;
    Line2: TppLine;
    LblSistema: TppLabel;
    Calc2: TppSystemVariable;
    Calc1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLabel28: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    RptConciliaCpmfGroup1: TppGroup;
    RptConciliaCpmfGroupHeaderBand1: TppGroupHeaderBand;
    RptConciliaCpmfDBText1: TppDBText;
    RptConciliaCpmfLabel1: TppLabel;
    RptConciliaCpmfGroupFooterBand1: TppGroupFooterBand;
    GrpNumlote: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    RptConciliaCpmfDBText2: TppDBText;
    RptConciliaCpmfDBText3: TppDBText;
    RptConciliaCpmfDBText4: TppDBText;
    RptConciliaCpmfDBText5: TppDBText;
    RptConciliaCpmfDBText6: TppDBText;
    RptConciliaCpmfDBText7: TppDBText;
    RgTituloDocs: TppRegion;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape2: TppShape;
    ppGroupFooterBand2: TppGroupFooterBand;
    GrpCodDocumento: TppGroup;
    GrDocumento: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    RgTituloRateio: TppRegion;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel12: TppLabel;
    DbtPrevDoc: TppDBText;
    DbtPrevEfetivo: TppDBText;
    GfoterDocumento: TppGroupFooterBand;
    LblTotDoc: TppLabel;
    EdtSumEfet: TppDBCalc;
    EdtSumPrev: TppDBCalc;
    EdtSumValor: TppDBCalc;
    LineSum: TppLine;
    EdtDoc: TppDBText;
    EdtData: TppDBText;
    EdtRazaoSoc: TppDBText;
    PpConciliaCpmf: TppBDEPipeline;
    PpConciliaCpmfppField1: TppField;
    PpConciliaCpmfppField2: TppField;
    PpConciliaCpmfppField3: TppField;
    PpConciliaCpmfppField4: TppField;
    PpConciliaCpmfppField5: TppField;
    PpConciliaCpmfppField6: TppField;
    PpConciliaCpmfppField7: TppField;
    PpConciliaCpmfppField8: TppField;
    PpConciliaCpmfppField9: TppField;
    PpConciliaCpmfppField10: TppField;
    PpConciliaCpmfppField11: TppField;
    PpConciliaCpmfppField12: TppField;
    PpConciliaCpmfppField13: TppField;
    PpConciliaCpmfppField14: TppField;
    PpConciliaCpmfppField15: TppField;
    PpConciliaCpmfppField16: TppField;
    PpConciliaCpmfppField17: TppField;
    PpConciliaCpmfppField18: TppField;
    PpConciliaCpmfppField19: TppField;
    PpConciliaCpmfppField20: TppField;
    PpConciliaCpmfppField21: TppField;
    PpConciliaCpmfppField22: TppField;
    PpConciliaCpmfppField23: TppField;
    PpConciliaCpmfppField24: TppField;
    PpConciliaCpmfppField25: TppField;
    PpConciliaCpmfppField26: TppField;
    PpConciliaCpmfppField27: TppField;
    PpConciliaCpmfppField28: TppField;
    PpConciliaCpmfppField29: TppField;
    PpConciliaCpmfppField30: TppField;
    PpConciliaCpmfppField31: TppField;
    DsConciliaCpmf: TwwDataSource;
    CdsRptConciliaCpmf: TCMClientDataSet;
    RptSintetico: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel29: TppLabel;
    ppRegion1: TppRegion;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel39: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText36: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine9: TppLine;
    ppLabel36: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel37: TppLabel;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppGroup4: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppDBText27: TppDBText;
    ppLabel38: TppLabel;
    ppGroupFooterBand5: TppGroupFooterBand;
    PpRptSintetico: TppBDEPipeline;
    SQLRptConciliaCpmf: TCMSqlParams;
    CdsResultado: TwwClientDataSet;
    CdsResultadoCODTIPRECDES: TStringField;
    CdsResultadoDESCRICAO: TStringField;
    CdsResultadoANASINT: TStringField;
    CdsResultadoCODCENTROCUSTO: TStringField;
    CdsResultadoNOME: TStringField;
    CdsResultadoDESCPROGRAMA: TStringField;
    DsDados: TDataSource;
    PpDados: TppDBPipeline;
    RptDados: TppReport;
    HbnAuditoria: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    FbdAuditoria: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ExoDados: TExtraOptions;
    SQLTrdxCCxImposto: TCMSqlParams;
    SQLResultado: TCMSqlParams;
    SQLTipoRecebDesemb: TCMSqlParams;
    SQLCCust: TCMSqlParams;
    SQLPrograma: TCMSqlParams;
    CdsTrdxCCxImposto: TCMClientDataSet;
    CdsTipoRecebDesemb: TCMClientDataSet;
    CdsCCust: TCMClientDataSet;
    CdsPrograma: TCMClientDataSet;
    SQLUpdFaixaAgreg: TCMSqlParams;
    SQLValManual: TCMSqlParams;
    SQLValLote: TCMSqlParams;
    CdsValManual: TCMClientDataSet;
    CdsValLote: TCMClientDataSet;
    SQLDocs: TCMSqlParams;
    SQLRateioDocs: TCMSqlParams;
    SQLLoteImposto: TCMSqlParams;
    CdsLoteImposto: TCMClientDataSet;
    SQLDocsBaixaLote: TCMSqlParams;
    CdsDocsBaixaLote: TCMClientDataSet;
    CdsVerArredBaixa: TCMClientDataSet;
    SQLVerArredBaixa: TCMSqlParams;
    SQLUpdDocLote: TCMSqlParams;
    SQLExecUpdDocLote: TCMSqlParams;
    CdsUpdDocLote: TCMClientDataSet;
    SQLExecUpdDocManual: TCMSqlParams;
    SQLUpdDocManual: TCMSqlParams;
    CdsUpdDocManual: TCMClientDataSet;
    SQLUpdImpostoManual: TCMSqlParams;
    ExecUpdImpostoManual: TCMSqlParams;
    CdsUpdImpostoManual: TCMClientDataSet;
    ExecUpdImposto: TCMSqlParams;
    SQLUpdImposto: TCMSqlParams;
    CdsUpdImposto: TCMClientDataSet;
    CdsResultadoCODEXTERNO: TStringField;
    sqlDocsLote: TCMSqlParams;
    procedure LblSistemaPrint(Sender: TObject);
    procedure LblEmpresaPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmConciliaCPMFMT: TDtmConciliaCPMFMT;

implementation

{$R *.DFM}

Uses uSistema;

procedure TDtmConciliaCPMFMT.LblSistemaPrint(Sender: TObject);
begin
  If (Sender is TppLabel) Then
     (Sender as TppLabel).Caption := Sistema.NomeModulo + ' - ' + Sistema.Versao;
end;

procedure TDtmConciliaCPMFMT.LblEmpresaPrint(Sender: TObject);
begin
  If (Sender is TppLabel) Then
     (Sender as TppLabel).Caption := Sistema.NomeEmpresa;
end;

end.
