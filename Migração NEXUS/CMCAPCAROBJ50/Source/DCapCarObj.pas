unit DCapCarObj;

{
--------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Integração Orçamento - Inclusão das rotinas
-------------------------------------------------------------------------------------------------- }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCmSqlParams, uCMClientDataSet;

type
  TDtmCapCarObj = class(TDataModule)
    SqlLancEstornoDoc: TCMSqlParams;
    CdsLancEstorno: TClientDataSet;
    SqlLancEstornoLanc: TCMSqlParams;
    SQLEstornoFinanc: TCMSqlParams;
    CdsEstornoFinanc: TClientDataSet;
    SQLRateioFinanc: TCMSqlParams;
    CdsRateioFinanc: TClientDataSet;
    SQLUpdLancEstorno: TCMSqlParams;
    SQLNumDiasVencto: TCMSqlParams;
    SQLOperFuncDiasVencto: TCMSqlParams;
    SQLAutorizaDiasVencto: TCMSqlParams;
    SQLNumApGr: TCMSqlParams;
    SQLBuscaContaAlt: TCMSqlParams;
    SQLSubContaDoc: TCMSqlParams;
    SQLTestaSubConta: TCMSqlParams;
    CdsTestaSubConta: TClientDataSet;
    CdsSubContaDoc: TClientDataSet;
    CdsBuscaContaAlt: TClientDataSet;
    SqlBuscaParamBaixa: TCMSqlParams;
    CdsBuscaParamBaixa: TClientDataSet;
    SqlParamDocs: TCMSqlParams;
    CdsParamDocs: TClientDataSet;
    SqlDadosDelImpLanc: TCMSqlParams;
    CdsDadosDelImpLanc: TClientDataSet;
    SQLDadosDelOrc: TCMSqlParams;
    CdsDadosDelOrc: TClientDataSet;
    SqlDadosDelLote: TCMSqlParams;
    CdsDadosDelLote: TClientDataSet;
    SqlSelLanc: TCMSqlParams;
    CdsSelLanc: TClientDataSet;
    SQLContabAltBaixa: TCMSqlParams;
    CdsContabAltBaixa: TCMClientDataSet;
    sqlValidaDoc: TCMSqlParams;
    SqlDocumxDocum: TCMSqlParams;
    CdsDocumxDocum: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
