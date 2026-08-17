unit dMTBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uCmSqlParams;

type
  TdtmMTBem = class(TDataModule)
    sqlSaldoContabBem          : TCMSqlParams;
    sqlMovContabBem            : TCMSqlParams;
    sqlSldCtbBemxDep           : TCMSqlParams;
    sqlMovTransf               : TCMSqlParams;
    sqlRateioPatroxBem         : TCMSqlParams;
    sqlBemxDep                 : TCMSqlParams;
    sqlDeprecBemxDep           : TCMSqlParams;
    sqlDeprecBemxMoeda         : TCMSqlParams;
    sqlDeprecBem               : TCMSqlParams;
    sqlDeprecReavalxDep        : TCMSqlParams;
    sqlDeprecReavalxMoeda      : TCMSqlParams;
    sqlDeprecReavaliacao       : TCMSqlParams;
    sqlDeprecAcrescValorxDep   : TCMSqlParams;
    sqlDeprecAcrescValorxMoeda : TCMSqlParams;
    sqlDeprecAcrescimoValor    : TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
