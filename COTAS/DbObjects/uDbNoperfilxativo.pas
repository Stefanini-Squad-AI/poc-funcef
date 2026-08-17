unit uDbNoperfilxativo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbNoperfilxativo = class(TCmDbObject)

  private
    FIdnoperfilcota: TCmDbField;
    FIdnoperfilxativo: TCmDbField;
    FIdativocota: TCmDbField;
    procedure SetIdativocota(const Value: TCmDbField);
    procedure SetIdnoperfilcota(const Value: TCmDbField);
    procedure SetIdnoperfilxativo(const Value: TCmDbField);

  public

     Property Idnoperfilxativo: TCmDbField read FIdnoperfilxativo write SetIdnoperfilxativo;
     Property Idnoperfilcota: TCmDbField read FIdnoperfilcota write SetIdnoperfilcota;
     Property Idativocota: TCmDbField read FIdativocota write SetIdativocota;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbNoperfilxativo }

constructor TDbNoperfilxativo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NOPERFILXATIVO';

   fIdnoperfilxativo := CreateCmDbField('IDNOPERFILXATIVO',ftfloat,True,True,False,True,'');
   fIdnoperfilcota := CreateCmDbField('IDNOPERFILCOTA',ftfloat,False,False,False,True,'');
   fIdativocota := CreateCmDbField('IDATIVOCOTA',ftfloat,False,False,False,True,'');
end;

function TDbNoperfilxativo.Insert: Boolean;
begin

   fIdnoperfilxativo.AsFloat := GetSequence('NOPERFILXATIVO');
   Result := Inherited Insert;

end;


procedure TDbNoperfilxativo.SetIdativocota(const Value: TCmDbField);
begin
  FIdativocota := Value;
end;

procedure TDbNoperfilxativo.SetIdnoperfilcota(const Value: TCmDbField);
begin
  FIdnoperfilcota := Value;
end;

procedure TDbNoperfilxativo.SetIdnoperfilxativo(const Value: TCmDbField);
begin
  FIdnoperfilxativo := Value;
end;

end.



