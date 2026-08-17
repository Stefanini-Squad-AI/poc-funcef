unit DCapCarObj;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
