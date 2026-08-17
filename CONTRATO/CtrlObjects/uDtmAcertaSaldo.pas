unit uDtmAcertaSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TdtmAcertaSaldo = class(TDataModule)
    sqlValorCorreto: TCMSqlParams;
    cdsValorCorreto: TCMClientDataSet;
    cdsValorCorreto1: TCMClientDataSet;
    cdsContaSaldo: TCMClientDataSet;
    sqlContaSaldo: TCMSqlParams;
    sqlValorCorreto1: TCMSqlParams;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmAcertaSaldo: TdtmAcertaSaldo;

implementation

{$R *.DFM}

end.
