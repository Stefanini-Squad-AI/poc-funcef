unit CMwwQuery;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, WwQuery, uSistema, BdeConst;
  // DBCommon, Bde, SMIntf;
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
    {FDataSet: TBDEDataSet;
    FQueries: array[TUpdateKind] of TCMwwQuery;
    FSQLText: array[TUpdateKind] of TStrings;
    function GetQuery(UpdateKind: TUpdateKind): TCMwwQuery;
    function GetSQLIndex(Index: Integer): TStrings;
    procedure SetSQL(UpdateKind: TUpdateKind; Value: TStrings);
    procedure SetSQLIndex(Index: Integer; Value: TStrings);}
  protected
    {function GetSQL(UpdateKind: TUpdateKind): TStrings; override;
    function GetDataSet: TBDEDataSet; override;
    procedure SetDataSet(ADataSet: TBDEDataSet); override;
    procedure SQLChanged(Sender: TObject);}
  public
    {constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;}
    procedure Apply(UpdateKind: TUpdateKind); Override;
    procedure CMExecSQL(UpdateKind: TUpdateKind);    
    {procedure ExecSQL(UpdateKind: TUpdateKind);}
    {procedure SetParams(UpdateKind: TUpdateKind);
    property DataSet;
    property Query[UpdateKind: TUpdateKind]: TCMwwQuery read GetQuery;
    property SQL[UpdateKind: TUpdateKind]: TStrings read GetSQL write SetSQL;}
  published
    {property ModifySQL: TStrings index 0 read GetSQLIndex write SetSQLIndex;
    property InsertSQL: TStrings index 1 read GetSQLIndex write SetSQLIndex;
    property DeleteSQL: TStrings index 2 read GetSQLIndex write SetSQLIndex;}
  end;


implementation

Uses uDataBase;

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
     (Flag = dbfExecSQL) And
     (Value) And
     (Active) Then
  Begin
     If Prepared Then Unprepare;
     Prepare;
  End;

  Result := Inherited SetDBFlag(Flag,Value);
end;

{ TCMUpdateSql }

{constructor TCMUpdateSql.Create(AOwner: TComponent);
var
  UpdateKind: TUpdateKind;
begin
  inherited Create(AOwner);
  for UpdateKind := Low(TUpdateKind) to High(TUpdateKind) do
  begin
    FSQLText[UpdateKind] := TStringList.Create;
    TStringList(FSQLText[UpdateKind]).OnChange := SQLChanged;
  end;
end;

destructor TCMUpdateSql.Destroy;
var
  UpdateKind: TUpdateKind;
begin
  if Assigned(FDataSet) and (FDataSet.UpdateObject = Self) then
    FDataSet.UpdateObject := nil;
  for UpdateKind := Low(TUpdateKind) to High(TUpdateKind) do
    FSQLText[UpdateKind].Free;
  inherited Destroy;
end;}

procedure TCMUpdateSql.CMExecSQL(UpdateKind: TUpdateKind);
begin
  with Query[UpdateKind] do
  begin
    ExecSQL;
    if RowsAffected <> 1 then DatabaseError(SUpdateFailed);
  end;
end;

{function TCMUpdateSql.GetQuery(UpdateKind: TUpdateKind): TCMwwQuery;
begin
  if not Assigned(FQueries[UpdateKind]) then
  begin
    FQueries[UpdateKind] := TCMwwQuery.Create(Self);
    FQueries[UpdateKind].SQL.Assign(FSQLText[UpdateKind]);
    if (FDataSet is TDBDataSet) then
    begin
      FQueries[UpdateKind].SessionName := TDBDataSet(FDataSet).SessionName;
      FQueries[UpdateKind].DatabaseName := TDBDataSet(FDataSet).DataBaseName;
    end;
  end;
  Result := FQueries[UpdateKind];
end;

function TCMUpdateSql.GetSQL(UpdateKind: TUpdateKind): TStrings;
begin
  Result := FSQLText[UpdateKind];
end;

function TCMUpdateSql.GetSQLIndex(Index: Integer): TStrings;
begin
  Result := FSQLText[TUpdateKind(Index)];
end;

function TCMUpdateSql.GetDataSet: TBDEDataSet;
begin
  Result := FDataSet;
end;

procedure TCMUpdateSql.SetDataSet(ADataSet: TBDEDataSet);
begin
  FDataSet := ADataSet;
end;

procedure TCMUpdateSql.SetSQL(UpdateKind: TUpdateKind; Value: TStrings);
begin
  FSQLText[UpdateKind].Assign(Value);
end;

procedure TCMUpdateSql.SetSQLIndex(Index: Integer; Value: TStrings);
begin
  SetSQL(TUpdateKind(Index), Value);
end;

procedure TCMUpdateSql.SQLChanged(Sender: TObject);
var
  UpdateKind: TUpdateKind;
begin
  for UpdateKind := Low(TUpdateKind) to High(TUpdateKind) do
    if Sender = FSQLText[UpdateKind] then
    begin
      if Assigned(FQueries[UpdateKind]) then
      begin
        FQueries[UpdateKind].Params.Clear;
        FQueries[UpdateKind].SQL.Assign(FSQLText[UpdateKind]);
      end;
      Break;
    end;
end;

procedure TCMUpdateSql.SetParams(UpdateKind: TUpdateKind);
var
  I: Integer;
  Old: Boolean;
  Param: TParam;
  PName: string;
  Field: TField;
  Value: Variant;
begin
  if not Assigned(FDataSet) then Exit;
  with Query[UpdateKind] do
  begin
    for I := 0 to Params.Count - 1 do
    begin
      Param := Params[I];
      PName := Param.Name;
      Old := CompareText(Copy(PName, 1, 4), 'OLD_') = 0;
      if Old then System.Delete(PName, 1, 4);
      Field := FDataSet.FindField(PName);
      if not Assigned(Field) then Continue;
      if Old then Param.AssignFieldValue(Field, Field.OldValue) else
      begin
        Value := Field.NewValue;
        if VarIsEmpty(Value) then Value := Field.OldValue;
        Param.AssignFieldValue(Field, Value);
      end;
    end;
  end;
end;}

procedure TCMUpdateSql.Apply(UpdateKind: TUpdateKind);
begin
  SetParams(UpdateKind);
  CMExecSQL(UpdateKind);
end;

end.
