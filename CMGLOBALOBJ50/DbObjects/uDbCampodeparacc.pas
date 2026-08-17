{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2003                             }
{                                                       }
{*******************************************************}

unit uDbCampodeparacc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCampodeparacc = class(TCmDbObject)

  private
    FIdcampodeparacc: TCmDbField;
    FNomecampo: TCmDbField;
    FIdtabeladeparacc: TCmDbField;
    procedure SetIdcampodeparacc(const Value: TCmDbField);
    procedure SetIdtabeladeparacc(const Value: TCmDbField);
    procedure SetNomecampo(const Value: TCmDbField);

  public

     Property Nomecampo: TCmDbField read FNomecampo write SetNomecampo;
     Property Idtabeladeparacc: TCmDbField read FIdtabeladeparacc write SetIdtabeladeparacc;
     Property Idcampodeparacc: TCmDbField read FIdcampodeparacc write SetIdcampodeparacc;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCampodeparacc }

constructor TDbCampodeparacc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAMPODEPARACC';

   fNomecampo := CreateCmDbField('NOMECAMPO',ftString,False,False,False,True,'');
   fIdtabeladeparacc := CreateCmDbField('IDTABELADEPARACC',ftfloat,True,False,False,True,'');
   fIdcampodeparacc := CreateCmDbField('IDCAMPODEPARACC',ftfloat,True,False,False,True,'');
end;

function TDbCampodeparacc.Insert: Boolean;
begin
   fIdcampodeparacc.AsFloat := GetSequence('CAMPODEPARACC');
   Result := Inherited Insert;
end;


procedure TDbCampodeparacc.SetIdcampodeparacc(const Value: TCmDbField);
begin
  FIdcampodeparacc := Value;
end;

procedure TDbCampodeparacc.SetIdtabeladeparacc(const Value: TCmDbField);
begin
  FIdtabeladeparacc := Value;
end;

procedure TDbCampodeparacc.SetNomecampo(const Value: TCmDbField);
begin
  FNomecampo := Value;
end;

end.



