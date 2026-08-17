unit uDbCotatipooper;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCotatipooper = class(TCmDbObject)

  private
    FRecdes: TCmDbField;
    FFlgcota: TCmDbField;
    FIdcotatipooper: TCmDbField;
    FDesctipooper: TCmDbField;
    procedure SetDesctipooper(const Value: TCmDbField);
    procedure SetFlgcota(const Value: TCmDbField);
    procedure SetIdcotatipooper(const Value: TCmDbField);
    procedure SetRecdes(const Value: TCmDbField);

  public

     Property Recdes: TCmDbField read FRecdes write SetRecdes;
     Property Idcotatipooper: TCmDbField read FIdcotatipooper write SetIdcotatipooper;
     Property Flgcota: TCmDbField read FFlgcota write SetFlgcota;
     Property Desctipooper: TCmDbField read FDesctipooper write SetDesctipooper;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;



implementation

{ TDbCotatipooper }

constructor TDbCotatipooper.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTATIPOOPER';

   fRecdes := CreateCmDbField('RECDES',ftString,False,False,False,True,'');
   fIdcotatipooper := CreateCmDbField('IDCOTATIPOOPER',ftfloat,True,True,False,True,'');
   fFlgcota := CreateCmDbField('FLGCOTA',ftString,False,False,False,True,'');
   fDesctipooper := CreateCmDbField('DESCTIPOOPER',ftString,False,False,False,True,'');
end;



function TDbCotatipooper.Insert: Boolean;
begin

   fIdcotatipooper.AsFloat := GetSequence('COTATIPOOPER');
   Result := Inherited Insert;

end;




procedure TDbCotatipooper.SetDesctipooper(const Value: TCmDbField);
begin
  FDesctipooper := Value;
end;



procedure TDbCotatipooper.SetFlgcota(const Value: TCmDbField);
begin
  FFlgcota := Value;
end;



procedure TDbCotatipooper.SetIdcotatipooper(const Value: TCmDbField);
begin
  FIdcotatipooper := Value;
end;

procedure TDbCotatipooper.SetRecdes(const Value: TCmDbField);
begin
  FRecdes := Value;
end;

end.



