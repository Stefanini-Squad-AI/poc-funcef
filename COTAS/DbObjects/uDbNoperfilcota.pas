unit uDbNoperfilcota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbNoperfilcota = class(TCmDbObject)

  private
    FIdperfilcota: TCmDbField;
    FDescricao: TCmDbField;
    FCodhierarquico: TCmDbField;
    FIdnoperfilcota: TCmDbField;
    procedure SetCodhierarquico(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdnoperfilcota(const Value: TCmDbField);
    procedure SetIdperfilcota(const Value: TCmDbField);

  public

     Property Idperfilcota: TCmDbField read FIdperfilcota write SetIdperfilcota;
     Property Idnoperfilcota: TCmDbField read FIdnoperfilcota write SetIdnoperfilcota;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codhierarquico: TCmDbField read FCodhierarquico write SetCodhierarquico;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbNoperfilcota }

constructor TDbNoperfilcota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'NOPERFILCOTA';

   fIdperfilcota := CreateCmDbField('IDPERFILCOTA',ftfloat,False,False,False,True,'');
   fIdnoperfilcota := CreateCmDbField('IDNOPERFILCOTA',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodhierarquico := CreateCmDbField('CODHIERARQUICO',ftString,False,False,False,True,'');
end;

function TDbNoperfilcota.Insert: Boolean;
begin

   fIdnoperfilcota.AsFloat := GetSequence('NOPERFILCOTA');
   Result := Inherited Insert;

end;


procedure TDbNoperfilcota.SetCodhierarquico(const Value: TCmDbField);
begin
  FCodhierarquico := Value;
end;

procedure TDbNoperfilcota.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbNoperfilcota.SetIdnoperfilcota(const Value: TCmDbField);
begin
  FIdnoperfilcota := Value;
end;

procedure TDbNoperfilcota.SetIdperfilcota(const Value: TCmDbField);
begin
  FIdperfilcota := Value;
end;

end.



