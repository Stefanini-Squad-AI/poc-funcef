unit uRegTotalPrev;

interface

Uses Classes, uConsPart, dsgnintf, DbTables,  Forms;

Type
  TCMDatabaseNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CM', [TConsPart]);

  RegisterPropertyEditor(TypeInfo(String),
                         TConsPart, 'DataBaseName', TCMDataBaseNameProperty);

end;

function TCMDatabaseNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TCMDatabaseNameProperty.GetValues(Proc: TGetStrProc);
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


end.
