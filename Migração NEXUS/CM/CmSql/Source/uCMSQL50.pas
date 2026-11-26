unit uCMSQL50;

interface

uses classes, dialogs, sysutils, SQLDB2, SQLORA, SQLMSSQL;

procedure ConverteSQL(SQL:TStrings);

Var
  {
   Var no DBTables iTipoBD_Padrao: Integer;
       0:  ORACLE
       1:  DB2
       2:  SQL Server BDE
       3:  SQL Server ODBC
  }
  
  iTipoBD_Padrao: Integer = 0; 

implementation

procedure ConverteSQL(SQL:TStrings);
begin
  Case iTipoBD_Padrao of
    0: ConverteOra( SQL );
    1: ConverteDb2( SQL );
    2, 3: ConverteSQLMS( SQL );
    4: ConverteSQLMS( SQL );
  End;
end;

end.
