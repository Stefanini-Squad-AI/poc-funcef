{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 19/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbCampodepara;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCampodepara = class(TCmDbObject)

  private
    FIdtabeladepara: TCmDbField;
    FNomecampoconta: TCmDbField;
    FIdcampodepara: TCmDbField;
    procedure SetIdcampodepara(const Value: TCmDbField);
    procedure SetIdtabeladepara(const Value: TCmDbField);
    procedure SetNomecampoconta(const Value: TCmDbField);

  public

     Property Nomecampoconta: TCmDbField read FNomecampoconta write SetNomecampoconta;
     Property Idtabeladepara: TCmDbField read FIdtabeladepara write SetIdtabeladepara;
     Property Idcampodepara: TCmDbField read FIdcampodepara write SetIdcampodepara;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCampodepara }

constructor TDbCampodepara.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CAMPODEPARA';

   fNomecampoconta := CreateCmDbField('NOMECAMPOCONTA',ftString,False,False,False,True,'');
   fIdtabeladepara := CreateCmDbField('IDTABELADEPARA',ftfloat,False,False,False,True,'');
   fIdcampodepara := CreateCmDbField('IDCAMPODEPARA',ftfloat,True,True,False,True,'');
end;

function TDbCampodepara.Insert: Boolean;
begin

   fIdcampodepara.AsFloat := GetSequence('CAMPODEPARA');
   Result := Inherited Insert;

end;


procedure TDbCampodepara.SetIdcampodepara(const Value: TCmDbField);
begin
  FIdcampodepara := Value;
end;

procedure TDbCampodepara.SetIdtabeladepara(const Value: TCmDbField);
begin
  FIdtabeladepara := Value;
end;

procedure TDbCampodepara.SetNomecampoconta(const Value: TCmDbField);
begin
  FNomecampoconta := Value;
end;

end.



