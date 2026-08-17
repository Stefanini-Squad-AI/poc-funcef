unit DCtrlDocCapCar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBClient,
  uCMClientDataSet, uCmSqlParams;

type
  TDtmCtrlDocCapCar = class(TDataModule)
    SQLRateio: TCMSqlParams;
    CdsRateio: TCMClientDataSet;
    SqlUpdValorCompromisso: TCMSqlParams;
    SQLDocImposto: TCMSqlParams;
    CdsDocImposto: TCMClientDataSet;
    SqlPortForma: TCMSqlParams;
    CdsPortForma: TCMClientDataSet;
  end;

implementation

{$R *.DFM}

end.
