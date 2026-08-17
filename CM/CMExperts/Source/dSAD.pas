unit dSAD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Wwquery;

type
  TdmSAD = class(TDataModule)
    dbSAD: TDatabase;
    qryGerador: TwwQuery;
    qry: TwwQuery;
    dbINT: TDatabase;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
  end;

var
  dmSAD: TdmSAD;

implementation

Uses uCMOracleInt;
{$R *.DFM}

procedure TdmSAD.DataModuleCreate(Sender: TObject);
begin
  TCMOracleInt.AddAlias('PREVSEGUR','CMDB1A','1521','PREVSUPR',True);
  Application.ProcessMessages;
  TCMOracleInt.AddAlias('PREVINT','CMDB1A','1521','PREVINT',True);
  Application.ProcessMessages;  
end;

end.
