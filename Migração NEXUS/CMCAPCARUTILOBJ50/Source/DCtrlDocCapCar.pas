unit DCtrlDocCapCar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TDtmCtrlDocCapCar = class(TDataModule)
    SQLRateio: TCMSqlParams;
    CdsRateio: TCMClientDataSet;
    SqlUpdValorCompromisso: TCMSqlParams;
    SQLDocImposto: TCMSqlParams;
    CdsDocImposto: TCMClientDataSet;
    SqlPortForma: TCMSqlParams;
    CdsPortForma: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

end.

