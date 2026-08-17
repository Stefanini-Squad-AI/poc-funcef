unit dCds;

interface         
                                     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBClient,
  uCMClientDataSet, uCmSqlParams, DBTables, Wwquery, CmErroDialiog;

type
  TdmCds = class(TDataModule)
    sql: TCMSqlParams;
    Cds: TCMClientDataSet;
    CmErroDlg: TCmErroDialiog;
  end;

var
  dmCds: TdmCds;

implementation

{$R *.DFM}

end.


