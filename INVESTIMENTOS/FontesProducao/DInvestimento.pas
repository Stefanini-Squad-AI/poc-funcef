unit DInvestimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  URegra, Db, DBTables, Wwquery;

type
  TdtmInvestimentos = class(TDataModule)
    qrySaldoCaixa: TwwQuery;
    qrySaldoCaixaIDCARTEIRAXEVENTO: TFloatField;
    qrySaldoCaixaIDCARTEIRAINVEST: TFloatField;
    qrySaldoCaixaIDCARTEIRAGERENC: TFloatField;
    qrySaldoCaixaSALDOCAIXA: TFloatField;
    qryInsereHistCaixa: TwwQuery;
    qrySaldoCarteira: TwwQuery;
    qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField;
    qrySaldoCarteiraIDCARTEIRAGERENC: TFloatField;
    qrySaldoCarteiraSALDOCARTEIRA: TFloatField;
    qryCarteiraEventoCota: TwwQuery;
    qryCarteiraEventoCotaIDCARTEIRAXEVENTO: TFloatField;
    qryCarteiraEventoCotaIDCARTEIRAINVEST: TFloatField;
    qryCarteiraEventoCotaIDCARTEIRAGERENC: TFloatField;
    qryCarteiraEventoCotaIDEVENTOCAIXACOTA: TFloatField;
    qryCarteiraEventoCotaDESCCAIXACOTA: TStringField;
    qryCarteiraEventoCotaIDTIPOOPERACAO: TFloatField;
    qryCarteiraEventoCotaIDTIPOINVEST: TFloatField;
    qryCarteiraEventoCotaSTACAIXA: TStringField;
    qryCarteiraEventoCotaSTASOMADIMINUI: TStringField;
    qryCarteiraEventoCotaSTACOTA: TStringField;
    qryCarteiraEventoCotaSTAATIVOPASSIVO: TStringField;
    qryCarteiraEventoCotaSTACOTIZA: TStringField;
    qryCarteiraEventoCotaIDREGRA: TFloatField;
    qryCarteiraEventoCotaDESCCARTEIRA: TStringField;
    qryBuscaHistCota: TwwQuery;
    qryBuscaHistCotaVLRHISTCOTA: TFloatField;
    qryInsereHistCota: TwwQuery;
    RegraCota: TRegra;
    qryInsereHistProvisao: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmInvestimentos: TdtmInvestimentos;

implementation

{$R *.DFM}

end.
