unit IvBDEReg;

{$I IVMULTI.INC}

interface

procedure Register;

implementation

uses
  Classes, DsgnIntf, DB, DBTables, TypInfo,
  IvCommon, IvDBMult;


{ TIvDatabaseNameProperty }

type
  TIvDatabaseNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TIvDatabaseNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;

procedure TIvDatabaseNameProperty.GetValues(Proc: TGetStrProc);
var
  list: TStringList;
  i: Integer;
begin
  list := TStringList.Create;
  Session.GetDatabaseNames(list);

  for i := 0 to list.Count - 1 do
    Proc(list[i]);

  list.Free;
end;


{ TIvTableNameProperty }

type
  TIvTableNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TIvTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;

procedure TIvTableNameProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  list: TStringList;
begin
  list := TStringList.Create;
  Session.GetTableNames(
    (GetComponent(0) as TIvDBDictionary).DatabaseName,
    '',
    True,
    False,
    list);
  for i := 0 to list.Count - 1 do
    Proc(list[i]);
  list.Free;
end;


{ TIvTableTypeProperty }

type
  TIvTableTypeProperty = class(TEnumProperty)
  public
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure TIvTableTypeProperty.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  EnumType: PTypeInfo;
begin
  EnumType := GetPropType;
  with GetTypeData(EnumType)^ do
    for I := MinValue to MaxValue - 1 do
{$IFDEF WIN32}
      Proc(GetEnumName(EnumType, I));
{$ELSE}
      Proc(GetEnumName(EnumType, I)^);
{$ENDIF}
end;

procedure Register;
begin
  RegisterComponents(ML_SHEET_C, [TIvDBDictionary]);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvDBDictionary,
    'LanguageTableName',
    TIvTableNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvDBDictionary,
    'LocaleTableName',
    TIvTableNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvDBDictionary,
    'DatabaseName',
    TIvDatabaseNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvDBDictionary,
    'TableType',
    TIvTableTypeProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvDBDictionary,
    'TableName',
    TIvTableNameProperty);
end;

end.
