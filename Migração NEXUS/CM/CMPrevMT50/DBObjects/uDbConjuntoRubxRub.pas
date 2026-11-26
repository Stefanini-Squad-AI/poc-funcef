{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/12/2005                             }
{                                                       }
{*******************************************************}

unit uDbConjuntorubxrub;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConjuntorubxrub = class(TCmDbObject)

  private
    FIdrubrica: TCmDbField;
    FIdconjuntorubrica: TCmDbField;
    procedure SetIdconjuntorubrica(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);

  public

     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idconjuntorubrica: TCmDbField read FIdconjuntorubrica write SetIdconjuntorubrica;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConjuntorubxrub }

constructor TDbConjuntorubxrub.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONJUNTORUBXRUB';

   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,True,False,True,'');
   fIdconjuntorubrica := CreateCmDbField('IDCONJUNTORUBRICA',ftfloat,True,True,False,True,'');
end;

function TDbConjuntorubxrub.Insert: Boolean;
begin

   fIdrubrica.AsFloat := GetSequence('CONJUNTORUBXRUB');
   fIdconjuntorubrica.AsFloat := GetSequence('CONJUNTORUBXRUB');
   Result := Inherited Insert;

end;


procedure TDbConjuntorubxrub.SetIdconjuntorubrica(const Value: TCmDbField);
begin
  FIdconjuntorubrica := Value;
end;

procedure TDbConjuntorubxrub.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

end.



