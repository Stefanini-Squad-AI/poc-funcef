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
unit CMwwQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, WwQuery, uSistema, BdeConst;

type

{ TCMwwQuery }

  TCMwwQuery = class(TwwQuery)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure DoBeforeOpen; Override;
    function SetDBFlag(Flag: Integer; Value: Boolean): Boolean; override;
  public
    { Public declarations }
  published
    { Published declarations }
  end;

{ TCMUpdateSql }

  TCMUpdateSql = class(TUpdateSql {TSQLUpdateObject} )
  private

  protected

  public
    procedure Apply(UpdateKind: TUpdateKind); Override;
    procedure CMExecSQL(UpdateKind: TUpdateKind);
  published
  
  end;


implementation

Uses uDataBase, uCMTypes;

{ TCMwwQuery }

procedure TCMwwQuery.DoBeforeOpen;
begin
  inherited;
  If (not (csDesigning in ComponentState)) And
     (Sistema <> nil) And
     (Sistema.DriverServidor = DriverDB2) Then
  Begin
     If Prepared Then UnPrepare;
     Prepare;
  End;
end;

function TCMwwQuery.SetDBFlag(Flag: Integer; Value: Boolean): Boolean;
Begin
  If (not (csDesigning in ComponentState)) And
     (Sistema <> nil) And
     (Sistema.DriverServidor = DriverDB2) And
     (Flag In [dbfExecSQL,dbfOpened]) And
     (Value) And
     (Active) Then
  Begin
     If Prepared Then Unprepare;
     Prepare;
  End;

  Result := Inherited SetDBFlag(Flag,Value);
end;

{ TCMUpdateSql }

procedure TCMUpdateSql.CMExecSQL(UpdateKind: TUpdateKind);
begin
  with Query[UpdateKind] do
  begin
    ExecSQL;
    if RowsAffected <> 1 then DatabaseError(SUpdateFailed);
  end;
end;


procedure TCMUpdateSql.Apply(UpdateKind: TUpdateKind);
begin
  SetParams(UpdateKind);
  CMExecSQL(UpdateKind);
end;

end.
