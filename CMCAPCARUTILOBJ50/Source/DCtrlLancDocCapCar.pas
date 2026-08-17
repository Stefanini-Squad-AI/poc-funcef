unit DCtrlLancDocCapCar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TDtmCtrlLancDocCapCar = class(TDataModule)
    SQLRateio: TCMSqlParams;
    CdsRateio: TCMClientDataSet;
    SqlUpdValorCompromisso: TCMSqlParams;
    SQLDocImposto: TCMSqlParams;
    CdsDocImposto: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.
