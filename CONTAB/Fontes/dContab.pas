unit dContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TDtmContab = class(TDataModule)
    sqlMoedaCorrente: TCMSqlParams;
    cdsMoedaCorrente: TCMClientDataSet;
    sqlVerificaBloqueados: TCMSqlParams;
    cdsVerificaBloqueados: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmContab: TDtmContab;

implementation

{$R *.DFM}

end.
