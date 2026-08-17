{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/10/2003                             }
{                                                       }
{*******************************************************}

unit uDbDeparacc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDeparacc = class(TCmDbObject)

  private
    FCodccfim: TCmDbField;
    FIdempresaprop: TCmDbField;
    FIdplanccini: TCmDbField;
    FIdplanccfim: TCmDbField;
    FIddeparacc: TCmDbField;
    FCodccini: TCmDbField;
    procedure SetCodccfim(const Value: TCmDbField);
    procedure SetCodccini(const Value: TCmDbField);
    procedure SetIddeparacc(const Value: TCmDbField);
    procedure SetIdempresaprop(const Value: TCmDbField);
    procedure SetIdplanccfim(const Value: TCmDbField);
    procedure SetIdplanccini(const Value: TCmDbField);

  public

     Property Idplanccini: TCmDbField read FIdplanccini write SetIdplanccini;
     Property Idplanccfim: TCmDbField read FIdplanccfim write SetIdplanccfim;
     Property Idempresaprop: TCmDbField read FIdempresaprop write SetIdempresaprop;
     Property Iddeparacc: TCmDbField read FIddeparacc write SetIddeparacc;
     Property Codccini: TCmDbField read FCodccini write SetCodccini;
     Property Codccfim: TCmDbField read FCodccfim write SetCodccfim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbDeparacc }

constructor TDbDeparacc.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'DEPARACC';

   fIdplanccini := CreateCmDbField('IDPLANCCINI',ftfloat,False,False,False,True,'');
   fIdplanccfim := CreateCmDbField('IDPLANCCFIM',ftfloat,False,False,False,True,'');
   fIdempresaprop := CreateCmDbField('IDEMPRESAPROP',ftfloat,False,False,False,True,'');
   fIddeparacc := CreateCmDbField('IDDEPARACC',ftfloat,True,False,False,True,'');
   fCodccini := CreateCmDbField('CODCCINI',ftString,False,False,False,True,'');
   fCodccfim := CreateCmDbField('CODCCFIM',ftString,False,False,False,True,'');
end;

function TDbDeparacc.Insert: Boolean;
begin
   fIddeparacc.AsFloat := GetSequence('DEPARACC');
   Result := Inherited Insert;
end;

procedure TDbDeparacc.SetCodccfim(const Value: TCmDbField);
begin
  FCodccfim := Value;
end;

procedure TDbDeparacc.SetCodccini(const Value: TCmDbField);
begin
  FCodccini := Value;
end;

procedure TDbDeparacc.SetIddeparacc(const Value: TCmDbField);
begin
  FIddeparacc := Value;
end;

procedure TDbDeparacc.SetIdempresaprop(const Value: TCmDbField);
begin
  FIdempresaprop := Value;
end;

procedure TDbDeparacc.SetIdplanccfim(const Value: TCmDbField);
begin
  FIdplanccfim := Value;
end;

procedure TDbDeparacc.SetIdplanccini(const Value: TCmDbField);
begin
  FIdplanccini := Value;
end;

end.



