unit uDbCampodeparaCC;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCampodeparaCC = class(TCmDbObject)

  private
    FIdtabeladepara: TCmDbField;
    FNomecampo: TCmDbField;
    FIdcampodepara: TCmDbField;
    procedure SetIdcampodepara(const Value: TCmDbField);
    procedure SetIdtabeladepara(const Value: TCmDbField);
    procedure SetNomecampo(const Value: TCmDbField);

  public

     Property Nomecampo: TCmDbField read FNomecampo write SetNomecampo;
     Property Idtabeladepara: TCmDbField read FIdtabeladepara write SetIdtabeladepara;
     Property Idcampodepara: TCmDbField read FIdcampodepara write SetIdcampodepara;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCampodepara }



constructor TDbCampodeparaCC.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAMPODEPARACC';

   fNomecampo      := CreateCmDbField('NOMECAMPO',ftString,False,False,False,True,'');
   fIdtabeladepara := CreateCmDbField('IDTABELADEPARACC',ftfloat,False,False,False,True,'');
   fIdcampodepara  := CreateCmDbField('IDCAMPODEPARACC',ftfloat,True,True,False,True,'');
end;



function TDbCampodeparaCC.Insert: Boolean;
begin

   fIdcampodepara.AsFloat := GetSequence('CAMPODEPARACC');
   Result := Inherited Insert;

end;



procedure TDbCampodeparaCC.SetIdcampodepara(const Value: TCmDbField);
begin
  FIdcampodepara := Value;
end;



procedure TDbCampodeparaCC.SetIdtabeladepara(const Value: TCmDbField);
begin
  FIdtabeladepara := Value;
end;



procedure TDbCampodeparaCC.SetNomecampo(const Value: TCmDbField);
begin
  FNomecampo := Value;
end;



end.



