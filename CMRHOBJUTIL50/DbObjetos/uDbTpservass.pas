{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugenio Frioli                  }
{ Atualizado Em: 29/03/2004                             }
{                                                       }
{*******************************************************}

unit uDbTpservass;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbTpservass = class(TCmDbObject)

  private
    FNome: TCmDbField;
    FIdservass: TCmDbField;
    procedure SetIdservass(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idservass: TCmDbField read FIdservass write SetIdservass;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTpservass }

constructor TDbTpservass.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TPSERVASS';

   fNome := CreateCmDbField('NOME',ftString,False,False,False,True,'');
   fIdservass := CreateCmDbField('IDSERVASS',ftfloat,True,True,False,True,'');
end;

function TDbTpservass.Insert: Boolean;
begin

   fIdservass.AsFloat := GetSequence('TPSERVASS');
   Result := Inherited Insert;

end;


procedure TDbTpservass.SetIdservass(const Value: TCmDbField);
begin
  FIdservass := Value;
end;

procedure TDbTpservass.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.

