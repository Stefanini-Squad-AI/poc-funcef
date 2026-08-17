unit uDbCampodeparaCR;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCampodeparaCR = class(TCmDbObject)

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



constructor TDbCampodeparaCR.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAMPODEPARACR';

   fNomecampo      := CreateCmDbField('NOMECAMPO',ftString,False,False,False,True,'');
   fIdtabeladepara := CreateCmDbField('IDTABELADEPARACR',ftfloat,False,False,False,True,'');
   fIdcampodepara  := CreateCmDbField('IDCAMPODEPARACR',ftfloat,True,True,False,True,'');
end;



function TDbCampodeparaCR.Insert: Boolean;
begin

   fIdcampodepara.AsFloat := GetSequence('CAMPODEPARACR');
   Result := Inherited Insert;

end;



procedure TDbCampodeparaCR.SetIdcampodepara(const Value: TCmDbField);
begin
  FIdcampodepara := Value;
end;



procedure TDbCampodeparaCR.SetIdtabeladepara(const Value: TCmDbField);
begin
  FIdtabeladepara := Value;
end;



procedure TDbCampodeparaCR.SetNomecampo(const Value: TCmDbField);
begin
  FNomecampo := Value;
end;



end.



