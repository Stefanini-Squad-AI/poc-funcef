{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit CMDatabase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, db, DBConsts, bdeconst;

type
  TCMDatabase = class(TDatabase)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure AplicaUpdates(const DataSets: array of TDBDataSet);
  published
    { Published declarations }
  end;

implementation

procedure TCMDatabase.AplicaUpdates(const DataSets: array of TDBDataSet);
var
  I: Integer;
begin
  StartTransaction;
  try
     for I := 0 to High(DataSets) do
     begin
         if DataSets[I].Database = Self then
            DataSets[I].ApplyUpdates;
     end;

     Commit;

     for I := 0 to High(DataSets) do
         if DataSets[I].Database = Self then
            DataSets[I].CommitUpdates;
  except
        Rollback;
        raise;
  end;
end;

end.
