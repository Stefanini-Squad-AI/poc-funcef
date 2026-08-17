{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2003                             }
{                                                       }
{*******************************************************}

unit uDbCampodeparacr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCampodeparacr = class(TCmDbObject)

  private
    FIdtabeladeparacr: TCmDbField;
    FNomecampo: TCmDbField;
    FIdcampodeparacr: TCmDbField;
    procedure SetIdcampodeparacr(const Value: TCmDbField);
    procedure SetIdtabeladeparacr(const Value: TCmDbField);
    procedure SetNomecampo(const Value: TCmDbField);

  public

     Property Nomecampo: TCmDbField read FNomecampo write SetNomecampo;
     Property Idtabeladeparacr: TCmDbField read FIdtabeladeparacr write SetIdtabeladeparacr;
     Property Idcampodeparacr: TCmDbField read FIdcampodeparacr write SetIdcampodeparacr;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCampodeparacr }

constructor TDbCampodeparacr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAMPODEPARACR';

   fNomecampo := CreateCmDbField('NOMECAMPO',ftString,False,False,False,True,'');
   fIdtabeladeparacr := CreateCmDbField('IDTABELADEPARACR',ftfloat,True,False,False,True,'');
   fIdcampodeparacr := CreateCmDbField('IDCAMPODEPARACR',ftfloat,True,False,False,True,'');
end;

function TDbCampodeparacr.Insert: Boolean;
begin
   fIdcampodeparacr.AsFloat := GetSequence('CAMPODEPARACR');
   Result := Inherited Insert;
end;


procedure TDbCampodeparacr.SetIdcampodeparacr(const Value: TCmDbField);
begin
  FIdcampodeparacr := Value;
end;

procedure TDbCampodeparacr.SetIdtabeladeparacr(const Value: TCmDbField);
begin
  FIdtabeladeparacr := Value;
end;

procedure TDbCampodeparacr.SetNomecampo(const Value: TCmDbField);
begin
  FNomecampo := Value;
end;

end.



