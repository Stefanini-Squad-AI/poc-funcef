unit dCds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, uCMClientDataSet, uCmSqlParams, DBTables, Wwquery;

type
  TdmCds = class(TDataModule)
    sql: TCMSqlParams;
    Cds: TCMClientDataSet;
    Qry: TwwQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCds: TdmCds;

implementation

{$R *.DFM}

end.
